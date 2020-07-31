% Input File for Motoneuron Generation
% ------------------------------------
% Distribution types are 'constant', 'uniform', 'normal', and 'pearson'.


% Number of cells

    input.numbercells.distribution = 'constant';
    input.numbercells.const = 10;
        
% Soma centroid location

    input.xposition.distribution = 'constant';
    input.yposition.distribution = 'constant';
    input.zposition.distribution = 'constant';

        input.xposition.const    = 0;
		input.yposition.const    = 0;
		input.zposition.const    = 0;
    
% Soma size
    
    input.soma.shape = 'spherical';
    % 'pyramidal' or 'spherical'

    input.soma.size.parameter = 'diameter';
    % 'diameter', 'csa', or 'volume'
    
    input.soma.size.distribution = 'pearson';
	% 'constant', 'uniform', 'normal', 'pearson'

        input.soma.size.const    = NaN;
        input.soma.size.min      = 0;
        input.soma.size.mean     = 52.88;
        input.soma.size.max      = NaN;
        input.soma.size.sd       = 5.598;
        input.soma.size.skew     = 0.3918;
        input.soma.size.kurt     = 1.577;
		
% Structures to generate
    input.axon.generate     = 'n';
    input.dendrite.generate = 'y';
    input.apical.generate   = 'n';
         

% Dendrite Inputs
% -------------------------------------------------------------------------------------------------------------------------------------------------
        
% Trunk Properties

input.dendrite.numbertrunks.distribution = 'pearson';
input.dendrite.numbertrunks.dependence   = 'none';
    input.dendrite.numbertrunks.mean =  10.75;
    input.dendrite.numbertrunks.sd   =  2.217;
    input.dendrite.numbertrunks.skew =  -0.4816;
    input.dendrite.numbertrunks.kurt =  1.301;
    input.dendrite.numbertrunks.min  =  NaN;
    input.dendrite.numbertrunks.max  =  NaN;
    
%     input.dendrite.numbertrunks.parameter(1).value =  7.368e0;
%     input.dendrite.numbertrunks.parameter(2).value =  1.550e0;
%     input.dendrite.numbertrunks.parameter(3).value =  1.613e-1;
%     input.dendrite.numbertrunks.parameter(4).value =  2.487e0;
    
input.dendrite.trunkdiameter.distribution = 'pearson';
input.dendrite.trunkdiameter.dependence   = 'none';
    input.dendrite.trunkdiameter.mean =  7.368e0;
    input.dendrite.trunkdiameter.sd   =  1.550e0;
    input.dendrite.trunkdiameter.skew =  1.613e-1;
    input.dendrite.trunkdiameter.kurt =  2.487e0;
    input.dendrite.trunkdiameter.min  =  NaN;
    input.dendrite.trunkdiameter.max  =  NaN;

%    input.dendrite.trunkdiameter.parameter(1).fit              = 'power';
%        input.dendrite.trunkdiameter.parameter(1).parameter(1) =  1.155e-2;
%        input.dendrite.trunkdiameter.parameter(1).parameter(2) =  8.471e-1;    
%    input.dendrite.trunkdiameter.parameter(2).fit              = 'linear';
%        input.dendrite.trunkdiameter.parameter(2).parameter(1) =  0.000e0;
%        input.dendrite.trunkdiameter.parameter(2).parameter(2) =  6.896e-1;

input.dendrite.distancefromcentroid.distribution = 'normal';
input.dendrite.distancefromcentroid.dependence   = 'soma.diameter';
    input.dendrite.distancefromcentroid.parameter(1).fit              = 'linear';
        input.dendrite.distancefromcentroid.parameter(1).parameter(1) =  2.045e-2;
        input.dendrite.distancefromcentroid.parameter(1).parameter(2) =  5.576e0;    
    input.dendrite.distancefromcentroid.parameter(2).fit              = 'linear';
        input.dendrite.distancefromcentroid.parameter(2).parameter(1) =  0.000e0;
        input.dendrite.distancefromcentroid.parameter(2).parameter(2) =  3.135e0;

