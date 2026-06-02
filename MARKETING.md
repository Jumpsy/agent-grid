# Launch kit

A demo GIF + these posts, fired the same morning (weekday ~8–10am ET), is how this gets traction.

## Show HN
**Title:** Show HN: Run Claude, Codex, Gemini and OpenCode in one terminal, talking to each other

**Body:**
I kept juggling separate terminal windows for Claude Code, Codex, Gemini and OpenCode, so I
put them in one tmux grid and gave them a way to prompt each other.

`ask claude "..."` literally types the prompt into Claude's real terminal — you watch it
arrive and answer. `route "build a login API"` auto-sends a task to whichever agent is best
at it. A shared feed (`convo`) shows every prompt and reply across all of them. They can
review each other's code and delegate, while only one of them talks to you.

Runs on your laptop, or `grid serve` on a VPS gives you a password-locked URL you can reach
from any browser. It's just tmux + small shell scripts — no daemon, readable in five minutes.

Repo: https://github.com/Jumpsy/agent-grid
Would love feedback, especially on the agent-to-agent protocol.

## X / Twitter thread
1/ I gave my AI coding agents one terminal — and made them talk to each other.
   Claude, Codex, Gemini, OpenCode, Antigravity, side by side. 🧵 [GIF]

2/ `ask claude "..."` types the prompt into Claude's actual terminal. You watch it land and
   reply in real time. No hidden API calls — the agents literally message each other.

3/ `route "build a REST API"` auto-sends it to the strongest agent (backend→Codex, design→
   Antigravity). They delegate to each other and only one talks to you.

4/ Runs locally, or on a VPS with a password-locked browser URL. One install command.
   It's just tmux + shell scripts. MIT. ⭐ github.com/Jumpsy/agent-grid

## Reddit
**r/LocalLLaMA / r/ChatGPTCoding** — title: "I put Claude, Codex, Gemini & OpenCode in one
terminal and let them prompt each other (open source)"

Body: short version of the Show HN, lead with the GIF, end with the repo link and a question
("what agent would you add?").

## Checklist
- [ ] Demo GIF at top of README (done)
- [ ] Post Show HN, reply to every comment for the first 2 hours
- [ ] X thread with the GIF
- [ ] Cross-post to r/LocalLLaMA + r/ChatGPTCoding
- [ ] Pin a "Supported agents — add yours in one line" issue to invite PRs
