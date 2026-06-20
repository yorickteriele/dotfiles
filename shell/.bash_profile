#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

. "$HOME/.local/share/../bin/env"
. "$HOME/.cargo/env"

# Global .NET tools, including dotnet-ef. SDKs are supplied by Arch packages.
export PATH="$HOME/.dotnet/tools:$PATH"


# Added by Toolbox App
export PATH="$PATH:/home/yorick/.local/share/JetBrains/Toolbox/scripts"



# Added by Antigravity CLI installer
export PATH="/home/yorick/.local/bin:$PATH"
