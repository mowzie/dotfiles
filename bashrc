# ----------------
# ~/.rhowaldt_bashrc
# personal bashrc aliasses etc file
# ----------------

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
alias school="cd /home/ianlittke/workspace/School/2014\ Fall/CS131/"


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

if [ -f /etc/bash_completion ]; then
   . /etc/bash_completion
fi


print_before_the_prompt () {  
    printf "\n $txtred%s: $bldgrn%s $txtpur%s\n$txtrst" "$USER" "$PWD"  
}  

PROMPT_COMMAND=print_before_the_prompt  
PS1='$(__git_ps1 "(%s)")->'  


# Set some colors (ripped from kestrel @ crunchbang forums)

txtblk='\e[0;30m' # Black - Regular  
txtred='\e[0;31m' # Red  
txtgrn='\e[0;32m' # Green  
txtylw='\e[0;33m' # Yellow  
txtblu='\e[0;34m' # Blue  
txtpur='\e[0;35m' # Purple  
txtcyn='\e[0;36m' # Cyan  
txtwht='\e[0;37m' # White  
  
bldblk='\e[1;30m' # Black - Bold  
bldred='\e[1;31m' # Red  
bldgrn='\e[1;32m' # Green  
bldylw='\e[1;33m' # Yellow  
bldblu='\e[1;34m' # Blue  
bldpur='\e[1;35m' # Purple  
bldcyn='\e[1;36m' # Cyan  
bldwht='\e[1;37m' # White  
  
unkblk='\e[4;30m' # Black - Underline  
undred='\e[4;31m' # Red  
undgrn='\e[4;32m' # Green  
undylw='\e[4;33m' # Yellow  
undblu='\e[4;34m' # Blue  
undpur='\e[4;35m' # Purple  
undcyn='\e[4;36m' # Cyan  
undwht='\e[4;37m' # White  
  
bakblk='\e[40m'   # Black - Background  
bakred='\e[41m'   # Red  
badgrn='\e[42m'   # Green  
bakylw='\e[43m'   # Yellow  
bakblu='\e[44m'   # Blue  
bakpur='\e[45m'   # Purple  
bakcyn='\e[46m'   # Cyan  
bakwht='\e[47m'   # White  
  
txtrst='\e[0m'    # Text Reset  


