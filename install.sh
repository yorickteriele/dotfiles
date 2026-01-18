#!/bin/sh

cd "$(dirname "$0")"

for config in neovim hypr; do
    target="$HOME/.config/${config}"
    [ -d "$target" ] && [ ! -L "$target" ] && rm -rf "$target"
    stow --adopt -t "$HOME" "$config"
done
