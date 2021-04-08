function mnfigures(controlanalysis,testanalysis)

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
    try parameterdistributionfigures(controlanalysis);
    catch exception; disp('       Failed to produce figure.'); end
    close all;
    %03
    try segmentnumberhistograms(controlanalysis);
    catch exception; disp('       Failed to produce figure.'); end
    close all;
    %04
    try branchtypeprobfigures(controlanalysis);
    catch exception; disp('       Failed to produce figure.'); end
    close all;
    %05(1-3)
    try branchendingprobfigures(controlanalysis);
    catch exception; disp('       Failed to produce figure.'); end
    close all;
    try branchendingprobfigures_bif(controlanalysis);
    catch exception; disp('       Failed to produce figure.'); end
    close all;
    %05(4-6)
    try burkebranchendingprobfigures(controlanalysis);
    catch exception; disp('       Failed to produce figure.'); end
    close all;
    disp('     Morphometrics Figures ');
    disp('       vs Soma Diameter.');
    %06
    try somadiameterfigures(controlanalysis);
    catch exception; disp('       Failed to produce figure.'); end
    try somacsafigures(controlanalysis);
    catch exception; disp('       Failed to produce figure.'); end
    try somavolumefigures(controlanalysis);
    catch exception; disp('       Failed to produce figure.'); end
    close all;
    %07
    disp('       vs Primary Dendrite Diameter.');
    try centroidtotrunkdirectionhistograms(controlanalysis);
    catch exception; disp('       Failed to produce figure.'); end
    close all;
    try trunksizefigures(controlanalysis);
    catch exception; disp('       Failed to produce figure.'); end
    close all;
    try trunkdistancefigures(controlanalysis);
    catch exception; disp('       Failed to produce figure.'); end
    close all;
    try trunkpositionfigures(controlanalysis);
    catch exception; disp('       Failed to produce figure.'); end
    close all;
    try trunkdirectionfigures(controlanalysis);
    catch exception; disp('       Failed to produce figure.'); end
    close all;
    try trunkdirectionhistograms(controlanalysis);
    catch exception; disp('       Failed to produce figure.'); end
    close all;
    try trunkdirectionfigures2(controlanalysis);
    catch exception; disp('       Failed to produce figure.'); end
    close all;
    try trunkdirectionfigures3(controlanalysis);
    catch exception; disp('       Failed to produce figure.'); end
    close all;
    disp('       vs Local Diameter.');
    %08
    try diameterfigures1(controlanalysis);
    catch exception; disp('       Failed to produce figure.'); end
    close all;
    %09
    try diameterfigures2(controlanalysis);
    catch exception; disp('       Failed to produce figure.'); end
    close all;
    disp('       vs Path Length from Soma.');
    %10
    try pathlengthfigures1(controlanalysis);
    catch exception; disp('       Failed to produce figure.'); end
    close all;
    %11
    try pathlengthfigures2(controlanalysis);
    catch exception; disp('       Failed to produce figure.'); end
    close all;
    disp('       vs Radial Distance from Soma.');
    %12
    try radialdistancefigures1(controlanalysis);
    catch exception; disp('       Failed to produce figure.'); end
    close all;
    %13
    try radialdistancefigures2(controlanalysis);
    catch exception; disp('       Failed to produce figure.'); end
    close all;
    disp('       vs Branch Length.');
    %14
    try branchlengthfigures1(controlanalysis);
    catch exception; disp('       Failed to produce figure.'); end
    close all;
    %15
    try branchlengthfigures2(controlanalysis);
    catch exception; disp('       Failed to produce figure.'); end
    close all;
    disp('       vs Branch Order.');
    %16
    try branchorderfigures1(controlanalysis);
    catch exception; disp('       Failed to produce figure.'); end
    close all;
    %17
    try branchorderfigures2(controlanalysis);
    catch exception; disp('       Failed to produce figure.'); end
    close all;
    %18
    try branchorderfigures3(controlanalysis);
    catch exception; disp('       Failed to produce figure.'); end
    close all;
    disp('       vs Degree.');
    %19
    try degreefigures1(controlanalysis);
    catch exception; disp('       Failed to produce figure.'); end
    close all;
    %20
    try degreefigures2(controlanalysis);
    catch exception; disp('       Failed to produce figure.'); end
    close all;
    %21
    try degreefigures3(controlanalysis);
    catch exception; disp('       Failed to produce figure.'); end
    close all;
    %22
    try branchingparametersscatterplots(controlanalysis);
    catch exception; disp('       Failed to produce figure.'); end
    close all;
    %23
    try cableanalysisfigures(controlanalysis);
    catch exception; disp('       Failed to produce figure.'); end
    close all;
    try cableanalysisfigures_lognormal(controlanalysis);
    catch exception; disp('       Failed to produce figure.'); end
    close all;
	%24
	try cablepropertyfigures(controlanalysis);
    catch exception; disp('       Failed to produce figure.'); end
	close all;
    %25
    try taperratescatterplots(controlanalysis);
    catch exception; disp('       Failed to produce figure.'); end
    close all;
    
