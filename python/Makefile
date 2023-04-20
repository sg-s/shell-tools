

.PHONY: install-jupyter-launch-agent



install-jupyter-launch-agent: 
	cp com.srinivas.jupyter.plist ~/Library/LaunchAgents/
	-launchctl unload com.srinivas.jupyter.plist 
	launchctl load com.srinivas.jupyter.plist 
	launchctl start com.srinivas.jupyter.plist 


