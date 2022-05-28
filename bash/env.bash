#
# provides env variables to ~/.bashrc
#

# from .profile
export EDITOR=/usr/bin/nano
export QT_QPA_PLATFORMTHEME="qt5ct"
export QT_AUTO_SCREEN_SCALE_FACTOR=0

# configs
export STARSHIP_CONFIG="${HOME}/.config/starship/starship.toml"
export CARGO_HOME="${HOME}/.local/share/cargo"
export CUDA_CACHE_PATH="${HOME}/.cache/nv"
export GPODDER_HOME="${DATALAKE}/gpodder"
export GPODDER_DOWNLOAD_DIR="${GPODDER_HOME}/Downloads"
export GRADLE_USER_HOME="${HOME}/.local/share/gradle"
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="${HOME}/.config/java"
export KERAS_HOME="${HOME}/.cache/keras"
export NPM_CONFIG_USERCONFIG="${HOME}/.config/npm/npmrc"
export NVM_DIR="${HOME}/.local/share/nvm"
export PSQLRC="${HOME}/.config/psql/psqlrc"
export PSQL_HISTORY="${HOME}/.cache/psql_history"
export PGPASSFILE="${HOME}/.config/psql/pgpass"
export PGSERVICEFILE="${HOME}/.config/psql/pg_service.conf"
export PYENV_ROOT="${HOME}/.local/share/pyenv"
export PYTHONSTARTUP="${HOME}/.config/python/pythonrc"
export R_ENVIRON_USER="${HOME}/.config/r/Renviron"
export RUSTUP_HOME="${HOME}/.local/share/rustup"
export TEXMFHOME="${HOME}/latex"
export TEXMFVAR="${HOME}/.cache/texlive/texmf-var"
export TEXMFCONFIG="${HOME}/.config/texlive/texmf-config"
export WGETRC="${HOME}/.config/wgetrc"

# wine prefixes
export WINEPREFIX="${HOME}/.local/share/wineprefixes"
export WINEDLLOVERRIDES="mshtml=d"

# Java GUI uses a hard-coded list of non-re-parenting window managers, and bspwm is not in that list. So forcing this.
export _JAVA_AWT_WM_NONREPARENTING=1