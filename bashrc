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


SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

#   _               _       _                      _        
#  | |__   __ _ ___| |__   | |___      _____  __ _| | _____ 
#  | '_ \ / _` / __| '_ \  | __\ \ /\ / / _ \/ _` | |/ / __|
#  | |_) | (_| \__ \ | | | | |_ \ V  V /  __/ (_| |   <\__ \
#  |_.__/ \__,_|___/_| |_|  \__| \_/\_/ \___|\__,_|_|\_\___/
                    


# make a better prompt, colours, etc. 
if [ -z "$STY" ]
then
      PS1='($CONDA_DEFAULT_ENV) \[\e[0;33m\]\u\[\e[0m\]@\[\e[0;32m\]\h\[\e[0m\]:\[\e[0;31m\]\w\[\e[0m\] ★ '
else

      PS1="(SCREEN) \[\e[31m\]\u\[\e[m\]\[\e[36m\]\h\[\e[m\] ★ "
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


# set default text editor to subl
export EDITOR='sublw'
export VISUAL='sublw'
export HOMEBREW_EDITOR=subl



#              _   _         
#  _ __   __ _| |_| |__  ___ 
# | '_ \ / _` | __| '_ \/ __|
# | |_) | (_| | |_| | | \__ \
# | .__/ \__,_|\__|_| |_|___/
# |_|        
# 

# set up homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# git auto-completion 
if [ -f $SCRIPT_DIR/git-completion.bash ]; then
  . $SCRIPT_DIR/git-completion.bash
fi

#subl
export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin:$PATH"

# python poetry
export PATH="/Users/srinivas/.local/bin:$PATH"

# python pipenv
export PATH="~/.local/bin:$PATH"

# matlab
export PATH="/Applications/MATLAB_R2019b.app/bin:$PATH"

# Specify your defaults in this environment variable
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# https://github.com/sg-s/auto-bots
export PATH=$SCRIPT_DIR:$PATH           

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
                                            
if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi


# misc shortcuts
alias ba='brew update && brew upgrade && brew doctor && brew cleanup'

# handy git shortcuts
alias ga='git add -A .'
alias gd='git diff --color | diff-so-fancy'
# gc is a shortcut for git commit and is stored elsewhere
# similarly with gp for git push because it's a complex command





#    _       _ _       
#   (_)_   _| (_) __ _ 
#   | | | | | | |/ _` |
#   | | |_| | | | (_| |
#  _/ |\__,_|_|_|\__,_|
# |__/                 


export JULIA_NUM_THREADS=8

alias pluto='julia -e "using Pluto; Pluto.run()"'