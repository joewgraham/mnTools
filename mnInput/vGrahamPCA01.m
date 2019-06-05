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
        
        
% Axon Inputs
% -------------------------------------------------------------------------------------------------------------------------------------------------
        
% Number of trunks

   input.axon.numbertrunks.distribution = '';
   % 'constant', 'uniform', 'normal', 'pearson', or 'preset'

        input.axon.numbertrunks.const        = NaN;
        input.axon.numbertrunks.min          = NaN;
        input.axon.numbertrunks.mean         = NaN;
        input.axon.numbertrunks.max          = NaN;
        input.axon.numbertrunks.sd           = NaN;
        input.axon.numbertrunks.skew         = NaN;
        input.axon.numbertrunks.kurt         = NaN;
		
		input.axon.numbertrunks.preset       = []; 

% Trunk diameters

    input.axon.trunkdiameter.distribution = '';
	% 'constant', 'uniform', 'normal', 'pearson', or 'preset'

        input.axon.trunkdiameter.const    = NaN;
        input.axon.trunkdiameter.min      = NaN;
        input.axon.trunkdiameter.mean     = NaN;
        input.axon.trunkdiameter.max      = NaN;
        input.axon.trunkdiameter.sd       = NaN;
        input.axon.trunkdiameter.skew     = NaN;
        input.axon.trunkdiameter.kurt     = NaN;
		
		input.axon.trunkdiameter.preset{1} = [];
		input.axon.trunkdiameter.preset{2} = [];
		input.axon.trunkdiameter.preset{3} = [];
		input.axon.trunkdiameter.preset{4} = [];
		

% Piece length

    input.axon.piecelength.distribution = '';

        input.axon.piecelength.const    = NaN;
        input.axon.piecelength.min      = NaN;
        input.axon.piecelength.mean     = NaN;
        input.axon.piecelength.max      = NaN;
        input.axon.piecelength.sd       = NaN;
        input.axon.piecelength.skew     = NaN;
        input.axon.piecelength.kurt     = NaN;


% Meander angle

     input.axon.meanderangle.distribution = '';

        input.axon.meanderangle.const    = NaN;
        input.axon.meanderangle.min      = NaN;
        input.axon.meanderangle.mean     = NaN;
        input.axon.meanderangle.max      = NaN;
        input.axon.meanderangle.sd       = NaN;
        input.axon.meanderangle.skew     = NaN;
        input.axon.meanderangle.kurt     = NaN;


% Minimum dendritic diameter

    input.axon.mindiameter            = NaN;
    input.axon.minbifurcationdiameter = NaN;
    input.axon.resampleattempts       = 0;


% Branch Type Probability

    input.axon.probability.branch.mode = ''; 
    % Either 'pathlength', 'diameter', 'diameterpathlength', or 'diameterbranchorder'

	input.axon.probability.branch.mindiameter = NaN; 
	% Minimum value for bifurcation
	% Either NaN or numeric value
	
	input.axon.probability.branch.maxpathlength = NaN; 
	% Maximum value for bifurcation
	% Either NaN or numeric value
	
	input.axon.probability.branch.maxbranchorder = NaN; 
	% Maximum value for bifurcation
	% Either NaN or numeric value
	
    input.axon.probability.branch.type = '';
    % Either 'logit', 'probit', 'comploglog', or 'loglog'

    input.axon.probability.branch.parameter1 = NaN;
    % Non-multiplicative parameter in all cases
    input.axon.probability.branch.parameter2 = NaN;
    % Multiplicative parameter if mode is not doublebin
    % Diameter multiplicative parameter if mode is doublebin
    input.axon.probability.branch.parameter3 = NaN;
    % Unused if mode is not doublebin
    % Second bin multiplicative parameter if mode is doublebin


% Bifurcation Taper Rate

    % Bifurcation Taper Rate dependency
	
		input.axon.taperrate.bifurcation.mode = '';
        % Either 'independent' or 'dependent'

		% Bifurcation Taper Rate independent

			input.axon.taperrate.bifurcation.distribution = '';
			% Either 'constant', 'uniform', 'normal', 'pearson', or 'none'

				input.axon.taperrate.bifurcation.const        = NaN;
				input.axon.taperrate.bifurcation.min          = NaN; 
				input.axon.taperrate.bifurcation.mean         = NaN;
				input.axon.taperrate.bifurcation.max          = NaN; 
				input.axon.taperrate.bifurcation.sd           = NaN;
				input.axon.taperrate.bifurcation.skew         = NaN; 
				input.axon.taperrate.bifurcation.kurt         = NaN;
		
		% Bifurcation Taper Rate dependent
		
			% Bifurcation Taper Rate Mean
			
				input.axon.taperrate.bifurcation.dependent.mean.type = '';
				% Either 'independent', 'singlebin' or 'doublebin'
					
				% Single Bin
				
					input.axon.taperrate.bifurcation.dependent.mean.singlebin.dependent = '';       
					% Either 'diameter', 'pathlength' or 'radialdistance'
						
						input.axon.taperrate.bifurcation.dependent.mean.singlebin.fit = '';
						% Either 'linear', 'exponential', 'power', 'sigmoidal' or 'none'

							input.axon.taperrate.bifurcation.dependent.mean.singlebin.parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.axon.taperrate.bifurcation.dependent.mean.singlebin.parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.axon.taperrate.bifurcation.dependent.mean.singlebin.parameter(3) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal: halfmax
							input.axon.taperrate.bifurcation.dependent.mean.singlebin.parameter(4) = NaN; 
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal:
							% steepness
							
			% Bifurcation Taper Rate Standard Deviation
			
				input.axon.taperrate.bifurcation.dependent.sd.type = '';
				% Either 'independent', 'singlebin' or 'doublebin'
					
				% Single Bin
				
					input.axon.taperrate.bifurcation.dependent.sd.singlebin.dependent = '';
					% Either 'diameter', 'pathlength' or 'radialdistance'
						
						input.axon.taperrate.bifurcation.dependent.sd.singlebin.fit = ''; 
						% Either 'linear', 'exponential', 'power', 'sigmoidal' or 'none'

							input.axon.taperrate.bifurcation.dependent.sd.singlebin.parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.axon.taperrate.bifurcation.dependent.sd.singlebin.parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.axon.taperrate.bifurcation.dependent.sd.singlebin.parameter(3) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal: halfmax
							input.axon.taperrate.bifurcation.dependent.sd.singlebin.parameter(4) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal:
							% steepness
							
			% Bifurcation Taper Rate Skewness
			
				input.axon.taperrate.bifurcation.dependent.skew.type = '';
				% Either 'independent', 'singlebin' or 'doublebin'
					
				% Single Bin
				
					input.axon.taperrate.bifurcation.dependent.skew.singlebin.dependent = '';
					% Either 'diameter', 'pathlength' or 'radialdistance'
						
						input.axon.taperrate.bifurcation.dependent.skew.singlebin.fit = '';
						% Either 'linear', 'exponential', 'power', 'sigmoidal' or 'none'

							input.axon.taperrate.bifurcation.dependent.skew.singlebin.parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.axon.taperrate.bifurcation.dependent.skew.singlebin.parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.axon.taperrate.bifurcation.dependent.skew.singlebin.parameter(3) = NaN; 
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal: halfmax
							input.axon.taperrate.bifurcation.dependent.skew.singlebin.parameter(4) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal:
							% steepness

			% Bifurcation Taper Rate Kurtosis
			
				input.axon.taperrate.bifurcation.dependent.kurt.type = '';
				% Either 'independent', 'singlebin' or 'doublebin'
					
				% Single Bin
				
					input.axon.taperrate.bifurcation.dependent.kurt.singlebin.dependent = '';
					% Either 'diameter', 'pathlength' or 'radialdistance'
						
						input.axon.taperrate.bifurcation.dependent.kurt.singlebin.fit = ''; 
						% Either 'linear', 'exponential', 'power', 'sigmoidal' or 'none'

							input.axon.taperrate.bifurcation.dependent.kurt.singlebin.parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.axon.taperrate.bifurcation.dependent.kurt.singlebin.parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.axon.taperrate.bifurcation.dependent.kurt.singlebin.parameter(3) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal: halfmax
							input.axon.taperrate.bifurcation.dependent.kurt.singlebin.parameter(4) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal:
							% steepness

							
% Termination Taper Rate

    % Termination Taper Rate dependency
	
		input.axon.taperrate.termination.mode = '';
        % Either 'independent' or 'dependent'

		% Termination Taper Rate independent

			input.axon.taperrate.termination.distribution = '';
			% Either 'constant', 'uniform', 'normal', 'pearson', or 'none'

				input.axon.taperrate.termination.const        = NaN;
				input.axon.taperrate.termination.min          = NaN; 
				input.axon.taperrate.termination.mean         = NaN;
				input.axon.taperrate.termination.max          = NaN; 
				input.axon.taperrate.termination.sd           = NaN;
				input.axon.taperrate.termination.skew         = NaN; 
				input.axon.taperrate.termination.kurt         = NaN; 
		
		% Termination Taper Rate dependent
		
			% Termination Taper Rate Mean
			
				input.axon.taperrate.termination.dependent.mean.type = '';
				% Either 'independent', 'singlebin' or 'doublebin'
					
				% Single Bin
				
					input.axon.taperrate.termination.dependent.mean.singlebin.dependent = '';
					% Either 'diameter', 'pathlength' or 'radialdistance'
						
						input.axon.taperrate.termination.dependent.mean.singlebin.fit = '';
						% Either 'linear', 'exponential', 'power', 'sigmoidal' or 'none'

							input.axon.taperrate.termination.dependent.mean.singlebin.parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.axon.taperrate.termination.dependent.mean.singlebin.parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.axon.taperrate.termination.dependent.mean.singlebin.parameter(3) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal: halfmax
							input.axon.taperrate.termination.dependent.mean.singlebin.parameter(4) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal:
							% steepness
							
			% Termination Taper Rate Standard Deviation
			
				input.axon.taperrate.termination.dependent.sd.type = '';
				% Either 'independent', 'singlebin' or 'doublebin'
					
				% Single Bin
				
					input.axon.taperrate.termination.dependent.sd.singlebin.dependent = '';
					% Either 'diameter', 'pathlength' or 'radialdistance'
						
						input.axon.taperrate.termination.dependent.sd.singlebin.fit = '';
						% Either 'linear', 'exponential', 'power', 'sigmoidal' or 'none'

							input.axon.taperrate.termination.dependent.sd.singlebin.parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.axon.taperrate.termination.dependent.sd.singlebin.parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.axon.taperrate.termination.dependent.sd.singlebin.parameter(3) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal: halfmax
							input.axon.taperrate.termination.dependent.sd.singlebin.parameter(4) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal:
							% steepness

			% Termination Taper Rate Skewness
			
				input.axon.taperrate.termination.dependent.skew.type = '';
				% Either 'independent', 'singlebin' or 'doublebin'
					
				% Single Bin
				
					input.axon.taperrate.termination.dependent.skew.singlebin.dependent = '';
					% Either 'diameter', 'pathlength' or 'radialdistance'
						
						input.axon.taperrate.termination.dependent.skew.singlebin.fit = ''; 
						% Either 'linear', 'exponential', 'power', 'sigmoidal' or 'none'

							input.axon.taperrate.termination.dependent.skew.singlebin.parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.axon.taperrate.termination.dependent.skew.singlebin.parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.axon.taperrate.termination.dependent.skew.singlebin.parameter(3) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal: halfmax
							input.axon.taperrate.termination.dependent.skew.singlebin.parameter(4) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal:
							% steepness

			% Termination Taper Rate Kurtosis
			
				input.axon.taperrate.termination.dependent.kurt.type = '';
				% Either 'independent', 'singlebin' or 'doublebin'
					
				% Single Bin
				
					input.axon.taperrate.termination.dependent.kurt.singlebin.dependent = '';
					% Either 'diameter', 'pathlength' or 'radialdistance'
						
						input.axon.taperrate.termination.dependent.kurt.singlebin.fit = ''; 
						% Either 'linear', 'exponential', 'power', 'sigmoidal' or 'none'

							input.axon.taperrate.termination.dependent.kurt.singlebin.parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.axon.taperrate.termination.dependent.kurt.singlebin.parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.axon.taperrate.termination.dependent.kurt.singlebin.parameter(3) = NaN; 
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal: halfmax
							input.axon.taperrate.termination.dependent.kurt.singlebin.parameter(4) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal:
							% steepness
							
							
% Piece Bifurcation Probability

    % Piece Bifurcation Probability dependency

        input.axon.piecebifprob.mode = '';
        % Either 'independent' or 'dependent'

		% Piece Bifurcation Probability independent
        
            input.axon.piecebifprob.by = '';
            % Either 'length', 'surface area' or 'volume'	

			input.axon.piecebifprob.distribution = '';
			% Either 'constant', 'uniform', 'normal', 'pearson', or 'none'

				input.axon.piecebifprob.const        = NaN;
				input.axon.piecebifprob.min          = NaN;
				input.axon.piecebifprob.mean         = NaN;
				input.axon.piecebifprob.max          = NaN;
				input.axon.piecebifprob.sd           = NaN;
				input.axon.piecebifprob.skew         = NaN;
				input.axon.piecebifprob.kurt         = NaN;
		
		% Piece Bifurcation Probability dependent
		
			% Piece Bifurcation Probability
				
				input.axon.piecebifprob.dependent.mean.by = '';
				% Either 'length', 'surface area' or 'volume'
				
				input.axon.piecebifprob.dependent.mean.type = '';
				% Either 'singlebin' or 'doublebin'
					
				% Single Bin
				
					input.axon.piecebifprob.dependent.singlebin.dependent = '';
					% Either 'diameter', 'pathlength', 'radialdistance' or 'branchlength'
						
						input.axon.piecebifprob.dependent.singlebin.fit = '';
						% Either 'linear', 'exponential', 'power', 'sigmoidal' or 'none'

							input.axon.piecebifprob.dependent.singlebin.parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.axon.piecebifprob.dependent.singlebin.parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.axon.piecebifprob.dependent.singlebin.parameter(3) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal: halfmax
							input.axon.piecebifprob.dependent.singlebin.parameter(4) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal:
							% steepness
							
				% Double Bin
				
					input.axon.piecebifprob.dependent.doublebin.firstbin = '';
					input.axon.piecebifprob.dependent.doublebin.secondbin = '';
					% Either 'diameter', 'pathlength', 'branchlength' or 'branchorder'
					
					input.axon.piecebifprob.dependent.doublebin.firstfit = '';
					% Either 'linear', 'exponential', 'power' or 'sigmoid'
					
					   input.axon.piecebifprob.dependent.doublebin.parameter(1).fit = '';
						% Either 'linear, 'exponential', 'power', 'sigmoidal' or 'none'

							input.axon.piecebifprob.dependent.doublebin.parameter(1).parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.axon.piecebifprob.dependent.doublebin.parameter(1).parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.axon.piecebifprob.dependent.doublebin.parameter(1).parameter(3) = NaN;
							% Linear: N/A | Exponential: a2 | Power: N/A | Sigmoidal: halfmax
							input.axon.piecebifprob.dependent.doublebin.parameter(1).parameter(4) = NaN;
							% Linear: N/A | Exponential: b2 | Power: N/A | Sigmoidal:
							% steepness

						input.axon.piecebifprob.dependent.doublebin.parameter(2).fit = '';
						% Either 'linear, 'exponential', 'power', 'sigmoidal' or 'none'

							input.axon.piecebifprob.dependent.doublebin.parameter(2).parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.axon.piecebifprob.dependent.doublebin.parameter(2).parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.axon.piecebifprob.dependent.doublebin.parameter(2).parameter(3) = NaN;
							% Linear: N/A | Exponential: a2 | Power: N/A | Sigmoidal: halfmax
							input.axon.piecebifprob.dependent.doublebin.parameter(2).parameter(4) = NaN;
							% Linear: N/A | Exponential: b2 | Power: N/A | Sigmoidal:
							% steepness

						input.axon.piecebifprob.dependent.doublebin.parameter(3).fit = '';
						% Either 'linear, 'exponential', 'power', 'sigmoidal' or 'none'

							input.axon.piecebifprob.dependent.doublebin.parameter(3).parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.axon.piecebifprob.dependent.doublebin.parameter(3).parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.axon.piecebifprob.dependent.doublebin.parameter(3).parameter(3) = NaN;
							% Linear: N/A | Exponential: a2 | Power: N/A | Sigmoidal: halfmax
							input.axon.piecebifprob.dependent.doublebin.parameter(3).parameter(4) = NaN;
							% Linear: N/A | Exponential: b2 | Power: N/A | Sigmoidal:
							% steepness

						input.axon.piecebifprob.dependent.doublebin.parameter(4).fit = '';
						% Either 'linear, 'exponential', 'power', 'sigmoidal' or 'none'
							input.axon.piecebifprob.dependent.doublebin.parameter(4).parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.axon.piecebifprob.dependent.doublebin.parameter(4).parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.axon.piecebifprob.dependent.doublebin.parameter(4).parameter(3) = NaN;
							% Linear: N/A | Exponential: a2 | Power: N/A | Sigmoidal: halfmax
							input.axon.piecebifprob.dependent.doublebin.parameter(4).parameter(4) = NaN;
							% Linear: N/A | Exponential: b2 | Power: N/A | Sigmoidal:
							% steepness
							
							
% Piece Termination Probability

    % Piece Termination Probability dependency

        input.axon.piecetermprob.mode = '';
        % Either 'independent' or 'dependent'

		% Piece Termination Probability independent
        
            input.axon.piecetermprob.by = '';
            % Either 'length', 'surface area' or 'volume'

			input.axon.piecetermprob.distribution = '';
			% Either 'constant', 'uniform', 'normal', 'pearson', or 'none'

				input.axon.piecetermprob.const        = NaN;
				input.axon.piecetermprob.min          = NaN;
				input.axon.piecetermprob.mean         = NaN;
				input.axon.piecetermprob.max          = NaN;
				input.axon.piecetermprob.sd           = NaN;
				input.axon.piecetermprob.skew         = NaN;
				input.axon.piecetermprob.kurt         = NaN;
		
		% Piece Termination Probability dependent
		
			% Piece Termination Probability
			
				input.axon.piecetermprob.dependent.mean.by = '';
				% Either 'length', 'surface area' or 'volume'
				
				input.axon.piecetermprob.dependent.mean.type = '';
				% Either 'singlebin' or 'doublebin'
					
				% Single Bin
				
					input.axon.piecetermprob.dependent.singlebin.dependent = '';
					% Either 'diameter', 'pathlength' or 'radialdistance'
						
						input.axon.piecetermprob.dependent.singlebin.fit = ''; 
						% Either 'linear', 'exponential', 'power', 'sigmoidal' or 'none'

							input.axon.piecetermprob.dependent.singlebin.parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.axon.piecetermprob.dependent.singlebin.parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.axon.piecetermprob.dependent.singlebin.parameter(3) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal: halfmax
							input.axon.piecetermprob.dependent.singlebin.parameter(4) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal:
							% steepness
							
				% Double Bin
				
					input.axon.piecetermprob.dependent.doublebin.firstbin = '';
					input.axon.piecetermprob.dependent.doublebin.secondbin = '';
					% Either 'diameter' or 'pathlength'
					
					input.axon.piecetermprob.dependent.doublebin.firstfit = '';
					% Either 'linear', 'exponential', 'power' or 'sigmoid'
					
					   input.axon.piecetermprob.dependent.doublebin.parameter(1).fit = '';
						% Either 'linear, 'exponential', 'power', 'sigmoidal' or 'none'

							input.axon.piecetermprob.dependent.doublebin.parameter(1).parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.axon.piecetermprob.dependent.doublebin.parameter(1).parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.axon.piecetermprob.dependent.doublebin.parameter(1).parameter(3) = NaN;
							% Linear: N/A | Exponential: a2 | Power: N/A | Sigmoidal: halfmax
							input.axon.piecetermprob.dependent.doublebin.parameter(1).parameter(4) = NaN;
							% Linear: N/A | Exponential: b2 | Power: N/A | Sigmoidal:
							% steepness

						input.axon.piecetermprob.dependent.doublebin.parameter(2).fit = '';
						% Either 'linear, 'exponential', 'power', 'sigmoidal' or 'none'

							input.axon.piecetermprob.dependent.doublebin.parameter(2).parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.axon.piecetermprob.dependent.doublebin.parameter(2).parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.axon.piecetermprob.dependent.doublebin.parameter(2).parameter(3) = NaN;
							% Linear: N/A | Exponential: a2 | Power: N/A | Sigmoidal: halfmax
							input.axon.piecetermprob.dependent.doublebin.parameter(2).parameter(4) = NaN;
							% Linear: N/A | Exponential: b2 | Power: N/A | Sigmoidal:
							% steepness

						input.axon.piecetermprob.dependent.doublebin.parameter(3).fit = '';
						% Either 'linear, 'exponential', 'power', 'sigmoidal' or 'none'

							input.axon.piecetermprob.dependent.doublebin.parameter(3).parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.axon.piecetermprob.dependent.doublebin.parameter(3).parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.axon.piecetermprob.dependent.doublebin.parameter(3).parameter(3) = NaN;
							% Linear: N/A | Exponential: a2 | Power: N/A | Sigmoidal: halfmax
							input.axon.piecetermprob.dependent.doublebin.parameter(3).parameter(4) = NaN;
							% Linear: N/A | Exponential: b2 | Power: N/A | Sigmoidal:
							% steepness

						input.axon.piecetermprob.dependent.doublebin.parameter(4).fit = '';
						% Either 'linear, 'exponential', 'power', 'sigmoidal' or 'none'
							input.axon.piecetermprob.dependent.doublebin.parameter(4).parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.axon.piecetermprob.dependent.doublebin.parameter(4).parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.axon.piecetermprob.dependent.doublebin.parameter(4).parameter(3) = NaN;
							% Linear: N/A | Exponential: a2 | Power: N/A | Sigmoidal: halfmax
							input.axon.piecetermprob.dependent.doublebin.parameter(4).parameter(4) = NaN;
							% Linear: N/A | Exponential: b2 | Power: N/A | Sigmoidal:
							% steepness
							
							
% Daughter direction

    input.axon.daughterangle.distribution = '';

        input.axon.daughterangle.const    = NaN;
        input.axon.daughterangle.min      = NaN;
        input.axon.daughterangle.mean     = NaN;
        input.axon.daughterangle.max      = NaN;
        input.axon.daughterangle.sd       = NaN;
        input.axon.daughterangle.skew     = NaN;
        input.axon.daughterangle.kurt     = NaN;

        input.axon.daughterangle.minangle = NaN;
		
		
% Rall Ratio

	input.axon.rallratio.rallexponent = NaN;

    % Rall Ratio dependency

        input.axon.rallratio.mode = '';
        % Either 'independent' or 'dependent'

		% Rall Ratio independent

			input.axon.rallratio.distribution = '';
			% Either 'constant', 'uniform', 'normal', 'pearson', or 'none'

				input.axon.rallratio.const        = NaN;
				input.axon.rallratio.min          = NaN;
				input.axon.rallratio.mean         = NaN;
				input.axon.rallratio.max          = NaN; 
				input.axon.rallratio.sd           = NaN; 
				input.axon.rallratio.skew         = NaN; 
				input.axon.rallratio.kurt         = NaN;  
		
		% Rall Ratio dependent
		
			% Rall Ratio Mean
			
				input.axon.rallratio.dependent.mean.type = '';
				% Either 'independent', 'singlebin' or 'doublebin'
					
				% Single Bin
				
					input.axon.rallratio.dependent.mean.singlebin.dependent = '';
					% Either 'diameter', 'pathlength' or 'radialdistance'
						
						input.axon.rallratio.dependent.mean.singlebin.fit = '';
						% Either 'linear', 'exponential', 'power', 'sigmoidal' or 'none'

							input.axon.rallratio.dependent.mean.singlebin.parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.axon.rallratio.dependent.mean.singlebin.parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.axon.rallratio.dependent.mean.singlebin.parameter(3) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal: halfmax
							input.axon.rallratio.dependent.mean.singlebin.parameter(4) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal:
							% steepness

			% Rall Ratio Standard Deviation
			
				input.axon.rallratio.dependent.sd.type = '';
				% Either 'independent', 'singlebin' or 'doublebin'
					
				% Single Bin
				
					input.axon.rallratio.dependent.sd.singlebin.dependent = '';
					% Either 'diameter', 'pathlength' or 'radialdistance'
						
						input.axon.rallratio.dependent.sd.singlebin.fit = '';
						% Either 'linear', 'exponential', 'power', 'sigmoidal' or 'none'

							input.axon.rallratio.dependent.sd.singlebin.parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.axon.rallratio.dependent.sd.singlebin.parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.axon.rallratio.dependent.sd.singlebin.parameter(3) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal: halfmax
							input.axon.rallratio.dependent.sd.singlebin.parameter(4) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal:
							% steepness

			% Rall Ratio Skewness
			
				input.axon.rallratio.dependent.skew.type = '';
				% Either 'independent', 'singlebin' or 'doublebin'
					
				% Single Bin
				
					input.axon.rallratio.dependent.skew.singlebin.dependent = '';
					% Either 'diameter', 'pathlength' or 'radialdistance'
						
						input.axon.rallratio.dependent.skew.singlebin.fit = '';
						% Either 'linear', 'exponential', 'power', 'sigmoidal' or 'none'

							input.axon.rallratio.dependent.skew.singlebin.parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.axon.rallratio.dependent.skew.singlebin.parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.axon.rallratio.dependent.skew.singlebin.parameter(3) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal: halfmax
							input.axon.rallratio.dependent.skew.singlebin.parameter(4) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal:
							% steepness

			% Rall Ratio Kurtosis
			
				input.axon.rallratio.dependent.kurt.type = '';
				% Either 'independent', 'singlebin' or 'doublebin'
					
				% Single Bin
				
					input.axon.rallratio.dependent.kurt.singlebin.dependent = '';
					% Either 'diameter', 'pathlength' or 'radialdistance'
						
						input.axon.rallratio.dependent.kurt.singlebin.fit = '';
						% Either 'linear', 'exponential', 'power', 'sigmoidal' or 'none'

							input.axon.rallratio.dependent.kurt.singlebin.parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.axon.rallratio.dependent.kurt.singlebin.parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.axon.rallratio.dependent.kurt.singlebin.parameter(3) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal: halfmax
							input.axon.rallratio.dependent.kurt.singlebin.parameter(4) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal:
							% steepness


% Daughter Ratio

    % Daughter Ratio dependency

        input.axon.daughterratio.mode = '';
        % Either 'independent' or 'dependent'

		% Daughter Ratio independent

			input.axon.daughterratio.distribution = '';
			% Either 'constant', 'uniform', 'normal', 'pearson', 'gamma' or 'none'
			% The gamma distribution is for 'excess' daughter ratio (ratio - 1)

				input.axon.daughterratio.const        = NaN;
				input.axon.daughterratio.min          = NaN;
				input.axon.daughterratio.mean         = NaN;
				input.axon.daughterratio.max          = NaN;
				input.axon.daughterratio.sd           = NaN;
				input.axon.daughterratio.skew         = NaN;
				input.axon.daughterratio.kurt         = NaN;
				
				input.axon.daughterratio.gamma.a      = NaN;
				input.axon.daughterratio.gamma.b      = NaN;
		
		% Daughter Ratio dependent
		
			% Daughter Ratio Mean
			
				input.axon.daughterratio.dependent.mean.type = '';
				% Either 'singlebin' or 'doublebin'
					
				% Single Bin
				
					input.axon.daughterratio.dependent.mean.singlebin.dependent = '';
					% Either 'diameter', 'pathlength' or 'radialdistance'
						
						input.axon.daughterratio.dependent.mean.singlebin.fit = '';
						% Either 'linear', 'exponential', 'power', 'sigmoidal' or 'none'

							input.axon.daughterratio.dependent.mean.singlebin.parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.axon.daughterratio.dependent.mean.singlebin.parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.axon.daughterratio.dependent.mean.singlebin.parameter(3) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal: halfmax
							input.axon.daughterratio.dependent.mean.singlebin.parameter(4) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal:
							% steepness
							
			% Daughter Ratio Standard Deviation
			
				input.axon.daughterratio.dependent.sd.type = '';
				% Either 'singlebin' or 'doublebin'
					
				% Single Bin
				
					input.axon.daughterratio.dependent.sd.singlebin.dependent = '';
					% Either 'diameter', 'pathlength' or 'radialdistance'
						
						input.axon.daughterratio.dependent.sd.singlebin.fit = '';
						% Either 'linear', 'exponential', 'power', 'sigmoidal' or 'none'

							input.axon.daughterratio.dependent.sd.singlebin.parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.axon.daughterratio.dependent.sd.singlebin.parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.axon.daughterratio.dependent.sd.singlebin.parameter(3) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal: halfmax
							input.axon.daughterratio.dependent.sd.singlebin.parameter(4) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal:
							% steepness

			% Daughter Ratio Skewness
			
				input.axon.daughterratio.dependent.skew.type = '';
				% Either 'singlebin' or 'doublebin'
					
				% Single Bin
				
					input.axon.daughterratio.dependent.skew.singlebin.dependent = '';
					% Either 'diameter', 'pathlength' or 'radialdistance'
						
						input.axon.daughterratio.dependent.skew.singlebin.fit = '';
						% Either 'linear', 'exponential', 'power', 'sigmoidal' or 'none'

							input.axon.daughterratio.dependent.skew.singlebin.parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.axon.daughterratio.dependent.skew.singlebin.parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.axon.daughterratio.dependent.skew.singlebin.parameter(3) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal: halfmax
							input.axon.daughterratio.dependent.skew.singlebin.parameter(4) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal:
							% steepness

			% Daughter Ratio Kurtosis
			
				input.axon.daughterratio.dependent.kurt.type = '';
				% Either 'singlebin' or 'doublebin'
					
				% Single Bin
				
					input.axon.daughterratio.dependent.kurt.singlebin.dependent = '';
					% Either 'diameter', 'pathlength' or 'radialdistance'
						
						input.axon.daughterratio.dependent.kurt.singlebin.fit = '';
						% Either 'linear', 'exponential', 'power', 'sigmoidal' or 'none'

							input.axon.daughterratio.dependent.kurt.singlebin.parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.axon.daughterratio.dependent.kurt.singlebin.parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.axon.daughterratio.dependent.kurt.singlebin.parameter(3) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal: halfmax
							input.axon.daughterratio.dependent.kurt.singlebin.parameter(4) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal:
							% steepness
                            

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

        input.dendrite.piecelength.const    = 20;
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
    input.dendrite.resampleattempts       = 1;


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
	
		input.dendrite.taperrate.bifurcation.mode = 'diameter';
        % Either 'independent' or 'dependent'

		% Bifurcation Taper Rate independent

			input.dendrite.taperrate.bifurcation.distribution = '';
			% Either 'constant', 'uniform', 'normal', 'pearson', or 'none'

				input.dendrite.taperrate.bifurcation.const        = NaN;
				input.dendrite.taperrate.bifurcation.min          = NaN;
				input.dendrite.taperrate.bifurcation.mean         = NaN;
				input.dendrite.taperrate.bifurcation.max          = NaN;
				input.dendrite.taperrate.bifurcation.sd           = NaN;
				input.dendrite.taperrate.bifurcation.skew         = NaN; 
				input.dendrite.taperrate.bifurcation.kurt         = NaN;
		
		% Bifurcation Taper Rate dependent
		
			% Bifurcation Taper Rate Mean
			
				input.dendrite.taperrate.bifurcation.dependent.mean.type = 'singlebin';
				% Either 'independent', 'singlebin' or 'doublebin'
					
				% Single Bin
				
					input.dendrite.taperrate.bifurcation.dependent.mean.singlebin.dependent = 'diameter';       
					% Either 'diameter', 'pathlength' or 'radialdistance'
						
						input.dendrite.taperrate.bifurcation.dependent.mean.singlebin.fit = 'exponential'; % offset weighted 
						% Either 'linear', 'exponential', 'power', 'sigmoidal' or 'none'

							input.dendrite.taperrate.bifurcation.dependent.mean.singlebin.parameter(1) = 3.436e-3;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.dendrite.taperrate.bifurcation.dependent.mean.singlebin.parameter(2) = 9.377e-2;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.dendrite.taperrate.bifurcation.dependent.mean.singlebin.parameter(3) = -3.961e-3;
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
						
						input.dendrite.taperrate.bifurcation.dependent.sd.singlebin.fit = 'linear'; %unweighted
						% Either 'linear', 'exponential', 'power', 'sigmoidal' or 'none'

							input.dendrite.taperrate.bifurcation.dependent.sd.singlebin.parameter(1) = 7.691e-4;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.dendrite.taperrate.bifurcation.dependent.sd.singlebin.parameter(2) = 7.918e-4;
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
						
						input.dendrite.taperrate.bifurcation.dependent.skew.singlebin.fit = 'linear';
						% Either 'linear', 'exponential', 'power', 'sigmoidal' or 'none'

							input.dendrite.taperrate.bifurcation.dependent.skew.singlebin.parameter(1) = 0;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.dendrite.taperrate.bifurcation.dependent.skew.singlebin.parameter(2) = 0;
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
						
						input.dendrite.taperrate.bifurcation.dependent.kurt.singlebin.fit = 'linear';
						% Either 'linear', 'exponential', 'power', 'sigmoidal' or 'none'

							input.dendrite.taperrate.bifurcation.dependent.kurt.singlebin.parameter(1) = 0;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.dendrite.taperrate.bifurcation.dependent.kurt.singlebin.parameter(2) = 3;
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

        input.dendrite.piecebifprob.mode = 'dependent';
        % Either 'independent' or 'dependent'

		% Piece Bifurcation Probability independent

            input.dendrite.piecebifprob.by = '';
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
		
		% Piece Bifurcation Probability dependent
		
			% Piece Bifurcation Probability
				
				input.dendrite.piecebifprob.dependent.mean.by = 'branchvolume';
				% Either 'length', 'surface area' or 'volume'
				
				input.dendrite.piecebifprob.dependent.mean.type = 'singlebin';
				% Either 'singlebin' or 'doublebin'
					
				% Single Bin
				
					input.dendrite.piecebifprob.dependent.singlebin.dependent = 'branchproximaldiameter';
					% Either 'diameter', 'pathlength', 'radialdistance' or 'branchlength'
						
						input.dendrite.piecebifprob.dependent.singlebin.fit = 'linear';
						% Either 'linear', 'exponential', 'power', 'sigmoidal' or 'none'

							input.dendrite.piecebifprob.dependent.singlebin.parameter(1) = 715.5; %5.543e2;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.dendrite.piecebifprob.dependent.singlebin.parameter(2) = -1045; %-5.126e2;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.dendrite.piecebifprob.dependent.singlebin.parameter(3) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal: halfmax
							input.dendrite.piecebifprob.dependent.singlebin.parameter(4) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal:
							% steepness
							
				% Double Bin
				
					input.dendrite.piecebifprob.dependent.doublebin.firstbin = '';
					input.dendrite.piecebifprob.dependent.doublebin.secondbin = '';
					% Either 'diameter', 'pathlength', 'branchlength' or 'branchorder'
					
					input.dendrite.piecebifprob.dependent.doublebin.firstfit = ''; 
					% Either 'linear', 'exponential', 'power' or 'sigmoid'
					
					   input.dendrite.piecebifprob.dependent.doublebin.parameter(1).fit = ''; 
						% Either 'linear, 'exponential', 'power', 'sigmoidal' or 'none'

							input.dendrite.piecebifprob.dependent.doublebin.parameter(1).parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.dendrite.piecebifprob.dependent.doublebin.parameter(1).parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.dendrite.piecebifprob.dependent.doublebin.parameter(1).parameter(3) = NaN;
							% Linear: N/A | Exponential: a2 | Power: N/A | Sigmoidal: halfmax
							input.dendrite.piecebifprob.dependent.doublebin.parameter(1).parameter(4) = NaN;
							% Linear: N/A | Exponential: b2 | Power: N/A | Sigmoidal:
							% steepness

						input.dendrite.piecebifprob.dependent.doublebin.parameter(2).fit = '';
						% Either 'linear, 'exponential', 'power', 'sigmoidal' or 'none'

							input.dendrite.piecebifprob.dependent.doublebin.parameter(2).parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.dendrite.piecebifprob.dependent.doublebin.parameter(2).parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.dendrite.piecebifprob.dependent.doublebin.parameter(2).parameter(3) = NaN;
							% Linear: N/A | Exponential: a2 | Power: N/A | Sigmoidal: halfmax
							input.dendrite.piecebifprob.dependent.doublebin.parameter(2).parameter(4) = NaN;
							% Linear: N/A | Exponential: b2 | Power: N/A | Sigmoidal:
							% steepness

						input.dendrite.piecebifprob.dependent.doublebin.parameter(3).fit = ''; 
						% Either 'linear, 'exponential', 'power', 'sigmoidal' or 'none'

							input.dendrite.piecebifprob.dependent.doublebin.parameter(3).parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.dendrite.piecebifprob.dependent.doublebin.parameter(3).parameter(2) = NaN;
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

		% Piece Termination Probability independent
        
            input.dendrite.piecetermprob.by = '';
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

        input.dendrite.rallratio.mode = 'dependent';
        % Either 'independent' or 'dependent'

		% Rall Ratio independent

			input.dendrite.rallratio.distribution = '';
			% Either 'constant', 'uniform', 'normal', 'pearson', or 'none'

				input.dendrite.rallratio.const        = NaN;
				input.dendrite.rallratio.min          = 0.3546;
				input.dendrite.rallratio.mean         = NaN;
				input.dendrite.rallratio.max          = NaN; 
				input.dendrite.rallratio.sd           = NaN; 
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
                            
                            
% Apical Inputs
% -------------------------------------------------------------------------------------------------------------------------------------------------

% Number of trunks

   input.apical.numbertrunks.distribution = 'constant';
   % 'constant', 'uniform', 'normal', 'pearson', or 'preset'

        input.apical.numbertrunks.const        = NaN;
        input.apical.numbertrunks.min          = NaN;
        input.apical.numbertrunks.mean         = NaN;
        input.apical.numbertrunks.max          = NaN;
        input.apical.numbertrunks.sd           = NaN;
        input.apical.numbertrunks.skew         = NaN;
        input.apical.numbertrunks.kurt         = NaN;
		
		input.apical.numbertrunks.preset       = []; 

% Trunk diameters

    input.apical.trunkdiameter.distribution = '';
	% 'constant', 'uniform', 'normal', 'pearson', or 'preset'

        input.apical.trunkdiameter.const    = NaN;
        input.apical.trunkdiameter.min      = NaN;
        input.apical.trunkdiameter.mean     = NaN;
        input.apical.trunkdiameter.max      = NaN;
        input.apical.trunkdiameter.sd       = NaN;
        input.apical.trunkdiameter.skew     = NaN;
        input.apical.trunkdiameter.kurt     = NaN;
		
		input.apical.trunkdiameter.preset{1} = [];
		input.apical.trunkdiameter.preset{2} = [];
		input.apical.trunkdiameter.preset{3} = [];
		input.apical.trunkdiameter.preset{4} = [];
		

% Piece length

    input.apical.piecelength.distribution = 'constant';

        input.apical.piecelength.const    = NaN;
        input.apical.piecelength.min      = NaN;
        input.apical.piecelength.mean     = NaN;
        input.apical.piecelength.max      = NaN;
        input.apical.piecelength.sd       = NaN;
        input.apical.piecelength.skew     = NaN;
        input.apical.piecelength.kurt     = NaN;


% Meander angle

     input.apical.meanderangle.distribution = 'normal';

        input.apical.meanderangle.const    = NaN;
        input.apical.meanderangle.min      = NaN;
        input.apical.meanderangle.mean     = NaN;
        input.apical.meanderangle.max      = NaN;
        input.apical.meanderangle.sd       = NaN;
        input.apical.meanderangle.skew     = NaN;
        input.apical.meanderangle.kurt     = NaN;


% Minimum dendritic diameter

    input.apical.mindiameter            = NaN;
    input.apical.minbifurcationdiameter = NaN;
    input.apical.resampleattempts       = 0;


% Branch Type Probability

    input.apical.probability.branch.mode = ''; 
    % Either 'pathlength', 'diameter', 'diameterpathlength', or 'diameterbranchorder'

	input.apical.probability.branch.mindiameter = NaN;
	% Minimum value for bifurcation
	% Either NaN or numeric value
	
	input.apical.probability.branch.maxpathlength = NaN; 
	% Maximum value for bifurcation
	% Either NaN or numeric value
	
	input.apical.probability.branch.maxbranchorder = NaN; 
	% Maximum value for bifurcation
	% Either NaN or numeric value
	
    input.apical.probability.branch.type = '';
    % Either 'logit', 'probit', 'comploglog', or 'loglog'

    input.apical.probability.branch.parameter1 = NaN;
    % Non-multiplicative parameter in all cases
    input.apical.probability.branch.parameter2 = NaN;
    % Multiplicative parameter if mode is not doublebin
    % Diameter multiplicative parameter if mode is doublebin
    input.apical.probability.branch.parameter3 = NaN; 
    % Unused if mode is not doublebin
    % Second bin multiplicative parameter if mode is doublebin


% Bifurcation Taper Rate

    % Bifurcation Taper Rate dependency
	
		input.apical.taperrate.bifurcation.mode = '';
        % Either 'independent' or 'dependent'

		% Bifurcation Taper Rate independent

			input.apical.taperrate.bifurcation.distribution = '';
			% Either 'constant', 'uniform', 'normal', 'pearson', or 'none'

				input.apical.taperrate.bifurcation.const        = NaN;
				input.apical.taperrate.bifurcation.min          = NaN; 
				input.apical.taperrate.bifurcation.mean         = NaN;
				input.apical.taperrate.bifurcation.max          = NaN; 
				input.apical.taperrate.bifurcation.sd           = NaN;
				input.apical.taperrate.bifurcation.skew         = NaN; 
				input.apical.taperrate.bifurcation.kurt         = NaN;
		
		% Bifurcation Taper Rate dependent
		
			% Bifurcation Taper Rate Mean
			
				input.apical.taperrate.bifurcation.dependent.mean.type = '';
				% Either 'independent', 'singlebin' or 'doublebin'
					
				% Single Bin
				
					input.apical.taperrate.bifurcation.dependent.mean.singlebin.dependent = '';       
					% Either 'diameter', 'pathlength' or 'radialdistance'
						
						input.apical.taperrate.bifurcation.dependent.mean.singlebin.fit = ''; 
						% Either 'linear', 'exponential', 'power', 'sigmoidal' or 'none'

							input.apical.taperrate.bifurcation.dependent.mean.singlebin.parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.apical.taperrate.bifurcation.dependent.mean.singlebin.parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.apical.taperrate.bifurcation.dependent.mean.singlebin.parameter(3) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal: halfmax
							input.apical.taperrate.bifurcation.dependent.mean.singlebin.parameter(4) = NaN; 
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal:
							% steepness
							
			% Bifurcation Taper Rate Standard Deviation
			
				input.apical.taperrate.bifurcation.dependent.sd.type = '';
				% Either 'independent', 'singlebin' or 'doublebin'
					
				% Single Bin
				
					input.apical.taperrate.bifurcation.dependent.sd.singlebin.dependent = '';
					% Either 'diameter', 'pathlength' or 'radialdistance'
						
						input.apical.taperrate.bifurcation.dependent.sd.singlebin.fit = ''; 
						% Either 'linear', 'exponential', 'power', 'sigmoidal' or 'none'

							input.apical.taperrate.bifurcation.dependent.sd.singlebin.parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.apical.taperrate.bifurcation.dependent.sd.singlebin.parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.apical.taperrate.bifurcation.dependent.sd.singlebin.parameter(3) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal: halfmax
							input.apical.taperrate.bifurcation.dependent.sd.singlebin.parameter(4) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal:
							% steepness
							
			% Bifurcation Taper Rate Skewness
			
				input.apical.taperrate.bifurcation.dependent.skew.type = '';
				% Either 'independent', 'singlebin' or 'doublebin'
					
				% Single Bin
				
					input.apical.taperrate.bifurcation.dependent.skew.singlebin.dependent = '';
					% Either 'diameter', 'pathlength' or 'radialdistance'
						
						input.apical.taperrate.bifurcation.dependent.skew.singlebin.fit = '';
						% Either 'linear', 'exponential', 'power', 'sigmoidal' or 'none'

							input.apical.taperrate.bifurcation.dependent.skew.singlebin.parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.apical.taperrate.bifurcation.dependent.skew.singlebin.parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.apical.taperrate.bifurcation.dependent.skew.singlebin.parameter(3) = NaN; 
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal: halfmax
							input.apical.taperrate.bifurcation.dependent.skew.singlebin.parameter(4) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal:
							% steepness

			% Bifurcation Taper Rate Kurtosis
			
				input.apical.taperrate.bifurcation.dependent.kurt.type = '';
				% Either 'independent', 'singlebin' or 'doublebin'
					
				% Single Bin
				
					input.apical.taperrate.bifurcation.dependent.kurt.singlebin.dependent = '';
					% Either 'diameter', 'pathlength' or 'radialdistance'
						
						input.apical.taperrate.bifurcation.dependent.kurt.singlebin.fit = ''; 
						% Either 'linear', 'exponential', 'power', 'sigmoidal' or 'none'

							input.apical.taperrate.bifurcation.dependent.kurt.singlebin.parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.apical.taperrate.bifurcation.dependent.kurt.singlebin.parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.apical.taperrate.bifurcation.dependent.kurt.singlebin.parameter(3) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal: halfmax
							input.apical.taperrate.bifurcation.dependent.kurt.singlebin.parameter(4) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal:
							% steepness

							
% Termination Taper Rate

    % Termination Taper Rate dependency
	
		input.apical.taperrate.termination.mode = '';
        % Either 'independent' or 'dependent'

		% Termination Taper Rate independent

			input.apical.taperrate.termination.distribution = '';
			% Either 'constant', 'uniform', 'normal', 'pearson', or 'none'

				input.apical.taperrate.termination.const        = NaN;
				input.apical.taperrate.termination.min          = NaN; 
				input.apical.taperrate.termination.mean         = NaN;
				input.apical.taperrate.termination.max          = NaN; 
				input.apical.taperrate.termination.sd           = NaN;
				input.apical.taperrate.termination.skew         = NaN; 
				input.apical.taperrate.termination.kurt         = NaN; 
		
		% Termination Taper Rate dependent
		
			% Termination Taper Rate Mean
			
				input.apical.taperrate.termination.dependent.mean.type = '';
				% Either 'independent', 'singlebin' or 'doublebin'
					
				% Single Bin
				
					input.apical.taperrate.termination.dependent.mean.singlebin.dependent = '';
					% Either 'diameter', 'pathlength' or 'radialdistance'
						
						input.apical.taperrate.termination.dependent.mean.singlebin.fit = '';
						% Either 'linear', 'exponential', 'power', 'sigmoidal' or 'none'

							input.apical.taperrate.termination.dependent.mean.singlebin.parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.apical.taperrate.termination.dependent.mean.singlebin.parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.apical.taperrate.termination.dependent.mean.singlebin.parameter(3) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal: halfmax
							input.apical.taperrate.termination.dependent.mean.singlebin.parameter(4) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal:
							% steepness
							
			% Termination Taper Rate Standard Deviation
			
				input.apical.taperrate.termination.dependent.sd.type = '';
				% Either 'independent', 'singlebin' or 'doublebin'
					
				% Single Bin
				
					input.apical.taperrate.termination.dependent.sd.singlebin.dependent = '';
					% Either 'diameter', 'pathlength' or 'radialdistance'
						
						input.apical.taperrate.termination.dependent.sd.singlebin.fit = '';
						% Either 'linear', 'exponential', 'power', 'sigmoidal' or 'none'

							input.apical.taperrate.termination.dependent.sd.singlebin.parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.apical.taperrate.termination.dependent.sd.singlebin.parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.apical.taperrate.termination.dependent.sd.singlebin.parameter(3) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal: halfmax
							input.apical.taperrate.termination.dependent.sd.singlebin.parameter(4) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal:
							% steepness

			% Termination Taper Rate Skewness
			
				input.apical.taperrate.termination.dependent.skew.type = '';
				% Either 'independent', 'singlebin' or 'doublebin'
					
				% Single Bin
				
					input.apical.taperrate.termination.dependent.skew.singlebin.dependent = '';
					% Either 'diameter', 'pathlength' or 'radialdistance'
						
						input.apical.taperrate.termination.dependent.skew.singlebin.fit = ''; 
						% Either 'linear', 'exponential', 'power', 'sigmoidal' or 'none'

							input.apical.taperrate.termination.dependent.skew.singlebin.parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.apical.taperrate.termination.dependent.skew.singlebin.parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.apical.taperrate.termination.dependent.skew.singlebin.parameter(3) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal: halfmax
							input.apical.taperrate.termination.dependent.skew.singlebin.parameter(4) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal:
							% steepness

			% Termination Taper Rate Kurtosis
			
				input.apical.taperrate.termination.dependent.kurt.type = '';
				% Either 'independent', 'singlebin' or 'doublebin'
					
				% Single Bin
				
					input.apical.taperrate.termination.dependent.kurt.singlebin.dependent = '';
					% Either 'diameter', 'pathlength' or 'radialdistance'
						
						input.apical.taperrate.termination.dependent.kurt.singlebin.fit = ''; 
						% Either 'linear', 'exponential', 'power', 'sigmoidal' or 'none'

							input.apical.taperrate.termination.dependent.kurt.singlebin.parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.apical.taperrate.termination.dependent.kurt.singlebin.parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.apical.taperrate.termination.dependent.kurt.singlebin.parameter(3) = NaN; 
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal: halfmax
							input.apical.taperrate.termination.dependent.kurt.singlebin.parameter(4) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal:
							% steepness
							
							
% Piece Bifurcation Probability

    % Piece Bifurcation Probability dependency

        input.apical.piecebifprob.mode = '';
        % Either 'independent' or 'dependent'

		% Piece Bifurcation Probability independent
        
            input.apical.piecebifprob.by = '';
            % Either 'length', 'surface area' or 'volume'

			input.apical.piecebifprob.distribution = '';
			% Either 'constant', 'uniform', 'normal', 'pearson', or 'none'

				input.apical.piecebifprob.const        = NaN;
				input.apical.piecebifprob.min          = NaN;
				input.apical.piecebifprob.mean         = NaN;
				input.apical.piecebifprob.max          = NaN;
				input.apical.piecebifprob.sd           = NaN;
				input.apical.piecebifprob.skew         = NaN;
				input.apical.piecebifprob.kurt         = NaN;
		
		% Piece Bifurcation Probability dependent
		
			% Piece Bifurcation Probability
				
				input.apical.piecebifprob.dependent.mean.by = '';
				% Either 'length', 'surface area' or 'volume'
				
				input.apical.piecebifprob.dependent.mean.type = '';
				% Either 'singlebin' or 'doublebin'
					
				% Single Bin
				
					input.apical.piecebifprob.dependent.singlebin.dependent = '';
					% Either 'diameter', 'pathlength', 'radialdistance' or 'branchlength'
						
						input.apical.piecebifprob.dependent.singlebin.fit = ''; %unweighted
						% Either 'linear', 'exponential', 'power', 'sigmoidal' or 'none'

							input.apical.piecebifprob.dependent.singlebin.parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.apical.piecebifprob.dependent.singlebin.parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.apical.piecebifprob.dependent.singlebin.parameter(3) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal: halfmax
							input.apical.piecebifprob.dependent.singlebin.parameter(4) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal:
							% steepness
							
				% Double Bin
				
					input.apical.piecebifprob.dependent.doublebin.firstbin = '';
					input.apical.piecebifprob.dependent.doublebin.secondbin = '';
					% Either 'diameter', 'pathlength', 'branchlength' or 'branchorder'
					
					input.apical.piecebifprob.dependent.doublebin.firstfit = '';
					% Either 'linear', 'exponential', 'power' or 'sigmoid'
					
					   input.apical.piecebifprob.dependent.doublebin.parameter(1).fit = '';
						% Either 'linear, 'exponential', 'power', 'sigmoidal' or 'none'

							input.apical.piecebifprob.dependent.doublebin.parameter(1).parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.apical.piecebifprob.dependent.doublebin.parameter(1).parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.apical.piecebifprob.dependent.doublebin.parameter(1).parameter(3) = NaN;
							% Linear: N/A | Exponential: a2 | Power: N/A | Sigmoidal: halfmax
							input.apical.piecebifprob.dependent.doublebin.parameter(1).parameter(4) = NaN;
							% Linear: N/A | Exponential: b2 | Power: N/A | Sigmoidal:
							% steepness

						input.apical.piecebifprob.dependent.doublebin.parameter(2).fit = '';
						% Either 'linear, 'exponential', 'power', 'sigmoidal' or 'none'

							input.apical.piecebifprob.dependent.doublebin.parameter(2).parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.apical.piecebifprob.dependent.doublebin.parameter(2).parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.apical.piecebifprob.dependent.doublebin.parameter(2).parameter(3) = NaN;
							% Linear: N/A | Exponential: a2 | Power: N/A | Sigmoidal: halfmax
							input.apical.piecebifprob.dependent.doublebin.parameter(2).parameter(4) = NaN;
							% Linear: N/A | Exponential: b2 | Power: N/A | Sigmoidal:
							% steepness

						input.apical.piecebifprob.dependent.doublebin.parameter(3).fit = '';
						% Either 'linear, 'exponential', 'power', 'sigmoidal' or 'none'

							input.apical.piecebifprob.dependent.doublebin.parameter(3).parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.apical.piecebifprob.dependent.doublebin.parameter(3).parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.apical.piecebifprob.dependent.doublebin.parameter(3).parameter(3) = NaN;
							% Linear: N/A | Exponential: a2 | Power: N/A | Sigmoidal: halfmax
							input.apical.piecebifprob.dependent.doublebin.parameter(3).parameter(4) = NaN;
							% Linear: N/A | Exponential: b2 | Power: N/A | Sigmoidal:
							% steepness

						input.apical.piecebifprob.dependent.doublebin.parameter(4).fit = '';
						% Either 'linear, 'exponential', 'power', 'sigmoidal' or 'none'
							input.apical.piecebifprob.dependent.doublebin.parameter(4).parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.apical.piecebifprob.dependent.doublebin.parameter(4).parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.apical.piecebifprob.dependent.doublebin.parameter(4).parameter(3) = NaN;
							% Linear: N/A | Exponential: a2 | Power: N/A | Sigmoidal: halfmax
							input.apical.piecebifprob.dependent.doublebin.parameter(4).parameter(4) = NaN;
							% Linear: N/A | Exponential: b2 | Power: N/A | Sigmoidal:
							% steepness
							
							
% Piece Termination Probability

    % Piece Termination Probability dependency

        input.apical.piecetermprob.mode = '';
        % Either 'independent' or 'dependent'

		% Piece Termination Probability independent
        
            input.apical.piecetermprob.by = '';
            % Either 'length', 'surface area' or 'volume'

			input.apical.piecetermprob.distribution = '';
			% Either 'constant', 'uniform', 'normal', 'pearson', or 'none'

				input.apical.piecetermprob.const        = NaN;
				input.apical.piecetermprob.min          = NaN;
				input.apical.piecetermprob.mean         = NaN;
				input.apical.piecetermprob.max          = NaN;
				input.apical.piecetermprob.sd           = NaN;
				input.apical.piecetermprob.skew         = NaN;
				input.apical.piecetermprob.kurt         = NaN;
		
		% Piece Termination Probability dependent
		
			% Piece Termination Probability
			
				input.apical.piecetermprob.dependent.mean.by = '';
				% Either 'length', 'surface area' or 'volume'
				
				input.apical.piecetermprob.dependent.mean.type = 'n';
				% Either 'singlebin' or 'doublebin'
					
				% Single Bin
				
					input.apical.piecetermprob.dependent.singlebin.dependent = '';
					% Either 'diameter', 'pathlength' or 'radialdistance'
						
						input.apical.piecetermprob.dependent.singlebin.fit = ''; 
						% Either 'linear', 'exponential', 'power', 'sigmoidal' or 'none'

							input.apical.piecetermprob.dependent.singlebin.parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.apical.piecetermprob.dependent.singlebin.parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.apical.piecetermprob.dependent.singlebin.parameter(3) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal: halfmax
							input.apical.piecetermprob.dependent.singlebin.parameter(4) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal:
							% steepness
							
				% Double Bin
				
					input.apical.piecetermprob.dependent.doublebin.firstbin = '';
					input.apical.piecetermprob.dependent.doublebin.secondbin = '';
					% Either 'diameter' or 'pathlength'
					
					input.apical.piecetermprob.dependent.doublebin.firstfit = '';
					% Either 'linear', 'exponential', 'power' or 'sigmoid'
					
					   input.apical.piecetermprob.dependent.doublebin.parameter(1).fit = '';
						% Either 'linear, 'exponential', 'power', 'sigmoidal' or 'none'

							input.apical.piecetermprob.dependent.doublebin.parameter(1).parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.apical.piecetermprob.dependent.doublebin.parameter(1).parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.apical.piecetermprob.dependent.doublebin.parameter(1).parameter(3) = NaN;
							% Linear: N/A | Exponential: a2 | Power: N/A | Sigmoidal: halfmax
							input.apical.piecetermprob.dependent.doublebin.parameter(1).parameter(4) = NaN;
							% Linear: N/A | Exponential: b2 | Power: N/A | Sigmoidal:
							% steepness

						input.apical.piecetermprob.dependent.doublebin.parameter(2).fit = '';
						% Either 'linear, 'exponential', 'power', 'sigmoidal' or 'none'

							input.apical.piecetermprob.dependent.doublebin.parameter(2).parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.apical.piecetermprob.dependent.doublebin.parameter(2).parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.apical.piecetermprob.dependent.doublebin.parameter(2).parameter(3) = NaN;
							% Linear: N/A | Exponential: a2 | Power: N/A | Sigmoidal: halfmax
							input.apical.piecetermprob.dependent.doublebin.parameter(2).parameter(4) = NaN;
							% Linear: N/A | Exponential: b2 | Power: N/A | Sigmoidal:
							% steepness

						input.apical.piecetermprob.dependent.doublebin.parameter(3).fit = '';
						% Either 'linear, 'exponential', 'power', 'sigmoidal' or 'none'

							input.apical.piecetermprob.dependent.doublebin.parameter(3).parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.apical.piecetermprob.dependent.doublebin.parameter(3).parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.apical.piecetermprob.dependent.doublebin.parameter(3).parameter(3) = NaN;
							% Linear: N/A | Exponential: a2 | Power: N/A | Sigmoidal: halfmax
							input.apical.piecetermprob.dependent.doublebin.parameter(3).parameter(4) = NaN;
							% Linear: N/A | Exponential: b2 | Power: N/A | Sigmoidal:
							% steepness

						input.apical.piecetermprob.dependent.doublebin.parameter(4).fit = '';
						% Either 'linear, 'exponential', 'power', 'sigmoidal' or 'none'
							input.apical.piecetermprob.dependent.doublebin.parameter(4).parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.apical.piecetermprob.dependent.doublebin.parameter(4).parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.apical.piecetermprob.dependent.doublebin.parameter(4).parameter(3) = NaN;
							% Linear: N/A | Exponential: a2 | Power: N/A | Sigmoidal: halfmax
							input.apical.piecetermprob.dependent.doublebin.parameter(4).parameter(4) = NaN;
							% Linear: N/A | Exponential: b2 | Power: N/A | Sigmoidal:
							% steepness
							
							
