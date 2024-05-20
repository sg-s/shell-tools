

# add tools and script dir to path so those things are available
DIR_THAT_CONTAINS_THIS_SCRIPT=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

REPO_DIR="$(dirname "$DIR_THAT_CONTAINS_THIS_SCRIPT")"

  
export PATH=$REPO_DIR/tools:$PATH   
export PATH=$REPO_DIR/git:$PATH    

export PATH="$HOME/.local/bin":$PATH

# deeporigin paths
export PATH="$HOME/.deeporigin:$PATH"

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # linux-like OS
    export PATH="/home/ubuntu/.local/bin:$PATH"

elif [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS

    # set up homebrew
    eval "$(/opt/homebrew/bin/brew shellenv)"

    # subl
    export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin:$PATH"

    # brew make
    export PATH="/opt/homebrew/opt/make/libexec/gnubin:$PATH"


    # rust stuff 
    export PATH="$HOME/.cargo/bin:$PATH"


    # make homebrew cask install in root applications
    export HOMEBREW_CASK_OPTS="--appdir=/Applications"

fi

