function mnfitteroption = manualmnfitter(mnfitteroption)

[helppath,addpaths] = fileparts(which('mnaddpaths.m'));
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
disp('     Leave Figures Open?');
disp('  ------------------------------------');
%disp(' ');
disp('      1. Yes');
disp('      2. No');

disp(' ');
disp('    Please enter the number of');
figuresopen = input('    your choice: ');

if isempty(figuresopen) == 1
    disp(' ');
    disp('  You must enter a valid number to continue.');
    disp('  Please start over.');
    return;
end

if ismember(1,figuresopen)
	mnfitteroption.figuresopen = 'y';
else
	mnfitteroption.figuresopen = 'n';
end


disp(' ');
disp('  ------------------------------------');
disp('     Choose Branch Type');
disp('  ------------------------------------');
%disp(' ');
disp('    Branch types:');
disp('      1. Axonal');
disp('      2. Dendritic');
disp('      3. Apical');
disp('      4. All');
disp(' ');
disp('    Please enter the number of the');
branchtype = input('    branch type to be fit: ');
if isempty(branchtype) == 1
    disp(' ');
    disp('  You must enter a valid number to continue.');
    disp('  Please start over.');
    return;
elseif sum(ismember(branchtype,[1 2 3 4 5 6 7])) ~= length(branchtype) 
    disp(' ');
    disp('  You must enter a valid number to continue.');
    disp('  Please start over.');
    return;
end

if ismember(1,branchtype)
	mnfitteroption.axon = 'y';
end
if ismember(2,branchtype)
	mnfitteroption.dendrite = 'y';
end
if ismember(3,branchtype)
	mnfitteroption.apical = 'y';
end
if ismember(4,branchtype)
	mnfitteroption.axon = 'y';
    mnfitteroption.dendrite = 'y';
    mnfitteroption.apical = 'y';
