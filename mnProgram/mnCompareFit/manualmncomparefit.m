function mncomparefitoption = manualmncomparefit(mncomparefitoption)

mncomparefitoption.figuresopen = 'y';

[helppath,addpaths] = fileparts(which('mnaddpaths.m'));
cd(helppath);
cd ..
mnhome = cd;

mncomparefitoptions_none;

%disp(' ');
%disp('  ------------------------------------');
%disp('   Manual Parameter Analysis started.');
%disp('  ------------------------------------');

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
%disp(' ');
disp('    Parameters:');
disp('      1. Branch Type Probability');
disp('      2. Taper Rate');
disp('      3. Piece Bifurcation Probability');
disp('      4. Piece Termination Probability');
disp('      5. Rall Ratio');
disp('      6. Daughter Ratio');
disp('      7. Parent / Daughter Ratio');
disp(' ');
disp('    Please enter the number of the');
parameternumber = input('    parameter to be visualized: ');

if isempty(parameternumber) == 1
    disp(' ');
    disp('  You must enter a valid number to continue.');
    disp('  Please start over.');
    return;
elseif sum(ismember(parameternumber,[1 2 3 4 5 6 7])) ~= length(parameternumber) 
    disp(' ');
    disp('  You must enter a valid number to continue.');
    disp('  Please start over.');
    return;
end

if ismember(1,parameternumber)
	mncomparefitoption.branchtypeprob.fit = 'y';
end

    
if ismember(2,parameternumber) == 1
   mncomparefitoption.taperrate.fit = 'y';
	
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

   if ismember(1,taperratetype)
		mncomparefitoption.taperrate.pooled = 'y';
   end
   if ismember(2,taperratetype)
		mncomparefitoption.taperrate.bifurcation = 'y';
   end
   if ismember(3,taperratetype)
		mncomparefitoption.taperrate.termination = 'y';
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
   if ismember(1,taperratestatistic)
		mncomparefitoption.taperrate.mean = 'y';
   end	
   if ismember(2,taperratestatistic)
		mncomparefitoption.taperrate.std = 'y';
   end	
   if ismember(3,taperratestatistic)
		mncomparefitoption.taperrate.skew = 'y';
   end	
   if ismember(4,taperratestatistic)
		mncomparefitoption.taperrate.kurt = 'y';
   end	   
   
   disp(' ');
   disp('  ------------------------------------');
   disp(' ');
   disp('    Taper Rate Fit:');
   disp('      1. Linear');
   disp('      2. Exponential');
   disp('      3. Exponential w/ Offset');
   disp('      4. Power');
   disp('      5. Power w/ Offset');
   disp('      6. Sigmoid');
   disp(' ');
   disp('    Please enter the number of the');
   taperratefit = input('    fit to be visualized: ');
   if isempty(taperratefit) == 1
       disp(' ');
       disp('  You must enter a valid number to continue.');
       disp('  Please start over.');
       return;
   elseif sum(ismember(taperratefit,[1 2 3 4 5 6])) ~= length(taperratefit)
       disp(' ');
       disp('  You must enter a valid number to continue.');
       disp('  Please start over.');
       return;
   end
   if ismember(1,taperratefit)
		mncomparefitoption.taperrate.singlebins.linear = 'y';
   end	
   if ismember(2,taperratefit)
		mncomparefitoption.taperrate.singlebins.exponential = 'y';
   end	
   if ismember(3,taperratefit)
		mncomparefitoption.taperrate.singlebins.exponentialoffset = 'y';
   end	
   if ismember(4,taperratefit)
		mncomparefitoption.taperrate.singlebins.power = 'y';
   end	
   if ismember(5,taperratefit)
		mncomparefitoption.taperrate.singlebins.poweroffset = 'y';
   end	
   if ismember(6,taperratefit)
		mncomparefitoption.taperrate.singlebins.sigmoid = 'y';
   end	
   
   disp(' ');
   disp('  ------------------------------------');
   disp(' ');
   disp('    Taper Rate Fit Type:');
   disp('      1. Unweighted');
   disp('      2. Weighted');
   disp('      3. Robust');
   disp('      4. Robust Weighted');
   disp(' ');
   disp('    Please enter the number of the');
   taperratefittype = input('    fit type to be visualized: ');
   if isempty(taperratefittype) == 1
       disp(' ');
       disp('  You must enter a valid number to continue.');
       disp('  Please start over.');
       return;
   elseif sum(ismember(taperratefittype,[1 2 3 4])) ~= length(taperratefittype)
       disp(' ');
       disp('  You must enter a valid number to continue.');
       disp('  Please start over.');
       return;
   end
   if ismember(1,taperratefittype)
		mncomparefitoption.taperrate.singlebins.unweighted = 'y';
   end	
   if ismember(2,taperratefittype)
		mncomparefitoption.taperrate.singlebins.weighted = 'y';
   end	
   if ismember(3,taperratefittype)
		mncomparefitoption.taperrate.singlebins.robust = 'y';
   end	
   if ismember(4,taperratefittype)
		mncomparefitoption.taperrate.singlebins.robustweighted = 'y';
   end	
      
end

if ismember(3,parameternumber) == 1
mncomparefitoption.piecebifprob.fit = 'y';

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
	if ismember(1,piecebifprobtype)
		mncomparefitoption.piecebifprob.pooled = 'y';
	end
	if ismember(2,piecebifprobtype)
		mncomparefitoption.piecebifprob.bifterm = 'y';
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
	if ismember(1,piecebifprobby)
		mncomparefitoption.piecebifprob.bylength = 'y';
	end
	if ismember(2,piecebifprobby)
		mncomparefitoption.piecebifprob.bysurfacearea = 'y';
	end
	if ismember(3,piecebifprobby)
		mncomparefitoption.piecebifprob.byvolume = 'y';
    end
    
   disp(' ');
   disp('  ------------------------------------');
   disp(' ');
   disp('    Piece Bifurcation Probability Fit:');
   disp('      1. Linear');
   disp('      2. Exponential');
   disp('      3. Exponential w/ Offset');
   disp('      4. Power');
   disp('      5. Power w/ Offset');
   disp('      6. Sigmoid');
   disp(' ');
   disp('    Please enter the number of the');
   piecebifprobfit = input('    fit to be visualized: ');
   if isempty(piecebifprobfit) == 1
       disp(' ');
       disp('  You must enter a valid number to continue.');
       disp('  Please start over.');
       return;
   elseif sum(ismember(piecebifprobfit,[1 2 3 4 5 6])) ~= length(piecebifprobfit)
       disp(' ');
       disp('  You must enter a valid number to continue.');
       disp('  Please start over.');
       return;
   end
   if ismember(1,piecebifprobfit)
		mncomparefitoption.piecebifprob.singlebins.linear = 'y';
   end	
   if ismember(2,piecebifprobfit)
		mncomparefitoption.piecebifprob.singlebins.exponential = 'y';
   end	
   if ismember(3,piecebifprobfit)
		mncomparefitoption.piecebifprob.singlebins.exponentialoffset = 'y';
   end	
   if ismember(4,piecebifprobfit)
		mncomparefitoption.piecebifprob.singlebins.power = 'y';
   end	
   if ismember(5,piecebifprobfit)
		mncomparefitoption.piecebifprob.singlebins.poweroffset = 'y';
   end	
   if ismember(6,piecebifprobfit)
		mncomparefitoption.piecebifprob.singlebins.sigmoid = 'y';
   end	
   
   disp(' ');
   disp('  ------------------------------------');
   disp(' ');
   disp('    Piece Bifurcation Probability Fit Type:');
   disp('      1. Unweighted');
   disp('      2. Weighted');
   disp('      3. Robust');
   disp('      4. Robust Weighted');
   disp(' ');
   disp('    Please enter the number of the');
   piecebifprobfittype = input('    fit type to be visualized: ');
   if isempty(piecebifprobfittype) == 1
       disp(' ');
       disp('  You must enter a valid number to continue.');
       disp('  Please start over.');
       return;
   elseif sum(ismember(piecebifprobfittype,[1 2 3 4])) ~= length(piecebifprobfittype)
       disp(' ');
       disp('  You must enter a valid number to continue.');
       disp('  Please start over.');
       return;
   end
   if ismember(1,piecebifprobfittype)
		mncomparefitoption.piecebifprob.singlebins.unweighted = 'y';
   end	
   if ismember(2,piecebifprobfittype)
		mncomparefitoption.piecebifprob.singlebins.weighted = 'y';
   end	
   if ismember(3,piecebifprobfittype)
		mncomparefitoption.piecebifprob.singlebins.robust = 'y';
   end	
   if ismember(4,piecebifprobfittype)
		mncomparefitoption.piecebifprob.singlebins.robustweighted = 'y';
   end	
    
end

if ismember(4,parameternumber) == 1
mncomparefitoption.piecetermprob.fit = 'y';

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
	if ismember(1,piecetermprobtype)
		mncomparefitoption.piecetermprob.pooled = 'y';
	end
	if ismember(2,piecetermprobtype)
		mncomparefitoption.piecetermprob.bifterm = 'y';
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
	if ismember(1,piecetermprobby)
		mncomparefitoption.piecetermprob.bylength = 'y';
	end
	if ismember(2,piecetermprobby)
		mncomparefitoption.piecetermprob.bysurfacearea = 'y';
	end
	if ismember(3,piecetermprobby)
		mncomparefitoption.piecetermprob.byvolume = 'y';
    end
    
    
   disp(' ');
   disp('  ------------------------------------');
   disp(' ');
   disp('    Piece Termination Probability Fit:');
   disp('      1. Linear');
   disp('      2. Exponential');
   disp('      3. Exponential w/ Offset');
   disp('      4. Power');
   disp('      5. Power w/ Offset');
   disp('      6. Sigmoid');
   disp(' ');
   disp('    Please enter the number of the');
   piecetermprobfit = input('    fit to be visualized: ');
   if isempty(piecetermprobfit) == 1
       disp(' ');
       disp('  You must enter a valid number to continue.');
       disp('  Please start over.');
       return;
   elseif sum(ismember(piecetermprobfit,[1 2 3 4 5 6])) ~= length(piecetermprobfit)
       disp(' ');
       disp('  You must enter a valid number to continue.');
       disp('  Please start over.');
       return;
   end
   if ismember(1,piecetermprobfit)
		mncomparefitoption.piecetermprob.singlebins.linear = 'y';
   end	
   if ismember(2,piecetermprobfit)
		mncomparefitoption.piecetermprob.singlebins.exponential = 'y';
   end	
   if ismember(3,piecetermprobfit)
		mncomparefitoption.piecetermprob.singlebins.exponentialoffset = 'y';
   end	
   if ismember(4,piecetermprobfit)
		mncomparefitoption.piecetermprob.singlebins.power = 'y';
   end	
   if ismember(5,piecetermprobfit)
		mncomparefitoption.piecetermprob.singlebins.poweroffset = 'y';
   end	
   if ismember(6,piecetermprobfit)
		mncomparefitoption.piecetermprob.singlebins.sigmoid = 'y';
   end	
   
   disp(' ');
   disp('  ------------------------------------');
   disp(' ');
   disp('    Piece Termination Probability Fit Type:');
   disp('      1. Unweighted');
   disp('      2. Weighted');
   disp('      3. Robust');
   disp('      4. Robust Weighted');
   disp(' ');
   disp('    Please enter the number of the');
   piecetermprobfittype = input('    fit type to be visualized: ');
   if isempty(piecetermprobfittype) == 1
       disp(' ');
       disp('  You must enter a valid number to continue.');
       disp('  Please start over.');
       return;
   elseif sum(ismember(piecetermprobfittype,[1 2 3 4])) ~= length(piecetermprobfittype)
       disp(' ');
       disp('  You must enter a valid number to continue.');
       disp('  Please start over.');
       return;
   end
   if ismember(1,piecetermprobfittype)
		mncomparefitoption.piecetermprob.singlebins.unweighted = 'y';
   end	
   if ismember(2,piecetermprobfittype)
		mncomparefitoption.piecetermprob.singlebins.weighted = 'y';
   end	
   if ismember(3,piecetermprobfittype)
		mncomparefitoption.piecetermprob.singlebins.robust = 'y';
   end	
   if ismember(4,piecetermprobfittype)
		mncomparefitoption.piecetermprob.singlebins.robustweighted = 'y';
   end	    
    