% Daughter direction

    input.apical.daughterangle.distribution = '';

        input.apical.daughterangle.const    = NaN;
        input.apical.daughterangle.min      = NaN;
        input.apical.daughterangle.mean     = NaN;
        input.apical.daughterangle.max      = NaN;
        input.apical.daughterangle.sd       = NaN;
        input.apical.daughterangle.skew     = NaN;
        input.apical.daughterangle.kurt     = NaN;

        input.apical.daughterangle.minangle = 15;
		
		
% Rall Ratio

	input.apical.rallratio.rallexponent = NaN;

    % Rall Ratio dependency

        input.apical.rallratio.mode = '';
        % Either 'independent' or 'dependent'

		% Rall Ratio independent

			input.apical.rallratio.distribution = '';
			% Either 'constant', 'uniform', 'normal', 'pearson', or 'none'

				input.apical.rallratio.const        = NaN;
				input.apical.rallratio.min          = NaN;
				input.apical.rallratio.mean         = NaN;
				input.apical.rallratio.max          = NaN; 
				input.apical.rallratio.sd           = NaN; 
				input.apical.rallratio.skew         = NaN; 
				input.apical.rallratio.kurt         = NaN;  
		
		% Rall Ratio dependent
		
			% Rall Ratio Mean
			
				input.apical.rallratio.dependent.mean.type = '';
				% Either 'independent', 'singlebin' or 'doublebin'
					
				% Single Bin
				
					input.apical.rallratio.dependent.mean.singlebin.dependent = '';
					% Either 'diameter', 'pathlength' or 'radialdistance'
						
						input.apical.rallratio.dependent.mean.singlebin.fit = ''; 
						% Either 'linear', 'exponential', 'power', 'sigmoidal' or 'none'

							input.apical.rallratio.dependent.mean.singlebin.parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.apical.rallratio.dependent.mean.singlebin.parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.apical.rallratio.dependent.mean.singlebin.parameter(3) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal: halfmax
							input.apical.rallratio.dependent.mean.singlebin.parameter(4) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal:
							% steepness

			% Rall Ratio Standard Deviation
			
				input.apical.rallratio.dependent.sd.type = '';
				% Either 'independent', 'singlebin' or 'doublebin'
					
				% Single Bin
				
					input.apical.rallratio.dependent.sd.singlebin.dependent = '';
					% Either 'diameter', 'pathlength' or 'radialdistance'
						
						input.apical.rallratio.dependent.sd.singlebin.fit = ''; 
						% Either 'linear', 'exponential', 'power', 'sigmoidal' or 'none'

							input.apical.rallratio.dependent.sd.singlebin.parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.apical.rallratio.dependent.sd.singlebin.parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.apical.rallratio.dependent.sd.singlebin.parameter(3) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal: halfmax
							input.apical.rallratio.dependent.sd.singlebin.parameter(4) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal:
							% steepness

			% Rall Ratio Skewness
			
				input.apical.rallratio.dependent.skew.type = '';
				% Either 'independent', 'singlebin' or 'doublebin'
					
				% Single Bin
				
					input.apical.rallratio.dependent.skew.singlebin.dependent = '';
					% Either 'diameter', 'pathlength' or 'radialdistance'
						
						input.apical.rallratio.dependent.skew.singlebin.fit = '';
						% Either 'linear', 'exponential', 'power', 'sigmoidal' or 'none'

							input.apical.rallratio.dependent.skew.singlebin.parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.apical.rallratio.dependent.skew.singlebin.parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.apical.rallratio.dependent.skew.singlebin.parameter(3) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal: halfmax
							input.apical.rallratio.dependent.skew.singlebin.parameter(4) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal:
							% steepness

			% Rall Ratio Kurtosis
			
				input.apical.rallratio.dependent.kurt.type = '';
				% Either 'independent', 'singlebin' or 'doublebin'
					
				% Single Bin
				
					input.apical.rallratio.dependent.kurt.singlebin.dependent = '';
					% Either 'diameter', 'pathlength' or 'radialdistance'
						
						input.apical.rallratio.dependent.kurt.singlebin.fit = '';
						% Either 'linear', 'exponential', 'power', 'sigmoidal' or 'none'

							input.apical.rallratio.dependent.kurt.singlebin.parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.apical.rallratio.dependent.kurt.singlebin.parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.apical.rallratio.dependent.kurt.singlebin.parameter(3) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal: halfmax
							input.apical.rallratio.dependent.kurt.singlebin.parameter(4) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal:
							% steepness


% Daughter Ratio

    % Daughter Ratio dependency

        input.apical.daughterratio.mode = '';
        % Either 'independent' or 'dependent'

		% Daughter Ratio independent

			input.apical.daughterratio.distribution = '';
			% Either 'constant', 'uniform', 'normal', 'pearson', 'gamma' or 'none'
			% The gamma distribution is for 'excess' daughter ratio (ratio - 1)

				input.apical.daughterratio.const        = NaN;
				input.apical.daughterratio.min          = NaN;
				input.apical.daughterratio.mean         = NaN;
				input.apical.daughterratio.max          = NaN;
				input.apical.daughterratio.sd           = NaN;
				input.apical.daughterratio.skew         = NaN;
				input.apical.daughterratio.kurt         = NaN;
				
				input.apical.daughterratio.gamma.a      = NaN;
				input.apical.daughterratio.gamma.b      = NaN;
		
		% Daughter Ratio dependent
		
			% Daughter Ratio Mean
			
				input.apical.daughterratio.dependent.mean.type = '';
				% Either 'singlebin' or 'doublebin'
					
				% Single Bin
				
					input.apical.daughterratio.dependent.mean.singlebin.dependent = '';
					% Either 'diameter', 'pathlength' or 'radialdistance'
						
						input.apical.daughterratio.dependent.mean.singlebin.fit = ''; 
						% Either 'linear', 'exponential', 'power', 'sigmoidal' or 'none'

							input.apical.daughterratio.dependent.mean.singlebin.parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.apical.daughterratio.dependent.mean.singlebin.parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.apical.daughterratio.dependent.mean.singlebin.parameter(3) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal: halfmax
							input.apical.daughterratio.dependent.mean.singlebin.parameter(4) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal:
							% steepness
							
			% Daughter Ratio Standard Deviation
			
				input.apical.daughterratio.dependent.sd.type = '';
				% Either 'singlebin' or 'doublebin'
					
				% Single Bin
				
					input.apical.daughterratio.dependent.sd.singlebin.dependent = '';
					% Either 'diameter', 'pathlength' or 'radialdistance'
						
						input.apical.daughterratio.dependent.sd.singlebin.fit = ''; 
						% Either 'linear', 'exponential', 'power', 'sigmoidal' or 'none'

							input.apical.daughterratio.dependent.sd.singlebin.parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.apical.daughterratio.dependent.sd.singlebin.parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.apical.daughterratio.dependent.sd.singlebin.parameter(3) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal: halfmax
							input.apical.daughterratio.dependent.sd.singlebin.parameter(4) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal:
							% steepness

			% Daughter Ratio Skewness
			
				input.apical.daughterratio.dependent.skew.type = '';
				% Either 'singlebin' or 'doublebin'
					
				% Single Bin
				
					input.apical.daughterratio.dependent.skew.singlebin.dependent = '';
					% Either 'diameter', 'pathlength' or 'radialdistance'
						
						input.apical.daughterratio.dependent.skew.singlebin.fit = '';
						% Either 'linear', 'exponential', 'power', 'sigmoidal' or 'none'

							input.apical.daughterratio.dependent.skew.singlebin.parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.apical.daughterratio.dependent.skew.singlebin.parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.apical.daughterratio.dependent.skew.singlebin.parameter(3) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal: halfmax
							input.apical.daughterratio.dependent.skew.singlebin.parameter(4) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal:
							% steepness

			% Daughter Ratio Kurtosis
			
				input.apical.daughterratio.dependent.kurt.type = '';
				% Either 'singlebin' or 'doublebin'
					
				% Single Bin
				
					input.apical.daughterratio.dependent.kurt.singlebin.dependent = '';
					% Either 'diameter', 'pathlength' or 'radialdistance'
						
						input.apical.daughterratio.dependent.kurt.singlebin.fit = '';
						% Either 'linear', 'exponential', 'power', 'sigmoidal' or 'none'

							input.apical.daughterratio.dependent.kurt.singlebin.parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.apical.daughterratio.dependent.kurt.singlebin.parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.apical.daughterratio.dependent.kurt.singlebin.parameter(3) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal: halfmax
							input.apical.daughterratio.dependent.kurt.singlebin.parameter(4) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal:
							% steepness
                            
                            
