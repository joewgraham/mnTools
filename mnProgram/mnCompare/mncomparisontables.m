function mncomparisontables(controlanalysis,testanalysis)

disp(' ');
disp('  ------------------------------------');
disp('   Comparison Tables');
disp('  ------------------------------------');

disp('   Generating ...');

disp('    Summary Table.');
summarytable(controlanalysis,testanalysis);

%disp('    Primary Dendrite Table.');
%primarydendritetable(controlanalysis,testanalysis);

%disp('    Branch Order Table.');
%branchordertable(controlanalysis,testanalysis);


disp('  ------------------------------------');
disp('   End of Comparison Tables');
disp('  ------------------------------------');
disp(' ');