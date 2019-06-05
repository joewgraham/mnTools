% Input File for Motoneuron Generation
% ------------------------------------
% Distribution types are 'constant', 'uniform', 'normal', and 'pearson'.


% Number of cells

    input.numbercells.distribution = 'constant';

        input.numbercells.const = 3;
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

        input.xposition.const    = 0;      input.yposition.const    = 0;      input.zposition.const    = 0;
        input.xposition.min      = NaN;    input.yposition.min      = NaN;    input.zposition.min      = NaN;
        input.xposition.mean     = NaN;    input.yposition.mean     = NaN;    input.zposition.mean     = NaN;
        input.xposition.max      = NaN;    input.yposition.max      = NaN;    input.zposition.max      = NaN;
        input.xposition.sd       = NaN;    input.yposition.sd       = NaN;    input.zposition.sd       = NaN;
        input.xposition.skew     = NaN;    input.yposition.skew     = NaN;    input.zposition.skew     = NaN;
        input.xposition.kurt     = NaN;    input.yposition.kurt     = NaN;    input.zposition.kurt     = NaN;


% Soma diameter

    input.somadiameter.distribution = 'pearson';

        input.somadiameter.const    = NaN;
        input.somadiameter.min      = NaN;
        input.somadiameter.mean     = 60.60;
        input.somadiameter.max      = NaN;
        input.somadiameter.sd       = 6.802;
        input.somadiameter.skew     = -0.4371;
        input.somadiameter.kurt     = 2.024;


% Number primary dendrites

   input.numberprimarydendrites.distribution = 'pearson';

        input.numberprimarydendrites.const        = NaN;
        input.numberprimarydendrites.min          = NaN;
        input.numberprimarydendrites.mean         = 11.13;
        input.numberprimarydendrites.max          = NaN;
        input.numberprimarydendrites.sd           = 2.532;
        input.numberprimarydendrites.skew         = 0.9406;
        input.numberprimarydendrites.kurt         = 3.912;


% Primary dendrite diameters

    input.primarydendritediameter.distribution = 'pearson';

        input.primarydendritediameter.const    = NaN;
        input.primarydendritediameter.min      = NaN;
        input.primarydendritediameter.mean     = 10.59;
        input.primarydendritediameter.max      = NaN;
        input.primarydendritediameter.sd       = 4.236;
        input.primarydendritediameter.skew     = 0.6958;
        input.primarydendritediameter.kurt     = 3.565;


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

    input.mindendriticdiameter = 0.15;


% Branch Type Probability

    input.probability.branch.mode = 'doublebin';
    % Either 'pathlength', 'diameter', or 'doublebin'

    input.probability.branch.type = 'logit';
    % Either 'logit' or 'probit'

    input.probability.branch.parameter1 = -3.802e0;
    % Non-multiplicative parameter in all cases
    input.probability.branch.parameter2 = 1.282e0;
    % Multiplicative parameter if mode is not 'doublebin'
    % Diameter multiplicative parameter if mode is 'doublebin'
    input.probability.branch.parameter3 = 4.390e-4;
    % Unused if mode is not 'doublebin'
    % Path Length multiplicative parameter if mode is 'doublebin'


