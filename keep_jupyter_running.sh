#!/bin/bash

# get list of things running 
servers=$(jupyter lab list)
echo $servers


if [[ $servers == *"token"* ]]; then
  # Jupyter lab is running, do nothing
  echo "Jupyter running, nothing to do" >> ~/Desktop/log.txt
else
  # not running, start it
  echo "Jupyter N!!!!OT running, attempting to start..." >> ~/Desktop/log.txt
  /Users/srinivas/opt/anaconda3/bin/jupyter lab --ip $HOSTNAME --notebook-dir ~/code/ --no-browser 
  echo "DONE"
fi
