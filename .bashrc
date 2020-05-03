export CLICOLOR=YES
case $- in
    *i*) ;;
      *) return;;
esac



PS1="\[\033[38;5;33m\]\d\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;33m\]\t\[$(tput sgr0)\]\n\[$(tput sgr0)\]"
PS1+="\[\033[38;5;208m\]\u\[$(tput sgr0)\]"
PS1+="@\[\033[38;5;226m\]\h\[$(tput sgr0)\]:"
PS1+="\[\033[38;5;46m\]\w\[$(tput sgr0)\]"


# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi


if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi



__git_ps1 ()
{
    local b="$(git symbolic-ref HEAD 2>/dev/null)";
    if [ -n "$b" ]; then
        printf " %s" "(${b##refs/heads/})";
    fi
}

PS1+="\[\$(tput setaf 4)\$(__git_ps1)\[$(tput sgr0)\] "
PS1+="\[\033[38;5;11m\]-\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;11m\]>\[$(tput sgr0)\] "




export PS1
