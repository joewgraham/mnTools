function mnfitteroption = manualmndoublefitter(mnfitteroption)

mnfitteroption.figuresopen = 'y';

[helppath,addpaths] = fileparts(which('addpaths.m'));
cd(helppath);
cd ..
mnhome = cd;

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
	mnfitteroption.branchtypeprob.fit = 'y';
end

    
if ismember(2,parameternumber) == 1
   mnfitteroption.taperrate.fit = 'y';
	
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
		mnfitteroption.taperrate.pooled = 'y';
   end
   if ismember(2,taperratetype)
		mnfitteroption.taperrate.bifurcation = 'y';
   end
   if ismember(3,taperratetype)
		mnfitteroption.taperrate.termination = 'y';
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
		mnfitteroption.taperrate.mean = 'y';
   end	
   if ismember(2,taperratestatistic)
		mnfitteroption.taperrate.std = 'y';
   end	
   if ismember(3,taperratestatistic)
		mnfitteroption.taperrate.skew = 'y';
   end	
   if ismember(4,taperratestatistic)
		mnfitteroption.taperrate.kurt = 'y';
   end	   
end

if ismember(3,parameternumber) == 1
mnfitteroption.piecebifprob.fit = 'y';

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
		mnfitteroption.piecebifprob.pooled = 'y';
	end
	if ismember(2,piecebifprobtype)
		mnfitteroption.piecebifprob.bifterm = 'y';
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
		mnfitteroption.piecebifprob.bylength = 'y';
	end
	if ismember(2,piecebifprobby)
		mnfitteroption.piecebifprob.bysurfacearea = 'y';
	end
	if ismember(3,piecebifprobby)
		mnfitteroption.piecebifprob.byvolume = 'y';
	end

end

if ismember(4,parameternumber) == 1
mnfitteroption.piecetermprob.fit = 'y';

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
		mnfitteroption.piecetermprob.pooled = 'y';
	end
	if ismember(2,piecetermprobtype)
		mnfitteroption.piecetermprob.bifterm = 'y';
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
		mnfitteroption.piecetermprob.bylength = 'y';
	end
	if ismember(2,piecetermprobby)
		mnfitteroption.piecetermprob.bysurfacearea = 'y';
	end
	if ismember(3,piecetermprobby)
		mnfitteroption.piecetermprob.byvolume = 'y';
	end
end
    
if ismember(5,parameternumber) == 1
mnfitteroption.rallratio.fit = 'y';

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
	if ismember(1,rallratioexponent)
		mnfitteroption.rallratio1.fit = 'y';
	end
	if ismember(2,rallratioexponent)
		mnfitteroption.rallratio.fit = 'y';
	end
	if ismember(3,rallratioexponent)
		mnfitteroption.rallratio2.fit = 'y';
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
	if ismember(1,rallratiostatistic)
		mnfitteroption.rallratio.mean = 'y';
	end
	if ismember(2,rallratiostatistic)
		mnfitteroption.rallratio.std = 'y';
	end
	if ismember(3,rallratiostatistic)
		mnfitteroption.rallratio.skew = 'y';
	end
	if ismember(4,rallratiostatistic)
		mnfitteroption.rallratio.kurt = 'y';
	end
end


if ismember(6,parameternumber) == 1
mnfitteroption.daughterratio.fit = 'y';

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
		mnfitteroption.daughterratio.mean = 'y';
	end
	if ismember(2,daughterratiostatistic)
		mnfitteroption.daughterratio.std = 'y';
	end
	if ismember(3,daughterratiostatistic)
		mnfitteroption.daughterratio.skew = 'y';
	end
	if ismember(4,daughterratiostatistic)
		mnfitteroption.daughterratio.kurt = 'y';
	end
end


