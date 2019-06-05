function doublebinfitter(varargin)

[helppath,addpaths] = fileparts(which('addpaths.m'));
cd(helppath);
cd ..
mnhome = cd;
%options;

disp(' ');
disp('  ------------------------------------');
disp('   DoubleBin Fitter started.');
disp('  ------------------------------------');

warning('off','MATLAB:Axis:NegativeDataInLogAxis');
warning('off','MATLAB:Axes:NegativeDataInLogAxis');
warning('off','MATLAB:divideByZero');
warning('off','MATLAB:nearlySingularMatrix');
warning('off','MATLAB:log:logOfZero');
warning('off','optim:lsqncommon:SwitchToLineSearch');

if nargin == 0
    
    disp(' ');
    disp('  Please choose the desired ''analysis.mat'''); 
    disp('  file using the dialog box.');
    [analysisfilename, analysispathname] = uigetfile('*.mat', 'Pick the ''analysis.mat'' file for Parameter Figures:');
    if isequal(analysisfilename,0) || isequal(analysispathname,0)
        disp(' ');
        disp('  You must select a file to continue.');
        disp('  Please start over.');
        return;
    end
    
    disp(' ');
    analysis = load(fullfile(analysispathname,analysisfilename));
    analysisname = fieldnames(analysis);
    analysisname = analysisname{1};
    eval(['analysis = analysis.' analysisname ';']);
        
elseif nargin > 0
    analysis = varargin{1};
end


parameternumber = [];
taperratetype = [];
taperratestatistic = [];
piecebifprobtype = [];
piecebifprobby = [];
piecetermprobtype = [];
piecetermprobby = [];
rallratioexponent = [];
rallratiostatistic = [];
parentdaughterratiotype = [];
parentdaughterratiostatistic = [];
daughterratiostatistic = [];
versusnumber = [];


disp(' ');
disp('  ------------------------------------');
disp('     Choose Parameter');
disp('  ------------------------------------');
disp(' ');
disp('    Parameters:');
disp('      1. Taper Rate');
disp('      2. Piece Bifurcation Probability');
disp('      3. Piece Termination Probability');
disp('      4. Rall Ratio');
disp('      5. Parent / Daughter Ratio');
disp('      6. Daughter Ratio');
disp(' ');
disp('    Please enter the number of the');
parameternumber = input('    parameter to be visualized: ');

if isempty(parameternumber) == 1
    disp(' ');
    disp('  You must enter a valid number to continue.');
    disp('  Please start over.');
    return;
elseif sum(ismember(parameternumber,[1 2 3 4 5 6])) ~= length(parameternumber) 
    disp(' ');
    disp('  You must enter a valid number to continue.');
    disp('  Please start over.');
    return;
end
    
if ismember(2,parameternumber) == 1
    
   disp(' ');
   disp('  ------------------------------------');
   disp('     Taper Rate Options');
   disp('  ------------------------------------');
   disp(' ');
   disp('    Taper Rate Type:');
   disp('      1. Pooled');
   disp('      2. Bifurcation');
   disp('      3. Termination');
   disp('      4. Bif & Term');
   disp('      5. All');
   disp(' ');
   disp('    Please enter the number of the');
   taperratetype = input('    type to be visualized: ');
   if isempty(taperratetype) == 1
       disp(' ');
       disp('  You must enter a valid number to continue.');
       disp('  Please start over.');
       return;
   elseif sum(ismember(taperratetype,[1 2 3 4 5])) ~= length(taperratetype)
       disp(' ');
       disp('  You must enter a valid number to continue.');
       disp('  Please start over.');
       return;
   end
   if taperratetype == 4
       taperratetype = [2 3];
   end
   if taperratetype == 5
       taperratetype = [1 2 3];
   end
   
   disp(' ');
   disp('  ------------------------------------');
   disp(' ');
   disp('    Taper Rate Statistic:');
   disp('      1. Mean');
   disp('      2. Standard Deviation');
   disp('      3. Skewness');
   disp('      4. Kurtosis');
   disp('      5. All');
   disp(' ');
   disp('    Please enter the number of the');
   taperratestatistic = input('    statistic to be visualized: ');
   if isempty(taperratestatistic) == 1
       disp(' ');
       disp('  You must enter a valid number to continue.');
       disp('  Please start over.');
       return;
   elseif sum(ismember(taperratestatistic,[1 2 3 4 5])) ~= length(taperratestatistic)
       disp(' ');
       disp('  You must enter a valid number to continue.');
       disp('  Please start over.');
       return;
   end
   if taperratestatistic == 5
       taperratestatistic = [1 2 3 4];
   end
   
