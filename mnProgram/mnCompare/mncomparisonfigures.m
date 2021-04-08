function mncomparisonfigures(controlanalysis,testanalysis)

[helppath,addpaths] = fileparts(which('mnaddpaths.m'));
cd(helppath);
cd ..
mnhome = cd;

warning('off', 'MATLAB:divideByZero');
warning('off', 'MATLAB:Axes:NegativeDataInLogAxis');

disp(' ');
disp('  ------------------------------------');
disp('   Figures & Tables started.');
disp('  ------------------------------------');

disp('   Generating ...');

disp('     Parameter Distribution Figures.');
try parameterdistributionfigures(controlanalysis,testanalysis);
catch exception; disp('       Failed to produce figure.'); end
try parameterdistributionboxplots(controlanalysis,testanalysis);
catch exception; disp('       Failed to produce figure.'); end
try diameterhistogram(controlanalysis,testanalysis);
catch exception; disp('       Failed to produce figure.'); end
try branchbiftermprobfigure(controlanalysis,testanalysis);
catch exception; disp('       Failed to produce figure.'); end
try biftermprobfigures(controlanalysis,testanalysis);
catch exception; disp('       Failed to produce figure.'); end
try inputparameterfigures(controlanalysis,testanalysis);
catch exception; disp('       Failed to produce figure.'); end
close all;

disp('     Branching Parameters Figures.');
try branchingfigures(controlanalysis,testanalysis);
catch exception; disp('       Failed to produce figure.'); end
close all;

disp('     Diameter Figures.');
try diameterfigures(controlanalysis,testanalysis);
catch exception; disp('       Failed to produce figure.'); end
close all;

disp('     Taper Rate Figures.');
try taperratefigures(controlanalysis,testanalysis);
catch exception; disp('       Failed to produce figure.'); end
close all;

disp('     Rall Ratio Figures.');
try rallratiofigures(controlanalysis,testanalysis);
catch exception; disp('       Failed to produce figure.'); end
close all;

disp('     Parent/Daughter Ratio Figures.');
try parentdaughterratiofigures(controlanalysis,testanalysis);
catch exception; disp('       Failed to produce figure.'); end
close all;

disp('     Daughter Ratio Figures.');
try daughterratiofigures(controlanalysis,testanalysis);
catch exception; disp('       Failed to produce figure.'); end
close all;

disp('     Branch Probability Figures.');
try biftermprobfigures(controlanalysis,testanalysis);
catch exception; disp('       Failed to produce figure.'); end
close all;

disp('     Morphometrics Figures ');

try allbiftermfigures(controlanalysis,testanalysis);
catch exception; disp('       Failed to produce figure.'); end
try allbiftermfigure2s(controlanalysis,testanalysis);
catch exception; disp('       Failed to produce figure.'); end

disp('       vs Soma Diameter.');
try somadiameterfigures(controlanalysis,testanalysis);
catch exception; disp('       Failed to produce figure.'); end
close all;

disp('       vs Primary Dendrite Diameter.');
try primarydendritefigures(controlanalysis,testanalysis);
catch exception; disp('       Failed to produce figure.'); end
try primarydendritefigures_cyl(controlanalysis,testanalysis);
catch exception; disp('       Failed to produce figure.'); end
close all;

disp('       vs Local Diameter.');
try vsdiameterfigures(controlanalysis,testanalysis);
catch exception; disp('       Failed to produce figure.'); end
try vsdiameterfiguressemilog(controlanalysis,testanalysis);
catch exception; disp('       Failed to produce figure.'); end
try vsdiameterfiguresloglog(controlanalysis,testanalysis);
catch exception; disp('       Failed to produce figure.'); end
try vsdiameter2figures(controlanalysis,testanalysis);
catch exception; disp('       Failed to produce figure.'); end
try vsdiameter2figuressemilog(controlanalysis,testanalysis);
catch exception; disp('       Failed to produce figure.'); end
try vsdiameter2figuresloglog(controlanalysis,testanalysis);
catch exception; disp('       Failed to produce figure.'); end
try biftermdiameterfigures(controlanalysis,testanalysis);
catch exception; disp('       Failed to produce figure.'); end
try biftermdiameterfiguressemilogx(controlanalysis,testanalysis);
catch exception; disp('       Failed to produce figure.'); end
try biftermdiameterfiguressemilogy(controlanalysis,testanalysis);
catch exception; disp('       Failed to produce figure.'); end
try biftermdiameterfiguresloglog(controlanalysis,testanalysis);
catch exception; disp('       Failed to produce figure.'); end
try bifdiameterfigures(controlanalysis,testanalysis);
catch exception; disp('       Failed to produce figure.'); end
try bifdiameterfiguressemilogx(controlanalysis,testanalysis);
catch exception; disp('       Failed to produce figure.'); end
try bifdiameterfiguressemilogy(controlanalysis,testanalysis);
catch exception; disp('       Failed to produce figure.'); end
try bifdiameterfiguresloglog(controlanalysis,testanalysis);
catch exception; disp('       Failed to produce figure.'); end

