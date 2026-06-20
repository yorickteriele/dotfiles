#!/bin/bash

cd "$(dirname "$0")" || exit 1

# Create neovim stow
if [ -d "YorVim" ]; then
  mkdir -p ~/.config/nvim/
  stow --adopt -t ~/.config/nvim YorVim
fi

stows=(
  "shell"
  "hypr"
  "waybar"
  "ghostty"
  "tmux"
  "sourcegit"
)

for config in "${stows[@]}"; do
  if [ "$config" == "sourcegit" ]; then
    target="$HOME/.sourcegit"
  else
    target="$HOME/.config/${config}"
  fi
  [ -d "$target" ] && [ ! -L "$target" ] && rm -rf "$target"
  stow --adopt -t "$HOME" "$config"
done

# Scripts — stowed directly to $HOME so .local/bin/ is included
stow --adopt -t "$HOME" bin

# Development tooling managed outside of mise.
./dotnet/install.sh
