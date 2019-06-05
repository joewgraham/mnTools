% mnCompareFit Options
%
% Leave figures open? (requires a lot of memory)
	option.mncomparefit.figuresopen = 'n';
% ________________________________________________________________________
%
% Fit Branch Type Probability?
    option.mncomparefit.branchtypeprob.fit = 'n';
% ________________________________________________________________________
%
% Explore Taper Rate?
   option.mncomparefit.taperrate.fit = 'n';
%
%     Explore Pooled?
       option.mncomparefit.taperrate.pooled = 'n';
%     Explore Bif/Term?
       option.mncomparefit.taperrate.bifurcation = 'n';
       option.mncomparefit.taperrate.termination = 'n';
%
%     Explore Statistics
%       Explore Mean?
         option.mncomparefit.taperrate.mean = 'n';
%       Explore Standard Deviation?
         option.mncomparefit.taperrate.std = 'n';
%       Explore Skewness?
         option.mncomparefit.taperrate.skew = 'n';
%       Explore Kurtosis?
         option.mncomparefit.taperrate.kurt = 'n';
%
%     Explore Single Bins
%		Explore Diameter? 	
          option.mncomparefit.taperrate.diameter.fit = 'n';
%		Explore Path Length?
          option.mncomparefit.taperrate.pathlength.fit = 'n';
%       Explore Radial Distance?
          option.mncomparefit.taperrate.radialdistance.fit = 'n';
%       Explore Branch Length?
          option.mncomparefit.taperrate.branchlength.fit = 'n';
%	  
%	  Fit Single Bins?
		option.mncomparefit.taperrate.singlebins.fit = 'n';
		  
		mncomparefitoption.taperrate.singlebins.linear            = 'n';
  		mncomparefitoption.taperrate.singlebins.exponential       = 'n';
  		mncomparefitoption.taperrate.singlebins.exponentialoffset = 'n';
  		mncomparefitoption.taperrate.singlebins.power             = 'n';
  		mncomparefitoption.taperrate.singlebins.poweroffset       = 'n';
 		mncomparefitoption.taperrate.singlebins.sigmoid           = 'n';
  
		mncomparefitoption.taperrate.singlebins.unweighted     = 'n';
   		mncomparefitoption.taperrate.singlebins.weighted       = 'n';
   		mncomparefitoption.taperrate.singlebins.robust         = 'n';
  		mncomparefitoption.taperrate.singlebins.robustweighted = 'n';
		
%
%     Explore Double Bins
%       Diameter --> Path Length?
         option.mncomparefit.taperrate.diameter.pathlength = 'n';
%       Path Length --> Diameter?
         option.mncomparefit.taperrate.pathlength.diameter = 'n';
%
%       First Bin Fits?
         option.mncomparefit.taperrate.firstbinfit.fit = 'n';
%         Linear?
           option.mncomparefit.taperrate.firstbinfit.linear = 'n';
%         Exponential?
           option.mncomparefit.taperrate.firstbinfit.exponential = 'n';
%		  Exponential w/ Offset?
           option.mncomparefit.taperrate.firstbinfit.exponentialoffset = 'n'; 
%         Power?
           option.mncomparefit.taperrate.firstbinfit.power = 'n';
%         Power w/ Offset?
           option.mncomparefit.taperrate.firstbinfit.poweroffset = 'n';
%         Sigmoidal?
           option.mncomparefit.taperrate.firstbinfit.sigmoid = 'n';
%
%       First Bin Fit Types
%         Unweighted?
           option.mncomparefit.taperrate.firstbinfittype.unweighted = 'n';
%         Weighted?
           option.mncomparefit.taperrate.firstbinfittype.weighted = 'n';
%         Robust?
           option.mncomparefit.taperrate.firstbinfittype.robust = 'n';
%         Robust Weighted?
           option.mncomparefit.taperrate.firstbinfittype.robustweighted = 'n';
%
%       Second Bin (Fit Parameter) Fits?
         option.mncomparefit.taperrate.secondbinfit.fit = 'n';
%         Linear?
           option.mncomparefit.taperrate.secondbinfit.linear = 'n';
%         Exponential?
           option.mncomparefit.taperrate.secondbinfit.exponential = 'n';
%         Exponential w/ Offset?
           option.mncomparefit.taperrate.secondbinfit.exponentialoffset = 'n';
