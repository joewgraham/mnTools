% mnFitter Options
%
% Leave figures open? (requires a lot of memory)
	option.mnfitter.figuresopen = 'n';
% ________________________________________________________________________
%
% Fit Branch Type Probability?
    option.mnfitter.branchtypeprob.fit = 'y';
% ________________________________________________________________________
%
% Explore Taper Rate?
   option.mnfitter.taperrate.fit = 'y';
%
%     Explore Pooled?
       option.mnfitter.taperrate.pooled = 'n';
%     Explore Bif/Term?
       option.mnfitter.taperrate.bifurcation = 'y';
       option.mnfitter.taperrate.termination = 'y';
%
%     Explore Statistics
%       Explore Mean?
         option.mnfitter.taperrate.mean = 'y';
%       Explore Standard Deviation?
         option.mnfitter.taperrate.std = 'y';
%       Explore Skewness?
         option.mnfitter.taperrate.skew = 'y';
%       Explore Kurtosis?
         option.mnfitter.taperrate.kurt = 'y';
%
%     Explore Single Bins
%		Explore Diameter? 	
          option.mnfitter.taperrate.diameter.fit = 'y';
%		Explore Path Length?
          option.mnfitter.taperrate.pathlength.fit = 'y';
%       Explore Radial Distance?
          option.mnfitter.taperrate.radialdistance.fit = 'n';
%       Explore Branch Length?
          option.mnfitter.taperrate.branchlength.fit = 'n';
%       Explore Branch Order?
          option.mnfitter.taperrate.branchorder.fit = 'n';
%	  
%	  Fit Single Bins?
		option.mnfitter.taperrate.singlebins = 'y';
%
%     Explore Double Bins
%       Diameter --> Path Length?
         option.mnfitter.taperrate.diameter.pathlength = 'y';
%       Path Length --> Diameter?
         option.mnfitter.taperrate.pathlength.diameter = 'y';
%		Diameter --> Branch Length?
         option.mnfitter.taperrate.diameter.branchlength = 'y';
%       Branch Length --> Diameter?
         option.mnfitter.taperrate.branchlength.diameter = 'y';
%		Diameter --> Branch Order?
         option.mnfitter.taperrate.diameter.branchorder = 'y';
%       Branch Order --> Diameter?
         option.mnfitter.taperrate.branchorder.diameter = 'y';
%
%       First Bin Fits?
         option.mnfitter.taperrate.firstbinfit.fit = 'n';
%         Linear?
           option.mnfitter.taperrate.firstbinfit.linear = 'y';
%         Exponential?
           option.mnfitter.taperrate.firstbinfit.exponential = 'y';
%		  Exponential w/ Offset?
           option.mnfitter.taperrate.firstbinfit.exponentialoffset = 'y'; 
%         Power?
           option.mnfitter.taperrate.firstbinfit.power = 'y';
%         Power w/ Offset?
           option.mnfitter.taperrate.firstbinfit.poweroffset = 'y';
%         Sigmoidal?
           option.mnfitter.taperrate.firstbinfit.sigmoid = 'y';
%
%       First Bin Fit Types
%         Unweighted?
           option.mnfitter.taperrate.firstbinfittype.unweighted = 'y';
%         Weighted?
           option.mnfitter.taperrate.firstbinfittype.weighted = 'y';
%         Robust?
           option.mnfitter.taperrate.firstbinfittype.robust = 'y';
%         Robust Weighted?
           option.mnfitter.taperrate.firstbinfittype.robustweighted = 'y';
%
%       Second Bin (Fit Parameter) Fits?
         option.mnfitter.taperrate.secondbinfit.fit = 'n';
%         Linear?
           option.mnfitter.taperrate.secondbinfit.linear = 'n';
%         Exponential?
           option.mnfitter.taperrate.secondbinfit.exponential = 'n';
%         Exponential w/ Offset?
           option.mnfitter.taperrate.secondbinfit.exponentialoffset = 'n';
%         Power?
           option.mnfitter.taperrate.secondbinfit.power = 'n';
%         Power w/ Offset?
           option.mnfitter.taperrate.secondbinfit.poweroffset = 'n';
%         Sigmoidal?
           option.mnfitter.taperrate.secondbinfit.sigmoid = 'n';
	
