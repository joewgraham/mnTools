% Add paths
% ------------------------------------

addpath(cd);
cd ..
homedirectory = cd;
addpath(homedirectory)
addpath(sprintf('%s%s%s',homedirectory,filesep,'mnData'));
addpath(sprintf('%s%s%s',homedirectory,filesep,'mnInput'));
addpath(sprintf('%s%s%s',homedirectory,filesep,'mnProgram'));
addpath(sprintf('%s%s%s%s%s',homedirectory,filesep,'mnProgram',filesep,'mnAnalyzer'));
addpath(sprintf('%s%s%s%s%s',homedirectory,filesep,'mnProgram',filesep,'mnCompare'));
addpath(sprintf('%s%s%s%s%s%s',homedirectory,filesep,'mnProgram',filesep,'mnCompare',filesep,'chenCompare'));
addpath(sprintf('%s%s%s%s%s',homedirectory,filesep,'mnProgram',filesep,'mnCompareFit'));
addpath(sprintf('%s%s%s%s%s',homedirectory,filesep,'mnProgram',filesep,'mnFigures'));
addpath(sprintf('%s%s%s%s%s',homedirectory,filesep,'mnProgram',filesep,'mnTables'));
addpath(sprintf('%s%s%s%s%s',homedirectory,filesep,'mnProgram',filesep,'mnGenerator'));
addpath(sprintf('%s%s%s%s%s',homedirectory,filesep,'mnProgram',filesep,'mnPort'));
addpath(sprintf('%s%s%s%s%s',homedirectory,filesep,'mnProgram',filesep,'mnFitter'));
addpath(sprintf('%s%s%s%s%s',homedirectory,filesep,'mnProgram',filesep,'mnTestCode'));
%javaaddpath({'/opt/BBP-SDK/trunk/lib/libbbp_sdk_java.jar'});
%savepath;

%cd('/opt/BBP-SDK/trunk/lib/');
%import bbp.*;
cd(homedirectory);

clear homedirectory;
