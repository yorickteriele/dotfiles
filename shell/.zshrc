
. "$HOME/.local/share/../bin/env"
# Global .NET tools, including dotnet-ef. SDKs are supplied by Arch packages.
export PATH="$HOME/.dotnet/tools:$PATH"

export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools


# Added by Antigravity CLI installer
export PATH="/home/yorick/.local/bin:$PATH"

# Claude Code — opt-in MCP servers, kept out of the default session so idle
# tool definitions don't eat context. Combine flags to stack multiple, e.g.
# claude --mcp-config "$CLAUDE_MCP_DIR/github.json" "$CLAUDE_MCP_DIR/cloudflare.json"
CLAUDE_MCP_DIR="$HOME/DEV/omarchy-supplement/dotfiles/claude/mcp"
alias claude-gh="claude --mcp-config \"$CLAUDE_MCP_DIR/github.json\""
alias claude-azure="claude --mcp-config \"$CLAUDE_MCP_DIR/azure.json\""
alias claude-cf="claude --mcp-config \"$CLAUDE_MCP_DIR/cloudflare.json\""
alias claude-dokploy="claude --mcp-config \"$CLAUDE_MCP_DIR/dokploy.json\"" # needs DOKPLOY_URL + DOKPLOY_API_KEY env vars

# claude-djurve — second (company) account, via CLAUDE_CONFIG_DIR pointed at
# ~/.claude-djurve. That dir is kept as symlinks into ~/.claude for everything
# except .credentials.json, so settings/CLAUDE.md/memory/projects stay shared
# and only the login/session is separate. Re-syncs new top-level entries on
# every call, so it self-heals if Claude Code adds files to ~/.claude later.
# First time: run `claude-djurve`, then `/login` with the company account.
claude-djurve() {
  local src="$HOME/.claude" dst="$HOME/.claude-djurve" entry name
  mkdir -p "$dst"
  for entry in "$src"/.[!.]* "$src"/*; do
    [ -e "$entry" ] || continue
    name=$(basename "$entry")
    [ "$name" = ".credentials.json" ] && continue
    if [ -e "$dst/$name" ] || [ -L "$dst/$name" ]; then
      continue
    fi
    ln -s "$entry" "$dst/$name"
  done
  CLAUDE_CONFIG_DIR="$dst" command claude "$@"
}

# herdr: one persistent session per Git repository (see herdr.sh)
source "$HOME/DEV/omarchy-supplement/dotfiles/shell/herdr.sh"