%		Fit Double Bins?
		  option.mnfitter.taperrate.doublebins.fit = 'n';
%		
%			First Bin Fit ('linear', 'exponential', 'exponentialoffset', 'power', 'poweroffset' or 'sigmoid'):
			  option.mnfitter.taperrate.doublebins.firstbin.fit = 'none';
%
%			First Bin Fit Type ('unweighted', 'weighted', 'robust' or 'robustweighted'):
			  option.mnfitter.taperrate.doublebins.firstbin.fittype = 'none';
%
%			Second Bin Fits (First Bin Fit Parameter Fits)
%			  Parameter 1 
%				Fit
				  option.mnfitter.taperrate.doublebins.parameter(1).fit = 'none';
%				Fit Type
				  option.mnfitter.taperrate.doublebins.parameter(1).fittype = 'none';
%			  Parameter 2
%				Fit
				  option.mnfitter.taperrate.doublebins.parameter(2).fit = 'none';
%				Fit Type
				  option.mnfitter.taperrate.doublebins.parameter(2).fittype = 'none';
%			  Parameter 3
%			    Fit
				  option.mnfitter.taperrate.doublebins.parameter(3).fit = 'none';
%				Fit Type
				  option.mnfitter.taperrate.doublebins.parameter(3).fittype = 'none';
%			  Parameter 4
%				Fit
				  option.mnfitter.taperrate.doublebins.parameter(4).fit = 'none';
%				Fit Type
				  option.mnfitter.taperrate.doublebins.parameter(4).fittype = 'none';
%
%
%
% ________________________________________________________________________
%
% Explore Piece Bifurcation Probability?
   option.mnfitter.piecebifprob.fit = 'y';
%
%     Explore Pooled?
       option.mnfitter.piecebifprob.pooled = 'n';
%     Explore Bif/Term?
       option.mnfitter.piecebifprob.bifterm = 'y';
%
%     Explore Calculated by
%       Length?
         option.mnfitter.piecebifprob.bylength = 'n';
%       Surface Area?
         option.mnfitter.piecebifprob.bysurfacearea = 'n';
%       Volume?
         option.mnfitter.piecebifprob.byvolume = 'y';
%
%     Explore Single Bins
%		Explore Diameter? 	
          option.mnfitter.piecebifprob.diameter.fit = 'y';
%		Explore Path Length?
          option.mnfitter.piecebifprob.pathlength.fit = 'y';
%       Explore Radial Distance?
          option.mnfitter.piecebifprob.radialdistance.fit = 'n';
%       Explore Branch Length?
          option.mnfitter.piecebifprob.branchlength.fit = 'n';
%       Explore Branch Order?
          option.mnfitter.piecebifprob.branchorder.fit = 'n';
%
%	  Fit Single Bins?
		option.mnfitter.piecebifprob.singlebins = 'y';		
%
%     Explore Double Bins
%       Diameter --> Path Length?
         option.mnfitter.piecebifprob.diameter.pathlength = 'y';
%       Path Length --> Diameter?
         option.mnfitter.piecebifprob.pathlength.diameter = 'y';
%       Diameter --> Branch Length?
         option.mnfitter.piecebifprob.diameter.branchlength = 'y';
%       Branch Length --> Diameter?
         option.mnfitter.piecebifprob.branchlength.diameter = 'y';
%       Diameter --> Branch Order?
         option.mnfitter.piecebifprob.diameter.branchorder = 'y';
%       Branch Order --> Diameter?
         option.mnfitter.piecebifprob.branchorder.diameter = 'y';
		 
%
%       First Bin Fits?
         option.mnfitter.piecebifprob.firstbinfit.fit = 'n';
%         Linear?
           option.mnfitter.piecebifprob.firstbinfit.linear = 'n';
%         Exponential?
           option.mnfitter.piecebifprob.firstbinfit.exponential = 'n';
%         Exponential w/ Offset?
           option.mnfitter.piecebifprob.firstbinfit.exponentialoffset = 'n';
%         Power?
           option.mnfitter.piecebifprob.firstbinfit.power = 'n';
%         Power w/ Offset?
           option.mnfitter.piecebifprob.firstbinfit.poweroffset = 'n';
