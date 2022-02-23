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

if nargin == 1

	disp('     Parameter Distribution Figures.');
	try parameterdistributionfigures(controlanalysis);
	catch exception; disp('       Failed to produce figure. 1/6'); end
	try parameterdistributionboxplots(controlanalysis);
	catch exception; disp('       Failed to produce figure. 2/6'); end
	try diameterhistogram(controlanalysis);
	catch exception; disp('       Failed to produce figure. 3/6'); end
	try branchbiftermprobfigure(controlanalysis);
	catch exception; disp('       Failed to produce figure. 4/6'); end
	try biftermprobfigures(controlanalysis);
	catch exception; disp('       Failed to produce figure. 5/6'); end
	try inputparameterfigures(controlanalysis);
	catch exception; disp('       Failed to produce figure. 6/6'); end
	close all;

	% disp('     Branching Parameters Figures.');
	% try branchingfigures(controlanalysis);
	% catch exception; disp('       Failed to produce figure. 1/1'); end
	% close all;

	% disp('     Diameter Figures.');
	% try diameterfigures(controlanalysis);
	% catch exception; disp('       Failed to produce figure. 1/1'); end
	% close all;

	% disp('     Taper Rate Figures.');
	% try taperratefigures(controlanalysis);
	% catch exception; disp('       Failed to produce figure. 1/1'); end
	% close all;

	% disp('     Rall Ratio Figures.');
	% try rallratiofigures(controlanalysis);
	% catch exception; disp('       Failed to produce figure. 1/1'); end
	% close all;

	% disp('     Parent/Daughter Ratio Figures.');
	% try parentdaughterratiofigures(controlanalysis);
	% catch exception; disp('       Failed to produce figure. 1/1'); end
	% close all;

	% disp('     Daughter Ratio Figures.');
	% try daughterratiofigures(controlanalysis);
	% catch exception; disp('       Failed to produce figure. 1/1'); end
	% close all;

	% disp('     Branch Probability Figures.');
	% try biftermprobfigures(controlanalysis);
	% catch exception; disp('       Failed to produce figure. 1/1'); end
	% close all;

	% disp('     Morphometrics Figures ');

	% try allbiftermfigures(controlanalysis);
	% catch exception; disp('       Failed to produce figure. 1/2'); end
	% try allbiftermfigure2s(controlanalysis);
	% catch exception; disp('       Failed to produce figure. 2/2'); end

	% disp('       vs Soma Diameter.');
	% try somadiameterfigures(controlanalysis);
	% catch exception; disp('       Failed to produce figure. 1/2'); end
	% close all;

	% disp('       vs Primary Dendrite Diameter.');
	% try primarydendritefigures(controlanalysis);
	% catch exception; disp('       Failed to produce figure. 1/2'); end
	% try primarydendritefigures_cyl(controlanalysis);
	% catch exception; disp('       Failed to produce figure. 2/2'); end
	% close all;

	% disp('       vs Local Diameter.');
	% try vsdiameterfigures(controlanalysis);
	% catch exception; disp('       Failed to produce figure. 1/19'); end
	% try vsdiameterfiguressemilog(controlanalysis);
	% catch exception; disp('       Failed to produce figure. 2/19'); end
	% try vsdiameterfiguresloglog(controlanalysis);
	% catch exception; disp('       Failed to produce figure. 3/19'); end
	% try vsdiameter2figures(controlanalysis);
	% catch exception; disp('       Failed to produce figure. 4/19'); end
	% try vsdiameter2figuressemilog(controlanalysis);
	% catch exception; disp('       Failed to produce figure. 5/19'); end
	% try vsdiameter2figuresloglog(controlanalysis);
	% catch exception; disp('       Failed to produce figure. 6/19'); end
	% try biftermdiameterfigures(controlanalysis);
	% catch exception; disp('       Failed to produce figure. 7/19'); end
	% try biftermdiameterfiguressemilogx(controlanalysis);
	% catch exception; disp('       Failed to produce figure. 8/19'); end
	% try biftermdiameterfiguressemilogy(controlanalysis);
	% catch exception; disp('       Failed to produce figure. 9/19'); end
	% try biftermdiameterfiguresloglog(controlanalysis);
	% catch exception; disp('       Failed to produce figure. 10/19'); end
	% try bifdiameterfigures(controlanalysis);
	% catch exception; disp('       Failed to produce figure. 11/19'); end
	% try bifdiameterfiguressemilogx(controlanalysis);
	% catch exception; disp('       Failed to produce figure. 12/19'); end
	% try bifdiameterfiguressemilogy(controlanalysis);
	% catch exception; disp('       Failed to produce figure. 13/19'); end
	% try bifdiameterfiguresloglog(controlanalysis);
	% catch exception; disp('       Failed to produce figure. 14/19'); end
	% try biftermdiametertaperfigures(controlanalysis);
	% catch exception; disp('       Failed to produce figure. 15/19'); end
	% try piecetaperratefigures(controlanalysis);
	% catch exception; disp('       Failed to produce figure. 16/19'); end
	% try piecerallratiofigures(controlanalysis);
	% catch exception; disp('       Failed to produce figure. 17/19'); end
	% try piecedaughterratiofigures(controlanalysis);
	% catch exception; disp('       Failed to produce figure. 18/19'); end
	% try cablefigures(controlanalysis);
	% catch exception; disp('       Failed to produce figure. 19/19'); end

	% close all;

	% disp('       vs Branch Order.');
	% try branchorderfigures(controlanalysis);
	% catch exception; disp('       Failed to produce figure. 1/5'); end
	% try biftermbranchorderfigures1(controlanalysis);
	% catch exception; disp('       Failed to produce figure. 2/5'); end
	% try biftermbranchorderfigures2(controlanalysis);
	% catch exception; disp('       Failed to produce figure. 3/5'); end
	% try bifbranchorderfigures(controlanalysis);
	% catch exception; disp('       Failed to produce figure. 4/5'); end
	% try biftermbranchordertaperfigures(controlanalysis);
	% catch exception; disp('       Failed to produce figure. 5/5'); end
	% close all;

	% disp('       vs Degree.');
	% try degreefigures(controlanalysis);
	% catch exception; disp('       Failed to produce figure. 1/4'); end
	% try biftermdegreefigures1(controlanalysis);
	% catch exception; disp('       Failed to produce figure. 2/4'); end
	% try biftermdegreefigures2(controlanalysis);
	% catch exception; disp('       Failed to produce figure. 3/4'); end
	% try bifdegreefigures(controlanalysis);
	% catch exception; disp('       Failed to produce figure. 4/4'); end
	% close all;

	% disp('       vs Path Length from Soma.');
	% try pathlengthfigures(controlanalysis);
	% catch exception; disp('       Failed to produce figure. 1/4'); end
	% try biftermpathlengthfigures(controlanalysis);
	% catch exception; disp('       Failed to produce figure. 2/4'); end
	% try bifpathlengthfigures(controlanalysis);
	% catch exception; disp('       Failed to produce figure. 3/4'); end
	% try biftermpathlengthtaperfigures(controlanalysis);
	% catch exception; disp('       Failed to produce figure. 4/4'); end
	% close all;

	% disp('       vs Radial Distance from Soma.');
	% try radialdistancefigures(controlanalysis);
	% catch exception; disp('       Failed to produce figure. 1/3'); end
	% try biftermradialdistancefigures(controlanalysis);
	% catch exception; disp('       Failed to produce figure. 2/3'); end
	% try bifradialdistancefigures(controlanalysis);
	% catch exception; disp('       Failed to produce figure. 3/3'); end
	% close all;

	% disp('       vs Branch Length.');
	% try pathlengthfigures(controlanalysis);
	% catch exception; disp('       Failed to produce figure. 1/4'); end
	% try biftermbranchlengthfigures(controlanalysis);
	% catch exception; disp('       Failed to produce figure. 2/4'); end
	% try bifbranchlengthfigures(controlanalysis);
	% catch exception; disp('       Failed to produce figure. 3/4'); end
	% try biftermbranchlengthtaperfigures(controlanalysis);
	% catch exception; disp('       Failed to produce figure. 4/4'); end
	% close all;

