% Script for simple installation of Matlab code and dependencies 

% Install main source code
disp('Please choose directory to install source code');
install_path = uigetdir([],'Please choose directory to install source code');

disp(['Installing source code to ' install_path]);
disp(['Downloading FruCloneClustering ...']);
unzip('https://github.com/jefferis/FruCloneClustering/zipball/master',install_path)
downloaded_file=dir(fullfile(install_path,'jefferis-FruCloneClustering*'));
if length(downloaded_file)~=1
	error('Unable to download FruCloneClustering - or old versions left over')
end
final_src_path=fullfile(install_path,'FruCloneClustering');
movefile(fullfile(install_path,downloaded_file.name),final_src_path);
addpath(fullfile(final_src_path,'src'));

% Install Support Code
disp(['Downloading MatlabSupport ...']);
unzip('https://github.com/jefferis/MatlabSupport/zipball/master',install_path)
downloaded_file=dir(fullfile(install_path,'jefferis-MatlabSupport*'));
if length(downloaded_file)~=1
	error('Unable to download MatlabSupport - or old versions left over')
end
final_support_path=fullfile(install_path,'MatlabSupport');
movefile(fullfile(install_path,downloaded_file.name),final_support_path);
addpath(genpath(final_support_path));

% Should we do this by default or leave it up to user to save
savepath

disp(['Now compiling source files']);
cd(fullfile(final_src_path,'src'));
Easy_Compile_Masse;
disp(['Now choose sample data to download - this could take a while!']);
Download_Sample_Data;

disp(['======================']);
disp(['Finished Installation!']);
disp(['Now check and save your Matlab path...']);
