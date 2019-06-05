function mnfigures(controlanalysis,testanalysis,extent)

[helppath,addpaths] = fileparts(which('mnaddpaths.m'));
cd(helppath);
cd ..
mnhome = cd;
mnoptions;

warning('off', 'MATLAB:divideByZero');
warning('off', 'MATLAB:Axes:NegativeDataInLogAxis');
warning('off', 'stats:glmfit:IterationLimit');

disp(' ');
disp('  ------------------------------------');
disp('   Figures & Tables started.');
disp('  ------------------------------------');

disp('   Generating ...');

if nargin == 1
    disp('     Parameter Distribution Figures.');
    %01
    parameterdistributionfigures(controlanalysis);
    close all;
    %03
    segmentnumberhistograms(controlanalysis);
    close all;
    %04
    branchtypeprobfigures(controlanalysis);
    close all;
    %05(1-3)
    branchendingprobfigures(controlanalysis);
    close all;
    %05(4-6)
    burkebranchendingprobfigures(controlanalysis);
    close all;
    disp('     Morphometrics Figures ');
    disp('       vs Soma Diameter.');
    %06
    somasizefigures(controlanalysis);
    close all;
    %07
    disp('       vs Primary Dendrite Diameter.');
    trunksizefigures(controlanalysis);
    close all;
    disp('       vs Local Diameter.');
    %08
    diameterfigures1(controlanalysis);
    close all;
    %09
    diameterfigures2(controlanalysis);
    close all;
    disp('       vs Path Length from Soma.');
    %10
    pathlengthfigures1(controlanalysis);
    close all;
    %11
    pathlengthfigures2(controlanalysis);
    close all;
    disp('       vs Radial Distance from Soma.');
    %12
    radialdistancefigures1(controlanalysis);
    close all;
    %13
    radialdistancefigures2(controlanalysis);
    close all;
    disp('       vs Branch Length.');
    %14
    branchlengthfigures1(controlanalysis);
    close all;
    %15
    branchlengthfigures2(controlanalysis);
    close all;
    disp('       vs Branch Order.');
    %16
    branchorderfigures1(controlanalysis);
    close all;
    %17
    branchorderfigures2(controlanalysis);
    close all;
    %18
    branchorderfigures3(controlanalysis);
    close all;
    disp('       vs Degree.');
    %19
    degreefigures1(controlanalysis);
    close all;
    %20
    degreefigures2(controlanalysis);
    close all;
    %21
    degreefigures3(controlanalysis);
    close all;
    %22
    branchingparametersscatterplots(controlanalysis);
    close all;
    %23
    cableanalysisfigures(controlanalysis);
    close all;
    
else
    disp('     Parameter Distribution Figures.');
    %01
    %parameterdistributionfigures(controlanalysis,testanalysis);
    close all;
    %02
    parameterdistributionboxplots(controlanalysis,testanalysis);
    close all;
    %03
    segmentnumberhistograms(controlanalysis,testanalysis);
    close all;
    %04
    branchtypeprobfigures(controlanalysis,testanalysis);
    close all;
    %05(1-3)
    branchendingprobfigures(controlanalysis,testanalysis);
    close all;
    %05(4-6)
    %burkebranchendingprobfigures(controlanalysis,testanalysis);
    close all;
    disp('     Morphometrics Figures ');
    disp('       vs Soma Diameter.');
    %06
    %somasizefigures(controlanalysis,testanalysis);
    close all;
    %07
    disp('       vs Primary Dendrite Diameter.');
    trunksizefigures(controlanalysis,testanalysis);
    close all;
    disp('       vs Local Diameter.');
    %08
    diameterfigures1(controlanalysis,testanalysis);
    close all;
    %09
    diameterfigures2(controlanalysis,testanalysis,'quick');
    close all;
    disp('       vs Path Length from Soma.');
    %10
    pathlengthfigures1(controlanalysis,testanalysis,'quick');
    close all;
    %11
    pathlengthfigures2(controlanalysis,testanalysis,'quick');
    close all;
    disp('       vs Radial Distance from Soma.');
    %12
    radialdistancefigures1(controlanalysis,testanalysis,'quick');
    close all;
    %13
    radialdistancefigures2(controlanalysis,testanalysis,'quick');
    close all;
    disp('       vs Branch Length.');
    %14
    branchlengthfigures1(controlanalysis,testanalysis,'quick');
    close all;
    %15
    branchlengthfigures2(controlanalysis,testanalysis,'quick');
    close all;
    disp('       vs Branch Order.');
    %16
    branchorderfigures1(controlanalysis,testanalysis,'quick');
    close all;
    %17
    branchorderfigures2(controlanalysis,testanalysis,'quick');
    close all;
    %18
    branchorderfigures3(controlanalysis,testanalysis,'quick');
    close all;
    disp('       vs Degree.');
    %19
    degreefigures1(controlanalysis,testanalysis,'quick');
    close all;
    %20
    degreefigures2(controlanalysis,testanalysis,'quick');
    close all;
    %21
    degreefigures3(controlanalysis,testanalysis,'quick');
    close all;
    %22
    branchingparametersscatterplots(controlanalysis,testanalysis);
    close all;
    %23
    %cableanalysisfigures(controlanalysis,testanalysis);
    close all;
    cableanalysisboxplots(controlanalysis,testanalysis);
    close all;
	%24
	cablepropertyfigures(controlanalysis,testanalysis);
	close all;
    
end


% disp('    Summary Tables.');
% summarytable_ind(controlanalysis);
% summarytable(controlanalysis);
%
% disp('    Primary Dendrite Table.');
% primarydendritetable(controlanalysis);
%
% disp('    Branch Order Table.');
% branchordertable(controlanalysis);

cd(mnhome);

warning('on', 'MATLAB:divideByZero');
warning('on', 'MATLAB:Axes:NegativeDataInLogAxis');
warning('on', 'stats:glmfit:IterationLimit');

disp('  ------------------------------------');
disp('   Figures & Tables completed.');
disp('  ------------------------------------');
disp(' ');