else

	disp('     Parameter Distribution Figures.');
	try parameterdistributionfigures(controlanalysis,testanalysis);
	catch exception; disp('       Failed to produce figure. 1/6'); end
	try parameterdistributionboxplots(controlanalysis,testanalysis);
	catch exception; disp('       Failed to produce figure. 2/6'); end
	try diameterhistogram(controlanalysis,testanalysis);
	catch exception; disp('       Failed to produce figure. 3/6'); end
	try branchbiftermprobfigure(controlanalysis,testanalysis);
	catch exception; disp('       Failed to produce figure. 4/6'); end
	try biftermprobfigures(controlanalysis,testanalysis);
	catch exception; disp('       Failed to produce figure. 5/6'); end
	try inputparameterfigures(controlanalysis,testanalysis);
	catch exception; disp('       Failed to produce figure. 6/6'); end
	close all;

	% disp('     Branching Parameters Figures.');
	% try branchingfigures(controlanalysis,testanalysis);
	% catch exception; disp('       Failed to produce figure. 1/1'); end
	% close all;

	% disp('     Diameter Figures.');
	% try diameterfigures(controlanalysis,testanalysis);
	% catch exception; disp('       Failed to produce figure. 1/1'); end
	% close all;

	% disp('     Taper Rate Figures.');
	% try taperratefigures(controlanalysis,testanalysis);
	% catch exception; disp('       Failed to produce figure. 1/1'); end
	% close all;

	% disp('     Rall Ratio Figures.');
	% try rallratiofigures(controlanalysis,testanalysis);
	% catch exception; disp('       Failed to produce figure. 1/1'); end
	% close all;

	% disp('     Parent/Daughter Ratio Figures.');
	% try parentdaughterratiofigures(controlanalysis,testanalysis);
	% catch exception; disp('       Failed to produce figure. 1/1'); end
	% close all;

	% disp('     Daughter Ratio Figures.');
	% try daughterratiofigures(controlanalysis,testanalysis);
	% catch exception; disp('       Failed to produce figure. 1/1'); end
	% close all;

	% disp('     Branch Probability Figures.');
	% try biftermprobfigures(controlanalysis,testanalysis);
	% catch exception; disp('       Failed to produce figure. 1/1'); end
	% close all;

	% disp('     Morphometrics Figures ');

	% try allbiftermfigures(controlanalysis,testanalysis);
	% catch exception; disp('       Failed to produce figure. 1/2'); end
	% try allbiftermfigure2s(controlanalysis,testanalysis);
	% catch exception; disp('       Failed to produce figure. 2/2'); end

	% disp('       vs Soma Diameter.');
	% try somadiameterfigures(controlanalysis,testanalysis);
	% catch exception; disp('       Failed to produce figure. 1/2'); end
	% close all;

	% disp('       vs Primary Dendrite Diameter.');
	% try primarydendritefigures(controlanalysis,testanalysis);
	% catch exception; disp('       Failed to produce figure. 1/2'); end
	% try primarydendritefigures_cyl(controlanalysis,testanalysis);
	% catch exception; disp('       Failed to produce figure. 2/2'); end
	% close all;

	% disp('       vs Local Diameter.');
	% try vsdiameterfigures(controlanalysis,testanalysis);
	% catch exception; disp('       Failed to produce figure. 1/19'); end
	% try vsdiameterfiguressemilog(controlanalysis,testanalysis);
	% catch exception; disp('       Failed to produce figure. 2/19'); end
	% try vsdiameterfiguresloglog(controlanalysis,testanalysis);
	% catch exception; disp('       Failed to produce figure. 3/19'); end
	% try vsdiameter2figures(controlanalysis,testanalysis);
	% catch exception; disp('       Failed to produce figure. 4/19'); end
	% try vsdiameter2figuressemilog(controlanalysis,testanalysis);
	% catch exception; disp('       Failed to produce figure. 5/19'); end
	% try vsdiameter2figuresloglog(controlanalysis,testanalysis);
	% catch exception; disp('       Failed to produce figure. 6/19'); end
	% try biftermdiameterfigures(controlanalysis,testanalysis);
	% catch exception; disp('       Failed to produce figure. 7/19'); end
	% try biftermdiameterfiguressemilogx(controlanalysis,testanalysis);
	% catch exception; disp('       Failed to produce figure. 8/19'); end
	% try biftermdiameterfiguressemilogy(controlanalysis,testanalysis);
	% catch exception; disp('       Failed to produce figure. 9/19'); end
	% try biftermdiameterfiguresloglog(controlanalysis,testanalysis);
	% catch exception; disp('       Failed to produce figure. 10/19'); end
	% try bifdiameterfigures(controlanalysis,testanalysis);
	% catch exception; disp('       Failed to produce figure. 11/19'); end
	% try bifdiameterfiguressemilogx(controlanalysis,testanalysis);
	% catch exception; disp('       Failed to produce figure. 12/19'); end
	% try bifdiameterfiguressemilogy(controlanalysis,testanalysis);
	% catch exception; disp('       Failed to produce figure. 13/19'); end
	% try bifdiameterfiguresloglog(controlanalysis,testanalysis);
	% catch exception; disp('       Failed to produce figure. 14/19'); end
	% try biftermdiametertaperfigures(controlanalysis,testanalysis);
	% catch exception; disp('       Failed to produce figure. 15/19'); end
	% try piecetaperratefigures(controlanalysis,testanalysis);
	% catch exception; disp('       Failed to produce figure. 16/19'); end
	% try piecerallratiofigures(controlanalysis,testanalysis);
	% catch exception; disp('       Failed to produce figure. 17/19'); end
	% try piecedaughterratiofigures(controlanalysis,testanalysis);
	% catch exception; disp('       Failed to produce figure. 18/19'); end
	% try cablefigures(controlanalysis,testanalysis);
	% catch exception; disp('       Failed to produce figure. 19/19'); end

	% close all;

	% disp('       vs Branch Order.');
	% try branchorderfigures(controlanalysis,testanalysis);
	% catch exception; disp('       Failed to produce figure. 1/5'); end
	% try biftermbranchorderfigures1(controlanalysis,testanalysis);
	% catch exception; disp('       Failed to produce figure. 2/5'); end
	% try biftermbranchorderfigures2(controlanalysis,testanalysis);
	% catch exception; disp('       Failed to produce figure. 3/5'); end
	% try bifbranchorderfigures(controlanalysis,testanalysis);
	% catch exception; disp('       Failed to produce figure. 4/5'); end
	% try biftermbranchordertaperfigures(controlanalysis,testanalysis);
	% catch exception; disp('       Failed to produce figure. 5/5'); end
	% close all;

	% disp('       vs Degree.');
	% try degreefigures(controlanalysis,testanalysis);
	% catch exception; disp('       Failed to produce figure. 1/4'); end
	% try biftermdegreefigures1(controlanalysis,testanalysis);
	% catch exception; disp('       Failed to produce figure. 2/4'); end
	% try biftermdegreefigures2(controlanalysis,testanalysis);
	% catch exception; disp('       Failed to produce figure. 3/4'); end
	% try bifdegreefigures(controlanalysis,testanalysis);
	% catch exception; disp('       Failed to produce figure. 4/4'); end
	% close all;

	% disp('       vs Path Length from Soma.');
	% try pathlengthfigures(controlanalysis,testanalysis);
	% catch exception; disp('       Failed to produce figure. 1/4'); end
	% try biftermpathlengthfigures(controlanalysis,testanalysis);
	% catch exception; disp('       Failed to produce figure. 2/4'); end
	% try bifpathlengthfigures(controlanalysis,testanalysis);
	% catch exception; disp('       Failed to produce figure. 3/4'); end
	% try biftermpathlengthtaperfigures(controlanalysis,testanalysis);
	% catch exception; disp('       Failed to produce figure. 4/4'); end
	% close all;

	% disp('       vs Radial Distance from Soma.');
	% try radialdistancefigures(controlanalysis,testanalysis);
	% catch exception; disp('       Failed to produce figure. 1/3'); end
	% try biftermradialdistancefigures(controlanalysis,testanalysis);
	% catch exception; disp('       Failed to produce figure. 2/3'); end
	% try bifradialdistancefigures(controlanalysis,testanalysis);
	% catch exception; disp('       Failed to produce figure. 3/3'); end
	% close all;

	% disp('       vs Branch Length.');
	% try pathlengthfigures(controlanalysis,testanalysis);
	% catch exception; disp('       Failed to produce figure. 1/4'); end
	% try biftermbranchlengthfigures(controlanalysis,testanalysis);
	% catch exception; disp('       Failed to produce figure. 2/4'); end
	% try bifbranchlengthfigures(controlanalysis,testanalysis);
	% catch exception; disp('       Failed to produce figure. 3/4'); end
	% try biftermbranchlengthtaperfigures(controlanalysis,testanalysis);
	% catch exception; disp('       Failed to produce figure. 4/4'); end
	% close all;

end


cd(mnhome);

warning('on', 'MATLAB:divideByZero');
warning('on', 'MATLAB:Axes:NegativeDataInLogAxis');

disp('  ------------------------------------');
disp('   Figures & Tables completed.');
disp('  ------------------------------------');
disp(' ');