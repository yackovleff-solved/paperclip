import { describe, expect, it } from "vitest";
import { extractClaudeLineTokenDelta } from "./execute.js";

describe("extractClaudeLineTokenDelta", () => {
  it("sums cache-read input and output tokens off an assistant turn's usage", () => {
    const line = JSON.stringify({
      type: "assistant",
      message: {
        role: "assistant",
        content: [{ type: "text", text: "hi" }],
        usage: {
          input_tokens: 5,
          cache_creation_input_tokens: 10,
          cache_read_input_tokens: 120_000,
          output_tokens: 300,
        },
      },
    });

    expect(extractClaudeLineTokenDelta(line)).toBe(120_300);
  });

  it("ignores non-assistant events (system init, result)", () => {
    expect(
      extractClaudeLineTokenDelta(
        JSON.stringify({ type: "system", subtype: "init", session_id: "s1" }),
      ),
    ).toBeNull();
    expect(
      extractClaudeLineTokenDelta(
        JSON.stringify({
          type: "result",
          result: "done",
          usage: { input_tokens: 1, cache_read_input_tokens: 999_999, output_tokens: 1 },
        }),
      ),
    ).toBeNull();
  });

  it("returns null for an assistant event with no usage field", () => {
    expect(
      extractClaudeLineTokenDelta(
        JSON.stringify({ type: "assistant", message: { content: [{ type: "text", text: "hi" }] } }),
      ),
    ).toBeNull();
  });

  it("returns null for a zero-usage assistant event instead of a spurious zero delta", () => {
    expect(
      extractClaudeLineTokenDelta(
        JSON.stringify({
          type: "assistant",
          message: { usage: { input_tokens: 0, cache_read_input_tokens: 0, output_tokens: 0 } },
        }),
      ),
    ).toBeNull();
  });

  it("returns null for malformed JSON instead of throwing", () => {
    expect(extractClaudeLineTokenDelta("not json")).toBeNull();
  });

  it("returns null for an empty line", () => {
    expect(extractClaudeLineTokenDelta("")).toBeNull();
  });
});
