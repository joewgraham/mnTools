function chencomparisontables(controlanalysis,testanalysis)

disp(' ');
disp('    ------------------------------------');
disp('     Chen Comparison Tables');
disp('    ------------------------------------');

disp('     Generating ...');

disp('      Summary Table.');
chensummarytable(controlanalysis,testanalysis);

% disp('    Primary Dendrite Table.');
% chenprimarydendritetable(controlanalysis,testanalysis);

disp('      Branch Order Table.');
chenbranchordertable(controlanalysis,testanalysis);


disp('    ------------------------------------');
disp('     End of Chen Comparison Tables');
disp('    ------------------------------------');
disp(' ');