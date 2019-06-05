function chencomparisonfigures(controlanalysis,testanalysis)

disp(' ');
disp('    ------------------------------------');
disp('     Chen Comparison Figures');
disp('    ------------------------------------');

disp('     Generating ...');

disp('       Parameter Distribution Figures.');
chenparameterdistributionfigures(controlanalysis,testanalysis);
chenparameterdistributionboxplots(controlanalysis,testanalysis);
%parameterdistributiondata(controlanalysis,testanalysis);

disp('       Soma Diameter Figures');
chensomadiameterfigures(controlanalysis,testanalysis);


disp('       Morphometrics Figures ');

disp('         vs Primary Dendrite Diameter.');
chenprimarydendritefigures_cyl(controlanalysis,testanalysis);
%primarydendritedata(analysis);


disp('         vs Path Length from Soma.');
chenpathlengthfigures(controlanalysis,testanalysis);
%pathlengthdata(analysis);

disp('         vs Radial Distance from Soma.');
chenradialdistancefigures(controlanalysis,testanalysis);
%radialdistancedata(analysis);

disp('         vs Branch Order.');
chenbranchorderfigures(controlanalysis,testanalysis);
%branchorderdata(analysis);

disp('         vs Local Diameter.');
chendiameterfigures(controlanalysis,testanalysis);



disp('    ------------------------------------');
disp('     End of Chen Comparison Figures');
disp('    ------------------------------------');
disp(' ');