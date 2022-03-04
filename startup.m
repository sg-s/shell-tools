% matlab startup file
% 
% created by Srinivas Gorur-Shandilya at 1:44 , 31 March 2015. Contact me at http://srinivas.gs/contact/
% 


% add path to /use/local/bin so we can use homebrew, and a lot of other stuff
path1 = getenv('PATH');
if isempty(strfind(path1,':/usr/local/bin'))
    path1 = [path1 ':/usr/local/bin'];
end
setenv('PATH', path1);


if usejava('jvm')
	% Configuring POI library for Excel export...
	% poi_library_path = '/code/poi-3.13/';
	% allfiles = dir([poi_library_path '*.jar']);
	% for i = 1:length(allfiles)
	% 	javaaddpath([poi_library_path allfiles(i).name]);
	% end

	% disp('Configured POI library.')


	% fix stupid figure sizes
	set(0, 'DefaultFigurePosition', [-1790 200 1300 700]);


end

disp('Cleaning up .kapalin paths...')
kapalin.init()

disp('Setting MATLAB shortcut to start from the commandline...')
system(['ln -s ' matlabroot '/bin/matlab ~/matlab']);


disp('All DONE!')