end

if ismember(3,parameternumber) == 1

    disp(' ');
    disp('  ------------------------------------');
    disp('     Piece Bifurcation Prob Options');
    disp('  ------------------------------------');
    disp(' ');
    disp('    Piece Bifurcation Probability Type:');
    disp('      1. Pooled');
    disp('      2. Bifurcation');
    disp('      3. Both');
    disp(' ');
    disp('    Please enter the number of the');
    piecebifprobtype = input('    type to be visualized: ');
    if isempty(piecebifprobtype) == 1
        disp(' ');
        disp('  You must enter a valid number to continue.');
        disp('  Please start over.');
        return;
    elseif sum(ismember(piecebifprobtype,[1 2 3])) ~= length(piecebifprobtype)
        disp(' ');
        disp('  You must enter a valid number to continue.');
        disp('  Please start over.');
        return;
    end
    if piecebifprobtype == 3
        piecebifprobtype = [1 2];
    end
    
    disp(' ');
    disp('  ------------------------------------');
    disp(' ');
    disp('    Piece Bifurcation Probability By:');
    disp('      1. Length');
    disp('      2. Surface Area');
    disp('      3. Volume');
    disp('      4. All');
    disp(' ');
    disp('    Please enter the number of the');
    piecebifprobby = input('    type to be visualized: ');
    if isempty(piecebifprobby) == 1
        disp(' ');
        disp('  You must enter a valid number to continue.');
        disp('  Please start over.');
        return;
    elseif sum(ismember(piecebifprobby,[1 2 3 4])) ~= length(piecebifprobby)
        disp(' ');
        disp('  You must enter a valid number to continue.');
        disp('  Please start over.');
        return;
    end
    if piecebifprobby == 4
        piecebifprobby = [1 2 3];
    end

end

if ismember(4,parameternumber) == 1

    disp(' ');
    disp('  ------------------------------------');
    disp('     Piece Termination Prob Options');
    disp('  ------------------------------------');
    disp(' ');
    disp('    Piece Termination Probability Type:');
    disp('      1. Pooled');
    disp('      2. Termination');
    disp('      3. Both');
    disp(' ');
    disp('    Please enter the number of the');
    piecetermprobtype = input('    type to be visualized: ');
    if isempty(piecetermprobtype) == 1
        disp(' ');
        disp('  You must enter a valid number to continue.');
        disp('  Please start over.');
        return;
    elseif sum(ismember(piecetermprobtype,[1 2 3])) ~= length(piecetermprobtype)
        disp(' ');
        disp('  You must enter a valid number to continue.');
        disp('  Please start over.');
        return;
    end
    if piecetermprobtype == 3
        piecetermprobtype = [1 2];
    end
    
    disp(' ');
    disp('  ------------------------------------');
    disp(' ');
    disp('    Piece Termination Probability By:');
    disp('      1. Length');
    disp('      2. Surface Area');
    disp('      3. Volume');
    disp('      4. All');
    disp(' ');
    disp('    Please enter the number of the');
    piecetermprobby = input('    type to be visualized: ');
    if isempty(piecetermprobby) == 1
        disp(' ');
        disp('  You must enter a valid number to continue.');
        disp('  Please start over.');
        return;
    elseif sum(ismember(piecetermprobby,[1 2 3 4])) ~= length(piecetermprobby)
        disp(' ');
        disp('  You must enter a valid number to continue.');
        disp('  Please start over.');
        return;
    end
    if piecetermprobby == 4
        piecetermprobby = [1 2 3];
    end
end
    
