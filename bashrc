# This is your bashrc file (i.e., the config file for your bash Shell)
# This should be loaded by bash when it starts up. To get it to do so, do this:
# 
# add this to your ~/.bashrc or ~/.bash_profile:
# case $- in
#    *i*) source ~/code/config-files/bashrc # fix this path to point to where this file is
# esac
#
# Tweak the following things as needed. Warning: rearranging the order of things may break everything. 

# makefile autocomplete
complete -W "\`grep -oE '^[a-zA-Z0-9_.-]+:([^=]|$)' ?akefile | sed 's/[^a-zA-Z0-9_.-]*$//'\`" make

# SSH autocomplete
# from https://gist.github.com/aliang/1024466
_complete_ssh_hosts ()
{
        COMPREPLY=()
        cur="${COMP_WORDS[COMP_CWORD]}"
        comp_ssh_hosts=`cat ~/.ssh/known_hosts | \
                        cut -f 1 -d ' ' | \
                        sed -e s/,.*//g | \
                        grep -v ^# | \
                        uniq | \
                        grep -v "\[" ;
                cat ~/.ssh/config | \
                        grep "^Host " | \
                        awk '{print $2}'
                `
        COMPREPLY=( $(compgen -W "${comp_ssh_hosts}" -- $cur))
        return 0
}
complete -F _complete_ssh_hosts ssh


SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

#   _               _       _                      _        
#  | |__   __ _ ___| |__   | |___      _____  __ _| | _____ 
#  | '_ \ / _` / __| '_ \  | __\ \ /\ / / _ \/ _` | |/ / __|
#  | |_) | (_| \__ \ | | | | |_ \ V  V /  __/ (_| |   <\__ \
#  |_.__/ \__,_|___/_| |_|  \__| \_/\_/ \___|\__,_|_|\_\___/
                    


# make a better prompt, colours, etc. 
# this shows name and hostname
# use this to generate these:
# https://bash-prompt-generator.org/
# 
# if [ -z "$STY" ]
# then
#       # not in screen
#       PS1='($CONDA_DEFAULT_ENV) \[\e[0;33m\]\u\[\e[0m\]@\[\e[0;32m\]\h\[\e[0m\]:\[\e[0;31m\]\w\[\e[0m\] ★ '
# else
#       # in screen
#       PS1="(SCREEN) \[\e[31m\]\u\[\e[m\]\[\e[36m\]\h\[\e[m\] ★ "
# fi


# if [ -z "$STY" ]
# then
#       # not in screen
#       PS1='\[\e[38;5;208m\]\w\[\e[0m\] ★ '
# else
#       # in screen
#       PS1="PS1='\[\e[38;5;196;48;5;231m\]SCREEN\[\e[0m\]' \w ★ "
# fi

if [ "$HOSTNAME" = "tma1.local" ]; then
    PS1='\[\e[38;5;208m\]\w\[\e[0m\] ★ '
elif [ "$USER" = "ubuntu" ];
    # aws?
    PS1='\[\e[38;5;208m\]\w\[\e[0m\] 🤑 '
else
    PS1='\[\e[38;5;196m\]\w\[\e[0m\] ★ '
fi

# supposedly protects against attacks via paste
# see: https://unix.stackexchange.com/questions/309786/disable-default-copypaste-behaviour-in-bash/309798#309798
# and https://cirw.in/blog/bracketed-paste
bind 'set enable-bracketed-paste on'


# better auto complete
bind "set completion-ignore-case on"

# improve history
export HISTCONTROL=ignoreboth:erasedups
#export HISTSIZE=10000   # remember more things in history 


# color folders in ls 
alias ls='ls -G'
export CLICOLOR=1
export LSCOLORS=Gxfxcxdxbxegedabagacad


# supports history search using up and down arrows
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind '"\eOA": history-search-backward'
bind '"\eOB": history-search-forward'
set show-all-if-ambiguous on
set completion-ignore-case on


if [[ "$OSTYPE" == "darwin"* ]]; then
    # set default text editor to subl
    export EDITOR='sublw'
    export VISUAL='sublw'
    export HOMEBREW_EDITOR=subl

fi



#              _   _         
#  _ __   __ _| |_| |__  ___ 
# | '_ \ / _` | __| '_ \/ __|
# | |_) | (_| | |_| | | \__ \
# | .__/ \__,_|\__|_| |_|___/
# |_|        
# 

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        # ...
elif [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS

    # set up homebrew
    eval "$(/opt/homebrew/bin/brew shellenv)"

    # subl
    export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin:$PATH"

    # brew make
    export PATH="/opt/homebrew/opt/make/libexec/gnubin:$PATH"


    # rust stuff 
    export PATH="/Users/srinivas/.cargo/bin:$PATH"


    # make homebrew cask install in root applications
    export HOMEBREW_CASK_OPTS="--appdir=/Applications"

fi



# git auto-completion 
if [ -f $SCRIPT_DIR/git-completion.bash ]; then
  . $SCRIPT_DIR/git-completion.bash
fi


# add tools and script dir to path so those things are available
export PATH=$SCRIPT_DIR:$PATH     
export PATH=$SCRIPT_DIR/tools:$PATH           

# awesome git prompt, see: https://github.com/arialdomartini/oh-my-git
source ~/code/oh-my-git/prompt.sh    


# show the computer name in a cool font (using figlet)
computer-name



#      _                _             _       
#  ___| |__   ___  _ __| |_ ___ _   _| |_ ___ 
# / __| '_ \ / _ \| '__| __/ __| | | | __/ __|
# \__ \ | | | (_) | |  | || (__| |_| | |_\__ \
# |___/_| |_|\___/|_|   \__\___|\__,_|\__|___/
# 


if [[ "$OSTYPE" == "darwin"* ]]; then
                                            
    if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
    fi


    # misc shortcuts
    alias ba='brew update && brew upgrade && brew doctor && brew cleanup'

fi

# handy git shortcuts
alias ga='git add -A .'
alias gd='git diff --color | diff-so-fancy'
# gc is a shortcut for git commit and is stored elsewhere
# similarly with gp for git push because it's a complex command


