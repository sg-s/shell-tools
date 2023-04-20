

USERNAME=srinivas

# install brew
a=$(command -v brew | wc -l)
if [ $a -gt 0 ]
then 
	echo "brew installed"
else 
	echo "brew not installed, installing..."
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# update brew
brew update



# define a bash function to make installing using brew 
# a little easier
function brewinstall {
    brew list $1 || brew install $1
}  

function bci {
    brew cask list $1 || brew cask install $1
}  



# check if the google drive folder holding the code exists
if [ -d "/Users/$USERNAME/GoogleDrive/code" ] 
then
	echo "code folder exists in Google Drive"
else 
	echo "no code folder, making..."
	mkdir /Users/$USERNAME/GoogleDrive/code
fi


# make a shortcut using /code
a=$(find / -maxdepth 1 -type l -ls | grep "GoogleDrive/code" | wc -l)
if [ $a -gt 0 ]
then 
	echo "a link to the code folder exists in root"
else
	echo "No link in root, making one..."
	sudo ln -s /Users/$USERNAME/GoogleDrive/code /code
fi


# clone the dotfile repo into the place it should be in
if [ -d "/Users/$USERNAME/GoogleDrive/code/dotfiles" ]
then 
	echo "Dotfiles folder exists"
else
	echo "Cloning dotfiles..."
	git clone https://github.com/sg-s/dotfiles /Users/$USERNAME/GoogleDrive/code/dotfiles
fi


# switch to bash 5
# instructions from 
# here
# 
# https://itnext.io/upgrading-bash-on-macos-7138bd1066ba
brewinstall bash
a=$(less /etc/shells | grep "/usr/local/bin/bash" | wc -l)
if [ $a -gt 0 ]
then
	echo "bash 5 on the whitelist"
else
	echo "adding bash 5 to the whitelist..."
	echo "/usr/local/bin/bash" | sudo tee -a /etc/shells
fi



# browsers
bci google-chrome
bci firefox 


# utils
bci caffeine 
bci carbon-copy-cloner 
bci licensed
brewinstall figlet

# dev
bci sublime-text
brewinstall git
brewinstall wget
brewinstall bash-completion
brewinstall gcc

# file syncing 
bci dropbox
bci google-backup-and-sync
bci transmission

# audio and video
brewinstall ffmpeg
bci vlc
brewinstall youtube-dl 

# security 
bci little-snitch
bci tunnelblick
brewinstall arp-scan

# show full path in finder top
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true; killall Finder


# configure subl to write git commit messages
git config --global core.editor "subl -n -w"


# cleanup old casks
brew cleanup


# copy over bashrc and bash_profile
if [ -f "/Users/$USERNAME/.bashrc" ]
then
	echo ".bashrc already exists"
else
	cp /code/dotfiles/bash_profile.sh /Users/$USERNAME/.bashrc
fi

if [ -f "/Users/$USERNAME/.bash_profile" ]
then
	echo ".bash_profile already exists"
else
	cp /code/dotfiles/bash_profile.sh /Users/$USERNAME/.bash_profile
fi

