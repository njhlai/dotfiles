#
# provides functions to ~/.bashrc
#

# cd with onefetch for git repos
function cd {
	local LASTREPO=$(basename $(git rev-parse --show-toplevel 2> /dev/null) 2> /dev/null)
	builtin cd "$@"
	if [[ -d $PWD/.git/ || -f $PWD/.git ]] ; then
		[[ $LASTREPO != $(basename $(git rev-parse --show-toplevel)) ]] && onefetch
	fi
}


# repo - convenient function to jump to repo location
repo () {
	repopwd="${REPOS}/$1"
	if [[ -d ${repopwd} ]] ; then
		cd ${repopwd}
	else
		echo "the repo '$1' is not present locally!"
	fi
}

# soft - function to open Soft Serve TUI to Git server
soft () {
	repopwd="${REPOS}/$1"
	if [[ -d ${repopwd} ]] ; then
		ssh ${SOFT_SERVER} -p ${SOFT_SERVER_PORT} -t $1
	else
		ssh ${SOFT_SERVER} -p ${SOFT_SERVER_PORT}
	fi
}

# completion
_repo_completion () {
	[[ ${#COMP_WORDS[@]} != 2 ]] || COMPREPLY=($(compgen -W "$(ls ${REPOS} | sed -z 's,\n, ,g')" "${COMP_WORDS[1]}"))
}
complete -F _repo_completion repo
complete -F _repo_completion soft


# ex - archive extractor
ex ()
{
	if [[ -f $1 ]] ; then
		case $1 in
			*.tar.bz2)   tar xjf $1   ;;
			*.tar.gz)    tar xzf $1   ;;
			*.bz2)       bunzip2 $1   ;;
			*.rar)       unrar x $1   ;;
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