%         Power?
           option.mncomparefit.taperrate.secondbinfit.power = 'n';
%         Power w/ Offset?
           option.mncomparefit.taperrate.secondbinfit.poweroffset = 'n';
%         Sigmoidal?
           option.mncomparefit.taperrate.secondbinfit.sigmoid = 'n';
	
%		Fit Double Bins?
		  option.mncomparefit.taperrate.doublebins.fit = 'n';
%		
%			First Bin Fit ('linear', 'exponential', 'exponentialoffset', 'power', 'poweroffset' or 'sigmoid'):
			  option.mncomparefit.taperrate.doublebins.firstbin.fit = 'none';
%
%			First Bin Fit Type ('unweighted', 'weighted', 'robust' or 'robustweighted'):
			  option.mncomparefit.taperrate.doublebins.firstbin.fittype = 'none';
%
%			Second Bin Fits (First Bin Fit Parameter Fits)
%			  Parameter 1 
%				Fit
				  option.mncomparefit.taperrate.doublebins.parameter(1).fit = 'none';
%				Fit Type
				  option.mncomparefit.taperrate.doublebins.parameter(1).fittype = 'none';
%			  Parameter 2
%				Fit
				  option.mncomparefit.taperrate.doublebins.parameter(2).fit = 'none';
%				Fit Type
				  option.mncomparefit.taperrate.doublebins.parameter(2).fittype = 'none';
%			  Parameter 3
%			    Fit
				  option.mncomparefit.taperrate.doublebins.parameter(3).fit = 'none';
%				Fit Type
				  option.mncomparefit.taperrate.doublebins.parameter(3).fittype = 'none';
%			  Parameter 4
%				Fit
				  option.mncomparefit.taperrate.doublebins.parameter(4).fit = 'none';
%				Fit Type
				  option.mncomparefit.taperrate.doublebins.parameter(4).fittype = 'none';
%
%
%
% ________________________________________________________________________
%
% Explore Piece Bifurcation Probability?
   option.mncomparefit.piecebifprob.fit = 'n';
%
%     Explore Pooled?
       option.mncomparefit.piecebifprob.pooled = 'n';
%     Explore Bif/Term?
       option.mncomparefit.piecebifprob.bifterm = 'n';
%
%     Explore Calculated by
%       Length?
         option.mncomparefit.piecebifprob.bylength = 'n';
%       Surface Area?
         option.mncomparefit.piecebifprob.bysurfacearea = 'n';
%       Volume?
         option.mncomparefit.piecebifprob.byvolume = 'n';
%
%     Explore Single Bins
%		Explore Diameter? 	
          option.mncomparefit.piecebifprob.diameter.fit = 'n';
%		Explore Path Length?
          option.mncomparefit.piecebifprob.pathlength.fit = 'n';
%       Explore Radial Distance?
          option.mncomparefit.piecebifprob.radialdistance.fit = 'n';
%       Explore Branch Length?
          option.mncomparefit.piecebifprob.branchlength.fit = 'n';
%
%	  Fit Single Bins?
		option.mncomparefit.piecebifprob.singlebins = 'n';		
%
%     Explore Double Bins
%       Diameter --> Path Length?
         option.mncomparefit.piecebifprob.diameter.pathlength = 'n';
%       Path Length --> Diameter?
         option.mncomparefit.piecebifprob.pathlength.diameter = 'n';

%
%       First Bin Fits?
         option.mncomparefit.piecebifprob.firstbinfit.fit = 'n';
%         Linear?
           option.mncomparefit.piecebifprob.firstbinfit.linear = 'n';
%         Exponential?
           option.mncomparefit.piecebifprob.firstbinfit.exponential = 'n';
%         Exponential w/ Offset?
           option.mncomparefit.piecebifprob.firstbinfit.exponentialoffset = 'n';
%         Power?
           option.mncomparefit.piecebifprob.firstbinfit.power = 'n';
%         Power w/ Offset?
           option.mncomparefit.piecebifprob.firstbinfit.poweroffset = 'n';
%         Sigmoidal?
           option.mncomparefit.piecebifprob.firstbinfit.sigmoid = 'n';
%
%       First Bin Fit Types
%         Unweighted?
           option.mncomparefit.piecebifprob.firstbinfittype.unweighted = 'n';
