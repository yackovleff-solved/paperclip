#!/usr/bin/env node
// Real, non-mocked headless `claude --print` invocation that proves a
// CLAUDE.md file placed exactly where `prepareClaudeConfigSeed` (see
// ../server/claude-config.ts) puts it is actually loaded by the native
// Claude Code CLI. Paperclip does not inject CLAUDE.md content itself — it
// relies entirely on the CLI's own file-discovery behavior, so an upstream
// change to that behavior (e.g. claude-code changelog 2.1.274, which removed
// per-directory CLAUDE.md lookup for headless/SDK sessions) would silently
// stop this from working. Run this before bumping the pinned claude-code
// version in Dockerfile / docker/untrusted-review/Dockerfile.
//
// Usage: pnpm exec tsx src/cli/smoke-claude-md.ts [--model <id>] [--json]

import { randomUUID } from "node:crypto";
import { mkdir, mkdtemp, rm, writeFile } from "node:fs/promises";
import os from "node:os";
import path from "node:path";
import { ensureCommandResolvable, runChildProcess } from "@paperclipai/adapter-utils/server-utils";

const DEFAULT_MODEL = "claude-haiku-4-5-20251001";

function parseArgs(argv: string[]) {
  const modelIndex = argv.indexOf("--model");
  return {
    model: modelIndex >= 0 ? argv[modelIndex + 1] : DEFAULT_MODEL,
    json: argv.includes("--json"),
  };
}

async function runSmoke(root: string, model: string, marker: string): Promise<Record<string, unknown>> {
  const claudeConfigDir = path.join(root, "claude-config");
  const projectDir = path.join(root, "project");
  await mkdir(claudeConfigDir, { recursive: true });
  await mkdir(projectDir, { recursive: true });

  // Mirrors prepareClaudeConfigSeed's output: a CLAUDE.md at the root of
  // CLAUDE_CONFIG_DIR. Paperclip's own injection stops there — everything
  // past this point is native CLI behavior.
  await writeFile(
    path.join(claudeConfigDir, "CLAUDE.md"),
    `# Paperclip smoke-test memory\n\nMARKER: ${marker}\n`,
    "utf8",
  );

  // Mirrors production exactly (see execute.ts): only CLAUDE_CONFIG_DIR is
  // overridden. Auth (OAuth token / API key) is left on the ambient HOME so
  // this smoke test exercises real credentials instead of breaking login.
  const env: Record<string, string> = {
    ...Object.fromEntries(
      Object.entries(process.env).filter(
        (entry): entry is [string, string] => typeof entry[1] === "string",
      ),
    ),
    CLAUDE_CONFIG_DIR: claudeConfigDir,
  };

  await ensureCommandResolvable("claude", projectDir, env);

  // Same shape as the real invocation in server/execute.ts: headless
  // print mode, prompt on stdin, stream-json output.
  const args = ["--print", "-", "--output-format", "stream-json", "--verbose", "--model", model];
  const prompt =
    'Reply with ONLY the exact value that follows "MARKER:" in your CLAUDE.md memory file. ' +
    "Output nothing else: no punctuation, no explanation.";

  const result = await runChildProcess("smoke-claude-md", "claude", args, {
    cwd: projectDir,
    env,
    timeoutSec: 60,
    graceSec: 5,
    stdin: prompt,
    onLog: async () => {},
  });

  const foundMarker = result.stdout.includes(marker);
  return {
    ok: foundMarker,
    marker,
    model,
    exitCode: result.exitCode,
    timedOut: result.timedOut,
    stdout: foundMarker ? undefined : result.stdout,
    stderr: foundMarker ? undefined : result.stderr,
  };
}

async function main() {
  const { model, json } = parseArgs(process.argv.slice(2));
  const marker = `PAPERCLIP-SMOKE-${randomUUID()}`;
  const root = await mkdtemp(path.join(os.tmpdir(), "paperclip-claude-md-smoke-"));

  let report: Record<string, unknown>;
  try {
    report = await runSmoke(root, model, marker);
  } finally {
    await rm(root, { recursive: true, force: true }).catch(() => undefined);
  }

  if (json) {
    console.log(JSON.stringify(report, null, 2));
  } else if (report.ok) {
    console.log(`OK: CLAUDE.md marker propagated to a headless "claude --print" session (model=${model}).`);
  } else {
    console.error(
      `FAIL: CLAUDE.md marker did NOT reach the headless "claude --print" session (model=${model}).\n` +
        "This is the exact regression class flagged in SOL-6300/SOL-6301 (claude-code changelog 2.1.274 " +
        "removed per-directory CLAUDE.md lookup for headless/SDK sessions).\n" +
        JSON.stringify(report, null, 2),
    );
  }

  if (!report.ok) process.exitCode = 1;
}

await main();
