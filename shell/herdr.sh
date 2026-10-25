# herdr — per-repository persistent sessions. Sourced from .bashrc and .zshrc.
#
# Bare `herdr` attaches to (or creates) a session named after the current Git
# repository, so `cd Aresis && herdr` restores Aresis's own agents and layout.
# Any arguments, or an explicit HERDR_SESSION, pass straight through untouched.
#
# Session identity is the absolute Git root (physical path); outside a repo it
# is the current directory. The name is "<folder>-<hash of full path>", so two
# repos with the same folder name still get separate sessions. Names stay short
# because Herdr puts a socket at ~/.config/herdr/sessions/<name>/herdr.sock and
# Unix socket paths are capped at ~108 bytes.

__herdr_session_name() {
  local root base hash
  root=$(git rev-parse --show-toplevel 2>/dev/null) || root=$(pwd -P)
  base=$(printf '%s' "${root##*/}" | LC_ALL=C tr -c 'A-Za-z0-9._-' '_' | cut -c1-24)
  case "$base" in "" | . | ..) base=root ;; esac
  hash=$(printf '%s' "$root" | sha256sum | cut -c1-10)
  printf '%s-%s\n' "$base" "$hash"
}

herdr() {
  if [ "$#" -gt 0 ] || [ -n "${HERDR_SESSION:-}" ]; then
    command herdr "$@"
    return
  fi
  command herdr --session "$(__herdr_session_name)"
}
