# Skill-signature fail-closed enforcement (ASI09, layer-b Step 1)

Runbook for `PAPERCLIP_SKILL_SIGNATURE_ENFORCE` — internal, owner-gated per
ADR-0048 Exclusions #2 (permission/auth-surface) and #4 (foundation). Not for
upstream `paperclipai/paperclip`; this only applies to instances that ship
signed `company_managed` skill roots (SOL-3186).

## What this flag does

Paperclip's harness loader has shelled out to `cosign verify-blob` against a
signed `company_managed` skills root (`solved-org/skills/`, or any tree with a
`.signatures/MANIFEST.sha256` + `.signatures/MANIFEST.sha256.cosign.bundle`)
since SOL-3190 (layer-b Step 0) — telemetry only, logged as
`signatureState`/`signatureDetail` on each `AdapterSkillEntry`, never blocking.

Setting `PAPERCLIP_SKILL_SIGNATURE_ENFORCE=1` (or `=true`) turns that
telemetry into a fail-closed gate:

- A signed root (has `.signatures/` manifest + bundle) that does **not**
  verify — no `cosign` binary on PATH, tree drift, or a bad signature — gets
  every skill under it refused: `materializePaperclipSkillCopy` and
  `ensurePaperclipSkillSymlink` skip the copy/symlink entirely (no partial
  writes), the skill's `AdapterSkillEntry.state` becomes `"blocked_unsigned"`,
  and `AdapterSkillSnapshot.warnings` gets an explanatory line.
- Everything else is unaffected. Bundled Paperclip skills and ad-hoc
  `user_installed` skills have no `.signatures/` manifest and are never
  blocked, flag on or off. A session with one blocked skill keeps running
  with its other skills — this only ever drops the one skill, never the
  session.
- Default is **OFF**. With the flag unset (or any value other than `1`/
  `true`), behavior is byte-for-byte the SOL-3190 telemetry-only path.

Implementation: `packages/adapter-utils/src/server-utils.ts` (search
`SOL-3191`); consumed by the ACPX runtimes (`packages/adapters/acpx-local/src/server/execute.ts`)
and persistent-adapter skill sync (`packages/adapters/*/src/server/skills.ts`).

## Prerequisite: cosign on the harness host

Enforcement will fail-closed on **every** signed root if `cosign` is not on
`PATH` where the harness process runs `scripts/skills-sign/verify.sh` — that
looks identical to real drift/tampering (`state: "unavailable"`) from this
loader's point of view. Provisioning `cosign` on prod harness hosts (adapting
`install-cosign.sh`) is a separate owner-tracked dependency and **must** land
first. Do not flip this flag on a host without confirming:

```sh
which cosign && cosign version
```

## Enabling (per host / per company)

There is no per-company config path implemented yet — this is a single
process-wide environment variable, consistent with how this codebase reads
every other `PAPERCLIP_*` flag (see `packages/adapter-utils/src/server-utils.ts`,
e.g. `PAPERCLIP_LISTEN_HOST`/`PAPERCLIP_API_URL`). Set it in the harness
process's environment (Coolify env var, systemd unit, or shell) and restart:

```sh
PAPERCLIP_SKILL_SIGNATURE_ENFORCE=1
```

**This is an owner-gated production change** (ADR-0048 Exclusions #2/#4,
changes what every agent launches with). Do not enable in prod without a
fresh owner sign-off referencing this runbook — the 2026-09-12 owner-accept
(interaction `c9a1a455` on SOL-3190) authorized *building* Step 1 behind
default-OFF, not flipping it on. Turning the flag on in prod is explicitly
called out in SOL-3191 as "a separate future owner decision."

## Verifying before enabling anywhere real

1. Confirm `cosign` is provisioned (see above) on every harness host the
   config change would reach.
2. Enable on a single non-prod host or workspace first. Trigger a session
   for an adapter that syncs `company_managed` skills (e.g. `cursor-local`,
   any ACPX runtime) and confirm in logs / `AdapterSkillSnapshot`:
   - A healthy signed root still shows `signatureState: "verified"` and
     normal `state` (`installed`/`available`) — enforcement must not touch
     a passing verification.
   - Deliberately break the signed root (e.g. touch a file so the fingerprint
     drifts without re-signing) and confirm the skill flips to
     `state: "blocked_unsigned"`, a warning appears, and the session
     continues without that skill (check onLog stderr lines tagged
     `ASI09/SOL-3191 fail-closed enforcement`).
3. Only after that, take it to CTO/owner for the prod decision.

## Rolling back

Unset the env var (or set it to anything other than `1`/`true`) and restart
the harness process. There is no persisted state to clean up — `blocked_unsigned`
is derived live from the current verification result on every sync, not
written anywhere durable.

## What Step 2 is (not in scope here)

Making enforcement **default-on** fleet-wide is a distinct future owner
decision, gated on the Step-0 telemetry (SOL-3190) showing acceptable
verified/invalid/unavailable rates across the fleet first. Not started.