end
    
if ismember(5,parameternumber) == 1
%mncomparefitoption.rallratio.fit = 'y';

    disp(' ');
    disp('  ------------------------------------');
    disp('     Rall Ratio Options');
    disp('  ------------------------------------');
    disp(' ');
    disp('    Rall Ratio Exponents:');
    disp('      1. D^1');
    disp('      2. D^1.5');
    disp('      3. D^2');
	disp('      4. D^3');
    disp('      5. All');
    disp(' ');
    disp('    Please enter the number of the');
    rallratioexponent = input('    exponent to be visualized: ');
    if isempty(rallratioexponent) == 1
        disp(' ');
        disp('  You must enter a valid number to continue.');
        disp('  Please start over.');
        return;
    elseif sum(ismember(rallratioexponent,[1 2 3 4 5])) ~= length(rallratioexponent)
        disp(' ');
        disp('  You must enter a valid number to continue.');
        disp('  Please start over.');
        return;
    end
    if rallratioexponent == 5
        rallratioexponent = [1 2 3 4];
    end
	if ismember(1,rallratioexponent)
		mncomparefitoption.rallratio1.fit = 'y';
	end
	if ismember(2,rallratioexponent)
		mncomparefitoption.rallratio.fit = 'y';
	end
	if ismember(3,rallratioexponent)
		mncomparefitoption.rallratio2.fit = 'y';
	end
	if ismember(4,rallratioexponent)
		mncomparefitoption.rallratio3.fit = 'y';
	end
    
    disp(' ');
    disp('  ------------------------------------');
    disp(' ');
    disp('    Rall Ratio Statistic:');
    disp('      1. Mean');
    disp('      2. Standard Deviation');
    disp('      3. Skewness');
    disp('      4. Kurtosis');
    disp('      5. All Above');
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
	if ismember(1,rallratiostatistic)
		mncomparefitoption.rallratio.mean = 'y';
	end
	if ismember(2,rallratiostatistic)
		mncomparefitoption.rallratio.std = 'y';
	end
	if ismember(3,rallratiostatistic)
		mncomparefitoption.rallratio.skew = 'y';
	end
	if ismember(4,rallratiostatistic)
		mncomparefitoption.rallratio.kurt = 'y';
	end
	
	
	
	disp(' ');
	disp('  ------------------------------------');
	disp(' ');
	disp('    Rall Ratio Fit:');
	disp('      1. Linear');
	disp('      2. Exponential');
	disp('      3. Exponential w/ Offset');
	disp('      4. Power');
	disp('      5. Power w/ Offset');
	disp('      6. Sigmoid');
	disp(' ');
	disp('    Please enter the number of the');
	rallratiofit = input('    fit to be visualized: ');
	if isempty(rallratiofit) == 1
	   disp(' ');
	   disp('  You must enter a valid number to continue.');
	   disp('  Please start over.');
	   return;
	elseif sum(ismember(rallratiofit,[1 2 3 4 5 6])) ~= length(rallratiofit)
	   disp(' ');
	   disp('  You must enter a valid number to continue.');
	   disp('  Please start over.');
	   return;
	end
	if ismember(1,rallratiofit)
		mncomparefitoption.rallratio.singlebins.linear = 'y';
	end	
	if ismember(2,rallratiofit)
		mncomparefitoption.rallratio.singlebins.exponential = 'y';
	end	
	if ismember(3,rallratiofit)
		mncomparefitoption.rallratio.singlebins.exponentialoffset = 'y';
	end	
	if ismember(4,rallratiofit)
		mncomparefitoption.rallratio.singlebins.power = 'y';
	end	
	if ismember(5,rallratiofit)
		mncomparefitoption.rallratio.singlebins.poweroffset = 'y';
	end	
	if ismember(6,rallratiofit)
		mncomparefitoption.rallratio.singlebins.sigmoid = 'y';
	end	

	disp(' ');
	disp('  ------------------------------------');
	disp(' ');
	disp('    Rall Ratio Fit Type:');
	disp('      1. Unweighted');
	disp('      2. Weighted');
	disp('      3. Robust');
	disp('      4. Robust Weighted');
	disp(' ');
	disp('    Please enter the number of the');
	rallratiofittype = input('    fit type to be visualized: ');
	if isempty(rallratiofittype) == 1
	   disp(' ');
	   disp('  You must enter a valid number to continue.');
	   disp('  Please start over.');
	   return;
	elseif sum(ismember(rallratiofittype,[1 2 3 4])) ~= length(rallratiofittype)
	   disp(' ');
	   disp('  You must enter a valid number to continue.');
	   disp('  Please start over.');
	   return;
	end
	if ismember(1,rallratiofittype)
		mncomparefitoption.rallratio.singlebins.unweighted = 'y';
	end	
	if ismember(2,rallratiofittype)
		mncomparefitoption.rallratio.singlebins.weighted = 'y';
	end	
	if ismember(3,rallratiofittype)
		mncomparefitoption.rallratio.singlebins.robust = 'y';
	end	
	if ismember(4,rallratiofittype)
		mncomparefitoption.rallratio.singlebins.robustweighted = 'y';
	end	


	
	
end


if ismember(6,parameternumber) == 1
mncomparefitoption.daughterratio.fit = 'y';

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
	if ismember(1,daughterratiostatistic)
		mncomparefitoption.daughterratio.mean = 'y';
	end
	if ismember(2,daughterratiostatistic)
		mncomparefitoption.daughterratio.std = 'y';
	end
	if ismember(3,daughterratiostatistic)
		mncomparefitoption.daughterratio.skew = 'y';
	end
	if ismember(4,daughterratiostatistic)
		mncomparefitoption.daughterratio.kurt = 'y';
	end
	
	



	disp(' ');
	disp('  ------------------------------------');
	disp(' ');
	disp('    Daughter Ratio Fit:');
	disp('      1. Linear');
	disp('      2. Exponential');
	disp('      3. Exponential w/ Offset');
	disp('      4. Power');
	disp('      5. Power w/ Offset');
	disp('      6. Sigmoid');
	disp(' ');
	disp('    Please enter the number of the');
	daughterratiofit = input('    fit to be visualized: ');
	if isempty(daughterratiofit) == 1
	   disp(' ');
	   disp('  You must enter a valid number to continue.');
	   disp('  Please start over.');
	   return;
	elseif sum(ismember(daughterratiofit,[1 2 3 4 5 6])) ~= length(daughterratiofit)
	   disp(' ');
	   disp('  You must enter a valid number to continue.');
	   disp('  Please start over.');
	   return;
	end
	if ismember(1,daughterratiofit)
		mncomparefitoption.daughterratio.singlebins.linear = 'y';
	end	
	if ismember(2,daughterratiofit)
		mncomparefitoption.daughterratio.singlebins.exponential = 'y';
	end	
	if ismember(3,daughterratiofit)
		mncomparefitoption.daughterratio.singlebins.exponentialoffset = 'y';
	end	
	if ismember(4,daughterratiofit)
		mncomparefitoption.daughterratio.singlebins.power = 'y';
	end	
	if ismember(5,daughterratiofit)
		mncomparefitoption.daughterratio.singlebins.poweroffset = 'y';
	end	
	if ismember(6,daughterratiofit)
		mncomparefitoption.daughterratio.singlebins.sigmoid = 'y';
	end	

	disp(' ');
	disp('  ------------------------------------');
	disp(' ');
	disp('    Daughter Ratio Fit Type:');
	disp('      1. Unweighted');
	disp('      2. Weighted');
	disp('      3. Robust');
	disp('      4. Robust Weighted');
	disp(' ');
	disp('    Please enter the number of the');
	daughterratiofittype = input('    fit type to be visualized: ');
	if isempty(daughterratiofittype) == 1
	   disp(' ');
	   disp('  You must enter a valid number to continue.');
	   disp('  Please start over.');
	   return;
	elseif sum(ismember(daughterratiofittype,[1 2 3 4])) ~= length(daughterratiofittype)
	   disp(' ');
	   disp('  You must enter a valid number to continue.');
	   disp('  Please start over.');
	   return;
	end
	if ismember(1,daughterratiofittype)
		mncomparefitoption.daughterratio.singlebins.unweighted = 'y';
	end	
	if ismember(2,daughterratiofittype)
		mncomparefitoption.daughterratio.singlebins.weighted = 'y';
	end	
	if ismember(3,daughterratiofittype)
		mncomparefitoption.daughterratio.singlebins.robust = 'y';
	end	
	if ismember(4,daughterratiofittype)
		mncomparefitoption.daughterratio.singlebins.robustweighted = 'y';
	end	



	
	
	
end


if ismember(7,parameternumber) == 1
mncomparefitoption.parentdaughterratio.fit = 'y';

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
	if ismember(1,parentdaughterratiotype)
		mncomparefitoption.parentdaughterratio.fit = 'y';
	end
	if ismember(2,parentdaughterratiotype)
		mncomparefitoption.parentdaughter2ratio.fit = 'y';
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
	if ismember(1,parentdaughterratiostatistic)
		mncomparefitoption.parentdaughterratio.mean = 'y';
	end
	if ismember(2,parentdaughterratiostatistic)
		mncomparefitoption.parentdaughterratio.std = 'y';
	end
	if ismember(3,parentdaughterratiostatistic)
		mncomparefitoption.parentdaughterratio.skew = 'y';
	end
	if ismember(4,parentdaughterratiostatistic)
		mncomparefitoption.parentdaughterratio.kurt = 'y';
	end
	
	
	
	
	
	disp(' ');
	disp('  ------------------------------------');
	disp(' ');
	disp('    Parent/Daughter Ratio Fit:');
	disp('      1. Linear');
	disp('      2. Exponential');
	disp('      3. Exponential w/ Offset');
	disp('      4. Power');
	disp('      5. Power w/ Offset');
	disp('      6. Sigmoid');
	disp(' ');
	disp('    Please enter the number of the');
	parentdaughterratiofit = input('    fit to be visualized: ');
	if isempty(parentdaughterratiofit) == 1
	   disp(' ');
	   disp('  You must enter a valid number to continue.');
	   disp('  Please start over.');
	   return;
	elseif sum(ismember(parentdaughterratiofit,[1 2 3 4 5 6])) ~= length(parentdaughterratiofit)
	   disp(' ');
	   disp('  You must enter a valid number to continue.');
	   disp('  Please start over.');
	   return;
	end
	if ismember(1,parentdaughterratiofit)
		mncomparefitoption.parentdaughterratio.singlebins.linear = 'y';
	end	
	if ismember(2,parentdaughterratiofit)
		mncomparefitoption.parentdaughterratio.singlebins.exponential = 'y';
	end	
	if ismember(3,parentdaughterratiofit)
		mncomparefitoption.parentdaughterratio.singlebins.exponentialoffset = 'y';
	end	
	if ismember(4,parentdaughterratiofit)
		mncomparefitoption.parentdaughterratio.singlebins.power = 'y';
	end	
	if ismember(5,parentdaughterratiofit)
		mncomparefitoption.parentdaughterratio.singlebins.poweroffset = 'y';
	end	
	if ismember(6,parentdaughterratiofit)
		mncomparefitoption.parentdaughterratio.singlebins.sigmoid = 'y';
	end	

	disp(' ');
	disp('  ------------------------------------');
	disp(' ');
	disp('    Parent/Daughter Ratio Fit Type:');
	disp('      1. Unweighted');
	disp('      2. Weighted');
	disp('      3. Robust');
	disp('      4. Robust Weighted');
	disp(' ');
	disp('    Please enter the number of the');
	parentdaughterratiofittype = input('    fit type to be visualized: ');
	if isempty(parentdaughterratiofittype) == 1
	   disp(' ');
	   disp('  You must enter a valid number to continue.');
	   disp('  Please start over.');
	   return;
	elseif sum(ismember(parentdaughterratiofittype,[1 2 3 4])) ~= length(parentdaughterratiofittype)
	   disp(' ');
	   disp('  You must enter a valid number to continue.');
	   disp('  Please start over.');
	   return;
	end
	if ismember(1,parentdaughterratiofittype)
		mncomparefitoption.parentdaughterratio.singlebins.unweighted = 'y';
	end	
	if ismember(2,parentdaughterratiofittype)
		mncomparefitoption.parentdaughterratio.singlebins.weighted = 'y';
	end	
	if ismember(3,parentdaughterratiofittype)
		mncomparefitoption.parentdaughterratio.singlebins.robust = 'y';
	end	
	if ismember(4,parentdaughterratiofittype)
		mncomparefitoption.parentdaughterratio.singlebins.robustweighted = 'y';
	end	




	
	
