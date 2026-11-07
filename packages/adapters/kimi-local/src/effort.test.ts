import { describe, expect, it } from "vitest";
import { modelSupportsEffort, selectKimiThinkingEffort } from "./index.js";

const housekeeping = {
  issue_commented: "low",
  issue_monitor_due: "low",
  execution_review_requested: "low",
  issue_blockers_resolved: "low",
  issue_assignment_recovery: "low",
};

describe("selectKimiThinkingEffort", () => {
  it("uses effortByWakeReason for a matching wake reason over adapterConfig.effort", () => {
    const agentConfig = { effort: "high", effortByWakeReason: housekeeping };
    expect(selectKimiThinkingEffort({ config: agentConfig, agentConfig, wakeReason: "issue_commented" }))
      .toEqual({ effort: "low", source: "wake_reason" });
  });

  it("falls back to adapterConfig.effort when the wake reason has no entry", () => {
    const agentConfig = { effort: "high", effortByWakeReason: housekeeping };
    expect(selectKimiThinkingEffort({ config: agentConfig, agentConfig, wakeReason: "issue_assigned" }))
      .toEqual({ effort: "high", source: "config" });
  });

  it("falls back to adapterConfig.effort when there is no wake reason", () => {
    const agentConfig = { effort: "max", effortByWakeReason: housekeeping };
    expect(selectKimiThinkingEffort({ config: agentConfig, agentConfig, wakeReason: null }))
      .toEqual({ effort: "max", source: "config" });
  });

  it("lets a per-issue effort override beat effortByWakeReason", () => {
    const agentConfig = { effort: "high", effortByWakeReason: housekeeping };
    // The server shallow-merges assigneeAdapterOverrides.adapterConfig into config.
    const config = { ...agentConfig, effort: "max" };
    expect(selectKimiThinkingEffort({ config, agentConfig, wakeReason: "issue_commented" }))
      .toEqual({ effort: "max", source: "issue_override" });
  });

  it("treats a per-issue effort as an override when the agent has no effort of its own", () => {
    const agentConfig = { effortByWakeReason: housekeeping };
    const config = { ...agentConfig, effort: "high" };
    expect(selectKimiThinkingEffort({ config, agentConfig, wakeReason: "issue_monitor_due" }))
      .toEqual({ effort: "high", source: "issue_override" });
  });

  it("uses a per-issue effortByWakeReason map when the override replaces it", () => {
    const agentConfig = { effort: "high", effortByWakeReason: housekeeping };
    const config = { ...agentConfig, effortByWakeReason: { issue_commented: "max" } };
    expect(selectKimiThinkingEffort({ config, agentConfig, wakeReason: "issue_commented" }))
      .toEqual({ effort: "max", source: "wake_reason" });
  });

  it("maps medium onto high at every level", () => {
    const agentConfig = { effort: "medium", effortByWakeReason: { issue_commented: "medium" } };
    expect(selectKimiThinkingEffort({ config: agentConfig, agentConfig, wakeReason: "issue_commented" }))
      .toEqual({ effort: "high", source: "wake_reason" });
  });

  it("skips an unsupported wake-reason value and falls through to adapterConfig.effort", () => {
    const agentConfig = { effort: "high", effortByWakeReason: { issue_commented: "turbo" } };
    expect(selectKimiThinkingEffort({ config: agentConfig, agentConfig, wakeReason: "issue_commented" }))
      .toEqual({ effort: "high", source: "config" });
  });

  it("skips an unsupported per-issue value and falls through to effortByWakeReason", () => {
    const agentConfig = { effort: "high", effortByWakeReason: housekeeping };
    const config = { ...agentConfig, effort: "turbo" };
    expect(selectKimiThinkingEffort({ config, agentConfig, wakeReason: "issue_commented" }))
      .toEqual({ effort: "low", source: "wake_reason" });
  });

  it("ignores a malformed effortByWakeReason", () => {
    for (const effortByWakeReason of ["low", ["low"], null, 3]) {
      const agentConfig = { effort: "high", effortByWakeReason };
      expect(selectKimiThinkingEffort({ config: agentConfig, agentConfig, wakeReason: "issue_commented" }))
        .toEqual({ effort: "high", source: "config" });
    }
  });

  it("returns null when nothing is configured", () => {
    expect(selectKimiThinkingEffort({ config: {}, agentConfig: {}, wakeReason: "issue_commented" })).toBeNull();
  });
});

describe("modelSupportsEffort", () => {
  it.each(["kimi-code/k3.1-pro", "kimi-code/k3.1-pro-highspeed"])("treats %s as effort-capable", (model) => {
    expect(modelSupportsEffort(model)).toBe(true);
  });
});
