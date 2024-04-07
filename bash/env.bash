#
# provides env variables to ~/.bashrc
#

# configs
export ANSIBLE_GALAXY_CACHE_DIR="${HOME}/.cache/ansible/galaxy_cache"
export ANSIBLE_HOME="${HOME}/.config/ansible"
export ANSIBLE_SSH_CONTROL_PATH_DIR="${ANSIBLE_HOME}/cp"
export CARGO_HOME="${HOME}/.local/share/cargo"
export CUDA_CACHE_PATH="${HOME}/.cache/nv"
export DIFFPROG=difft
export DOWNLOAD="${HOME}/downloads"
export GDBHISTFILE="${HOME}/.local/state/gdb/history"
export GOCACHE="${HOME}/.cache/go/build"
export GOMODCACHE="${HOME}/.cache/go/mod"
export GOPATH="${HOME}/.local/share/go"
export GRADLE_USER_HOME="${HOME}/.local/share/gradle"
export GNUPGHOME="${HOME}/.local/share/gnupg"
export HISTFILE="${HOME}/.local/state/bash/history"
export ICEAUTHORITY="${HOME}/.cache/ICEauthority"
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="${HOME}/.config/java"
export KERAS_HOME="${HOME}/.cache/keras"
export NPM_CONFIG_USERCONFIG="${HOME}/.config/npm/npmrc"
export NVM_SYMLINK_CURRENT=true
export NVM_DIR="${HOME}/.local/share/nvm"
export PSQLRC="${HOME}/.config/psql/psqlrc"
export PSQL_HISTORY="${HOME}/.local/state/psql/history"
export PGPASSFILE="${HOME}/.config/psql/pgpass"
export PGSERVICEFILE="${HOME}/.config/psql/pg_service.conf"
export PYENV_ROOT="${HOME}/.local/share/pyenv"
export PYTHONSTARTUP="${HOME}/.config/python/pythonrc"
export R_ENVIRON_USER="${HOME}/.config/r/Renviron"
export RUSTUP_HOME="${HOME}/.local/share/rustup"
export SQLITE_HISTORY="${HOME}/.local/share/sqlite/sqlite_history"
export STARSHIP_CONFIG="${HOME}/.config/starship/starship.toml"
export TEXMFHOME="${DATALAKE}/latex"
export TEXMFVAR="${HOME}/.cache/texlive/texmf-var"
export TEXMFCONFIG="${HOME}/.config/texlive/texmf-config"
export WGETRC="${HOME}/.config/wget/wgetrc"

# wine prefixes
export WINEPREFIX="${HOME}/.local/share/wineprefixes"
export WINEDLLOVERRIDES="mshtml=d"

# Java GUI uses a hard-coded list of non-re-parenting window managers, and bspwm is not in that list. So forcing this.
export _JAVA_AWT_WM_NONREPARENTING=1
