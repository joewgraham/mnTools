function mndoublefitter(varargin)

if nargin == 0
	disp(' ');
	disp('  ------------------------------------');
	disp('   Choose File for mnFitter');
	disp('  ------------------------------------');
	disp('   Please choose the desired ''parameterfits.mat'''); 
    disp('    file using the dialog box.');
    [parameterfitsfilename, parameterfitspathname] = uigetfile('*.mat', 'Pick the ''parameterfits.mat'' file for Parameter Figures:');
    if isequal(parameterfitsfilename,0) || isequal(parameterfitspathname,0)
        disp(' ');
        disp('   You must select a file to continue.');
        disp('    Please start over.');
        return;
    end
    parameterfits = load(fullfile(parameterfitspathname,parameterfitsfilename));
    parameterfitsname = fieldnames(parameterfits);
    parameterfitsname = parameterfitsname{1};
    eval(['parameterfits = parameterfits.' parameterfitsname ';']);
	mnfitteroptions_none;
	option.mnfitter = manualmnfitter(option.mnfitter);
elseif nargin == 1
	parameterfits = varargin{1};
	mnfitteroptions;
elseif nargin == 2
	parameterfits = varargin{1};
	mnfitteroptions_none;
	option.mnfitter = manualmnfitter(option.mnfitter);
else
	disp('Error in mnfitter.m.');
	keyboard;
end

disp(' ');
disp('  ------------------------------------');
disp('   mnFitter started.');
disp('  ------------------------------------');

[helppath,addpaths] = fileparts(which('addpaths.m'));
cd(helppath);
cd ..
mnhome = cd;

disp('   Fitting:');

warning('off','MATLAB:Axis:NegativeDataInLogAxis');
warning('off','MATLAB:Axes:NegativeDataInLogAxis');
warning('off','MATLAB:divideByZero');
warning('off','MATLAB:nearlySingularMatrix');
warning('off','MATLAB:log:logOfZero');
warning('off','optim:lsqncommon:SwitchToLineSearch');

%parameterfits.inputfilename = parameterfits.inputfilename;

if strcmp(option.mnfitter.branchtypeprob.fit,'y') == 1
    parameterfits = branchtypefitter(analysis,parameterfits);
    if strcmp(option.mnfitter.figuresopen,'n'); close all; end;
end

if strcmp(option.mnfitter.taperrate.fit,'y') == 1
    if strcmp(option.mnfitter.taperrate.pooled,'y') == 1
        if strcmp(option.mnfitter.taperrate.diameter.fit,'y') || strcmp(option.mnfitter.taperrate.pathlength.fit,'y') || strcmp(option.mnfitter.taperrate.radialdistance.fit,'y')
            parameterfits = singlebinpooledtaperratefitter(analysis,parameterfits,option.mnfitter);
            if strcmp(option.mnfitter.figuresopen,'n'); close all; end;
        end
        if strcmp(option.mnfitter.taperrate.diameter.pathlength,'y') || strcmp(option.mnfitter.taperrate.pathlength.diameter,'y')
            parameterfits = doublebinpooledtaperratefitter(analysis,parameterfits,option.mnfitter);
            if strcmp(option.mnfitter.figuresopen,'n'); close all; end;
        end
    end
    if strcmp(option.mnfitter.taperrate.bifurcation,'y') || strcmp(option.mnfitter.taperrate.termination,'y')
        if strcmp(option.mnfitter.taperrate.diameter.fit,'y') || strcmp(option.mnfitter.taperrate.pathlength.fit,'y') || strcmp(option.mnfitter.taperrate.radialdistance.fit,'y')
            parameterfits = singlebinbiftermtaperratefitter(analysis,parameterfits,option.mnfitter);
            if strcmp(option.mnfitter.figuresopen,'n'); close all; end;
        end
        if strcmp(option.mnfitter.taperrate.diameter.pathlength,'y') || strcmp(option.mnfitter.taperrate.pathlength.diameter,'y')
            parameterfits = doublebinbiftermtaperratefitter(analysis,parameterfits,option.mnfitter);
            if strcmp(option.mnfitter.figuresopen,'n'); close all; end;
        end
    end
end

if strcmp(option.mnfitter.piecebifprob.fit,'y') || strcmp(option.mnfitter.piecetermprob.fit,'y')
    if strcmp(option.mnfitter.piecebifprob.diameter.fit,'y') || strcmp(option.mnfitter.piecebifprob.pathlength.fit,'y') || strcmp(option.mnfitter.piecebifprob.radialdistance.fit,'y') || strcmp(option.mnfitter.piecetermprob.diameter.fit,'y') || strcmp(option.mnfitter.piecetermprob.pathlength.fit,'y') || strcmp(option.mnfitter.piecetermprob.radialdistance.fit,'y')
        parameterfits = singlebinpiecebiftermprobfitter(analysis,parameterfits,option.mnfitter);
		if strcmp(option.mnfitter.figuresopen,'n'); close all; end;
    end
    if strcmp(option.mnfitter.piecebifprob.diameter.pathlength,'y') || strcmp(option.mnfitter.piecebifprob.pathlength.diameter,'y') || strcmp(option.mnfitter.piecetermprob.diameter.pathlength,'y') || strcmp(option.mnfitter.piecetermprob.pathlength.diameter,'y')
        parameterfits = doublebinpiecebiftermprobfitter(analysis,parameterfits,option.mnfitter);
		if strcmp(option.mnfitter.figuresopen,'n'); close all; end;
    end
