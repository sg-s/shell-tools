# tell macOS to STFU about zsh
export BASH_SILENCE_DEPRECATION_WARNING=1

case $- in
    *i*) source ~/code/shell-tools/bash/bashrc # fix this path to point to where this file is
esac

# overwrite cd if zoxide is installed
if command -v zoxide &> /dev/null
then
    eval "$(zoxide init bash --cmd cd)"
fi
