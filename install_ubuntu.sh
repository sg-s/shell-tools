# script to setup a new ubuntu computer for general use

# figure out home directory
homedir=$( getent passwd "$USER" | cut -d: -f6 )



mkdir ~/code/
cd ~/code/
git clone https://github.com/sg-s/shell-tools


# install bashrc for a sane prompt
echo "case \$- in
    *i*) source $homedir/code/shell-tools/bashrc_ubuntu # fix this path to point to where this file is
esac" >> ~/.bashrc


# copy over SSH key
mkdir ~/.ssh
cp ~/code/shell-tools/ssh-keys/zorya.pub ~/.ssh/