end

    
if length(parameternumber) > sum(ismember(1,parameternumber))
	
	disp(' ');
	disp('  ------------------------------------');
	disp('     Choose Parameter Relationship');
	disp('  ------------------------------------');
	disp(' ');
	disp('    Versus Single Bins:');
	disp('      1. Diameter');
	disp('      2. Path Length');
	disp('      3. Radial Distance');
	disp('      4. Branch Length');
	disp('      5. All Single Bins');
	disp('    Versus Double Bins:');
	disp('      6. Diameter -> Path Length');
	disp('      7. Path Length -> Diameter');
	disp('      8. Both Double Bins');
	disp('    Complete Analysis:');
	disp('      9. All Single & Double Bins');
	disp(' ');
	disp('  Please enter the number of the');
	versusnumber = input('  x-axis to be visualized: ');

	if isempty(versusnumber) == 1
		disp(' ');
		disp('  You must enter a valid number to continue.');
		disp('  Please start over.');
		return;
	elseif sum(ismember(versusnumber,[1 2 3 4 5 6 7 8 9])) ~= length(versusnumber)
		disp(' ');
		disp('  You must enter a valid number to continue.');
		disp('  Please start over.');
		return;
	end
	if versusnumber == 5
		versusnumber = [1 2 3 4];
	elseif versusnumber == 8
		versusnumber = [6 7];
	elseif versusnumber == 9
		versusnumber = [1 2 3 4 6 7];
	end
	
	if ismember(1,versusnumber)
		if ismember(2,parameternumber)
			mncomparefitoption.taperrate.fit = 'y';
			mncomparefitoption.taperrate.singlebins.fit = 'y';
			mncomparefitoption.taperrate.diameter.fit = 'y';
		end
		if ismember(3,parameternumber)
			mncomparefitoption.piecebifprob.fit = 'y';
			mncomparefitoption.piecebifprob.singlebins.fit = 'y';
			mncomparefitoption.piecebifprob.diameter.fit = 'y';
		end
		if ismember(4,parameternumber)
			mncomparefitoption.piecetermprob.fit = 'y';
			mncomparefitoption.piecetermprob.singlebins.fit = 'y';
			mncomparefitoption.piecetermprob.diameter.fit = 'y';
		end
		if ismember(5,parameternumber)
			mncomparefitoption.rallratio.fit = 'y';
			mncomparefitoption.rallratio.singlebins.fit = 'y';
			mncomparefitoption.rallratio.diameter.fit = 'y';
		end
		if ismember(6,parameternumber)
			mncomparefitoption.daughterratio.fit = 'y';
			mncomparefitoption.daughterratio.singlebins.fit = 'y';
			mncomparefitoption.daughterratio.diameter.fit = 'y';
		end
		if ismember(7,parameternumber)
			mncomparefitoption.parentdaughterratio.fit = 'y';
			mncomparefitoption.parentdaughterratio.singlebins.fit = 'y';
			mncomparefitoption.parentdaughterratio.diameter.fit = 'y';
		end
	end
	
	if ismember(2,versusnumber)
		if ismember(2,parameternumber)
			mncomparefitoption.taperrate.fit = 'y';
			mncomparefitoption.taperrate.singlebins.fit = 'y';
			mncomparefitoption.taperrate.pathlength.fit = 'y';
		end
		if ismember(3,parameternumber)
			mncomparefitoption.piecebifprob.fit = 'y';
			mncomparefitoption.piecebifprob.singlebins.fit = 'y';
			mncomparefitoption.piecebifprob.pathlength.fit = 'y';
		end
		if ismember(4,parameternumber)
			mncomparefitoption.piecetermprob.fit = 'y';
			mncomparefitoption.piecetermprob.singlebins.fit = 'y';
			mncomparefitoption.piecetermprob.pathlength.fit = 'y';
		end
		if ismember(5,parameternumber)
			mncomparefitoption.rallratio.fit = 'y';
			mncomparefitoption.rallratio.singlebins.fit = 'y';
			mncomparefitoption.rallratio.pathlength.fit = 'y';
		end
		if ismember(6,parameternumber)
			mncomparefitoption.daughterratio.fit = 'y';
			mncomparefitoption.daughterratio.singlebins.fit = 'y';
			mncomparefitoption.daughterratio.pathlength.fit = 'y';
		end
		if ismember(7,parameternumber)
			mncomparefitoption.parentdaughterratio.fit = 'y';
			mncomparefitoption.parentdaughterratio.singlebins.fit = 'y';
			mncomparefitoption.parentdaughterratio.pathlength.fit = 'y';
		end		
	end
	
	if ismember(3,versusnumber)
		if ismember(2,parameternumber)
			mncomparefitoption.taperrate.fit = 'y';
			mncomparefitoption.taperrate.singlebins.fit = 'y';
			mncomparefitoption.taperrate.radialdistance.fit = 'y';
		end
		if ismember(3,parameternumber)
			mncomparefitoption.piecebifprob.fit = 'y';
			mncomparefitoption.piecebifprob.singlebins.fit = 'y';
			mncomparefitoption.piecebifprob.radialdistance.fit = 'y';
		end
		if ismember(4,parameternumber)
			mncomparefitoption.piecetermprob.fit = 'y';
			mncomparefitoption.piecetermprob.singlebins.fit = 'y';
			mncomparefitoption.piecetermprob.radialdistance.fit = 'y';
		end
		if ismember(5,parameternumber)
			mncomparefitoption.rallratio.fit = 'y';
			mncomparefitoption.rallratio.singlebins.fit = 'y';
			mncomparefitoption.rallratio.radialdistance.fit = 'y';
		end
		if ismember(6,parameternumber)
			mncomparefitoption.daughterratio.fit = 'y';
			mncomparefitoption.daughterratio.singlebins.fit = 'y';
			mncomparefitoption.daughterratio.radialdistance.fit = 'y';
		end
		if ismember(7,parameternumber)
			mncomparefitoption.parentdaughterratio.fit = 'y';
			mncomparefitoption.parentdaughterratio.singlebins.fit = 'y';
			mncomparefitoption.parentdaughterratio.radialdistance.fit = 'y';
		end		
	end
	
	if ismember(4,versusnumber)
		if ismember(2,parameternumber)
			mncomparefitoption.taperrate.fit = 'y';
			mncomparefitoption.taperrate.singlebins.fit = 'y';
			mncomparefitoption.taperrate.branchlength.fit = 'y';
		end
		if ismember(3,parameternumber)
			mncomparefitoption.piecebifprob.fit = 'y';
			mncomparefitoption.piecebifprob.singlebins.fit = 'y';
			mncomparefitoption.piecebifprob.branchlength.fit = 'y';
		end
		if ismember(4,parameternumber)
			mncomparefitoption.piecetermprob.fit = 'y';
			mncomparefitoption.piecetermprob.singlebins.fit = 'y';
			mncomparefitoption.piecetermprob.branchlength.fit = 'y';
		end
		if ismember(5,parameternumber)
			mncomparefitoption.rallratio.fit = 'y';
			mncomparefitoption.rallratio.singlebins.fit = 'y';
			mncomparefitoption.rallratio.branchlength.fit = 'y';
		end
		if ismember(6,parameternumber)
			mncomparefitoption.daughterratio.fit = 'y';
			mncomparefitoption.daughterratio.singlebins.fit = 'y';
			mncomparefitoption.daughterratio.branchlength.fit = 'y';
		end
		if ismember(7,parameternumber)
			mncomparefitoption.parentdaughterratio.fit = 'y';
			mncomparefitoption.parentdaughterratio.singlebins.fit = 'y';
			mncomparefitoption.parentdaughterratio.branchlength.fit = 'y';
		end		
	end
	
	if ismember(6,versusnumber) || ismember(7,versusnumber)
		if ismember(6,versusnumber)
			if ismember(2,parameternumber)
				mncomparefitoption.taperrate.diameter.pathlength = 'y';
			end
			if ismember(3,parameternumber)
				mncomparefitoption.piecebifprob.diameter.pathlength = 'y';
			end
			if ismember(4,parameternumber)
				mncomparefitoption.piecetermprob.diameter.pathlength = 'y';
			end
			if ismember(5,parameternumber)
				mncomparefitoption.rallratio.diameter.pathlength = 'y';
			end
			if ismember(6,parameternumber)
				mncomparefitoption.daughterratio.diameter.pathlength = 'y';
			end
			if ismember(7,parameternumber)
				mncomparefitoption.parentdaughterratio.diameter.pathlength = 'y';
			end		
		end
		if ismember(7,versusnumber)
			if ismember(2,parameternumber)
				mncomparefitoption.taperrate.pathlength.diameter = 'y';
			end
			if ismember(3,parameternumber)
				mncomparefitoption.piecebifprob.pathlength.diameter = 'y';
			end
			if ismember(4,parameternumber)
				mncomparefitoption.piecetermprob.pathlength.diameter = 'y';
			end
			if ismember(5,parameternumber)
				mncomparefitoption.rallratio.pathlength.diameter = 'y';
			end
			if ismember(6,parameternumber)
				mncomparefitoption.daughterratio.pathlength.diameter = 'y';
			end
			if ismember(7,parameternumber)
				mncomparefitoption.parentdaughterratio.pathlength.diameter = 'y';
			end		
		end
		
		disp(' ');
		disp('  ------------------------------------');
		disp(' ');
		disp('    Perform First Bin Fits?');
		disp('      1. Yes');
		disp('      2. No');
		firstbinfitsyesno = input('    Please enter a number: ');
		if isempty(firstbinfitsyesno) == 1
			disp(' ');
			disp('  You must enter a valid number to continue.');
			disp('  Please start over.');
			return;
		elseif length(firstbinfitsyesno) > 1
			disp(' ');
			disp('  You must enter only one choice.');
			disp('  Please start over.');
			return;
		end
		if firstbinfitsyesno == 1
			disp(' ');
			disp('  ------------------------------------');
			disp(' ');
			disp('    First Bin Fits:');
			disp('      1. Linear');
			disp('      2. Exponential');
			disp('      3. Exponential w/ Offset');
			disp('      4. Power');
			disp('      5. Power w/ Offset');
			disp('      6. Sigmoidal');
			disp('      7. All');
			disp(' ');
			disp('    Please enter the number of the');
			firstbinfits = input('    fit to be visualized: ');
			if isempty(firstbinfits) == 1
				disp(' ');
				disp('  You must enter a valid number to continue.');
				disp('  Please start over.');
				return;
			elseif sum(ismember(firstbinfits,[1 2 3 4 5 6 7])) ~= length(firstbinfits)
				disp(' ');
				disp('  You must enter a valid number to continue.');
				disp('  Please start over.');
				return;
			end
			if firstbinfits == 7
				firstbinfits = [1 2 3 4 5 6];
			end
			
			if ismember(1,firstbinfits)
				if ismember(2,parameternumber)
					%mncomparefitoption.taperrate.doublebins = 'y';
					mncomparefitoption.taperrate.firstbinfit.fit = 'y';
					mncomparefitoption.taperrate.firstbinfit.linear = 'y';
				end
				if ismember(3,parameternumber)
					%mncomparefitoption.piecebifprob.doublebins = 'y';
					mncomparefitoption.piecebifprob.firstbinfit.fit = 'y';
					mncomparefitoption.piecebifprob.firstbinfit.linear = 'y';
				end
				if ismember(4,parameternumber)
					%mncomparefitoption.piecetermprob.doublebins = 'y';
					mncomparefitoption.piecetermprob.firstbinfit.fit = 'y';
					mncomparefitoption.piecetermprob.firstbinfit.linear = 'y';
				end
				if ismember(5,parameternumber)
					%mncomparefitoption.rallratio.doublebins = 'y';
					mncomparefitoption.rallratio.firstbinfit.fit = 'y';
					mncomparefitoption.rallratio.firstbinfit.linear = 'y';
				end
				if ismember(6,parameternumber)
					%mncomparefitoption.daughterratio.doublebins = 'y';
					mncomparefitoption.daughterratio.firstbinfit.fit = 'y';
					mncomparefitoption.daughterratio.firstbinfit.linear = 'y';
				end
				if ismember(7,parameternumber)
					%mncomparefitoption.parentdaughterratio.doublebins = 'y';
					mncomparefitoption.parentdaughterratio.firstbinfit.fit = 'y';
					mncomparefitoption.parentdaughterratio.firstbinfit.linear = 'y';
				end		
			end
			
			if ismember(2,firstbinfits)
				if ismember(2,parameternumber)
					%mncomparefitoption.taperrate.doublebins = 'y';
					mncomparefitoption.taperrate.firstbinfit.fit = 'y';
					mncomparefitoption.taperrate.firstbinfit.exponential = 'y';
				end
				if ismember(3,parameternumber)
					%mncomparefitoption.piecebifprob.doublebins = 'y';
					mncomparefitoption.piecebifprob.firstbinfit.fit = 'y';
					mncomparefitoption.piecebifprob.firstbinfit.exponential = 'y';
				end
				if ismember(4,parameternumber)
					%mncomparefitoption.piecetermprob.doublebins = 'y';
					mncomparefitoption.piecetermprob.firstbinfit.fit = 'y';
					mncomparefitoption.piecetermprob.firstbinfit.exponential = 'y';
				end
				if ismember(5,parameternumber)
					%mncomparefitoption.rallratio.doublebins = 'y';
					mncomparefitoption.rallratio.firstbinfit.fit = 'y';
					mncomparefitoption.rallratio.firstbinfit.exponential = 'y';
				end
				if ismember(6,parameternumber)
					%mncomparefitoption.daughterratio.doublebins = 'y';
					mncomparefitoption.daughterratio.firstbinfit.fit = 'y';
					mncomparefitoption.daughterratio.firstbinfit.exponential = 'y';
				end
				if ismember(7,parameternumber)
					%mncomparefitoption.parentdaughterratio.doublebins = 'y';
					mncomparefitoption.parentdaughterratio.firstbinfit.fit = 'y';
					mncomparefitoption.parentdaughterratio.firstbinfit.exponential = 'y';
				end		
			end
			
			if ismember(3,firstbinfits)
				if ismember(2,parameternumber)
					%mncomparefitoption.taperrate.doublebins = 'y';
					mncomparefitoption.taperrate.firstbinfit.fit = 'y';
					mncomparefitoption.taperrate.firstbinfit.exponentialoffset = 'y';
				end
				if ismember(3,parameternumber)
					%mncomparefitoption.piecebifprob.doublebins = 'y';
					mncomparefitoption.piecebifprob.firstbinfit.fit = 'y';
					mncomparefitoption.piecebifprob.firstbinfit.exponentialoffset = 'y';
				end
				if ismember(4,parameternumber)
					%mncomparefitoption.piecetermprob.doublebins = 'y';
					mncomparefitoption.piecetermprob.firstbinfit.fit = 'y';
					mncomparefitoption.piecetermprob.firstbinfit.exponentialoffset = 'y';
				end
				if ismember(5,parameternumber)
					%mncomparefitoption.rallratio.doublebins = 'y';
					mncomparefitoption.rallratio.firstbinfit.fit = 'y';
					mncomparefitoption.rallratio.firstbinfit.exponentialoffset = 'y';
				end
				if ismember(6,parameternumber)
					%mncomparefitoption.daughterratio.doublebins = 'y';
					mncomparefitoption.daughterratio.firstbinfit.fit = 'y';
					mncomparefitoption.daughterratio.firstbinfit.exponentialoffset = 'y';
				end
				if ismember(7,parameternumber)
					%mncomparefitoption.parentdaughterratio.doublebins = 'y';
					mncomparefitoption.parentdaughterratio.firstbinfit.fit = 'y';
					mncomparefitoption.parentdaughterratio.firstbinfit.exponentialoffset = 'y';
				end		
			end
			
			if ismember(4,firstbinfits)
				if ismember(2,parameternumber)
					%mncomparefitoption.taperrate.doublebins = 'y';
					mncomparefitoption.taperrate.firstbinfit.fit = 'y';
					mncomparefitoption.taperrate.firstbinfit.power = 'y';
				end
				if ismember(3,parameternumber)
					%mncomparefitoption.piecebifprob.doublebins = 'y';
					mncomparefitoption.piecebifprob.firstbinfit.fit = 'y';
					mncomparefitoption.piecebifprob.firstbinfit.power = 'y';
				end
				if ismember(4,parameternumber)
					%mncomparefitoption.piecetermprob.doublebins = 'y';
					mncomparefitoption.piecetermprob.firstbinfit.fit = 'y';
					mncomparefitoption.piecetermprob.firstbinfit.power = 'y';
				end
				if ismember(5,parameternumber)
					%mncomparefitoption.rallratio.doublebins = 'y';
					mncomparefitoption.rallratio.firstbinfit.fit = 'y';
					mncomparefitoption.rallratio.firstbinfit.power = 'y';
				end
				if ismember(6,parameternumber)
					%mncomparefitoption.daughterratio.doublebins = 'y';
					mncomparefitoption.daughterratio.firstbinfit.fit = 'y';
					mncomparefitoption.daughterratio.firstbinfit.power = 'y';
				end
				if ismember(7,parameternumber)
					%mncomparefitoption.parentdaughterratio.doublebins = 'y';
					mncomparefitoption.parentdaughterratio.firstbinfit.fit = 'y';
					mncomparefitoption.parentdaughterratio.firstbinfit.power = 'y';
				end		
			end
			
			if ismember(5,firstbinfits)
				if ismember(2,parameternumber)
					%mncomparefitoption.taperrate.doublebins = 'y';
					mncomparefitoption.taperrate.firstbinfit.fit = 'y';
					mncomparefitoption.taperrate.firstbinfit.poweroffset = 'y';
				end
				if ismember(3,parameternumber)
					%mncomparefitoption.piecebifprob.doublebins = 'y';
					mncomparefitoption.piecebifprob.firstbinfit.fit = 'y';
					mncomparefitoption.piecebifprob.firstbinfit.poweroffset = 'y';
				end
				if ismember(4,parameternumber)
					%mncomparefitoption.piecetermprob.doublebins = 'y';
					mncomparefitoption.piecetermprob.firstbinfit.fit = 'y';
					mncomparefitoption.piecetermprob.firstbinfit.poweroffset = 'y';
				end
				if ismember(5,parameternumber)
					%mncomparefitoption.rallratio.doublebins = 'y';
					mncomparefitoption.rallratio.firstbinfit.fit = 'y';
					mncomparefitoption.rallratio.firstbinfit.poweroffset = 'y';
				end
				if ismember(6,parameternumber)
					%mncomparefitoption.daughterratio.doublebins = 'y';
					mncomparefitoption.daughterratio.firstbinfit.fit = 'y';
					mncomparefitoption.daughterratio.firstbinfit.poweroffset = 'y';
				end
				if ismember(7,parameternumber)
					%mncomparefitoption.parentdaughterratio.doublebins = 'y';
					mncomparefitoption.parentdaughterratio.firstbinfit.fit = 'y';
					mncomparefitoption.parentdaughterratio.firstbinfit.poweroffset = 'y';
				end		
			end
			
			if ismember(6,firstbinfits)
				if ismember(2,parameternumber)
					%mncomparefitoption.taperrate.doublebins = 'y';
					mncomparefitoption.taperrate.firstbinfit.fit = 'y';
					mncomparefitoption.taperrate.firstbinfit.sigmoid = 'y';
				end
				if ismember(3,parameternumber)
					%mncomparefitoption.piecebifprob.doublebins = 'y';
					mncomparefitoption.piecebifprob.firstbinfit.fit = 'y';
					mncomparefitoption.piecebifprob.firstbinfit.sigmoid = 'y';
				end
				if ismember(4,parameternumber)
					%mncomparefitoption.piecetermprob.doublebins = 'y';
					mncomparefitoption.piecetermprob.firstbinfit.fit = 'y';
					mncomparefitoption.piecetermprob.firstbinfit.sigmoid = 'y';
				end
				if ismember(5,parameternumber)
					%mncomparefitoption.rallratio.doublebins = 'y';
					mncomparefitoption.rallratio.firstbinfit.fit = 'y';
					mncomparefitoption.rallratio.firstbinfit.sigmoid = 'y';
				end
				if ismember(6,parameternumber)
					%mncomparefitoption.daughterratio.doublebins = 'y';
					mncomparefitoption.daughterratio.firstbinfit.fit = 'y';
					mncomparefitoption.daughterratio.firstbinfit.sigmoid = 'y';
				end
				if ismember(7,parameternumber)
					%mncomparefitoption.parentdaughterratio.doublebins = 'y';
					mncomparefitoption.parentdaughterratio.firstbinfit.fit = 'y';
					mncomparefitoption.parentdaughterratio.firstbinfit.sigmoid = 'y';
				end		
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
			firstbinfittypes = input('    fit type to be visualized: ');
			if isempty(firstbinfittypes) == 1
				disp(' ');
				disp('  You must enter a valid number to continue.');
				disp('  Please start over.');
				return;
			elseif sum(ismember(firstbinfittypes,[1 2 3 4 5])) ~= length(firstbinfittypes)
				disp(' ');
				disp('  You must enter a valid number to continue.');
				disp('  Please start over.');
				return;
			end
			if firstbinfittypes == 5
				firstbinfittypes = [1 2 3 4];
			end
			
			if ismember(1,firstbinfittypes)
				if ismember(2,parameternumber)
					%mncomparefitoption.taperrate.doublebins = 'y';
					mncomparefitoption.taperrate.firstbinfit.fit = 'y';
					mncomparefitoption.taperrate.firstbinfittype.unweighted = 'y';
				end
				if ismember(3,parameternumber)
					%mncomparefitoption.piecebifprob.doublebins = 'y';
					mncomparefitoption.piecebifprob.firstbinfit.fit = 'y';
					mncomparefitoption.piecebifprob.firstbinfittype.unweighted = 'y';
				end
				if ismember(4,parameternumber)
					%mncomparefitoption.piecetermprob.doublebins = 'y';
					mncomparefitoption.piecetermprob.firstbinfit.fit = 'y';
					mncomparefitoption.piecetermprob.firstbinfittype.unweighted = 'y';
				end
				if ismember(5,parameternumber)
					%mncomparefitoption.rallratio.doublebins = 'y';
					mncomparefitoption.rallratio.firstbinfit.fit = 'y';
					mncomparefitoption.rallratio.firstbinfittype.unweighted = 'y';
				end
				if ismember(6,parameternumber)
					%mncomparefitoption.daughterratio.doublebins = 'y';
					mncomparefitoption.daughterratio.firstbinfit.fit = 'y';
					mncomparefitoption.daughterratio.firstbinfittype.unweighted = 'y';
				end
				if ismember(7,parameternumber)
					%mncomparefitoption.parentdaughterratio.doublebins = 'y';
					mncomparefitoption.parentdaughterratio.firstbinfit.fit = 'y';
					mncomparefitoption.parentdaughterratio.firstbinfittype.unweighted = 'y';
				end		
			end
			
			if ismember(2,firstbinfittypes)
				if ismember(2,parameternumber)
					%mncomparefitoption.taperrate.doublebins = 'y';
					mncomparefitoption.taperrate.firstbinfit.fit = 'y';
					mncomparefitoption.taperrate.firstbinfittype.weighted = 'y';
				end
				if ismember(3,parameternumber)
					%mncomparefitoption.piecebifprob.doublebins = 'y';
					mncomparefitoption.piecebifprob.firstbinfit.fit = 'y';
					mncomparefitoption.piecebifprob.firstbinfittype.weighted = 'y';
				end
				if ismember(4,parameternumber)
					%mncomparefitoption.piecetermprob.doublebins = 'y';
					mncomparefitoption.piecetermprob.firstbinfit.fit = 'y';
					mncomparefitoption.piecetermprob.firstbinfittype.weighted = 'y';
				end
				if ismember(5,parameternumber)
					%mncomparefitoption.rallratio.doublebins = 'y';
					mncomparefitoption.rallratio.firstbinfit.fit = 'y';
					mncomparefitoption.rallratio.firstbinfittype.weighted = 'y';
				end
				if ismember(6,parameternumber)
					%mncomparefitoption.daughterratio.doublebins = 'y';
					mncomparefitoption.daughterratio.firstbinfit.fit = 'y';
					mncomparefitoption.daughterratio.firstbinfittype.weighted = 'y';
				end
				if ismember(7,parameternumber)
					%mncomparefitoption.parentdaughterratio.doublebins = 'y';
					mncomparefitoption.parentdaughterratio.firstbinfit.fit = 'y';
					mncomparefitoption.parentdaughterratio.firstbinfittype.weighted = 'y';
				end		
			end
			
			if ismember(3,firstbinfittypes)
				if ismember(2,parameternumber)
					%mncomparefitoption.taperrate.doublebins = 'y';
					mncomparefitoption.taperrate.firstbinfit.fit = 'y';
					mncomparefitoption.taperrate.firstbinfittype.robust = 'y';
				end
				if ismember(3,parameternumber)
					%mncomparefitoption.piecebifprob.doublebins = 'y';
					mncomparefitoption.piecebifprob.firstbinfit.fit = 'y';
					mncomparefitoption.piecebifprob.firstbinfittype.robust = 'y';
				end
				if ismember(4,parameternumber)
					%mncomparefitoption.piecetermprob.doublebins = 'y';
					mncomparefitoption.piecetermprob.firstbinfit.fit = 'y';
					mncomparefitoption.piecetermprob.firstbinfittype.robust = 'y';
				end
				if ismember(5,parameternumber)
					%mncomparefitoption.rallratio.doublebins = 'y';
					mncomparefitoption.rallratio.firstbinfit.fit = 'y';
					mncomparefitoption.rallratio.firstbinfittype.robust = 'y';
				end
				if ismember(6,parameternumber)
					%mncomparefitoption.daughterratio.doublebins = 'y';
					mncomparefitoption.daughterratio.firstbinfit.fit = 'y';
					mncomparefitoption.daughterratio.firstbinfittype.robust = 'y';
				end
				if ismember(7,parameternumber)
					%mncomparefitoption.parentdaughterratio.doublebins = 'y';
					mncomparefitoption.parentdaughterratio.firstbinfit.fit = 'y';
					mncomparefitoption.parentdaughterratio.firstbinfittype.robust = 'y';
				end		
			end
			
			if ismember(4,firstbinfittypes)
				if ismember(2,parameternumber)
					%mncomparefitoption.taperrate.doublebins = 'y';
					mncomparefitoption.taperrate.firstbinfit.fit = 'y';
					mncomparefitoption.taperrate.firstbinfittype.robustweighted = 'y';
				end
				if ismember(3,parameternumber)
					%mncomparefitoption.piecebifprob.doublebins = 'y';
					mncomparefitoption.piecebifprob.firstbinfit.fit = 'y';
					mncomparefitoption.piecebifprob.firstbinfittype.robustweighted = 'y';
				end
				if ismember(4,parameternumber)
					%mncomparefitoption.piecetermprob.doublebins = 'y';
					mncomparefitoption.piecetermprob.firstbinfit.fit = 'y';
					mncomparefitoption.piecetermprob.firstbinfittype.robustweighted = 'y';
				end
				if ismember(5,parameternumber)
					%mncomparefitoption.rallratio.doublebins = 'y';
					mncomparefitoption.rallratio.firstbinfit.fit = 'y';
					mncomparefitoption.rallratio.firstbinfittype.robustweighted = 'y';
				end
				if ismember(6,parameternumber)
					%mncomparefitoption.daughterratio.doublebins = 'y';
					mncomparefitoption.daughterratio.firstbinfit.fit = 'y';
					mncomparefitoption.daughterratio.firstbinfittype.robustweighted = 'y';
				end
				if ismember(7,parameternumber)
					%mncomparefitoption.parentdaughterratio.doublebins = 'y';
					mncomparefitoption.parentdaughterratio.firstbinfit.fit = 'y';
					mncomparefitoption.parentdaughterratio.firstbinfittype.robustweighted = 'y';
				end		
			end
			
			
			disp(' ');
			disp('  ------------------------------------');
			disp(' ');
			disp('    Perform Second Bin Fits?');
			disp('    (Fits of First Bin Fit Parameters)');
			disp('      1. Yes');
			disp('      2. No');
			secondbinfitsyesno = input('    Please enter a number: ');
			if isempty(secondbinfitsyesno) == 1
				disp(' ');
				disp('  You must enter a valid number to continue.');
				disp('  Please start over.');
				return;
			elseif length(secondbinfitsyesno) > 1
				disp(' ');
				disp('  You must enter only one choice.');
				disp('  Please start over.');
				return;
			end
			if secondbinfitsyesno == 1
				disp(' ');
				disp('  ------------------------------------');
				disp(' ');
				disp('    Second Bin Fits:');
				disp('      1. Linear');
				disp('      2. Exponential');
				disp('      3. Exponential w/ Offset');
				disp('      4. Power');
				disp('      5. Power w/ Offset');
				disp('      6. Sigmoidal');
				disp('      7. All');
				disp(' ');
				disp('    Please enter the number of the');
				secondbinfits = input('    fit to be visualized: ');
				if isempty(secondbinfits) == 1
					disp(' ');
					disp('  You must enter a valid number to continue.');
					disp('  Please start over.');
					return;
				elseif sum(ismember(secondbinfits,[1 2 3 4 5 6 7])) ~= length(secondbinfits)
					disp(' ');
					disp('  You must enter a valid number to continue.');
					disp('  Please start over.');
					return;
				end
				if secondbinfits == 7
					secondbinfits = [1 2 3 4 5 6];
				end
				
				if ismember(1,secondbinfits)
					if ismember(2,parameternumber)
						%mncomparefitoption.taperrate.doublebins = 'y';
						mncomparefitoption.taperrate.secondbinfit.fit = 'y';
						mncomparefitoption.taperrate.secondbinfit.linear = 'y';
					end
					if ismember(3,parameternumber)
						%mncomparefitoption.piecebifprob.doublebins = 'y';
						mncomparefitoption.piecebifprob.secondbinfit.fit = 'y';
						mncomparefitoption.piecebifprob.secondbinfit.linear = 'y';
					end
					if ismember(4,parameternumber)
						%mncomparefitoption.piecetermprob.doublebins = 'y';
						mncomparefitoption.piecetermprob.secondbinfit.fit = 'y';
						mncomparefitoption.piecetermprob.secondbinfit.linear = 'y';
					end
					if ismember(5,parameternumber)
						%mncomparefitoption.rallratio.doublebins = 'y';
						mncomparefitoption.rallratio.secondbinfit.fit = 'y';
						mncomparefitoption.rallratio.secondbinfit.linear = 'y';
					end
					if ismember(6,parameternumber)
						%mncomparefitoption.daughterratio.doublebins = 'y';
						mncomparefitoption.daughterratio.secondbinfit.fit = 'y';
						mncomparefitoption.daughterratio.secondbinfit.linear = 'y';
					end
					if ismember(7,parameternumber)
						%mncomparefitoption.parentdaughterratio.doublebins = 'y';
						mncomparefitoption.parentdaughterratio.secondbinfit.fit = 'y';
						mncomparefitoption.parentdaughterratio.secondbinfit.linear = 'y';
					end		
				end
				
				if ismember(2,secondbinfits)
					if ismember(2,parameternumber)
						%mncomparefitoption.taperrate.doublebins = 'y';
						mncomparefitoption.taperrate.secondbinfit.fit = 'y';
						mncomparefitoption.taperrate.secondbinfit.exponential = 'y';
					end
					if ismember(3,parameternumber)
						%mncomparefitoption.piecebifprob.doublebins = 'y';
						mncomparefitoption.piecebifprob.secondbinfit.fit = 'y';
						mncomparefitoption.piecebifprob.secondbinfit.exponential = 'y';
					end
					if ismember(4,parameternumber)
						%mncomparefitoption.piecetermprob.doublebins = 'y';
						mncomparefitoption.piecetermprob.secondbinfit.fit = 'y';
						mncomparefitoption.piecetermprob.secondbinfit.exponential = 'y';
					end
					if ismember(5,parameternumber)
						%mncomparefitoption.rallratio.doublebins = 'y';
						mncomparefitoption.rallratio.secondbinfit.fit = 'y';
						mncomparefitoption.rallratio.secondbinfit.exponential = 'y';
					end
					if ismember(6,parameternumber)
						%mncomparefitoption.daughterratio.doublebins = 'y';
						mncomparefitoption.daughterratio.secondbinfit.fit = 'y';
						mncomparefitoption.daughterratio.secondbinfit.exponential = 'y';
					end
					if ismember(7,parameternumber)
						%mncomparefitoption.parentdaughterratio.doublebins = 'y';
						mncomparefitoption.parentdaughterratio.secondbinfit.fit = 'y';
						mncomparefitoption.parentdaughterratio.secondbinfit.exponential = 'y';
					end		
				end
				
				if ismember(3,secondbinfits)
					if ismember(2,parameternumber)
						%mncomparefitoption.taperrate.doublebins = 'y';
						mncomparefitoption.taperrate.secondbinfit.fit = 'y';
						mncomparefitoption.taperrate.secondbinfit.exponentialoffset = 'y';
					end
					if ismember(3,parameternumber)
						%mncomparefitoption.piecebifprob.doublebins = 'y';
						mncomparefitoption.piecebifprob.secondbinfit.fit = 'y';
						mncomparefitoption.piecebifprob.secondbinfit.exponentialoffset = 'y';
					end
					if ismember(4,parameternumber)
						%mncomparefitoption.piecetermprob.doublebins = 'y';
						mncomparefitoption.piecetermprob.secondbinfit.fit = 'y';
						mncomparefitoption.piecetermprob.secondbinfit.exponentialoffset = 'y';
					end
					if ismember(5,parameternumber)
						%mncomparefitoption.rallratio.doublebins = 'y';
						mncomparefitoption.rallratio.secondbinfit.fit = 'y';
						mncomparefitoption.rallratio.secondbinfit.exponentialoffset = 'y';
					end
					if ismember(6,parameternumber)
						%mncomparefitoption.daughterratio.doublebins = 'y';
						mncomparefitoption.daughterratio.secondbinfit.fit = 'y';
						mncomparefitoption.daughterratio.secondbinfit.exponentialoffset = 'y';
					end
					if ismember(7,parameternumber)
						%mncomparefitoption.parentdaughterratio.doublebins = 'y';
						mncomparefitoption.parentdaughterratio.secondbinfit.fit = 'y';
						mncomparefitoption.parentdaughterratio.secondbinfit.exponentialoffset = 'y';
					end		
				end
				
				if ismember(4,secondbinfits)
					if ismember(2,parameternumber)
						%mncomparefitoption.taperrate.doublebins = 'y';
						mncomparefitoption.taperrate.secondbinfit.fit = 'y';
						mncomparefitoption.taperrate.secondbinfit.power = 'y';
					end
					if ismember(3,parameternumber)
						%mncomparefitoption.piecebifprob.doublebins = 'y';
						mncomparefitoption.piecebifprob.secondbinfit.fit = 'y';
						mncomparefitoption.piecebifprob.secondbinfit.power = 'y';
					end
					if ismember(4,parameternumber)
						%mncomparefitoption.piecetermprob.doublebins = 'y';
						mncomparefitoption.piecetermprob.secondbinfit.fit = 'y';
						mncomparefitoption.piecetermprob.secondbinfit.power = 'y';
					end
					if ismember(5,parameternumber)
						%mncomparefitoption.rallratio.doublebins = 'y';
						mncomparefitoption.rallratio.secondbinfit.fit = 'y';
						mncomparefitoption.rallratio.secondbinfit.power = 'y';
					end
					if ismember(6,parameternumber)
						%mncomparefitoption.daughterratio.doublebins = 'y';
						mncomparefitoption.daughterratio.secondbinfit.fit = 'y';
						mncomparefitoption.daughterratio.secondbinfit.power = 'y';
					end
					if ismember(7,parameternumber)
						%mncomparefitoption.parentdaughterratio.doublebins = 'y';
						mncomparefitoption.parentdaughterratio.secondbinfit.fit = 'y';
						mncomparefitoption.parentdaughterratio.secondbinfit.power = 'y';
					end		
				end
				
				if ismember(5,secondbinfits)
					if ismember(2,parameternumber)
						%mncomparefitoption.taperrate.doublebins = 'y';
						mncomparefitoption.taperrate.secondbinfit.fit = 'y';
						mncomparefitoption.taperrate.secondbinfit.poweroffset = 'y';
					end
					if ismember(3,parameternumber)
						%mncomparefitoption.piecebifprob.doublebins = 'y';
						mncomparefitoption.piecebifprob.secondbinfit.fit = 'y';
						mncomparefitoption.piecebifprob.secondbinfit.poweroffset = 'y';
					end
					if ismember(4,parameternumber)
						%mncomparefitoption.piecetermprob.doublebins = 'y';
						mncomparefitoption.piecetermprob.secondbinfit.fit = 'y';
						mncomparefitoption.piecetermprob.secondbinfit.poweroffset = 'y';
					end
					if ismember(5,parameternumber)
						%mncomparefitoption.rallratio.doublebins = 'y';
						mncomparefitoption.rallratio.secondbinfit.fit = 'y';
						mncomparefitoption.rallratio.secondbinfit.poweroffset = 'y';
					end
					if ismember(6,parameternumber)
						%mncomparefitoption.daughterratio.doublebins = 'y';
						mncomparefitoption.daughterratio.secondbinfit.fit = 'y';
						mncomparefitoption.daughterratio.secondbinfit.poweroffset = 'y';
					end
					if ismember(7,parameternumber)
						%mncomparefitoption.parentdaughterratio.doublebins = 'y';
						mncomparefitoption.parentdaughterratio.secondbinfit.fit = 'y';
						mncomparefitoption.parentdaughterratio.secondbinfit.poweroffset = 'y';
					end		
				end
				
				if ismember(6,secondbinfits)
					if ismember(2,parameternumber)
						%mncomparefitoption.taperrate.doublebins = 'y';
						mncomparefitoption.taperrate.secondbinfit.fit = 'y';
						mncomparefitoption.taperrate.secondbinfit.sigmoid = 'y';
					end
					if ismember(3,parameternumber)
						%mncomparefitoption.piecebifprob.doublebins = 'y';
						mncomparefitoption.piecebifprob.secondbinfit.fit = 'y';
						mncomparefitoption.piecebifprob.secondbinfit.sigmoid = 'y';
					end
					if ismember(4,parameternumber)
						%mncomparefitoption.piecetermprob.doublebins = 'y';
						mncomparefitoption.piecetermprob.secondbinfit.fit = 'y';
						mncomparefitoption.piecetermprob.secondbinfit.sigmoid = 'y';
					end
					if ismember(5,parameternumber)
						%mncomparefitoption.rallratio.doublebins = 'y';
						mncomparefitoption.rallratio.secondbinfit.fit = 'y';
						mncomparefitoption.rallratio.secondbinfit.sigmoid = 'y';
					end
					if ismember(6,parameternumber)
						%mncomparefitoption.daughterratio.doublebins = 'y';
						mncomparefitoption.daughterratio.secondbinfit.fit = 'y';
						mncomparefitoption.daughterratio.secondbinfit.sigmoid = 'y';
					end
					if ismember(7,parameternumber)
						%mncomparefitoption.parentdaughterratio.doublebins = 'y';
						mncomparefitoption.parentdaughterratio.secondbinfit.fit = 'y';
						mncomparefitoption.parentdaughterratio.secondbinfit.sigmoid = 'y';
					end		
				end
			end
		end	
			
		if firstbinfitsyesno ~= 1	
			disp(' ');
			disp('  ------------------------------------');
			disp(' ');
			disp('    Perform Double Bin Fits?');
			disp('    (Complete Fit Across Both Bins)');
			disp('    (Selected fits must be currently');
			disp('      or previously analyzed)');
			disp('      1. Yes');
			disp('      2. No');
			doublebinfitsyesno = input('    Please enter a number: ');
			if isempty(doublebinfitsyesno) == 1
				disp(' ');
				disp('  You must enter a valid number to continue.');
				disp('  Please start over.');
				return;
			elseif length(doublebinfitsyesno) > 1
				disp(' ');
				disp('  You must enter only one choice.');
				disp('  Please start over.');
				return;
			end
			if doublebinfitsyesno == 1
				disp(' ');
				disp('  ------------------------------------');
				disp(' ');
				disp('    Double Bin Fitting');
				disp('    First Bin Fit:');
				disp('      1. Linear');
				disp('      2. Exponential');
				disp('      3. Exponential w/ Offset');
				disp('      4. Power');
				disp('      5. Power w/ Offset');
				disp('      6. Sigmoidal');
				disp(' ');
				disp('    Please enter the number of the');
				doublebinfirstbinfits = input('    fit to be visualized: ');
				if isempty(doublebinfirstbinfits) == 1
					disp(' ');
					disp('  You must enter a valid number to continue.');
					disp('  Please start over.');
					return;
				elseif sum(ismember(doublebinfirstbinfits,[1 2 3 4 5 6])) ~= length(doublebinfirstbinfits)
					disp(' ');
					disp('  You must enter a valid number to continue.');
					disp('  Please start over.');
					return;
				end
								
				if ismember(1,doublebinfirstbinfits)
					if ismember(2,parameternumber)
						mncomparefitoption.taperrate.doublebins.fit = 'y';
						mncomparefitoption.taperrate.doublebins.firstbin.fit = 'linear';
					end
					if ismember(3,parameternumber)
						mncomparefitoption.piecebifprob.doublebins.fit = 'y';
						mncomparefitoption.piecebifprob.doublebins.firstbin.fit = 'linear';
					end
					if ismember(4,parameternumber)
						mncomparefitoption.piecetermprob.doublebins.fit = 'y';
						mncomparefitoption.piecetermprob.doublebins.firstbin.fit = 'linear';
					end
					if ismember(5,parameternumber)
						mncomparefitoption.rallratio.doublebins.fit = 'y';
						mncomparefitoption.rallratio.doublebins.firstbin.fit = 'linear';
					end
					if ismember(6,parameternumber)
						mncomparefitoption.daughterratio.doublebins.fit = 'y';
						mncomparefitoption.daughterratio.doublebins.firstbin.fit = 'linear';
					end
					if ismember(7,parameternumber)
						mncomparefitoption.parentdaughterratio.doublebins.fit = 'y';
						mncomparefitoption.parentdaughterratio.doublebins.firstbin.fit = 'linear';
					end		
				end
				
				if ismember(2,doublebinfirstbinfits)
					if ismember(2,parameternumber)
						mncomparefitoption.taperrate.doublebins.fit = 'y';
						mncomparefitoption.taperrate.doublebins.firstbin.fit = 'exponential';
					end
					if ismember(3,parameternumber)
						mncomparefitoption.piecebifprob.doublebins.fit = 'y';
						mncomparefitoption.piecebifprob.doublebins.firstbin.fit = 'exponential';
					end
					if ismember(4,parameternumber)
						mncomparefitoption.piecetermprob.doublebins.fit = 'y';
						mncomparefitoption.piecetermprob.doublebins.firstbin.fit = 'exponential';
					end
					if ismember(5,parameternumber)
						mncomparefitoption.rallratio.doublebins.fit = 'y';
						mncomparefitoption.rallratio.doublebins.firstbin.fit = 'exponential';
					end
					if ismember(6,parameternumber)
						mncomparefitoption.daughterratio.doublebins.fit = 'y';
						mncomparefitoption.daughterratio.doublebins.firstbin.fit = 'exponential';
					end
					if ismember(7,parameternumber)
						mncomparefitoption.parentdaughterratio.doublebins.fit = 'y';
						mncomparefitoption.parentdaughterratio.doublebins.firstbin.fit = 'exponential';
					end		
				end
				
				if ismember(3,doublebinfirstbinfits)
					if ismember(2,parameternumber)
						mncomparefitoption.taperrate.doublebins.fit = 'y';
						mncomparefitoption.taperrate.doublebins.firstbin.fit = 'exponentialoffset';
					end
					if ismember(3,parameternumber)
						mncomparefitoption.piecebifprob.doublebins.fit = 'y';
						mncomparefitoption.piecebifprob.doublebins.firstbin.fit = 'exponentialoffset';
					end
					if ismember(4,parameternumber)
						mncomparefitoption.piecetermprob.doublebins.fit = 'y';
						mncomparefitoption.piecetermprob.doublebins.firstbin.fit = 'exponentialoffset';
					end
					if ismember(5,parameternumber)
						mncomparefitoption.rallratio.doublebins.fit = 'y';
						mncomparefitoption.rallratio.doublebins.firstbin.fit = 'exponentialoffset';
					end
					if ismember(6,parameternumber)
						mncomparefitoption.daughterratio.doublebins.fit = 'y';
						mncomparefitoption.daughterratio.doublebins.firstbin.fit = 'exponentialoffset';
					end
					if ismember(7,parameternumber)
						mncomparefitoption.parentdaughterratio.doublebins.fit = 'y';
						mncomparefitoption.parentdaughterratio.doublebins.firstbin.fit = 'exponentialoffset';
					end		
				end
				
				if ismember(4,doublebinfirstbinfits)
					if ismember(2,parameternumber)
						mncomparefitoption.taperrate.doublebins.fit = 'y';
						mncomparefitoption.taperrate.doublebins.firstbin.fit = 'power';
					end
					if ismember(3,parameternumber)
						mncomparefitoption.piecebifprob.doublebins.fit = 'y';
						mncomparefitoption.piecebifprob.doublebins.firstbin.fit = 'power';
					end
					if ismember(4,parameternumber)
						mncomparefitoption.piecetermprob.doublebins.fit = 'y';
						mncomparefitoption.piecetermprob.doublebins.firstbin.fit = 'power';
					end
					if ismember(5,parameternumber)
						mncomparefitoption.rallratio.doublebins.fit = 'y';
						mncomparefitoption.rallratio.doublebins.firstbin.fit = 'power';
					end
					if ismember(6,parameternumber)
						mncomparefitoption.daughterratio.doublebins.fit = 'y';
						mncomparefitoption.daughterratio.doublebins.firstbin.fit = 'power';
					end
					if ismember(7,parameternumber)
						mncomparefitoption.parentdaughterratio.doublebins.fit = 'y';
						mncomparefitoption.parentdaughterratio.doublebins.firstbin.fit = 'power';
					end		
				end
				
				if ismember(5,doublebinfirstbinfits)
					if ismember(2,parameternumber)
						mncomparefitoption.taperrate.doublebins.fit = 'y';
						mncomparefitoption.taperrate.doublebins.firstbin.fit = 'poweroffset';
					end
					if ismember(3,parameternumber)
						mncomparefitoption.piecebifprob.doublebins.fit = 'y';
						mncomparefitoption.piecebifprob.doublebins.firstbin.fit = 'poweroffset';
					end
					if ismember(4,parameternumber)
						mncomparefitoption.piecetermprob.doublebins.fit = 'y';
						mncomparefitoption.piecetermprob.doublebins.firstbin.fit = 'poweroffset';
					end
					if ismember(5,parameternumber)
						mncomparefitoption.rallratio.doublebins.fit = 'y';
						mncomparefitoption.rallratio.doublebins.firstbin.fit = 'poweroffset';
					end
					if ismember(6,parameternumber)
						mncomparefitoption.daughterratio.doublebins.fit = 'y';
						mncomparefitoption.daughterratio.doublebins.firstbin.fit = 'poweroffset';
					end
					if ismember(7,parameternumber)
						mncomparefitoption.parentdaughterratio.doublebins.fit = 'y';
						mncomparefitoption.parentdaughterratio.doublebins.firstbin.fit = 'poweroffset';
					end		
				end
				
				if ismember(6,doublebinfirstbinfits)
					if ismember(2,parameternumber)
						mncomparefitoption.taperrate.doublebins.fit = 'y';
						mncomparefitoption.taperrate.doublebins.firstbin.fit = 'sigmoid';
					end
					if ismember(3,parameternumber)
						mncomparefitoption.piecebifprob.doublebins.fit = 'y';
						mncomparefitoption.piecebifprob.doublebins.firstbin.fit = 'sigmoid';
					end
					if ismember(4,parameternumber)
						mncomparefitoption.piecetermprob.doublebins.fit = 'y';
						mncomparefitoption.piecetermprob.doublebins.firstbin.fit = 'sigmoid';
					end
					if ismember(5,parameternumber)
						mncomparefitoption.rallratio.doublebins.fit = 'y';
						mncomparefitoption.rallratio.doublebins.firstbin.fit = 'sigmoid';
					end
					if ismember(6,parameternumber)
						mncomparefitoption.daughterratio.doublebins.fit = 'y';
						mncomparefitoption.daughterratio.doublebins.firstbin.fit = 'sigmoid';
					end
					if ismember(7,parameternumber)
						mncomparefitoption.parentdaughterratio.doublebins.fit = 'y';
						mncomparefitoption.parentdaughterratio.doublebins.firstbin.fit = 'sigmoid';
					end		
				end
			
			
				disp(' ');
				disp('  ------------------------------------');
				disp(' ');
				disp('    Double Bin Fitting');
				disp('    First Bin Fit Type:');
				disp('      1. Unweighted');
				disp('      2. Weighted');
				disp('      3. Robust');
				disp('      4. Robust Weighted');
				disp(' ');
				disp('    Please enter the number of the');
				doublebinfirstbinfittypes = input('    fit type to be visualized: ');
				if isempty(doublebinfirstbinfittypes) == 1
					disp(' ');
					disp('  You must enter a valid number to continue.');
					disp('  Please start over.');
					return;
				elseif sum(ismember(doublebinfirstbinfittypes,[1 2 3 4])) ~= length(doublebinfirstbinfittypes)
					disp(' ');
					disp('  You must enter a valid number to continue.');
					disp('  Please start over.');
					return;
				end
				
				if ismember(1,doublebinfirstbinfittypes)
					if ismember(2,parameternumber)
						mncomparefitoption.taperrate.doublebins.fit = 'y';
						mncomparefitoption.taperrate.doublebins.firstbin.fittype = 'unweighted';
					end
					if ismember(3,parameternumber)
						mncomparefitoption.piecebifprob.doublebins.fit = 'y';
						mncomparefitoption.piecebifprob.doublebins.firstbin.fittype = 'unweighted';
					end
					if ismember(4,parameternumber)
						mncomparefitoption.piecetermprob.doublebins.fit = 'y';
						mncomparefitoption.piecetermprob.doublebins.firstbin.fittype = 'unweighted';
					end
					if ismember(5,parameternumber)
						mncomparefitoption.rallratio.doublebins.fit = 'y';
						mncomparefitoption.rallratio.doublebins.firstbin.fittype = 'unweighted';
					end
					if ismember(6,parameternumber)
						mncomparefitoption.daughterratio.doublebins.fit = 'y';
						mncomparefitoption.daughterratio.doublebins.firstbin.fittype = 'unweighted';
					end
					if ismember(7,parameternumber)
						mncomparefitoption.parentdaughterratio.doublebins.fit = 'y';
						mncomparefitoption.parentdaughterratio.doublebins.firstbin.fittype = 'unweighted';
					end		
				end
				
				if ismember(2,doublebinfirstbinfittypes)
					if ismember(2,parameternumber)
						mncomparefitoption.taperrate.doublebins.fit = 'y';
						mncomparefitoption.taperrate.doublebins.firstbin.fittype = 'weighted';
					end
					if ismember(3,parameternumber)
						mncomparefitoption.piecebifprob.doublebins.fit = 'y';
						mncomparefitoption.piecebifprob.doublebins.firstbin.fittype = 'weighted';
					end
					if ismember(4,parameternumber)
						mncomparefitoption.piecetermprob.doublebins.fit = 'y';
						mncomparefitoption.piecetermprob.doublebins.firstbin.fittype = 'weighted';
					end
					if ismember(5,parameternumber)
						mncomparefitoption.rallratio.doublebins.fit = 'y';
						mncomparefitoption.rallratio.doublebins.firstbin.fittype = 'weighted';
					end
					if ismember(6,parameternumber)
						mncomparefitoption.daughterratio.doublebins.fit = 'y';
						mncomparefitoption.daughterratio.doublebins.firstbin.fittype = 'weighted';
					end
					if ismember(7,parameternumber)
						mncomparefitoption.parentdaughterratio.doublebins.fit = 'y';
						mncomparefitoption.parentdaughterratio.doublebins.firstbin.fittype = 'weighted';
					end		
				end
				
				if ismember(3,doublebinfirstbinfittypes)
					if ismember(2,parameternumber)
						mncomparefitoption.taperrate.doublebins.fit = 'y';
						mncomparefitoption.taperrate.doublebins.firstbin.fittype = 'robust';
					end
					if ismember(3,parameternumber)
						mncomparefitoption.piecebifprob.doublebins.fit = 'y';
						mncomparefitoption.piecebifprob.doublebins.firstbin.fittype = 'robust';
					end
					if ismember(4,parameternumber)
						mncomparefitoption.piecetermprob.doublebins.fit = 'y';
						mncomparefitoption.piecetermprob.doublebins.firstbin.fittype = 'robust';
					end
					if ismember(5,parameternumber)
						mncomparefitoption.rallratio.doublebins.fit = 'y';
						mncomparefitoption.rallratio.doublebins.firstbin.fittype = 'robust';
					end
					if ismember(6,parameternumber)
						mncomparefitoption.daughterratio.doublebins.fit = 'y';
						mncomparefitoption.daughterratio.doublebins.firstbin.fittype = 'robust';
					end
					if ismember(7,parameternumber)
						mncomparefitoption.parentdaughterratio.doublebins.fit = 'y';
						mncomparefitoption.parentdaughterratio.doublebins.firstbin.fittype = 'robust';
					end		
				end
				
				if ismember(4,doublebinfirstbinfittypes)
					if ismember(2,parameternumber)
						mncomparefitoption.taperrate.doublebins.fit = 'y';
						mncomparefitoption.taperrate.doublebins.firstbin.fittype = 'robustweighted';
					end
					if ismember(3,parameternumber)
						mncomparefitoption.piecebifprob.doublebins.fit = 'y';
						mncomparefitoption.piecebifprob.doublebins.firstbin.fittype = 'robustweighted';
					end
					if ismember(4,parameternumber)
						mncomparefitoption.piecetermprob.doublebins.fit = 'y';
						mncomparefitoption.piecetermprob.doublebins.firstbin.fittype = 'robustweighted';
					end
					if ismember(5,parameternumber)
						mncomparefitoption.rallratio.doublebins.fit = 'y';
						mncomparefitoption.rallratio.doublebins.firstbin.fittype = 'robustweighted';
					end
					if ismember(6,parameternumber)
						mncomparefitoption.daughterratio.doublebins.fit = 'y';
						mncomparefitoption.daughterratio.doublebins.firstbin.fittype = 'robustweighted';
					end
					if ismember(7,parameternumber)
						mncomparefitoption.parentdaughterratio.doublebins.fit = 'y';
						mncomparefitoption.parentdaughterratio.doublebins.firstbin.fittype = 'robustweighted';
					end		
				end
			
				clear numberparameters;
				if sum(ismember([1 2 4],doublebinfirstbinfits)) >= 1
					numberparameters = 2;
				elseif sum(ismember([3 5],doublebinfirstbinfits)) >=1
					numberparameters = 3;
				elseif ismember(6,doublebinfirstbinfits)
					numberparameters = 4;
				end
			
				for i = 1:numberparameters
					disp(' ');
					disp('  ------------------------------------');
					disp(' ');
					disp('    Double Bin Fitting');
					disp('    Second Bin Fit');
					disp(sprintf('    Parameter %d Fit',i));
					disp('      1. Linear');
					disp('      2. Exponential');
					disp('      3. Exponential w/ Offset');
					disp('      4. Power');
					disp('      5. Power w/ Offset');
					disp('      6. Sigmoidal');
					disp(' ');
					disp('    Please enter the number of the');
					doublebinsecondbinfits(i) = input('    fit to be visualized: ');
					if isempty(doublebinsecondbinfits(i)) == 1
						disp(' ');
						disp('  You must enter a valid number to continue.');
						disp('  Please start over.');
						return;
					elseif sum(ismember(doublebinsecondbinfits(i),[1 2 3 4 5 6])) ~= length(doublebinsecondbinfits(i))
						disp(' ');
						disp('  You must enter a valid number to continue.');
						disp('  Please start over.');
						return;
					end

					if ismember(1,doublebinsecondbinfits(i))
						if ismember(2,parameternumber)
							mncomparefitoption.taperrate.doublebins.fit = 'y';
							mncomparefitoption.taperrate.doublebins.parameter(i).fit = 'linear';
						end
						if ismember(3,parameternumber)
							mncomparefitoption.piecebifprob.doublebins.fit = 'y';
							mncomparefitoption.piecebifprob.doublebins.parameter(i).fit = 'linear';
						end
						if ismember(4,parameternumber)
							mncomparefitoption.piecetermprob.doublebins.fit = 'y';
							mncomparefitoption.piecetermprob.doublebins.parameter(i).fit = 'linear';
						end
						if ismember(5,parameternumber)
							mncomparefitoption.rallratio.doublebins.fit = 'y';
							mncomparefitoption.rallratio.doublebins.parameter(i).fit = 'linear';
						end
						if ismember(6,parameternumber)
							mncomparefitoption.daughterratio.doublebins.fit = 'y';
							mncomparefitoption.daughterratio.doublebins.parameter(i).fit = 'linear';
						end
						if ismember(7,parameternumber)
							mncomparefitoption.parentdaughterratio.doublebins.fit = 'y';
							mncomparefitoption.parentdaughterratio.doublebins.parameter(i).fit = 'linear';
						end		
					end
					
					if ismember(2,doublebinsecondbinfits(i))
						if ismember(2,parameternumber)
							mncomparefitoption.taperrate.doublebins.fit = 'y';
							mncomparefitoption.taperrate.doublebins.parameter(i).fit = 'exponential';
						end
						if ismember(3,parameternumber)
							mncomparefitoption.piecebifprob.doublebins.fit = 'y';
							mncomparefitoption.piecebifprob.doublebins.parameter(i).fit = 'exponential';
						end
						if ismember(4,parameternumber)
							mncomparefitoption.piecetermprob.doublebins.fit = 'y';
							mncomparefitoption.piecetermprob.doublebins.parameter(i).fit = 'exponential';
						end
						if ismember(5,parameternumber)
							mncomparefitoption.rallratio.doublebins.fit = 'y';
							mncomparefitoption.rallratio.doublebins.parameter(i).fit = 'exponential';
						end
						if ismember(6,parameternumber)
							mncomparefitoption.daughterratio.doublebins.fit = 'y';
							mncomparefitoption.daughterratio.doublebins.parameter(i).fit = 'exponential';
						end
						if ismember(7,parameternumber)
							mncomparefitoption.parentdaughterratio.doublebins.fit = 'y';
							mncomparefitoption.parentdaughterratio.doublebins.parameter(i).fit = 'exponential';
						end		
					end
					
					if ismember(3,doublebinsecondbinfits(i))
						if ismember(2,parameternumber)
							mncomparefitoption.taperrate.doublebins.fit = 'y';
							mncomparefitoption.taperrate.doublebins.parameter(i).fit = 'exponentialoffset';
						end
						if ismember(3,parameternumber)
							mncomparefitoption.piecebifprob.doublebins.fit = 'y';
							mncomparefitoption.piecebifprob.doublebins.parameter(i).fit = 'exponentialoffset';
						end
						if ismember(4,parameternumber)
							mncomparefitoption.piecetermprob.doublebins.fit = 'y';
							mncomparefitoption.piecetermprob.doublebins.parameter(i).fit = 'exponentialoffset';
						end
						if ismember(5,parameternumber)
							mncomparefitoption.rallratio.doublebins.fit = 'y';
							mncomparefitoption.rallratio.doublebins.parameter(i).fit = 'exponentialoffset';
						end
						if ismember(6,parameternumber)
							mncomparefitoption.daughterratio.doublebins.fit = 'y';
							mncomparefitoption.daughterratio.doublebins.parameter(i).fit = 'exponentialoffset';
						end
						if ismember(7,parameternumber)
							mncomparefitoption.parentdaughterratio.doublebins.fit = 'y';
							mncomparefitoption.parentdaughterratio.doublebins.parameter(i).fit = 'exponentialoffset';
						end		
					end
					
					if ismember(4,doublebinsecondbinfits(i))
						if ismember(2,parameternumber)
							mncomparefitoption.taperrate.doublebins.fit = 'y';
							mncomparefitoption.taperrate.doublebins.parameter(i).fit = 'power';
						end
						if ismember(3,parameternumber)
							mncomparefitoption.piecebifprob.doublebins.fit = 'y';
							mncomparefitoption.piecebifprob.doublebins.parameter(i).fit = 'power';
						end
						if ismember(4,parameternumber)
							mncomparefitoption.piecetermprob.doublebins.fit = 'y';
							mncomparefitoption.piecetermprob.doublebins.parameter(i).fit = 'power';
						end
						if ismember(5,parameternumber)
							mncomparefitoption.rallratio.doublebins.fit = 'y';
							mncomparefitoption.rallratio.doublebins.parameter(i).fit = 'power';
						end
						if ismember(6,parameternumber)
							mncomparefitoption.daughterratio.doublebins.fit = 'y';
							mncomparefitoption.daughterratio.doublebins.parameter(i).fit = 'power';
						end
						if ismember(7,parameternumber)
							mncomparefitoption.parentdaughterratio.doublebins.fit = 'y';
							mncomparefitoption.parentdaughterratio.doublebins.parameter(i).fit = 'power';
						end		
					end
					
					if ismember(5,doublebinsecondbinfits(i))
						if ismember(2,parameternumber)
							mncomparefitoption.taperrate.doublebins.fit = 'y';
							mncomparefitoption.taperrate.doublebins.parameter(i).fit = 'poweroffset';
						end
						if ismember(3,parameternumber)
							mncomparefitoption.piecebifprob.doublebins.fit = 'y';
							mncomparefitoption.piecebifprob.doublebins.parameter(i).fit = 'poweroffset';
						end
						if ismember(4,parameternumber)
							mncomparefitoption.piecetermprob.doublebins.fit = 'y';
							mncomparefitoption.piecetermprob.doublebins.parameter(i).fit = 'poweroffset';
						end
						if ismember(5,parameternumber)
							mncomparefitoption.rallratio.doublebins.fit = 'y';
							mncomparefitoption.rallratio.doublebins.parameter(i).fit = 'poweroffset';
						end
						if ismember(6,parameternumber)
							mncomparefitoption.daughterratio.doublebins.fit = 'y';
							mncomparefitoption.daughterratio.doublebins.parameter(i).fit = 'poweroffset';
						end
						if ismember(7,parameternumber)
							mncomparefitoption.parentdaughterratio.doublebins.fit = 'y';
							mncomparefitoption.parentdaughterratio.doublebins.parameter(i).fit = 'poweroffset';
						end		
					end
					
					if ismember(6,doublebinsecondbinfits(i))
						if ismember(2,parameternumber)
							mncomparefitoption.taperrate.doublebins.fit = 'y';
							mncomparefitoption.taperrate.doublebins.parameter(i).fit = 'sigmoid';
						end
						if ismember(3,parameternumber)
							mncomparefitoption.piecebifprob.doublebins.fit = 'y';
							mncomparefitoption.piecebifprob.doublebins.parameter(i).fit = 'sigmoid';
						end
						if ismember(4,parameternumber)
							mncomparefitoption.piecetermprob.doublebins.fit = 'y';
							mncomparefitoption.piecetermprob.doublebins.parameter(i).fit = 'sigmoid';
						end
						if ismember(5,parameternumber)
							mncomparefitoption.rallratio.doublebins.fit = 'y';
							mncomparefitoption.rallratio.doublebins.parameter(i).fit = 'sigmoid';
						end
						if ismember(6,parameternumber)
							mncomparefitoption.daughterratio.doublebins.fit = 'y';
							mncomparefitoption.daughterratio.doublebins.parameter(i).fit = 'sigmoid';
						end
						if ismember(7,parameternumber)
							mncomparefitoption.parentdaughterratio.doublebins.fit = 'y';
							mncomparefitoption.parentdaughterratio.doublebins.parameter(i).fit = 'sigmoid';
						end		
					end
					
					disp(' ');
					disp('  ------------------------------------');
					disp(' ');
					disp('    Double Bin Fitting');
					disp('    Second Bin Fit');
					disp(sprintf('    Parameter %d Fit Type',i));
					disp('      1. Unweighted');
					disp('      2. Weighted');
					disp('      3. Robust');
					disp('      4. Robust Weighted');
					disp(' ');
					disp('    Please enter the number of the');
					doublebinsecondbinfits(i) = input('    fit type to be visualized: ');
					if isempty(doublebinsecondbinfits(i)) == 1
						disp(' ');
						disp('  You must enter a valid number to continue.');
						disp('  Please start over.');
						return;
					elseif sum(ismember(doublebinsecondbinfits(i),[1 2 3 4])) ~= length(doublebinsecondbinfits(i))
						disp(' ');
						disp('  You must enter a valid number to continue.');
						disp('  Please start over.');
						return;
					end

					if ismember(1,doublebinsecondbinfits(i))
						if ismember(2,parameternumber)
							mncomparefitoption.taperrate.doublebins.fit = 'y';
							mncomparefitoption.taperrate.doublebins.parameter(i).fittype = 'unweighted';
						end
						if ismember(3,parameternumber)
							mncomparefitoption.piecebifprob.doublebins.fit = 'y';
							mncomparefitoption.piecebifprob.doublebins.parameter(i).fittype = 'unweighted';
						end
						if ismember(4,parameternumber)
							mncomparefitoption.piecetermprob.doublebins.fit = 'y';
							mncomparefitoption.piecetermprob.doublebins.parameter(i).fittype = 'unweighted';
						end
						if ismember(5,parameternumber)
							mncomparefitoption.rallratio.doublebins.fit = 'y';
							mncomparefitoption.rallratio.doublebins.parameter(i).fittype = 'unweighted';
						end
						if ismember(6,parameternumber)
							mncomparefitoption.daughterratio.doublebins.fit = 'y';
							mncomparefitoption.daughterratio.doublebins.parameter(i).fittype = 'unweighted';
						end
						if ismember(7,parameternumber)
							mncomparefitoption.parentdaughterratio.doublebins.fit = 'y';
							mncomparefitoption.parentdaughterratio.doublebins.parameter(i).fittype = 'unweighted';
						end		
					end
					
					if ismember(2,doublebinsecondbinfits(i))
						if ismember(2,parameternumber)
							mncomparefitoption.taperrate.doublebins.fit = 'y';
							mncomparefitoption.taperrate.doublebins.parameter(i).fittype = 'weighted';
						end
						if ismember(3,parameternumber)
							mncomparefitoption.piecebifprob.doublebins.fit = 'y';
							mncomparefitoption.piecebifprob.doublebins.parameter(i).fittype = 'weighted';
						end
						if ismember(4,parameternumber)
							mncomparefitoption.piecetermprob.doublebins.fit = 'y';
							mncomparefitoption.piecetermprob.doublebins.parameter(i).fittype = 'weighted';
						end
						if ismember(5,parameternumber)
							mncomparefitoption.rallratio.doublebins.fit = 'y';
							mncomparefitoption.rallratio.doublebins.parameter(i).fittype = 'weighted';
						end
						if ismember(6,parameternumber)
							mncomparefitoption.daughterratio.doublebins.fit = 'y';
							mncomparefitoption.daughterratio.doublebins.parameter(i).fittype = 'weighted';
						end
						if ismember(7,parameternumber)
							mncomparefitoption.parentdaughterratio.doublebins.fit = 'y';
							mncomparefitoption.parentdaughterratio.doublebins.parameter(i).fittype = 'weighted';
						end		
					end
					
					if ismember(3,doublebinsecondbinfits(i))
						if ismember(2,parameternumber)
							mncomparefitoption.taperrate.doublebins.fit = 'y';
							mncomparefitoption.taperrate.doublebins.parameter(i).fittype = 'robust';
						end
						if ismember(3,parameternumber)
							mncomparefitoption.piecebifprob.doublebins.fit = 'y';
							mncomparefitoption.piecebifprob.doublebins.parameter(i).fittype = 'robust';
						end
						if ismember(4,parameternumber)
							mncomparefitoption.piecetermprob.doublebins.fit = 'y';
							mncomparefitoption.piecetermprob.doublebins.parameter(i).fittype = 'robust';
						end
						if ismember(5,parameternumber)
							mncomparefitoption.rallratio.doublebins.fit = 'y';
							mncomparefitoption.rallratio.doublebins.parameter(i).fittype = 'robust';
						end
						if ismember(6,parameternumber)
							mncomparefitoption.daughterratio.doublebins.fit = 'y';
							mncomparefitoption.daughterratio.doublebins.parameter(i).fittype = 'robust';
						end
						if ismember(7,parameternumber)
							mncomparefitoption.parentdaughterratio.doublebins.fit = 'y';
							mncomparefitoption.parentdaughterratio.doublebins.parameter(i).fittype = 'robust';
						end		
					end
					
					if ismember(4,doublebinsecondbinfits(i))
						if ismember(2,parameternumber)
							mncomparefitoption.taperrate.doublebins.fit = 'y';
							mncomparefitoption.taperrate.doublebins.parameter(i).fittype = 'robustweighted';
						end
						if ismember(3,parameternumber)
							mncomparefitoption.piecebifprob.doublebins.fit = 'y';
							mncomparefitoption.piecebifprob.doublebins.parameter(i).fittype = 'robustweighted';
						end
						if ismember(4,parameternumber)
							mncomparefitoption.piecetermprob.doublebins.fit = 'y';
							mncomparefitoption.piecetermprob.doublebins.parameter(i).fittype = 'robustweighted';
						end
						if ismember(5,parameternumber)
							mncomparefitoption.rallratio.doublebins.fit = 'y';
							mncomparefitoption.rallratio.doublebins.parameter(i).fittype = 'robustweighted';
						end
						if ismember(6,parameternumber)
							mncomparefitoption.daughterratio.doublebins.fit = 'y';
							mncomparefitoption.daughterratio.doublebins.parameter(i).fittype = 'robustweighted';
						end
						if ismember(7,parameternumber)
							mncomparefitoption.parentdaughterratio.doublebins.fit = 'y';
							mncomparefitoption.parentdaughterratio.doublebins.parameter(i).fittype = 'robustweighted';
						end		
					end
				end
			end
		end
	end
end

%keyboard

cd(mnhome);

disp(' ');
disp('  ------------------------------------');
disp('   End of Selections.');
disp('  ------------------------------------');