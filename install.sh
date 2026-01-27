#!/bin/bash

cd "$(dirname "$0")" || exit 1

# Create neovim stow
if [ -d "YorVim" ]; then
  mkdir ~/.config/nvim/
  stow --adopt -t ~/.config/nvim YorVim
fi

echo hi

stows=(
  "hypr"
  "waybar"
  "ghostty"
)

for config in "${stows[@]}"; do
  target="$HOME/.config/${config}"
  [ -d "$target" ] && [ ! -L "$target" ] && rm -rf "$target"
  stow --adopt -t "$HOME" "$config"
done