input.dendrite.elevationfromcentroid.distribution = 'pearson';
input.dendrite.elevationfromcentroid.dependence   = 'none';
    input.dendrite.elevationfromcentroid.parameter(1).value = -2.196e1;
    input.dendrite.elevationfromcentroid.parameter(2).value =  2.524e1;
    input.dendrite.elevationfromcentroid.parameter(3).value =  1.302e-1;
    input.dendrite.elevationfromcentroid.parameter(4).value =  3.102e0;
            
input.dendrite.azimuthfromcentroid.distribution = 'uniform';
input.dendrite.azimuthfromcentroid.dependence   = 'none';
    input.dendrite.azimuthfromcentroid.parameter(1).value = 0.0;
    input.dendrite.azimuthfromcentroid.parameter(2).value = 360;
    
input.dendrite.trunkelevation.distribution = 'normal';
input.dendrite.trunkelevation.dependence   = 'elevationfromcentroid';
    input.dendrite.trunkelevation.parameter(1).fit              = 'linear';
        input.dendrite.trunkelevation.parameter(1).parameter(1) =  1.000e0;
        input.dendrite.trunkelevation.parameter(1).parameter(2) = -2.579e0;    
    input.dendrite.trunkelevation.parameter(2).fit              = 'linear';
        input.dendrite.trunkelevation.parameter(2).parameter(1) =  0.000e0;
        input.dendrite.trunkelevation.parameter(2).parameter(2) =  2.175e1;
        
input.dendrite.trunkazimuth.distribution = 'normal';
input.dendrite.trunkazimuth.dependence   = 'azimuthfromcentroid';
    input.dendrite.trunkazimuth.parameter(1).fit              = 'linear';
        input.dendrite.trunkazimuth.parameter(1).parameter(1) =  1.000e0;
        input.dendrite.trunkazimuth.parameter(1).parameter(2) =  0.000e0;    
    input.dendrite.trunkazimuth.parameter(2).fit              = 'linear';
        input.dendrite.trunkazimuth.parameter(2).parameter(1) =  0.000e0;
        input.dendrite.trunkazimuth.parameter(2).parameter(2) =  4.731e1;
		

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

     input.dendrite.meanderangle.distribution = 'constant';

        input.dendrite.meanderangle.const    = 0;
        input.dendrite.meanderangle.min      = NaN;
        input.dendrite.meanderangle.mean     = NaN;
        input.dendrite.meanderangle.max      = NaN;
        input.dendrite.meanderangle.sd       = NaN;
        input.dendrite.meanderangle.skew     = NaN;
        input.dendrite.meanderangle.kurt     = NaN;


% Minimum dendritic diameter

    input.dendrite.mindiameter            = 0;
    input.dendrite.minbifurcationdiameter = 0;
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
	
    input.dendrite.probability.branch.type = 'logit';
    % Either 'logit', 'probit', 'comploglog', or 'loglog'

    input.dendrite.probability.branch.parameter1 = -1.455e0; 
    % Non-multiplicative parameter in all cases
    input.dendrite.probability.branch.parameter2 = 1.837e0; 
    % Multiplicative parameter if mode is not doublebin
    % Diameter multiplicative parameter if mode is doublebin
    input.dendrite.probability.branch.parameter3 = -1.135e-2; 
    % Unused if mode is not doublebin
    % Second bin multiplicative parameter if mode is doublebin