%         Sigmoidal?
           option.mnfitter.piecebifprob.firstbinfit.sigmoid = 'n';
%
%       First Bin Fit Types
%         Unweighted?
           option.mnfitter.piecebifprob.firstbinfittype.unweighted = 'n';
%         Weighted?
           option.mnfitter.piecebifprob.firstbinfittype.weighted = 'n';
%         Robust?
           option.mnfitter.piecebifprob.firstbinfittype.robust = 'n';
%         Robust Weighted?
           option.mnfitter.piecebifprob.firstbinfittype.robustweighted = 'n';
%
%       Second Bin (Fit Parameter) Fits?
         option.mnfitter.piecebifprob.secondbinfit.fit = 'n';
%         Linear?
           option.mnfitter.piecebifprob.secondbinfit.linear = 'n';
%         Exponential?
           option.mnfitter.piecebifprob.secondbinfit.exponential = 'n';
%         Exponential w/ Offset?
           option.mnfitter.piecebifprob.secondbinfit.exponentialoffset = 'n';
%         Power?
           option.mnfitter.piecebifprob.secondbinfit.power = 'n';
%         Power w/ Offset?
           option.mnfitter.piecebifprob.secondbinfit.poweroffset = 'n';
%         Sigmoidal?
           option.mnfitter.piecebifprob.secondbinfit.sigmoid = 'n';
%
%
%		Fit Double Bins?
		  option.mnfitter.piecebifprob.doublebins.fit = 'n';
%		
%			First Bin Fit ('linear', 'exponential', 'exponentialoffset', 'power', 'poweroffset' or 'sigmoid'):
			  option.mnfitter.piecebifprob.doublebins.firstbin.fit = 'none';
%
%			First Bin Fit Type ('unweighted', 'weighted', 'robust' or 'robustweighted'):
			  option.mnfitter.piecebifprob.doublebins.firstbin.fittype = 'none';
%
%			Second Bin Fits (First Bin Fit Parameter Fits)
%			  Parameter 1 
%				Fit
				  option.mnfitter.piecebifprob.doublebins.parameter(1).fit = 'none';
%				Fit Type
				  option.mnfitter.piecebifprob.doublebins.parameter(1).fittype = 'none';
%			  Parameter 2
%				Fit
				  option.mnfitter.piecebifprob.doublebins.parameter(2).fit = 'none';
%				Fit Type
				  option.mnfitter.piecebifprob.doublebins.parameter(2).fittype = 'none';
%			  Parameter 3
%			    Fit
				  option.mnfitter.piecebifprob.doublebins.parameter(3).fit = 'none';
%				Fit Type
				  option.mnfitter.piecebifprob.doublebins.parameter(3).fittype = 'none';
%			  Parameter 4
%				Fit
				  option.mnfitter.piecebifprob.doublebins.parameter(4).fit = 'none';
%				Fit Type
				  option.mnfitter.piecebifprob.doublebins.parameter(4).fittype = 'none';
%
% ________________________________________________________________________
%
% Explore Piece Termination Probability?
   option.mnfitter.piecetermprob.fit = 'y';
%
%      Explore Pooled?
       option.mnfitter.piecetermprob.pooled = 'n';
%      Explore Bif/Term?
       option.mnfitter.piecetermprob.bifterm = 'y';
%
%      Explore Calculated by
%       Length?
         option.mnfitter.piecetermprob.bylength = 'n';
%       Surface Area?
         option.mnfitter.piecetermprob.bysurfacearea = 'n';
%       Volume?
         option.mnfitter.piecetermprob.byvolume = 'y';
%
%      Explore Single Bins?
%		Explore Diameter? 	
          option.mnfitter.piecetermprob.diameter.fit = 'y';
%		Explore Path Length?
          option.mnfitter.piecetermprob.pathlength.fit = 'y';
%       Explore Radial Distance?
          option.mnfitter.piecetermprob.radialdistance.fit = 'n';
%       Explore Branch Length?
          option.mnfitter.piecetermprob.branchlength.fit = 'n';
%       Explore Branch Order?
          option.mnfitter.piecetermprob.branchorder.fit = 'n';
		  
%	  Fit Single Bins?
	    option.mnfitter.piecetermprob.singlebins = 'y';	
