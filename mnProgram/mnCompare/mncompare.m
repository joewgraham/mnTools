function mncompare(control,varargin)

[helppath,addpaths] = fileparts(which('mnaddpaths.m'));
cd(helppath);
cd ..
mnhome = cd;

disp(' ');
disp('  ------------------------------------');
disp('   mnCompare started.');
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
    testpopfilenames{1}=testpopfilename;
    testpoppathnames{1}=testpoppathname;
    
    disp(' ');
    disp('    Loading files.');
    disp('    This may take a few minutes.');
    disp(' ');
    controlpop = load(fullfile(controlpoppathname,controlpopfilename));
    for i = 1:length(testpopfilenames)
        eval(['testpop(' num2str(i) ')= load(fullfile(testpoppathnames{' num2str(i) '},testpopfilenames{' num2str(i) '}));']);
    end

elseif nargin == 1
    if isa(control,'double') ~= 1
        disp(' ');
        disp('    If using mnCompare with a single input, it must be an integer.');
        disp('    Please start over.');
        return;
    elseif isa(control,'double') == 1
        disp(' ');
        disp('    Please choose the control population ''analysis.mat'' file');
        disp('    using the dialog box.');
        [controlpopfilename, controlpoppathname] = uigetfile('*.mat', 'Pick an analysis file for mnCompare:');
        if isequal(controlpopfilename,0) || isequal(controlpoppathname,0)
            disp(' ');
            disp('    You must select a file to continue.');
            disp('    Please start over.');
            return;
        end
    end
    for i = 1:control-1      
        disp(' ');
        disp('    Please choose the comparison population ''analysis.mat'' file');
        disp('    using the dialog box.');
        [testpopfilename, testpoppathname] = uigetfile('*.mat', 'Pick an analysis file for mnCompare:');
        if isequal(testpopfilename,0) || isequal(testpoppathname,0)
            disp(' ');
            disp('    You must select a file to continue.');
            disp('    Please start over.');
            return;
        end
        testpopfilenames{i} = testpopfilename;
        testpoppathnames{i} = testpoppathname;    
    end
    
    disp(' ');
    disp('    Loading files.  This may take a few minutes.');
    disp(' ');
    controlpop = load(fullfile(controlpoppathname,controlpopfilename));
    
    for i = 1:control-1
        eval(['testpopload_' num2str(i) '= load(fullfile(testpoppathnames{' num2str(i) '},testpopfilenames{' num2str(i) '}));']);
    end
    for i = 1:control-1
        eval(['name=char(fields(testpopload_' num2str(i) '));']);
        eval(['testpop.' name '= testpopload_' num2str(i) '.' name ';']);
    end
    

elseif nargin >= 2
    if exist('control','var') ~= 0
        eval(['controlpop.' control.inputfilename '_analysis = control;']);
    else
        disp('Error: two or more inputs must be existing variables.');
        disp('The control population variable does not exist.');
    end
    for i = 1 : nargin-1
        if exist('varargin','var') ~= 0
            eval(['testpop.' varargin{i}.inputfilename '_analysis = varargin{' num2str(i) '};']);
        else
            disp('Error: two or more inputs must be existing variables.');
            disp('The comparison population variable does not exist.');
        end
    end
end

eval(['controlpop = controlpop.' char(fieldnames(controlpop)) ';']);

for i = 1:length(fieldnames(testpop))
    names = fieldnames(testpop);
    eval(['currenttestpop = testpop.' char(names(i)) ';']);
    mncomparisonfigures(controlpop,currenttestpop); 
	mncomparisontables(controlpop,currenttestpop);
end



cd(mnhome);


disp(' ');
disp('  ------------------------------------');
disp('   mnCompare completed.');
disp('  ------------------------------------');
disp(' ');