% Bifurcation Taper Rate

    % Bifurcation Taper Rate dependency

        input.taperrate.bifurcation.mode = 'dependent';
        % Either 'independent' or 'dependent'

		% Bifurcation Taper Rate independent

			input.taperrate.bifurcation.distribution = 'none';
			% Either 'constant', 'uniform', 'normal', 'pearson', or 'none'

				input.taperrate.bifurcation.const        = NaN;
				input.taperrate.bifurcation.min          = NaN; %-0.03410
				input.taperrate.bifurcation.mean         = NaN;
				input.taperrate.bifurcation.max          = NaN; %0.0465
				input.taperrate.bifurcation.sd           = NaN;
				input.taperrate.bifurcation.skew         = NaN;
				input.taperrate.bifurcation.kurt         = NaN; %44.148;
		
		% Bifurcation Taper Rate dependent
		
			% Bifurcation Taper Rate Mean
			
				input.taperrate.bifurcation.dependent.mean.type = 'doublebin';
				% Either 'independent', 'singlebin' or 'doublebin'
					
				% Single Bin
				
					input.taperrate.bifurcation.dependent.mean.singlebin.dependent = 'none';
					% Either 'diameter', 'pathlength' or 'radialdistance'
						
						input.taperrate.bifurcation.dependent.mean.singlebin.fit = 'none';
						% Either 'linear', 'exponential', 'power', 'sigmoidal' or 'none'

							input.taperrate.bifurcation.dependent.mean.singlebin.parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.taperrate.bifurcation.dependent.mean.singlebin.parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.taperrate.bifurcation.dependent.mean.singlebin.parameter(3) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal: halfmax
							input.taperrate.bifurcation.dependent.mean.singlebin.parameter(4) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal:
							% steepness
							
				% Double Bin
				
					input.taperrate.bifurcation.dependent.mean.doublebin.firstbin = 'diameter';
					input.taperrate.bifurcation.dependent.mean.doublebin.secondbin = 'pathlength';
					% Either 'diameter' or 'pathlength'
					
					input.taperrate.bifurcation.dependent.mean.doublebin.firstfit = 'linear';
					% Either 'linear', 'exponential', 'power' or 'sigmoid'
					
					   input.taperrate.bifurcation.dependent.mean.doublebin.parameter(1).fit = 'exponential';
						% Either 'linear, 'exponential', 'power', 'sigmoidal' or 'none'

							input.taperrate.bifurcation.dependent.mean.doublebin.parameter(1).parameter(1) = 3.537e-3;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.taperrate.bifurcation.dependent.mean.doublebin.parameter(1).parameter(2) = 2.125e-3;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.taperrate.bifurcation.dependent.mean.doublebin.parameter(1).parameter(3) = NaN;
							% Linear: N/A | Exponential: a2 | Power: N/A | Sigmoidal: halfmax
							input.taperrate.bifurcation.dependent.mean.doublebin.parameter(1).parameter(4) = NaN;
							% Linear: N/A | Exponential: b2 | Power: N/A | Sigmoidal:
							% steepness

						input.taperrate.bifurcation.dependent.mean.doublebin.parameter(2).fit = 'exponential';
						% Either 'linear, 'exponential', 'power', 'sigmoidal' or 'none'

							input.taperrate.bifurcation.dependent.mean.doublebin.parameter(2).parameter(1) = -3.073e-2;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.taperrate.bifurcation.dependent.mean.doublebin.parameter(2).parameter(2) = 8.377e-4;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.taperrate.bifurcation.dependent.mean.doublebin.parameter(2).parameter(3) = NaN;
							% Linear: N/A | Exponential: a2 | Power: N/A | Sigmoidal: halfmax
							input.taperrate.bifurcation.dependent.mean.doublebin.parameter(2).parameter(4) = NaN;
							% Linear: N/A | Exponential: b2 | Power: N/A | Sigmoidal:
							% steepness

						input.taperrate.bifurcation.dependent.mean.doublebin.parameter(3).fit = 'none';
						% Either 'linear, 'exponential', 'power', 'sigmoidal' or 'none'

							input.taperrate.bifurcation.dependent.mean.doublebin.parameter(3).parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.taperrate.bifurcation.dependent.mean.doublebin.parameter(3).parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.taperrate.bifurcation.dependent.mean.doublebin.parameter(3).parameter(3) = NaN;
							% Linear: N/A | Exponential: a2 | Power: N/A | Sigmoidal: halfmax
							input.taperrate.bifurcation.dependent.mean.doublebin.parameter(3).parameter(4) = NaN;
							% Linear: N/A | Exponential: b2 | Power: N/A | Sigmoidal:
							% steepness

						input.taperrate.bifurcation.dependent.mean.doublebin.parameter(4).fit = 'none';
						% Either 'linear, 'exponential', 'power', 'sigmoidal' or 'none'
							input.taperrate.bifurcation.dependent.mean.doublebin.parameter(4).parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.taperrate.bifurcation.dependent.mean.doublebin.parameter(4).parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.taperrate.bifurcation.dependent.mean.doublebin.parameter(4).parameter(3) = NaN;
							% Linear: N/A | Exponential: a2 | Power: N/A | Sigmoidal: halfmax
							input.taperrate.bifurcation.dependent.mean.doublebin.parameter(4).parameter(4) = NaN;
							% Linear: N/A | Exponential: b2 | Power: N/A | Sigmoidal:
							% steepness
							
			% Bifurcation Taper Rate Standard Deviation
			
				input.taperrate.bifurcation.dependent.sd.type = 'doublebin';
				% Either 'independent', 'singlebin' or 'doublebin'
					
				% Single Bin
				
					input.taperrate.bifurcation.dependent.sd.singlebin.dependent = 'none';
					% Either 'diameter', 'pathlength' or 'radialdistance'
						
						input.taperrate.bifurcation.dependent.sd.singlebin.fit = 'none';
						% Either 'linear', 'exponential', 'power', 'sigmoidal' or 'none'

							input.taperrate.bifurcation.dependent.sd.singlebin.parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.taperrate.bifurcation.dependent.sd.singlebin.parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.taperrate.bifurcation.dependent.sd.singlebin.parameter(3) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal: halfmax
							input.taperrate.bifurcation.dependent.sd.singlebin.parameter(4) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal:
							% steepness
							
				% Double Bin
				
					input.taperrate.bifurcation.dependent.sd.doublebin.firstbin = 'diameter';
					input.taperrate.bifurcation.dependent.sd.doublebin.secondbin = 'pathlength';
					% Either 'diameter' or 'pathlength'
					
					input.taperrate.bifurcation.dependent.sd.doublebin.firstfit = 'linear';
					% Either 'linear', 'exponential', 'power' or 'sigmoid'
					
					   input.taperrate.bifurcation.dependent.sd.doublebin.parameter(1).fit = 'linear';
						% Either 'linear, 'exponential', 'power', 'sigmoidal' or 'none'

							input.taperrate.bifurcation.dependent.sd.doublebin.parameter(1).parameter(1) = 3.662e-6;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.taperrate.bifurcation.dependent.sd.doublebin.parameter(1).parameter(2) = 7.111e-3;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.taperrate.bifurcation.dependent.sd.doublebin.parameter(1).parameter(3) = NaN;
							% Linear: N/A | Exponential: a2 | Power: N/A | Sigmoidal: halfmax
							input.taperrate.bifurcation.dependent.sd.doublebin.parameter(1).parameter(4) = NaN;
							% Linear: N/A | Exponential: b2 | Power: N/A | Sigmoidal:
							% steepness

						input.taperrate.bifurcation.dependent.sd.doublebin.parameter(2).fit = 'linear';
						% Either 'linear, 'exponential', 'power', 'sigmoidal' or 'none'

							input.taperrate.bifurcation.dependent.sd.doublebin.parameter(2).parameter(1) = -5.220e-5;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.taperrate.bifurcation.dependent.sd.doublebin.parameter(2).parameter(2) = 1.873e-1;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.taperrate.bifurcation.dependent.sd.doublebin.parameter(2).parameter(3) = NaN;
							% Linear: N/A | Exponential: a2 | Power: N/A | Sigmoidal: halfmax
							input.taperrate.bifurcation.dependent.sd.doublebin.parameter(2).parameter(4) = NaN;
							% Linear: N/A | Exponential: b2 | Power: N/A | Sigmoidal:
							% steepness

						input.taperrate.bifurcation.dependent.sd.doublebin.parameter(3).fit = 'none';
						% Either 'linear, 'exponential', 'power', 'sigmoidal' or 'none'

							input.taperrate.bifurcation.dependent.sd.doublebin.parameter(3).parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.taperrate.bifurcation.dependent.sd.doublebin.parameter(3).parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.taperrate.bifurcation.dependent.sd.doublebin.parameter(3).parameter(3) = NaN;
							% Linear: N/A | Exponential: a2 | Power: N/A | Sigmoidal: halfmax
							input.taperrate.bifurcation.dependent.sd.doublebin.parameter(3).parameter(4) = NaN;
							% Linear: N/A | Exponential: b2 | Power: N/A | Sigmoidal:
							% steepness

						input.taperrate.bifurcation.dependent.sd.doublebin.parameter(4).fit = 'none';
						% Either 'linear, 'exponential', 'power', 'sigmoidal' or 'none'
							input.taperrate.bifurcation.dependent.sd.doublebin.parameter(4).parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.taperrate.bifurcation.dependent.sd.doublebin.parameter(4).parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.taperrate.bifurcation.dependent.sd.doublebin.parameter(4).parameter(3) = NaN;
							% Linear: N/A | Exponential: a2 | Power: N/A | Sigmoidal: halfmax
							input.taperrate.bifurcation.dependent.sd.doublebin.parameter(4).parameter(4) = NaN;
							% Linear: N/A | Exponential: b2 | Power: N/A | Sigmoidal:
							% steepness
							
			% Bifurcation Taper Rate Skewness
			
				input.taperrate.bifurcation.dependent.skew.type = 'doublebin';
				% Either 'independent', 'singlebin' or 'doublebin'
					
				% Single Bin
				
					input.taperrate.bifurcation.dependent.skew.singlebin.dependent = 'none';
					% Either 'diameter', 'pathlength' or 'radialdistance'
						
						input.taperrate.bifurcation.dependent.skew.singlebin.fit = 'none';
						% Either 'linear', 'exponential', 'power', 'sigmoidal' or 'none'

							input.taperrate.bifurcation.dependent.skew.singlebin.parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.taperrate.bifurcation.dependent.skew.singlebin.parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.taperrate.bifurcation.dependent.skew.singlebin.parameter(3) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal: halfmax
							input.taperrate.bifurcation.dependent.skew.singlebin.parameter(4) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal:
							% steepness
							
				% Double Bin
				
					input.taperrate.bifurcation.dependent.skew.doublebin.firstbin = 'diameter';
					input.taperrate.bifurcation.dependent.skew.doublebin.secondbin = 'pathlength';
					% Either 'diameter' or 'pathlength'
					
					input.taperrate.bifurcation.dependent.skew.doublebin.firstfit = 'linear';
					% Either 'linear', 'exponential', 'power' or 'sigmoid'
					
					   input.taperrate.bifurcation.dependent.skew.doublebin.parameter(1).fit = 'linear';
						% Either 'linear, 'exponential', 'power', 'sigmoidal' or 'none'

							input.taperrate.bifurcation.dependent.skew.doublebin.parameter(1).parameter(1) = 1.181e-3;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.taperrate.bifurcation.dependent.skew.doublebin.parameter(1).parameter(2) = 1.777e-1;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.taperrate.bifurcation.dependent.skew.doublebin.parameter(1).parameter(3) = NaN;
							% Linear: N/A | Exponential: a2 | Power: N/A | Sigmoidal: halfmax
							input.taperrate.bifurcation.dependent.skew.doublebin.parameter(1).parameter(4) = NaN;
							% Linear: N/A | Exponential: b2 | Power: N/A | Sigmoidal:
							% steepness

						input.taperrate.bifurcation.dependent.skew.doublebin.parameter(2).fit = 'linear';
						% Either 'linear, 'exponential', 'power', 'sigmoidal' or 'none'

							input.taperrate.bifurcation.dependent.skew.doublebin.parameter(2).parameter(1) = -8.686e-4;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.taperrate.bifurcation.dependent.skew.doublebin.parameter(2).parameter(2) = -2.358e0;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.taperrate.bifurcation.dependent.skew.doublebin.parameter(2).parameter(3) = NaN;
							% Linear: N/A | Exponential: a2 | Power: N/A | Sigmoidal: halfmax
							input.taperrate.bifurcation.dependent.skew.doublebin.parameter(2).parameter(4) = NaN;
							% Linear: N/A | Exponential: b2 | Power: N/A | Sigmoidal:
							% steepness

						input.taperrate.bifurcation.dependent.skew.doublebin.parameter(3).fit = 'none';
						% Either 'linear, 'exponential', 'power', 'sigmoidal' or 'none'

							input.taperrate.bifurcation.dependent.skew.doublebin.parameter(3).parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.taperrate.bifurcation.dependent.skew.doublebin.parameter(3).parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.taperrate.bifurcation.dependent.skew.doublebin.parameter(3).parameter(3) = NaN;
							% Linear: N/A | Exponential: a2 | Power: N/A | Sigmoidal: halfmax
							input.taperrate.bifurcation.dependent.skew.doublebin.parameter(3).parameter(4) = NaN;
							% Linear: N/A | Exponential: b2 | Power: N/A | Sigmoidal:
							% steepness

						input.taperrate.bifurcation.dependent.skew.doublebin.parameter(4).fit = 'none';
						% Either 'linear, 'exponential', 'power', 'sigmoidal' or 'none'
							input.taperrate.bifurcation.dependent.skew.doublebin.parameter(4).parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.taperrate.bifurcation.dependent.skew.doublebin.parameter(4).parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.taperrate.bifurcation.dependent.skew.doublebin.parameter(4).parameter(3) = NaN;
							% Linear: N/A | Exponential: a2 | Power: N/A | Sigmoidal: halfmax
							input.taperrate.bifurcation.dependent.skew.doublebin.parameter(4).parameter(4) = NaN;
							% Linear: N/A | Exponential: b2 | Power: N/A | Sigmoidal:
							% steepness
							
			% Bifurcation Taper Rate Kurtosis
			
				input.taperrate.bifurcation.dependent.kurt.type = 'doublebin';
				% Either 'independent', 'singlebin' or 'doublebin'
					
				% Single Bin
				
					input.taperrate.bifurcation.dependent.kurt.singlebin.dependent = 'none';
					% Either 'diameter', 'pathlength' or 'radialdistance'
						
						input.taperrate.bifurcation.dependent.kurt.singlebin.fit = 'none';
						% Either 'linear', 'exponential', 'power', 'sigmoidal' or 'none'

							input.taperrate.bifurcation.dependent.kurt.singlebin.parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.taperrate.bifurcation.dependent.kurt.singlebin.parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.taperrate.bifurcation.dependent.kurt.singlebin.parameter(3) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal: halfmax
							input.taperrate.bifurcation.dependent.kurt.singlebin.parameter(4) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal:
							% steepness
							
				% Double Bin
				
					input.taperrate.bifurcation.dependent.kurt.doublebin.firstbin = 'diameter';
					input.taperrate.bifurcation.dependent.kurt.doublebin.secondbin = 'pathlength';
					% Either 'diameter' or 'pathlength'
					
					input.taperrate.bifurcation.dependent.kurt.doublebin.firstfit = 'linear';
					% Either 'linear', 'exponential', 'power' or 'sigmoid'
					
					   input.taperrate.bifurcation.dependent.kurt.doublebin.parameter(1).fit = 'linear';
						% Either 'linear, 'exponential', 'power', 'sigmoidal' or 'none'

							input.taperrate.bifurcation.dependent.kurt.doublebin.parameter(1).parameter(1) = 2.028e-4;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.taperrate.bifurcation.dependent.kurt.doublebin.parameter(1).parameter(2) = -7.079e-1;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.taperrate.bifurcation.dependent.kurt.doublebin.parameter(1).parameter(3) = NaN;
							% Linear: N/A | Exponential: a2 | Power: N/A | Sigmoidal: halfmax
							input.taperrate.bifurcation.dependent.kurt.doublebin.parameter(1).parameter(4) = NaN;
							% Linear: N/A | Exponential: b2 | Power: N/A | Sigmoidal:
							% steepness

						input.taperrate.bifurcation.dependent.kurt.doublebin.parameter(2).fit = 'linear';
						% Either 'linear, 'exponential', 'power', 'sigmoidal' or 'none'

							input.taperrate.bifurcation.dependent.kurt.doublebin.parameter(2).parameter(1) = -6.566e-3;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.taperrate.bifurcation.dependent.kurt.doublebin.parameter(2).parameter(2) = 1.746e1;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.taperrate.bifurcation.dependent.kurt.doublebin.parameter(2).parameter(3) = NaN;
							% Linear: N/A | Exponential: a2 | Power: N/A | Sigmoidal: halfmax
							input.taperrate.bifurcation.dependent.kurt.doublebin.parameter(2).parameter(4) = NaN;
							% Linear: N/A | Exponential: b2 | Power: N/A | Sigmoidal:
							% steepness

						input.taperrate.bifurcation.dependent.kurt.doublebin.parameter(3).fit = 'none';
						% Either 'linear, 'exponential', 'power', 'sigmoidal' or 'none'

							input.taperrate.bifurcation.dependent.kurt.doublebin.parameter(3).parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.taperrate.bifurcation.dependent.kurt.doublebin.parameter(3).parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.taperrate.bifurcation.dependent.kurt.doublebin.parameter(3).parameter(3) = NaN;
							% Linear: N/A | Exponential: a2 | Power: N/A | Sigmoidal: halfmax
							input.taperrate.bifurcation.dependent.kurt.doublebin.parameter(3).parameter(4) = NaN;
							% Linear: N/A | Exponential: b2 | Power: N/A | Sigmoidal:
							% steepness

						input.taperrate.bifurcation.dependent.kurt.doublebin.parameter(4).fit = 'none';
						% Either 'linear, 'exponential', 'power', 'sigmoidal' or 'none'
							input.taperrate.bifurcation.dependent.kurt.doublebin.parameter(4).parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.taperrate.bifurcation.dependent.kurt.doublebin.parameter(4).parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.taperrate.bifurcation.dependent.kurt.doublebin.parameter(4).parameter(3) = NaN;
							% Linear: N/A | Exponential: a2 | Power: N/A | Sigmoidal: halfmax
							input.taperrate.bifurcation.dependent.kurt.doublebin.parameter(4).parameter(4) = NaN;
							% Linear: N/A | Exponential: b2 | Power: N/A | Sigmoidal:
							% steepness
							
							