%
%     Explore Double Bins?
%       Diameter --> Path Length?
         option.mnfitter.piecetermprob.diameter.pathlength = 'y';
%       Path Length --> Diameter?
         option.mnfitter.piecetermprob.pathlength.diameter = 'y';
%       Diameter --> Branch Length?
         option.mnfitter.piecetermprob.diameter.branchlength = 'y';
%       Branch Length --> Diameter?
         option.mnfitter.piecetermprob.branchlength.diameter = 'y';
%       Diameter --> Branch Order?
         option.mnfitter.piecetermprob.diameter.branchorder = 'y';
%       Branch Order --> Diameter?
         option.mnfitter.piecetermprob.branchorder.diameter = 'y';

%
%       First Bin Fits?
         option.mnfitter.piecetermprob.firstbinfit.fit = 'n';
%         Linear?
           option.mnfitter.piecetermprob.firstbinfit.linear = 'n';
%         Exponential?
           option.mnfitter.piecetermprob.firstbinfit.exponential = 'n';
%         Exponential w/ Offset?
           option.mnfitter.piecetermprob.firstbinfit.exponentialoffset = 'n';
%         Power?
           option.mnfitter.piecetermprob.firstbinfit.power = 'n';
%         Power w/ Offset?
           option.mnfitter.piecetermprob.firstbinfit.poweroffset = 'n';
%         Sigmoidal?
           option.mnfitter.piecetermprob.firstbinfit.sigmoid = 'n';
%
%       First Bin Fit Types
%         Unweighted?
           option.mnfitter.piecetermprob.firstbinfittype.unweighted = 'n';
%         Weighted?
           option.mnfitter.piecetermprob.firstbinfittype.weighted = 'n';
%         Robust?
           option.mnfitter.piecetermprob.firstbinfittype.robust = 'n';
%         Robust Weighted?
           option.mnfitter.piecetermprob.firstbinfittype.robustweighted = 'n';
%
%       Second Bin (Fit Parameter) Fits?
         option.mnfitter.piecetermprob.secondbinfit.fit = 'n';
%         Linear?
           option.mnfitter.piecetermprob.secondbinfit.linear = 'n';
%         Exponential?
           option.mnfitter.piecetermprob.secondbinfit.exponential = 'n';
%         Exponential w/ Offset?
           option.mnfitter.piecetermprob.secondbinfit.exponentialoffset = 'n';
%         Power?
           option.mnfitter.piecetermprob.secondbinfit.power = 'n';
%         Power w/ Offset?
           option.mnfitter.piecetermprob.secondbinfit.poweroffset = 'n';
%         Sigmoidal?
           option.mnfitter.piecetermprob.secondbinfit.sigmoid = 'n';
%
%
%		Fit Double Bins?
		  option.mnfitter.piecetermprob.doublebins.fit = 'n';
%		
%			First Bin Fit ('linear', 'exponential', 'exponentialoffset', 'power', 'poweroffset' or 'sigmoid'):
			  option.mnfitter.piecetermprob.doublebins.firstbin.fit = 'none';
%
%			First Bin Fit Type ('unweighted', 'weighted', 'robust' or 'robustweighted'):
			  option.mnfitter.piecetermprob.doublebins.firstbin.fittype = 'none';
%
%			Second Bin Fits (First Bin Fit Parameter Fits)
%			  Parameter 1 
%				Fit
				  option.mnfitter.piecetermprob.doublebins.parameter(1).fit = 'none';
%				Fit Type
				  option.mnfitter.piecetermprob.doublebins.parameter(1).fittype = 'none';
%			  Parameter 2
%				Fit
				  option.mnfitter.piecetermprob.doublebins.parameter(2).fit = 'none';
%				Fit Type
				  option.mnfitter.piecetermprob.doublebins.parameter(2).fittype = 'none';
%			  Parameter 3
%			    Fit
				  option.mnfitter.piecetermprob.doublebins.parameter(3).fit = 'none';
%				Fit Type
				  option.mnfitter.piecetermprob.doublebins.parameter(3).fittype = 'none';
%			  Parameter 4
%				Fit
				  option.mnfitter.piecetermprob.doublebins.parameter(4).fit = 'none';