%         Weighted?
           option.mncomparefit.piecebifprob.firstbinfittype.weighted = 'n';
%         Robust?
           option.mncomparefit.piecebifprob.firstbinfittype.robust = 'n';
%         Robust Weighted?
           option.mncomparefit.piecebifprob.firstbinfittype.robustweighted = 'n';
%
%       Second Bin (Fit Parameter) Fits?
         option.mncomparefit.piecebifprob.secondbinfit.fit = 'n';
%         Linear?
           option.mncomparefit.piecebifprob.secondbinfit.linear = 'n';
%         Exponential?
           option.mncomparefit.piecebifprob.secondbinfit.exponential = 'n';
%         Exponential w/ Offset?
           option.mncomparefit.piecebifprob.secondbinfit.exponentialoffset = 'n';
%         Power?
           option.mncomparefit.piecebifprob.secondbinfit.power = 'n';
%         Power w/ Offset?
           option.mncomparefit.piecebifprob.secondbinfit.poweroffset = 'n';
%         Sigmoidal?
           option.mncomparefit.piecebifprob.secondbinfit.sigmoid = 'n';
%
%
%		Fit Double Bins?
		  option.mncomparefit.piecebifprob.doublebins.fit = 'n';
%		
%			First Bin Fit ('linear', 'exponential', 'exponentialoffset', 'power', 'poweroffset' or 'sigmoid'):
			  option.mncomparefit.piecebifprob.doublebins.firstbin.fit = 'none';
%
%			First Bin Fit Type ('unweighted', 'weighted', 'robust' or 'robustweighted'):
			  option.mncomparefit.piecebifprob.doublebins.firstbin.fittype = 'none';
%
%			Second Bin Fits (First Bin Fit Parameter Fits)
%			  Parameter 1 
%				Fit
				  option.mncomparefit.piecebifprob.doublebins.parameter(1).fit = 'none';
%				Fit Type
				  option.mncomparefit.piecebifprob.doublebins.parameter(1).fittype = 'none';
%			  Parameter 2
%				Fit
				  option.mncomparefit.piecebifprob.doublebins.parameter(2).fit = 'none';
%				Fit Type
				  option.mncomparefit.piecebifprob.doublebins.parameter(2).fittype = 'none';
%			  Parameter 3
%			    Fit
				  option.mncomparefit.piecebifprob.doublebins.parameter(3).fit = 'none';
%				Fit Type
				  option.mncomparefit.piecebifprob.doublebins.parameter(3).fittype = 'none';
%			  Parameter 4
%				Fit
				  option.mncomparefit.piecebifprob.doublebins.parameter(4).fit = 'none';
%				Fit Type
				  option.mncomparefit.piecebifprob.doublebins.parameter(4).fittype = 'none';
%
% ________________________________________________________________________
%
% Explore Piece Termination Probability?
   option.mncomparefit.piecetermprob.fit = 'n';
%
%      Explore Pooled?
       option.mncomparefit.piecetermprob.pooled = 'n';
%      Explore Bif/Term?
       option.mncomparefit.piecetermprob.bifterm = 'n';
%
%      Explore Calculated by
%       Length?
         option.mncomparefit.piecetermprob.bylength = 'n';
%       Surface Area?
         option.mncomparefit.piecetermprob.bysurfacearea = 'n';
%       Volume?
         option.mncomparefit.piecetermprob.byvolume = 'n';
%
%      Explore Single Bins?
%		Explore Diameter? 	
          option.mncomparefit.piecetermprob.diameter.fit = 'n';
%		Explore Path Length?
          option.mncomparefit.piecetermprob.pathlength.fit = 'n';
%       Explore Radial Distance?
          option.mncomparefit.piecetermprob.radialdistance.fit = 'n';
%       Explore Branch Length?
          option.mncomparefit.piecetermprob.branchlength.fit = 'n';
		  
%	  Fit Single Bins?
	    option.mncomparefit.piecetermprob.singlebins = 'n';	
%
%     Explore Double Bins?
%       Diameter --> Path Length?
         option.mncomparefit.piecetermprob.diameter.pathlength = 'n';
%       Path Length --> Diameter?
         option.mncomparefit.piecetermprob.pathlength.diameter = 'n';

%
%       First Bin Fits?
         option.mncomparefit.piecetermprob.firstbinfit.fit = 'n';