% Bifurcation Taper Rate

    % Bifurcation Taper Rate dependency
	
		input.dendrite.taperrate.bifurcation.mode = 'independent';
        % Either 'independent' or 'dependent'

		% Bifurcation Taper Rate independent

			input.dendrite.taperrate.bifurcation.distribution = 'constant';
			% Either 'constant', 'uniform', 'normal', 'pearson', or 'none'

				input.dendrite.taperrate.bifurcation.const        = 0;
				input.dendrite.taperrate.bifurcation.min          = NaN; 
				input.dendrite.taperrate.bifurcation.mean         = NaN;
				input.dendrite.taperrate.bifurcation.max          = NaN; 
				input.dendrite.taperrate.bifurcation.sd           = NaN;
				input.dendrite.taperrate.bifurcation.skew         = NaN; 
				input.dendrite.taperrate.bifurcation.kurt         = NaN;
		
		% Bifurcation Taper Rate dependent
		
			% Bifurcation Taper Rate Mean
			
				input.dendrite.taperrate.bifurcation.dependent.mean.type = '';
				% Either 'independent', 'singlebin' or 'doublebin'
					
				% Single Bin
				
					input.dendrite.taperrate.bifurcation.dependent.mean.singlebin.dependent = '';       
					% Either 'diameter', 'pathlength' or 'radialdistance'
						
						input.dendrite.taperrate.bifurcation.dependent.mean.singlebin.fit = '';
						% Either 'linear', 'exponential', 'power', 'sigmoidal' or 'none'

							input.dendrite.taperrate.bifurcation.dependent.mean.singlebin.parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.dendrite.taperrate.bifurcation.dependent.mean.singlebin.parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.dendrite.taperrate.bifurcation.dependent.mean.singlebin.parameter(3) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal: halfmax
							input.dendrite.taperrate.bifurcation.dependent.mean.singlebin.parameter(4) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal:
							% steepness
							
			% Bifurcation Taper Rate Standard Deviation
			
				input.dendrite.taperrate.bifurcation.dependent.sd.type = '';
				% Either 'independent', 'singlebin' or 'doublebin'
					
				% Single Bin
				
					input.dendrite.taperrate.bifurcation.dependent.sd.singlebin.dependent = '';
					% Either 'diameter', 'pathlength' or 'radialdistance'
						
						input.dendrite.taperrate.bifurcation.dependent.sd.singlebin.fit = '';
						% Either 'linear', 'exponential', 'power', 'sigmoidal' or 'none'

							input.dendrite.taperrate.bifurcation.dependent.sd.singlebin.parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.dendrite.taperrate.bifurcation.dependent.sd.singlebin.parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.dendrite.taperrate.bifurcation.dependent.sd.singlebin.parameter(3) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal: halfmax
							input.dendrite.taperrate.bifurcation.dependent.sd.singlebin.parameter(4) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal:
							% steepness
							
			% Bifurcation Taper Rate Skewness
			
				input.dendrite.taperrate.bifurcation.dependent.skew.type = '';
				% Either 'independent', 'singlebin' or 'doublebin'
					
				% Single Bin
				
					input.dendrite.taperrate.bifurcation.dependent.skew.singlebin.dependent = '';
					% Either 'diameter', 'pathlength' or 'radialdistance'
						
						input.dendrite.taperrate.bifurcation.dependent.skew.singlebin.fit = '';
						% Either 'linear', 'exponential', 'power', 'sigmoidal' or 'none'

							input.dendrite.taperrate.bifurcation.dependent.skew.singlebin.parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.dendrite.taperrate.bifurcation.dependent.skew.singlebin.parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.dendrite.taperrate.bifurcation.dependent.skew.singlebin.parameter(3) = NaN; 
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal: halfmax
							input.dendrite.taperrate.bifurcation.dependent.skew.singlebin.parameter(4) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal:
							% steepness

			% Bifurcation Taper Rate Kurtosis
			
				input.dendrite.taperrate.bifurcation.dependent.kurt.type = '';
				% Either 'independent', 'singlebin' or 'doublebin'
					
				% Single Bin
				
					input.dendrite.taperrate.bifurcation.dependent.kurt.singlebin.dependent = '';
					% Either 'diameter', 'pathlength' or 'radialdistance'
						
						input.dendrite.taperrate.bifurcation.dependent.kurt.singlebin.fit = '';
						% Either 'linear', 'exponential', 'power', 'sigmoidal' or 'none'

							input.dendrite.taperrate.bifurcation.dependent.kurt.singlebin.parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.dendrite.taperrate.bifurcation.dependent.kurt.singlebin.parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.dendrite.taperrate.bifurcation.dependent.kurt.singlebin.parameter(3) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal: halfmax
							input.dendrite.taperrate.bifurcation.dependent.kurt.singlebin.parameter(4) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal:
							% steepness

							