%				Fit Type
				  option.mnfitter.piecetermprob.doublebins.parameter(4).fittype = 'none';
%
% ________________________________________________________________________
%
% Explore Rall Ratio (Rall Exponent: 3/2)?
   option.mnfitter.rallratio.fit = 'y';
% Explore Rall Ratio (Rall Exponent: 1)?
   option.mnfitter.rallratio1.fit = 'n';
% Explore Rall Ratio (Rall Exponent: 2)?
   option.mnfitter.rallratio2.fit = 'y';
% Explore Rall Ratio (Rall Exponent: 3)?
   option.mnfitter.rallratio3.fit = 'y';   
%
%     Explore Statistics
%       Mean?
         option.mnfitter.rallratio.mean = 'y';
%       Standard Deviation?
         option.mnfitter.rallratio.std = 'y';
%       Skewness?
         option.mnfitter.rallratio.skew = 'y';
%       Kurtosis?
         option.mnfitter.rallratio.kurt = 'y';

		 
%
%     Explore Single Bins
%		Explore Diameter? 	
          option.mnfitter.rallratio.diameter.fit = 'y';
%		Explore Path Length?
          option.mnfitter.rallratio.pathlength.fit = 'y';
%       Explore Radial Distance?
          option.mnfitter.rallratio.radialdistance.fit = 'n';
%       Explore Branch Length?
          option.mnfitter.rallratio.branchlength.fit = 'n';
%       Explore Branch Order?
          option.mnfitter.rallratio.branchorder.fit = 'n';
%
%	  Fit Single Bins?
		option.mnfitter.rallratio.singlebins = 'y';
%		  
%	  Explore Double Bins
%       Diameter --> Path Length?
         option.mnfitter.rallratio.diameter.pathlength = 'y';
%       Path Length --> Diameter?
         option.mnfitter.rallratio.pathlength.diameter = 'y';
%       Diameter --> Branch Length?
         option.mnfitter.rallratio.diameter.branchlength = 'y';
%       Branch Length --> Diameter?
         option.mnfitter.rallratio.branchlength.diameter = 'y';
%       Diameter --> Branch Order?
         option.mnfitter.rallratio.diameter.branchorder = 'y';
%       Branch Order --> Diameter?
         option.mnfitter.rallratio.branchorder.diameter = 'y';

%
%       First Bin Fits?
         option.mnfitter.rallratio.firstbinfit.fit = 'n';
%         Linear?
           option.mnfitter.rallratio.firstbinfit.linear = 'n';
%         Exponential?
           option.mnfitter.rallratio.firstbinfit.exponential = 'n';
%         Exponential w/ Offset?
           option.mnfitter.rallratio.firstbinfit.exponentialoffset = 'n';
%         Power?
           option.mnfitter.rallratio.firstbinfit.power = 'n';
%         Power w/ Offset?
           option.mnfitter.rallratio.firstbinfit.poweroffset = 'n';
%         Sigmoidal?
           option.mnfitter.rallratio.firstbinfit.sigmoid = 'n';
%
%       First Bin Fit Types
%         Unweighted?
           option.mnfitter.rallratio.firstbinfittype.unweighted = 'n';
%         Weighted?
           option.mnfitter.rallratio.firstbinfittype.weighted = 'n';
%         Robust?
           option.mnfitter.rallratio.firstbinfittype.robust = 'n';
%         Robust Weighted?
           option.mnfitter.rallratio.firstbinfittype.robustweighted = 'n';
%
%       Second Bin (Fit Parameter) Fits?
         option.mnfitter.rallratio.secondbinfit.fit = 'n';
%         Linear?
           option.mnfitter.rallratio.secondbinfit.linear = 'n';
%         Exponential?
           option.mnfitter.rallratio.secondbinfit.exponential = 'n';
%         Exponential w/ Offset?
           option.mnfitter.rallratio.secondbinfit.exponentialoffset = 'n';
%         Power?
           option.mnfitter.rallratio.secondbinfit.power = 'n';
%         Power w/ Offset?
           option.mnfitter.rallratio.secondbinfit.poweroffset = 'n';
%         Sigmoidal?
           option.mnfitter.rallratio.secondbinfit.sigmoid = 'n';
%
%
%		Fit Double Bins?
		  option.mnfitter.rallratio.doublebins.fit = 'n';