%         Linear?
           option.mncomparefit.piecetermprob.firstbinfit.linear = 'n';
%         Exponential?
           option.mncomparefit.piecetermprob.firstbinfit.exponential = 'n';
%         Exponential w/ Offset?
           option.mncomparefit.piecetermprob.firstbinfit.exponentialoffset = 'n';
%         Power?
           option.mncomparefit.piecetermprob.firstbinfit.power = 'n';
%         Power w/ Offset?
           option.mncomparefit.piecetermprob.firstbinfit.poweroffset = 'n';
%         Sigmoidal?
           option.mncomparefit.piecetermprob.firstbinfit.sigmoid = 'n';
%
%       First Bin Fit Types
%         Unweighted?
           option.mncomparefit.piecetermprob.firstbinfittype.unweighted = 'n';
%         Weighted?
           option.mncomparefit.piecetermprob.firstbinfittype.weighted = 'n';
%         Robust?
           option.mncomparefit.piecetermprob.firstbinfittype.robust = 'n';
%         Robust Weighted?
           option.mncomparefit.piecetermprob.firstbinfittype.robustweighted = 'n';
%
%       Second Bin (Fit Parameter) Fits?
         option.mncomparefit.piecetermprob.secondbinfit.fit = 'n';
%         Linear?
           option.mncomparefit.piecetermprob.secondbinfit.linear = 'n';
%         Exponential?
           option.mncomparefit.piecetermprob.secondbinfit.exponential = 'n';
%         Exponential w/ Offset?
           option.mncomparefit.piecetermprob.secondbinfit.exponentialoffset = 'n';
%         Power?
           option.mncomparefit.piecetermprob.secondbinfit.power = 'n';
%         Power w/ Offset?
           option.mncomparefit.piecetermprob.secondbinfit.poweroffset = 'n';
%         Sigmoidal?
           option.mncomparefit.piecetermprob.secondbinfit.sigmoid = 'n';
%
%
%		Fit Double Bins?
		  option.mncomparefit.piecetermprob.doublebins.fit = 'n';
%		
%			First Bin Fit ('linear', 'exponential', 'exponentialoffset', 'power', 'poweroffset' or 'sigmoid'):
			  option.mncomparefit.piecetermprob.doublebins.firstbin.fit = 'none';
%
%			First Bin Fit Type ('unweighted', 'weighted', 'robust' or 'robustweighted'):
			  option.mncomparefit.piecetermprob.doublebins.firstbin.fittype = 'none';
%
%			Second Bin Fits (First Bin Fit Parameter Fits)
%			  Parameter 1 
%				Fit
				  option.mncomparefit.piecetermprob.doublebins.parameter(1).fit = 'none';
%				Fit Type
				  option.mncomparefit.piecetermprob.doublebins.parameter(1).fittype = 'none';
%			  Parameter 2
%				Fit
				  option.mncomparefit.piecetermprob.doublebins.parameter(2).fit = 'none';
%				Fit Type
				  option.mncomparefit.piecetermprob.doublebins.parameter(2).fittype = 'none';
%			  Parameter 3
%			    Fit
				  option.mncomparefit.piecetermprob.doublebins.parameter(3).fit = 'none';
%				Fit Type
				  option.mncomparefit.piecetermprob.doublebins.parameter(3).fittype = 'none';
%			  Parameter 4
%				Fit
				  option.mncomparefit.piecetermprob.doublebins.parameter(4).fit = 'none';
%				Fit Type
				  option.mncomparefit.piecetermprob.doublebins.parameter(4).fittype = 'none';
%
% ________________________________________________________________________
%
% Explore Rall Ratio (Rall Exponent: 3/2)?
   option.mncomparefit.rallratio.fit = 'n';
% Explore Rall Ratio (Rall Exponent: 1)?
   option.mncomparefit.rallratio1.fit = 'n';
% Explore Rall Ratio (Rall Exponent: 2)?
   option.mncomparefit.rallratio2.fit = 'n';
% Explore Rall Ratio (Rall Exponent: 3)?
   option.mncomparefit.rallratio3.fit = 'n';   
%
%     Explore Statistics
%       Mean?
         option.mncomparefit.rallratio.mean = 'n';
%       Standard Deviation?
         option.mncomparefit.rallratio.std = 'n';
%       Skewness?
         option.mncomparefit.rallratio.skew = 'n';