% Termination Taper Rate

    % Termination Taper Rate dependency
	
		input.dendrite.taperrate.termination.mode = 'independent';
        % Either 'independent' or 'dependent'

		% Termination Taper Rate independent

			input.dendrite.taperrate.termination.distribution = 'constant';
			% Either 'constant', 'uniform', 'normal', 'pearson', or 'none'

				input.dendrite.taperrate.termination.const        = 0;
				input.dendrite.taperrate.termination.min          = NaN;
				input.dendrite.taperrate.termination.mean         = NaN;
				input.dendrite.taperrate.termination.max          = NaN; 
				input.dendrite.taperrate.termination.sd           = NaN;
				input.dendrite.taperrate.termination.skew         = NaN; 
				input.dendrite.taperrate.termination.kurt         = NaN; 
		
		% Termination Taper Rate dependent
		
			% Termination Taper Rate Mean
			
				input.dendrite.taperrate.termination.dependent.mean.type = '';
				% Either 'independent', 'singlebin' or 'doublebin'
					
				% Single Bin
				
					input.dendrite.taperrate.termination.dependent.mean.singlebin.dependent = '';
					% Either 'diameter', 'pathlength' or 'radialdistance'
						
						input.dendrite.taperrate.termination.dependent.mean.singlebin.fit = '';
						% Either 'linear', 'exponential', 'power', 'sigmoidal' or 'none'

							input.dendrite.taperrate.termination.dependent.mean.singlebin.parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.dendrite.taperrate.termination.dependent.mean.singlebin.parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.dendrite.taperrate.termination.dependent.mean.singlebin.parameter(3) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal: halfmax
							input.dendrite.taperrate.termination.dependent.mean.singlebin.parameter(4) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal:
							% steepness
							
			% Termination Taper Rate Standard Deviation
			
				input.dendrite.taperrate.termination.dependent.sd.type = '';
				% Either 'independent', 'singlebin' or 'doublebin'
					
				% Single Bin
				
					input.dendrite.taperrate.termination.dependent.sd.singlebin.dependent = '';
					% Either 'diameter', 'pathlength' or 'radialdistance'
						
						input.dendrite.taperrate.termination.dependent.sd.singlebin.fit = '';
						% Either 'linear', 'exponential', 'power', 'sigmoidal' or 'none'

							input.dendrite.taperrate.termination.dependent.sd.singlebin.parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.dendrite.taperrate.termination.dependent.sd.singlebin.parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.dendrite.taperrate.termination.dependent.sd.singlebin.parameter(3) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal: halfmax
							input.dendrite.taperrate.termination.dependent.sd.singlebin.parameter(4) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal:
							% steepness

			% Termination Taper Rate Skewness
			
				input.dendrite.taperrate.termination.dependent.skew.type = '';
				% Either 'independent', 'singlebin' or 'doublebin'
					
				% Single Bin
				
					input.dendrite.taperrate.termination.dependent.skew.singlebin.dependent = '';
					% Either 'diameter', 'pathlength' or 'radialdistance'
						
						input.dendrite.taperrate.termination.dependent.skew.singlebin.fit = ''; 
						% Either 'linear', 'exponential', 'power', 'sigmoidal' or 'none'

							input.dendrite.taperrate.termination.dependent.skew.singlebin.parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.dendrite.taperrate.termination.dependent.skew.singlebin.parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.dendrite.taperrate.termination.dependent.skew.singlebin.parameter(3) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal: halfmax
							input.dendrite.taperrate.termination.dependent.skew.singlebin.parameter(4) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal:
							% steepness

			% Termination Taper Rate Kurtosis
			
				input.dendrite.taperrate.termination.dependent.kurt.type = '';
				% Either 'independent', 'singlebin' or 'doublebin'
					
				% Single Bin
				
					input.dendrite.taperrate.termination.dependent.kurt.singlebin.dependent = '';
					% Either 'diameter', 'pathlength' or 'radialdistance'
						
						input.dendrite.taperrate.termination.dependent.kurt.singlebin.fit = ''; 
						% Either 'linear', 'exponential', 'power', 'sigmoidal' or 'none'

							input.dendrite.taperrate.termination.dependent.kurt.singlebin.parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.dendrite.taperrate.termination.dependent.kurt.singlebin.parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.dendrite.taperrate.termination.dependent.kurt.singlebin.parameter(3) = NaN; 
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal: halfmax
							input.dendrite.taperrate.termination.dependent.kurt.singlebin.parameter(4) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal:
							% steepness
							
							