%		
%			First Bin Fit ('linear', 'exponential', 'exponentialoffset', 'power', 'poweroffset' or 'sigmoid'):
			  option.mnfitter.rallratio.doublebins.firstbin.fit = 'none';
%
%			First Bin Fit Type ('unweighted', 'weighted', 'robust' or 'robustweighted'):
			  option.mnfitter.rallratio.doublebins.firstbin.fittype = 'none';
%
%			Second Bin Fits (First Bin Fit Parameter Fits)
%			  Parameter 1 
%				Fit
				  option.mnfitter.rallratio.doublebins.parameter(1).fit = 'none';
%				Fit Type
				  option.mnfitter.rallratio.doublebins.parameter(1).fittype = 'none';
%			  Parameter 2
%				Fit
				  option.mnfitter.rallratio.doublebins.parameter(2).fit = 'none';
%				Fit Type
				  option.mnfitter.rallratio.doublebins.parameter(2).fittype = 'none';
%			  Parameter 3
%			    Fit
				  option.mnfitter.rallratio.doublebins.parameter(3).fit = 'none';
%				Fit Type
				  option.mnfitter.rallratio.doublebins.parameter(3).fittype = 'none';
%			  Parameter 4
%				Fit
				  option.mnfitter.rallratio.doublebins.parameter(4).fit = 'none';
%				Fit Type
				  option.mnfitter.rallratio.doublebins.parameter(4).fittype = 'none';
%
% ________________________________________________________________________
%
% Explore Daughter Ratio?
   option.mnfitter.daughterratio.fit = 'y';
%
%     Explore Statistics
%       Mean?
         option.mnfitter.daughterratio.mean = 'y';
%       Standard Deviation?
         option.mnfitter.daughterratio.std = 'y';
%       Skewness?
         option.mnfitter.daughterratio.skew = 'y';
%       Kurtosis?
         option.mnfitter.daughterratio.kurt = 'y';
%
%     Explore Single Bins?
%		Fit Diameter? 	
          option.mnfitter.daughterratio.diameter.fit = 'y';
%		Fit Path Length?
          option.mnfitter.daughterratio.pathlength.fit = 'y';
%       Fit Radial Distance?
          option.mnfitter.daughterratio.radialdistance.fit = 'n';
%       Fit Branch Length?
          option.mnfitter.daughterratio.branchlength.fit = 'n';
%       Fit Branch Order?
          option.mnfitter.daughterratio.branchorder.fit = 'n';
%
%	  Fit Single Bins?
		option.mnfitter.daughterratio.singlebins = 'y';
%

%	  Explore Double Bins 
%       Diameter --> Path Length?
         option.mnfitter.daughterratio.diameter.pathlength = 'y';
%       Path Length --> Diameter?
         option.mnfitter.daughterratio.pathlength.diameter = 'y';
%       Diameter --> Branch Length?
         option.mnfitter.daughterratio.diameter.branchlength = 'y';
%       Branch Length --> Diameter?
         option.mnfitter.daughterratio.branchlength.diameter = 'y';
%       Diameter --> Branch Order?
         option.mnfitter.daughterratio.diameter.branchorder = 'y';
%       Branch Order --> Diameter?
         option.mnfitter.daughterratio.branchorder.diameter = 'y';

%
%       First Bin Fits?
         option.mnfitter.daughterratio.firstbinfit.fit = 'n';
%         Linear?
           option.mnfitter.daughterratio.firstbinfit.linear = 'n';
%         Exponential?
           option.mnfitter.daughterratio.firstbinfit.exponential = 'n';
%         Exponential w/ Offset?
           option.mnfitter.daughterratio.firstbinfit.exponentialoffset = 'n';
%         Power?
           option.mnfitter.daughterratio.firstbinfit.power = 'n';
%         Power w/ Offset?
           option.mnfitter.daughterratio.firstbinfit.poweroffset = 'n';
%         Sigmoidal?
           option.mnfitter.daughterratio.firstbinfit.sigmoid = 'n';
%
%       First Bin Fit Types
%         Unweighted?
           option.mnfitter.daughterratio.firstbinfittype.unweighted = 'n';