%       Kurtosis?
         option.mncomparefit.rallratio.kurt = 'n';

		 
%
%     Explore Single Bins
%		Explore Diameter? 	
          option.mncomparefit.rallratio.diameter.fit = 'n';
%		Explore Path Length?
          option.mncomparefit.rallratio.pathlength.fit = 'n';
%       Explore Radial Distance?
          option.mncomparefit.rallratio.radialdistance.fit = 'n';
%       Explore Branch Length?
          option.mncomparefit.rallratio.branchlength.fit = 'n';
%
%	  Fit Single Bins?
		option.mncomparefit.rallratio.singlebins.fit = 'n';
		
		mncomparefitoption.rallratio.singlebins.linear            = 'n';
  		mncomparefitoption.rallratio.singlebins.exponential       = 'n';
  		mncomparefitoption.rallratio.singlebins.exponentialoffset = 'n';
  		mncomparefitoption.rallratio.singlebins.power             = 'n';
  		mncomparefitoption.rallratio.singlebins.poweroffset       = 'n';
 		mncomparefitoption.rallratio.singlebins.sigmoid           = 'n';
  
		mncomparefitoption.rallratio.singlebins.unweighted     = 'n';
   		mncomparefitoption.rallratio.singlebins.weighted       = 'n';
   		mncomparefitoption.rallratio.singlebins.robust         = 'n';
  		mncomparefitoption.rallratio.singlebins.robustweighted = 'n';
%		  
%	  Explore Double Bins
%       Diameter --> Path Length?
         option.mncomparefit.rallratio.diameter.pathlength = 'n';
%       Path Length --> Diameter?
         option.mncomparefit.rallratio.pathlength.diameter = 'n';

%
%       First Bin Fits?
         option.mncomparefit.rallratio.firstbinfit.fit = 'n';
%         Linear?
           option.mncomparefit.rallratio.firstbinfit.linear = 'n';
%         Exponential?
           option.mncomparefit.rallratio.firstbinfit.exponential = 'n';
%         Exponential w/ Offset?
           option.mncomparefit.rallratio.firstbinfit.exponentialoffset = 'n';
%         Power?
           option.mncomparefit.rallratio.firstbinfit.power = 'n';
%         Power w/ Offset?
           option.mncomparefit.rallratio.firstbinfit.poweroffset = 'n';
%         Sigmoidal?
           option.mncomparefit.rallratio.firstbinfit.sigmoid = 'n';
%
%       First Bin Fit Types
%         Unweighted?
           option.mncomparefit.rallratio.firstbinfittype.unweighted = 'n';
%         Weighted?
           option.mncomparefit.rallratio.firstbinfittype.weighted = 'n';
%         Robust?
           option.mncomparefit.rallratio.firstbinfittype.robust = 'n';
%         Robust Weighted?
           option.mncomparefit.rallratio.firstbinfittype.robustweighted = 'n';
%
%       Second Bin (Fit Parameter) Fits?
         option.mncomparefit.rallratio.secondbinfit.fit = 'n';
%         Linear?
           option.mncomparefit.rallratio.secondbinfit.linear = 'n';
%         Exponential?
           option.mncomparefit.rallratio.secondbinfit.exponential = 'n';
%         Exponential w/ Offset?
           option.mncomparefit.rallratio.secondbinfit.exponentialoffset = 'n';
%         Power?
           option.mncomparefit.rallratio.secondbinfit.power = 'n';
%         Power w/ Offset?
           option.mncomparefit.rallratio.secondbinfit.poweroffset = 'n';
%         Sigmoidal?
           option.mncomparefit.rallratio.secondbinfit.sigmoid = 'n';
%
%
%		Fit Double Bins?
		  option.mncomparefit.rallratio.doublebins.fit = 'n';
%		
%			First Bin Fit ('linear', 'exponential', 'exponentialoffset', 'power', 'poweroffset' or 'sigmoid'):
			  option.mncomparefit.rallratio.doublebins.firstbin.fit = 'none';
%
%			First Bin Fit Type ('unweighted', 'weighted', 'robust' or 'robustweighted'):
			  option.mncomparefit.rallratio.doublebins.firstbin.fittype = 'none';
