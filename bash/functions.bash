#
# provides functions to ~/.bashrc
#

# Git prompt
function colour_my_prompt {
	GIT_PS1_SHOWDIRTYSTATE=true
	GIT_PS1_SHOWSTASHSTATE=true
	GIT_PS1_SHOWUNTRACKEDFILES=true
	GIT_PS1_SHOWUPSTREAM="auto"
	GIT_PS1_HIDE_IF_PWD_IGNORED=true
	GIT_PS1_SHOWCOLORHINTS=true
	. /usr/share/git/completion/git-prompt.sh
		
	local __git_branch=$(__git_ps1)

	# Colour branch name depending on state
	if [[ ${__git_branch} =~ "*" ]]; then     # if repository is dirty
		PS1='\[\e[38;5;241m\]\u\[\e[38;5;167m\]@\h\[\033[01;37m\] \W$(__git_ps1 " \[\033[01;31m\][%s]")\[\033[00m\] \[\e[38;5;167m\]>\[\033[00m\] '
	elif [[ ${__git_branch} =~ "$" ]]; then   # if there is something stashed
		PS1='\[\e[38;5;241m\]\u\[\e[38;5;167m\]@\h\[\033[01;37m\] \W$(__git_ps1 " \[\033[01;33m\][%s]")\[\033[00m\] \[\e[38;5;167m\]>\[\033[00m\] '
	elif [[ ${__git_branch} =~ % ]]; then   # if there are only untracked files
		PS1='\[\e[38;5;241m\]\u\[\e[38;5;167m\]@\h\[\033[01;37m\] \W$(__git_ps1 " \[\033[01;35m\][%s]")\[\033[00m\] \[\e[38;5;167m\]>\[\033[00m\] '
	elif [[ ${__git_branch} =~ "+" ]]; then   # if there are staged files
		PS1='\[\e[38;5;241m\]\u\[\e[38;5;167m\]@\h\[\033[01;37m\] \W$(__git_ps1 " \[\033[01;36m\][%s]")\[\033[00m\] \[\e[38;5;167m\]>\[\033[00m\] '
	else
		PS1='\[\e[38;5;241m\]\u\[\e[38;5;167m\]@\h\[\033[01;37m\] \W$(__git_ps1 " \[\033[01;32m\][%s]")\[\033[00m\] \[\e[38;5;167m\]>\[\033[00m\] '
	fi
}

# cd with onefetch for git repos
function cd {
	builtin cd "$@"
	[[ -d $PWD/.git/ || -f $PWD/.git ]] && onefetch 2> /dev/null
}

# ex - archive extractor
# usage: ex <file>
ex ()
{
	if [ -f $1 ] ; then
		case $1 in
			*.tar.bz2)   tar xjf $1   ;;
			*.tar.gz)    tar xzf $1   ;;
			*.bz2)       bunzip2 $1   ;;
			*.rar)       unrar x $1     ;;
			*.gz)        gunzip $1    ;;
			*.tar)       tar xf $1    ;;
			*.tbz2)      tar xjf $1   ;;
			*.tgz)       tar xzf $1   ;;
			*.zip)       unzip $1     ;;
			*.Z)         uncompress $1;;
			*.7z)        7z x $1      ;;
			*)           echo "'$1' cannot be extracted via ex()" ;;
		esac
	else
	echo "'$1' is not a valid file"
	fi
}