%         Weighted?
           option.mnfitter.daughterratio.firstbinfittype.weighted = 'n';
%         Robust?
           option.mnfitter.daughterratio.firstbinfittype.robust = 'n';
%         Robust Weighted?
           option.mnfitter.daughterratio.firstbinfittype.robustweighted = 'n';
%
%       Second Bin (Fit Parameter) Fits?
         option.mnfitter.daughterratio.secondbinfit.fit = 'n';
%         Linear?
           option.mnfitter.daughterratio.secondbinfit.linear = 'n';
%         Exponential?
           option.mnfitter.daughterratio.secondbinfit.exponential = 'n';
%         Exponential w/ Offset?
           option.mnfitter.daughterratio.secondbinfit.exponentialoffset = 'n';
%         Power?
           option.mnfitter.daughterratio.secondbinfit.power = 'n';
%         Power w/ Offset?
           option.mnfitter.daughterratio.secondbinfit.poweroffset = 'n';
%         Sigmoidal?
           option.mnfitter.daughterratio.secondbinfit.sigmoid = 'n';
%
%
%		Fit Double Bins?
		  option.mnfitter.daughterratio.doublebins.fit = 'n';
%		
%			First Bin Fit ('linear', 'exponential', 'exponentialoffset', 'power', 'poweroffset' or 'sigmoid'):
			  option.mnfitter.daughterratio.doublebins.firstbin.fit = 'none';
%
%			First Bin Fit Type ('unweighted', 'weighted', 'robust' or 'robustweighted'):
			  option.mnfitter.daughterratio.doublebins.firstbin.fittype = 'none';
%
%			Second Bin Fits (First Bin Fit Parameter Fits)
%			  Parameter 1 
%				Fit
				  option.mnfitter.daughterratio.doublebins.parameter(1).fit = 'none';
%				Fit Type
				  option.mnfitter.daughterratio.doublebins.parameter(1).fittype = 'none';
%			  Parameter 2
%				Fit
				  option.mnfitter.daughterratio.doublebins.parameter(2).fit = 'none';
%				Fit Type
				  option.mnfitter.daughterratio.doublebins.parameter(2).fittype = 'none';
%			  Parameter 3
%			    Fit
				  option.mnfitter.daughterratio.doublebins.parameter(3).fit = 'none';
%				Fit Type
				  option.mnfitter.daughterratio.doublebins.parameter(3).fittype = 'none';
%			  Parameter 4
%				Fit
				  option.mnfitter.daughterratio.doublebins.parameter(4).fit = 'none';
%				Fit Type
				  option.mnfitter.daughterratio.doublebins.parameter(4).fittype = 'none';
%
% ________________________________________________________________________
%
% Explore Parent / Daughter 1 Ratio?
   option.mnfitter.parentdaughterratio.fit = 'n';
% Explore Parent / Daughter 2 Ratio?
   option.mnfitter.parentdaughter2ratio.fit = 'n';
%
%     Explore Statistics
%       Mean?
         option.mnfitter.parentdaughterratio.mean = 'n';
%       Standard Deviation?
         option.mnfitter.parentdaughterratio.std = 'n';
%       Skewness?
         option.mnfitter.parentdaughterratio.skew = 'n';
%       Kurtosis?
         option.mnfitter.parentdaughterratio.kurt = 'n';
%
%     Explore Single Bins
%		Fit Diameter? 	
          option.mnfitter.parentdaughterratio.diameter.fit = 'n';
%		Fit Path Length?
          option.mnfitter.parentdaughterratio.pathlength.fit = 'n';
%       Fit Radial Distance?
          option.mnfitter.parentdaughterratio.radialdistance.fit = 'n';
%       Fit Branch Length?
          option.mnfitter.parentdaughterratio.branchlength.fit = 'n';
%       Fit Branch Order?
          option.mnfitter.parentdaughterratio.branchorder.fit = 'n';
%
%	  Fit Single Bins?
		option.mnfitter.parentdaughterratio.singlebins = 'n';
%

%	  Explore Double Bins
%       Diameter --> Path Length?
         option.mnfitter.parentdaughterratio.diameter.pathlength = 'n';
%       Path Length --> Diameter?
         option.mnfitter.parentdaughterratio.pathlength.diameter = 'n';