else
    disp('     Parameter Distribution Figures.');
    %01
    try parameterdistributionfigures(controlanalysis,testanalysis);
    catch exception; disp('       Failed to produce figure.'); end
    close all;
    %02
    try parameterdistributionboxplots(controlanalysis,testanalysis);
    catch exception; disp('       Failed to produce figure.'); end
    close all;
    %03
    try segmentnumberhistograms(controlanalysis,testanalysis);
    catch exception; disp('       Failed to produce figure.'); end
    close all;
    %04
    try branchtypeprobfigures(controlanalysis,testanalysis);
    catch exception; disp('       Failed to produce figure.'); end
    close all;
    %05(1-3)
    try branchendingprobfigures(controlanalysis,testanalysis);
    catch exception; disp('       Failed to produce figure.'); end
    close all;
    try branchendingprobfigures_bif(controlanalysis,testanalysis);
    catch exception; disp('       Failed to produce figure.'); end
    close all;
    %05(4-6)
    try burkebranchendingprobfigures(controlanalysis,testanalysis);
    catch exception; disp('       Failed to produce figure.'); end
    close all;
    disp('     Morphometrics Figures ');
    disp('       vs Soma Diameter.');
    %06
    try somadiameterfigures(controlanalysis,testanalysis);
    catch exception; disp('       Failed to produce figure.'); end
    try somacsafigures(controlanalysis,testanalysis);
    catch exception; disp('       Failed to produce figure.'); end
    try somavolumefigures(controlanalysis,testanalysis);
    catch exception; disp('       Failed to produce figure.'); end
    close all;
    %07
    disp('       vs Primary Dendrite Diameter.');
    try centroidtotrunkdirectionhistograms(controlanalysis,testanalysis);
    catch exception; disp('       Failed to produce figure.'); end
    close all;
    try trunksizefigures(controlanalysis,testanalysis);
    catch exception; disp('       Failed to produce figure.'); end
    close all;
    try trunkdistancefigures(controlanalysis,testanalysis);
    catch exception; disp('       Failed to produce figure.'); end
    close all;
    try trunkpositionfigures(controlanalysis,testanalysis);
    catch exception; disp('       Failed to produce figure.'); end
    close all;
    try trunkdirectionfigures(controlanalysis,testanalysis);
    catch exception; disp('       Failed to produce figure.'); end
    close all;
    try trunkdirectionhistograms(controlanalysis,testanalysis);
    catch exception; disp('       Failed to produce figure.'); end
    close all;
    try trunkdirectionfigures2(controlanalysis,testanalysis);
    catch exception; disp('       Failed to produce figure.'); end
    close all;
    try trunkdirectionfigures3(controlanalysis,testanalysis);
    catch exception; disp('       Failed to produce figure.'); end
    close all;
    disp('       vs Local Diameter.');
    %08
    try diameterfigures1(controlanalysis,testanalysis);
    catch exception; disp('       Failed to produce figure.'); end
    close all;
    %09
    try diameterfigures2(controlanalysis,testanalysis);
    catch exception; disp('       Failed to produce figure.'); end
    close all;
    disp('       vs Path Length from Soma.');
    %10
    try pathlengthfigures1(controlanalysis,testanalysis);
    catch exception; disp('       Failed to produce figure.'); end
    close all;
    %11
    try pathlengthfigures2(controlanalysis,testanalysis);
    catch exception; disp('       Failed to produce figure.'); end
    close all;
    disp('       vs Radial Distance from Soma.');
    %12
    try radialdistancefigures1(controlanalysis,testanalysis);
    catch exception; disp('       Failed to produce figure.'); end
    close all;
    %13
    try radialdistancefigures2(controlanalysis,testanalysis);
    catch exception; disp('       Failed to produce figure.'); end
    close all;
    disp('       vs Branch Length.');
    %14
    try branchlengthfigures1(controlanalysis,testanalysis);
    catch exception; disp('       Failed to produce figure.'); end
    close all;
    %15
    try branchlengthfigures2(controlanalysis,testanalysis);
    catch exception; disp('       Failed to produce figure.'); end
    close all;
    disp('       vs Branch Order.');
    %16
    try branchorderfigures1(controlanalysis,testanalysis);
    catch exception; disp('       Failed to produce figure.'); end
    close all;
    %17
    try branchorderfigures2(controlanalysis,testanalysis);
    catch exception; disp('       Failed to produce figure.'); end
    close all;
    %18
    try branchorderfigures3(controlanalysis,testanalysis);
    catch exception; disp('       Failed to produce figure.'); end
    close all;
    disp('       vs Degree.');
    %19
    try degreefigures1(controlanalysis,testanalysis);
    catch exception; disp('       Failed to produce figure.'); end
    close all;
    %20
    try degreefigures2(controlanalysis,testanalysis);
    catch exception; disp('       Failed to produce figure.'); end
    close all;
    %21
    try degreefigures3(controlanalysis,testanalysis);
    catch exception; disp('       Failed to produce figure.'); end
    close all;
    %22
    try branchingparametersscatterplots(controlanalysis,testanalysis);
    catch exception; disp('       Failed to produce figure.'); end
    close all;
    %23
    try cableanalysisfigures(controlanalysis,testanalysis);
    catch exception; disp('       Failed to produce figure.'); end
    close all;
    try cableanalysisfigures_lognormal(controlanalysis,testanalysis);
    catch exception; disp('       Failed to produce figure.'); end
    close all;
    try cableanalysisboxplots(controlanalysis,testanalysis);
    catch exception; disp('       Failed to produce figure.'); end
    close all;
	%24
	try cablepropertyfigures(controlanalysis,testanalysis);
    catch exception; disp('       Failed to produce figure.'); end
	close all;
    %25
    try taperratescatterplots(controlanalysis,testanalysis);
    catch exception; disp('       Failed to produce figure.'); end
    close all;
    
end


disp('    Summary Tables.');
try summarytable_ind(controlanalysis);
catch exception; disp('       Failed to produce table.'); end
try summarytable(controlanalysis);
catch exception; disp('       Failed to produce table.'); end

disp('    Primary Dendrite Table.');
try primarydendritetable(controlanalysis);
catch exception; disp('       Failed to produce table.'); end

disp('    Branch Order Table.');
try branchordertable(controlanalysis);
catch exception; disp('       Failed to produce table.'); end

cd(mnhome);

warning('on', 'MATLAB:divideByZero');
warning('on', 'MATLAB:Axes:NegativeDataInLogAxis');
warning('on', 'stats:glmfit:IterationLimit');

disp('  ------------------------------------');
disp('   Figures & Tables completed.');
disp('  ------------------------------------');
disp(' ');