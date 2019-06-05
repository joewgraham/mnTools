% Input File for Motoneuron Generation
% ------------------------------------
% Distribution types are 'constant', 'uniform', 'normal', and 'pearson'.


% Number of cells

    input.numbercells.distribution = 'constant';

        input.numbercells.const = 6;
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

    input.somadiameter.distribution = 'constant';
	% 'constant', 'uniform', 'normal', 'pearson', or 'preset'

        input.somadiameter.const    = 0;
        input.somadiameter.min      = NaN;
        input.somadiameter.mean     = NaN;
        input.somadiameter.max      = NaN;
        input.somadiameter.sd       = NaN;
        input.somadiameter.skew     = NaN;
        input.somadiameter.kurt     = NaN;
		
		input.somadiameter.preset   = [NaN]; 

% Number primary dendrites

   input.numberprimarydendrites.distribution = 'constant';
   % 'constant', 'uniform', 'normal', 'pearson', or 'preset'

        input.numberprimarydendrites.const        = 1;
        input.numberprimarydendrites.min          = NaN;
        input.numberprimarydendrites.mean         = NaN;
        input.numberprimarydendrites.max          = NaN;
        input.numberprimarydendrites.sd           = NaN;
        input.numberprimarydendrites.skew         = NaN;
        input.numberprimarydendrites.kurt         = NaN;
		
		input.numberprimarydendrites.preset       = [NaN]; 

% Primary dendrite diameters

    input.primarydendritediameter.distribution = 'normal';
	% 'constant', 'uniform', 'normal', 'pearson', or 'preset'

        input.primarydendritediameter.const    = NaN;
        input.primarydendritediameter.min      = 5;
        input.primarydendritediameter.mean     = 5.7;
        input.primarydendritediameter.max      = 8;
        input.primarydendritediameter.sd       = 0.7211;
        input.primarydendritediameter.skew     = NaN;
        input.primarydendritediameter.kurt     = NaN;
		
		input.primarydendritediameter.preset{1} = [NaN];
				

% Piece length

    input.piecelength.distribution = 'constant';

        input.piecelength.const    = 5;
        input.piecelength.min      = NaN;
        input.piecelength.mean     = NaN;
        input.piecelength.max      = NaN;
        input.piecelength.sd       = NaN;
        input.piecelength.skew     = NaN;
        input.piecelength.kurt     = NaN;


% Meander angle

     input.meanderangle.distribution = 'uniform';

        input.meanderangle.const    = NaN;
        input.meanderangle.min      = -1;
        input.meanderangle.mean     = NaN;
        input.meanderangle.max      = 1;
        input.meanderangle.sd       = NaN;
        input.meanderangle.skew     = NaN;
        input.meanderangle.kurt     = NaN;


% Minimum dendritic diameter

    input.mindendriticdiameter = 2.000e-1;


% Branch Type Probability

    input.probability.branch.mode = 'diameter'; 
    % Either 'pathlength', 'diameter', 'diameterpathlength', or 'diameterbranchorder'

	input.probability.branch.mindiameter = NaN; 
	% Minimum value for bifurcation
	% Either NaN or numeric value
	
	input.probability.branch.maxpathlength = NaN; 
	% Maximum value for bifurcation
	% Either NaN or numeric value
	
	input.probability.branch.maxbranchorder = NaN; 
	% Maximum value for bifurcation
	% Either NaN or numeric value
	
    input.probability.branch.type = 'probit';
    % Either 'logit', 'probit', 'comploglog', or 'loglog'

    input.probability.branch.parameter1 = -1.533e0; 
    % Non-multiplicative parameter in all cases
    input.probability.branch.parameter2 = 1.195e0; 
    % Multiplicative parameter if mode is not doublebin
    % Diameter multiplicative parameter if mode is doublebin
    input.probability.branch.parameter3 = NaN; 
    % Unused if mode is not doublebin
    % Second bin multiplicative parameter if mode is doublebin


