# ----------------
# ~/.rhowaldt_bashrc
# personal bashrc aliasses etc file
# ----------------
source ~/.git-prompt.sh

# Make it shorter
alias inst="sudo apt-get install -y"
alias update="sudo apt-get update"
alias upgrade="sudo apt-get upgrade"
alias uninst="sudo apt-get purge"

alias q="exit"
alias c="clear"

# some ls options, with directories first
alias ls="ls --color --group-directories-first"
alias ll="ls -AlhF --group-directories-first"
alias la="ls -A --group-directories-first"
alias lc="ls -CF --group-directories-first"
alias lrn="cd /home/ianlittke/workspace/Learning"
alias school="cd /home/ianlittke/workspace/School/2016winter/"

# search
alias where="which"
alias what="apropos"
alias apr="apropos"
alias ff="find . -type f -name"

# navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../../"
alias ......="cd ../../../../.."
alias scripts="cd ~/scripts"

# what's with the typo?
alias unmount="umount"

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

print_before_the_prompt () {  
    printf "\n $txtred%s: $bldgrn%s $txtpur%s\n$txtrst" "$USER" "$PWD"  
}

PROMPT_COMMAND=print_before_the_prompt
PS1='$(__git_ps1 "(%s)")->'  

#alias 


