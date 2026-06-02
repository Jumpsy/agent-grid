#!/usr/bin/env bash
# agent-grid installer — run all your AI coding agents in one terminal, talking to each other.
#   curl -fsSL https://raw.githubusercontent.com/Jumpsy/agent-grid/main/install.sh | bash
set -e
REPO_URL="https://github.com/Jumpsy/agent-grid"
GRID_HOME="$HOME/.agent-grid"
OS="$(uname -s)"
say(){ printf '\033[1;36m▸ %s\033[0m\n' "$*"; }

# 1) prerequisites
say "Installing prerequisites (git, tmux, node)…"
if [ "$OS" = Darwin ]; then
  command -v brew >/dev/null || { echo "Homebrew required: https://brew.sh"; exit 1; }
  for p in git tmux node; do command -v "$p" >/dev/null || brew install "$p"; done
else
  SUDO=""; [ "$(id -u)" != 0 ] && SUDO="sudo"
  $SUDO apt-get update -qq || true
  $SUDO apt-get install -y -qq git tmux curl ca-certificates >/dev/null 2>&1 || true
  command -v node >/dev/null || { curl -fsSL https://deb.nodesource.com/setup_22.x | $SUDO bash - >/dev/null 2>&1; $SUDO apt-get install -y -qq nodejs >/dev/null 2>&1; }
fi

# 2) fetch the repo
say "Fetching agent-grid…"
if [ -d "$GRID_HOME/.git" ]; then git -C "$GRID_HOME" pull -q || true
else rm -rf "$GRID_HOME"; git clone -q "$REPO_URL" "$GRID_HOME"; fi
chmod +x "$GRID_HOME"/bin/* 2>/dev/null || true

# 3) PATH + tmux config
case ":$PATH:" in *":$GRID_HOME/bin:"*) ;; *)
  for rc in "$HOME/.bashrc" "$HOME/.zshrc"; do
    [ -f "$rc" ] && ! grep -q 'agent-grid/bin' "$rc" && echo 'export PATH="$HOME/.agent-grid/bin:$PATH"' >> "$rc"
  done ;;
esac
export PATH="$GRID_HOME/bin:$PATH"
grep -q 'agent-grid/tmux-grid.conf' "$HOME/.tmux.conf" 2>/dev/null || echo "source-file $GRID_HOME/tmux-grid.conf" >> "$HOME/.tmux.conf"

# 4) agent CLIs (installs what's missing; skip any you don't want by editing this list)
say "Installing agent CLIs (skip ones you don't use after install)…"
command -v claude   >/dev/null || npm install -g @anthropic-ai/claude-code >/dev/null 2>&1 || true
command -v codex    >/dev/null || npm install -g @openai/codex             >/dev/null 2>&1 || true
command -v gemini   >/dev/null || npm install -g @google/gemini-cli        >/dev/null 2>&1 || true
command -v opencode >/dev/null || npm install -g opencode-ai               >/dev/null 2>&1 || true
command -v agy      >/dev/null || { curl -fsSL https://antigravity.google/cli/install.sh | bash >/dev/null 2>&1 || true; }

say "Done!"
echo
echo "  1. Log into whichever agents you have:  run each (claude, codex, gemini, opencode, agy) once and sign in."
echo "  2. Start your grid:   grid"
echo "  3. (VPS only) share it as a web terminal:   grid serve"
echo
echo "  (open a new shell, or run:  export PATH=\"\$HOME/.agent-grid/bin:\$PATH\" )"
