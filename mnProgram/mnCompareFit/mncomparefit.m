function mncomparefit(controlanalysis,testanalysis)

[helppath,addpaths] = fileparts(which('mnaddpaths.m'));
cd(helppath);
cd ..
mnhome = cd;

warning('off','MATLAB:Axis:NegativeDataInLogAxis');
warning('off','MATLAB:Axes:NegativeDataInLogAxis');
warning('off','MATLAB:divideByZero');
warning('off','MATLAB:nearlySingularMatrix');
warning('off','MATLAB:log:logOfZero');
warning('off','optim:lsqncommon:SwitchToLineSearch');

disp(' ');
disp('  ------------------------------------');
disp('   mnCompareFit started.');
disp('  ------------------------------------');

if nargin == 0
    disp(' ');
    disp('    Please choose the control population'); 
    disp('    ''analysis.mat'' file using the');
    disp('    dialog box.');
    [controlpopfilename, controlpoppathname] = uigetfile('*.mat', 'Pick the control analysis file for mnCompare:');
    if isequal(controlpopfilename,0) || isequal(controlpoppathname,0)
        disp(' ');
        disp('    You must select a file to continue.');
        disp('    Please start over.');
        return;
    end
    disp(' ');
    disp('    Please choose the comparison population');
    disp('    ''analysis.mat'' file using the');
    disp('    dialog box.');
    [testpopfilename, testpoppathname] = uigetfile('*.mat', 'Pick the comparison analysis file for mnCompare:');
    if isequal(testpopfilename,0) || isequal(testpoppathname,0)
        disp(' ');
        disp('    You must select a file to continue.');
        disp('    Please start over.');
        return;
    end
        
    disp(' ');
    disp('    Loading files.');
    disp('    This may take a few minutes.');
    disp(' ');
    controlpop = load(fullfile(controlpoppathname,controlpopfilename));
    testpop = load(fullfile(testpoppathname,testpopfilename));
	eval(['controlanalysis = controlpop.' char(fieldnames(controlpop)) ';']);
	eval(['testanalysis = testpop.' char(fieldnames(testpop)) ';']);

end



mncomparefitoptions_none;
option.mncomparefit = manualmncomparefit(option.mncomparefit);

if strcmp(option.mncomparefit.branchtypeprob.fit,'y') == 1
    branchtypecomparefit(controlanalysis,testanalysis,option.mncomparefit);
    if strcmp(option.mncomparefit.figuresopen,'n'); close all; end;
end

if strcmp(option.mncomparefit.taperrate.fit,'y') == 1
    if strcmp(option.mncomparefit.taperrate.pooled,'y') == 1
        if strcmp(option.mncomparefit.taperrate.diameter.fit,'y') || strcmp(option.mncomparefit.taperrate.pathlength.fit,'y') || strcmp(option.mncomparefit.taperrate.radialdistance.fit,'y') || strcmp(option.mncomparefit.taperrate.branchlength.fit,'y')
            singlebinpooledtaperratecomparefit(controlanalysis,testanalysis,option.mncomparefit);
            if strcmp(option.mncomparefit.figuresopen,'n'); close all; end;
        end
        if strcmp(option.mncomparefit.taperrate.diameter.pathlength,'y') || strcmp(option.mncomparefit.taperrate.pathlength.diameter,'y')
            doublebinpooledtaperratecomparefit(controlanalysis,testanalysis,option.mncomparefit);
            if strcmp(option.mncomparefit.figuresopen,'n'); close all; end;
        end
    end
    if strcmp(option.mncomparefit.taperrate.bifurcation,'y') || strcmp(option.mncomparefit.taperrate.termination,'y')
        if strcmp(option.mncomparefit.taperrate.diameter.fit,'y') || strcmp(option.mncomparefit.taperrate.pathlength.fit,'y') || strcmp(option.mncomparefit.taperrate.radialdistance.fit,'y') || strcmp(option.mncomparefit.taperrate.branchlength.fit,'y')
            singlebinbiftermtaperratecomparefit(controlanalysis,testanalysis,option.mncomparefit);
            if strcmp(option.mncomparefit.figuresopen,'n'); close all; end;
        end
        if strcmp(option.mncomparefit.taperrate.diameter.pathlength,'y') || strcmp(option.mncomparefit.taperrate.pathlength.diameter,'y')
            doublebinbiftermtaperratecomparefit(controlanalysis,testanalysis,option.mncomparefit);
            if strcmp(option.mncomparefit.figuresopen,'n'); close all; end;
        end
    end
