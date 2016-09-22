# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../.."
alias diff='colordiff'

# freeScale command
#export PATH=/home/amartin/work/tools/sdk_freescale/sysroots/x86_64-fslsdk-linux/usr/bin/powerpc-fsl-linux/:$PATH

alias powerpc_objdump='powerpc-linux-gnu-objdump'
alias powerpc_gcc='powerpc-linux-gnu-gcc-4.8'

# avoid sudo
alias apt-get='sudo apt-get'

# grep commands
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'


# Stop after sending count ECHO_REQUEST packets #
alias ping='ping -c 5'
alias ports='netstat -tulanp'

# reboot / halt / poweroff
alias reboot='sudo /sbin/reboot'
alias poweroff='sudo /sbin/poweroff'
alias halt='sudo /sbin/halt'
alias shutdown='sudo /sbin/shutdown'

# history
#export HISTFILESIZE=20000
#export HISTSIZE=10000
shopt -s histappend

# Combine multiline commands into one in history
shopt -s cmdhist

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups
export HISTIGNORE="ll:cd:cd .:cd ..:&:ls:[bf]g:exit"

# set lttng default dir to /tmp. Needed to process lttng traces.
export LTTNG_HOME=/tmp

# extract all compressed file automatically
extract () {
     if [ -f $1 ] ; then
         case $1 in
             *.tar.bz2)   tar xjf $1        ;;
             *.tar.gz)    tar xzf $1     ;;
             *.bz2)       bunzip2 $1       ;;
             *.rar)       rar x $1     ;;
             *.gz)        gunzip $1     ;;
             *.tar)       tar xf $1        ;;
             *.tbz2)      tar xjf $1      ;;
             *.tgz)       tar xzf $1       ;;
             *.zip)       unzip $1     ;;
             *.Z)         uncompress $1  ;;
             *.7z)        7z x $1    ;;
             *)           echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}

# OPAM configuration
. /local/home/amartin/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true