if ismember(5,parameternumber) == 1
    disp(' ');
    disp('  ------------------------------------');
    disp('     Rall Ratio Options');
    disp('  ------------------------------------');
    disp(' ');
    disp('    Rall Ratio Exponents:');
    disp('      1. D^(1)');
    disp('      2. D^(3/2)');
    disp('      3. D^(2)');
    disp('      4. All');
    disp(' ');
    disp('    Please enter the number of the');
    rallratioexponent = input('    exponent to be visualized: ');
    if isempty(rallratioexponent) == 1
        disp(' ');
        disp('  You must enter a valid number to continue.');
        disp('  Please start over.');
        return;
    elseif sum(ismember(rallratioexponent,[1 2 3 4])) ~= length(rallratioexponent)
        disp(' ');
        disp('  You must enter a valid number to continue.');
        disp('  Please start over.');
        return;
    end
    if rallratioexponent == 4
        rallratioexponent = [1 2 3];
    end
    
    disp(' ');
    disp('  ------------------------------------');
    disp(' ');
    disp('    Rall Ratio Statistic:');
    disp('      1. Mean');
    disp('      2. Standard Deviation');
    disp('      3. Skewness');
    disp('      4. Kurtosis');
    disp('      5. All');
    disp(' ');
    disp('    Please enter the number of the');
    rallratiostatistic = input('    statistic to be visualized: ');
    if isempty(rallratiostatistic) == 1
        disp(' ');
        disp('  You must enter a valid number to continue.');
        disp('  Please start over.');
        return;
    elseif sum(ismember(rallratiostatistic,[1 2 3 4 5])) ~= length(rallratiostatistic)
        disp(' ');
        disp('  You must enter a valid number to continue.');
        disp('  Please start over.');
        return;
    end
    if rallratiostatistic == 5
        rallratiostatistic = [1 2 3 4];
    end
end


if ismember(6,parameternumber) == 1
    disp(' ');
    disp('  ------------------------------------');
    disp('     Parent/Daughter Ratio Options');
    disp('  ------------------------------------');
    disp(' ');
    disp('    Parent/Daughter Ratios:');
    disp('      1. Parent/Daughter 1 Ratio');
    disp('      2. Parent/Daughter 2 Ratio');
    disp('      3. Both');
    disp(' ');
    disp('    Please enter the number of the');
    parentdaughterratiotype = input('    ratio to be visualized: ');
    if isempty(parentdaughterratiotype) == 1
        disp(' ');
        disp('  You must enter a valid number to continue.');
        disp('  Please start over.');
        return;
    elseif sum(ismember(parentdaughterratiotype,[1 2 3])) ~= length(parentdaughterratiotype)
        disp(' ');
        disp('  You must enter a valid number to continue.');
        disp('  Please start over.');
        return;
    end
    if parentdaughterratiotype == 3
        parentdaughterratiotype = [1 2];
    end
    
    disp(' ');
    disp('  ------------------------------------');
    disp(' ');
    disp('    Parent/Daughter Ratio Statistic:');
    disp('      1. Mean');
    disp('      2. Standard Deviation');
    disp('      3. Skewness');
    disp('      4. Kurtosis');
    disp('      5. All');
    disp(' ');
    disp('    Please enter the number of the');
    parentdaughterratiostatistic = input('    statistic to be visualized: ');
    if isempty(parentdaughterratiostatistic) == 1
        disp(' ');
        disp('  You must enter a valid number to continue.');
        disp('  Please start over.');
        return;
    elseif sum(ismember(parentdaughterratiostatistic,[1 2 3 4 5])) ~= length(parentdaughterratiostatistic)
        disp(' ');
        disp('  You must enter a valid number to continue.');
        disp('  Please start over.');
        return;
    end
    if parentdaughterratiostatistic == 5
        parentdaughterratiostatistic = [1 2 3 4];
    end
end


