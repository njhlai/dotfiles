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
alias la='l -a'
alias lt='la --tree'

# youtube-dl aliases
alias ytxa='youtube-dl -x --audio-quality 0 --audio-format flac'

# rysnc aliases
alias rsynclive='rsync -avu -i --progress --stats --out-format="%t %p %i %n %M %l" --delete --filter=":- .gitignore"'
alias rsyncdry='rsync -avun -i --progress --stats --out-format="%t %p %i %n %M %l" --delete --filter=":- .gitignore"'

# mpv as a music player
alias play='mpv --no-audio-display'

# misc
alias np='nano -w PKGBUILD'