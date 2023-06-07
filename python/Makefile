

.PHONY: install-jupyter-launch-agent copy


copy:
	cp com.srinivas.jupyter.plist /Users/srinivas/Library/LaunchAgents/com.srinivas.jupyter.plist

install-jupyter-launch-agent: copy
	-launchctl unload com.srinivas.jupyter.plist \
	launchctl load com.srinivas.jupyter.plist \
	launchctl start com.srinivas.jupyter.plist 