try biftermdiametertaperfigures(controlanalysis,testanalysis);
catch exception; disp('       Failed to produce figure.'); end

try piecetaperratefigures(controlanalysis,testanalysis);
catch exception; disp('       Failed to produce figure.'); end
try piecerallratiofigures(controlanalysis,testanalysis);
catch exception; disp('       Failed to produce figure.'); end
try piecedaughterratiofigures(controlanalysis,testanalysis);
catch exception; disp('       Failed to produce figure.'); end
try cablefigures(controlanalysis,testanalysis);
catch exception; disp('       Failed to produce figure.'); end

close all;

disp('       vs Branch Order.');
try branchorderfigures(controlanalysis,testanalysis);
catch exception; disp('       Failed to produce figure.'); end
try biftermbranchorderfigures1(controlanalysis,testanalysis);
catch exception; disp('       Failed to produce figure.'); end
try biftermbranchorderfigures2(controlanalysis,testanalysis);
catch exception; disp('       Failed to produce figure.'); end
try bifbranchorderfigures(controlanalysis,testanalysis);
catch exception; disp('       Failed to produce figure.'); end
try biftermbranchordertaperfigures(controlanalysis,testanalysis);
catch exception; disp('       Failed to produce figure.'); end
close all;

disp('       vs Degree.');
try degreefigures(controlanalysis,testanalysis);
catch exception; disp('       Failed to produce figure.'); end
try biftermdegreefigures1(controlanalysis,testanalysis);
catch exception; disp('       Failed to produce figure.'); end
try biftermdegreefigures2(controlanalysis,testanalysis);
catch exception; disp('       Failed to produce figure.'); end
try bifdegreefigures(controlanalysis,testanalysis);
catch exception; disp('       Failed to produce figure.'); end
close all;

disp('       vs Path Length from Soma.');
try pathlengthfigures(controlanalysis,testanalysis);
catch exception; disp('       Failed to produce figure.'); end
try biftermpathlengthfigures(controlanalysis,testanalysis);
catch exception; disp('       Failed to produce figure.'); end
try bifpathlengthfigures(controlanalysis,testanalysis);
catch exception; disp('       Failed to produce figure.'); end
try biftermpathlengthtaperfigures(controlanalysis,testanalysis);
catch exception; disp('       Failed to produce figure.'); end
close all;

disp('       vs Radial Distance from Soma.');
try radialdistancefigures(controlanalysis,testanalysis);
catch exception; disp('       Failed to produce figure.'); end
try biftermradialdistancefigures(controlanalysis,testanalysis);
catch exception; disp('       Failed to produce figure.'); end
try bifradialdistancefigures(controlanalysis,testanalysis);
catch exception; disp('       Failed to produce figure.'); end
close all;

disp('       vs Branch Length.');
try pathlengthfigures(controlanalysis,testanalysis);
catch exception; disp('       Failed to produce figure.'); end
try biftermbranchlengthfigures(controlanalysis,testanalysis);
catch exception; disp('       Failed to produce figure.'); end
try bifbranchlengthfigures(controlanalysis,testanalysis);
catch exception; disp('       Failed to produce figure.'); end
try biftermbranchlengthtaperfigures(controlanalysis,testanalysis);
catch exception; disp('       Failed to produce figure.'); end
close all;


cd(mnhome);

warning('on', 'MATLAB:divideByZero');
warning('on', 'MATLAB:Axes:NegativeDataInLogAxis');

disp('  ------------------------------------');
disp('   Figures & Tables completed.');
disp('  ------------------------------------');
disp(' ');