%       Diameter --> Branch Length?
         option.mnfitter.parentdaughterratio.diameter.branchlength = 'n';
%       Branch Length --> Diameter?
         option.mnfitter.parentdaughterratio.branchlength.diameter = 'n';
%       Diameter --> Branch Order?
         option.mnfitter.parentdaughterratio.diameter.branchorder = 'n';
%       Branch Order --> Diameter?
         option.mnfitter.parentdaughterratio.branchorder.diameter = 'n';

%
%       First Bin Fits?
         option.mnfitter.parentdaughterratio.firstbinfit.fit = 'n';
%         Linear?
           option.mnfitter.parentdaughterratio.firstbinfit.linear = 'n';
%         Exponential?
           option.mnfitter.parentdaughterratio.firstbinfit.exponential = 'n';
%         Exponential w/ Offset?
           option.mnfitter.parentdaughterratio.firstbinfit.exponentialoffset = 'n';
%         Power?
           option.mnfitter.parentdaughterratio.firstbinfit.power = 'n';
%         Power w/ Offset?
           option.mnfitter.parentdaughterratio.firstbinfit.poweroffset = 'n';
%         Sigmoidal?
           option.mnfitter.parentdaughterratio.firstbinfit.sigmoid = 'n';
%
%       First Bin Fit Types
%         Unweighted?
           option.mnfitter.parentdaughterratio.firstbinfittype.unweighted = 'n';
%         Weighted?
           option.mnfitter.parentdaughterratio.firstbinfittype.weighted = 'n';
%         Robust?
           option.mnfitter.parentdaughterratio.firstbinfittype.robust = 'n';
%         Robust Weighted?
           option.mnfitter.parentdaughterratio.firstbinfittype.robustweighted = 'n';
%
%       Second Bin (Fit Parameter) Fits?
         option.mnfitter.parentdaughterratio.secondbinfit.fit = 'n';
%         Linear?
           option.mnfitter.parentdaughterratio.secondbinfit.linear = 'n';
%         Exponential?
           option.mnfitter.parentdaughterratio.secondbinfit.exponential = 'n';
%         Exponential w/ Offset?
           option.mnfitter.parentdaughterratio.secondbinfit.exponentialoffset = 'n';
%         Power?
           option.mnfitter.parentdaughterratio.secondbinfit.power = 'n';
%         Power w/ Offset?
           option.mnfitter.parentdaughterratio.secondbinfit.poweroffset = 'n';
%         Sigmoidal?
           option.mnfitter.parentdaughterratio.secondbinfit.sigmoid = 'n';
%
%
%		Fit Double Bins?
		  option.mnfitter.parentdaughterratio.doublebins.fit = 'n';
%		
%			First Bin Fit ('linear', 'exponential', 'exponentialoffset', 'power', 'poweroffset' or 'sigmoid'):
			  option.mnfitter.parentdaughterratio.doublebins.firstbin.fit = 'none';
%
%			First Bin Fit Type ('unweighted', 'weighted', 'robust' or 'robustweighted'):
			  option.mnfitter.parentdaughterratio.doublebins.firstbin.fittype = 'none';
%
%			Second Bin Fits (First Bin Fit Parameter Fits)
%			  Parameter 1 
%				Fit
				  option.mnfitter.parentdaughterratio.doublebins.parameter(1).fit = 'none';
%				Fit Type
				  option.mnfitter.parentdaughterratio.doublebins.parameter(1).fittype = 'none';
%			  Parameter 2
%				Fit
				  option.mnfitter.parentdaughterratio.doublebins.parameter(2).fit = 'none';
%				Fit Type
				  option.mnfitter.parentdaughterratio.doublebins.parameter(2).fittype = 'none';
%			  Parameter 3
%			    Fit
				  option.mnfitter.parentdaughterratio.doublebins.parameter(3).fit = 'none';
%				Fit Type
				  option.mnfitter.parentdaughterratio.doublebins.parameter(3).fittype = 'none';
%			  Parameter 4
%				Fit
				  option.mnfitter.parentdaughterratio.doublebins.parameter(4).fit = 'none';
%				Fit Type
				  option.mnfitter.parentdaughterratio.doublebins.parameter(4).fittype = 'none';
%
% ________________________________________________________________________