% Termination Taper Rate

    % Termination Taper Rate dependency

        input.taperrate.termination.mode = 'dependent';
        % Either 'independent' or 'dependent'

		% Termination Taper Rate independent

			input.taperrate.termination.distribution = 'none';
			% Either 'constant', 'uniform', 'normal', 'pearson', or 'none'

				input.taperrate.termination.const        = NaN;
				input.taperrate.termination.min          = NaN; %-0.008900;
				input.taperrate.termination.mean         = NaN;
				input.taperrate.termination.max          = NaN; %0.01420;
				input.taperrate.termination.sd           = NaN;
				input.taperrate.termination.skew         = NaN;
				input.taperrate.termination.kurt         = NaN; %7.815;
		
		% Termination Taper Rate dependent
		
			% Termination Taper Rate Mean
			
				input.taperrate.termination.dependent.mean.type = 'doublebin';
				% Either 'independent', 'singlebin' or 'doublebin'
					
				% Single Bin
				
					input.taperrate.termination.dependent.mean.singlebin.dependent = 'none';
					% Either 'diameter', 'pathlength' or 'radialdistance'
						
						input.taperrate.termination.dependent.mean.singlebin.fit = 'none';
						% Either 'linear', 'exponential', 'power', 'sigmoidal' or 'none'

							input.taperrate.termination.dependent.mean.singlebin.parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.taperrate.termination.dependent.mean.singlebin.parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.taperrate.termination.dependent.mean.singlebin.parameter(3) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal: halfmax
							input.taperrate.termination.dependent.mean.singlebin.parameter(4) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal:
							% steepness
							
				% Double Bin
				
					input.taperrate.termination.dependent.mean.doublebin.firstbin = 'diameter';
					input.taperrate.termination.dependent.mean.doublebin.secondbin = 'pathlength';
					% Either 'diameter' or 'pathlength'
					
					input.taperrate.termination.dependent.mean.doublebin.firstfit = 'linear';
					% Either 'linear', 'exponential', 'power' or 'sigmoid'
					
					   input.taperrate.termination.dependent.mean.doublebin.parameter(1).fit = 'power';
						% Either 'linear, 'exponential', 'power', 'sigmoidal' or 'none'

							input.taperrate.termination.dependent.mean.doublebin.parameter(1).parameter(1) = 2.995e-4;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.taperrate.termination.dependent.mean.doublebin.parameter(1).parameter(2) = 7.382e-1;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.taperrate.termination.dependent.mean.doublebin.parameter(1).parameter(3) = NaN;
							% Linear: N/A | Exponential: a2 | Power: N/A | Sigmoidal: halfmax
							input.taperrate.termination.dependent.mean.doublebin.parameter(1).parameter(4) = NaN;
							% Linear: N/A | Exponential: b2 | Power: N/A | Sigmoidal:
							% steepness

						input.taperrate.termination.dependent.mean.doublebin.parameter(2).fit = 'power';
						% Either 'linear, 'exponential', 'power', 'sigmoidal' or 'none'

							input.taperrate.termination.dependent.mean.doublebin.parameter(2).parameter(1) = -1.864e-3;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.taperrate.termination.dependent.mean.doublebin.parameter(2).parameter(2) = 5.071e-1;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.taperrate.termination.dependent.mean.doublebin.parameter(2).parameter(3) = NaN;
							% Linear: N/A | Exponential: a2 | Power: N/A | Sigmoidal: halfmax
							input.taperrate.termination.dependent.mean.doublebin.parameter(2).parameter(4) = NaN;
							% Linear: N/A | Exponential: b2 | Power: N/A | Sigmoidal:
							% steepness

						input.taperrate.termination.dependent.mean.doublebin.parameter(3).fit = 'none';
						% Either 'linear, 'exponential', 'power', 'sigmoidal' or 'none'

							input.taperrate.termination.dependent.mean.doublebin.parameter(3).parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.taperrate.termination.dependent.mean.doublebin.parameter(3).parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.taperrate.termination.dependent.mean.doublebin.parameter(3).parameter(3) = NaN;
							% Linear: N/A | Exponential: a2 | Power: N/A | Sigmoidal: halfmax
							input.taperrate.termination.dependent.mean.doublebin.parameter(3).parameter(4) = NaN;
							% Linear: N/A | Exponential: b2 | Power: N/A | Sigmoidal:
							% steepness

						input.taperrate.termination.dependent.mean.doublebin.parameter(4).fit = 'none';
						% Either 'linear, 'exponential', 'power', 'sigmoidal' or 'none'
							input.taperrate.termination.dependent.mean.doublebin.parameter(4).parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.taperrate.termination.dependent.mean.doublebin.parameter(4).parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.taperrate.termination.dependent.mean.doublebin.parameter(4).parameter(3) = NaN;
							% Linear: N/A | Exponential: a2 | Power: N/A | Sigmoidal: halfmax
							input.taperrate.termination.dependent.mean.doublebin.parameter(4).parameter(4) = NaN;
							% Linear: N/A | Exponential: b2 | Power: N/A | Sigmoidal:
							% steepness
							
			% Termination Taper Rate Standard Deviation
			
				input.taperrate.termination.dependent.sd.type = 'doublebin';
				% Either 'independent', 'singlebin' or 'doublebin'
					
				% Single Bin
				
					input.taperrate.termination.dependent.sd.singlebin.dependent = 'none';
					% Either 'diameter', 'pathlength' or 'radialdistance'
						
						input.taperrate.termination.dependent.sd.singlebin.fit = 'none';
						% Either 'linear', 'exponential', 'power', 'sigmoidal' or 'none'

							input.taperrate.termination.dependent.sd.singlebin.parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.taperrate.termination.dependent.sd.singlebin.parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.taperrate.termination.dependent.sd.singlebin.parameter(3) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal: halfmax
							input.taperrate.termination.dependent.sd.singlebin.parameter(4) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal:
							% steepness
							
				% Double Bin
				
					input.taperrate.termination.dependent.sd.doublebin.firstbin = 'diameter';
					input.taperrate.termination.dependent.sd.doublebin.secondbin = 'pathlength';
					% Either 'diameter' or 'pathlength'
					
					input.taperrate.termination.dependent.sd.doublebin.firstfit = 'exponential';
					% Either 'linear', 'exponential', 'power' or 'sigmoid'
					
					   input.taperrate.termination.dependent.sd.doublebin.parameter(1).fit = 'linear';
						% Either 'linear, 'exponential', 'power', 'sigmoidal' or 'none'

							input.taperrate.termination.dependent.sd.doublebin.parameter(1).parameter(1) = -1.324e-4;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.taperrate.termination.dependent.sd.doublebin.parameter(1).parameter(2) = 2.813e-1;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.taperrate.termination.dependent.sd.doublebin.parameter(1).parameter(3) = NaN;
							% Linear: N/A | Exponential: a2 | Power: N/A | Sigmoidal: halfmax
							input.taperrate.termination.dependent.sd.doublebin.parameter(1).parameter(4) = NaN;
							% Linear: N/A | Exponential: b2 | Power: N/A | Sigmoidal:
							% steepness

						input.taperrate.termination.dependent.sd.doublebin.parameter(2).fit = 'linear';
						% Either 'linear, 'exponential', 'power', 'sigmoidal' or 'none'

							input.taperrate.termination.dependent.sd.doublebin.parameter(2).parameter(1) = 2.881e-4;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.taperrate.termination.dependent.sd.doublebin.parameter(2).parameter(2) = -1.441e-1;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.taperrate.termination.dependent.sd.doublebin.parameter(2).parameter(3) = NaN;
							% Linear: N/A | Exponential: a2 | Power: N/A | Sigmoidal: halfmax
							input.taperrate.termination.dependent.sd.doublebin.parameter(2).parameter(4) = NaN;
							% Linear: N/A | Exponential: b2 | Power: N/A | Sigmoidal:
							% steepness

						input.taperrate.termination.dependent.sd.doublebin.parameter(3).fit = 'none';
						% Either 'linear, 'exponential', 'power', 'sigmoidal' or 'none'

							input.taperrate.termination.dependent.sd.doublebin.parameter(3).parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.taperrate.termination.dependent.sd.doublebin.parameter(3).parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.taperrate.termination.dependent.sd.doublebin.parameter(3).parameter(3) = NaN;
							% Linear: N/A | Exponential: a2 | Power: N/A | Sigmoidal: halfmax
							input.taperrate.termination.dependent.sd.doublebin.parameter(3).parameter(4) = NaN;
							% Linear: N/A | Exponential: b2 | Power: N/A | Sigmoidal:
							% steepness

						input.taperrate.termination.dependent.sd.doublebin.parameter(4).fit = 'none';
						% Either 'linear, 'exponential', 'power', 'sigmoidal' or 'none'
							input.taperrate.termination.dependent.sd.doublebin.parameter(4).parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.taperrate.termination.dependent.sd.doublebin.parameter(4).parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.taperrate.termination.dependent.sd.doublebin.parameter(4).parameter(3) = NaN;
							% Linear: N/A | Exponential: a2 | Power: N/A | Sigmoidal: halfmax
							input.taperrate.termination.dependent.sd.doublebin.parameter(4).parameter(4) = NaN;
							% Linear: N/A | Exponential: b2 | Power: N/A | Sigmoidal:
							% steepness
							
			% Termination Taper Rate Skewness
			
				input.taperrate.termination.dependent.skew.type = 'doublebin';
				% Either 'independent', 'singlebin' or 'doublebin'
					
				% Single Bin
				
					input.taperrate.termination.dependent.skew.singlebin.dependent = 'none';
					% Either 'diameter', 'pathlength' or 'radialdistance'
						
						input.taperrate.termination.dependent.skew.singlebin.fit = 'none';
						% Either 'linear', 'exponential', 'power', 'sigmoidal' or 'none'

							input.taperrate.termination.dependent.skew.singlebin.parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.taperrate.termination.dependent.skew.singlebin.parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.taperrate.termination.dependent.skew.singlebin.parameter(3) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal: halfmax
							input.taperrate.termination.dependent.skew.singlebin.parameter(4) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal:
							% steepness
							
				% Double Bin
				
					input.taperrate.termination.dependent.skew.doublebin.firstbin = 'diameter';
					input.taperrate.termination.dependent.skew.doublebin.secondbin = 'pathlength';
					% Either 'diameter' or 'pathlength'
					
					input.taperrate.termination.dependent.skew.doublebin.firstfit = 'linear';
					% Either 'linear', 'exponential', 'power' or 'sigmoid'
					
					   input.taperrate.termination.dependent.skew.doublebin.parameter(1).fit = 'linear';
						% Either 'linear, 'exponential', 'power', 'sigmoidal' or 'none'

							input.taperrate.termination.dependent.skew.doublebin.parameter(1).parameter(1) = 1.484e-3;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.taperrate.termination.dependent.skew.doublebin.parameter(1).parameter(2) = 1.717e-1;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.taperrate.termination.dependent.skew.doublebin.parameter(1).parameter(3) = NaN;
							% Linear: N/A | Exponential: a2 | Power: N/A | Sigmoidal: halfmax
							input.taperrate.termination.dependent.skew.doublebin.parameter(1).parameter(4) = NaN;
							% Linear: N/A | Exponential: b2 | Power: N/A | Sigmoidal:
							% steepness

						input.taperrate.termination.dependent.skew.doublebin.parameter(2).fit = 'linear';
						% Either 'linear, 'exponential', 'power', 'sigmoidal' or 'none'

							input.taperrate.termination.dependent.skew.doublebin.parameter(2).parameter(1) = -5.543e-4;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.taperrate.termination.dependent.skew.doublebin.parameter(2).parameter(2) = -2.628e0;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.taperrate.termination.dependent.skew.doublebin.parameter(2).parameter(3) = NaN;
							% Linear: N/A | Exponential: a2 | Power: N/A | Sigmoidal: halfmax
							input.taperrate.termination.dependent.skew.doublebin.parameter(2).parameter(4) = NaN;
							% Linear: N/A | Exponential: b2 | Power: N/A | Sigmoidal:
							% steepness

						input.taperrate.termination.dependent.skew.doublebin.parameter(3).fit = 'none';
						% Either 'linear, 'exponential', 'power', 'sigmoidal' or 'none'

							input.taperrate.termination.dependent.skew.doublebin.parameter(3).parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.taperrate.termination.dependent.skew.doublebin.parameter(3).parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.taperrate.termination.dependent.skew.doublebin.parameter(3).parameter(3) = NaN;
							% Linear: N/A | Exponential: a2 | Power: N/A | Sigmoidal: halfmax
							input.taperrate.termination.dependent.skew.doublebin.parameter(3).parameter(4) = NaN;
							% Linear: N/A | Exponential: b2 | Power: N/A | Sigmoidal:
							% steepness

						input.taperrate.termination.dependent.skew.doublebin.parameter(4).fit = 'none';
						% Either 'linear, 'exponential', 'power', 'sigmoidal' or 'none'
							input.taperrate.termination.dependent.skew.doublebin.parameter(4).parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.taperrate.termination.dependent.skew.doublebin.parameter(4).parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.taperrate.termination.dependent.skew.doublebin.parameter(4).parameter(3) = NaN;
							% Linear: N/A | Exponential: a2 | Power: N/A | Sigmoidal: halfmax
							input.taperrate.termination.dependent.skew.doublebin.parameter(4).parameter(4) = NaN;
							% Linear: N/A | Exponential: b2 | Power: N/A | Sigmoidal:
							% steepness
							
			% Termination Taper Rate Kurtosis
			
				input.taperrate.termination.dependent.kurt.type = 'doublebin';
				% Either 'independent', 'singlebin' or 'doublebin'
					
				% Single Bin
				
					input.taperrate.termination.dependent.kurt.singlebin.dependent = 'none';
					% Either 'diameter', 'pathlength' or 'radialdistance'
						
						input.taperrate.termination.dependent.kurt.singlebin.fit = 'none';
						% Either 'linear', 'exponential', 'power', 'sigmoidal' or 'none'

							input.taperrate.termination.dependent.kurt.singlebin.parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.taperrate.termination.dependent.kurt.singlebin.parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.taperrate.termination.dependent.kurt.singlebin.parameter(3) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal: halfmax
							input.taperrate.termination.dependent.kurt.singlebin.parameter(4) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal:
							% steepness
							
				% Double Bin
				
					input.taperrate.termination.dependent.kurt.doublebin.firstbin = 'diameter';
					input.taperrate.termination.dependent.kurt.doublebin.secondbin = 'pathlength';
					% Either 'diameter' or 'pathlength'
					
					input.taperrate.termination.dependent.kurt.doublebin.firstfit = 'linear';
					% Either 'linear', 'exponential', 'power' or 'sigmoid'
					
					   input.taperrate.termination.dependent.kurt.doublebin.parameter(1).fit = 'power';
						% Either 'linear, 'exponential', 'power', 'sigmoidal' or 'none'

							input.taperrate.termination.dependent.kurt.doublebin.parameter(1).parameter(1) = -1.402e-2;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.taperrate.termination.dependent.kurt.doublebin.parameter(1).parameter(2) = 9.382e-1;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.taperrate.termination.dependent.kurt.doublebin.parameter(1).parameter(3) = NaN;
							% Linear: N/A | Exponential: a2 | Power: N/A | Sigmoidal: halfmax
							input.taperrate.termination.dependent.kurt.doublebin.parameter(1).parameter(4) = NaN;
							% Linear: N/A | Exponential: b2 | Power: N/A | Sigmoidal:
							% steepness

						input.taperrate.termination.dependent.kurt.doublebin.parameter(2).fit = 'power';
						% Either 'linear, 'exponential', 'power', 'sigmoidal' or 'none'

							input.taperrate.termination.dependent.kurt.doublebin.parameter(2).parameter(1) = 2.129e0;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.taperrate.termination.dependent.kurt.doublebin.parameter(2).parameter(2) = 4.257e-1;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.taperrate.termination.dependent.kurt.doublebin.parameter(2).parameter(3) = NaN;
							% Linear: N/A | Exponential: a2 | Power: N/A | Sigmoidal: halfmax
							input.taperrate.termination.dependent.kurt.doublebin.parameter(2).parameter(4) = NaN;
							% Linear: N/A | Exponential: b2 | Power: N/A | Sigmoidal:
							% steepness

						input.taperrate.termination.dependent.kurt.doublebin.parameter(3).fit = 'none';
						% Either 'linear, 'exponential', 'power', 'sigmoidal' or 'none'

							input.taperrate.termination.dependent.kurt.doublebin.parameter(3).parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.taperrate.termination.dependent.kurt.doublebin.parameter(3).parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.taperrate.termination.dependent.kurt.doublebin.parameter(3).parameter(3) = NaN;
							% Linear: N/A | Exponential: a2 | Power: N/A | Sigmoidal: halfmax
							input.taperrate.termination.dependent.kurt.doublebin.parameter(3).parameter(4) = NaN;
							% Linear: N/A | Exponential: b2 | Power: N/A | Sigmoidal:
							% steepness

						input.taperrate.termination.dependent.kurt.doublebin.parameter(4).fit = 'none';
						% Either 'linear, 'exponential', 'power', 'sigmoidal' or 'none'
							input.taperrate.termination.dependent.kurt.doublebin.parameter(4).parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.taperrate.termination.dependent.kurt.doublebin.parameter(4).parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.taperrate.termination.dependent.kurt.doublebin.parameter(4).parameter(3) = NaN;
							% Linear: N/A | Exponential: a2 | Power: N/A | Sigmoidal: halfmax
							input.taperrate.termination.dependent.kurt.doublebin.parameter(4).parameter(4) = NaN;
							% Linear: N/A | Exponential: b2 | Power: N/A | Sigmoidal:
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
				
				input.piecebifprob.dependent.mean.type = 'doublebin';
				% Either 'singlebin' or 'doublebin'
					
				% Single Bin
				
					input.piecebifprob.dependent.singlebin.dependent = 'none';
					% Either 'diameter', 'pathlength' or 'radialdistance'
						
						input.piecebifprob.dependent.singlebin.fit = 'none';
						% Either 'linear', 'exponential', 'power', 'sigmoidal' or 'none'

							input.piecebifprob.dependent.singlebin.parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.piecebifprob.dependent.singlebin.parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.piecebifprob.dependent.singlebin.parameter(3) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal: halfmax
							input.piecebifprob.dependent.singlebin.parameter(4) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal:
							% steepness
							
				% Double Bin
				
					input.piecebifprob.dependent.doublebin.firstbin = 'pathlength';
					input.piecebifprob.dependent.doublebin.secondbin = 'diameter';
					% Either 'diameter' or 'pathlength'
					
					input.piecebifprob.dependent.doublebin.firstfit = 'power';
					% Either 'linear', 'exponential', 'power' or 'sigmoid'
					
					   input.piecebifprob.dependent.doublebin.parameter(1).fit = 'power';
						% Either 'linear, 'exponential', 'power', 'sigmoidal' or 'none'

							input.piecebifprob.dependent.doublebin.parameter(1).parameter(1) = 7.566e-2;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.piecebifprob.dependent.doublebin.parameter(1).parameter(2) = -2.615e0;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.piecebifprob.dependent.doublebin.parameter(1).parameter(3) = NaN;
							% Linear: N/A | Exponential: a2 | Power: N/A | Sigmoidal: halfmax
							input.piecebifprob.dependent.doublebin.parameter(1).parameter(4) = NaN;
							% Linear: N/A | Exponential: b2 | Power: N/A | Sigmoidal:
							% steepness

						input.piecebifprob.dependent.doublebin.parameter(2).fit = 'power';
						% Either 'linear, 'exponential', 'power', 'sigmoidal' or 'none'

							input.piecebifprob.dependent.doublebin.parameter(2).parameter(1) = -4.572e-1;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.piecebifprob.dependent.doublebin.parameter(2).parameter(2) = -1.642e-1;
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
				
				input.piecetermprob.dependent.mean.type = 'doublebin';
				% Either 'singlebin' or 'doublebin'
					
				% Single Bin
				
					input.piecetermprob.dependent.singlebin.dependent = 'none';
					% Either 'diameter', 'pathlength' or 'radialdistance'
						
						input.piecetermprob.dependent.singlebin.fit = 'none';
						% Either 'linear', 'exponential', 'power', 'sigmoidal' or 'none'

							input.piecetermprob.dependent.singlebin.parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.piecetermprob.dependent.singlebin.parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.piecetermprob.dependent.singlebin.parameter(3) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal: halfmax
							input.piecetermprob.dependent.singlebin.parameter(4) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal:
							% steepness
							
				% Double Bin
				
					input.piecetermprob.dependent.doublebin.firstbin = 'diameter';
					input.piecetermprob.dependent.doublebin.secondbin = 'pathlength';
					% Either 'diameter' or 'pathlength'
					
					input.piecetermprob.dependent.doublebin.firstfit = 'power';
					% Either 'linear', 'exponential', 'power' or 'sigmoid'
					
					   input.piecetermprob.dependent.doublebin.parameter(1).fit = 'power';
						% Either 'linear, 'exponential', 'power', 'sigmoidal' or 'none'

							input.piecetermprob.dependent.doublebin.parameter(1).parameter(1) = 1.283e-3;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.piecetermprob.dependent.doublebin.parameter(1).parameter(2) = 1.897e-1;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.piecetermprob.dependent.doublebin.parameter(1).parameter(3) = NaN;
							% Linear: N/A | Exponential: a2 | Power: N/A | Sigmoidal: halfmax
							input.piecetermprob.dependent.doublebin.parameter(1).parameter(4) = NaN;
							% Linear: N/A | Exponential: b2 | Power: N/A | Sigmoidal:
							% steepness

						input.piecetermprob.dependent.doublebin.parameter(2).fit = 'power';
						% Either 'linear, 'exponential', 'power', 'sigmoidal' or 'none'

							input.piecetermprob.dependent.doublebin.parameter(2).parameter(1) = -2.256e0;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.piecetermprob.dependent.doublebin.parameter(2).parameter(2) = 1.447e-2;
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

	input.rallratio.rallexponent = 2.0;

    % Rall Ratio dependency

        input.rallratio.mode = 'dependent';
        % Either 'independent' or 'dependent'

		% Rall Ratio independent

			input.rallratio.distribution = 'none';
			% Either 'constant', 'uniform', 'normal', 'pearson', or 'none'

				input.rallratio.const        = NaN;
				input.rallratio.min          = NaN; %0.2031;
				input.rallratio.mean         = NaN; %1.004;
				input.rallratio.max          = NaN; %8.000;
				input.rallratio.sd           = NaN; %0.4836;
				input.rallratio.skew         = NaN; %6.098;
				input.rallratio.kurt         = NaN; %76.16;
		
		% Rall Ratio dependent
		
			% Rall Ratio Mean
			
				input.rallratio.dependent.mean.type = 'doublebin';
				% Either 'independent', 'singlebin' or 'doublebin'
					
				% Single Bin
				
					input.rallratio.dependent.mean.singlebin.dependent = 'none';
					% Either 'diameter', 'pathlength' or 'radialdistance'
						
						input.rallratio.dependent.mean.singlebin.fit = 'none';
						% Either 'linear', 'exponential', 'power', 'sigmoidal' or 'none'

							input.rallratio.dependent.mean.singlebin.parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.rallratio.dependent.mean.singlebin.parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.rallratio.dependent.mean.singlebin.parameter(3) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal: halfmax
							input.rallratio.dependent.mean.singlebin.parameter(4) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal:
							% steepness
							
				% Double Bin
				
					input.rallratio.dependent.mean.doublebin.firstbin = 'diameter';
					input.rallratio.dependent.mean.doublebin.secondbin = 'pathlength';
					% Either 'none', 'diameter' or 'pathlength'
					
					input.rallratio.dependent.mean.doublebin.firstfit = 'power';
					% Either 'none', 'linear', 'exponential', 'power' or 'sigmoid'
					
					   input.rallratio.dependent.mean.doublebin.parameter(1).fit = 'power';
						% Either 'linear, 'exponential', 'power', 'sigmoidal' or 'none'

							input.rallratio.dependent.mean.doublebin.parameter(1).parameter(1) = 3.067e-1;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.rallratio.dependent.mean.doublebin.parameter(1).parameter(2) = 2.936e-1;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.rallratio.dependent.mean.doublebin.parameter(1).parameter(3) = NaN;
							% Linear: N/A | Exponential: a2 | Power: N/A | Sigmoidal: halfmax
							input.rallratio.dependent.mean.doublebin.parameter(1).parameter(4) = NaN;
							% Linear: N/A | Exponential: b2 | Power: N/A | Sigmoidal:
							% steepness

						input.rallratio.dependent.mean.doublebin.parameter(2).fit = 'power';
						% Either 'linear, 'exponential', 'power', 'sigmoidal' or 'none'

							input.rallratio.dependent.mean.doublebin.parameter(2).parameter(1) = -1.307e-4;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.rallratio.dependent.mean.doublebin.parameter(2).parameter(2) = 1.219e0;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.rallratio.dependent.mean.doublebin.parameter(2).parameter(3) = NaN;
							% Linear: N/A | Exponential: a2 | Power: N/A | Sigmoidal: halfmax
							input.rallratio.dependent.mean.doublebin.parameter(2).parameter(4) = NaN;
							% Linear: N/A | Exponential: b2 | Power: N/A | Sigmoidal:
							% steepness

						input.rallratio.dependent.mean.doublebin.parameter(3).fit = 'none';
						% Either 'linear, 'exponential', 'power', 'sigmoidal' or 'none'

							input.rallratio.dependent.mean.doublebin.parameter(3).parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.rallratio.dependent.mean.doublebin.parameter(3).parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.rallratio.dependent.mean.doublebin.parameter(3).parameter(3) = NaN;
							% Linear: N/A | Exponential: a2 | Power: N/A | Sigmoidal: halfmax
							input.rallratio.dependent.mean.doublebin.parameter(3).parameter(4) = NaN;
							% Linear: N/A | Exponential: b2 | Power: N/A | Sigmoidal:
							% steepness

						input.rallratio.dependent.mean.doublebin.parameter(4).fit = 'none';
						% Either 'linear, 'exponential', 'power', 'sigmoidal' or 'none'
							input.rallratio.dependent.mean.doublebin.parameter(4).parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.rallratio.dependent.mean.doublebin.parameter(4).parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.rallratio.dependent.mean.doublebin.parameter(4).parameter(3) = NaN;
							% Linear: N/A | Exponential: a2 | Power: N/A | Sigmoidal: halfmax
							input.rallratio.dependent.mean.doublebin.parameter(4).parameter(4) = NaN;
							% Linear: N/A | Exponential: b2 | Power: N/A | Sigmoidal:
							% steepness
							
			% Rall Ratio Standard Deviation
			
				input.rallratio.dependent.sd.type = 'doublebin';
				% Either 'independent', 'singlebin' or 'doublebin'
					
				% Single Bin
				
					input.rallratio.dependent.sd.singlebin.dependent = 'none';
					% Either 'diameter', 'pathlength' or 'radialdistance'
						
						input.rallratio.dependent.sd.singlebin.fit = 'none';
						% Either 'linear', 'exponential', 'power', 'sigmoidal' or 'none'

							input.rallratio.dependent.sd.singlebin.parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.rallratio.dependent.sd.singlebin.parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.rallratio.dependent.sd.singlebin.parameter(3) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal: halfmax
							input.rallratio.dependent.sd.singlebin.parameter(4) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal:
							% steepness
							
				% Double Bin
				
					input.rallratio.dependent.sd.doublebin.firstbin = 'diameter';
					input.rallratio.dependent.sd.doublebin.secondbin = 'pathlength';
					% Either 'diameter' or 'pathlength'
					
					input.rallratio.dependent.sd.doublebin.firstfit = 'exponential';
					% Either 'linear', 'exponential', 'power' or 'sigmoid'
					
					   input.rallratio.dependent.sd.doublebin.parameter(1).fit = 'exponential';
						% Either 'linear, 'exponential', 'power', 'sigmoidal' or 'none'

							input.rallratio.dependent.sd.doublebin.parameter(1).parameter(1) = 2.088e-1;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.rallratio.dependent.sd.doublebin.parameter(1).parameter(2) = 1.245e-3;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.rallratio.dependent.sd.doublebin.parameter(1).parameter(3) = NaN;
							% Linear: N/A | Exponential: a2 | Power: N/A | Sigmoidal: halfmax
							input.rallratio.dependent.sd.doublebin.parameter(1).parameter(4) = NaN;
							% Linear: N/A | Exponential: b2 | Power: N/A | Sigmoidal:
							% steepness

						input.rallratio.dependent.sd.doublebin.parameter(2).fit = 'exponential';
						% Either 'linear, 'exponential', 'power', 'sigmoidal' or 'none'

							input.rallratio.dependent.sd.doublebin.parameter(2).parameter(1) = -2.030e-2;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.rallratio.dependent.sd.doublebin.parameter(2).parameter(2) = 2.084e-3;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.rallratio.dependent.sd.doublebin.parameter(2).parameter(3) = NaN;
							% Linear: N/A | Exponential: a2 | Power: N/A | Sigmoidal: halfmax
							input.rallratio.dependent.sd.doublebin.parameter(2).parameter(4) = NaN;
							% Linear: N/A | Exponential: b2 | Power: N/A | Sigmoidal:
							% steepness

						input.rallratio.dependent.sd.doublebin.parameter(3).fit = 'none';
						% Either 'linear, 'exponential', 'power', 'sigmoidal' or 'none'

							input.rallratio.dependent.sd.doublebin.parameter(3).parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.rallratio.dependent.sd.doublebin.parameter(3).parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.rallratio.dependent.sd.doublebin.parameter(3).parameter(3) = NaN;
							% Linear: N/A | Exponential: a2 | Power: N/A | Sigmoidal: halfmax
							input.rallratio.dependent.sd.doublebin.parameter(3).parameter(4) = NaN;
							% Linear: N/A | Exponential: b2 | Power: N/A | Sigmoidal:
							% steepness

						input.rallratio.dependent.sd.doublebin.parameter(4).fit = 'none';
						% Either 'linear, 'exponential', 'power', 'sigmoidal' or 'none'
							input.rallratio.dependent.sd.doublebin.parameter(4).parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.rallratio.dependent.sd.doublebin.parameter(4).parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.rallratio.dependent.sd.doublebin.parameter(4).parameter(3) = NaN;
							% Linear: N/A | Exponential: a2 | Power: N/A | Sigmoidal: halfmax
							input.rallratio.dependent.sd.doublebin.parameter(4).parameter(4) = NaN;
							% Linear: N/A | Exponential: b2 | Power: N/A | Sigmoidal:
							% steepness
							
			% Rall Ratio Skewness
			
				input.rallratio.dependent.skew.type = 'doublebin';
				% Either 'independent', 'singlebin' or 'doublebin'
					
				% Single Bin
				
					input.rallratio.dependent.skew.singlebin.dependent = 'none';
					% Either 'diameter', 'pathlength' or 'radialdistance'
						
						input.rallratio.dependent.skew.singlebin.fit = 'none';
						% Either 'linear', 'exponential', 'power', 'sigmoidal' or 'none'

							input.rallratio.dependent.skew.singlebin.parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.rallratio.dependent.skew.singlebin.parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.rallratio.dependent.skew.singlebin.parameter(3) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal: halfmax
							input.rallratio.dependent.skew.singlebin.parameter(4) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal:
							% steepness
							
				% Double Bin
				
					input.rallratio.dependent.skew.doublebin.firstbin = 'diameter';
					input.rallratio.dependent.skew.doublebin.secondbin = 'pathlength';
					% Either 'diameter' or 'pathlength'none
					
					input.rallratio.dependent.skew.doublebin.firstfit = 'linear';
					% Either 'linear', 'exponential', 'power' or 'sigmoid'
					
					   input.rallratio.dependent.skew.doublebin.parameter(1).fit = 'linear';
						% Either 'linear, 'exponential', 'power', 'sigmoidal' or 'none'

							input.rallratio.dependent.skew.doublebin.parameter(1).parameter(1) = 8.303e-4;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.rallratio.dependent.skew.doublebin.parameter(1).parameter(2) = -3.471e-1;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.rallratio.dependent.skew.doublebin.parameter(1).parameter(3) = NaN;
							% Linear: N/A | Exponential: a2 | Power: N/A | Sigmoidal: halfmax
							input.rallratio.dependent.skew.doublebin.parameter(1).parameter(4) = NaN;
							% Linear: N/A | Exponential: b2 | Power: N/A | Sigmoidal:
							% steepness

						input.rallratio.dependent.skew.doublebin.parameter(2).fit = 'linear';
						% Either 'linear, 'exponential', 'power', 'sigmoidal' or 'none'

							input.rallratio.dependent.skew.doublebin.parameter(2).parameter(1) = -2.905e-3;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.rallratio.dependent.skew.doublebin.parameter(2).parameter(2) = 1.833e0;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.rallratio.dependent.skew.doublebin.parameter(2).parameter(3) = NaN;
							% Linear: N/A | Exponential: a2 | Power: N/A | Sigmoidal: halfmax
							input.rallratio.dependent.skew.doublebin.parameter(2).parameter(4) = NaN;
							% Linear: N/A | Exponential: b2 | Power: N/A | Sigmoidal:
							% steepness

						input.rallratio.dependent.skew.doublebin.parameter(3).fit = 'none';
						% Either 'linear, 'exponential', 'power', 'sigmoidal' or 'none'

							input.rallratio.dependent.skew.doublebin.parameter(3).parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.rallratio.dependent.skew.doublebin.parameter(3).parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.rallratio.dependent.skew.doublebin.parameter(3).parameter(3) = NaN;
							% Linear: N/A | Exponential: a2 | Power: N/A | Sigmoidal: halfmax
							input.rallratio.dependent.skew.doublebin.parameter(3).parameter(4) = NaN;
							% Linear: N/A | Exponential: b2 | Power: N/A | Sigmoidal:
							% steepness

						input.rallratio.dependent.skew.doublebin.parameter(4).fit = 'none';
						% Either 'linear, 'exponential', 'power', 'sigmoidal' or 'none'
							input.rallratio.dependent.skew.doublebin.parameter(4).parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.rallratio.dependent.skew.doublebin.parameter(4).parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.rallratio.dependent.skew.doublebin.parameter(4).parameter(3) = NaN;
							% Linear: N/A | Exponential: a2 | Power: N/A | Sigmoidal: halfmax
							input.rallratio.dependent.skew.doublebin.parameter(4).parameter(4) = NaN;
							% Linear: N/A | Exponential: b2 | Power: N/A | Sigmoidal:
							% steepness
							
			% Rall Ratio Kurtosis
			
				input.rallratio.dependent.kurt.type = 'doublebin';
				% Either 'independent', 'singlebin' or 'doublebin'
					
				% Single Bin
				
					input.rallratio.dependent.kurt.singlebin.dependent = 'none';
					% Either 'diameter', 'pathlength' or 'radialdistance'
						
						input.rallratio.dependent.kurt.singlebin.fit = 'none';
						% Either 'linear', 'exponential', 'power', 'sigmoidal' or 'none'

							input.rallratio.dependent.kurt.singlebin.parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.rallratio.dependent.kurt.singlebin.parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.rallratio.dependent.kurt.singlebin.parameter(3) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal: halfmax
							input.rallratio.dependent.kurt.singlebin.parameter(4) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal:
							% steepness
							
				% Double Bin
				
					input.rallratio.dependent.kurt.doublebin.firstbin = 'diameter';
					input.rallratio.dependent.kurt.doublebin.secondbin = 'pathlength';
					% Either 'diameter' or 'pathlength'
					
					input.rallratio.dependent.kurt.doublebin.firstfit = 'linear';
					% Either 'linear', 'exponential', 'power' or 'sigmoid'
					
					   input.rallratio.dependent.kurt.doublebin.parameter(1).fit = 'linear';
						% Either 'linear, 'exponential', 'power', 'sigmoidal' or 'none'

							input.rallratio.dependent.kurt.doublebin.parameter(1).parameter(1) = 5.256e-4;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.rallratio.dependent.kurt.doublebin.parameter(1).parameter(2) = -2.173e-1;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.rallratio.dependent.kurt.doublebin.parameter(1).parameter(3) = NaN;
							% Linear: N/A | Exponential: a2 | Power: N/A | Sigmoidal: halfmax
							input.rallratio.dependent.kurt.doublebin.parameter(1).parameter(4) = NaN;
							% Linear: N/A | Exponential: b2 | Power: N/A | Sigmoidal:
							% steepness

						input.rallratio.dependent.kurt.doublebin.parameter(2).fit = 'linear';
						% Either 'linear, 'exponential', 'power', 'sigmoidal' or 'none'

							input.rallratio.dependent.kurt.doublebin.parameter(2).parameter(1) = -1.726e-3;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.rallratio.dependent.kurt.doublebin.parameter(2).parameter(2) = 3.919e0;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.rallratio.dependent.kurt.doublebin.parameter(2).parameter(3) = NaN;
							% Linear: N/A | Exponential: a2 | Power: N/A | Sigmoidal: halfmax
							input.rallratio.dependent.kurt.doublebin.parameter(2).parameter(4) = NaN;
							% Linear: N/A | Exponential: b2 | Power: N/A | Sigmoidal:
							% steepness

						input.rallratio.dependent.kurt.doublebin.parameter(3).fit = 'none';
						% Either 'linear, 'exponential', 'power', 'sigmoidal' or 'none'

							input.rallratio.dependent.kurt.doublebin.parameter(3).parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.rallratio.dependent.kurt.doublebin.parameter(3).parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.rallratio.dependent.kurt.doublebin.parameter(3).parameter(3) = NaN;
							% Linear: N/A | Exponential: a2 | Power: N/A | Sigmoidal: halfmax
							input.rallratio.dependent.kurt.doublebin.parameter(3).parameter(4) = NaN;
							% Linear: N/A | Exponential: b2 | Power: N/A | Sigmoidal:
							% steepness

						input.rallratio.dependent.kurt.doublebin.parameter(4).fit = 'none';
						% Either 'linear, 'exponential', 'power', 'sigmoidal' or 'none'
							input.rallratio.dependent.kurt.doublebin.parameter(4).parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.rallratio.dependent.kurt.doublebin.parameter(4).parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.rallratio.dependent.kurt.doublebin.parameter(4).parameter(3) = NaN;
							% Linear: N/A | Exponential: a2 | Power: N/A | Sigmoidal: halfmax
							input.rallratio.dependent.kurt.doublebin.parameter(4).parameter(4) = NaN;
							% Linear: N/A | Exponential: b2 | Power: N/A | Sigmoidal:
							% steepness
							
							