end




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
   disp('      5. Piecewise Mean');
   disp('      6. All');
   disp(' ');
   disp('    Please enter the number of the');
   taperratestatistic = input('    statistic to be visualized: ');
   if isempty(taperratestatistic) == 1
       disp(' ');
       disp('  You must enter a valid number to continue.');
       disp('  Please start over.');
       return;
   elseif sum(ismember(taperratestatistic,[1 2 3 4 5 6])) ~= length(taperratestatistic)
       disp(' ');
       disp('  You must enter a valid number to continue.');
       disp('  Please start over.');
       return;
   end
   if taperratestatistic == 6
       taperratestatistic = [1 2 3 4 5];
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
   if ismember(5,taperratestatistic)
		mnfitteroption.taperrate.piece = 'y';
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
%mnfitteroption.rallratio.fit = 'y';

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
		mnfitteroption.rallratio1.fit = 'y';
	end
	if ismember(2,rallratioexponent)
		mnfitteroption.rallratio.fit = 'y';
	end
	if ismember(3,rallratioexponent)
		mnfitteroption.rallratio2.fit = 'y';
	end
	if ismember(4,rallratioexponent)
		mnfitteroption.rallratio3.fit = 'y';
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
	disp('      4. Intra-Branch Length');
	disp('      5. Branch Order');
	disp('      6. All Single Bins');
	disp('    Versus Double Bins:');
	disp('      7. Diameter -> Path Length');
	disp('      8. Path Length -> Diameter');
	disp('      9. Diameter -> Branch Length');
	disp('     10. Branch Length -> Diameter');
	disp('     11. Diameter -> Branch Order');
	disp('     12. Branch Order -> Diameter');
	disp('     13. All Double Bins');
	disp('    Complete Analysis:');
	disp('     14. All Single & Double Bins');
	disp(' ');
	disp('  Please enter the number of the');
	versusnumber = input('  x-axis to be visualized: ');

	if isempty(versusnumber) == 1
		disp(' ');
		disp('  You must enter a valid number to continue.');
		disp('  Please start over.');
		return;
	elseif sum(ismember(versusnumber,[1 2 3 4 5 6 7 8 9 10 11 12 13 14])) ~= length(versusnumber)
		disp(' ');
		disp('  You must enter a valid number to continue.');
		disp('  Please start over.');
		return;
	end
	if versusnumber == 6
		versusnumber = [1 2 3 4 5];
	elseif versusnumber == 13
		versusnumber = [7 8 9 10 11 12];
	elseif versusnumber == 14
		versusnumber = [1 2 3 4 5 7 8 9 10 11 12];
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
			%mnfitteroption.rallratio.fit = 'y';
			mnfitteroption.rallratio.singlebins = 'y';
			mnfitteroption.rallratio.diameter.fit = 'y';
		end
		if ismember(6,parameternumber)
			mnfitteroption.daughterratio.fit = 'y';
			mnfitteroption.daughterratio.singlebins = 'y';
			mnfitteroption.daughterratio.diameter.fit = 'y';
		end
		if ismember(7,parameternumber)
			%mnfitteroption.parentdaughterratio.fit = 'y';
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
			%mnfitteroption.rallratio.fit = 'y';
			mnfitteroption.rallratio.singlebins = 'y';
			mnfitteroption.rallratio.pathlength.fit = 'y';
		end
		if ismember(6,parameternumber)
			mnfitteroption.daughterratio.fit = 'y';
			mnfitteroption.daughterratio.singlebins = 'y';
			mnfitteroption.daughterratio.pathlength.fit = 'y';
		end
		if ismember(7,parameternumber)
			%mnfitteroption.parentdaughterratio.fit = 'y';
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
			%mnfitteroption.rallratio.fit = 'y';
			mnfitteroption.rallratio.singlebins = 'y';
			mnfitteroption.rallratio.radialdistance.fit = 'y';
		end
		if ismember(6,parameternumber)
			mnfitteroption.daughterratio.fit = 'y';
			mnfitteroption.daughterratio.singlebins = 'y';
			mnfitteroption.daughterratio.radialdistance.fit = 'y';
		end
		if ismember(7,parameternumber)
			%mnfitteroption.parentdaughterratio.fit = 'y';
			mnfitteroption.parentdaughterratio.singlebins = 'y';
			mnfitteroption.parentdaughterratio.radialdistance.fit = 'y';
		end		
	end
	
	if ismember(4,versusnumber)
		if ismember(2,parameternumber)
			mnfitteroption.taperrate.fit = 'y';
			mnfitteroption.taperrate.singlebins = 'y';
			mnfitteroption.taperrate.branchlength.fit = 'y';
		end
		if ismember(3,parameternumber)
			mnfitteroption.piecebifprob.fit = 'y';
			mnfitteroption.piecebifprob.singlebins = 'y';
			mnfitteroption.piecebifprob.branchlength.fit = 'y';
		end
		if ismember(4,parameternumber)
			mnfitteroption.piecetermprob.fit = 'y';
			mnfitteroption.piecetermprob.singlebins = 'y';
			mnfitteroption.piecetermprob.branchlength.fit = 'y';
		end
		if ismember(5,parameternumber)
			%mnfitteroption.rallratio.fit = 'y';
			mnfitteroption.rallratio.singlebins = 'y';
			mnfitteroption.rallratio.branchlength.fit = 'y';
		end
		if ismember(6,parameternumber)
			mnfitteroption.daughterratio.fit = 'y';
			mnfitteroption.daughterratio.singlebins = 'y';
			mnfitteroption.daughterratio.branchlength.fit = 'y';
		end
		if ismember(7,parameternumber)
			%mnfitteroption.parentdaughterratio.fit = 'y';
			mnfitteroption.parentdaughterratio.singlebins = 'y';
			mnfitteroption.parentdaughterratio.branchlength.fit = 'y';
		end		
	end
	
	if ismember(5,versusnumber)
		if ismember(2,parameternumber)
			mnfitteroption.taperrate.fit = 'y';
			mnfitteroption.taperrate.singlebins = 'y';
			mnfitteroption.taperrate.branchorder.fit = 'y';
		end
		if ismember(3,parameternumber)
			mnfitteroption.piecebifprob.fit = 'y';
			mnfitteroption.piecebifprob.singlebins = 'y';
			mnfitteroption.piecebifprob.branchorder.fit = 'y';
		end
		if ismember(4,parameternumber)
			mnfitteroption.piecetermprob.fit = 'y';
			mnfitteroption.piecetermprob.singlebins = 'y';
			mnfitteroption.piecetermprob.branchorder.fit = 'y';
		end
		if ismember(5,parameternumber)
			%mnfitteroption.rallratio.fit = 'y';
			mnfitteroption.rallratio.singlebins = 'y';
			mnfitteroption.rallratio.branchorder.fit = 'y';
		end
		if ismember(6,parameternumber)
			mnfitteroption.daughterratio.fit = 'y';
			mnfitteroption.daughterratio.singlebins = 'y';
			mnfitteroption.daughterratio.branchorder.fit = 'y';
		end
		if ismember(7,parameternumber)
			%mnfitteroption.parentdaughterratio.fit = 'y';
			mnfitteroption.parentdaughterratio.singlebins = 'y';
			mnfitteroption.parentdaughterratio.branchorder.fit = 'y';
		end		
	end
	
	if ismember(7,versusnumber) || ismember(8,versusnumber) || ismember(9,versusnumber) || ismember(10,versusnumber) || ismember(11,versusnumber) || ismember(12,versusnumber) 
		if ismember(7,versusnumber)
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
		if ismember(8,versusnumber)
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
		if ismember(9,versusnumber)
			if ismember(2,parameternumber)
				mnfitteroption.taperrate.diameter.branchlength = 'y';
			end
			if ismember(3,parameternumber)
				mnfitteroption.piecebifprob.diameter.branchlength = 'y';
			end
			if ismember(4,parameternumber)
				mnfitteroption.piecetermprob.diameter.branchlength = 'y';
			end
			if ismember(5,parameternumber)
				mnfitteroption.rallratio.diameter.branchlength = 'y';
			end
			if ismember(6,parameternumber)
				mnfitteroption.daughterratio.diameter.branchlength = 'y';
			end
			if ismember(7,parameternumber)
				mnfitteroption.parentdaughterratio.diameter.branchlength = 'y';
			end		
		end
		if ismember(10,versusnumber)
			if ismember(2,parameternumber)
				mnfitteroption.taperrate.branchlength.diameter = 'y';
			end
			if ismember(3,parameternumber)
				mnfitteroption.piecebifprob.branchlength.diameter = 'y';
			end
			if ismember(4,parameternumber)
				mnfitteroption.piecetermprob.branchlength.diameter = 'y';
			end
			if ismember(5,parameternumber)
				mnfitteroption.rallratio.branchlength.diameter = 'y';
			end
			if ismember(6,parameternumber)
				mnfitteroption.daughterratio.branchlength.diameter = 'y';
			end
			if ismember(7,parameternumber)
				mnfitteroption.parentdaughterratio.branchlength.diameter = 'y';
			end		
		end
		if ismember(11,versusnumber)
			if ismember(2,parameternumber)
				mnfitteroption.taperrate.diameter.branchorder = 'y';
			end
			if ismember(3,parameternumber)
				mnfitteroption.piecebifprob.diameter.branchorder = 'y';
			end
			if ismember(4,parameternumber)
				mnfitteroption.piecetermprob.diameter.branchorder = 'y';
			end
			if ismember(5,parameternumber)
				mnfitteroption.rallratio.diameter.branchorder = 'y';
			end
			if ismember(6,parameternumber)
				mnfitteroption.daughterratio.diameter.branchorder = 'y';
			end
			if ismember(7,parameternumber)
				mnfitteroption.parentdaughterratio.diameter.branchorder = 'y';
			end		
		end
		if ismember(12,versusnumber)
			if ismember(2,parameternumber)
				mnfitteroption.taperrate.branchorder.diameter = 'y';
			end
			if ismember(3,parameternumber)
				mnfitteroption.piecebifprob.branchorder.diameter = 'y';
			end
			if ismember(4,parameternumber)
				mnfitteroption.piecetermprob.branchorder.diameter = 'y';
			end
			if ismember(5,parameternumber)
				mnfitteroption.rallratio.branchorder.diameter = 'y';
			end
			if ismember(6,parameternumber)
				mnfitteroption.daughterratio.branchorder.diameter = 'y';
			end
			if ismember(7,parameternumber)
				mnfitteroption.parentdaughterratio.branchorder.diameter = 'y';
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
					%mnfitteroption.taperrate.doublebins = 'y';
					mnfitteroption.taperrate.firstbinfit.fit = 'y';
					mnfitteroption.taperrate.firstbinfit.linear = 'y';
				end
				if ismember(3,parameternumber)
					%mnfitteroption.piecebifprob.doublebins = 'y';
					mnfitteroption.piecebifprob.firstbinfit.fit = 'y';
					mnfitteroption.piecebifprob.firstbinfit.linear = 'y';
				end
				if ismember(4,parameternumber)
					%mnfitteroption.piecetermprob.doublebins = 'y';
					mnfitteroption.piecetermprob.firstbinfit.fit = 'y';
					mnfitteroption.piecetermprob.firstbinfit.linear = 'y';
				end
				if ismember(5,parameternumber)
					%mnfitteroption.rallratio.doublebins = 'y';
					mnfitteroption.rallratio.firstbinfit.fit = 'y';
					mnfitteroption.rallratio.firstbinfit.linear = 'y';
				end
				if ismember(6,parameternumber)
					%mnfitteroption.daughterratio.doublebins = 'y';
					mnfitteroption.daughterratio.firstbinfit.fit = 'y';
					mnfitteroption.daughterratio.firstbinfit.linear = 'y';
				end
				if ismember(7,parameternumber)
					%mnfitteroption.parentdaughterratio.doublebins = 'y';
					mnfitteroption.parentdaughterratio.firstbinfit.fit = 'y';
					mnfitteroption.parentdaughterratio.firstbinfit.linear = 'y';
				end		
			end
			
			if ismember(2,firstbinfits)
				if ismember(2,parameternumber)
					%mnfitteroption.taperrate.doublebins = 'y';
					mnfitteroption.taperrate.firstbinfit.fit = 'y';
					mnfitteroption.taperrate.firstbinfit.exponential = 'y';
				end
				if ismember(3,parameternumber)
					%mnfitteroption.piecebifprob.doublebins = 'y';
					mnfitteroption.piecebifprob.firstbinfit.fit = 'y';
					mnfitteroption.piecebifprob.firstbinfit.exponential = 'y';
				end
				if ismember(4,parameternumber)
					%mnfitteroption.piecetermprob.doublebins = 'y';
					mnfitteroption.piecetermprob.firstbinfit.fit = 'y';
					mnfitteroption.piecetermprob.firstbinfit.exponential = 'y';
				end
				if ismember(5,parameternumber)
					%mnfitteroption.rallratio.doublebins = 'y';
					mnfitteroption.rallratio.firstbinfit.fit = 'y';
					mnfitteroption.rallratio.firstbinfit.exponential = 'y';
				end
				if ismember(6,parameternumber)
					%mnfitteroption.daughterratio.doublebins = 'y';
					mnfitteroption.daughterratio.firstbinfit.fit = 'y';
					mnfitteroption.daughterratio.firstbinfit.exponential = 'y';
				end
				if ismember(7,parameternumber)
					%mnfitteroption.parentdaughterratio.doublebins = 'y';
					mnfitteroption.parentdaughterratio.firstbinfit.fit = 'y';
					mnfitteroption.parentdaughterratio.firstbinfit.exponential = 'y';
				end		
			end
			
			if ismember(3,firstbinfits)
				if ismember(2,parameternumber)
					%mnfitteroption.taperrate.doublebins = 'y';
					mnfitteroption.taperrate.firstbinfit.fit = 'y';
					mnfitteroption.taperrate.firstbinfit.exponentialoffset = 'y';
				end
				if ismember(3,parameternumber)
					%mnfitteroption.piecebifprob.doublebins = 'y';
					mnfitteroption.piecebifprob.firstbinfit.fit = 'y';
					mnfitteroption.piecebifprob.firstbinfit.exponentialoffset = 'y';
				end
				if ismember(4,parameternumber)
					%mnfitteroption.piecetermprob.doublebins = 'y';
					mnfitteroption.piecetermprob.firstbinfit.fit = 'y';
					mnfitteroption.piecetermprob.firstbinfit.exponentialoffset = 'y';
				end
				if ismember(5,parameternumber)
					%mnfitteroption.rallratio.doublebins = 'y';
					mnfitteroption.rallratio.firstbinfit.fit = 'y';
					mnfitteroption.rallratio.firstbinfit.exponentialoffset = 'y';
				end
				if ismember(6,parameternumber)
					%mnfitteroption.daughterratio.doublebins = 'y';
					mnfitteroption.daughterratio.firstbinfit.fit = 'y';
					mnfitteroption.daughterratio.firstbinfit.exponentialoffset = 'y';
				end
				if ismember(7,parameternumber)
					%mnfitteroption.parentdaughterratio.doublebins = 'y';
					mnfitteroption.parentdaughterratio.firstbinfit.fit = 'y';
					mnfitteroption.parentdaughterratio.firstbinfit.exponentialoffset = 'y';
				end		
			end
			
			if ismember(4,firstbinfits)
				if ismember(2,parameternumber)
					%mnfitteroption.taperrate.doublebins = 'y';
					mnfitteroption.taperrate.firstbinfit.fit = 'y';
					mnfitteroption.taperrate.firstbinfit.power = 'y';
				end
				if ismember(3,parameternumber)
					%mnfitteroption.piecebifprob.doublebins = 'y';
					mnfitteroption.piecebifprob.firstbinfit.fit = 'y';
					mnfitteroption.piecebifprob.firstbinfit.power = 'y';
				end
				if ismember(4,parameternumber)
					%mnfitteroption.piecetermprob.doublebins = 'y';
					mnfitteroption.piecetermprob.firstbinfit.fit = 'y';
					mnfitteroption.piecetermprob.firstbinfit.power = 'y';
				end
				if ismember(5,parameternumber)
					%mnfitteroption.rallratio.doublebins = 'y';
					mnfitteroption.rallratio.firstbinfit.fit = 'y';
					mnfitteroption.rallratio.firstbinfit.power = 'y';
				end
				if ismember(6,parameternumber)
					%mnfitteroption.daughterratio.doublebins = 'y';
					mnfitteroption.daughterratio.firstbinfit.fit = 'y';
					mnfitteroption.daughterratio.firstbinfit.power = 'y';
				end
				if ismember(7,parameternumber)
					%mnfitteroption.parentdaughterratio.doublebins = 'y';
					mnfitteroption.parentdaughterratio.firstbinfit.fit = 'y';
					mnfitteroption.parentdaughterratio.firstbinfit.power = 'y';
				end		
			end
			
			if ismember(5,firstbinfits)
				if ismember(2,parameternumber)
					%mnfitteroption.taperrate.doublebins = 'y';
					mnfitteroption.taperrate.firstbinfit.fit = 'y';
					mnfitteroption.taperrate.firstbinfit.poweroffset = 'y';
				end
				if ismember(3,parameternumber)
					%mnfitteroption.piecebifprob.doublebins = 'y';
					mnfitteroption.piecebifprob.firstbinfit.fit = 'y';
					mnfitteroption.piecebifprob.firstbinfit.poweroffset = 'y';
				end
				if ismember(4,parameternumber)
					%mnfitteroption.piecetermprob.doublebins = 'y';
					mnfitteroption.piecetermprob.firstbinfit.fit = 'y';
					mnfitteroption.piecetermprob.firstbinfit.poweroffset = 'y';
				end
				if ismember(5,parameternumber)
					%mnfitteroption.rallratio.doublebins = 'y';
					mnfitteroption.rallratio.firstbinfit.fit = 'y';
					mnfitteroption.rallratio.firstbinfit.poweroffset = 'y';
				end
				if ismember(6,parameternumber)
					%mnfitteroption.daughterratio.doublebins = 'y';
					mnfitteroption.daughterratio.firstbinfit.fit = 'y';
					mnfitteroption.daughterratio.firstbinfit.poweroffset = 'y';
				end
				if ismember(7,parameternumber)
					%mnfitteroption.parentdaughterratio.doublebins = 'y';
					mnfitteroption.parentdaughterratio.firstbinfit.fit = 'y';
					mnfitteroption.parentdaughterratio.firstbinfit.poweroffset = 'y';
				end		
			end
			
			if ismember(6,firstbinfits)
				if ismember(2,parameternumber)
					%mnfitteroption.taperrate.doublebins = 'y';
					mnfitteroption.taperrate.firstbinfit.fit = 'y';
					mnfitteroption.taperrate.firstbinfit.sigmoid = 'y';
				end
				if ismember(3,parameternumber)
					%mnfitteroption.piecebifprob.doublebins = 'y';
					mnfitteroption.piecebifprob.firstbinfit.fit = 'y';
					mnfitteroption.piecebifprob.firstbinfit.sigmoid = 'y';
				end
				if ismember(4,parameternumber)
					%mnfitteroption.piecetermprob.doublebins = 'y';
					mnfitteroption.piecetermprob.firstbinfit.fit = 'y';
					mnfitteroption.piecetermprob.firstbinfit.sigmoid = 'y';
				end
				if ismember(5,parameternumber)
					%mnfitteroption.rallratio.doublebins = 'y';
					mnfitteroption.rallratio.firstbinfit.fit = 'y';
					mnfitteroption.rallratio.firstbinfit.sigmoid = 'y';
				end
				if ismember(6,parameternumber)
					%mnfitteroption.daughterratio.doublebins = 'y';
					mnfitteroption.daughterratio.firstbinfit.fit = 'y';
					mnfitteroption.daughterratio.firstbinfit.sigmoid = 'y';
				end
				if ismember(7,parameternumber)
					%mnfitteroption.parentdaughterratio.doublebins = 'y';
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
					%mnfitteroption.taperrate.doublebins = 'y';
					mnfitteroption.taperrate.firstbinfit.fit = 'y';
					mnfitteroption.taperrate.firstbinfittype.unweighted = 'y';
				end
				if ismember(3,parameternumber)
					%mnfitteroption.piecebifprob.doublebins = 'y';
					mnfitteroption.piecebifprob.firstbinfit.fit = 'y';
					mnfitteroption.piecebifprob.firstbinfittype.unweighted = 'y';
				end
				if ismember(4,parameternumber)
					%mnfitteroption.piecetermprob.doublebins = 'y';
					mnfitteroption.piecetermprob.firstbinfit.fit = 'y';
					mnfitteroption.piecetermprob.firstbinfittype.unweighted = 'y';
				end
				if ismember(5,parameternumber)
					%mnfitteroption.rallratio.doublebins = 'y';
					mnfitteroption.rallratio.firstbinfit.fit = 'y';
					mnfitteroption.rallratio.firstbinfittype.unweighted = 'y';
				end
				if ismember(6,parameternumber)
					%mnfitteroption.daughterratio.doublebins = 'y';
					mnfitteroption.daughterratio.firstbinfit.fit = 'y';
					mnfitteroption.daughterratio.firstbinfittype.unweighted = 'y';
				end
				if ismember(7,parameternumber)
					%mnfitteroption.parentdaughterratio.doublebins = 'y';
					mnfitteroption.parentdaughterratio.firstbinfit.fit = 'y';
					mnfitteroption.parentdaughterratio.firstbinfittype.unweighted = 'y';
				end		
			end
			
			if ismember(2,firstbinfittypes)
				if ismember(2,parameternumber)
					%mnfitteroption.taperrate.doublebins = 'y';
					mnfitteroption.taperrate.firstbinfit.fit = 'y';
					mnfitteroption.taperrate.firstbinfittype.weighted = 'y';
				end
				if ismember(3,parameternumber)
					%mnfitteroption.piecebifprob.doublebins = 'y';
					mnfitteroption.piecebifprob.firstbinfit.fit = 'y';
					mnfitteroption.piecebifprob.firstbinfittype.weighted = 'y';
				end
				if ismember(4,parameternumber)
					%mnfitteroption.piecetermprob.doublebins = 'y';
					mnfitteroption.piecetermprob.firstbinfit.fit = 'y';
					mnfitteroption.piecetermprob.firstbinfittype.weighted = 'y';
				end
				if ismember(5,parameternumber)
					%mnfitteroption.rallratio.doublebins = 'y';
					mnfitteroption.rallratio.firstbinfit.fit = 'y';
					mnfitteroption.rallratio.firstbinfittype.weighted = 'y';
				end
				if ismember(6,parameternumber)
					%mnfitteroption.daughterratio.doublebins = 'y';
					mnfitteroption.daughterratio.firstbinfit.fit = 'y';
					mnfitteroption.daughterratio.firstbinfittype.weighted = 'y';
				end
				if ismember(7,parameternumber)
					%mnfitteroption.parentdaughterratio.doublebins = 'y';
					mnfitteroption.parentdaughterratio.firstbinfit.fit = 'y';
					mnfitteroption.parentdaughterratio.firstbinfittype.weighted = 'y';
				end		
			end
			
			if ismember(3,firstbinfittypes)
				if ismember(2,parameternumber)
					%mnfitteroption.taperrate.doublebins = 'y';
					mnfitteroption.taperrate.firstbinfit.fit = 'y';
					mnfitteroption.taperrate.firstbinfittype.robust = 'y';
				end
				if ismember(3,parameternumber)
					%mnfitteroption.piecebifprob.doublebins = 'y';
					mnfitteroption.piecebifprob.firstbinfit.fit = 'y';
					mnfitteroption.piecebifprob.firstbinfittype.robust = 'y';
				end
				if ismember(4,parameternumber)
					%mnfitteroption.piecetermprob.doublebins = 'y';
					mnfitteroption.piecetermprob.firstbinfit.fit = 'y';
					mnfitteroption.piecetermprob.firstbinfittype.robust = 'y';
				end
				if ismember(5,parameternumber)
					%mnfitteroption.rallratio.doublebins = 'y';
					mnfitteroption.rallratio.firstbinfit.fit = 'y';
					mnfitteroption.rallratio.firstbinfittype.robust = 'y';
				end
				if ismember(6,parameternumber)
					%mnfitteroption.daughterratio.doublebins = 'y';
					mnfitteroption.daughterratio.firstbinfit.fit = 'y';
					mnfitteroption.daughterratio.firstbinfittype.robust = 'y';
				end
				if ismember(7,parameternumber)
					%mnfitteroption.parentdaughterratio.doublebins = 'y';
					mnfitteroption.parentdaughterratio.firstbinfit.fit = 'y';
					mnfitteroption.parentdaughterratio.firstbinfittype.robust = 'y';
				end		
			end
			
			if ismember(4,firstbinfittypes)
				if ismember(2,parameternumber)
					%mnfitteroption.taperrate.doublebins = 'y';
					mnfitteroption.taperrate.firstbinfit.fit = 'y';
					mnfitteroption.taperrate.firstbinfittype.robustweighted = 'y';
				end
				if ismember(3,parameternumber)
					%mnfitteroption.piecebifprob.doublebins = 'y';
					mnfitteroption.piecebifprob.firstbinfit.fit = 'y';
					mnfitteroption.piecebifprob.firstbinfittype.robustweighted = 'y';
				end
				if ismember(4,parameternumber)
					%mnfitteroption.piecetermprob.doublebins = 'y';
					mnfitteroption.piecetermprob.firstbinfit.fit = 'y';
					mnfitteroption.piecetermprob.firstbinfittype.robustweighted = 'y';
				end
				if ismember(5,parameternumber)
					%mnfitteroption.rallratio.doublebins = 'y';
					mnfitteroption.rallratio.firstbinfit.fit = 'y';
					mnfitteroption.rallratio.firstbinfittype.robustweighted = 'y';
				end
				if ismember(6,parameternumber)
					%mnfitteroption.daughterratio.doublebins = 'y';
					mnfitteroption.daughterratio.firstbinfit.fit = 'y';
					mnfitteroption.daughterratio.firstbinfittype.robustweighted = 'y';
				end
				if ismember(7,parameternumber)
					%mnfitteroption.parentdaughterratio.doublebins = 'y';
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
						%mnfitteroption.taperrate.doublebins = 'y';
						mnfitteroption.taperrate.secondbinfit.fit = 'y';
						mnfitteroption.taperrate.secondbinfit.linear = 'y';
					end
					if ismember(3,parameternumber)
						%mnfitteroption.piecebifprob.doublebins = 'y';
						mnfitteroption.piecebifprob.secondbinfit.fit = 'y';
						mnfitteroption.piecebifprob.secondbinfit.linear = 'y';
					end
					if ismember(4,parameternumber)
						%mnfitteroption.piecetermprob.doublebins = 'y';
						mnfitteroption.piecetermprob.secondbinfit.fit = 'y';
						mnfitteroption.piecetermprob.secondbinfit.linear = 'y';
					end
					if ismember(5,parameternumber)
						%mnfitteroption.rallratio.doublebins = 'y';
						mnfitteroption.rallratio.secondbinfit.fit = 'y';
						mnfitteroption.rallratio.secondbinfit.linear = 'y';
					end
					if ismember(6,parameternumber)
						%mnfitteroption.daughterratio.doublebins = 'y';
						mnfitteroption.daughterratio.secondbinfit.fit = 'y';
						mnfitteroption.daughterratio.secondbinfit.linear = 'y';
					end
					if ismember(7,parameternumber)
						%mnfitteroption.parentdaughterratio.doublebins = 'y';
						mnfitteroption.parentdaughterratio.secondbinfit.fit = 'y';
						mnfitteroption.parentdaughterratio.secondbinfit.linear = 'y';
					end		
				end
				
				if ismember(2,secondbinfits)
					if ismember(2,parameternumber)
						%mnfitteroption.taperrate.doublebins = 'y';
						mnfitteroption.taperrate.secondbinfit.fit = 'y';
						mnfitteroption.taperrate.secondbinfit.exponential = 'y';
					end
					if ismember(3,parameternumber)
						%mnfitteroption.piecebifprob.doublebins = 'y';
						mnfitteroption.piecebifprob.secondbinfit.fit = 'y';
						mnfitteroption.piecebifprob.secondbinfit.exponential = 'y';
					end
					if ismember(4,parameternumber)
						%mnfitteroption.piecetermprob.doublebins = 'y';
						mnfitteroption.piecetermprob.secondbinfit.fit = 'y';
						mnfitteroption.piecetermprob.secondbinfit.exponential = 'y';
					end
					if ismember(5,parameternumber)
						%mnfitteroption.rallratio.doublebins = 'y';
						mnfitteroption.rallratio.secondbinfit.fit = 'y';
						mnfitteroption.rallratio.secondbinfit.exponential = 'y';
					end
					if ismember(6,parameternumber)
						%mnfitteroption.daughterratio.doublebins = 'y';
						mnfitteroption.daughterratio.secondbinfit.fit = 'y';
						mnfitteroption.daughterratio.secondbinfit.exponential = 'y';
					end
					if ismember(7,parameternumber)
						%mnfitteroption.parentdaughterratio.doublebins = 'y';
						mnfitteroption.parentdaughterratio.secondbinfit.fit = 'y';
						mnfitteroption.parentdaughterratio.secondbinfit.exponential = 'y';
					end		
				end
				
				if ismember(3,secondbinfits)
					if ismember(2,parameternumber)
						%mnfitteroption.taperrate.doublebins = 'y';
						mnfitteroption.taperrate.secondbinfit.fit = 'y';
						mnfitteroption.taperrate.secondbinfit.exponentialoffset = 'y';
					end
					if ismember(3,parameternumber)
						%mnfitteroption.piecebifprob.doublebins = 'y';
						mnfitteroption.piecebifprob.secondbinfit.fit = 'y';
						mnfitteroption.piecebifprob.secondbinfit.exponentialoffset = 'y';
					end
					if ismember(4,parameternumber)
						%mnfitteroption.piecetermprob.doublebins = 'y';
						mnfitteroption.piecetermprob.secondbinfit.fit = 'y';
						mnfitteroption.piecetermprob.secondbinfit.exponentialoffset = 'y';
					end
					if ismember(5,parameternumber)
						%mnfitteroption.rallratio.doublebins = 'y';
						mnfitteroption.rallratio.secondbinfit.fit = 'y';
						mnfitteroption.rallratio.secondbinfit.exponentialoffset = 'y';
					end
					if ismember(6,parameternumber)
						%mnfitteroption.daughterratio.doublebins = 'y';
						mnfitteroption.daughterratio.secondbinfit.fit = 'y';
						mnfitteroption.daughterratio.secondbinfit.exponentialoffset = 'y';
					end
					if ismember(7,parameternumber)
						%mnfitteroption.parentdaughterratio.doublebins = 'y';
						mnfitteroption.parentdaughterratio.secondbinfit.fit = 'y';
						mnfitteroption.parentdaughterratio.secondbinfit.exponentialoffset = 'y';
					end		
				end
				
				if ismember(4,secondbinfits)
					if ismember(2,parameternumber)
						%mnfitteroption.taperrate.doublebins = 'y';
						mnfitteroption.taperrate.secondbinfit.fit = 'y';
						mnfitteroption.taperrate.secondbinfit.power = 'y';
					end
					if ismember(3,parameternumber)
						%mnfitteroption.piecebifprob.doublebins = 'y';
						mnfitteroption.piecebifprob.secondbinfit.fit = 'y';
						mnfitteroption.piecebifprob.secondbinfit.power = 'y';
					end
					if ismember(4,parameternumber)
						%mnfitteroption.piecetermprob.doublebins = 'y';
						mnfitteroption.piecetermprob.secondbinfit.fit = 'y';
						mnfitteroption.piecetermprob.secondbinfit.power = 'y';
					end
					if ismember(5,parameternumber)
						%mnfitteroption.rallratio.doublebins = 'y';
						mnfitteroption.rallratio.secondbinfit.fit = 'y';
						mnfitteroption.rallratio.secondbinfit.power = 'y';
					end
					if ismember(6,parameternumber)
						%mnfitteroption.daughterratio.doublebins = 'y';
						mnfitteroption.daughterratio.secondbinfit.fit = 'y';
						mnfitteroption.daughterratio.secondbinfit.power = 'y';
					end
					if ismember(7,parameternumber)
						%mnfitteroption.parentdaughterratio.doublebins = 'y';
						mnfitteroption.parentdaughterratio.secondbinfit.fit = 'y';
						mnfitteroption.parentdaughterratio.secondbinfit.power = 'y';
					end		
				end
				
				if ismember(5,secondbinfits)
					if ismember(2,parameternumber)
						%mnfitteroption.taperrate.doublebins = 'y';
						mnfitteroption.taperrate.secondbinfit.fit = 'y';
						mnfitteroption.taperrate.secondbinfit.poweroffset = 'y';
					end
					if ismember(3,parameternumber)
						%mnfitteroption.piecebifprob.doublebins = 'y';
						mnfitteroption.piecebifprob.secondbinfit.fit = 'y';
						mnfitteroption.piecebifprob.secondbinfit.poweroffset = 'y';
					end
					if ismember(4,parameternumber)
						%mnfitteroption.piecetermprob.doublebins = 'y';
						mnfitteroption.piecetermprob.secondbinfit.fit = 'y';
						mnfitteroption.piecetermprob.secondbinfit.poweroffset = 'y';
					end
					if ismember(5,parameternumber)
						%mnfitteroption.rallratio.doublebins = 'y';
						mnfitteroption.rallratio.secondbinfit.fit = 'y';
						mnfitteroption.rallratio.secondbinfit.poweroffset = 'y';
					end
					if ismember(6,parameternumber)
						%mnfitteroption.daughterratio.doublebins = 'y';
						mnfitteroption.daughterratio.secondbinfit.fit = 'y';
						mnfitteroption.daughterratio.secondbinfit.poweroffset = 'y';
					end
					if ismember(7,parameternumber)
						%mnfitteroption.parentdaughterratio.doublebins = 'y';
						mnfitteroption.parentdaughterratio.secondbinfit.fit = 'y';
						mnfitteroption.parentdaughterratio.secondbinfit.poweroffset = 'y';
					end		
				end
				
				if ismember(6,secondbinfits)
					if ismember(2,parameternumber)
						%mnfitteroption.taperrate.doublebins = 'y';
						mnfitteroption.taperrate.secondbinfit.fit = 'y';
						mnfitteroption.taperrate.secondbinfit.sigmoid = 'y';
					end
					if ismember(3,parameternumber)
						%mnfitteroption.piecebifprob.doublebins = 'y';
						mnfitteroption.piecebifprob.secondbinfit.fit = 'y';
						mnfitteroption.piecebifprob.secondbinfit.sigmoid = 'y';
					end
					if ismember(4,parameternumber)
						%mnfitteroption.piecetermprob.doublebins = 'y';
						mnfitteroption.piecetermprob.secondbinfit.fit = 'y';
						mnfitteroption.piecetermprob.secondbinfit.sigmoid = 'y';
					end
					if ismember(5,parameternumber)
						%mnfitteroption.rallratio.doublebins = 'y';
						mnfitteroption.rallratio.secondbinfit.fit = 'y';
						mnfitteroption.rallratio.secondbinfit.sigmoid = 'y';
					end
					if ismember(6,parameternumber)
						%mnfitteroption.daughterratio.doublebins = 'y';
						mnfitteroption.daughterratio.secondbinfit.fit = 'y';
						mnfitteroption.daughterratio.secondbinfit.sigmoid = 'y';
					end
					if ismember(7,parameternumber)
						%mnfitteroption.parentdaughterratio.doublebins = 'y';
						mnfitteroption.parentdaughterratio.secondbinfit.fit = 'y';
						mnfitteroption.parentdaughterratio.secondbinfit.sigmoid = 'y';
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
						mnfitteroption.taperrate.doublebins.fit = 'y';
						mnfitteroption.taperrate.doublebins.firstbin.fit = 'linear';
					end
					if ismember(3,parameternumber)
						mnfitteroption.piecebifprob.doublebins.fit = 'y';
						mnfitteroption.piecebifprob.doublebins.firstbin.fit = 'linear';
					end
					if ismember(4,parameternumber)
						mnfitteroption.piecetermprob.doublebins.fit = 'y';
						mnfitteroption.piecetermprob.doublebins.firstbin.fit = 'linear';
					end
					if ismember(5,parameternumber)
						mnfitteroption.rallratio.doublebins.fit = 'y';
						mnfitteroption.rallratio.doublebins.firstbin.fit = 'linear';
					end
					if ismember(6,parameternumber)
						mnfitteroption.daughterratio.doublebins.fit = 'y';
						mnfitteroption.daughterratio.doublebins.firstbin.fit = 'linear';
					end
					if ismember(7,parameternumber)
						mnfitteroption.parentdaughterratio.doublebins.fit = 'y';
						mnfitteroption.parentdaughterratio.doublebins.firstbin.fit = 'linear';
					end		
				end
				
				if ismember(2,doublebinfirstbinfits)
					if ismember(2,parameternumber)
						mnfitteroption.taperrate.doublebins.fit = 'y';
						mnfitteroption.taperrate.doublebins.firstbin.fit = 'exponential';
					end
					if ismember(3,parameternumber)
						mnfitteroption.piecebifprob.doublebins.fit = 'y';
						mnfitteroption.piecebifprob.doublebins.firstbin.fit = 'exponential';
					end
					if ismember(4,parameternumber)
						mnfitteroption.piecetermprob.doublebins.fit = 'y';
						mnfitteroption.piecetermprob.doublebins.firstbin.fit = 'exponential';
					end
					if ismember(5,parameternumber)
						mnfitteroption.rallratio.doublebins.fit = 'y';
						mnfitteroption.rallratio.doublebins.firstbin.fit = 'exponential';
					end
					if ismember(6,parameternumber)
						mnfitteroption.daughterratio.doublebins.fit = 'y';
						mnfitteroption.daughterratio.doublebins.firstbin.fit = 'exponential';
					end
					if ismember(7,parameternumber)
						mnfitteroption.parentdaughterratio.doublebins.fit = 'y';
						mnfitteroption.parentdaughterratio.doublebins.firstbin.fit = 'exponential';
					end		
				end
				
				if ismember(3,doublebinfirstbinfits)
					if ismember(2,parameternumber)
						mnfitteroption.taperrate.doublebins.fit = 'y';
						mnfitteroption.taperrate.doublebins.firstbin.fit = 'exponentialoffset';
					end
					if ismember(3,parameternumber)
						mnfitteroption.piecebifprob.doublebins.fit = 'y';
						mnfitteroption.piecebifprob.doublebins.firstbin.fit = 'exponentialoffset';
					end
					if ismember(4,parameternumber)
						mnfitteroption.piecetermprob.doublebins.fit = 'y';
						mnfitteroption.piecetermprob.doublebins.firstbin.fit = 'exponentialoffset';
					end
					if ismember(5,parameternumber)
						mnfitteroption.rallratio.doublebins.fit = 'y';
						mnfitteroption.rallratio.doublebins.firstbin.fit = 'exponentialoffset';
					end
					if ismember(6,parameternumber)
						mnfitteroption.daughterratio.doublebins.fit = 'y';
						mnfitteroption.daughterratio.doublebins.firstbin.fit = 'exponentialoffset';
					end
					if ismember(7,parameternumber)
						mnfitteroption.parentdaughterratio.doublebins.fit = 'y';
						mnfitteroption.parentdaughterratio.doublebins.firstbin.fit = 'exponentialoffset';
					end		
				end
				
				if ismember(4,doublebinfirstbinfits)
					if ismember(2,parameternumber)
						mnfitteroption.taperrate.doublebins.fit = 'y';
						mnfitteroption.taperrate.doublebins.firstbin.fit = 'power';
					end
					if ismember(3,parameternumber)
						mnfitteroption.piecebifprob.doublebins.fit = 'y';
						mnfitteroption.piecebifprob.doublebins.firstbin.fit = 'power';
					end
					if ismember(4,parameternumber)
						mnfitteroption.piecetermprob.doublebins.fit = 'y';
						mnfitteroption.piecetermprob.doublebins.firstbin.fit = 'power';
					end
					if ismember(5,parameternumber)
						mnfitteroption.rallratio.doublebins.fit = 'y';
						mnfitteroption.rallratio.doublebins.firstbin.fit = 'power';
					end
					if ismember(6,parameternumber)
						mnfitteroption.daughterratio.doublebins.fit = 'y';
						mnfitteroption.daughterratio.doublebins.firstbin.fit = 'power';
					end
					if ismember(7,parameternumber)
						mnfitteroption.parentdaughterratio.doublebins.fit = 'y';
						mnfitteroption.parentdaughterratio.doublebins.firstbin.fit = 'power';
					end		
				end
				
				if ismember(5,doublebinfirstbinfits)
					if ismember(2,parameternumber)
						mnfitteroption.taperrate.doublebins.fit = 'y';
						mnfitteroption.taperrate.doublebins.firstbin.fit = 'poweroffset';
					end
					if ismember(3,parameternumber)
						mnfitteroption.piecebifprob.doublebins.fit = 'y';
						mnfitteroption.piecebifprob.doublebins.firstbin.fit = 'poweroffset';
					end
					if ismember(4,parameternumber)
						mnfitteroption.piecetermprob.doublebins.fit = 'y';
						mnfitteroption.piecetermprob.doublebins.firstbin.fit = 'poweroffset';
					end
					if ismember(5,parameternumber)
						mnfitteroption.rallratio.doublebins.fit = 'y';
						mnfitteroption.rallratio.doublebins.firstbin.fit = 'poweroffset';
					end
					if ismember(6,parameternumber)
						mnfitteroption.daughterratio.doublebins.fit = 'y';
						mnfitteroption.daughterratio.doublebins.firstbin.fit = 'poweroffset';
					end
					if ismember(7,parameternumber)
						mnfitteroption.parentdaughterratio.doublebins.fit = 'y';
						mnfitteroption.parentdaughterratio.doublebins.firstbin.fit = 'poweroffset';
					end		
				end
				
				if ismember(6,doublebinfirstbinfits)
					if ismember(2,parameternumber)
						mnfitteroption.taperrate.doublebins.fit = 'y';
						mnfitteroption.taperrate.doublebins.firstbin.fit = 'sigmoid';
					end
					if ismember(3,parameternumber)
						mnfitteroption.piecebifprob.doublebins.fit = 'y';
						mnfitteroption.piecebifprob.doublebins.firstbin.fit = 'sigmoid';
					end
					if ismember(4,parameternumber)
						mnfitteroption.piecetermprob.doublebins.fit = 'y';
						mnfitteroption.piecetermprob.doublebins.firstbin.fit = 'sigmoid';
					end
					if ismember(5,parameternumber)
						mnfitteroption.rallratio.doublebins.fit = 'y';
						mnfitteroption.rallratio.doublebins.firstbin.fit = 'sigmoid';
					end
					if ismember(6,parameternumber)
						mnfitteroption.daughterratio.doublebins.fit = 'y';
						mnfitteroption.daughterratio.doublebins.firstbin.fit = 'sigmoid';
					end
					if ismember(7,parameternumber)
						mnfitteroption.parentdaughterratio.doublebins.fit = 'y';
						mnfitteroption.parentdaughterratio.doublebins.firstbin.fit = 'sigmoid';
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
						mnfitteroption.taperrate.doublebins.fit = 'y';
						mnfitteroption.taperrate.doublebins.firstbin.fittype = 'unweighted';
					end
					if ismember(3,parameternumber)
						mnfitteroption.piecebifprob.doublebins.fit = 'y';
						mnfitteroption.piecebifprob.doublebins.firstbin.fittype = 'unweighted';
					end
					if ismember(4,parameternumber)
						mnfitteroption.piecetermprob.doublebins.fit = 'y';
						mnfitteroption.piecetermprob.doublebins.firstbin.fittype = 'unweighted';
					end
					if ismember(5,parameternumber)
						mnfitteroption.rallratio.doublebins.fit = 'y';
						mnfitteroption.rallratio.doublebins.firstbin.fittype = 'unweighted';
					end
					if ismember(6,parameternumber)
						mnfitteroption.daughterratio.doublebins.fit = 'y';
						mnfitteroption.daughterratio.doublebins.firstbin.fittype = 'unweighted';
					end
					if ismember(7,parameternumber)
						mnfitteroption.parentdaughterratio.doublebins.fit = 'y';
						mnfitteroption.parentdaughterratio.doublebins.firstbin.fittype = 'unweighted';
					end		
				end
				
				if ismember(2,doublebinfirstbinfittypes)
					if ismember(2,parameternumber)
						mnfitteroption.taperrate.doublebins.fit = 'y';
						mnfitteroption.taperrate.doublebins.firstbin.fittype = 'weighted';
					end
					if ismember(3,parameternumber)
						mnfitteroption.piecebifprob.doublebins.fit = 'y';
						mnfitteroption.piecebifprob.doublebins.firstbin.fittype = 'weighted';
					end
					if ismember(4,parameternumber)
						mnfitteroption.piecetermprob.doublebins.fit = 'y';
						mnfitteroption.piecetermprob.doublebins.firstbin.fittype = 'weighted';
					end
					if ismember(5,parameternumber)
						mnfitteroption.rallratio.doublebins.fit = 'y';
						mnfitteroption.rallratio.doublebins.firstbin.fittype = 'weighted';
					end
					if ismember(6,parameternumber)
						mnfitteroption.daughterratio.doublebins.fit = 'y';
						mnfitteroption.daughterratio.doublebins.firstbin.fittype = 'weighted';
					end
					if ismember(7,parameternumber)
						mnfitteroption.parentdaughterratio.doublebins.fit = 'y';
						mnfitteroption.parentdaughterratio.doublebins.firstbin.fittype = 'weighted';
					end		
				end
				
				if ismember(3,doublebinfirstbinfittypes)
					if ismember(2,parameternumber)
						mnfitteroption.taperrate.doublebins.fit = 'y';
						mnfitteroption.taperrate.doublebins.firstbin.fittype = 'robust';
					end
					if ismember(3,parameternumber)
						mnfitteroption.piecebifprob.doublebins.fit = 'y';
						mnfitteroption.piecebifprob.doublebins.firstbin.fittype = 'robust';
					end
					if ismember(4,parameternumber)
						mnfitteroption.piecetermprob.doublebins.fit = 'y';
						mnfitteroption.piecetermprob.doublebins.firstbin.fittype = 'robust';
					end
					if ismember(5,parameternumber)
						mnfitteroption.rallratio.doublebins.fit = 'y';
						mnfitteroption.rallratio.doublebins.firstbin.fittype = 'robust';
					end
					if ismember(6,parameternumber)
						mnfitteroption.daughterratio.doublebins.fit = 'y';
						mnfitteroption.daughterratio.doublebins.firstbin.fittype = 'robust';
					end
					if ismember(7,parameternumber)
						mnfitteroption.parentdaughterratio.doublebins.fit = 'y';
						mnfitteroption.parentdaughterratio.doublebins.firstbin.fittype = 'robust';
					end		
				end
				
				if ismember(4,doublebinfirstbinfittypes)
					if ismember(2,parameternumber)
						mnfitteroption.taperrate.doublebins.fit = 'y';
						mnfitteroption.taperrate.doublebins.firstbin.fittype = 'robustweighted';
					end
					if ismember(3,parameternumber)
						mnfitteroption.piecebifprob.doublebins.fit = 'y';
						mnfitteroption.piecebifprob.doublebins.firstbin.fittype = 'robustweighted';
					end
					if ismember(4,parameternumber)
						mnfitteroption.piecetermprob.doublebins.fit = 'y';
						mnfitteroption.piecetermprob.doublebins.firstbin.fittype = 'robustweighted';
					end
					if ismember(5,parameternumber)
						mnfitteroption.rallratio.doublebins.fit = 'y';
						mnfitteroption.rallratio.doublebins.firstbin.fittype = 'robustweighted';
					end
					if ismember(6,parameternumber)
						mnfitteroption.daughterratio.doublebins.fit = 'y';
						mnfitteroption.daughterratio.doublebins.firstbin.fittype = 'robustweighted';
					end
					if ismember(7,parameternumber)
						mnfitteroption.parentdaughterratio.doublebins.fit = 'y';
						mnfitteroption.parentdaughterratio.doublebins.firstbin.fittype = 'robustweighted';
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
							mnfitteroption.taperrate.doublebins.fit = 'y';
							mnfitteroption.taperrate.doublebins.parameter(i).fit = 'linear';
						end
						if ismember(3,parameternumber)
							mnfitteroption.piecebifprob.doublebins.fit = 'y';
							mnfitteroption.piecebifprob.doublebins.parameter(i).fit = 'linear';
						end
						if ismember(4,parameternumber)
							mnfitteroption.piecetermprob.doublebins.fit = 'y';
							mnfitteroption.piecetermprob.doublebins.parameter(i).fit = 'linear';
						end
						if ismember(5,parameternumber)
							mnfitteroption.rallratio.doublebins.fit = 'y';
							mnfitteroption.rallratio.doublebins.parameter(i).fit = 'linear';
						end
						if ismember(6,parameternumber)
							mnfitteroption.daughterratio.doublebins.fit = 'y';
							mnfitteroption.daughterratio.doublebins.parameter(i).fit = 'linear';
						end
						if ismember(7,parameternumber)
							mnfitteroption.parentdaughterratio.doublebins.fit = 'y';
							mnfitteroption.parentdaughterratio.doublebins.parameter(i).fit = 'linear';
						end		
					end
					
					if ismember(2,doublebinsecondbinfits(i))
						if ismember(2,parameternumber)
							mnfitteroption.taperrate.doublebins.fit = 'y';
							mnfitteroption.taperrate.doublebins.parameter(i).fit = 'exponential';
						end
						if ismember(3,parameternumber)
							mnfitteroption.piecebifprob.doublebins.fit = 'y';
							mnfitteroption.piecebifprob.doublebins.parameter(i).fit = 'exponential';
						end
						if ismember(4,parameternumber)
							mnfitteroption.piecetermprob.doublebins.fit = 'y';
							mnfitteroption.piecetermprob.doublebins.parameter(i).fit = 'exponential';
						end
						if ismember(5,parameternumber)
							mnfitteroption.rallratio.doublebins.fit = 'y';
							mnfitteroption.rallratio.doublebins.parameter(i).fit = 'exponential';
						end
						if ismember(6,parameternumber)
							mnfitteroption.daughterratio.doublebins.fit = 'y';
							mnfitteroption.daughterratio.doublebins.parameter(i).fit = 'exponential';
						end
						if ismember(7,parameternumber)
							mnfitteroption.parentdaughterratio.doublebins.fit = 'y';
							mnfitteroption.parentdaughterratio.doublebins.parameter(i).fit = 'exponential';
						end		
					end
					
					if ismember(3,doublebinsecondbinfits(i))
						if ismember(2,parameternumber)
							mnfitteroption.taperrate.doublebins.fit = 'y';
							mnfitteroption.taperrate.doublebins.parameter(i).fit = 'exponentialoffset';
						end
						if ismember(3,parameternumber)
							mnfitteroption.piecebifprob.doublebins.fit = 'y';
							mnfitteroption.piecebifprob.doublebins.parameter(i).fit = 'exponentialoffset';
						end
						if ismember(4,parameternumber)
							mnfitteroption.piecetermprob.doublebins.fit = 'y';
							mnfitteroption.piecetermprob.doublebins.parameter(i).fit = 'exponentialoffset';
						end
						if ismember(5,parameternumber)
							mnfitteroption.rallratio.doublebins.fit = 'y';
							mnfitteroption.rallratio.doublebins.parameter(i).fit = 'exponentialoffset';
						end
						if ismember(6,parameternumber)
							mnfitteroption.daughterratio.doublebins.fit = 'y';
							mnfitteroption.daughterratio.doublebins.parameter(i).fit = 'exponentialoffset';
						end
						if ismember(7,parameternumber)
							mnfitteroption.parentdaughterratio.doublebins.fit = 'y';
							mnfitteroption.parentdaughterratio.doublebins.parameter(i).fit = 'exponentialoffset';
						end		
					end
					
					if ismember(4,doublebinsecondbinfits(i))
						if ismember(2,parameternumber)
							mnfitteroption.taperrate.doublebins.fit = 'y';
							mnfitteroption.taperrate.doublebins.parameter(i).fit = 'power';
						end
						if ismember(3,parameternumber)
							mnfitteroption.piecebifprob.doublebins.fit = 'y';
							mnfitteroption.piecebifprob.doublebins.parameter(i).fit = 'power';
						end
						if ismember(4,parameternumber)
							mnfitteroption.piecetermprob.doublebins.fit = 'y';
							mnfitteroption.piecetermprob.doublebins.parameter(i).fit = 'power';
						end
						if ismember(5,parameternumber)
							mnfitteroption.rallratio.doublebins.fit = 'y';
							mnfitteroption.rallratio.doublebins.parameter(i).fit = 'power';
						end
						if ismember(6,parameternumber)
							mnfitteroption.daughterratio.doublebins.fit = 'y';
							mnfitteroption.daughterratio.doublebins.parameter(i).fit = 'power';
						end
						if ismember(7,parameternumber)
							mnfitteroption.parentdaughterratio.doublebins.fit = 'y';
							mnfitteroption.parentdaughterratio.doublebins.parameter(i).fit = 'power';
						end		
					end
					
					if ismember(5,doublebinsecondbinfits(i))
						if ismember(2,parameternumber)
							mnfitteroption.taperrate.doublebins.fit = 'y';
							mnfitteroption.taperrate.doublebins.parameter(i).fit = 'poweroffset';
						end
						if ismember(3,parameternumber)
							mnfitteroption.piecebifprob.doublebins.fit = 'y';
							mnfitteroption.piecebifprob.doublebins.parameter(i).fit = 'poweroffset';
						end
						if ismember(4,parameternumber)
							mnfitteroption.piecetermprob.doublebins.fit = 'y';
							mnfitteroption.piecetermprob.doublebins.parameter(i).fit = 'poweroffset';
						end
						if ismember(5,parameternumber)
							mnfitteroption.rallratio.doublebins.fit = 'y';
							mnfitteroption.rallratio.doublebins.parameter(i).fit = 'poweroffset';
						end
						if ismember(6,parameternumber)
							mnfitteroption.daughterratio.doublebins.fit = 'y';
							mnfitteroption.daughterratio.doublebins.parameter(i).fit = 'poweroffset';
						end
						if ismember(7,parameternumber)
							mnfitteroption.parentdaughterratio.doublebins.fit = 'y';
							mnfitteroption.parentdaughterratio.doublebins.parameter(i).fit = 'poweroffset';
						end		
					end
					
					if ismember(6,doublebinsecondbinfits(i))
						if ismember(2,parameternumber)
							mnfitteroption.taperrate.doublebins.fit = 'y';
							mnfitteroption.taperrate.doublebins.parameter(i).fit = 'sigmoid';
						end
						if ismember(3,parameternumber)
							mnfitteroption.piecebifprob.doublebins.fit = 'y';
							mnfitteroption.piecebifprob.doublebins.parameter(i).fit = 'sigmoid';
						end
						if ismember(4,parameternumber)
							mnfitteroption.piecetermprob.doublebins.fit = 'y';
							mnfitteroption.piecetermprob.doublebins.parameter(i).fit = 'sigmoid';
						end
						if ismember(5,parameternumber)
							mnfitteroption.rallratio.doublebins.fit = 'y';
							mnfitteroption.rallratio.doublebins.parameter(i).fit = 'sigmoid';
						end
						if ismember(6,parameternumber)
							mnfitteroption.daughterratio.doublebins.fit = 'y';
							mnfitteroption.daughterratio.doublebins.parameter(i).fit = 'sigmoid';
						end
						if ismember(7,parameternumber)
							mnfitteroption.parentdaughterratio.doublebins.fit = 'y';
							mnfitteroption.parentdaughterratio.doublebins.parameter(i).fit = 'sigmoid';
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
							mnfitteroption.taperrate.doublebins.fit = 'y';
							mnfitteroption.taperrate.doublebins.parameter(i).fittype = 'unweighted';
						end
						if ismember(3,parameternumber)
							mnfitteroption.piecebifprob.doublebins.fit = 'y';
							mnfitteroption.piecebifprob.doublebins.parameter(i).fittype = 'unweighted';
						end
						if ismember(4,parameternumber)
							mnfitteroption.piecetermprob.doublebins.fit = 'y';
							mnfitteroption.piecetermprob.doublebins.parameter(i).fittype = 'unweighted';
						end
						if ismember(5,parameternumber)
							mnfitteroption.rallratio.doublebins.fit = 'y';
							mnfitteroption.rallratio.doublebins.parameter(i).fittype = 'unweighted';
						end
						if ismember(6,parameternumber)
							mnfitteroption.daughterratio.doublebins.fit = 'y';
							mnfitteroption.daughterratio.doublebins.parameter(i).fittype = 'unweighted';
						end
						if ismember(7,parameternumber)
							mnfitteroption.parentdaughterratio.doublebins.fit = 'y';
							mnfitteroption.parentdaughterratio.doublebins.parameter(i).fittype = 'unweighted';
						end		
					end
					
					if ismember(2,doublebinsecondbinfits(i))
						if ismember(2,parameternumber)
							mnfitteroption.taperrate.doublebins.fit = 'y';
							mnfitteroption.taperrate.doublebins.parameter(i).fittype = 'weighted';
						end
						if ismember(3,parameternumber)
							mnfitteroption.piecebifprob.doublebins.fit = 'y';
							mnfitteroption.piecebifprob.doublebins.parameter(i).fittype = 'weighted';
						end
						if ismember(4,parameternumber)
							mnfitteroption.piecetermprob.doublebins.fit = 'y';
							mnfitteroption.piecetermprob.doublebins.parameter(i).fittype = 'weighted';
						end
						if ismember(5,parameternumber)
							mnfitteroption.rallratio.doublebins.fit = 'y';
							mnfitteroption.rallratio.doublebins.parameter(i).fittype = 'weighted';
						end
						if ismember(6,parameternumber)
							mnfitteroption.daughterratio.doublebins.fit = 'y';
							mnfitteroption.daughterratio.doublebins.parameter(i).fittype = 'weighted';
						end
						if ismember(7,parameternumber)
							mnfitteroption.parentdaughterratio.doublebins.fit = 'y';
							mnfitteroption.parentdaughterratio.doublebins.parameter(i).fittype = 'weighted';
						end		
					end
					
					if ismember(3,doublebinsecondbinfits(i))
						if ismember(2,parameternumber)
							mnfitteroption.taperrate.doublebins.fit = 'y';
							mnfitteroption.taperrate.doublebins.parameter(i).fittype = 'robust';
						end
						if ismember(3,parameternumber)
							mnfitteroption.piecebifprob.doublebins.fit = 'y';
							mnfitteroption.piecebifprob.doublebins.parameter(i).fittype = 'robust';
						end
						if ismember(4,parameternumber)
							mnfitteroption.piecetermprob.doublebins.fit = 'y';
							mnfitteroption.piecetermprob.doublebins.parameter(i).fittype = 'robust';
						end
						if ismember(5,parameternumber)
							mnfitteroption.rallratio.doublebins.fit = 'y';
							mnfitteroption.rallratio.doublebins.parameter(i).fittype = 'robust';
						end
						if ismember(6,parameternumber)
							mnfitteroption.daughterratio.doublebins.fit = 'y';
							mnfitteroption.daughterratio.doublebins.parameter(i).fittype = 'robust';
						end
						if ismember(7,parameternumber)
							mnfitteroption.parentdaughterratio.doublebins.fit = 'y';
							mnfitteroption.parentdaughterratio.doublebins.parameter(i).fittype = 'robust';
						end		
					end
					
					if ismember(4,doublebinsecondbinfits(i))
						if ismember(2,parameternumber)
							mnfitteroption.taperrate.doublebins.fit = 'y';
							mnfitteroption.taperrate.doublebins.parameter(i).fittype = 'robustweighted';
						end
						if ismember(3,parameternumber)
							mnfitteroption.piecebifprob.doublebins.fit = 'y';
							mnfitteroption.piecebifprob.doublebins.parameter(i).fittype = 'robustweighted';
						end
						if ismember(4,parameternumber)
							mnfitteroption.piecetermprob.doublebins.fit = 'y';
							mnfitteroption.piecetermprob.doublebins.parameter(i).fittype = 'robustweighted';
						end
						if ismember(5,parameternumber)
							mnfitteroption.rallratio.doublebins.fit = 'y';
							mnfitteroption.rallratio.doublebins.parameter(i).fittype = 'robustweighted';
						end
						if ismember(6,parameternumber)
							mnfitteroption.daughterratio.doublebins.fit = 'y';
							mnfitteroption.daughterratio.doublebins.parameter(i).fittype = 'robustweighted';
						end
						if ismember(7,parameternumber)
							mnfitteroption.parentdaughterratio.doublebins.fit = 'y';
							mnfitteroption.parentdaughterratio.doublebins.parameter(i).fittype = 'robustweighted';
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