% Piece Bifurcation Probability

    % Piece Bifurcation Probability dependency

        input.dendrite.piecebifprob.mode = 'lognormal';
        % Either 'independent', 'dependent', 'lognormal'
        
        input.dendrite.piecebifprob.level = 'branch';
        % Either 'piece' or 'branch'
        
        input.dendrite.piecebifprob.by = 'length';
        % Either 'length', 'surfacearea', or 'volume'
        
        input.dendrite.piecebifprob.lognormal.mean = 2.8491;
        input.dendrite.piecebifprob.lognormal.std  = 1.0298;
        
        input.dendrite.piecebifprob.lognormal.maxlength      = 2.660e2;
        input.dendrite.piecebifprob.lognormal.maxsurfacearea = 6.742e2;
        input.dendrite.piecebifprob.lognormal.maxvolume      = 3.496e2;

        
% Piece Termination Probability

    % Piece Termination Probability dependency

        input.dendrite.piecetermprob.mode = 'lognormal';
        % Either 'independent', 'dependent', 'lognormal'
        
        input.dendrite.piecetermprob.level = 'branch';
        % Either 'piece' or 'branch'
        
        input.dendrite.piecetermprob.by = 'length';
        % Either 'length', 'surfacearea', or 'volume'
        
        input.dendrite.piecetermprob.lognormal.mean = 3.9949;
        input.dendrite.piecetermprob.lognormal.std  = 1.1475;
        
		input.dendrite.piecetermprob.lognormal.maxlength      = 3.358e2;
        input.dendrite.piecetermprob.lognormal.maxsurfacearea = 1.166e3;
        input.dendrite.piecetermprob.lognormal.maxvolume      = 5.942e2;
        
							
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

			input.dendrite.rallratio.distribution = 'constant';
			% Either 'constant', 'uniform', 'normal', 'pearson', or 'none'

				input.dendrite.rallratio.const        = 1;
				input.dendrite.rallratio.min          = NaN;
				input.dendrite.rallratio.mean         = NaN;
				input.dendrite.rallratio.max          = NaN; 
				input.dendrite.rallratio.sd           = NaN; 
				input.dendrite.rallratio.skew         = NaN; 
				input.dendrite.rallratio.kurt         = NaN;  
		
		% Rall Ratio dependent
		
			% Rall Ratio Mean
			
				input.dendrite.rallratio.dependent.mean.type = '';
				% Either 'independent', 'singlebin' or 'doublebin'
					
				% Single Bin
				
					input.dendrite.rallratio.dependent.mean.singlebin.dependent = '';
					% Either 'diameter', 'pathlength' or 'radialdistance'
						
						input.dendrite.rallratio.dependent.mean.singlebin.fit = '';
						% Either 'linear', 'exponential', 'power', 'sigmoidal' or 'none'

							input.dendrite.rallratio.dependent.mean.singlebin.parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.dendrite.rallratio.dependent.mean.singlebin.parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.dendrite.rallratio.dependent.mean.singlebin.parameter(3) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal: halfmax
							input.dendrite.rallratio.dependent.mean.singlebin.parameter(4) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal:
							% steepness

			% Rall Ratio Standard Deviation
			
				input.dendrite.rallratio.dependent.sd.type = '';
				% Either 'independent', 'singlebin' or 'doublebin'
					
				% Single Bin
				
					input.dendrite.rallratio.dependent.sd.singlebin.dependent = '';
					% Either 'diameter', 'pathlength' or 'radialdistance'
						
						input.dendrite.rallratio.dependent.sd.singlebin.fit = ''; 
						% Either 'linear', 'exponential', 'power', 'sigmoidal' or 'none'

							input.dendrite.rallratio.dependent.sd.singlebin.parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.dendrite.rallratio.dependent.sd.singlebin.parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.dendrite.rallratio.dependent.sd.singlebin.parameter(3) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal: halfmax
							input.dendrite.rallratio.dependent.sd.singlebin.parameter(4) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal:
							% steepness

			% Rall Ratio Skewness
			
				input.dendrite.rallratio.dependent.skew.type = '';
				% Either 'independent', 'singlebin' or 'doublebin'
					
				% Single Bin
				
					input.dendrite.rallratio.dependent.skew.singlebin.dependent = '';
					% Either 'diameter', 'pathlength' or 'radialdistance'
						
						input.dendrite.rallratio.dependent.skew.singlebin.fit = '';
						% Either 'linear', 'exponential', 'power', 'sigmoidal' or 'none'

							input.dendrite.rallratio.dependent.skew.singlebin.parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.dendrite.rallratio.dependent.skew.singlebin.parameter(2) = NaN;
							% Linear: b | Exponential: b | Power: b | Sigmoidal: maxasym
							input.dendrite.rallratio.dependent.skew.singlebin.parameter(3) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal: halfmax
							input.dendrite.rallratio.dependent.skew.singlebin.parameter(4) = NaN;
							% Linear: N/A | Exponential: N/A | Power: N/A | Sigmoidal:
							% steepness

			% Rall Ratio Kurtosis
			
				input.dendrite.rallratio.dependent.kurt.type = '';
				% Either 'independent', 'singlebin' or 'doublebin'
					
				% Single Bin
				
					input.dendrite.rallratio.dependent.kurt.singlebin.dependent = '';
					% Either 'diameter', 'pathlength' or 'radialdistance'
						
						input.dendrite.rallratio.dependent.kurt.singlebin.fit = '';
						% Either 'linear', 'exponential', 'power', 'sigmoidal' or 'none'

							input.dendrite.rallratio.dependent.kurt.singlebin.parameter(1) = NaN;
							% Linear: m | Exponential: a | Power: a | Sigmoidal: minasym
							input.dendrite.rallratio.dependent.kurt.singlebin.parameter(2) = NaN;
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

			input.dendrite.daughterratio.distribution = 'constant';
			% Either 'constant', 'uniform', 'normal', 'pearson', 'gamma' or 'none'
			% The gamma distribution is for 'excess' daughter ratio (ratio - 1)

				input.dendrite.daughterratio.const        = 1.0;
				input.dendrite.daughterratio.min          = 1.0;
				input.dendrite.daughterratio.mean         = NaN;
				input.dendrite.daughterratio.max          = NaN;
				input.dendrite.daughterratio.sd           = NaN;
				input.dendrite.daughterratio.skew         = NaN;
				input.dendrite.daughterratio.kurt         = NaN;
				
				input.dendrite.daughterratio.gamma.a      = 0.4268;
				input.dendrite.daughterratio.gamma.b      = 1.0003;
		
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

