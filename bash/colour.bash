#
# colourful bash 
#

if [[ ${EUID} == 0 ]] ; then
	export PS1='\[\033[01;31m\][\h\[\033[01;36m\] \W\[\033[01;31m\]]\$\[\033[00m\] '
elif [ -f /usr/share/git/completion/git-prompt.sh ]; then
	# git-prompt is no longer in git-core, not sure when this happened...
	export PROMPT_COMMAND=colour_my_prompt
else
	export PS1='\[\e[38;5;241m\]\u\[\e[38;5;167m\]@\h\[\033[01;37m\] \W \[\e[38;5;167m\]>\[\033[00m\] '
fi

# Enable colors for ls, etc.  Prefer ~/.dir_colors #64489
if type -P dircolors >/dev/null ; then
	if [[ -f ~/.dir_colors ]] ; then
		eval $(dircolors -b ~/.dir_colors)
	elif [[ -f /etc/DIR_COLORS ]] ; then
		eval $(dircolors -b /etc/DIR_COLORS)
	fi
fi

alias ls='ls --color=auto'
alias grep='grep --colour=auto'
alias egrep='egrep --colour=auto'
alias fgrep='fgrep --colour=auto'