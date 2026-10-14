# Pi configuration

These are portable Pi preferences copied from `~/.pi/agent`.

## Files

- `settings.json`, `keybindings.json`, and `mcp.json`: preferences and service configuration.
- `models.json`: custom model/provider definitions with all `apiKey` fields removed. Configure credentials separately on each machine using Pi's auth/environment configuration.
- `extensions/`, `extensions_off/`, and `skills/`: personal extensions and skill files. `herdr-agent-state.ts` was not included because it is managed integration code.
- `AGENTS.md`: personal agent guidance.

## Install

Copy the desired files into `~/.pi/agent/`. Pi keybinding changes can be applied in an active session with `/reload`.

Authentication, tokens, and machine/session state are intentionally not tracked. Keep credentials in Pi's local auth/config files or environment variables, never in this directory.
