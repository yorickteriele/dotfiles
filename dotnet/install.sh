#!/usr/bin/env bash
set -euo pipefail

# Install the supported .NET SDK majors from the Arch repositories.  The
# unversioned package is the current SDK; the versioned packages retain the
# older SDKs needed by existing projects.
packages=(dotnet-sdk dotnet-sdk-9.0 dotnet-sdk-6.0)

if command -v yay >/dev/null 2>&1; then
  yay -S --noconfirm --needed "${packages[@]}"
elif command -v pacman >/dev/null 2>&1; then
  sudo pacman -S --noconfirm --needed "${packages[@]}"
else
  echo "No supported Arch package manager found (expected yay or pacman)." >&2
  exit 1
fi

# Leave mise available for other languages, but make /usr/bin/dotnet the only
# .NET SDK source. This also removes mise's dotnet shim from PATH.
if command -v mise >/dev/null 2>&1; then
  mise use --global --remove dotnet || true
  rm -f "$HOME/.local/share/mise/shims/dotnet"
  rm -rf "$HOME/.local/share/mise/installs/dotnet"
fi

# Keep the current Entity Framework CLI major and patch version reproducible.
if /usr/bin/dotnet tool list --global | awk 'NR > 2 { print $1 }' | grep -qx dotnet-ef; then
  /usr/bin/dotnet tool update --global dotnet-ef --version 10.0.7
else
  /usr/bin/dotnet tool install --global dotnet-ef --version 10.0.7
fi
