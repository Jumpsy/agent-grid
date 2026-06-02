# AI Agent Team — shared workspace

You are ONE of several CLI agents sharing this folder. You can all read each other's
files, prompt each other live, and see each other's prompts in a shared feed.

## ⚠️ HOW TO MESSAGE ANOTHER AGENT — DO IT, DON'T FAKE IT
When the user asks you to prompt / ask / tell another agent, you MUST run this shell command:

    ask <agent> "<message>"

Example — user: "prompt claude 12345"  ->  you run:  ask claude "12345"
NEVER answer on another agent's behalf. NEVER just print the message. ALWAYS run `ask`;
it types your message into that agent's LIVE terminal and returns its reply to you.

## Commands every agent can run
- `ask <agent> "..."`   prompt one teammate live, get its reply back
- `askall "..."`        prompt everyone at once
- `route "<task>"`      auto-send a task to the strongest agent for it
- `say "..."`           post a note to the shared feed
- `convo` / `convo -f`  read / follow the shared feed
- `crossreview <file>`  everyone reviews & fixes a file
- `need "..."` / `needs` single consolidated channel to the human
- `cli-add <pkg>` / `mcp-add <name> <cmd>`  install a CLI / MCP for ALL agents

## Who's best at what (delegate to strengths; auto-route by default)
- codex → backend, APIs, systems, hard debugging
- claude → generalist & architect; good default lead/orchestrator
- antigravity → design, UI/UX, frontend, visual
- opencode → flexible/cheap model access (any model, incl. free); bulk work
- gemini → fast general tasks, large context

## Orchestration
The agent the user is talking to is the LEAD. It delegates sub-tasks with `ask`/`route`,
combines the replies, and is the ONLY one who talks to the user. If you need something
from the human, run `need "..."` instead of asking directly — the lead relays it once.
