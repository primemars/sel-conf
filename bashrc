# .bashrc

# User specific aliases and functions

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias ls='ls --color=tty'
alias ec='emacsclient -t'

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

export TERM='screen'
export SVN_EDITOR='emacs'

set completion-ignore-case on
unset LESS

#Bash should append rather than overwrite the history
shopt -s histappend
#When displaying the prompt, write the previous line to disk
PROMPT_COMMAND='history -a'

# add maui in the 'cd' command path
CDPATH='.:/usr/local/maui'
