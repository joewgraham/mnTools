function mncomparisontables(controlanalysis,testanalysis)

disp(' ');
disp('  ------------------------------------');
disp('   Comparison Tables');
disp('  ------------------------------------');

disp('   Generating ...');

disp('    Summary Table.');
try summarytable(controlanalysis,testanalysis);
catch exception; disp('       Failed to produce table.'); end

disp('    Primary Dendrite Table.');
try primarydendritetable(controlanalysis,testanalysis);
catch exception; disp('       Failed to produce table.'); end

disp('    Branch Order Table.');
try branchordertable(controlanalysis,testanalysis);
catch exception; disp('       Failed to produce table.'); end


disp('  ------------------------------------');
disp('   End of Comparison Tables');
disp('  ------------------------------------');
disp(' ');