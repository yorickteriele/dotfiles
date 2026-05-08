# If not running interactively, don't do anything (leave this at the top of this file)
[[ $- != *i* ]] && return

# All the default Omarchy aliases and functions
# (don't mess with these directly, just overwrite them here!)
source ~/.local/share/omarchy/default/bash/rc

# Add your own exports, aliases, and functions here.
#
# Make an alias for invoking commands you use constantly
# alias p='python'
export PATH="$HOME/bin:$PATH"
alias run='~/bin/launch.sh'

. "$HOME/.local/share/../bin/env"
. "$HOME/.cargo/env"
alias gitbutler="WEBKIT_DISABLE_COMPOSITING_MODE=1 gitbutler-tauri"

export PATH="$PATH:$HOME/.dotnet/tools"

export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools
