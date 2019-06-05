% Input File for Motoneuron Generation
% ------------------------------------
% Distribution types are 'constant', 'uniform', 'normal', and 'pearson'.


% Number of cells

    input.numbercells.distribution = 'constant';

        input.numbercells.const = 4;
        input.numbercells.min   = NaN;
        input.numbercells.mean  = NaN;
        input.numbercells.max   = NaN;
        input.numbercells.sd    = NaN;
        input.numbercells.skew  = NaN;
        input.numbercells.kurt  = NaN;


% Location in Pool

    input.xposition.distribution = 'constant';
    input.yposition.distribution = 'constant';
    input.zposition.distribution = 'constant';

        input.xposition.const    = 0;
		input.yposition.const    = 0;
		input.zposition.const    = 0;

		
% Soma diameter

    input.somadiameter.distribution = 'normal';
	% 'constant', 'uniform', 'normal', 'pearson', or 'preset'

        input.somadiameter.const    = NaN;
        input.somadiameter.min      = NaN;
        input.somadiameter.mean     = 52.88;
        input.somadiameter.max      = NaN;
        input.somadiameter.sd       = 5.598;
        input.somadiameter.skew     = 0.3918;
        input.somadiameter.kurt     = 1.577;
		
		input.somadiameter.preset   = [60.0 47.7 49.2 54.6]; 

% Structures to generate
    input.axon.generate     = 'n';
    input.dendrite.generate = 'y';
    input.apical.generate   = 'n';
        
        

% Dendrite Inputs
% -------------------------------------------------------------------------------------------------------------------------------------------------
        
% Number of trunks

   input.dendrite.numbertrunks.distribution = 'normal';
   % 'constant', 'uniform', 'normal', 'pearson', or 'preset'

        input.dendrite.numbertrunks.const        = NaN;
        input.dendrite.numbertrunks.min          = NaN;
        input.dendrite.numbertrunks.mean         = 10.75;
        input.dendrite.numbertrunks.max          = NaN;
        input.dendrite.numbertrunks.sd           = 2.217;
        input.dendrite.numbertrunks.skew         = -0.2780;
        input.dendrite.numbertrunks.kurt         = 1.573;
		
		input.dendrite.numbertrunks.preset       = [10 13 12 8]; 

% Trunk diameters

    input.dendrite.trunkdiameter.distribution = 'normal';
	% 'constant', 'uniform', 'normal', 'pearson', or 'preset'

        input.dendrite.trunkdiameter.const    = NaN;
        input.dendrite.trunkdiameter.min      = NaN;
        input.dendrite.trunkdiameter.mean     = 7.279;
        input.dendrite.trunkdiameter.max      = NaN;
        input.dendrite.trunkdiameter.sd       = 2.084;
        input.dendrite.trunkdiameter.skew     = 0.04486;
        input.dendrite.trunkdiameter.kurt     = 3.323;
		
		input.dendrite.trunkdiameter.preset{1} = [6.24 6.24 8.06 8.58 6.76 6.24 5.72 8.32 8.06 9.36];
		input.dendrite.trunkdiameter.preset{2} = [7.68 8.74 4.5 10.6 3.97 12.19 9.01 9.01 6.09 7.15 5.83 9.27 9.8];
		input.dendrite.trunkdiameter.preset{3} = [6.62 10.86 5.03 7.95 7.42 8.21 5.83 7.68 1.85 4.39 6.36 5.3];
		input.dendrite.trunkdiameter.preset{4} = [8.02 11.23 7.75 7.22 7.75 5.67 5.08 5.35];
		

% Piece length

    input.dendrite.piecelength.distribution = 'constant';

        input.dendrite.piecelength.const    = 10;
        input.dendrite.piecelength.min      = NaN;
        input.dendrite.piecelength.mean     = NaN;
        input.dendrite.piecelength.max      = NaN;
        input.dendrite.piecelength.sd       = NaN;
        input.dendrite.piecelength.skew     = NaN;
        input.dendrite.piecelength.kurt     = NaN;


% Meander angle

     input.dendrite.meanderangle.distribution = 'normal';

        input.dendrite.meanderangle.const    = NaN;
        input.dendrite.meanderangle.min      = NaN;
        input.dendrite.meanderangle.mean     = 0;
        input.dendrite.meanderangle.max      = NaN;
        input.dendrite.meanderangle.sd       = 5;
        input.dendrite.meanderangle.skew     = NaN;
        input.dendrite.meanderangle.kurt     = NaN;


% Minimum dendritic diameter

    input.dendrite.mindiameter            = 0.26;
    input.dendrite.minbifurcationdiameter = 0.78;
    input.dendrite.resampleattempts       = 0;


% Branch Type Probability

    input.dendrite.probability.branch.mode = 'diameterpathlength'; 
    % Either 'pathlength', 'diameter', 'diameterpathlength', or 'diameterbranchorder'

	input.dendrite.probability.branch.mindiameter = NaN; 
	% Minimum value for bifurcation
	% Either NaN or numeric value
	
	input.dendrite.probability.branch.maxpathlength = NaN; 
	% Maximum value for bifurcation
	% Either NaN or numeric value
	
	input.dendrite.probability.branch.maxbranchorder = NaN; 
	% Maximum value for bifurcation
	% Either NaN or numeric value
	
    input.dendrite.probability.branch.type = 'loglog';
    % Either 'logit', 'probit', 'comploglog', or 'loglog'

    input.dendrite.probability.branch.parameter1 = 1.353e0; 
    % Non-multiplicative parameter in all cases
    input.dendrite.probability.branch.parameter2 = -1.373e0; 
    % Multiplicative parameter if mode is not doublebin
    % Diameter multiplicative parameter if mode is doublebin
    input.dendrite.probability.branch.parameter3 = 1.612e-3; 
    % Unused if mode is not doublebin
    % Second bin multiplicative parameter if mode is doublebin


% Bifurcation Taper Rate

    % Bifurcation Taper Rate dependency
	
		input.dendrite.taperrate.bifurcation.mode = 'independent';
        % Either 'independent' or 'dependent'

		% Bifurcation Taper Rate independent

			input.dendrite.taperrate.bifurcation.distribution = 'pearson';
			% Either 'constant', 'uniform', 'normal', 'pearson', or 'none'

				input.dendrite.taperrate.bifurcation.const        = NaN;
				input.dendrite.taperrate.bifurcation.min          = NaN;
				input.dendrite.taperrate.bifurcation.mean         = 4*5.4674e-4;
				input.dendrite.taperrate.bifurcation.max          = NaN;
				input.dendrite.taperrate.bifurcation.sd           = 3.617e-3;
				input.dendrite.taperrate.bifurcation.skew         = 2.115; 
				input.dendrite.taperrate.bifurcation.kurt         = 44.15;
		
		% Bifurcation Taper Rate dependent
		
			% Bifurcation Taper Rate Mean
			
				input.dendrite.taperrate.bifurcation.dependent.mean.type = 'singlebin';
				% Either 'independent', 'singlebin' or 'doublebin'
					
				% Single Bin
				
					input.dendrite.taperrate.bifurcation.dependent.mean.singlebin.dependent = 'diameter';       
					% Either 'diameter', 'pathlength' or 'radialdistance'
						
						input.dendrite.taperrate.bifurcation.dependent.mean.singlebin.fit = 'linear'; %uw 
						% Either 'linear', 'exponential', 'power', 'sigmoidal' or 'none'

							input.dendrite.taperrate.bifurcation.dependent.mean.singlebin.parameter(1) = 2.005e-4;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.dendrite.taperrate.bifurcation.dependent.mean.singlebin.parameter(2) = 1.549e-4;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.dendrite.taperrate.bifurcation.dependent.mean.singlebin.parameter(3) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal: halfmax
							input.dendrite.taperrate.bifurcation.dependent.mean.singlebin.parameter(4) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal:
							% steepness
							
			% Bifurcation Taper Rate Standard Deviation
			
				input.dendrite.taperrate.bifurcation.dependent.sd.type = 'singlebin';
				% Either 'independent', 'singlebin' or 'doublebin'
					
				% Single Bin
				
					input.dendrite.taperrate.bifurcation.dependent.sd.singlebin.dependent = 'diameter';
					% Either 'diameter', 'pathlength' or 'radialdistance'
						
						input.dendrite.taperrate.bifurcation.dependent.sd.singlebin.fit = 'linear'; %uw
						% Either 'linear', 'exponential', 'power', 'sigmoidal' or 'none'

							input.dendrite.taperrate.bifurcation.dependent.sd.singlebin.parameter(1) = 9.045e-4;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.dendrite.taperrate.bifurcation.dependent.sd.singlebin.parameter(2) = 4.567e-4;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.dendrite.taperrate.bifurcation.dependent.sd.singlebin.parameter(3) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal: halfmax
							input.dendrite.taperrate.bifurcation.dependent.sd.singlebin.parameter(4) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal:
							% steepness
							
			% Bifurcation Taper Rate Skewness
			
				input.dendrite.taperrate.bifurcation.dependent.skew.type = 'singlebin';
				% Either 'independent', 'singlebin' or 'doublebin'
					
				% Single Bin
				
					input.dendrite.taperrate.bifurcation.dependent.skew.singlebin.dependent = 'diameter';
					% Either 'diameter', 'pathlength' or 'radialdistance'
						
						input.dendrite.taperrate.bifurcation.dependent.skew.singlebin.fit = 'linear'; %uw
						% Either 'linear', 'exponential', 'power', 'sigmoidal' or 'none'

							input.dendrite.taperrate.bifurcation.dependent.skew.singlebin.parameter(1) = 4.062e-1;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.dendrite.taperrate.bifurcation.dependent.skew.singlebin.parameter(2) = -1.455e0;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.dendrite.taperrate.bifurcation.dependent.skew.singlebin.parameter(3) = NaN; 
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal: halfmax
							input.dendrite.taperrate.bifurcation.dependent.skew.singlebin.parameter(4) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal:
							% steepness

			% Bifurcation Taper Rate Kurtosis
			
				input.dendrite.taperrate.bifurcation.dependent.kurt.type = 'singlebin';
				% Either 'independent', 'singlebin' or 'doublebin'
					
				% Single Bin
				
					input.dendrite.taperrate.bifurcation.dependent.kurt.singlebin.dependent = 'diameter';
					% Either 'diameter', 'pathlength' or 'radialdistance'
						
						input.dendrite.taperrate.bifurcation.dependent.kurt.singlebin.fit = 'linear'; %uw
						% Either 'linear', 'exponential', 'power', 'sigmoidal' or 'none'

							input.dendrite.taperrate.bifurcation.dependent.kurt.singlebin.parameter(1) = -9.279e-1;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.dendrite.taperrate.bifurcation.dependent.kurt.singlebin.parameter(2) = 1.820e1;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.dendrite.taperrate.bifurcation.dependent.kurt.singlebin.parameter(3) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal: halfmax
							input.dendrite.taperrate.bifurcation.dependent.kurt.singlebin.parameter(4) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal:
							% steepness

							
% Termination Taper Rate

    % Termination Taper Rate dependency
	
		input.dendrite.taperrate.termination.mode = 'dependent';
        % Either 'independent' or 'dependent'

		% Termination Taper Rate independent

			input.dendrite.taperrate.termination.distribution = '';
			% Either 'constant', 'uniform', 'normal', 'pearson', or 'none'

				input.dendrite.taperrate.termination.const        = NaN;
				input.dendrite.taperrate.termination.min          = NaN;
				input.dendrite.taperrate.termination.mean         = NaN;
				input.dendrite.taperrate.termination.max          = NaN;
				input.dendrite.taperrate.termination.sd           = NaN;
				input.dendrite.taperrate.termination.skew         = NaN; 
				input.dendrite.taperrate.termination.kurt         = NaN; 
		
		% Termination Taper Rate dependent
		
			% Termination Taper Rate Mean
			
				input.dendrite.taperrate.termination.dependent.mean.type = 'singlebin';
				% Either 'independent', 'singlebin' or 'doublebin'
					
				% Single Bin
				
					input.dendrite.taperrate.termination.dependent.mean.singlebin.dependent = 'diameter';
					% Either 'diameter', 'pathlength' or 'radialdistance'
						
						input.dendrite.taperrate.termination.dependent.mean.singlebin.fit = 'exponential'; %offset weighted
						% Either 'linear', 'exponential', 'power', 'sigmoidal' or 'none'

							input.dendrite.taperrate.termination.dependent.mean.singlebin.parameter(1) = 2.844e-2; 
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.dendrite.taperrate.termination.dependent.mean.singlebin.parameter(2) = 5.399e-2;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.dendrite.taperrate.termination.dependent.mean.singlebin.parameter(3) = -2.927e-2;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal: halfmax
							input.dendrite.taperrate.termination.dependent.mean.singlebin.parameter(4) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal:
							% steepness
							
			% Termination Taper Rate Standard Deviation
			
				input.dendrite.taperrate.termination.dependent.sd.type = 'singlebin';
				% Either 'independent', 'singlebin' or 'doublebin'
					
				% Single Bin
				
					input.dendrite.taperrate.termination.dependent.sd.singlebin.dependent = 'diameter';
					% Either 'diameter', 'pathlength' or 'radialdistance'
						
						input.dendrite.taperrate.termination.dependent.sd.singlebin.fit = 'linear'; %unweighted
						% Either 'linear', 'exponential', 'power', 'sigmoidal' or 'none'

							input.dendrite.taperrate.termination.dependent.sd.singlebin.parameter(1) = 2.592e-4;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.dendrite.taperrate.termination.dependent.sd.singlebin.parameter(2) = 1.178e-3;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.dendrite.taperrate.termination.dependent.sd.singlebin.parameter(3) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal: halfmax
							input.dendrite.taperrate.termination.dependent.sd.singlebin.parameter(4) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal:
							% steepness

			% Termination Taper Rate Skewness
			
				input.dendrite.taperrate.termination.dependent.skew.type = 'singlebin';
				% Either 'independent', 'singlebin' or 'doublebin'
					
				% Single Bin
				
					input.dendrite.taperrate.termination.dependent.skew.singlebin.dependent = 'diameter';
					% Either 'diameter', 'pathlength' or 'radialdistance'
						
						input.dendrite.taperrate.termination.dependent.skew.singlebin.fit = 'linear'; 
						% Either 'linear', 'exponential', 'power', 'sigmoidal' or 'none'

							input.dendrite.taperrate.termination.dependent.skew.singlebin.parameter(1) = 0;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.dendrite.taperrate.termination.dependent.skew.singlebin.parameter(2) = 0;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.dendrite.taperrate.termination.dependent.skew.singlebin.parameter(3) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal: halfmax
							input.dendrite.taperrate.termination.dependent.skew.singlebin.parameter(4) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal:
							% steepness

			% Termination Taper Rate Kurtosis
			
				input.dendrite.taperrate.termination.dependent.kurt.type = 'singlebin';
				% Either 'independent', 'singlebin' or 'doublebin'
					
				% Single Bin
				
					input.dendrite.taperrate.termination.dependent.kurt.singlebin.dependent = 'diameter';
					% Either 'diameter', 'pathlength' or 'radialdistance'
						
						input.dendrite.taperrate.termination.dependent.kurt.singlebin.fit = 'linear'; 
						% Either 'linear', 'exponential', 'power', 'sigmoidal' or 'none'

							input.dendrite.taperrate.termination.dependent.kurt.singlebin.parameter(1) = 0;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.dendrite.taperrate.termination.dependent.kurt.singlebin.parameter(2) = 3;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.dendrite.taperrate.termination.dependent.kurt.singlebin.parameter(3) = NaN; 
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal: halfmax
							input.dendrite.taperrate.termination.dependent.kurt.singlebin.parameter(4) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal:
							% steepness
							
							
% Piece Bifurcation Probability

    % Piece Bifurcation Probability dependency

        input.dendrite.piecebifprob.mode = 'test';
        % Either 'independent' or 'dependent'
        
            input.dendrite.piecebifprob.test.constant   = 4.709;
            input.dendrite.piecebifprob.test.diameter   = 1.837;
            input.dendrite.piecebifprob.test.pathlength = NaN;
    
        input.dendrite.piecebifprob.level = 'branch';
        % Either 'piece' or 'branch'
        
        input.dendrite.piecebifprob.by = 'volume';
        % Either 'length', 'surfacearea', or 'volume'
    
        % Piece Bifurcation Probability independent

            %input.dendrite.piecebifprob.by = '';
            % Either 'length', 'surface area' or 'volume'	
        
            input.dendrite.piecebifprob.distribution = '';
			% Either 'constant', 'uniform', 'normal', 'pearson', or 'none'
            % Or 'exponential'

				input.dendrite.piecebifprob.const        = NaN;
				input.dendrite.piecebifprob.min          = NaN;
				input.dendrite.piecebifprob.mean         = NaN;
				input.dendrite.piecebifprob.max          = NaN;
				input.dendrite.piecebifprob.sd           = NaN;
				input.dendrite.piecebifprob.skew         = NaN;
				input.dendrite.piecebifprob.kurt         = NaN;
               
                input.dendrite.piecebifprob.mu           = NaN;
                input.dendrite.piecebifprob.k            = NaN;
                input.dendrite.piecebifprob.theta        = NaN;
		
		% Piece Bifurcation Probability dependent
		
			% Piece Bifurcation Probability
				
				input.dendrite.piecebifprob.dependent.type = 'singlebin';
				% Either 'singlebin' or 'doublebin'
					
				% Single Bin
				
					input.dendrite.piecebifprob.dependent.singlebin.dependent = 'branchproximalpathlength';
					% Either 'diameter', 'pathlength', 'radialdistance' or 'branchlength'
						
						input.dendrite.piecebifprob.dependent.singlebin.fit = 'exponential';
						% Either 'linear', 'exponential', 'power', 'sigmoidal' or 'none'

							input.dendrite.piecebifprob.dependent.singlebin.parameter(1) = 3.813e3;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.dendrite.piecebifprob.dependent.singlebin.parameter(2) = -4.042e-3;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.dendrite.piecebifprob.dependent.singlebin.parameter(3) = 2.599e2;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal: halfmax
							input.dendrite.piecebifprob.dependent.singlebin.parameter(4) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal:
							% steepness
							
				% Double Bin
				
					input.dendrite.piecebifprob.dependent.doublebin.firstbin = 'diameter';
					input.dendrite.piecebifprob.dependent.doublebin.secondbin = 'pathlength';
					% Either 'diameter', 'pathlength', 'branchlength' or 'branchorder'
					
					input.dendrite.piecebifprob.dependent.doublebin.firstfit = 'power'; %offset unweighted -- robust weighted
					% Either 'linear', 'exponential', 'power' or 'sigmoid'
					
					   input.dendrite.piecebifprob.dependent.doublebin.parameter(1).fit = 'exponential'; %robust
						% Either 'linear, 'exponential', 'power', 'sigmoidal' or 'none'

							input.dendrite.piecebifprob.dependent.doublebin.parameter(1).parameter(1) = 3.044e-6;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.dendrite.piecebifprob.dependent.doublebin.parameter(1).parameter(2) = 3.129e-3;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.dendrite.piecebifprob.dependent.doublebin.parameter(1).parameter(3) = NaN;
							% Linear: N/A | Exponential: a2 | Power: N/A | Sigmoidal: halfmax
							input.dendrite.piecebifprob.dependent.doublebin.parameter(1).parameter(4) = NaN;
							% Linear: N/A | Exponential: b2 | Power: N/A | Sigmoidal:
							% steepness

						input.dendrite.piecebifprob.dependent.doublebin.parameter(2).fit = 'exponential'; %robust
						% Either 'linear, 'exponential', 'power', 'sigmoidal' or 'none'

							input.dendrite.piecebifprob.dependent.doublebin.parameter(2).parameter(1) = 3.287e0;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.dendrite.piecebifprob.dependent.doublebin.parameter(2).parameter(2) = 3.424e-4;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.dendrite.piecebifprob.dependent.doublebin.parameter(2).parameter(3) = NaN;
							% Linear: N/A | Exponential: a2 | Power: N/A | Sigmoidal: halfmax
							input.dendrite.piecebifprob.dependent.doublebin.parameter(2).parameter(4) = NaN;
							% Linear: N/A | Exponential: b2 | Power: N/A | Sigmoidal:
							% steepness

						input.dendrite.piecebifprob.dependent.doublebin.parameter(3).fit = 'exponential'; %robust
						% Either 'linear, 'exponential', 'power', 'sigmoidal' or 'none'

							input.dendrite.piecebifprob.dependent.doublebin.parameter(3).parameter(1) = 2.023e-3;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.dendrite.piecebifprob.dependent.doublebin.parameter(3).parameter(2) = 1.573e-3;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.dendrite.piecebifprob.dependent.doublebin.parameter(3).parameter(3) = NaN;
							% Linear: N/A | Exponential: a2 | Power: N/A | Sigmoidal: halfmax
							input.dendrite.piecebifprob.dependent.doublebin.parameter(3).parameter(4) = NaN;
							% Linear: N/A | Exponential: b2 | Power: N/A | Sigmoidal:
							% steepness

						input.dendrite.piecebifprob.dependent.doublebin.parameter(4).fit = '';
						% Either 'linear, 'exponential', 'power', 'sigmoidal' or 'none'
							input.dendrite.piecebifprob.dependent.doublebin.parameter(4).parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.dendrite.piecebifprob.dependent.doublebin.parameter(4).parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.dendrite.piecebifprob.dependent.doublebin.parameter(4).parameter(3) = NaN;
							% Linear: N/A | Exponential: a2 | Power: N/A | Sigmoidal: halfmax
							input.dendrite.piecebifprob.dependent.doublebin.parameter(4).parameter(4) = NaN;
							% Linear: N/A | Exponential: b2 | Power: N/A | Sigmoidal:
							% steepness
							
							
% Piece Termination Probability

    % Piece Termination Probability dependency

        input.dendrite.piecetermprob.mode = 'dependent';
        % Either 'independent' or 'dependent'
        
        input.dendrite.piecetermprob.level = 'piece';
        % Either 'piece' or 'branch'

		% Piece Termination Probability independent
        
            input.dendrite.piecetermprob.by = 'length';
            % Either 'length', 'surface area' or 'volume'	

			input.dendrite.piecetermprob.distribution = '';
			% Either 'constant', 'uniform', 'normal', 'pearson', or 'none'

				input.dendrite.piecetermprob.const        = NaN;
				input.dendrite.piecetermprob.min          = NaN;
				input.dendrite.piecetermprob.mean         = NaN;
				input.dendrite.piecetermprob.max          = NaN;
				input.dendrite.piecetermprob.sd           = NaN;
				input.dendrite.piecetermprob.skew         = NaN;
				input.dendrite.piecetermprob.kurt         = NaN;
		
		% Piece Termination Probability dependent
		
			% Piece Termination Probability
			
				input.dendrite.piecetermprob.dependent.mean.by = 'length';
				% Either 'length', 'surface area' or 'volume'
				
				input.dendrite.piecetermprob.dependent.mean.type = 'doublebin';
				% Either 'singlebin' or 'doublebin'
                
                input.dendrite.piecetermprob.dependent.type = 'doublebin';
				% Either 'singlebin' or 'doublebin'
					
				% Single Bin
				
					input.dendrite.piecetermprob.dependent.singlebin.dependent = '';
					% Either 'diameter', 'pathlength' or 'radialdistance'
						
						input.dendrite.piecetermprob.dependent.singlebin.fit = ''; 
						% Either 'linear', 'exponential', 'power', 'sigmoidal' or 'none'

							input.dendrite.piecetermprob.dependent.singlebin.parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.dendrite.piecetermprob.dependent.singlebin.parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.dendrite.piecetermprob.dependent.singlebin.parameter(3) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal: halfmax
							input.dendrite.piecetermprob.dependent.singlebin.parameter(4) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal:
							% steepness
							
				% Double Bin
				
					input.dendrite.piecetermprob.dependent.doublebin.firstbin = 'diameter';
					input.dendrite.piecetermprob.dependent.doublebin.secondbin = 'pathlength';
					% Either 'diameter' or 'pathlength'
					
					input.dendrite.piecetermprob.dependent.doublebin.firstfit = 'power'; %robust -- initial
					% Either 'linear', 'exponential', 'power' or 'sigmoid'
					
					   input.dendrite.piecetermprob.dependent.doublebin.parameter(1).fit = 'exponential';
						% Either 'linear, 'exponential', 'power', 'sigmoidal' or 'none'

							input.dendrite.piecetermprob.dependent.doublebin.parameter(1).parameter(1) = 2.319e-4;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.dendrite.piecetermprob.dependent.doublebin.parameter(1).parameter(2) = 2.051e-3;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.dendrite.piecetermprob.dependent.doublebin.parameter(1).parameter(3) = NaN;
							% Linear: N/A | Exponential: a2 | Power: N/A | Sigmoidal: halfmax
							input.dendrite.piecetermprob.dependent.doublebin.parameter(1).parameter(4) = NaN;
							% Linear: N/A | Exponential: b2 | Power: N/A | Sigmoidal:
							% steepness

						input.dendrite.piecetermprob.dependent.doublebin.parameter(2).fit = 'exponential';
						% Either 'linear, 'exponential', 'power', 'sigmoidal' or 'none'

							input.dendrite.piecetermprob.dependent.doublebin.parameter(2).parameter(1) = -7.286e0;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.dendrite.piecetermprob.dependent.doublebin.parameter(2).parameter(2) = -1.690e-3;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.dendrite.piecetermprob.dependent.doublebin.parameter(2).parameter(3) = NaN;
							% Linear: N/A | Exponential: a2 | Power: N/A | Sigmoidal: halfmax
							input.dendrite.piecetermprob.dependent.doublebin.parameter(2).parameter(4) = NaN;
							% Linear: N/A | Exponential: b2 | Power: N/A | Sigmoidal:
							% steepness

						input.dendrite.piecetermprob.dependent.doublebin.parameter(3).fit = '';
						% Either 'linear, 'exponential', 'power', 'sigmoidal' or 'none'

							input.dendrite.piecetermprob.dependent.doublebin.parameter(3).parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.dendrite.piecetermprob.dependent.doublebin.parameter(3).parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.dendrite.piecetermprob.dependent.doublebin.parameter(3).parameter(3) = NaN;
							% Linear: N/A | Exponential: a2 | Power: N/A | Sigmoidal: halfmax
							input.dendrite.piecetermprob.dependent.doublebin.parameter(3).parameter(4) = NaN;
							% Linear: N/A | Exponential: b2 | Power: N/A | Sigmoidal:
							% steepness

						input.dendrite.piecetermprob.dependent.doublebin.parameter(4).fit = '';
						% Either 'linear, 'exponential', 'power', 'sigmoidal' or 'none'
							input.dendrite.piecetermprob.dependent.doublebin.parameter(4).parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.dendrite.piecetermprob.dependent.doublebin.parameter(4).parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.dendrite.piecetermprob.dependent.doublebin.parameter(4).parameter(3) = NaN;
							% Linear: N/A | Exponential: a2 | Power: N/A | Sigmoidal: halfmax
							input.dendrite.piecetermprob.dependent.doublebin.parameter(4).parameter(4) = NaN;
							% Linear: N/A | Exponential: b2 | Power: N/A | Sigmoidal:
							% steepness
							
							
% Daughter direction

    input.dendrite.daughterangle.distribution = 'uniform';

        input.dendrite.daughterangle.const    = NaN;
        input.dendrite.daughterangle.min      = -45;
        input.dendrite.daughterangle.mean     = NaN;
        input.dendrite.daughterangle.max      = 45;
        input.dendrite.daughterangle.sd       = NaN;
        input.dendrite.daughterangle.skew     = NaN;
        input.dendrite.daughterangle.kurt     = NaN;

        input.dendrite.daughterangle.minangle = 15;
		
		
% Rall Ratio

	input.dendrite.rallratio.rallexponent = 1.5;

    % Rall Ratio dependency

        input.dendrite.rallratio.mode = 'independent';
        % Either 'independent' or 'dependent'

		% Rall Ratio independent

			input.dendrite.rallratio.distribution = 'lognormal';
			% Either 'constant', 'uniform', 'normal', 'pearson', 'lognormal' or 'none'

				input.dendrite.rallratio.const        = NaN;
				input.dendrite.rallratio.min          = NaN;
				input.dendrite.rallratio.mean         = 0.09260;
				input.dendrite.rallratio.max          = NaN; 
				input.dendrite.rallratio.sd           = 0.2875; 
				input.dendrite.rallratio.skew         = NaN; 
				input.dendrite.rallratio.kurt         = NaN;  
		
		% Rall Ratio dependent
		
			% Rall Ratio Mean
			
				input.dendrite.rallratio.dependent.mean.type = 'singlebin';
				% Either 'independent', 'singlebin' or 'doublebin'
					
				% Single Bin
				
					input.dendrite.rallratio.dependent.mean.singlebin.dependent = 'diameter';
					% Either 'diameter', 'pathlength' or 'radialdistance'
						
						input.dendrite.rallratio.dependent.mean.singlebin.fit = 'exponential'; %piecewsie offset unweighted
						% Either 'linear', 'exponential', 'power', 'sigmoidal' or 'none'

							input.dendrite.rallratio.dependent.mean.singlebin.parameter(1) = 1.723; 
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.dendrite.rallratio.dependent.mean.singlebin.parameter(2) = -1.702; 
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.dendrite.rallratio.dependent.mean.singlebin.parameter(3) = 1.096; 
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal: halfmax
							input.dendrite.rallratio.dependent.mean.singlebin.parameter(4) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal:
							% steepness

			% Rall Ratio Standard Deviation
			
				input.dendrite.rallratio.dependent.sd.type = 'singlebin';
				% Either 'independent', 'singlebin' or 'doublebin'
					
				% Single Bin
				
					input.dendrite.rallratio.dependent.sd.singlebin.dependent = 'diameter';
					% Either 'diameter', 'pathlength' or 'radialdistance'
						
						input.dendrite.rallratio.dependent.sd.singlebin.fit = 'exponential'; %offset unweighted
						% Either 'linear', 'exponential', 'power', 'sigmoidal' or 'none'

							input.dendrite.rallratio.dependent.sd.singlebin.parameter(1) = 2.152e0;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.dendrite.rallratio.dependent.sd.singlebin.parameter(2) = -1.502e0;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.dendrite.rallratio.dependent.sd.singlebin.parameter(3) = 2.665e-1;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal: halfmax
							input.dendrite.rallratio.dependent.sd.singlebin.parameter(4) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal:
							% steepness

			% Rall Ratio Skewness
			
				input.dendrite.rallratio.dependent.skew.type = 'singlebin';
				% Either 'independent', 'singlebin' or 'doublebin'
					
				% Single Bin
				
					input.dendrite.rallratio.dependent.skew.singlebin.dependent = 'diameter';
					% Either 'diameter', 'pathlength' or 'radialdistance'
						
						input.dendrite.rallratio.dependent.skew.singlebin.fit = 'linear';
						% Either 'linear', 'exponential', 'power', 'sigmoidal' or 'none'

							input.dendrite.rallratio.dependent.skew.singlebin.parameter(1) = 0;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.dendrite.rallratio.dependent.skew.singlebin.parameter(2) = 0;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.dendrite.rallratio.dependent.skew.singlebin.parameter(3) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal: halfmax
							input.dendrite.rallratio.dependent.skew.singlebin.parameter(4) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal:
							% steepness

			% Rall Ratio Kurtosis
			
				input.dendrite.rallratio.dependent.kurt.type = 'singlebin';
				% Either 'independent', 'singlebin' or 'doublebin'
					
				% Single Bin
				
					input.dendrite.rallratio.dependent.kurt.singlebin.dependent = 'diameter';
					% Either 'diameter', 'pathlength' or 'radialdistance'
						
						input.dendrite.rallratio.dependent.kurt.singlebin.fit = 'linear';
						% Either 'linear', 'exponential', 'power', 'sigmoidal' or 'none'

							input.dendrite.rallratio.dependent.kurt.singlebin.parameter(1) = 0;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.dendrite.rallratio.dependent.kurt.singlebin.parameter(2) = 3;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.dendrite.rallratio.dependent.kurt.singlebin.parameter(3) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal: halfmax
							input.dendrite.rallratio.dependent.kurt.singlebin.parameter(4) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal:
							% steepness


% Daughter Ratio

    % Daughter Ratio dependency

        input.dendrite.daughterratio.mode = 'independent';
        % Either 'independent' or 'dependent'

		% Daughter Ratio independent

			input.dendrite.daughterratio.distribution = 'gamma';
			% Either 'constant', 'uniform', 'normal', 'pearson', 'gamma' or 'none'
			% The gamma distribution is for 'excess' daughter ratio (ratio - 1)

				input.dendrite.daughterratio.const        = NaN;
				input.dendrite.daughterratio.min          = 1.0;
				input.dendrite.daughterratio.mean         = NaN;
				input.dendrite.daughterratio.max          = NaN;
				input.dendrite.daughterratio.sd           = NaN;
				input.dendrite.daughterratio.skew         = NaN;
				input.dendrite.daughterratio.kurt         = NaN;
				
				input.dendrite.daughterratio.gamma.a      = 0.7035;
				input.dendrite.daughterratio.gamma.b      = 1.1628;
		
		% Daughter Ratio dependent
		
			% Daughter Ratio Mean
			
				input.dendrite.daughterratio.dependent.mean.type = '';
				% Either 'singlebin' or 'doublebin'
					
				% Single Bin
				
					input.dendrite.daughterratio.dependent.mean.singlebin.dependent = '';
					% Either 'diameter', 'pathlength' or 'radialdistance'
						
						input.dendrite.daughterratio.dependent.mean.singlebin.fit = '';
						% Either 'linear', 'exponential', 'power', 'sigmoidal' or 'none'

							input.dendrite.daughterratio.dependent.mean.singlebin.parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.dendrite.daughterratio.dependent.mean.singlebin.parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.dendrite.daughterratio.dependent.mean.singlebin.parameter(3) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal: halfmax
							input.dendrite.daughterratio.dependent.mean.singlebin.parameter(4) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal:
							% steepness
							
			% Daughter Ratio Standard Deviation
			
				input.dendrite.daughterratio.dependent.sd.type = '';
				% Either 'singlebin' or 'doublebin'
					
				% Single Bin
				
					input.dendrite.daughterratio.dependent.sd.singlebin.dependent = '';
					% Either 'diameter', 'pathlength' or 'radialdistance'
						
						input.dendrite.daughterratio.dependent.sd.singlebin.fit = '';
						% Either 'linear', 'exponential', 'power', 'sigmoidal' or 'none'

							input.dendrite.daughterratio.dependent.sd.singlebin.parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.dendrite.daughterratio.dependent.sd.singlebin.parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.dendrite.daughterratio.dependent.sd.singlebin.parameter(3) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal: halfmax
							input.dendrite.daughterratio.dependent.sd.singlebin.parameter(4) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal:
							% steepness

			% Daughter Ratio Skewness
			
				input.dendrite.daughterratio.dependent.skew.type = '';
				% Either 'singlebin' or 'doublebin'
					
				% Single Bin
				
					input.dendrite.daughterratio.dependent.skew.singlebin.dependent = '';
					% Either 'diameter', 'pathlength' or 'radialdistance'
						
						input.dendrite.daughterratio.dependent.skew.singlebin.fit = '';
						% Either 'linear', 'exponential', 'power', 'sigmoidal' or 'none'

							input.dendrite.daughterratio.dependent.skew.singlebin.parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.dendrite.daughterratio.dependent.skew.singlebin.parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.dendrite.daughterratio.dependent.skew.singlebin.parameter(3) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal: halfmax
							input.dendrite.daughterratio.dependent.skew.singlebin.parameter(4) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal:
							% steepness

			% Daughter Ratio Kurtosis
			
				input.dendrite.daughterratio.dependent.kurt.type = '';
				% Either 'singlebin' or 'doublebin'
					
				% Single Bin
				
					input.dendrite.daughterratio.dependent.kurt.singlebin.dependent = '';
					% Either 'diameter', 'pathlength' or 'radialdistance'
						
						input.dendrite.daughterratio.dependent.kurt.singlebin.fit = '';
						% Either 'linear', 'exponential', 'power', 'sigmoidal' or 'none'

							input.dendrite.daughterratio.dependent.kurt.singlebin.parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.dendrite.daughterratio.dependent.kurt.singlebin.parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.dendrite.daughterratio.dependent.kurt.singlebin.parameter(3) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal: halfmax
							input.dendrite.daughterratio.dependent.kurt.singlebin.parameter(4) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal:
							% steepness
                            
                            
