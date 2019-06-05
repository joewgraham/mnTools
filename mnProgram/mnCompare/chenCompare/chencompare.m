function chencompare(varargin)

[helppath,addpaths] = fileparts(which('addpaths.m'));
cd(helppath);
cd ..
mnhome = cd;

disp(' ');
disp('  ----------------------------------------');
disp('   ChenCompare started.');
disp('  ----------------------------------------');
disp(' ');

[controlpoppathname,controlpopfilename] = fileparts(which('chen_analysis.mat'));
controlpopfilename = 'chen_analysis.mat';

if nargin == 0
    disp(' ');
    disp('Please choose the comparison population'); 
    disp('''analysis.mat'' file from the dialog box.');
    [testpopfilename, testpoppathname] = uigetfile('*.mat', 'Pick an analysis file for mnCompare:');
    if isequal(testpopfilename,0) || isequal(testpoppathname,0)
        disp(' ');
        disp('You must select a file to continue.');
        disp('Please start over.');
        return;
    end
    testpopfilenames{1}=testpopfilename;
    testpoppathnames{1}=testpoppathname;
    
    disp(' ');
    disp('Loading files.  This may take a few minutes.');
    disp(' ');
    controlpop = load(fullfile(controlpoppathname,controlpopfilename));
    for i = 1:length(testpopfilenames)
        eval(['testpop(' num2str(i) ')= load(fullfile(testpoppathnames{' num2str(i) '},testpopfilenames{' num2str(i) '}));']);
    end

elseif nargin == 1
    
    if exist('varargin','var') ~= 0
        eval(['testpop.' varargin{1}.inputfilename '_analysis = varargin{' num2str(1) '};']);
    else
        disp('Error: that ''analysis'' variable does not exist.');
    end
    controlpop = load(fullfile(controlpoppathname,controlpopfilename));
    
%     if isa(varargin{1},'double') ~= 1
%         disp(' ');
%         disp('If using mnCompare with a single input, it must be an integer.');
%         disp('Please start over.');
%         return;
%     end
%     for i = 1:varargin{1}      
%         disp(' ');
%         disp('Please choose the comparison population'); 
%         disp('''analysis.mat'' file from the dialog box.');
%         [testpopfilename, testpoppathname] = uigetfile('*.mat', 'Pick an analysis file for mnCompare:');
%         if isequal(testpopfilename,0) || isequal(testpoppathname,0)
%             disp(' ');
%             disp('You must select a file to continue.');
%             disp('Please start over.');
%             return;
%         end
%         testpopfilenames{i} = testpopfilename;
%         testpoppathnames{i} = testpoppathname;    
%     end
%     
%     disp(' ');
%     disp('Loading files.');
%     disp(' ');
%     controlpop = load(fullfile(controlpoppathname,controlpopfilename));
%     
%     for i = 1:varargin{1}
%         eval(['testpopload_' num2str(i) '= load(fullfile(testpoppathnames{' num2str(i) '},testpopfilenames{' num2str(i) '}));']);
%     end
%     for i = 1:varargin{1}
%         eval(['name=char(fields(testpopload_' num2str(i) '));']);
%         eval(['testpop.' name '= testpopload_' num2str(i) '.' name ';']);
%     end
    

% elseif nargin >= 2
%     
%     for i = 1 : nargin
%         if exist('varargin','var') ~= 0
%             eval(['testpop.' varargin{i}.inputfilename '_analysis = varargin{' num2str(i) '};']);
%         else
%             disp('Error: two or more inputs must be existing variables.');
%             disp('The comparison population variable does not exist.');
%         end
%     end
end

eval(['controlpop = controlpop.' char(fieldnames(controlpop)) ';']);

for i = 1:length(fieldnames(testpop))
    names = fieldnames(testpop);
    eval(['currenttestpop = testpop.' char(names(i)) ';']);
    chencomparisonfigures(controlpop,currenttestpop);
    chencomparisontables(controlpop,currenttestpop);
    close all
end

cd(mnhome);

disp(' ');
disp('  ----------------------------------------');
disp('   ChenCompare completed.');
disp('  ----------------------------------------');
disp(' ');