% Bifurcation Taper Rate

    % Bifurcation Taper Rate dependency
	
		input.taperrate.bifurcation.by = 'diameter';
        % Either 'diameter', 'surfacearea', or 'volume'

        input.taperrate.bifurcation.mode = 'dependent';
        % Either 'independent' or 'dependent'

		% Bifurcation Taper Rate independent

			input.taperrate.bifurcation.distribution = 'none';
			% Either 'constant', 'uniform', 'normal', 'pearson', or 'none'

				input.taperrate.bifurcation.const        = NaN;
				input.taperrate.bifurcation.min          = NaN; 
				input.taperrate.bifurcation.mean         = NaN;
				input.taperrate.bifurcation.max          = NaN; 
				input.taperrate.bifurcation.sd           = NaN;
				input.taperrate.bifurcation.skew         = NaN; 
				input.taperrate.bifurcation.kurt         = NaN;
		
		% Bifurcation Taper Rate dependent
		
			% Bifurcation Taper Rate Mean
			
				input.taperrate.bifurcation.dependent.mean.type = 'singlebin';
				% Either 'independent', 'singlebin' or 'doublebin'
					
				% Single Bin
				
					input.taperrate.bifurcation.dependent.mean.singlebin.dependent = 'pathlength';       
					% Either 'diameter', 'pathlength' or 'radialdistance'
						
						input.taperrate.bifurcation.dependent.mean.singlebin.fit = 'linear'; %uw
						% Either 'linear', 'exponential', 'power', 'sigmoidal' or 'none'

							input.taperrate.bifurcation.dependent.mean.singlebin.parameter(1) = 4.762e-5;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.taperrate.bifurcation.dependent.mean.singlebin.parameter(2) = -1.604e-2;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.taperrate.bifurcation.dependent.mean.singlebin.parameter(3) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal: halfmax
							input.taperrate.bifurcation.dependent.mean.singlebin.parameter(4) = NaN; 
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal:
							% steepness
							
			% Bifurcation Taper Rate Standard Deviation
			
				input.taperrate.bifurcation.dependent.sd.type = 'singlebin';
				% Either 'independent', 'singlebin' or 'doublebin'
					
				% Single Bin
				
					input.taperrate.bifurcation.dependent.sd.singlebin.dependent = 'pathlength';
					% Either 'diameter', 'pathlength' or 'radialdistance'
						
						input.taperrate.bifurcation.dependent.sd.singlebin.fit = 'exponential'; %off uw
						% Either 'linear', 'exponential', 'power', 'sigmoidal' or 'none'

							input.taperrate.bifurcation.dependent.sd.singlebin.parameter(1) = 1.436e-1; 
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.taperrate.bifurcation.dependent.sd.singlebin.parameter(2) = -1.198e-2;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.taperrate.bifurcation.dependent.sd.singlebin.parameter(3) = 3.248e-2;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal: halfmax
							input.taperrate.bifurcation.dependent.sd.singlebin.parameter(4) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal:
							% steepness
							
			% Bifurcation Taper Rate Skewness
			
				input.taperrate.bifurcation.dependent.skew.type = 'singlebin';
				% Either 'independent', 'singlebin' or 'doublebin'
					
				% Single Bin
				
					input.taperrate.bifurcation.dependent.skew.singlebin.dependent = 'pathlength';
					% Either 'diameter', 'pathlength' or 'radialdistance'
						
						input.taperrate.bifurcation.dependent.skew.singlebin.fit = 'power'; %off wt 
						% Either 'linear', 'exponential', 'power', 'sigmoidal' or 'none'

							input.taperrate.bifurcation.dependent.skew.singlebin.parameter(1) = -1.613e-2; 
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.taperrate.bifurcation.dependent.skew.singlebin.parameter(2) = 1.015e0; 
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.taperrate.bifurcation.dependent.skew.singlebin.parameter(3) = -1.820e0;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal: halfmax
							input.taperrate.bifurcation.dependent.skew.singlebin.parameter(4) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal:
							% steepness

			% Bifurcation Taper Rate Kurtosis
			
				input.taperrate.bifurcation.dependent.kurt.type = 'singlebin';
				% Either 'independent', 'singlebin' or 'doublebin'
					
				% Single Bin
				
					input.taperrate.bifurcation.dependent.kurt.singlebin.dependent = 'pathlength';
					% Either 'diameter', 'pathlength' or 'radialdistance'
						
						input.taperrate.bifurcation.dependent.kurt.singlebin.fit = 'linear'; %uw
						% Either 'linear', 'exponential', 'power', 'sigmoidal' or 'none'

							input.taperrate.bifurcation.dependent.kurt.singlebin.parameter(1) = 1.640e-1;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.taperrate.bifurcation.dependent.kurt.singlebin.parameter(2) = 1.568e1;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.taperrate.bifurcation.dependent.kurt.singlebin.parameter(3) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal: halfmax
							input.taperrate.bifurcation.dependent.kurt.singlebin.parameter(4) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal:
							% steepness

							
% Termination Taper Rate

    % Termination Taper Rate dependency
	
		input.taperrate.termination.by = 'diameter';
        % Either 'diameter', 'surfacearea', or 'volume'

        input.taperrate.termination.mode = 'dependent';
        % Either 'independent' or 'dependent'

		% Termination Taper Rate independent

			input.taperrate.termination.distribution = 'none';
			% Either 'constant', 'uniform', 'normal', 'pearson', or 'none'

				input.taperrate.termination.const        = NaN;
				input.taperrate.termination.min          = NaN; 
				input.taperrate.termination.mean         = NaN;
				input.taperrate.termination.max          = NaN; 
				input.taperrate.termination.sd           = NaN;
				input.taperrate.termination.skew         = NaN; 
				input.taperrate.termination.kurt         = NaN; 
		
		% Termination Taper Rate dependent
		
			% Termination Taper Rate Mean
			
				input.taperrate.termination.dependent.mean.type = 'singlebin';
				% Either 'independent', 'singlebin' or 'doublebin'
					
				% Single Bin
				
					input.taperrate.termination.dependent.mean.singlebin.dependent = 'diameter';
					% Either 'diameter', 'pathlength' or 'radialdistance'
						
						input.taperrate.termination.dependent.mean.singlebin.fit = 'power'; %off uw
						% Either 'linear', 'exponential', 'power', 'sigmoidal' or 'none'

							input.taperrate.termination.dependent.mean.singlebin.parameter(1) = 4.406e-3; 
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.taperrate.termination.dependent.mean.singlebin.parameter(2) = 2.113e0;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.taperrate.termination.dependent.mean.singlebin.parameter(3) = -1.264e-3;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal: halfmax
							input.taperrate.termination.dependent.mean.singlebin.parameter(4) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal:
							% steepness
							
			% Termination Taper Rate Standard Deviation
			
				input.taperrate.termination.dependent.sd.type = 'singlebin';
				% Either 'independent', 'singlebin' or 'doublebin'
					
				% Single Bin
				
					input.taperrate.termination.dependent.sd.singlebin.dependent = 'diameter';
					% Either 'diameter', 'pathlength' or 'radialdistance'
						
						input.taperrate.termination.dependent.sd.singlebin.fit = 'exponential'; %off uw
						% Either 'linear', 'exponential', 'power', 'sigmoidal' or 'none'

							input.taperrate.termination.dependent.sd.singlebin.parameter(1) = 1.429e-3; 
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.taperrate.termination.dependent.sd.singlebin.parameter(2) = 1.835e0;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.taperrate.termination.dependent.sd.singlebin.parameter(3) = 5.377e-3;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal: halfmax
							input.taperrate.termination.dependent.sd.singlebin.parameter(4) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal:
							% steepness

			% Termination Taper Rate Skewness
			
				input.taperrate.termination.dependent.skew.type = 'singlebin';
				% Either 'independent', 'singlebin' or 'doublebin'
					
				% Single Bin
				
					input.taperrate.termination.dependent.skew.singlebin.dependent = 'diameter';
					% Either 'diameter', 'pathlength' or 'radialdistance'
						
						input.taperrate.termination.dependent.skew.singlebin.fit = 'power'; %off uw
						% Either 'linear', 'exponential', 'power', 'sigmoidal' or 'none'

							input.taperrate.termination.dependent.skew.singlebin.parameter(1) = 9.199e2;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.taperrate.termination.dependent.skew.singlebin.parameter(2) = 5.224e-3;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.taperrate.termination.dependent.skew.singlebin.parameter(3) = -9.198e2;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal: halfmax
							input.taperrate.termination.dependent.skew.singlebin.parameter(4) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal:
							% steepness

			% Termination Taper Rate Kurtosis
			
				input.taperrate.termination.dependent.kurt.type = 'singlebin';
				% Either 'independent', 'singlebin' or 'doublebin'
					
				% Single Bin
				
					input.taperrate.termination.dependent.kurt.singlebin.dependent = 'diameter';
					% Either 'diameter', 'pathlength' or 'radialdistance'
						
						input.taperrate.termination.dependent.kurt.singlebin.fit = 'exponential'; %uw (exp off has lower rmse, but goes negative)
						% Either 'linear', 'exponential', 'power', 'sigmoidal' or 'none'

							input.taperrate.termination.dependent.kurt.singlebin.parameter(1) = 7.368e1;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.taperrate.termination.dependent.kurt.singlebin.parameter(2) = -8.732e-1;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.taperrate.termination.dependent.kurt.singlebin.parameter(3) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal: halfmax
							input.taperrate.termination.dependent.kurt.singlebin.parameter(4) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal:
							% steepness
							
							
% Piece Bifurcation Probability

    % Piece Bifurcation Probability dependency

        input.piecebifprob.mode = 'dependent';
        % Either 'independent' or 'dependent'

		% Piece Bifurcation Probability independent

			input.piecebifprob.distribution = 'none';
			% Either 'constant', 'uniform', 'normal', 'pearson', or 'none'

				input.piecebifprob.const        = NaN;
				input.piecebifprob.min          = NaN;
				input.piecebifprob.mean         = NaN;
				input.piecebifprob.max          = NaN;
				input.piecebifprob.sd           = NaN;
				input.piecebifprob.skew         = NaN;
				input.piecebifprob.kurt         = NaN;
		
		% Piece Bifurcation Probability dependent
		
			% Piece Bifurcation Probability
				
				input.piecebifprob.dependent.mean.by = 'volume';
				% Either 'length', 'surface area' or 'volume'
				
				input.piecebifprob.dependent.mean.type = 'singlebin';
				% Either 'singlebin' or 'doublebin'
					
				% Single Bin
				
					input.piecebifprob.dependent.singlebin.dependent = 'diameter';
					% Either 'diameter', 'pathlength', 'radialdistance' or 'branchlength'
						
						input.piecebifprob.dependent.singlebin.fit = 'power'; %off rb
						% Either 'linear', 'exponential', 'power', 'sigmoidal' or 'none'

							input.piecebifprob.dependent.singlebin.parameter(1) = 1.258e-1;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.piecebifprob.dependent.singlebin.parameter(2) = -2.312e0;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.piecebifprob.dependent.singlebin.parameter(3) = 1.560e-3;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal: halfmax
							input.piecebifprob.dependent.singlebin.parameter(4) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal:
							% steepness
							
				% Double Bin
				
					input.piecebifprob.dependent.doublebin.firstbin = 'none';
					input.piecebifprob.dependent.doublebin.secondbin = 'none';
					% Either 'diameter', 'pathlength', 'branchlength' or 'branchorder'
					
					input.piecebifprob.dependent.doublebin.firstfit = 'none';
					% Either 'linear', 'exponential', 'power' or 'sigmoid'
					
					   input.piecebifprob.dependent.doublebin.parameter(1).fit = 'none';
						% Either 'linear, 'exponential', 'power', 'sigmoidal' or 'none'

							input.piecebifprob.dependent.doublebin.parameter(1).parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.piecebifprob.dependent.doublebin.parameter(1).parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.piecebifprob.dependent.doublebin.parameter(1).parameter(3) = NaN;
							% Linear: N/A | Exponential: a2 | Power: N/A | Sigmoidal: halfmax
							input.piecebifprob.dependent.doublebin.parameter(1).parameter(4) = NaN;
							% Linear: N/A | Exponential: b2 | Power: N/A | Sigmoidal:
							% steepness

						input.piecebifprob.dependent.doublebin.parameter(2).fit = 'none';
						% Either 'linear, 'exponential', 'power', 'sigmoidal' or 'none'

							input.piecebifprob.dependent.doublebin.parameter(2).parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.piecebifprob.dependent.doublebin.parameter(2).parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.piecebifprob.dependent.doublebin.parameter(2).parameter(3) = NaN;
							% Linear: N/A | Exponential: a2 | Power: N/A | Sigmoidal: halfmax
							input.piecebifprob.dependent.doublebin.parameter(2).parameter(4) = NaN;
							% Linear: N/A | Exponential: b2 | Power: N/A | Sigmoidal:
							% steepness

						input.piecebifprob.dependent.doublebin.parameter(3).fit = 'none';
						% Either 'linear, 'exponential', 'power', 'sigmoidal' or 'none'

							input.piecebifprob.dependent.doublebin.parameter(3).parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.piecebifprob.dependent.doublebin.parameter(3).parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.piecebifprob.dependent.doublebin.parameter(3).parameter(3) = NaN;
							% Linear: N/A | Exponential: a2 | Power: N/A | Sigmoidal: halfmax
							input.piecebifprob.dependent.doublebin.parameter(3).parameter(4) = NaN;
							% Linear: N/A | Exponential: b2 | Power: N/A | Sigmoidal:
							% steepness

						input.piecebifprob.dependent.doublebin.parameter(4).fit = 'none';
						% Either 'linear, 'exponential', 'power', 'sigmoidal' or 'none'
							input.piecebifprob.dependent.doublebin.parameter(4).parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.piecebifprob.dependent.doublebin.parameter(4).parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.piecebifprob.dependent.doublebin.parameter(4).parameter(3) = NaN;
							% Linear: N/A | Exponential: a2 | Power: N/A | Sigmoidal: halfmax
							input.piecebifprob.dependent.doublebin.parameter(4).parameter(4) = NaN;
							% Linear: N/A | Exponential: b2 | Power: N/A | Sigmoidal:
							% steepness
							
							
% Piece Termination Probability

    % Piece Termination Probability dependency

        input.piecetermprob.mode = 'dependent';
        % Either 'independent' or 'dependent'

		% Piece Termination Probability independent

			input.piecetermprob.distribution = 'none';
			% Either 'constant', 'uniform', 'normal', 'pearson', or 'none'

				input.piecetermprob.const        = NaN;
				input.piecetermprob.min          = NaN;
				input.piecetermprob.mean         = NaN;
				input.piecetermprob.max          = NaN;
				input.piecetermprob.sd           = NaN;
				input.piecetermprob.skew         = NaN;
				input.piecetermprob.kurt         = NaN;
		
		% Piece Termination Probability dependent
		
			% Piece Termination Probability
			
				input.piecetermprob.dependent.mean.by = 'volume';
				% Either 'length', 'surface area' or 'volume'
				
				input.piecetermprob.dependent.mean.type = 'singlebin';
				% Either 'singlebin' or 'doublebin'
					
				% Single Bin
				
					input.piecetermprob.dependent.singlebin.dependent = 'diameter';
					% Either 'diameter', 'pathlength' or 'radialdistance'
						
						input.piecetermprob.dependent.singlebin.fit = 'exponential'; %off uw
						% Either 'linear', 'exponential', 'power', 'sigmoidal' or 'none'

							input.piecetermprob.dependent.singlebin.parameter(1) = 4.428e0;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.piecetermprob.dependent.singlebin.parameter(2) = -4.095e0;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.piecetermprob.dependent.singlebin.parameter(3) = 2.805e-2;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal: halfmax
							input.piecetermprob.dependent.singlebin.parameter(4) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal:
							% steepness
							
				% Double Bin
				
					input.piecetermprob.dependent.doublebin.firstbin = 'none';
					input.piecetermprob.dependent.doublebin.secondbin = 'none';
					% Either 'diameter' or 'pathlength'
					
					input.piecetermprob.dependent.doublebin.firstfit = 'none';
					% Either 'linear', 'exponential', 'power' or 'sigmoid'
					
					   input.piecetermprob.dependent.doublebin.parameter(1).fit = 'none';
						% Either 'linear, 'exponential', 'power', 'sigmoidal' or 'none'

							input.piecetermprob.dependent.doublebin.parameter(1).parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.piecetermprob.dependent.doublebin.parameter(1).parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.piecetermprob.dependent.doublebin.parameter(1).parameter(3) = NaN;
							% Linear: N/A | Exponential: a2 | Power: N/A | Sigmoidal: halfmax
							input.piecetermprob.dependent.doublebin.parameter(1).parameter(4) = NaN;
							% Linear: N/A | Exponential: b2 | Power: N/A | Sigmoidal:
							% steepness

						input.piecetermprob.dependent.doublebin.parameter(2).fit = 'none';
						% Either 'linear, 'exponential', 'power', 'sigmoidal' or 'none'

							input.piecetermprob.dependent.doublebin.parameter(2).parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.piecetermprob.dependent.doublebin.parameter(2).parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.piecetermprob.dependent.doublebin.parameter(2).parameter(3) = NaN;
							% Linear: N/A | Exponential: a2 | Power: N/A | Sigmoidal: halfmax
							input.piecetermprob.dependent.doublebin.parameter(2).parameter(4) = NaN;
							% Linear: N/A | Exponential: b2 | Power: N/A | Sigmoidal:
							% steepness

						input.piecetermprob.dependent.doublebin.parameter(3).fit = 'none';
						% Either 'linear, 'exponential', 'power', 'sigmoidal' or 'none'

							input.piecetermprob.dependent.doublebin.parameter(3).parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.piecetermprob.dependent.doublebin.parameter(3).parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.piecetermprob.dependent.doublebin.parameter(3).parameter(3) = NaN;
							% Linear: N/A | Exponential: a2 | Power: N/A | Sigmoidal: halfmax
							input.piecetermprob.dependent.doublebin.parameter(3).parameter(4) = NaN;
							% Linear: N/A | Exponential: b2 | Power: N/A | Sigmoidal:
							% steepness

						input.piecetermprob.dependent.doublebin.parameter(4).fit = 'none';
						% Either 'linear, 'exponential', 'power', 'sigmoidal' or 'none'
							input.piecetermprob.dependent.doublebin.parameter(4).parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.piecetermprob.dependent.doublebin.parameter(4).parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.piecetermprob.dependent.doublebin.parameter(4).parameter(3) = NaN;
							% Linear: N/A | Exponential: a2 | Power: N/A | Sigmoidal: halfmax
							input.piecetermprob.dependent.doublebin.parameter(4).parameter(4) = NaN;
							% Linear: N/A | Exponential: b2 | Power: N/A | Sigmoidal:
							% steepness
							
							
% Daughter direction

    input.daughterangle.distribution = 'uniform';

        input.daughterangle.const    = NaN;
        input.daughterangle.min      = -45;
        input.daughterangle.mean     = NaN;
        input.daughterangle.max      = 45;
        input.daughterangle.sd       = NaN;
        input.daughterangle.skew     = NaN;
        input.daughterangle.kurt     = NaN;

        input.daughterangle.minangle = 15;
		
		
% Rall Ratio

	input.rallratio.rallexponent = 1.5;

    % Rall Ratio dependency

        input.rallratio.mode = 'dependent';
        % Either 'independent' or 'dependent'

		% Rall Ratio independent

			input.rallratio.distribution = 'none';
			% Either 'constant', 'uniform', 'normal', 'pearson', or 'none'

				input.rallratio.const        = NaN;
				input.rallratio.min          = NaN;
				input.rallratio.mean         = NaN;
				input.rallratio.max          = NaN;
				input.rallratio.sd           = NaN; 
				input.rallratio.skew         = NaN; 
				input.rallratio.kurt         = NaN; 
		
		% Rall Ratio dependent
		
			% Rall Ratio Mean
			
				input.rallratio.dependent.mean.type = 'singlebin';
				% Either 'independent', 'singlebin' or 'doublebin'
					
				% Single Bin
				
					input.rallratio.dependent.mean.singlebin.dependent = 'diameter';
					% Either 'diameter', 'pathlength' or 'radialdistance'
						
						input.rallratio.dependent.mean.singlebin.fit = 'exponential'; %off uw
						% Either 'linear', 'exponential', 'power', 'sigmoidal' or 'none'

							input.rallratio.dependent.mean.singlebin.parameter(1) = 1.473e0;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.rallratio.dependent.mean.singlebin.parameter(2) = -6.536e-1;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.rallratio.dependent.mean.singlebin.parameter(3) = 1.009e0;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal: halfmax
							input.rallratio.dependent.mean.singlebin.parameter(4) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal:
							% steepness

			% Rall Ratio Standard Deviation
			
				input.rallratio.dependent.sd.type = 'singlebin';
				% Either 'independent', 'singlebin' or 'doublebin'
					
				% Single Bin
				
					input.rallratio.dependent.sd.singlebin.dependent = 'diameter';
					% Either 'diameter', 'pathlength' or 'radialdistance'
						
						input.rallratio.dependent.sd.singlebin.fit = 'linear'; %uw
						% Either 'linear', 'exponential', 'power', 'sigmoidal' or 'none'

							input.rallratio.dependent.sd.singlebin.parameter(1) = -4.837e-3;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.rallratio.dependent.sd.singlebin.parameter(2) = 3.887e-1;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.rallratio.dependent.sd.singlebin.parameter(3) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal: halfmax
							input.rallratio.dependent.sd.singlebin.parameter(4) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal:
							% steepness

			% Rall Ratio Skewness
			
				input.rallratio.dependent.skew.type = 'singlebin';
				% Either 'independent', 'singlebin' or 'doublebin'
					
				% Single Bin
				
					input.rallratio.dependent.skew.singlebin.dependent = 'diameter';
					% Either 'diameter', 'pathlength' or 'radialdistance'
						
						input.rallratio.dependent.skew.singlebin.fit = 'linear'; %uw 
						% Either 'linear', 'exponential', 'power', 'sigmoidal' or 'none'

							input.rallratio.dependent.skew.singlebin.parameter(1) = -3.162e-1;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.rallratio.dependent.skew.singlebin.parameter(2) = 1.830e0;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.rallratio.dependent.skew.singlebin.parameter(3) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal: halfmax
							input.rallratio.dependent.skew.singlebin.parameter(4) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal:
							% steepness

			% Rall Ratio Kurtosis
			
				input.rallratio.dependent.kurt.type = 'singlebin';
				% Either 'independent', 'singlebin' or 'doublebin'
					
				% Single Bin
				
					input.rallratio.dependent.kurt.singlebin.dependent = 'diameter';
					% Either 'diameter', 'pathlength' or 'radialdistance'
						
						input.rallratio.dependent.kurt.singlebin.fit = 'exponential'; %off uw
						% Either 'linear', 'exponential', 'power', 'sigmoidal' or 'none'

							input.rallratio.dependent.kurt.singlebin.parameter(1) = 1.046e1;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.rallratio.dependent.kurt.singlebin.parameter(2) = -8.032e-1;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.rallratio.dependent.kurt.singlebin.parameter(3) = 3.738e0;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal: halfmax
							input.rallratio.dependent.kurt.singlebin.parameter(4) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal:
							% steepness


