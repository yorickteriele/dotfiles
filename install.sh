#!/bin/sh

cd "$(dirname "$0")"

# Create neovim stow structure with symlinks to YorVim
if [ -d "YorVim" ]; then
    mkdir -p neovim/.config/nvim
    stow -t neovim/.config/nvim YorVim
fi

for config in neovim hypr; do
    target="$HOME/.config/${config}"
    [ -d "$target" ] && [ ! -L "$target" ] && rm -rf "$target"
    stow --adopt -t "$HOME" "$config"
done
