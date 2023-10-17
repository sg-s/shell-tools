#!/bin/bash


# get list of things running 
servers=$(/opt/homebrew/bin/jupyter lab list)
echo $servers


if [[ $servers == *"token"* ]]; then
  # Jupyter lab is running, do nothing
  echo "Jupyter running, nothing to do" >> ~/Library/logs/jupyter.log
else
  # not running, start it
  echo "Jupyter NOT running, attempting to start..." >> ~/Library/logs/jupyter.log
  /opt/homebrew/bin/jupyter lab --ip $HOSTNAME --notebook-dir ~/code/ --no-browser 
  echo "DONE"
fi
