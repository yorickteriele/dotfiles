# If not running interactively, don't do anything (leave this at the top of this file)
[[ $- != *i* ]] && return

# All the default Omarchy aliases and functions
# (don't mess with these directly, just overwrite them here!)
# /etc/omarchy.conf is written by omarchy-dev-link. When absent, force the
# package default instead of preserving a stale inherited dev-link value before
# we decide which rc file to source.
if [[ -f /etc/omarchy.conf ]]; then
  source /etc/omarchy.conf
  export OMARCHY_PATH="${OMARCHY_PATH:-/usr/share/omarchy}"
else
  export OMARCHY_PATH=/usr/share/omarchy
fi
source "$OMARCHY_PATH/default/bash/rc"

# Add your own exports, aliases, and functions here.
#
# Make an alias for invoking commands you use constantly
# alias p='python'
export PATH="$HOME/bin:$PATH"
alias run='~/bin/launch.sh'

. "$HOME/.local/share/../bin/env"
. "$HOME/.cargo/env"
alias gitbutler="WEBKIT_DISABLE_COMPOSITING_MODE=1 gitbutler-tauri"

# Global .NET tools, including dotnet-ef. SDKs are supplied by Arch packages.
export PATH="$HOME/.dotnet/tools:$PATH"

export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools


# Added by Antigravity CLI installer
export PATH="/home/yorick/.local/bin:$PATH"

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
