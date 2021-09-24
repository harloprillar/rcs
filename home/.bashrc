#if not running interactively, don't do anything
[ -z "$PS1" ] && return

HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
HISTCONTROL=ignoreboth
export HISTFILESIZE=9999
export HISTSIZE=9999
export PROMPT_COMMAND="history -a; history -n"
shopt -s histappend
shopt -s checkwinsize

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

#PS1="$(if [[ ${EUID} == 0 ]]; then echo '\[\033[01;31m\]\h'; else echo '\[\033[01;32m\]\u@\h'; fi)\[\033[01;34m\] \w \$([[ \$? != 0 ]] && echo \"\[\033[01;31m\]:(\[\033[01;34m\] \")\\$\[\033[00m\]\$"
#PS1="\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\\$ "
PS1="$(if [[ ${EUID} == 0 ]]; then echo '\[\033[01;31m\]\h'; else echo '\[\033[01;32m\]\u@\h'; fi)\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\\$ "

if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
  . /etc/bash_completion
fi

alias ls="ls -Gp"
#alias kubectl="microk8s kubectl"
#alias helm="microk8s helm"
#alias helm3="microk8s helm3"

if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

export LSCOLORS="Exfxcxdxbxegedabagacad"
export LANG=en_US.UTF-8
export EDITOR=vim
export MANPAGER=less
export PATH="${HOME}/bin/:${PATH}"
export TERM='xterm-256color'

#if [ -f /usr/share/powerline/bindings/bash/powerline.sh ]; then
#  powerline-daemon -q
#  POWERLINE_BASH_CONTINUATION=1
#  POWERLINE_BASH_SELECT=1
#  source /usr/share/powerline/bindings/bash/powerline.sh
#fi

# FUNCTIONS

function chkcertexpiry() {
  local FROM TO DAYS
  IFS=$'\t' read -r FROM TO \
    < <(sed -r 's/notBefore=(.+) notAfter=(.+)/\1\t\2/' \
    <<< $(echo | openssl s_client -connect $1:443 -servername $1 2>/dev/null | openssl x509 -noout -dates))
  echo $(date -d "$FROM" '+%Y-%m-%d') $(date -d "$TO" '+%Y-%m-%d') "$(( ($(date -d "$TO" "+%s")-$(date "+%s"))/86400 ))"
}

