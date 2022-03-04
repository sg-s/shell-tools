% checks and things to do before matlab shuts down


% check if there are uncommitted changes to any of the project repositories 
if usejava('jvm') && isempty(java.lang.System.getProperty( 'java.awt.headless' ))
	isCodeCommitted;
end
