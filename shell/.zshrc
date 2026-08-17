
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
