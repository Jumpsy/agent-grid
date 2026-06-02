#!/usr/bin/env bash
# Central registry of supported agents. Add yours here.
# name -> interactive launch command (auto-approve flags baked in)
agent_launch_cmd() {
  case "$1" in
    claude)   echo "claude --dangerously-skip-permissions" ;;
    codex)    echo "codex --dangerously-bypass-approvals-and-sandbox" ;;
    gemini)   echo "gemini --yolo" ;;
    opencode) echo "opencode" ;;
    agy)      echo "agy --dangerously-skip-permissions" ;;
    *)        echo "$1" ;;
  esac
}
agent_bin() { case "$1" in agy) echo agy ;; *) echo "$1" ;; esac; }
# which agents are actually installed, in preferred display order
detect_agents() {
  local all=(claude codex gemini opencode agy) a out=()
  for a in "${all[@]}"; do command -v "$(agent_bin "$a")" >/dev/null 2>&1 && out+=("$a"); done
  echo "${out[@]}"
}
export AGENT_SHARED="${AGENT_SHARED:-$HOME/.agent-grid/shared}"
