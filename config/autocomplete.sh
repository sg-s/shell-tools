# add tools and script dir to path so those things are available
DIR_THAT_CONTAINS_THIS_SCRIPT=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

REPO_DIR="$(dirname "$DIR_THAT_CONTAINS_THIS_SCRIPT")"


# makefile autocomplete -- this is for basj
# complete -W "\`grep -oE '^[a-zA-Z0-9_.-]+:([^=]|$)' ?akefile | sed 's/[^a-zA-Z0-9_.-]*$//'\`" make

# Define a function that generates make targets
_make_targets() {
  grep -oE '^[a-zA-Z0-9_.-]+:([^=]|$)' ?akefile | sed 's/[^a-zA-Z0-9_.-]*$//'
}

# Set up the completion for the `make` command using the _make_targets function
compdef '_arguments "*: :($( _make_targets ))"' make


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



# git auto-completion 
if [ -f $REPO_DIR/git/git-completion.bash ]; then
  . $REPO_DIR/git/git-completion.bash
fi