if ismember(7,parameternumber) == 1
    disp(' ');
    disp('  ------------------------------------');
    disp('     Daughter Ratio Options');
    disp('  ------------------------------------');
    disp(' ');
    disp('    Daughter Ratio Statistic:');
    disp('      1. Mean');
    disp('      2. Standard Deviation');
    disp('      3. Skewness');
    disp('      4. Kurtosis');
    disp('      5. All');
    disp(' ');
    disp('    Please enter the number of the');
    daughterratiostatistic = input('    statistic to be visualized: ');
    if isempty(daughterratiostatistic) == 1
        disp(' ');
        disp('  You must enter a valid number to continue.');
        disp('  Please start over.');
        return;
    elseif sum(ismember(daughterratiostatistic,[1 2 3 4 5])) ~= length(daughterratiostatistic)
        disp(' ');
        disp('  You must enter a valid number to continue.');
        disp('  Please start over.');
        return;
    end
    if daughterratiostatistic == 5
        daughterratiostatistic = [1 2 3 4];
    end
end
    
    

disp(' ');
disp('  ------------------------------------');
disp('     Fitting Options');
disp('  ------------------------------------');
disp(' ');
disp('    Double Bin Order:');
disp('      1. Diameter    -> Path Length');
disp('      2. Path Length -> Diameter');
disp('      3. Both');
disp(' ');
disp('    Please enter the number of the');
doublebinorder = input('    order to be visualized: ');

if isempty(doublebinorder) == 1
    disp(' ');
    disp('  You must enter a valid number to continue.');
    disp('  Please start over.');
    return;
elseif sum(ismember(doublebinorder,[1 2 3])) ~= length(doublebinorder)
    disp(' ');
    disp('  You must enter a valid number to continue.');
    disp('  Please start over.');
    return;
end
if doublebinorder == 3
    doublebinorder = [1 2];
end

disp(' ');
disp('  ------------------------------------');
disp(' ');
disp('    First Bin Fits:');
disp('      1. Linear');
disp('      2. Exponential');
disp('      3. Power');
disp('      4. Sigmoid');
disp('      5. All');
disp(' ');
disp('    Please enter the number of the');
firstbinfit = input('    fit to be visualized: ');
if isempty(firstbinfit) == 1
    disp(' ');
    disp('  You must enter a valid number to continue.');
    disp('  Please start over.');
    return;
elseif sum(ismember(firstbinfit,[1 2 3 4 5])) ~= length(firstbinfit)
    disp(' ');
    disp('  You must enter a valid number to continue.');
    disp('  Please start over.');
    return;
end
if firstbinfit == 5
    firstbinfit = [1 2 3 4];
end

disp(' ');
disp('  ------------------------------------');
disp(' ');
disp('    First Bin Fit Types:');
disp('      1. Unweighted');
disp('      2. Weighted');
disp('      3. Robust');
disp('      4. Robust Weighted');
disp('      5. All');
disp(' ');
disp('    Please enter the number of the');
firstbinfittype = input('    fit to be visualized: ');
if isempty(firstbinfittype) == 1
    disp(' ');
    disp('  You must enter a valid number to continue.');
    disp('  Please start over.');
    return;
elseif sum(ismember(firstbinfittype,[1 2 3 4 5])) ~= length(firstbinfittype)
    disp(' ');
    disp('  You must enter a valid number to continue.');
    disp('  Please start over.');
    return;
end
if firstbinfittype == 5
    firstbinfittype = [1 2 3 4];
end


disp(' ');
disp('  ------------------------------------');
disp(' ');
disp('    Second Bin (Parameter) Fits:');
disp('      1. Linear');
disp('      2. Exponential');
disp('      3. Power');
disp('      4. Sigmoid');
disp('      5. All');
disp(' ');
disp('    Please enter the number of the');
secondbinfit = input('    fit to be visualized: ');
if isempty(secondbinfit) == 1
    disp(' ');
    disp('  You must enter a valid number to continue.');
    disp('  Please start over.');
    return;
elseif sum(ismember(secondbinfit,[1 2 3 4 5])) ~= length(secondbinfit)
    disp(' ');
    disp('  You must enter a valid number to continue.');
    disp('  Please start over.');
    return;
end
if secondbinfit == 5
    secondbinfit = [1 2 3 4];