% Daughter Ratio

    % Daughter Ratio dependency

        input.daughterratio.mode = 'dependent';
        % Either 'independent' or 'dependent'

		% Daughter Ratio independent

			input.daughterratio.distribution = 'none';
			% Either 'constant', 'uniform', 'normal', 'pearson', 'gamma' or 'none'
			% The gamma distribution is for 'excess' daughter ratio (ratio - 1)

				input.daughterratio.const        = NaN;
				input.daughterratio.min          = 1;
				input.daughterratio.mean         = NaN;
				input.daughterratio.max          = NaN;
				input.daughterratio.sd           = NaN;
				input.daughterratio.skew         = NaN;
				input.daughterratio.kurt         = NaN;
				
				input.daughterratio.gamma.a      = NaN;
				input.daughterratio.gamma.b      = NaN;
		
		% Daughter Ratio dependent
		
			% Daughter Ratio Mean
			
				input.daughterratio.dependent.mean.type = 'singlebin';
				% Either 'singlebin' or 'doublebin'
					
				% Single Bin
				
					input.daughterratio.dependent.mean.singlebin.dependent = 'diameter';
					% Either 'diameter', 'pathlength' or 'radialdistance'
						
						input.daughterratio.dependent.mean.singlebin.fit = 'linear'; %rb
						% Either 'linear', 'exponential', 'power', 'sigmoidal' or 'none'

							input.daughterratio.dependent.mean.singlebin.parameter(1) = 1.914e-1;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.daughterratio.dependent.mean.singlebin.parameter(2) = 9.530e-1;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.daughterratio.dependent.mean.singlebin.parameter(3) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal: halfmax
							input.daughterratio.dependent.mean.singlebin.parameter(4) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal:
							% steepness
							
			% Daughter Ratio Standard Deviation
			
				input.daughterratio.dependent.sd.type = 'singlebin';
				% Either 'singlebin' or 'doublebin'
					
				% Single Bin
				
					input.daughterratio.dependent.sd.singlebin.dependent = 'diameter';
					% Either 'diameter', 'pathlength' or 'radialdistance'
						
						input.daughterratio.dependent.sd.singlebin.fit = 'power'; %off uw
						% Either 'linear', 'exponential', 'power', 'sigmoidal' or 'none'

							input.daughterratio.dependent.sd.singlebin.parameter(1) = 3.627e1;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.daughterratio.dependent.sd.singlebin.parameter(2) = 4.563e-3;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.daughterratio.dependent.sd.singlebin.parameter(3) = -3.601e1;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal: halfmax
							input.daughterratio.dependent.sd.singlebin.parameter(4) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal:
							% steepness

			% Daughter Ratio Skewness
			
				input.daughterratio.dependent.skew.type = 'singlebin';
				% Either 'singlebin' or 'doublebin'
					
				% Single Bin
				
					input.daughterratio.dependent.skew.singlebin.dependent = 'diameter';
					% Either 'diameter', 'pathlength' or 'radialdistance'
						
						input.daughterratio.dependent.skew.singlebin.fit = 'exponential'; %off uw
						% Either 'linear', 'exponential', 'power', 'sigmoidal' or 'none'

							input.daughterratio.dependent.skew.singlebin.parameter(1) = 3.160e0;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.daughterratio.dependent.skew.singlebin.parameter(2) = -4.331e-1;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.daughterratio.dependent.skew.singlebin.parameter(3) = 5.001e-1;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal: halfmax
							input.daughterratio.dependent.skew.singlebin.parameter(4) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal:
							% steepness

			% Daughter Ratio Kurtosis
			
				input.daughterratio.dependent.kurt.type = 'singlebin';
				% Either 'singlebin' or 'doublebin'
					
				% Single Bin
				
					input.daughterratio.dependent.kurt.singlebin.dependent = 'diameter';
					% Either 'diameter', 'pathlength' or 'radialdistance'
						
						input.daughterratio.dependent.kurt.singlebin.fit = 'exponential'; %off uw
						% Either 'linear', 'exponential', 'power', 'sigmoidal' or 'none'

							input.daughterratio.dependent.kurt.singlebin.parameter(1) = 1.517e1;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.daughterratio.dependent.kurt.singlebin.parameter(2) = -3.576e-1;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.daughterratio.dependent.kurt.singlebin.parameter(3) = 4.853e-1;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal: halfmax
							input.daughterratio.dependent.kurt.singlebin.parameter(4) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal:
							% steepness