% Trunk Properties

input.apical.trunkdiameter.distribution = 'normal';
input.apical.trunkdiameter.dependence   = 'soma.csa';
    input.apical.trunkdiameter.parameter(1).fit              = 'power';
        input.apical.trunkdiameter.parameter(1).parameter(1) =  4.352e-1;
        input.apical.trunkdiameter.parameter(1).parameter(2) =  4.521e-1;    
    input.apical.trunkdiameter.parameter(2).fit              = 'linear';
        input.apical.trunkdiameter.parameter(2).parameter(1) =  0.000e0;
        input.apical.trunkdiameter.parameter(2).parameter(2) =  1.579e0;

input.apical.distancefromcentroid.distribution = 'normal';
input.apical.distancefromcentroid.dependence   = 'soma.csa';
    input.apical.distancefromcentroid.parameter(1).fit              = 'power';
        input.apical.distancefromcentroid.parameter(1).parameter(1) =  2.149e-1;
        input.apical.distancefromcentroid.parameter(1).parameter(2) =  7.084e-1;    
    input.apical.distancefromcentroid.parameter(2).fit              = 'linear';
        input.apical.distancefromcentroid.parameter(2).parameter(1) =  0.000e0;
        input.apical.distancefromcentroid.parameter(2).parameter(2) =  2.035e0;

input.apical.elevationfromcentroid.distribution = 'pearson';
input.apical.elevationfromcentroid.dependence   = 'none';
    input.apical.elevationfromcentroid.parameter(1).value =  7.558e1;
    input.apical.elevationfromcentroid.parameter(2).value =  1.054e1;
    input.apical.elevationfromcentroid.parameter(3).value = -1.296e0;
    input.apical.elevationfromcentroid.parameter(4).value =  4.099e0;
            
input.apical.azimuthfromcentroid.distribution = 'uniform';
input.apical.azimuthfromcentroid.dependence   = 'none';
    input.apical.azimuthfromcentroid.parameter(1).value = 0.0;
    input.apical.azimuthfromcentroid.parameter(2).value = 360;
    
input.apical.trunkelevation.distribution = 'pearson';
input.apical.trunkelevation.dependence   = 'none';
    input.apical.trunkelevation.parameter(1).value =  7.551e1;
    input.apical.trunkelevation.parameter(2).value =  1.021e1;
    input.apical.trunkelevation.parameter(3).value = -1.234e0;
    input.apical.trunkelevation.parameter(4).value =  4.283e0;
        
input.apical.trunkazimuth.distribution = 'uniform';
input.apical.trunkazimuth.dependence   = 'none';
    input.apical.trunkazimuth.parameter(1).value = 0.0;
    input.apical.trunkazimuth.parameter(2).value = 360;
		

% Piece length

    input.apical.piecelength.distribution = 'constant';

        input.apical.piecelength.const    = 20;
        input.apical.piecelength.min      = NaN;
        input.apical.piecelength.mean     = NaN;
        input.apical.piecelength.max      = NaN;
        input.apical.piecelength.sd       = NaN;
        input.apical.piecelength.skew     = NaN;
        input.apical.piecelength.kurt     = NaN;


% Meander angle

     input.apical.meanderangle.distribution = 'constant';

        input.apical.meanderangle.const    = 0;
        input.apical.meanderangle.min      = NaN;
        input.apical.meanderangle.mean     = NaN;
        input.apical.meanderangle.max      = NaN;
        input.apical.meanderangle.sd       = NaN;
        input.apical.meanderangle.skew     = NaN;
        input.apical.meanderangle.kurt     = NaN;


% Minimum dendritic diameter

    input.apical.mindiameter            = 0;
    input.apical.minbifurcationdiameter = 0;
    input.apical.resampleattempts       = 0;


% Branch Type Probability

    input.apical.probability.branch.mode = 'diameterpathlength'; 
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
	
    input.apical.probability.branch.type = 'loglog';
    % Either 'logit', 'probit', 'comploglog', or 'loglog'

    input.apical.probability.branch.parameter1 = 1.353e0; 
    % Non-multiplicative parameter in all cases
    input.apical.probability.branch.parameter2 = -1.373e0; 
    % Multiplicative parameter if mode is not doublebin
    % Diameter multiplicative parameter if mode is doublebin
    input.apical.probability.branch.parameter3 = 1.612e-3; 
    % Unused if mode is not doublebin
    % Second bin multiplicative parameter if mode is doublebin


% Bifurcation Taper Rate

    % Bifurcation Taper Rate dependency
	
		input.apical.taperrate.bifurcation.mode = 'independent';
        % Either 'independent' or 'dependent'

		% Bifurcation Taper Rate independent

			input.apical.taperrate.bifurcation.distribution = 'constant';
			% Either 'constant', 'uniform', 'normal', 'pearson', or 'none'

				input.apical.taperrate.bifurcation.const        = 0;
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
	
		input.apical.taperrate.termination.mode = 'independent';
        % Either 'independent' or 'dependent'

		% Termination Taper Rate independent

			input.apical.taperrate.termination.distribution = 'constant';
			% Either 'constant', 'uniform', 'normal', 'pearson', or 'none'

				input.apical.taperrate.termination.const        = 0;
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

        input.apical.piecebifprob.mode = 'lognormal';
        % Either 'independent', 'dependent', 'lognormal'
        
        input.apical.piecebifprob.level = 'branch';
        % Either 'piece' or 'branch'
        
        input.apical.piecebifprob.by = 'length';
        % Either 'length', 'surfacearea', or 'volume'
        
        input.apical.piecebifprob.lognormal.mean = 3.3203;
        input.apical.piecebifprob.lognormal.std  = 1.2703;
        
        input.apical.piecebifprob.lognormal.maxlength      = 8.674e2;
        input.apical.piecebifprob.lognormal.maxsurfacearea = 5.565e3;
        input.apical.piecebifprob.lognormal.maxvolume      = 4.658e3;

        