end

disp(' ');
disp('  ------------------------------------');
disp(' ');
disp('    Second Bin (Parameter) Fit Types:');
disp('      1. Unweighted');
disp('      2. Weighted');
disp('      3. Robust');
disp('      4. Robust Weighted');
disp('      5. All');
disp(' ');
disp('    Please enter the number of the');
secondbinfittype = input('    fit to be visualized: ');
if isempty(secondbinfittype) == 1
    disp(' ');
    disp('  You must enter a valid number to continue.');
    disp('  Please start over.');
    return;
elseif sum(ismember(secondbinfittype,[1 2 3 4 5])) ~= length(secondbinfittype)
    disp(' ');
    disp('  You must enter a valid number to continue.');
    disp('  Please start over.');
    return;
end
if secondbinfittype == 5
    secondbinfittype = [1 2 3 4];
end





keyboard









% PARAMETERS:
%   
%   branch bif/term prob
%   taper rate
%     pooled taper rate
%     bifurcation taper rate
%     termination taper rate
%   piece bif prob
%     pooled piece term prob
%     bifurcation piece bif prob
%   piece term prob
%     pooled piece term prob
%     termination piece term prob
%   rall ratio
%     rall ratio D^1
%     rall ratio D^3/2
%     rall ratio D^2
%   parent/daughter ratio
%     parent/daughter1 ratio
%     parent/daughter2 ratio
%   daughter ratio
      
% VERSUSES:
%   
%   diameter
%   path length
%   radial distance
%   doublebin
%     firstbin - diameter
%       secondbin - path length
%       secondbin - radial distance
%     firstbin - path length
%       secondbin - diameter
%       secondbin - radial distance
%     firstbin - radial distance
%         secondbin - diameter
%         secondbin - path length

% STATISTICS:
%   
%   mean
%   std
%   skew
%   kurt

% FITS:
%   
%   logit/probit
%   linear/exponential/power/sigmoid
%     unweighted/weighted/robust/robustweighted

parameterfits = parameterfitter1(analysis);
parameterfits = parameterfitter2(analysis,parameterfits);
parameterfits = parameterfitter3(analysis,parameterfits);
parameterfits = parameterfitter4(analysis,parameterfits);
parameterfits = parameterfitter5(analysis,parameterfits);
parameterfits = parameterfitter6(analysis,parameterfits);
parameterfits = parameterfitter7(analysis,parameterfits);


warning('on','MATLAB:Axis:NegativeDataInLogAxis');
warning('on','MATLAB:Axes:NegativeDataInLogAxis');
warning('on','MATLAB:divideByZero');
warning('on','MATLAB:nearlySingularMatrix');
warning('on','MATLAB:log:logOfZero');
warning('on','optim:lsqncommon:SwitchToLineSearch');



cd(mnpop.datapathname);
fitsname = sprintf('%s_parameterfits',mnpop.inputfilename);
assignin('caller',fitsname,parameterfits);
assignin('base',fitsname,parameterfits);
eval([fitsname '=parameterfits;']);
save(sprintf('%s_%s_%s',mnpop.inputfilename,mnpop.datetime,'parameterfits.mat'),fitsname);

% if strcmp(option.mnanalyzer.clear.data,'n') == 1
%     assignin('base',dataname,data);
% end
% if strcmp(option.mnanalyzer.clear.analysis,'n') == 1
%     assignin('base',analysisname,analysis);
% end
% if strcmp(option.mnanalyzer.save.data,'n') ~= 1
%     eval([dataname '=data;']);
%     save(sprintf('%s_%s_%s',mnpop.inputfilename,mnpop.datetime,'data.mat'),dataname);
% end
% if strcmp(option.mnanalyzer.save.analysis,'n') ~= 1
%     eval([analysisname '=analysis;']);
%     save(sprintf('%s_%s_%s',mnpop.inputfilename,mnpop.datetime,'analysis.mat'),analysisname);
% end

cd(mnhome);

disp('  ------------------------------------');
disp('   DoubleBin Fitter completed.');
disp('  ------------------------------------');
disp(' ');