if ismember(7,parameternumber) == 1
mnfitteroption.parentdaughterratio.fit = 'y';

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
		mnfitteroption.parentdaughterratio.fit = 'y';
	end
	if ismember(2,parentdaughterratiotype)
		mnfitteroption.parentdaughter2ratio.fit = 'y';
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
		mnfitteroption.parentdaughterratio.mean = 'y';
	end
	if ismember(2,parentdaughterratiostatistic)
		mnfitteroption.parentdaughterratio.std = 'y';
	end
	if ismember(3,parentdaughterratiostatistic)
		mnfitteroption.parentdaughterratio.skew = 'y';
	end
	if ismember(4,parentdaughterratiostatistic)
		mnfitteroption.parentdaughterratio.kurt = 'y';
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
	disp('      4. All Single Bins');
	disp('    Versus Double Bins:');
	disp('      5. Diameter -> Path Length');
	disp('      6. Path Length -> Diameter');
	disp('      7. Both Double Bins');
	disp('    Complete Analysis:');
	disp('      8. All Single & Double Bins');
	disp(' ');
	disp('  Please enter the number of the');
	versusnumber = input('  x-axis to be visualized: ');

	if isempty(versusnumber) == 1
		disp(' ');
		disp('  You must enter a valid number to continue.');
		disp('  Please start over.');
		return;
	elseif sum(ismember(versusnumber,[1 2 3 4 5 6 7 8])) ~= length(versusnumber)
		disp(' ');
		disp('  You must enter a valid number to continue.');
		disp('  Please start over.');
		return;
	end
	if versusnumber == 4
		versusnumber = [1 2 3];
	elseif versusnumber == 7
		versusnumber = [5 6];
	elseif versusnumber == 8
		versusnumber = [1 2 3 5 6];
	end
	
	if ismember(1,versusnumber)
		if ismember(2,parameternumber)
			mnfitteroption.taperrate.fit = 'y';
			mnfitteroption.taperrate.singlebins = 'y';
			mnfitteroption.taperrate.diameter.fit = 'y';
		end
		if ismember(3,parameternumber)
			mnfitteroption.piecebifprob.fit = 'y';
			mnfitteroption.piecebifprob.singlebins = 'y';
			mnfitteroption.piecebifprob.diameter.fit = 'y';
		end
		if ismember(4,parameternumber)
			mnfitteroption.piecetermprob.fit = 'y';
			mnfitteroption.piecetermprob.singlebins = 'y';
			mnfitteroption.piecetermprob.diameter.fit = 'y';
		end
		if ismember(5,parameternumber)
			mnfitteroption.rallratio.fit = 'y';
			mnfitteroption.rallratio.singlebins = 'y';
			mnfitteroption.rallratio.diameter.fit = 'y';
		end
		if ismember(6,parameternumber)
			mnfitteroption.daughterratio.fit = 'y';
			mnfitteroption.daughterratio.singlebins = 'y';
			mnfitteroption.daughterratio.diameter.fit = 'y';
		end
		if ismember(7,parameternumber)
			mnfitteroption.parentdaughterratio.fit = 'y';
			mnfitteroption.parentdaughterratio.singlebins = 'y';
			mnfitteroption.parentdaughterratio.diameter.fit = 'y';
		end
	end
	
	if ismember(2,versusnumber)
		if ismember(2,parameternumber)
			mnfitteroption.taperrate.fit = 'y';
			mnfitteroption.taperrate.singlebins = 'y';
			mnfitteroption.taperrate.pathlength.fit = 'y';
		end
		if ismember(3,parameternumber)
			mnfitteroption.piecebifprob.fit = 'y';
			mnfitteroption.piecebifprob.singlebins = 'y';
			mnfitteroption.piecebifprob.pathlength.fit = 'y';
		end
		if ismember(4,parameternumber)
			mnfitteroption.piecetermprob.fit = 'y';
			mnfitteroption.piecetermprob.singlebins = 'y';
			mnfitteroption.piecetermprob.pathlength.fit = 'y';
		end
		if ismember(5,parameternumber)
			mnfitteroption.rallratio.fit = 'y';
			mnfitteroption.rallratio.singlebins = 'y';
			mnfitteroption.rallratio.pathlength.fit = 'y';
		end
		if ismember(6,parameternumber)
			mnfitteroption.daughterratio.fit = 'y';
			mnfitteroption.daughterratio.singlebins = 'y';
			mnfitteroption.daughterratio.pathlength.fit = 'y';
		end
		if ismember(7,parameternumber)
			mnfitteroption.parentdaughterratio.fit = 'y';
			mnfitteroption.parentdaughterratio.singlebins = 'y';
			mnfitteroption.parentdaughterratio.pathlength.fit = 'y';
		end		
	end
	
	if ismember(3,versusnumber)
		if ismember(2,parameternumber)
			mnfitteroption.taperrate.fit = 'y';
			mnfitteroption.taperrate.singlebins = 'y';
			mnfitteroption.taperrate.radialdistance.fit = 'y';
		end
		if ismember(3,parameternumber)
			mnfitteroption.piecebifprob.fit = 'y';
			mnfitteroption.piecebifprob.singlebins = 'y';
			mnfitteroption.piecebifprob.radialdistance.fit = 'y';
		end
		if ismember(4,parameternumber)
			mnfitteroption.piecetermprob.fit = 'y';
			mnfitteroption.piecetermprob.singlebins = 'y';
			mnfitteroption.piecetermprob.radialdistance.fit = 'y';
		end
		if ismember(5,parameternumber)
			mnfitteroption.rallratio.fit = 'y';
			mnfitteroption.rallratio.singlebins = 'y';
			mnfitteroption.rallratio.radialdistance.fit = 'y';
		end
		if ismember(6,parameternumber)
			mnfitteroption.daughterratio.fit = 'y';
			mnfitteroption.daughterratio.singlebins = 'y';
			mnfitteroption.daughterratio.radialdistance.fit = 'y';
		end
		if ismember(7,parameternumber)
			mnfitteroption.parentdaughterratio.fit = 'y';
			mnfitteroption.parentdaughterratio.singlebins = 'y';
			mnfitteroption.parentdaughterratio.radialdistance.fit = 'y';
		end		
	end
	if ismember(5,versusnumber) || ismember(6,versusnumber)
		if ismember(5,versusnumber)
			if ismember(2,parameternumber)
				mnfitteroption.taperrate.diameter.pathlength = 'y';
			end
			if ismember(3,parameternumber)
				mnfitteroption.piecebifprob.diameter.pathlength = 'y';
			end
			if ismember(4,parameternumber)
				mnfitteroption.piecetermprob.diameter.pathlength = 'y';
			end
			if ismember(5,parameternumber)
				mnfitteroption.rallratio.diameter.pathlength = 'y';
			end
			if ismember(6,parameternumber)
				mnfitteroption.daughterratio.diameter.pathlength = 'y';
			end
			if ismember(7,parameternumber)
				mnfitteroption.parentdaughterratio.diameter.pathlength = 'y';
			end		
		end
		if ismember(6,versusnumber)
			if ismember(2,parameternumber)
				mnfitteroption.taperrate.pathlength.diameter = 'y';
			end
			if ismember(3,parameternumber)
				mnfitteroption.piecebifprob.pathlength.diameter = 'y';
			end
			if ismember(4,parameternumber)
				mnfitteroption.piecetermprob.pathlength.diameter = 'y';
			end
			if ismember(5,parameternumber)
				mnfitteroption.rallratio.pathlength.diameter = 'y';
			end
			if ismember(6,parameternumber)
				mnfitteroption.daughterratio.pathlength.diameter = 'y';
			end
			if ismember(7,parameternumber)
				mnfitteroption.parentdaughterratio.pathlength.diameter = 'y';
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
			disp('      3. Power');
			disp('      4. Sigmoidal');
			disp('      5. All');
			disp(' ');
			disp('    Please enter the number of the');
			firstbinfits = input('    fit to be visualized: ');
			if isempty(firstbinfits) == 1
				disp(' ');
				disp('  You must enter a valid number to continue.');
				disp('  Please start over.');
				return;
			elseif sum(ismember(firstbinfits,[1 2 3 4 5])) ~= length(firstbinfits)
				disp(' ');
				disp('  You must enter a valid number to continue.');
				disp('  Please start over.');
				return;
			end
			if firstbinfits == 5
				firstbinfits = [1 2 3 4];
			end
			
			if ismember(1,firstbinfits)
				if ismember(2,parameternumber)
					mnfitteroption.taperrate.doublebins = 'y';
					mnfitteroption.taperrate.firstbinfit.fit = 'y';
					mnfitteroption.taperrate.firstbinfit.linear = 'y';
				end
				if ismember(3,parameternumber)
					mnfitteroption.piecebifprob.doublebins = 'y';
					mnfitteroption.piecebifprob.firstbinfit.fit = 'y';
					mnfitteroption.piecebifprob.firstbinfit.linear = 'y';
				end
				if ismember(4,parameternumber)
					mnfitteroption.piecetermprob.doublebins = 'y';
					mnfitteroption.piecetermprob.firstbinfit.fit = 'y';
					mnfitteroption.piecetermprob.firstbinfit.linear = 'y';
				end
				if ismember(5,parameternumber)
					mnfitteroption.rallratio.doublebins = 'y';
					mnfitteroption.rallratio.firstbinfit.fit = 'y';
					mnfitteroption.rallratio.firstbinfit.linear = 'y';
				end
				if ismember(6,parameternumber)
					mnfitteroption.daughterratio.doublebins = 'y';
					mnfitteroption.daughterratio.firstbinfit.fit = 'y';
					mnfitteroption.daughterratio.firstbinfit.linear = 'y';
				end
				if ismember(7,parameternumber)
					mnfitteroption.parentdaughterratio.doublebins = 'y';
					mnfitteroption.parentdaughterratio.firstbinfit.fit = 'y';
					mnfitteroption.parentdaughterratio.firstbinfit.linear = 'y';
				end		
			end
			
			if ismember(2,firstbinfits)
				if ismember(2,parameternumber)
					mnfitteroption.taperrate.doublebins = 'y';
					mnfitteroption.taperrate.firstbinfit.fit = 'y';
					mnfitteroption.taperrate.firstbinfit.exponential = 'y';
				end
				if ismember(3,parameternumber)
					mnfitteroption.piecebifprob.doublebins = 'y';
					mnfitteroption.piecebifprob.firstbinfit.fit = 'y';
					mnfitteroption.piecebifprob.firstbinfit.exponential = 'y';
				end
				if ismember(4,parameternumber)
					mnfitteroption.piecetermprob.doublebins = 'y';
					mnfitteroption.piecetermprob.firstbinfit.fit = 'y';
					mnfitteroption.piecetermprob.firstbinfit.exponential = 'y';
				end
				if ismember(5,parameternumber)
					mnfitteroption.rallratio.doublebins = 'y';
					mnfitteroption.rallratio.firstbinfit.fit = 'y';
					mnfitteroption.rallratio.firstbinfit.exponential = 'y';
				end
				if ismember(6,parameternumber)
					mnfitteroption.daughterratio.doublebins = 'y';
					mnfitteroption.daughterratio.firstbinfit.fit = 'y';
					mnfitteroption.daughterratio.firstbinfit.exponential = 'y';
				end
				if ismember(7,parameternumber)
					mnfitteroption.parentdaughterratio.doublebins = 'y';
					mnfitteroption.parentdaughterratio.firstbinfit.fit = 'y';
					mnfitteroption.parentdaughterratio.firstbinfit.exponential = 'y';
				end		
			end
			
			if ismember(3,firstbinfits)
				if ismember(2,parameternumber)
					mnfitteroption.taperrate.doublebins = 'y';
					mnfitteroption.taperrate.firstbinfit.fit = 'y';
					mnfitteroption.taperrate.firstbinfit.power = 'y';
				end
				if ismember(3,parameternumber)
					mnfitteroption.piecebifprob.doublebins = 'y';
					mnfitteroption.piecebifprob.firstbinfit.fit = 'y';
					mnfitteroption.piecebifprob.firstbinfit.power = 'y';
				end
				if ismember(4,parameternumber)
					mnfitteroption.piecetermprob.doublebins = 'y';
					mnfitteroption.piecetermprob.firstbinfit.fit = 'y';
					mnfitteroption.piecetermprob.firstbinfit.power = 'y';
				end
				if ismember(5,parameternumber)
					mnfitteroption.rallratio.doublebins = 'y';
					mnfitteroption.rallratio.firstbinfit.fit = 'y';
					mnfitteroption.rallratio.firstbinfit.power = 'y';
				end
				if ismember(6,parameternumber)
					mnfitteroption.daughterratio.doublebins = 'y';
					mnfitteroption.daughterratio.firstbinfit.fit = 'y';
					mnfitteroption.daughterratio.firstbinfit.power = 'y';
				end
				if ismember(7,parameternumber)
					mnfitteroption.parentdaughterratio.doublebins = 'y';
					mnfitteroption.parentdaughterratio.firstbinfit.fit = 'y';
					mnfitteroption.parentdaughterratio.firstbinfit.power = 'y';
				end		
			end
			
			if ismember(4,firstbinfits)
				if ismember(2,parameternumber)
					mnfitteroption.taperrate.doublebins = 'y';
					mnfitteroption.taperrate.firstbinfit.fit = 'y';
					mnfitteroption.taperrate.firstbinfit.sigmoid = 'y';
				end
				if ismember(3,parameternumber)
					mnfitteroption.piecebifprob.doublebins = 'y';
					mnfitteroption.piecebifprob.firstbinfit.fit = 'y';
					mnfitteroption.piecebifprob.firstbinfit.sigmoid = 'y';
				end
				if ismember(4,parameternumber)
					mnfitteroption.piecetermprob.doublebins = 'y';
					mnfitteroption.piecetermprob.firstbinfit.fit = 'y';
					mnfitteroption.piecetermprob.firstbinfit.sigmoid = 'y';
				end
				if ismember(5,parameternumber)
					mnfitteroption.rallratio.doublebins = 'y';
					mnfitteroption.rallratio.firstbinfit.fit = 'y';
					mnfitteroption.rallratio.firstbinfit.sigmoid = 'y';
				end
				if ismember(6,parameternumber)
					mnfitteroption.daughterratio.doublebins = 'y';
					mnfitteroption.daughterratio.firstbinfit.fit = 'y';
					mnfitteroption.daughterratio.firstbinfit.sigmoid = 'y';
				end
				if ismember(7,parameternumber)
					mnfitteroption.parentdaughterratio.doublebins = 'y';
					mnfitteroption.parentdaughterratio.firstbinfit.fit = 'y';
					mnfitteroption.parentdaughterratio.firstbinfit.sigmoid = 'y';
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
					mnfitteroption.taperrate.doublebins = 'y';
					mnfitteroption.taperrate.firstbinfit.fit = 'y';
					mnfitteroption.taperrate.firstbinfittype.unweighted = 'y';
				end
				if ismember(3,parameternumber)
					mnfitteroption.piecebifprob.doublebins = 'y';
					mnfitteroption.piecebifprob.firstbinfit.fit = 'y';
					mnfitteroption.piecebifprob.firstbinfittype.unweighted = 'y';
				end
				if ismember(4,parameternumber)
					mnfitteroption.piecetermprob.doublebins = 'y';
					mnfitteroption.piecetermprob.firstbinfit.fit = 'y';
					mnfitteroption.piecetermprob.firstbinfittype.unweighted = 'y';
				end
				if ismember(5,parameternumber)
					mnfitteroption.rallratio.doublebins = 'y';
					mnfitteroption.rallratio.firstbinfit.fit = 'y';
					mnfitteroption.rallratio.firstbinfittype.unweighted = 'y';
				end
				if ismember(6,parameternumber)
					mnfitteroption.daughterratio.doublebins = 'y';
					mnfitteroption.daughterratio.firstbinfit.fit = 'y';
					mnfitteroption.daughterratio.firstbinfittype.unweighted = 'y';
				end
				if ismember(7,parameternumber)
					mnfitteroption.parentdaughterratio.doublebins = 'y';
					mnfitteroption.parentdaughterratio.firstbinfit.fit = 'y';
					mnfitteroption.parentdaughterratio.firstbinfittype.unweighted = 'y';
				end		
			end
			
			if ismember(2,firstbinfittypes)
				if ismember(2,parameternumber)
					mnfitteroption.taperrate.doublebins = 'y';
					mnfitteroption.taperrate.firstbinfit.fit = 'y';
					mnfitteroption.taperrate.firstbinfittype.weighted = 'y';
				end
				if ismember(3,parameternumber)
					mnfitteroption.piecebifprob.doublebins = 'y';
					mnfitteroption.piecebifprob.firstbinfit.fit = 'y';
					mnfitteroption.piecebifprob.firstbinfittype.weighted = 'y';
				end
				if ismember(4,parameternumber)
					mnfitteroption.piecetermprob.doublebins = 'y';
					mnfitteroption.piecetermprob.firstbinfit.fit = 'y';
					mnfitteroption.piecetermprob.firstbinfittype.weighted = 'y';
				end
				if ismember(5,parameternumber)
					mnfitteroption.rallratio.doublebins = 'y';
					mnfitteroption.rallratio.firstbinfit.fit = 'y';
					mnfitteroption.rallratio.firstbinfittype.weighted = 'y';
				end
				if ismember(6,parameternumber)
					mnfitteroption.daughterratio.doublebins = 'y';
					mnfitteroption.daughterratio.firstbinfit.fit = 'y';
					mnfitteroption.daughterratio.firstbinfittype.weighted = 'y';
				end
				if ismember(7,parameternumber)
					mnfitteroption.parentdaughterratio.doublebins = 'y';
					mnfitteroption.parentdaughterratio.firstbinfit.fit = 'y';
					mnfitteroption.parentdaughterratio.firstbinfittype.weighted = 'y';
				end		
			end
			
			if ismember(3,firstbinfittypes)
				if ismember(2,parameternumber)
					mnfitteroption.taperrate.doublebins = 'y';
					mnfitteroption.taperrate.firstbinfit.fit = 'y';
					mnfitteroption.taperrate.firstbinfittype.robust = 'y';
				end
				if ismember(3,parameternumber)
					mnfitteroption.piecebifprob.doublebins = 'y';
					mnfitteroption.piecebifprob.firstbinfit.fit = 'y';
					mnfitteroption.piecebifprob.firstbinfittype.robust = 'y';
				end
				if ismember(4,parameternumber)
					mnfitteroption.piecetermprob.doublebins = 'y';
					mnfitteroption.piecetermprob.firstbinfit.fit = 'y';
					mnfitteroption.piecetermprob.firstbinfittype.robust = 'y';
				end
				if ismember(5,parameternumber)
					mnfitteroption.rallratio.doublebins = 'y';
					mnfitteroption.rallratio.firstbinfit.fit = 'y';
					mnfitteroption.rallratio.firstbinfittype.robust = 'y';
				end
				if ismember(6,parameternumber)
					mnfitteroption.daughterratio.doublebins = 'y';
					mnfitteroption.daughterratio.firstbinfit.fit = 'y';
					mnfitteroption.daughterratio.firstbinfittype.robust = 'y';
				end
				if ismember(7,parameternumber)
					mnfitteroption.parentdaughterratio.doublebins = 'y';
					mnfitteroption.parentdaughterratio.firstbinfit.fit = 'y';
					mnfitteroption.parentdaughterratio.firstbinfittype.robust = 'y';
				end		
			end
			
			if ismember(4,firstbinfittypes)
				if ismember(2,parameternumber)
					mnfitteroption.taperrate.doublebins = 'y';
					mnfitteroption.taperrate.firstbinfit.fit = 'y';
					mnfitteroption.taperrate.firstbinfittype.robustweighted = 'y';
				end
				if ismember(3,parameternumber)
					mnfitteroption.piecebifprob.doublebins = 'y';
					mnfitteroption.piecebifprob.firstbinfit.fit = 'y';
					mnfitteroption.piecebifprob.firstbinfittype.robustweighted = 'y';
				end
				if ismember(4,parameternumber)
					mnfitteroption.piecetermprob.doublebins = 'y';
					mnfitteroption.piecetermprob.firstbinfit.fit = 'y';
					mnfitteroption.piecetermprob.firstbinfittype.robustweighted = 'y';
				end
				if ismember(5,parameternumber)
					mnfitteroption.rallratio.doublebins = 'y';
					mnfitteroption.rallratio.firstbinfit.fit = 'y';
					mnfitteroption.rallratio.firstbinfittype.robustweighted = 'y';
				end
				if ismember(6,parameternumber)
					mnfitteroption.daughterratio.doublebins = 'y';
					mnfitteroption.daughterratio.firstbinfit.fit = 'y';
					mnfitteroption.daughterratio.firstbinfittype.robustweighted = 'y';
				end
				if ismember(7,parameternumber)
					mnfitteroption.parentdaughterratio.doublebins = 'y';
					mnfitteroption.parentdaughterratio.firstbinfit.fit = 'y';
					mnfitteroption.parentdaughterratio.firstbinfittype.robustweighted = 'y';
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
				disp('      3. Power');
				disp('      4. Sigmoidal');
				disp('      5. All');
				disp(' ');
				disp('    Please enter the number of the');
				secondbinfits = input('    fit to be visualized: ');
				if isempty(secondbinfits) == 1
					disp(' ');
					disp('  You must enter a valid number to continue.');
					disp('  Please start over.');
					return;
				elseif sum(ismember(secondbinfits,[1 2 3 4 5])) ~= length(secondbinfits)
					disp(' ');
					disp('  You must enter a valid number to continue.');
					disp('  Please start over.');
					return;
				end
				if secondbinfits == 5
					secondbinfits = [1 2 3 4];
				end
				
				if ismember(1,secondbinfits)
					if ismember(2,parameternumber)
						mnfitteroption.taperrate.doublebins = 'y';
						mnfitteroption.taperrate.secondbinfit.fit = 'y';
						mnfitteroption.taperrate.secondbinfit.linear = 'y';
					end
					if ismember(3,parameternumber)
						mnfitteroption.piecebifprob.doublebins = 'y';
						mnfitteroption.piecebifprob.secondbinfit.fit = 'y';
						mnfitteroption.piecebifprob.secondbinfit.linear = 'y';
					end
					if ismember(4,parameternumber)
						mnfitteroption.piecetermprob.doublebins = 'y';
						mnfitteroption.piecetermprob.secondbinfit.fit = 'y';
						mnfitteroption.piecetermprob.secondbinfit.linear = 'y';
					end
					if ismember(5,parameternumber)
						mnfitteroption.rallratio.doublebins = 'y';
						mnfitteroption.rallratio.secondbinfit.fit = 'y';
						mnfitteroption.rallratio.secondbinfit.linear = 'y';
					end
					if ismember(6,parameternumber)
						mnfitteroption.daughterratio.doublebins = 'y';
						mnfitteroption.daughterratio.secondbinfit.fit = 'y';
						mnfitteroption.daughterratio.secondbinfit.linear = 'y';
					end
					if ismember(7,parameternumber)
						mnfitteroption.parentdaughterratio.doublebins = 'y';
						mnfitteroption.parentdaughterratio.secondbinfit.fit = 'y';
						mnfitteroption.parentdaughterratio.secondbinfit.linear = 'y';
					end		
				end
				
				if ismember(2,secondbinfits)
					if ismember(2,parameternumber)
						mnfitteroption.taperrate.doublebins = 'y';
						mnfitteroption.taperrate.secondbinfit.fit = 'y';
						mnfitteroption.taperrate.secondbinfit.exponential = 'y';
					end
					if ismember(3,parameternumber)
						mnfitteroption.piecebifprob.doublebins = 'y';
						mnfitteroption.piecebifprob.secondbinfit.fit = 'y';
						mnfitteroption.piecebifprob.secondbinfit.exponential = 'y';
					end
					if ismember(4,parameternumber)
						mnfitteroption.piecetermprob.doublebins = 'y';
						mnfitteroption.piecetermprob.secondbinfit.fit = 'y';
						mnfitteroption.piecetermprob.secondbinfit.exponential = 'y';
					end
					if ismember(5,parameternumber)
						mnfitteroption.rallratio.doublebins = 'y';
						mnfitteroption.rallratio.secondbinfit.fit = 'y';
						mnfitteroption.rallratio.secondbinfit.exponential = 'y';
					end
					if ismember(6,parameternumber)
						mnfitteroption.daughterratio.doublebins = 'y';
						mnfitteroption.daughterratio.secondbinfit.fit = 'y';
						mnfitteroption.daughterratio.secondbinfit.exponential = 'y';
					end
					if ismember(7,parameternumber)
						mnfitteroption.parentdaughterratio.doublebins = 'y';
						mnfitteroption.parentdaughterratio.secondbinfit.fit = 'y';
						mnfitteroption.parentdaughterratio.secondbinfit.exponential = 'y';
					end		
				end
				
				if ismember(3,secondbinfits)
					if ismember(2,parameternumber)
						mnfitteroption.taperrate.doublebins = 'y';
						mnfitteroption.taperrate.secondbinfit.fit = 'y';
						mnfitteroption.taperrate.secondbinfit.power = 'y';
					end
					if ismember(3,parameternumber)
						mnfitteroption.piecebifprob.doublebins = 'y';
						mnfitteroption.piecebifprob.secondbinfit.fit = 'y';
						mnfitteroption.piecebifprob.secondbinfit.power = 'y';
					end
					if ismember(4,parameternumber)
						mnfitteroption.piecetermprob.doublebins = 'y';
						mnfitteroption.piecetermprob.secondbinfit.fit = 'y';
						mnfitteroption.piecetermprob.secondbinfit.power = 'y';
					end
					if ismember(5,parameternumber)
						mnfitteroption.rallratio.doublebins = 'y';
						mnfitteroption.rallratio.secondbinfit.fit = 'y';
						mnfitteroption.rallratio.secondbinfit.power = 'y';
					end
					if ismember(6,parameternumber)
						mnfitteroption.daughterratio.doublebins = 'y';
						mnfitteroption.daughterratio.secondbinfit.fit = 'y';
						mnfitteroption.daughterratio.secondbinfit.power = 'y';
					end
					if ismember(7,parameternumber)
						mnfitteroption.parentdaughterratio.doublebins = 'y';
						mnfitteroption.parentdaughterratio.secondbinfit.fit = 'y';
						mnfitteroption.parentdaughterratio.secondbinfit.power = 'y';
					end		
				end
				
				if ismember(4,secondbinfits)
					if ismember(2,parameternumber)
						mnfitteroption.taperrate.doublebins = 'y';
						mnfitteroption.taperrate.secondbinfit.fit = 'y';
						mnfitteroption.taperrate.secondbinfit.sigmoid = 'y';
					end
					if ismember(3,parameternumber)
						mnfitteroption.piecebifprob.doublebins = 'y';
						mnfitteroption.piecebifprob.secondbinfit.fit = 'y';
						mnfitteroption.piecebifprob.secondbinfit.sigmoid = 'y';
					end
					if ismember(4,parameternumber)
						mnfitteroption.piecetermprob.doublebins = 'y';
						mnfitteroption.piecetermprob.secondbinfit.fit = 'y';
						mnfitteroption.piecetermprob.secondbinfit.sigmoid = 'y';
					end
					if ismember(5,parameternumber)
						mnfitteroption.rallratio.doublebins = 'y';
						mnfitteroption.rallratio.secondbinfit.fit = 'y';
						mnfitteroption.rallratio.secondbinfit.sigmoid = 'y';
					end
					if ismember(6,parameternumber)
						mnfitteroption.daughterratio.doublebins = 'y';
						mnfitteroption.daughterratio.secondbinfit.fit = 'y';
						mnfitteroption.daughterratio.secondbinfit.sigmoid = 'y';
					end
					if ismember(7,parameternumber)
						mnfitteroption.parentdaughterratio.doublebins = 'y';
						mnfitteroption.parentdaughterratio.secondbinfit.fit = 'y';
						mnfitteroption.parentdaughterratio.secondbinfit.sigmoid = 'y';
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