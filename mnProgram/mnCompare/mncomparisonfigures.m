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
parameterdistributionfigures(controlanalysis,testanalysis);
%parameterdistributionboxplots(controlanalysis,testanalysis);
diameterhistogram(controlanalysis,testanalysis);
branchbiftermprobfigure(controlanalysis,testanalysis);
biftermprobfigures(controlanalysis,testanalysis);
%inputparameterfigures(controlanalysis,testanalysis);
close all;

% disp('     Branching Parameters Figures.');
% branchingfigures(controlanalysis,testanalysis);
% close all;

% disp('     Diameter Figures.');
% diameterfigures(controlanalysis,testanalysis);
% close all;
% 
% disp('     Taper Rate Figures.');
% taperratefigures(controlanalysis,testanalysis);
% close all;
% 
% disp('     Rall Ratio Figures.');
% rallratiofigures(controlanalysis,testanalysis);
% close all;
% 
% disp('     Parent/Daughter Ratio Figures.');
% parentdaughterratiofigures(controlanalysis,testanalysis);
% close all;
% 
% disp('     Daughter Ratio Figures.');
% daughterratiofigures(controlanalysis,testanalysis);
% close all;
% 
% disp('     Branch Probability Figures.');
% biftermprobfigures(controlanalysis,testanalysis);
% close all;

disp('     Morphometrics Figures ');

%allbiftermfigures(controlanalysis,testanalysis);
%allbiftermfigure2s(controlanalysis,testanalysis);


disp('       vs Soma Diameter.');
somadiameterfigures(controlanalysis,testanalysis);
close all;

disp('       vs Primary Dendrite Diameter.');
primarydendritefigures(controlanalysis,testanalysis);
%primarydendritefigures_cyl(controlanalysis,testanalysis);
close all;

disp('       vs Local Diameter.');
% vsdiameterfigures(controlanalysis,testanalysis);
% vsdiameterfiguressemilog(controlanalysis,testanalysis);
% vsdiameterfiguresloglog(controlanalysis,testanalysis);
% vsdiameter2figures(controlanalysis,testanalysis);
% vsdiameter2figuressemilog(controlanalysis,testanalysis);
% vsdiameter2figuresloglog(controlanalysis,testanalysis);
biftermdiameterfigures(controlanalysis,testanalysis);
biftermdiameterfiguressemilogx(controlanalysis,testanalysis);
biftermdiameterfiguressemilogy(controlanalysis,testanalysis);
biftermdiameterfiguresloglog(controlanalysis,testanalysis);
bifdiameterfigures(controlanalysis,testanalysis);
bifdiameterfiguressemilogx(controlanalysis,testanalysis);
bifdiameterfiguressemilogy(controlanalysis,testanalysis);
bifdiameterfiguresloglog(controlanalysis,testanalysis);

%biftermdiametertaperfigures(controlanalysis,testanalysis);


piecetaperratefigures(controlanalysis,testanalysis);
piecerallratiofigures(controlanalysis,testanalysis);
piecedaughterratiofigures(controlanalysis,testanalysis);
cablefigures(controlanalysis,testanalysis);

close all;


disp('       vs Branch Order.');
%branchorderfigures(controlanalysis,testanalysis);
biftermbranchorderfigures1(controlanalysis,testanalysis);
biftermbranchorderfigures2(controlanalysis,testanalysis);
bifbranchorderfigures(controlanalysis,testanalysis);
%biftermbranchordertaperfigures(controlanalysis,testanalysis);
close all;

disp('       vs Degree.');
%degreefigures(controlanalysis,testanalysis);
biftermdegreefigures1(controlanalysis,testanalysis);
biftermdegreefigures2(controlanalysis,testanalysis);
bifdegreefigures(controlanalysis,testanalysis);
close all;

disp('       vs Path Length from Soma.');
%pathlengthfigures(controlanalysis,testanalysis);
biftermpathlengthfigures(controlanalysis,testanalysis);
bifpathlengthfigures(controlanalysis,testanalysis);
%biftermpathlengthtaperfigures(controlanalysis,testanalysis);
close all;

disp('       vs Radial Distance from Soma.');
%radialdistancefigures(controlanalysis,testanalysis);
biftermradialdistancefigures(controlanalysis,testanalysis);
bifradialdistancefigures(controlanalysis,testanalysis);
close all;

disp('       vs Branch Length.');
%pathlengthfigures(controlanalysis,testanalysis);
biftermbranchlengthfigures(controlanalysis,testanalysis);
bifbranchlengthfigures(controlanalysis,testanalysis);
%biftermbranchlengthtaperfigures(controlanalysis,testanalysis);
close all;


cd(mnhome);

warning('on', 'MATLAB:divideByZero');
warning('on', 'MATLAB:Axes:NegativeDataInLogAxis');

disp('  ------------------------------------');
disp('   Figures & Tables completed.');
disp('  ------------------------------------');
disp(' ');