%
%			Second Bin Fits (First Bin Fit Parameter Fits)
%			  Parameter 1 
%				Fit
				  option.mncomparefit.rallratio.doublebins.parameter(1).fit = 'none';
%				Fit Type
				  option.mncomparefit.rallratio.doublebins.parameter(1).fittype = 'none';
%			  Parameter 2
%				Fit
				  option.mncomparefit.rallratio.doublebins.parameter(2).fit = 'none';
%				Fit Type
				  option.mncomparefit.rallratio.doublebins.parameter(2).fittype = 'none';
%			  Parameter 3
%			    Fit
				  option.mncomparefit.rallratio.doublebins.parameter(3).fit = 'none';
%				Fit Type
				  option.mncomparefit.rallratio.doublebins.parameter(3).fittype = 'none';
%			  Parameter 4
%				Fit
				  option.mncomparefit.rallratio.doublebins.parameter(4).fit = 'none';
%				Fit Type
				  option.mncomparefit.rallratio.doublebins.parameter(4).fittype = 'none';
%
% ________________________________________________________________________
%
% Explore Daughter Ratio?
   option.mncomparefit.daughterratio.fit = 'n';
%
%     Explore Statistics
%       Mean?
         option.mncomparefit.daughterratio.mean = 'n';
%       Standard Deviation?
         option.mncomparefit.daughterratio.std = 'n';
%       Skewness?
         option.mncomparefit.daughterratio.skew = 'n';
%       Kurtosis?
         option.mncomparefit.daughterratio.kurt = 'n';
%
%     Explore Single Bins?
%		Fit Diameter? 	
          option.mncomparefit.daughterratio.diameter.fit = 'n';
%		Fit Path Length?
          option.mncomparefit.daughterratio.pathlength.fit = 'n';
%       Fit Radial Distance?
          option.mncomparefit.daughterratio.radialdistance.fit = 'n';
%       Fit Branch Length?
          option.mncomparefit.daughterratio.branchlength.fit = 'n';
%
%	  Fit Single Bins?
		option.mncomparefit.daughterratio.singlebins = 'n';
		
		mncomparefitoption.daughterratio.singlebins.linear            = 'n';
  		mncomparefitoption.daughterratio.singlebins.exponential       = 'n';
  		mncomparefitoption.daughterratio.singlebins.exponentialoffset = 'n';
  		mncomparefitoption.daughterratio.singlebins.power             = 'n';
  		mncomparefitoption.daughterratio.singlebins.poweroffset       = 'n';
 		mncomparefitoption.daughterratio.singlebins.sigmoid           = 'n';
  
		mncomparefitoption.daughterratio.singlebins.unweighted     = 'n';
   		mncomparefitoption.daughterratio.singlebins.weighted       = 'n';
   		mncomparefitoption.daughterratio.singlebins.robust         = 'n';
  		mncomparefitoption.daughterratio.singlebins.robustweighted = 'n';
%

%	  Explore Double Bins 
%       Diameter --> Path Length?
         option.mncomparefit.daughterratio.diameter.pathlength = 'n';
%       Path Length --> Diameter?
         option.mncomparefit.daughterratio.pathlength.diameter = 'n';

%
%       First Bin Fits?
         option.mncomparefit.daughterratio.firstbinfit.fit = 'n';
%         Linear?
           option.mncomparefit.daughterratio.firstbinfit.linear = 'n';
%         Exponential?
           option.mncomparefit.daughterratio.firstbinfit.exponential = 'n';
%         Exponential w/ Offset?
           option.mncomparefit.daughterratio.firstbinfit.exponentialoffset = 'n';
%         Power?
           option.mncomparefit.daughterratio.firstbinfit.power = 'n';
%         Power w/ Offset?
           option.mncomparefit.daughterratio.firstbinfit.poweroffset = 'n';
%         Sigmoidal?
           option.mncomparefit.daughterratio.firstbinfit.sigmoid = 'n';
%
%       First Bin Fit Types
%         Unweighted?
           option.mncomparefit.daughterratio.firstbinfittype.unweighted = 'n';
%         Weighted?
           option.mncomparefit.daughterratio.firstbinfittype.weighted = 'n';
%         Robust?
           option.mncomparefit.daughterratio.firstbinfittype.robust = 'n';
%         Robust Weighted?
           option.mncomparefit.daughterratio.firstbinfittype.robustweighted = 'n';
