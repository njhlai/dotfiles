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

# ls coloring
eval "$(dircolors ${HOME}/.config/dir_colors)"

## List of stuff to source for bash
. ~/.config/bash/functions.bash
. ~/.config/bash/alias.bash
. ~/.config/bash/colour.bash
. ~/.private/env.bash
. /usr/share/nvm/init-nvm.sh

#
## LaTeX path
if [ -d ~/Dropbox/Latex ] ; then
	export TEXMFHOME=${HOME}/latex/
fi

eval "$(starship init bash)"