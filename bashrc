# ----------------

# Make it shorter
alias inst="sudo apt-get install -y"
alias update="sudo apt-get update"
alias upgrade="sudo apt-get upgrade"
alias uninst="sudo apt-get purge"

# some ls options, with directories first
alias ls="ls --color --group-directories-first"
alias ll="ls -AlhF --group-directories-first"
alias la="ls -A --group-directories-first"
alias lc="ls -CF --group-directories-first"

# search
alias where="which"
alias what="apropos"
alias apr="apropos"
alias ff="find . -type f -name"
alias vi="vim"

# navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../../"

# count the number of files in a folder
alias numfiles="echo $(ls -1 | wc -l)"

# Use human-readable filesizes
alias du="du -h"
alias df="df -h"

# Automatically do an ls after each cd
cd() {
  if [ -n "$1" ]; then
    builtin cd "$@" && ls --group-directories-first
  else
    builtin cd ~ && ls --group-directories-first
  fi
}
alias cpu="grep 'cpu ' /proc/stat | awk '{usage=(\$2+\$4)*100/(\$2+\$4+\$5)} END {print usage}' | awk '{printf(\"%.1f\n\", \$1)}'"

function __setprompt
{
	local LAST_COMMAND=$? # Must come first!

	# Define colors
	local LIGHTGRAY="\033[0;37m"
	local WHITE="\033[1;37m"
	local BLACK="\033[0;30m"
	local DARKGRAY="\033[1;30m"
	local RED="\033[0;31m"
	local LIGHTRED="\033[1;31m"
	local GREEN="\033[0;32m"
	local LIGHTGREEN="\033[1;32m"
	local BROWN="\033[0;33m"
	local YELLOW="\033[1;33m"
	local BLUE="\033[0;34m"
	local LIGHTBLUE="\033[1;34m"
	local MAGENTA="\033[0;35m"
	local LIGHTMAGENTA="\033[1;35m"
	local CYAN="\033[0;36m"
	local LIGHTCYAN="\033[1;36m"
	local NOCOLOR="\033[0m"

	# Show error exit code if there is one
  printf "\n"
	if [[ $LAST_COMMAND != 0 ]]; then
		printf "${LIGHTRED}1"
		printf "${NOCOLOR} "
  else
		printf "${BLUE}0"
		printf "${NOCOLOR} "
	fi
  printf "${LIGHTMAGENTA}%s${MAGENTA}@%s: ${CYAN}%s ${MAGENTA}%s\n${NOCOLOR}" "$USER" "$(hostname)" "$PWD"  
PS1='$(__git_ps1 "(%s)")->'  
}

source /etc/bash_completion.d/git-prompt

PROMPT_COMMAND=__setprompt
