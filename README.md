# dotfiles

## .NET

`install.sh` invokes `dotnet/install.sh`, which installs .NET SDK 10, 9, and
6 from the Arch repositories and installs the `dotnet-ef` 10.0.7 global tool.
The script removes mise's `dotnet` entry, shim, and SDK installation; mise
remains available for the other tools it manages. Global .NET tools are available through
`$HOME/.dotnet/tools` in Bash, Zsh, and login shells.
