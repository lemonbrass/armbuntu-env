#!/bin/bash

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

#if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
#    . /etc/bash_completion
#fi

export TERM=xterm-256color
eval $(ssh-agent -s)

export PATH="$PATH:~/.bin/"


alias ls=l
alias cd=c
alias g=git
alias cum="git commit -a"
alias push="git push"
alias v=nvim
alias b="cd .."
alias c3r="c3c compile-run ."
alias c3b="c3c compile ."