%
%       Second Bin (Fit Parameter) Fits?
         option.mncomparefit.daughterratio.secondbinfit.fit = 'n';
%         Linear?
           option.mncomparefit.daughterratio.secondbinfit.linear = 'n';
%         Exponential?
           option.mncomparefit.daughterratio.secondbinfit.exponential = 'n';
%         Exponential w/ Offset?
           option.mncomparefit.daughterratio.secondbinfit.exponentialoffset = 'n';
%         Power?
           option.mncomparefit.daughterratio.secondbinfit.power = 'n';
%         Power w/ Offset?
           option.mncomparefit.daughterratio.secondbinfit.poweroffset = 'n';
%         Sigmoidal?
           option.mncomparefit.daughterratio.secondbinfit.sigmoid = 'n';
%
%
%		Fit Double Bins?
		  option.mncomparefit.daughterratio.doublebins.fit = 'n';
%		
%			First Bin Fit ('linear', 'exponential', 'exponentialoffset', 'power', 'poweroffset' or 'sigmoid'):
			  option.mncomparefit.daughterratio.doublebins.firstbin.fit = 'none';
%
%			First Bin Fit Type ('unweighted', 'weighted', 'robust' or 'robustweighted'):
			  option.mncomparefit.daughterratio.doublebins.firstbin.fittype = 'none';
%
%			Second Bin Fits (First Bin Fit Parameter Fits)
%			  Parameter 1 
%				Fit
				  option.mncomparefit.daughterratio.doublebins.parameter(1).fit = 'none';
%				Fit Type
				  option.mncomparefit.daughterratio.doublebins.parameter(1).fittype = 'none';
%			  Parameter 2
%				Fit
				  option.mncomparefit.daughterratio.doublebins.parameter(2).fit = 'none';
%				Fit Type
				  option.mncomparefit.daughterratio.doublebins.parameter(2).fittype = 'none';
%			  Parameter 3
%			    Fit
				  option.mncomparefit.daughterratio.doublebins.parameter(3).fit = 'none';
%				Fit Type
				  option.mncomparefit.daughterratio.doublebins.parameter(3).fittype = 'none';
%			  Parameter 4
%				Fit
				  option.mncomparefit.daughterratio.doublebins.parameter(4).fit = 'none';
%				Fit Type
				  option.mncomparefit.daughterratio.doublebins.parameter(4).fittype = 'none';
%
% ________________________________________________________________________
%
% Explore Parent / Daughter 1 Ratio?
   option.mncomparefit.parentdaughterratio.fit = 'n';
% Explore Parent / Daughter 2 Ratio?
   option.mncomparefit.parentdaughter2ratio.fit = 'n';
%
%     Explore Statistics
%       Mean?
         option.mncomparefit.parentdaughterratio.mean = 'n';
%       Standard Deviation?
         option.mncomparefit.parentdaughterratio.std = 'n';
%       Skewness?
         option.mncomparefit.parentdaughterratio.skew = 'n';
%       Kurtosis?
         option.mncomparefit.parentdaughterratio.kurt = 'n';
%
%     Explore Single Bins
%		Fit Diameter? 	
          option.mncomparefit.parentdaughterratio.diameter.fit = 'n';
%		Fit Path Length?
          option.mncomparefit.parentdaughterratio.pathlength.fit = 'n';
%       Fit Radial Distance?
          option.mncomparefit.parentdaughterratio.radialdistance.fit = 'n';
%       Fit Branch Length?
          option.mncomparefit.parentdaughterratio.branchlength.fit = 'n';
%
%	  Fit Single Bins?
		option.mncomparefit.parentdaughterratio.singlebins = 'n';
		
		mncomparefitoption.parentdaughterratio.singlebins.linear            = 'n';
  		mncomparefitoption.parentdaughterratio.singlebins.exponential       = 'n';
  		mncomparefitoption.parentdaughterratio.singlebins.exponentialoffset = 'n';
  		mncomparefitoption.parentdaughterratio.singlebins.power             = 'n';
  		mncomparefitoption.parentdaughterratio.singlebins.poweroffset       = 'n';
 		mncomparefitoption.parentdaughterratio.singlebins.sigmoid           = 'n';
  
		mncomparefitoption.parentdaughterratio.singlebins.unweighted     = 'n';
   		mncomparefitoption.parentdaughterratio.singlebins.weighted       = 'n';
   		mncomparefitoption.parentdaughterratio.singlebins.robust         = 'n';
  		mncomparefitoption.parentdaughterratio.singlebins.robustweighted = 'n';