end


if strcmp(option.mnfitter.rallratio.fit,'y') || strcmp(option.mnfitter.rallratio1.fit,'y') || strcmp(option.mnfitter.rallratio2.fit,'y') || strcmp(option.mnfitter.daughterratio.fit,'y') || strcmp(option.mnfitter.parentdaughterratio.fit,'y') || strcmp(option.mnfitter.parentdaughter2ratio.fit,'y')
    if strcmp(option.mnfitter.rallratio.diameter.fit,'y') || strcmp(option.mnfitter.rallratio.pathlength.fit,'y') || strcmp(option.mnfitter.rallratio.radialdistance.fit,'y') || strcmp(option.mnfitter.daughterratio.diameter.fit,'y') || strcmp(option.mnfitter.daughterratio.pathlength.fit,'y') || strcmp(option.mnfitter.daughterratio.radialdistance.fit,'y') || strcmp(option.mnfitter.parentdaughterratio.diameter.fit,'y') || strcmp(option.mnfitter.parentdaughterratio.pathlength.fit,'y') || strcmp(option.mnfitter.parentdaughterratio.radialdistance.fit,'y')
        parameterfits = singlebinbranchingparametersfitter(analysis,parameterfits,option.mnfitter);
		if strcmp(option.mnfitter.figuresopen,'n'); close all; end;
    end
    if strcmp(option.mnfitter.rallratio.diameter.pathlength,'y') || strcmp(option.mnfitter.rallratio.pathlength.diameter,'y') || strcmp(option.mnfitter.daughterratio.diameter.pathlength,'y') || strcmp(option.mnfitter.daughterratio.pathlength.diameter,'y') || strcmp(option.mnfitter.parentdaughterratio.diameter.pathlength,'y') || strcmp(option.mnfitter.parentdaughterratio.pathlength.diameter,'y')
        parameterfits = doublebinbranchingparametersfitter(analysis,parameterfits,option.mnfitter);
		if strcmp(option.mnfitter.figuresopen,'n'); close all; end;
    end
end



warning('on','MATLAB:Axis:NegativeDataInLogAxis');
warning('on','MATLAB:Axes:NegativeDataInLogAxis');
warning('on','MATLAB:divideByZero');
warning('on','MATLAB:nearlySingularMatrix');
warning('on','MATLAB:log:logOfZero');
warning('on','optim:lsqncommon:SwitchToLineSearch');


if nargin == 1
	cd(analysis.datapathname);
	fitsname = sprintf('%s_parameterfits',analysis.inputfilename);
	assignin('caller',fitsname,parameterfits);
	assignin('base',fitsname,parameterfits);
	eval([fitsname '=parameterfits;']);
	save(sprintf('%s_%s_%s',analysis.inputfilename,analysis.datetime,'parameterfits.mat'),fitsname);
	cd(mnhome);
else
	cd(analysis.datapathname);
	fitsname = sprintf('%s_parameterfits',analysis.inputfilename);
	if evalin('base',sprintf('exist(''%s'')',fitsname))
		evalin('base',sprintf('assignin(''caller'',''baseparameterfits'',%s);',fitsname));
		baseparameters = fieldnames(baseparameterfits);
		for baseparameter = 1:length(baseparameters)
			eval(['parameterfits.' baseparameters{baseparameter} ' = baseparameterfits.' baseparameters{baseparameter} ';']);
		end
		assignin('caller',fitsname,parameterfits);
		assignin('base',fitsname,parameterfits);
		eval([fitsname '=parameterfits;']);
		save(sprintf('%s_%s_%s',analysis.inputfilename,analysis.datetime,'parameterfits.mat'),fitsname);
		cd(mnhome);
	elseif exist(sprintf('%s_%s_%s',analysis.inputfilename,analysis.datetime,'parameterfits.mat')) == 2
		baseparameterfitsstructure = load(sprintf('%s_%s_%s',analysis.inputfilename,analysis.datetime,'parameterfits.mat'));
		parameterfitnames = fieldnames(baseparameterfitsstructure);
		parameterfitname = parameterfitnames{1};
		eval(['baseparameterfits = baseparameterfitsstructure.' parameterfitname ';']);
		baseparameters = fieldnames(baseparameterfits);
		for baseparameter = 1:length(baseparameters)
			eval(['parameterfits.' baseparameters{baseparameter} ' = baseparameterfits.' baseparameters{baseparameter} ';']);
		end
		assignin('caller',fitsname,parameterfits);
		assignin('base',fitsname,parameterfits);
		eval([fitsname '=parameterfits;']);
		save(sprintf('%s_%s_%s',analysis.inputfilename,analysis.datetime,'parameterfits.mat'),fitsname);
		cd(mnhome);
	else
		assignin('caller',fitsname,parameterfits);
		assignin('base',fitsname,parameterfits);
		eval([fitsname '=parameterfits;']);
		save(sprintf('%s_%s_%s',analysis.inputfilename,analysis.datetime,'parameterfits.mat'),fitsname);
		cd(mnhome);
	end
end

disp('  ------------------------------------');
disp('   mnFitter completed.');
disp('  ------------------------------------');
disp(' ');