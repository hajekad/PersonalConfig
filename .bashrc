# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
H

ISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar
# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[[01;32m\]\u@\h\[[00m\]:\[[01;34m\]\w\[[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias rm='rm -i'
alias mkpro='source ~/scripts/./mkpro.sh'
alias rr='ranger'
alias brave='brave-browser'
alias please='sudo'
alias framezPls='xrandr --output HDMI-0 --mode 1920x1080 --rate 239.76 --left-of DP-2'
alias KYS='sudo shutdown now'
alias bt='bashtop'
alias duso='sudo'
alias mkae='make'
alias volume='amixer set Master'
alias makdroid='ng build --configuration=production & npx cap sync & npx cap open android'
alias android='/usr/local/android-studio/bin/./studio.sh'
alias cum='echo "__________________▄▄▄█████████▄▄▄▄
______________▄██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒████▄▄
___________▄█▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒███▄
________▓▄█▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒█████████████▄
________▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒████▓▓▓▓▓▓▓▓▓▓▓▓▓██▄
_______█▓░░▓▓▒▒▒▒▒▒▒▒▒███▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓█▄
_______█▒▓░▓░▓▓▒▒▒▒▒██▓▓▓▓▓▓▓████▓▓▓▓▓▓▓▓▓▓▓▓▓▓█▄
________█▒▓▓░░░▓▓▓▒█▓▓▓▓▓▓▓██▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓█▄__▓▓
_________█▒▓░░░░▓░░▓▓▓▓▓▓██▓▓▓▓█████▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓█▓▓▓
__________█▒▓░░▓░░░░▓▓▓▓▓█▓▓▓▓██▓▓▓▓███▓▓▓▓▓▓▓▓▓▓▓▓▓░░░▓
______▄▄▄▄_█▒▓▓░░░░░▓░▓▓█▓▓▓▓█▓▓▓█▓▓▓▓██▓▓▓▓▓▓▓▓▓▓░░░░░▓
___▄█▒▒▒▒███▒▓░░░░▓░░░█▓▓▓▓█▓▓▓▓▓█▓▓▓██▓▓▓▓▓▓▓▓▓░░░░░░░▓
__█▒▒▒█▒▒▒██▒▒▓░░▓░░███▓▓▓▓▓█▓▓▓█▓▓▓▓█▓▓▓▓▓▓▓▓░░░░░░░░░▓
_█▒▒▒█▒▒▒▒█▒▒▒▒▓▓░███░█▓▓▓▓▓▓███▓▓▓▓██▓▓▓▓▓▓▓░░░░░░░▓░░▓█▄
_█▒▒▒▒█▒▒█▒▒▒▒████▓█░░▓█▓▓▓▓▓▓▓▓▓▓▓█░░███████░░░░░░░░▓░░▓▒██▄
__█▒▒▒▒███▒▒▒▒█▓▓▓█░░▓░░████▓▓▓▓▓██░░░░░░░░░░░░░░░░░░░▓░▓▒▒▒▒█▄
___██▒▒▒▒▒▒▒▒▒█▓██░▓▓░░░░░░░░████░░░░░░░▄░░░░░░░░░░░░░▓░░▓▒▒▒▒▒█
______██▒▒▒▒▒████░░░░░░░░░░░░░░░░░░░░░░░▄▀░░░░░░░░░░░░▓░░░▓▒▒▒▒▒▒█
_________▀▀▀▀▀_▓▓░░░░░░░░░░░░░░▄▀▀▀▀▀▀▀▄▀░░░░▄░░░░░░░░░░░░▓▒▒▒▒▒▒▒█▄
_________________▓▓░░░░░░░░░░░░▄▀____________▀▄░▄▀░░░░░░░░░░░░░▓▒▒▒▒▒▒▒█
________________▓▓░░░░░░░░░░░▄█▓▓▓▓▓▓________█▀░░░░░░░████░░░▓▒▒█▒▒▒▒▒█
________________▓▓░░░░░░░░░░█▓▓███▓▓▓▓_______█░▄▄░░██▒▒▒▒▒█░░▓▒█▒▒▒▒▒▒█
________________▓▓░░░░░░░░░▓████_______▓▓______▀▀░░░█▒▒▒▒▒▒▒█░▓█▒▒▒▒▒▒▒█
________________▓▓░░░░░░░░░████▌________▓▓_____░░░░█▒▒▒▒▒▒▒▒▒█▒▒▒▒▒▒▒▒▒█
________________▓▓░░░░░░░░█████▌________▓▓▓____░░░█▒▒▒▒█▒▒▒▒█▒▒▒▒▒▒▒▒▒▒█
_________________▓▓░░░░░░░██████▄______█▓▓▓___░░░░█▒▒▒▒█████▒▒▒▒▒▒▒▒▒▒█
_________________▓▓░░░░░░░█████▀██▄▄▄█▓▓▓___░░░░░█▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒█
________________▓▓▓░░░░░░░███▌___▐████▓▓▓__░░░░░░░█▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒█
_____________▓▓░░░░░░░░░░░██████████▓▓▓__░░░░░░░░░██▒▒▒▒▒▒▒▒▒▒▒▒▒██
____________▓░░░▄░░░░░░░░░░████████▓▓▓_░░░░░░░░░░░░███▒▒▒▒▒▒▒▒▒█▓█
____________▓░░▀░░░░░▄█▄░░░░█████▓▓▓░░░░░░░░░░░░░███▒▒▒▒▒▒▒███▓▓█
_____________▓░░░░░░░░█░░░░░░░░░░░░░░░░░░░░░░░░░██▒▒▒▒▒▒███▓▓▓▓█
______________▓░░░░░░██░░░░░░░░░░░░░░░░░░░░░░░░██▒▒▒▒███▓▓▓▓▓▓▓█
_______________▓▓░░▄█▀░░░░░░░░░░░░░░░░░░░░░░░░██▒▒▒▒█▓▓▓▓███████
_________________▓▓▓▓░░░░░░░░░░░░░░░░░░░░░░░░▓█▒▒▒▒█▓▓▓██▓▓▓▓▓▓▓█
______________________▓▓▓▓░░░░░░░░░░░░░░░░▓▓▓▓█▒▒▒▒█▓▓▓██▓▓▓▓▓▓▓▓▓█
____________________________▓▓▓▓▓▓▓▓▓▓▓▓▓▓______█▒▒▒█▓▓▓▓▓██▓▓▓▓▓▓▓▓▓█
_____________________________________________________█▒▒█▓▓▓▓▓▓█▓▓▓▓█▓▓▓▓█
______________________________________________________█▒█▓▓▓▓▓▓▓████▓▓▓▓▓█
_______________________________________________________██▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓█
________________________________________________________▀█▓▓▓▓▓▓▓▓▓▓▓▓▓▓█▀
__________________________________________________________▀█▓▓▓▓▓▓▓▓▓▓██▀
_____________________________________________________________▀▀██████"'
alias pog="cd 'FIT/B212/PA2'"
alias ws='wireshark'
alias PA1='https://gitlab.fit.cvut.cz/BI-PA1/B211/BI/hajekad3.git'
alias UOS='https://gitlab.fit.cvut.cz/BI-UOS/B211/hajekad3.git'
alias pvt='https://gitlab.fit.cvut.cz/hajekad3/1.-semestr.git'
alias vpn='protonvpn-cli'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias neofetch='clear; neofetch --refresh_rate on --ascii ~/asciiArt/4 | lolcat'
alias gpp='g++ -std=c++17 -Wall -pedantic -O2'
alias vivado='source /opt/Xilinx/Vivado/2018.2/settings64.sh; vivado &'
alias die='exit'
# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history | tail -n1 | sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
i
# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

#Details
        clear
	neofetch



# Load Angular CLI autocompletion.
source <(ng completion script)