%

%	  Explore Double Bins
%       Diameter --> Path Length?
         option.mncomparefit.parentdaughterratio.diameter.pathlength = 'n';
%       Path Length --> Diameter?
         option.mncomparefit.parentdaughterratio.pathlength.diameter = 'n';

%
%       First Bin Fits?
         option.mncomparefit.parentdaughterratio.firstbinfit.fit = 'n';
%         Linear?
           option.mncomparefit.parentdaughterratio.firstbinfit.linear = 'n';
%         Exponential?
           option.mncomparefit.parentdaughterratio.firstbinfit.exponential = 'n';
%         Exponential w/ Offset?
           option.mncomparefit.parentdaughterratio.firstbinfit.exponentialoffset = 'n';
%         Power?
           option.mncomparefit.parentdaughterratio.firstbinfit.power = 'n';
%         Power w/ Offset?
           option.mncomparefit.parentdaughterratio.firstbinfit.poweroffset = 'n';
%         Sigmoidal?
           option.mncomparefit.parentdaughterratio.firstbinfit.sigmoid = 'n';
%
%       First Bin Fit Types
%         Unweighted?
           option.mncomparefit.parentdaughterratio.firstbinfittype.unweighted = 'n';
%         Weighted?
           option.mncomparefit.parentdaughterratio.firstbinfittype.weighted = 'n';
%         Robust?
           option.mncomparefit.parentdaughterratio.firstbinfittype.robust = 'n';
%         Robust Weighted?
           option.mncomparefit.parentdaughterratio.firstbinfittype.robustweighted = 'n';
%
%       Second Bin (Fit Parameter) Fits?
         option.mncomparefit.parentdaughterratio.secondbinfit.fit = 'n';
%         Linear?
           option.mncomparefit.parentdaughterratio.secondbinfit.linear = 'n';
%         Exponential?
           option.mncomparefit.parentdaughterratio.secondbinfit.exponential = 'n';
%         Exponential w/ Offset?
           option.mncomparefit.parentdaughterratio.secondbinfit.exponentialoffset = 'n';
%         Power?
           option.mncomparefit.parentdaughterratio.secondbinfit.power = 'n';
%         Power w/ Offset?
           option.mncomparefit.parentdaughterratio.secondbinfit.poweroffset = 'n';
%         Sigmoidal?
           option.mncomparefit.parentdaughterratio.secondbinfit.sigmoid = 'n';
%
%
%		Fit Double Bins?
		  option.mncomparefit.parentdaughterratio.doublebins.fit = 'n';
%		
%			First Bin Fit ('linear', 'exponential', 'exponentialoffset', 'power', 'poweroffset' or 'sigmoid'):
			  option.mncomparefit.parentdaughterratio.doublebins.firstbin.fit = 'none';
%
%			First Bin Fit Type ('unweighted', 'weighted', 'robust' or 'robustweighted'):
			  option.mncomparefit.parentdaughterratio.doublebins.firstbin.fittype = 'none';
%
%			Second Bin Fits (First Bin Fit Parameter Fits)
%			  Parameter 1 
%				Fit
				  option.mncomparefit.parentdaughterratio.doublebins.parameter(1).fit = 'none';
%				Fit Type
				  option.mncomparefit.parentdaughterratio.doublebins.parameter(1).fittype = 'none';
%			  Parameter 2
%				Fit
				  option.mncomparefit.parentdaughterratio.doublebins.parameter(2).fit = 'none';
%				Fit Type
				  option.mncomparefit.parentdaughterratio.doublebins.parameter(2).fittype = 'none';
%			  Parameter 3
%			    Fit
				  option.mncomparefit.parentdaughterratio.doublebins.parameter(3).fit = 'none';
%				Fit Type
				  option.mncomparefit.parentdaughterratio.doublebins.parameter(3).fittype = 'none';
%			  Parameter 4
%				Fit
				  option.mncomparefit.parentdaughterratio.doublebins.parameter(4).fit = 'none';
%				Fit Type
				  option.mncomparefit.parentdaughterratio.doublebins.parameter(4).fittype = 'none';
%
% ________________________________________________________________________