% Daughter Ratio

    % Daughter Ratio dependency

        input.daughterratio.mode = 'dependent';
        % Either 'independent' or 'dependent'

		% Daughter Ratio independent

			input.daughterratio.distribution = 'none';
			% Either 'constant', 'uniform', 'normal', 'pearson', or 'none'

				input.daughterratio.const        = NaN;
				input.daughterratio.min          = NaN; 1;
				input.daughterratio.mean         = NaN; 1.818;
				input.daughterratio.max          = NaN; 9.000;
				input.daughterratio.sd           = NaN; 0.9752;
				input.daughterratio.skew         = NaN; 2.900;
				input.daughterratio.kurt         = NaN; 15.47;
		
		% Daughter Ratio dependent
		
			% Daughter Ratio Mean
			
				input.daughterratio.dependent.mean.type = 'doublebin';
				% Either 'singlebin' or 'doublebin'
					
				% Single Bin
				
					input.daughterratio.dependent.mean.singlebin.dependent = 'none';
					% Either 'diameter', 'pathlength' or 'radialdistance'
						
						input.daughterratio.dependent.mean.singlebin.fit = 'none';
						% Either 'linear', 'exponential', 'power', 'sigmoidal' or 'none'

							input.daughterratio.dependent.mean.singlebin.parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.daughterratio.dependent.mean.singlebin.parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.daughterratio.dependent.mean.singlebin.parameter(3) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal: halfmax
							input.daughterratio.dependent.mean.singlebin.parameter(4) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal:
							% steepness
							
				% Double Bin
				
					input.daughterratio.dependent.mean.doublebin.firstbin = 'diameter';
					input.daughterratio.dependent.mean.doublebin.secondbin = 'pathlength';
					% Either 'diameter' or 'pathlength'
					
					input.daughterratio.dependent.mean.doublebin.firstfit = 'linear';
					% Either 'linear', 'exponential', 'power' or 'sigmoid'
					
					   input.daughterratio.dependent.mean.doublebin.parameter(1).fit = 'linear';
						% Either 'linear, 'exponential', 'power', 'sigmoidal' or 'none'

							input.daughterratio.dependent.mean.doublebin.parameter(1).parameter(1) = -4.960e-5;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.daughterratio.dependent.mean.doublebin.parameter(1).parameter(2) = 4.116e-2;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.daughterratio.dependent.mean.doublebin.parameter(1).parameter(3) = NaN;
							% Linear: N/A | Exponential: a2 | Power: N/A | Sigmoidal: halfmax
							input.daughterratio.dependent.mean.doublebin.parameter(1).parameter(4) = NaN;
							% Linear: N/A | Exponential: b2 | Power: N/A | Sigmoidal:
							% steepness

						input.daughterratio.dependent.mean.doublebin.parameter(2).fit = 'linear';
						% Either 'linear, 'exponential', 'power', 'sigmoidal' or 'none'

							input.daughterratio.dependent.mean.doublebin.parameter(2).parameter(1) = 3.554e-4;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.daughterratio.dependent.mean.doublebin.parameter(2).parameter(2) = 2.194e0;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.daughterratio.dependent.mean.doublebin.parameter(2).parameter(3) = NaN;
							% Linear: N/A | Exponential: a2 | Power: N/A | Sigmoidal: halfmax
							input.daughterratio.dependent.mean.doublebin.parameter(2).parameter(4) = NaN;
							% Linear: N/A | Exponential: b2 | Power: N/A | Sigmoidal:
							% steepness

						input.daughterratio.dependent.mean.doublebin.parameter(3).fit = 'none';
						% Either 'linear, 'exponential', 'power', 'sigmoidal' or 'none'

							input.daughterratio.dependent.mean.doublebin.parameter(3).parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.daughterratio.dependent.mean.doublebin.parameter(3).parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.daughterratio.dependent.mean.doublebin.parameter(3).parameter(3) = NaN;
							% Linear: N/A | Exponential: a2 | Power: N/A | Sigmoidal: halfmax
							input.daughterratio.dependent.mean.doublebin.parameter(3).parameter(4) = NaN;
							% Linear: N/A | Exponential: b2 | Power: N/A | Sigmoidal:
							% steepness

						input.daughterratio.dependent.mean.doublebin.parameter(4).fit = 'none';
						% Either 'linear, 'exponential', 'power', 'sigmoidal' or 'none'
							input.daughterratio.dependent.mean.doublebin.parameter(4).parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.daughterratio.dependent.mean.doublebin.parameter(4).parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.daughterratio.dependent.mean.doublebin.parameter(4).parameter(3) = NaN;
							% Linear: N/A | Exponential: a2 | Power: N/A | Sigmoidal: halfmax
							input.daughterratio.dependent.mean.doublebin.parameter(4).parameter(4) = NaN;
							% Linear: N/A | Exponential: b2 | Power: N/A | Sigmoidal:
							% steepness
							
			% Daughter Ratio Standard Deviation
			
				input.daughterratio.dependent.sd.type = 'doublebin';
				% Either 'singlebin' or 'doublebin'
					
				% Single Bin
				
					input.daughterratio.dependent.sd.singlebin.dependent = 'none';
					% Either 'diameter', 'pathlength' or 'radialdistance'
						
						input.daughterratio.dependent.sd.singlebin.fit = 'none';
						% Either 'linear', 'exponential', 'power', 'sigmoidal' or 'none'

							input.daughterratio.dependent.sd.singlebin.parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.daughterratio.dependent.sd.singlebin.parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.daughterratio.dependent.sd.singlebin.parameter(3) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal: halfmax
							input.daughterratio.dependent.sd.singlebin.parameter(4) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal:
							% steepness
							
				% Double Bin
				
					input.daughterratio.dependent.sd.doublebin.firstbin = 'diameter';
					input.daughterratio.dependent.sd.doublebin.secondbin = 'pathlength';
					% Either 'diameter' or 'pathlength'
					
					input.daughterratio.dependent.sd.doublebin.firstfit = 'exponential';
					% Either 'linear', 'exponential', 'power' or 'sigmoid'
					
					   input.daughterratio.dependent.sd.doublebin.parameter(1).fit = 'exponential';
						% Either 'linear, 'exponential', 'power', 'sigmoidal' or 'none'

							input.daughterratio.dependent.sd.doublebin.parameter(1).parameter(1) = 1.373e0;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.daughterratio.dependent.sd.doublebin.parameter(1).parameter(2) = -5.819e-5;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.daughterratio.dependent.sd.doublebin.parameter(1).parameter(3) = NaN;
							% Linear: N/A | Exponential: a2 | Power: N/A | Sigmoidal: halfmax
							input.daughterratio.dependent.sd.doublebin.parameter(1).parameter(4) = NaN;
							% Linear: N/A | Exponential: b2 | Power: N/A | Sigmoidal:
							% steepness

						input.daughterratio.dependent.sd.doublebin.parameter(2).fit = 'exponential';
						% Either 'linear, 'exponential', 'power', 'sigmoidal' or 'none'

							input.daughterratio.dependent.sd.doublebin.parameter(2).parameter(1) = 4.900e1;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.daughterratio.dependent.sd.doublebin.parameter(2).parameter(2) = -5.219e1;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.daughterratio.dependent.sd.doublebin.parameter(2).parameter(3) = NaN;
							% Linear: N/A | Exponential: a2 | Power: N/A | Sigmoidal: halfmax
							input.daughterratio.dependent.sd.doublebin.parameter(2).parameter(4) = NaN;
							% Linear: N/A | Exponential: b2 | Power: N/A | Sigmoidal:
							% steepness

						input.daughterratio.dependent.sd.doublebin.parameter(3).fit = 'none';
						% Either 'linear, 'exponential', 'power', 'sigmoidal' or 'none'

							input.daughterratio.dependent.sd.doublebin.parameter(3).parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.daughterratio.dependent.sd.doublebin.parameter(3).parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.daughterratio.dependent.sd.doublebin.parameter(3).parameter(3) = NaN;
							% Linear: N/A | Exponential: a2 | Power: N/A | Sigmoidal: halfmax
							input.daughterratio.dependent.sd.doublebin.parameter(3).parameter(4) = NaN;
							% Linear: N/A | Exponential: b2 | Power: N/A | Sigmoidal:
							% steepness

						input.daughterratio.dependent.sd.doublebin.parameter(4).fit = 'none';
						% Either 'linear, 'exponential', 'power', 'sigmoidal' or 'none'
							input.daughterratio.dependent.sd.doublebin.parameter(4).parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.daughterratio.dependent.sd.doublebin.parameter(4).parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.daughterratio.dependent.sd.doublebin.parameter(4).parameter(3) = NaN;
							% Linear: N/A | Exponential: a2 | Power: N/A | Sigmoidal: halfmax
							input.daughterratio.dependent.sd.doublebin.parameter(4).parameter(4) = NaN;
							% Linear: N/A | Exponential: b2 | Power: N/A | Sigmoidal:
							% steepness
							
			% Daughter Ratio Skewness
			
				input.daughterratio.dependent.skew.type = 'doublebin';
				% Either 'singlebin' or 'doublebin'
					
				% Single Bin
				
					input.daughterratio.dependent.skew.singlebin.dependent = 'none';
					% Either 'diameter', 'pathlength' or 'radialdistance'
						
						input.daughterratio.dependent.skew.singlebin.fit = 'none';
						% Either 'linear', 'exponential', 'power', 'sigmoidal' or 'none'

							input.daughterratio.dependent.skew.singlebin.parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.daughterratio.dependent.skew.singlebin.parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.daughterratio.dependent.skew.singlebin.parameter(3) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal: halfmax
							input.daughterratio.dependent.skew.singlebin.parameter(4) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal:
							% steepness
							
				% Double Bin
				
					input.daughterratio.dependent.skew.doublebin.firstbin = 'diameter';
					input.daughterratio.dependent.skew.doublebin.secondbin = 'pathlength';
					% Either 'diameter' or 'pathlength'
					
					input.daughterratio.dependent.skew.doublebin.firstfit = 'linear';
					% Either 'linear', 'exponential', 'power' or 'sigmoid'
					
					   input.daughterratio.dependent.skew.doublebin.parameter(1).fit = 'linear';
						% Either 'linear, 'exponential', 'power', 'sigmoidal' or 'none'

							input.daughterratio.dependent.skew.doublebin.parameter(1).parameter(1) = -3.912e-4;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.daughterratio.dependent.skew.doublebin.parameter(1).parameter(2) = 6.653e-2;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.daughterratio.dependent.skew.doublebin.parameter(1).parameter(3) = NaN;
							% Linear: N/A | Exponential: a2 | Power: N/A | Sigmoidal: halfmax
							input.daughterratio.dependent.skew.doublebin.parameter(1).parameter(4) = NaN;
							% Linear: N/A | Exponential: b2 | Power: N/A | Sigmoidal:
							% steepness

						input.daughterratio.dependent.skew.doublebin.parameter(2).fit = 'linear';
						% Either 'linear, 'exponential', 'power', 'sigmoidal' or 'none'

							input.daughterratio.dependent.skew.doublebin.parameter(2).parameter(1) = 1.059e-3;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.daughterratio.dependent.skew.doublebin.parameter(2).parameter(2) = 1.513e0;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.daughterratio.dependent.skew.doublebin.parameter(2).parameter(3) = NaN;
							% Linear: N/A | Exponential: a2 | Power: N/A | Sigmoidal: halfmax
							input.daughterratio.dependent.skew.doublebin.parameter(2).parameter(4) = NaN;
							% Linear: N/A | Exponential: b2 | Power: N/A | Sigmoidal:
							% steepness

						input.daughterratio.dependent.skew.doublebin.parameter(3).fit = 'none';
						% Either 'linear, 'exponential', 'power', 'sigmoidal' or 'none'

							input.daughterratio.dependent.skew.doublebin.parameter(3).parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.daughterratio.dependent.skew.doublebin.parameter(3).parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.daughterratio.dependent.skew.doublebin.parameter(3).parameter(3) = NaN;
							% Linear: N/A | Exponential: a2 | Power: N/A | Sigmoidal: halfmax
							input.daughterratio.dependent.skew.doublebin.parameter(3).parameter(4) = NaN;
							% Linear: N/A | Exponential: b2 | Power: N/A | Sigmoidal:
							% steepness

						input.daughterratio.dependent.skew.doublebin.parameter(4).fit = 'none';
						% Either 'linear, 'exponential', 'power', 'sigmoidal' or 'none'
							input.daughterratio.dependent.skew.doublebin.parameter(4).parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.daughterratio.dependent.skew.doublebin.parameter(4).parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.daughterratio.dependent.skew.doublebin.parameter(4).parameter(3) = NaN;
							% Linear: N/A | Exponential: a2 | Power: N/A | Sigmoidal: halfmax
							input.daughterratio.dependent.skew.doublebin.parameter(4).parameter(4) = NaN;
							% Linear: N/A | Exponential: b2 | Power: N/A | Sigmoidal:
							% steepness
							
			% Daughter Ratio Kurtosis
			
				input.daughterratio.dependent.kurt.type = 'doublebin';
				% Either 'singlebin' or 'doublebin'
					
				% Single Bin
				
					input.daughterratio.dependent.kurt.singlebin.dependent = 'none';
					% Either 'diameter', 'pathlength' or 'radialdistance'
						
						input.daughterratio.dependent.kurt.singlebin.fit = 'none';
						% Either 'linear', 'exponential', 'power', 'sigmoidal' or 'none'

							input.daughterratio.dependent.kurt.singlebin.parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.daughterratio.dependent.kurt.singlebin.parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.daughterratio.dependent.kurt.singlebin.parameter(3) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal: halfmax
							input.daughterratio.dependent.kurt.singlebin.parameter(4) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal:
							% steepness
							
				% Double Bin
				
					input.daughterratio.dependent.kurt.doublebin.firstbin = 'diameter';
					input.daughterratio.dependent.kurt.doublebin.secondbin = 'pathlength';
					% Either 'diameter' or 'pathlength'
					
					input.daughterratio.dependent.kurt.doublebin.firstfit = 'linear';
					% Either 'linear', 'exponential', 'power' or 'sigmoid'
					
					   input.daughterratio.dependent.kurt.doublebin.parameter(1).fit = 'linear';
						% Either 'linear, 'exponential', 'power', 'sigmoidal' or 'none'

							input.daughterratio.dependent.kurt.doublebin.parameter(1).parameter(1) = 2.346e-4;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.daughterratio.dependent.kurt.doublebin.parameter(1).parameter(2) = -3.874e-1;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.daughterratio.dependent.kurt.doublebin.parameter(1).parameter(3) = NaN;
							% Linear: N/A | Exponential: a2 | Power: N/A | Sigmoidal: halfmax
							input.daughterratio.dependent.kurt.doublebin.parameter(1).parameter(4) = NaN;
							% Linear: N/A | Exponential: b2 | Power: N/A | Sigmoidal:
							% steepness

						input.daughterratio.dependent.kurt.doublebin.parameter(2).fit = 'linear';
						% Either 'linear, 'exponential', 'power', 'sigmoidal' or 'none'

							input.daughterratio.dependent.kurt.doublebin.parameter(2).parameter(1) = -1.679e-3;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.daughterratio.dependent.kurt.doublebin.parameter(2).parameter(2) = 8.006e0;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.daughterratio.dependent.kurt.doublebin.parameter(2).parameter(3) = NaN;
							% Linear: N/A | Exponential: a2 | Power: N/A | Sigmoidal: halfmax
							input.daughterratio.dependent.kurt.doublebin.parameter(2).parameter(4) = NaN;
							% Linear: N/A | Exponential: b2 | Power: N/A | Sigmoidal:
							% steepness

						input.daughterratio.dependent.kurt.doublebin.parameter(3).fit = 'none';
						% Either 'linear, 'exponential', 'power', 'sigmoidal' or 'none'

							input.daughterratio.dependent.kurt.doublebin.parameter(3).parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.daughterratio.dependent.kurt.doublebin.parameter(3).parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.daughterratio.dependent.kurt.doublebin.parameter(3).parameter(3) = NaN;
							% Linear: N/A | Exponential: a2 | Power: N/A | Sigmoidal: halfmax
							input.daughterratio.dependent.kurt.doublebin.parameter(3).parameter(4) = NaN;
							% Linear: N/A | Exponential: b2 | Power: N/A | Sigmoidal:
							% steepness

						input.daughterratio.dependent.kurt.doublebin.parameter(4).fit = 'none';
						% Either 'linear, 'exponential', 'power', 'sigmoidal' or 'none'
							input.daughterratio.dependent.kurt.doublebin.parameter(4).parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.daughterratio.dependent.kurt.doublebin.parameter(4).parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.daughterratio.dependent.kurt.doublebin.parameter(4).parameter(3) = NaN;
							% Linear: N/A | Exponential: a2 | Power: N/A | Sigmoidal: halfmax
							input.daughterratio.dependent.kurt.doublebin.parameter(4).parameter(4) = NaN;
							% Linear: N/A | Exponential: b2 | Power: N/A | Sigmoidal:
							% steepness