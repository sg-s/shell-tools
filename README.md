<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](http://doctoc.herokuapp.com/)*

- [Auto-bots](#auto-bots)
- [installation](#installation)
  - [git-stat ```[script]```](#git-stat-script)
  - [keep-drive-mounted ```[bot]```](#keep-drive-mounted-bot)
  - [keep-process-running ```[bot]```](#keep-process-running-bot)
  - [make-retina.sh `[script]`](#make-retinash-script)
  - [share.sh `[script]`](#sharesh-script)
  - [where-am-i.py ```[bot]```](#where-am-ipy-bot)
  - [link-scripts `[script]`](#link-scripts-script)
  - [netup.m ```[bot]```](#netupm-bot)
  - [strip-mp3 ```[script]```](#strip-mp3-script)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# Auto-bots

A mishmash of various scripts and bots that make life easier. Most of these scripts are `bash` scripts, but some are written in `python` or `MATLAB`

All files here are either `script`s or ```bot```s. ```script```s are meant to be run manually, as you need them. ```bot```s are meant to run in the background using a system-level scheduler like `crontab`

# installation

If you have git installed:

```
git clone https://github.com/sg-s/auto-bots.git
cd auto-bots
chmod a+x link-scripts.sh
./link-scripts.sh

```

`link-scripts` makes all the scripts here executable, and you can run them by calling their name.

# Contents## copy-fonts ```[script]```

Moving computers? Take your fonts with you. Copies fonts from commonly used folders on Mac OS X into a folder called "fonts" in your home folder so you can move it easily.

## git-stat ```[script]```

Tells you the status of your local repo, compared to the remote. 


## keep-drive-mounted ```[bot]```

Keeps a network volume mounted on OS X. It checks if you're on the correct WiFi network (change as needed) and checks if the network drive is mounted (again, change as needed), and calls a small AppleScript to mount the network drive (again, modify as needed). The advantage of doing this crazy scheme is you use Mac OS X's core volume management, and have full access to the keychain, so no passwords are stored in plain text. 

this works with an arbitrary number of wifi networks/drives, so it will mount the correct network volume based on your location. 

This is basically a free replacement to ridiculous tools like [Drive Mounter (App Store link)](https://itunes.apple.com/us/app/drive-mounter/id441149468?mt=12)


## keep-process-running ```[bot]```

keep-process-running is meant to be run continuously, e.g., using crontab. 

edit the file (e.g., on line 3) with the process you want to keep running: 

```bash
if [ $(ps aux | grep "Quicksilver" | wc -l) -eq 1 ]
```

## make-retina.sh `[script]`

Scans a folder of pictures, and up-samples them if necessary to fill a "retina" sized screen (a 15" high-DPI screen). 

## share.sh `[script]`
`share` zips a target folder, uploads it to your server, and returns a publicly accessibly URL. See how it works [here](https://gist.github.com/sg-s/40245c08d37e83bde3fb).


## where-am-i.py ```[bot]```

where-am-i is a handy bot that writes the internal and external IP address of the computer it is running on to file. The idea is that you want to SSH (or VNC) into your computer, but because you have a sucky ISP, your external IP keeps changing. 

where-am-i tracks IPs for you, and if it writes to a file inside a folder that you can otherwise synchronize (for example, with [Bit Torrent Sync](http://www.bittorrent.com/sync)), you can SSH into your computer from anywhere. 

## link-scripts `[script]`

What's the use of having a bunch of scripts if you need to remember where they are and have to manually set permissions for them to get them working? link-scripts automatically makes all the scripts in the current folder executable, and links them using short names (it strips out the extension) to a folder in /usr/bin/.

So once you run the install script above, you can run any of the scripts from anywhere in your computer using (for example)

```bash
make-retina
```



## netup.m ```[bot]```


## strip-mp3 ```[script]```

Strips MP3s from specified video files in the current folder and extracts the audio to a .mp3. Particualrltly useful when combined with [this handy script](https://github.com/rg3/youtube-dl) to download youtube videos 

```bash
strip-mp3 .mp4 
```

will grab all the .mp4 files in the current directory, and use VLC to extract audio form them and save them in mp3 files. 