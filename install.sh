#!/bin/sh

cd "$(dirname "$0")"

# Create neovim stow
if [ -d "YorVim" ]; then
  mkdir ~/.config/nvim/
  stow --adopt -t ~/.config/nvim YorVim
fi

for config in hypr; do
  target="$HOME/.config/${config}"
  [ -d "$target" ] && [ ! -L "$target" ] && rm -rf "$target"
  stow --adopt -t "$HOME" "$config"
done
