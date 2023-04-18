#
# colourful bash 
#

# Enable colors for ls, etc.
if type -P dircolors >/dev/null ; then
	if [[ -f ${HOME}/.config/dir_colors ]] ; then
		eval $(dircolors ${HOME}/.config/dir_colors)
	elif [[ -f ~/.dir_colors ]] ; then
		eval $(dircolors -b ~/.dir_colors)
	elif [[ -f /etc/DIR_COLORS ]] ; then
		eval $(dircolors -b /etc/DIR_COLORS)
	fi
fi

alias ls='ls --color=auto'
alias grep='grep --colour=auto'
alias egrep='egrep --colour=auto'
alias fgrep='fgrep --colour=auto'
