# 🤖 agent-grid

**Run all your AI coding agents in one terminal — and let them talk to each other.**

Claude Code, Codex, Gemini, OpenCode, and Antigravity, side by side in a single tmux grid.
They share a workspace, prompt each other **live** (you watch it happen), review each
other's code, and auto-route tasks to whoever's best. Run it on your laptop, or on a VPS
and reach it from any browser.

```
┌── claude ──────────┬── codex ───────────┐
│ ❯ [opencode says]  │ ❯ build the API     │
│   build the login  │ ● Done. POST /login │
│ ● On it…           │   wired to Postgres │
├── opencode ────────┼── antigravity ──────┤
│ ❯ route "design    │ ❯ [claude says]     │
│   the landing page"│   design the hero   │
│ → routed to agy    │ ● Here's the layout │
└────────────────────┴─────────────────────┘
```

## Quick start

```bash
curl -fsSL https://raw.githubusercontent.com/Jumpsy/agent-grid/main/install.sh | bash
```

Then log into whichever agents you have, and:

```bash
grid          # launch your agent grid
```

That's it. The grid auto-detects which agent CLIs you've installed and lays them out —
use **the AIs you already pay for**, skip the rest.

### Or set it up with one Claude prompt

Paste this into Claude Code (locally or SSH'd into a VPS):

> Install agent-grid from https://github.com/Jumpsy/agent-grid by running its install.sh,
> then tell me how to log into each agent and start the grid.

## What makes it different

- **Agents prompt each other, live.** `ask claude "..."` *types* the prompt into Claude's
  real terminal — you watch it arrive, think, and reply. No hidden background calls.
- **Auto-routing.** `route "build a login API"` sends it to the strongest agent (backend→codex,
  design→antigravity, etc.). Agents also delegate to each other on their own.
- **Shared feed.** `convo` shows every prompt and reply across all agents in real time.
- **One channel to you.** Agents register what they need with `need`; the lead asks you once.
- **Bring your own models.** OpenCode can run free OpenRouter models; everyone picks the
  right model per task.

## Commands (available in every agent + any shell)

| Command | Does |
|---|---|
| `grid` | launch / re-attach the grid |
| `grid serve` | expose it as a password-locked web terminal (VPS) |
| `ask <agent> "..."` | prompt one agent live, get its reply |
| `askall "..."` | prompt all agents at once |
| `route "<task>"` | auto-send a task to the best agent |
| `convo` / `convo -f` | watch the shared feed |
| `crossreview <file>` | all agents review & fix a file |
| `clearall` | reset every agent (also `Ctrl-b K`) |
| `cli-add` / `mcp-add` | install a CLI / MCP for all agents |

**tmux keys:** `Ctrl-b e` broadcast one prompt to all · `Ctrl-b z` zoom a pane · `Ctrl-b K` clear all.

## Run it anywhere

- **Laptop:** `grid` — local tmux, all your agents in one window.
- **VPS:** `grid serve` — gives you a public HTTPS URL (via Cloudflare tunnel, no firewall
  changes) protected by a password, so you reach your agents from any computer's browser.

## Supported agents

| Agent | Install | Best at |
|---|---|---|
| [Claude Code](https://github.com/anthropics/claude-code) | `npm i -g @anthropic-ai/claude-code` | generalist / architect |
| [Codex](https://github.com/openai/codex) | `npm i -g @openai/codex` | backend / systems |
| [Gemini CLI](https://github.com/google-gemini/gemini-cli) | `npm i -g @google/gemini-cli` | fast / large context |
| [OpenCode](https://github.com/sst/opencode) | `npm i -g opencode-ai` | any model, incl. free |
| [Antigravity](https://antigravity.google) | official installer | design / UI |

The installer sets all of them up; you only log into the ones you use.

## How it works

Each agent runs in its own tmux pane tagged with a `@agent` marker. `ask` finds the target
pane and uses `tmux send-keys` to type your message into its live TUI, then captures the
reply. A shared log records every exchange. No daemon, no API server — just tmux + small
shell scripts you can read in five minutes.

## Contributing

PRs welcome — especially new agents (add one line to `lib/registry.sh`). If this saved you
time, a ⭐ helps a lot.

## License

MIT