% Piece Termination Probability

    % Piece Termination Probability dependency

        input.apical.piecetermprob.mode = 'lognormal';
        % Either 'independent', 'dependent', 'lognormal'
        
        input.apical.piecetermprob.level = 'branch';
        % Either 'piece' or 'branch'
        
        input.apical.piecetermprob.by = 'length';
        % Either 'length', 'surfacearea', or 'volume'
        
        input.apical.piecetermprob.lognormal.mean = 3.5055;
        input.apical.piecetermprob.lognormal.std  = 1.4013;
			
        input.apical.piecetermprob.lognormal.maxlength      = 4.630e2;
        input.apical.piecetermprob.lognormal.maxsurfacearea = 1.995e3;
        input.apical.piecetermprob.lognormal.maxvolume      = 9.965e2;
        
							
% Daughter direction

    input.apical.daughterangle.distribution = 'uniform';

        input.apical.daughterangle.const    = NaN;
        input.apical.daughterangle.min      = -45;
        input.apical.daughterangle.mean     = NaN;
        input.apical.daughterangle.max      = 45;
        input.apical.daughterangle.sd       = NaN;
        input.apical.daughterangle.skew     = NaN;
        input.apical.daughterangle.kurt     = NaN;

        input.apical.daughterangle.minangle = 15;
		
		
% Rall Ratio

	input.apical.rallratio.rallexponent = 1.5;

    % Rall Ratio dependency

        input.apical.rallratio.mode = 'independent';
        % Either 'independent' or 'dependent'

		% Rall Ratio independent

			input.apical.rallratio.distribution = 'constant';
			% Either 'constant', 'uniform', 'normal', 'pearson', or 'none'

				input.apical.rallratio.const        = 1;
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

        input.apical.daughterratio.mode = 'independent';
        % Either 'independent' or 'dependent'

		% Daughter Ratio independent

			input.apical.daughterratio.distribution = 'constant';
			% Either 'constant', 'uniform', 'normal', 'pearson', 'gamma' or 'none'
			% The gamma distribution is for 'excess' daughter ratio (ratio - 1)

				input.apical.daughterratio.const        = 1.0;
				input.apical.daughterratio.min          = 1.0;
				input.apical.daughterratio.mean         = NaN;
				input.apical.daughterratio.max          = NaN;
				input.apical.daughterratio.sd           = NaN;
				input.apical.daughterratio.skew         = NaN;
				input.apical.daughterratio.kurt         = NaN;
				
				input.apical.daughterratio.gamma.a      = 0.7035;
				input.apical.daughterratio.gamma.b      = 1.1628;
		
		% Daughter Ratio dependent
		
			% Daughter Ratio Mean
			
				input.apical.daughterratio.dependent.mean.type = 'none';
				% Either 'singlebin' or 'doublebin'
					
				% Single Bin
				
					input.apical.daughterratio.dependent.mean.singlebin.dependent = 'none';
					% Either 'diameter', 'pathlength' or 'radialdistance'
						
						input.apical.daughterratio.dependent.mean.singlebin.fit = 'none';
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
			
				input.apical.daughterratio.dependent.sd.type = 'none';
				% Either 'singlebin' or 'doublebin'
					
				% Single Bin
				
					input.apical.daughterratio.dependent.sd.singlebin.dependent = 'none';
					% Either 'diameter', 'pathlength' or 'radialdistance'
						
						input.apical.daughterratio.dependent.sd.singlebin.fit = 'none';
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
			
				input.apical.daughterratio.dependent.skew.type = 'none';
				% Either 'singlebin' or 'doublebin'
					
				% Single Bin
				
					input.apical.daughterratio.dependent.skew.singlebin.dependent = 'none';
					% Either 'diameter', 'pathlength' or 'radialdistance'
						
						input.apical.daughterratio.dependent.skew.singlebin.fit = 'none';
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
			
				input.apical.daughterratio.dependent.kurt.type = 'none';
				% Either 'singlebin' or 'doublebin'
					
				% Single Bin
				
					input.apical.daughterratio.dependent.kurt.singlebin.dependent = 'none';
					% Either 'diameter', 'pathlength' or 'radialdistance'
						
						input.apical.daughterratio.dependent.kurt.singlebin.fit = 'none';
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
                            
                            
