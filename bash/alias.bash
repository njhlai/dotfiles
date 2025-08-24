#
# provides alias to ~/.bashrc
#

# confirm before overwriting something
alias cp='cp -i'

# rm verbosity and stupidity-checker
alias rm='rm -vI'

# human-readable sizes
alias df='df -Th'
alias free='free -h'

# lsd aliases
alias l='lsd'
alias la='l -A'
alias ll='la -l'
alias lt='la --tree'

# rysnc aliases
alias rsyncdry='rsync -avun -i --progress --stats --human-readable --out-format="[%t] %o:%i [%M] %n (%'\'''\''l)" --delete --filter=":- .gitignore"'
alias rsynclive='rsync -avu -i --progress --stats --human-readable --out-format="[%t] %o:%i [%M] %n (%'\'''\''l)" --delete --filter=":- .gitignore"'

# youtube-dl extract audio
alias ytxa='yt-dlp -x --audio-quality 0 --audio-format flac'

# aria2c bittorrent
alias aria2bt='aria2c --conf-path=${HOME}/.config/aria2/aria2.bittorrent'

# mpv as a music player
alias play='mpv --no-video --shuffle'

# misc
alias lg='git rev-parse --show-toplevel 1> /dev/null && lazygit'
alias np='nano -w PKGBUILD'
alias soft='ssh ${SOFT_SERVER} -p ${SOFT_SERVER_PORT}'