end

if strcmp(option.mncomparefit.piecebifprob.fit,'y') || strcmp(option.mncomparefit.piecetermprob.fit,'y')
    if strcmp(option.mncomparefit.piecebifprob.diameter.fit,'y') || strcmp(option.mncomparefit.piecebifprob.pathlength.fit,'y') || strcmp(option.mncomparefit.piecebifprob.radialdistance.fit,'y') || strcmp(option.mncomparefit.piecebifprob.branchlength.fit,'y') || strcmp(option.mncomparefit.piecetermprob.diameter.fit,'y') || strcmp(option.mncomparefit.piecetermprob.pathlength.fit,'y') || strcmp(option.mncomparefit.piecetermprob.radialdistance.fit,'y') || strcmp(option.mncomparefit.piecetermprob.branchlength.fit,'y')
        singlebinpiecebiftermprobcomparefit(controlanalysis,testanalysis,option.mncomparefit);
		if strcmp(option.mncomparefit.figuresopen,'n'); close all; end;
    end
    if strcmp(option.mncomparefit.piecebifprob.diameter.pathlength,'y') || strcmp(option.mncomparefit.piecebifprob.pathlength.diameter,'y') || strcmp(option.mncomparefit.piecetermprob.diameter.pathlength,'y') || strcmp(option.mncomparefit.piecetermprob.pathlength.diameter,'y')
        doublebinpiecebiftermprobcomparefit(controlanalysis,testanalysis,option.mncomparefit);
		if strcmp(option.mncomparefit.figuresopen,'n'); close all; end;
    end
end


if strcmp(option.mncomparefit.rallratio.fit,'y') || strcmp(option.mncomparefit.rallratio1.fit,'y') || strcmp(option.mncomparefit.rallratio2.fit,'y') || strcmp(option.mncomparefit.rallratio3.fit,'y') || strcmp(option.mncomparefit.daughterratio.fit,'y') || strcmp(option.mncomparefit.parentdaughterratio.fit,'y') || strcmp(option.mncomparefit.parentdaughter2ratio.fit,'y')
    if strcmp(option.mncomparefit.rallratio.diameter.fit,'y') || strcmp(option.mncomparefit.rallratio.pathlength.fit,'y') || strcmp(option.mncomparefit.rallratio.radialdistance.fit,'y') || strcmp(option.mncomparefit.rallratio.branchlength.fit,'y') || strcmp(option.mncomparefit.daughterratio.diameter.fit,'y') || strcmp(option.mncomparefit.daughterratio.pathlength.fit,'y') || strcmp(option.mncomparefit.daughterratio.radialdistance.fit,'y') || strcmp(option.mncomparefit.daughterratio.branchlength.fit,'y') || strcmp(option.mncomparefit.parentdaughterratio.diameter.fit,'y') || strcmp(option.mncomparefit.parentdaughterratio.pathlength.fit,'y') || strcmp(option.mncomparefit.parentdaughterratio.radialdistance.fit,'y') || strcmp(option.mncomparefit.parentdaughterratio.branchlength.fit,'y')
        singlebinbranchingparameterscomparefit(controlanalysis,testanalysis,option.mncomparefit);
		if strcmp(option.mncomparefit.figuresopen,'n'); close all; end;
    end
    if strcmp(option.mncomparefit.rallratio.diameter.pathlength,'y') || strcmp(option.mncomparefit.rallratio.pathlength.diameter,'y') || strcmp(option.mncomparefit.daughterratio.diameter.pathlength,'y') || strcmp(option.mncomparefit.daughterratio.pathlength.diameter,'y') || strcmp(option.mncomparefit.parentdaughterratio.diameter.pathlength,'y') || strcmp(option.mncomparefit.parentdaughterratio.pathlength.diameter,'y')
        doublebinbranchingparameterscomparefit(controlanalysis,testanalysis,option.mncomparefit);
		if strcmp(option.mncomparefit.figuresopen,'n'); close all; end;
    end
end


warning('on','MATLAB:Axis:NegativeDataInLogAxis');
warning('on','MATLAB:Axes:NegativeDataInLogAxis');
warning('on','MATLAB:divideByZero');
warning('on','MATLAB:nearlySingularMatrix');
warning('on','MATLAB:log:logOfZero');
warning('on','optim:lsqncommon:SwitchToLineSearch');




cd(mnhome);


disp(' ');
disp('  ------------------------------------');
disp('   mnCompareFit completed.');
disp('  ------------------------------------');
disp(' ');
