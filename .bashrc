#
# ~/.bashrc
#

[[ $- != *i* ]] && return

[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion

xhost +local: > /dev/null 2>&1

complete -cf sudo

shopt -s checkwinsize
shopt -s expand_aliases
shopt -s histappend

# Change the window title of X terminals
case ${TERM} in
	xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|interix|konsole*)
		PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\007"'
		;;
	screen*)
		PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\033\\"'
		;;
esac

#
## List of stuff to source for bash
. ~/.config/bash/functions.bash
. ~/.config/bash/alias.bash
. ~/.config/bash/colour.bash
. ~/.private/env.bash
. /usr/share/nvm/init-nvm.sh

#
## LaTeX path
if [ -d ~/Dropbox/Latex ] ; then
	export TEXMFHOME=~/latex/
fi