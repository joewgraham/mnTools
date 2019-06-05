function propertytable(controlanalysis,testanalysis)

warning('off', 'MATLAB:divideByZero');

if nargin == 1

    currentdirectory = cd;
    cd(controlanalysis.datapathname);
    
    if exist('tables','dir')==7
        cd('tables');
    else
        mkdir('tables');
        cd('tables');
    end
	
	properties = {'diameter','pathlength','radialdistance','branchlength','degree'};
	propertynames = {'Diameter','Path Length','Radial Distance','Branch Length','Degree'};
	
	for i = 1:length(properties)
	
		property = properties{i};
		propertyname = propertynames{i};
		
		position{1,1}  = sprintf('"%s Table -- %s"',propertyname,controlanalysis.inputfilename);
		eval(['maxbin = length(controlanalysis.' property '.' property ');']);
		
		for j = 1:maxbin
		
			binnumber = int2str(j);
			eval(['propertyvalue = controlanalysis.' property '.' property '(' binnumber ');']);
			positionsize = size(position);
			position{positionsize(1)+1,1} = sprintf('%s: %.5g', propertyname, propertyvalue);
		
			position{positionsize(1)+2,1}  = '"   Number of Segments"';
			position{positionsize(1)+3,1}  = '"        Intermediate"';
			position{positionsize(1)+4,1}  = '"        Terminal"';
			position{positionsize(1)+5,1}  = '"   Length"';
			position{positionsize(1)+6,1}  = '"        Intermediate"';
			position{positionsize(1)+7,1}  = '"        Terminal"';
			position{positionsize(1)+8,1}  = '"   Surface Area"';
			position{positionsize(1)+9,1} = '"         Intermediate"';
			position{positionsize(1)+10,1} = '"        Terminal"';
			position{positionsize(1)+11,1} = '"   Volume"';
			position{positionsize(1)+12,1} = '"        Intermediate"';
			position{positionsize(1)+13,1} = '"        Terminal"';
			position{positionsize(1)+14,1} = '"   Taper Rate"';
			position{positionsize(1)+15,1} = '"	       Intermediate"';
			position{positionsize(1)+16,1} = '"	       Terminal"';
			position{positionsize(1)+17,1} = '"   Rall Ratio (1.5)"';
			position{positionsize(1)+18,1} = '"   Rall Ratio (2.0)"';
			position{positionsize(1)+19,1} = '"   End Prob (Length)"';
			position{positionsize(1)+20,1} = '"	       Intermediate"';
			position{positionsize(1)+21,1} = '"	       Terminal"';
			position{positionsize(1)+22,1} = '"   End Prob (SA)"';
			position{positionsize(1)+23,1} = '"	       Intermediate"';
			position{positionsize(1)+24,1} = '"	       Terminal"';
			position{positionsize(1)+25,1} = '"   End Prob (Vol)"';
			position{positionsize(1)+26,1} = '"	       Intermediate"';
			position{positionsize(1)+27,1} = '"	       Terminal"';
			if ~strcmp(property,'diameter')
				position{positionsize(1)+28,1} = '"   Diameter"';
				position{positionsize(1)+29,1} = '"	       Intermediate"';
				position{positionsize(1)+30,1} = '"	       Terminal"';
			end
		
			position{positionsize(1)+1,2} = '"Mean"';
			eval(['position{positionsize(1)+2,2}  = controlanalysis.' property '.numbersegments(' binnumber ').mean;']);
			eval(['position{positionsize(1)+3,2}  = controlanalysis.bifurcation.' property '.numbersegments(' binnumber ').mean;']);
			eval(['position{positionsize(1)+4,2}  = controlanalysis.termination.' property '.numbersegments(' binnumber ').mean;']);
			eval(['position{positionsize(1)+5,2}  = controlanalysis.' property '.length(' binnumber ').mean;']);
			eval(['position{positionsize(1)+6,2}  = controlanalysis.bifurcation.' property '.length(' binnumber ').mean;']);
			eval(['position{positionsize(1)+7,2}  = controlanalysis.termination.' property '.length(' binnumber ').mean;']);
			eval(['position{positionsize(1)+8,2}  = controlanalysis.' property '.surfacearea(' binnumber ').mean;']);
			eval(['position{positionsize(1)+9,2}  = controlanalysis.bifurcation.' property '.surfacearea(' binnumber ').mean;']);
			eval(['position{positionsize(1)+10,2} = controlanalysis.termination.' property '.surfacearea(' binnumber ').mean;']);
			eval(['position{positionsize(1)+11,2} = controlanalysis.' property '.volume(' binnumber ').mean;']);
			eval(['position{positionsize(1)+12,2} = controlanalysis.bifurcation.' property '.volume(' binnumber ').mean;']);
			eval(['position{positionsize(1)+13,2} = controlanalysis.termination.' property '.volume(' binnumber ').mean;']);
			eval(['position{positionsize(1)+14,2} = controlanalysis.' property '.taperrate(' binnumber ').mean;']);
			eval(['position{positionsize(1)+15,2} = controlanalysis.bifurcation.' property '.taperrate(' binnumber ').mean;']);
			eval(['position{positionsize(1)+16,2} = controlanalysis.termination.' property '.taperrate(' binnumber ').mean;']);
			eval(['position{positionsize(1)+17,2} = controlanalysis.' property '.rallratio(' binnumber ').mean;']);
			eval(['position{positionsize(1)+18,2} = controlanalysis.' property '.rallratio2(' binnumber ').mean;']);
			%position{positionsize(1)+19,1} = '"   End Prob (Length)"';
			eval(['position{positionsize(1)+20,2} = controlanalysis.bifurcation.' property '.bifurcationprobability.length(' binnumber ');']);
			eval(['position{positionsize(1)+21,2} = controlanalysis.termination.' property '.terminationprobability.length(' binnumber ');']);
			%position{positionsize(1)+22,1} = '"   End Prob (SA)"';
			eval(['position{positionsize(1)+23,2} = controlanalysis.bifurcation.' property '.bifurcationprobability.surfacearea(' binnumber ');']);
			eval(['position{positionsize(1)+24,2} = controlanalysis.termination.' property '.terminationprobability.surfacearea(' binnumber ');']);
			%position{positionsize(1)+25,1} = '"   End Prob (Vol)"';
			eval(['position{positionsize(1)+26,2} = controlanalysis.bifurcation.' property '.bifurcationprobability.volume(' binnumber ');']);
			eval(['position{positionsize(1)+27,2} = controlanalysis.termination.' property '.terminationprobability.volume(' binnumber ');']);
			if ~strcmp(property,'diameter')
				eval(['position{positionsize(1)+28,2} = controlanalysis.' property '.diameter(' binnumber ').mean;']);
				eval(['position{positionsize(1)+29,2} = controlanalysis.bifurcation.' property '.diameter(' binnumber ').mean;']);
				eval(['position{positionsize(1)+30,2} = controlanalysis.termination.' property '.diameter(' binnumber ').mean;']);
			end
			
			
			position{positionsize(1)+1,2} = '"StDv"';
			eval(['position{positionsize(1)+2,2}  = controlanalysis.' property '.numbersegments(' binnumber ').std;']);
			eval(['position{positionsize(1)+3,2}  = controlanalysis.bifurcation.' property '.numbersegments(' binnumber ').std;']);
			eval(['position{positionsize(1)+4,2}  = controlanalysis.termination.' property '.numbersegments(' binnumber ').std;']);
			eval(['position{positionsize(1)+5,2}  = controlanalysis.' property '.length(' binnumber ').std;']);
			eval(['position{positionsize(1)+6,2}  = controlanalysis.bifurcation.' property '.length(' binnumber ').std;']);
			eval(['position{positionsize(1)+7,2}  = controlanalysis.termination.' property '.length(' binnumber ').std;']);
			eval(['position{positionsize(1)+8,2}  = controlanalysis.' property '.surfacearea(' binnumber ').std;']);
			eval(['position{positionsize(1)+9,2}  = controlanalysis.bifurcation.' property '.surfacearea(' binnumber ').std;']);
			eval(['position{positionsize(1)+10,2} = controlanalysis.termination.' property '.surfacearea(' binnumber ').std;']);
			eval(['position{positionsize(1)+11,2} = controlanalysis.' property '.volume(' binnumber ').std;']);
			eval(['position{positionsize(1)+12,2} = controlanalysis.bifurcation.' property '.volume(' binnumber ').std;']);
			eval(['position{positionsize(1)+13,2} = controlanalysis.termination.' property '.volume(' binnumber ').std;']);
			eval(['position{positionsize(1)+14,2} = controlanalysis.' property '.taperrate(' binnumber ').std;']);
			eval(['position{positionsize(1)+15,2} = controlanalysis.bifurcation.' property '.taperrate(' binnumber ').std;']);
			eval(['position{positionsize(1)+16,2} = controlanalysis.termination.' property '.taperrate(' binnumber ').std;']);
			eval(['position{positionsize(1)+17,2} = controlanalysis.' property '.rallratio(' binnumber ').std;']);
			eval(['position{positionsize(1)+18,2} = controlanalysis.' property '.rallratio2(' binnumber ').std;']);
			%position{positionsize(1)+19,1} = '"   End Prob (Length)"';
			eval(['position{positionsize(1)+20,2} = controlanalysis.bifurcation.' property '.bifurcationprobability.length(' binnumber ');']);
			eval(['position{positionsize(1)+21,2} = controlanalysis.termination.' property '.terminationprobability.length(' binnumber ');']);
			%position{positionsize(1)+22,1} = '"   End Prob (SA)"';
			eval(['position{positionsize(1)+23,2} = controlanalysis.bifurcation.' property '.bifurcationprobability.surfacearea(' binnumber ');']);
			eval(['position{positionsize(1)+24,2} = controlanalysis.termination.' property '.terminationprobability.surfacearea(' binnumber ');']);
			%position{positionsize(1)+25,1} = '"   End Prob (Vol)"';
			eval(['position{positionsize(1)+26,2} = controlanalysis.bifurcation.' property '.bifurcationprobability.volume(' binnumber ');']);
			eval(['position{positionsize(1)+27,2} = controlanalysis.termination.' property '.terminationprobability.volume(' binnumber ');']);
			if ~strcmp(property,'diameter')
				eval(['position{positionsize(1)+28,2} = controlanalysis.' property '.diameter(' binnumber ').mean;']);
				eval(['position{positionsize(1)+29,2} = controlanalysis.bifurcation.' property '.diameter(' binnumber ').mean;']);
				eval(['position{positionsize(1)+30,2} = controlanalysis.termination.' property '.diameter(' binnumber ').mean;']);
			end
			
		end
	
		filename = sprintf('%s_%s_table.csv',controlanalysis.inputfilename,properties{i});
		cell2csv(filename,position);
		cd(currentdirectory);
		
	end
	
	
	
	
	
	
	
    % overallmaxbranchorder = controlanalysis.maxbranchorder.max;
    
    % for i = 1:overallmaxbranchorder

        % rowcolposition{18*(i-1)+1,1} = sprintf('Branch Order %s',num2str(i));
        % rowcolposition{18*(i-1)+2,1} = 'Values';
        % rowcolposition{18*(i-1)+3,1} = 'Proximal Diameter';
        % rowcolposition{18*(i-1)+4,1} = 'Cyl Diameter';
        % rowcolposition{18*(i-1)+5,1} = 'Distal Diameter';
        % rowcolposition{18*(i-1)+6,1} = 'Mean Length';
        % rowcolposition{18*(i-1)+7,1} = 'Mean Surface Area';
        % rowcolposition{18*(i-1)+8,1} = 'Mean Volume';
        % rowcolposition{18*(i-1)+9,1} = 'Total Length';
        % rowcolposition{18*(i-1)+10,1} = 'Total Surface Area';
        % rowcolposition{18*(i-1)+11,1} = 'Total Volume';
        % rowcolposition{18*(i-1)+12,1} = 'Num Segments';
        % rowcolposition{18*(i-1)+13,1} = 'Num Bifurcations';
        % rowcolposition{18*(i-1)+14,1} = 'Num Terminations';
        % rowcolposition{18*(i-1)+15,1} = 'Mean Taper Rate';
        % rowcolposition{18*(i-1)+16,1} = 'Mean Taper Ratio';
        % rowcolposition{18*(i-1)+17,1} = 'Mean Rall Ratio';
        % rowcolposition{18*(i-1)+18,1} = 'Mean Daught Ratio';

        % rowcolposition{18*(i-1)+1,2}  = [];
        % rowcolposition{18*(i-1)+2,2}  = [];
        % rowcolposition{18*(i-1)+3,2}  = [];
        % rowcolposition{18*(i-1)+4,2}  = [];
        % rowcolposition{18*(i-1)+5,2}  = [];
        % rowcolposition{18*(i-1)+6,2}  = [];
        % rowcolposition{18*(i-1)+7,2}  = [];
        % rowcolposition{18*(i-1)+8,2}  = [];
        % rowcolposition{18*(i-1)+9,2}  = [];
        % rowcolposition{18*(i-1)+10,2} = [];
        % rowcolposition{18*(i-1)+11,2} = [];
        % rowcolposition{18*(i-1)+12,2} = [];
        % rowcolposition{18*(i-1)+13,2} = [];
        % rowcolposition{18*(i-1)+14,2} = [];
        % rowcolposition{18*(i-1)+15,2} = [];
        % rowcolposition{18*(i-1)+16,2} = [];
        % rowcolposition{18*(i-1)+17,2} = [];
        % rowcolposition{18*(i-1)+18,2} = [];
        
    % end


    % for i = 1:controlanalysis.maxbranchorder.max

        % rowcolposition{18*(i-1)+1,1} = sprintf('Branch Order %s',num2str(i));
        % rowcolposition{18*(i-1)+2,1} = 'Values';
        % rowcolposition{18*(i-1)+3,1} = 'Proximal Diameter';
        % rowcolposition{18*(i-1)+4,1} = 'Cyl Diameter';
        % rowcolposition{18*(i-1)+5,1} = 'Distal Diameter';
        % rowcolposition{18*(i-1)+6,1} = 'Mean Length';
        % rowcolposition{18*(i-1)+7,1} = 'Mean Surface Area';
        % rowcolposition{18*(i-1)+8,1} = 'Mean Volume';
        % rowcolposition{18*(i-1)+9,1} = 'Total Length';
        % rowcolposition{18*(i-1)+10,1} = 'Total Surface Area';
        % rowcolposition{18*(i-1)+11,1} = 'Total Volume';
        % rowcolposition{18*(i-1)+12,1} = 'Num Segments';
        % rowcolposition{18*(i-1)+13,1} = 'Num Bifurcations';
        % rowcolposition{18*(i-1)+14,1} = 'Num Terminations';
        % rowcolposition{18*(i-1)+15,1} = 'Mean Taper Rate';
        % rowcolposition{18*(i-1)+16,1} = 'Mean Taper Ratio';
        % rowcolposition{18*(i-1)+17,1} = 'Mean Rall Ratio';
        % rowcolposition{18*(i-1)+18,1} = 'Mean Daught Ratio';

        % rowcolposition{18*(i-1)+1,2}  = controlanalysis.inputfilename;
        % rowcolposition{18*(i-1)+2,2}  = 'Mean';
        % rowcolposition{18*(i-1)+3,2}  = mean([controlanalysis.branchorder.proximaldiameter(i).values]);
        % rowcolposition{18*(i-1)+4,2}  = mean([controlanalysis.branchorder.cylindricaldiameter(i).values]);
        % rowcolposition{18*(i-1)+5,2}  = mean([controlanalysis.branchorder.distaldiameter(i).values]);
        % rowcolposition{18*(i-1)+6,2}  = mean([controlanalysis.branchorder.length(i).values]);
        % rowcolposition{18*(i-1)+7,2}  = mean([controlanalysis.branchorder.surfacearea(i).values]);
        % rowcolposition{18*(i-1)+8,2}  = mean([controlanalysis.branchorder.volume(i).values]);
        % rowcolposition{18*(i-1)+9,2}  = mean([controlanalysis.branchorder.totallength(i).values]);
        % rowcolposition{18*(i-1)+10,2} = mean([controlanalysis.branchorder.totalsurfacearea(i).values]);
        % rowcolposition{18*(i-1)+11,2} = mean([controlanalysis.branchorder.totalvolume(i).values]);
        % rowcolposition{18*(i-1)+12,2} = mean([controlanalysis.branchorder.numbersegments(i).values]);
        % rowcolposition{18*(i-1)+13,2} = mean([controlanalysis.branchorder.numberbifurcations(i).values]);
        % rowcolposition{18*(i-1)+14,2} = mean([controlanalysis.branchorder.numberterminations(i).values]);
        % rowcolposition{18*(i-1)+15,2} = mean([controlanalysis.branchorder.taperrate(i).values]);
        % rowcolposition{18*(i-1)+16,2} = mean([controlanalysis.branchorder.taperratio(i).values]);
        % if i < min(controlanalysis.maxbranchorder.max)
            % rowcolposition{18*(i-1)+17,2} = mean([controlanalysis.branchorder.rallratio(i).values]);
            % rowcolposition{18*(i-1)+18,2} = mean([controlanalysis.branchorder.daughterratio(i).values]);
        % else
            % rowcolposition{18*(i-1)+17,2} = [];
            % rowcolposition{18*(i-1)+18,2} = [];
        % end

        % rowcolposition{18*(i-1)+1,3}  = ' ';
        % rowcolposition{18*(i-1)+2,3}  = 'STD';
        % rowcolposition{18*(i-1)+3,3}  = std([controlanalysis.branchorder.proximaldiameter(i).values]);
        % rowcolposition{18*(i-1)+4,3}  = std([controlanalysis.branchorder.cylindricaldiameter(i).values]);
        % rowcolposition{18*(i-1)+5,3}  = std([controlanalysis.branchorder.distaldiameter(i).values]);
        % rowcolposition{18*(i-1)+6,3}  = std([controlanalysis.branchorder.length(i).values]);
        % rowcolposition{18*(i-1)+7,3}  = std([controlanalysis.branchorder.surfacearea(i).values]);
        % rowcolposition{18*(i-1)+8,3}  = std([controlanalysis.branchorder.volume(i).values]);
        % rowcolposition{18*(i-1)+9,3}  = std([controlanalysis.branchorder.totallength(i).values]);
        % rowcolposition{18*(i-1)+10,3} = std([controlanalysis.branchorder.totalsurfacearea(i).values]);
        % rowcolposition{18*(i-1)+11,3} = std([controlanalysis.branchorder.totalvolume(i).values]);
        % rowcolposition{18*(i-1)+12,3} = std([controlanalysis.branchorder.numbersegments(i).values]);
        % rowcolposition{18*(i-1)+13,3} = std([controlanalysis.branchorder.numberbifurcations(i).values]);
        % rowcolposition{18*(i-1)+14,3} = std([controlanalysis.branchorder.numberterminations(i).values]);
        % rowcolposition{18*(i-1)+15,3} = std([controlanalysis.branchorder.taperrate(i).values]);
        % rowcolposition{18*(i-1)+16,3} = std([controlanalysis.branchorder.taperratio(i).values]);
        % if i < min(controlanalysis.maxbranchorder.max)
            % rowcolposition{18*(i-1)+17,3} = std([controlanalysis.branchorder.rallratio(i).values]);
            % rowcolposition{18*(i-1)+18,3} = std([controlanalysis.branchorder.daughterratio(i).values]);
        % else
            % rowcolposition{18*(i-1)+17,3} = [];
            % rowcolposition{18*(i-1)+18,3} = [];
        % end
        
        % rowcolposition{18*(i-1)+1,4}  = ' ';
        % rowcolposition{18*(i-1)+2,4}  = 'Skew';
        % rowcolposition{18*(i-1)+3,4}  = skewness([controlanalysis.branchorder.proximaldiameter(i).values]);
        % rowcolposition{18*(i-1)+4,4}  = skewness([controlanalysis.branchorder.cylindricaldiameter(i).values]);
        % rowcolposition{18*(i-1)+5,4}  = skewness([controlanalysis.branchorder.distaldiameter(i).values]);
        % rowcolposition{18*(i-1)+6,4}  = skewness([controlanalysis.branchorder.length(i).values]);
        % rowcolposition{18*(i-1)+7,4}  = skewness([controlanalysis.branchorder.surfacearea(i).values]);
        % rowcolposition{18*(i-1)+8,4}  = skewness([controlanalysis.branchorder.volume(i).values]);
        % rowcolposition{18*(i-1)+9,4}  = skewness([controlanalysis.branchorder.totallength(i).values]);
        % rowcolposition{18*(i-1)+10,4} = skewness([controlanalysis.branchorder.totalsurfacearea(i).values]);
        % rowcolposition{18*(i-1)+11,4} = skewness([controlanalysis.branchorder.totalvolume(i).values]);
        % rowcolposition{18*(i-1)+12,4} = skewness([controlanalysis.branchorder.numbersegments(i).values]);
        % rowcolposition{18*(i-1)+13,4} = skewness([controlanalysis.branchorder.numberbifurcations(i).values]);
        % rowcolposition{18*(i-1)+14,4} = skewness([controlanalysis.branchorder.numberterminations(i).values]);
        % rowcolposition{18*(i-1)+15,4} = skewness([controlanalysis.branchorder.taperrate(i).values]);
        % rowcolposition{18*(i-1)+16,4} = skewness([controlanalysis.branchorder.taperratio(i).values]);
        % if i < min(controlanalysis.maxbranchorder.max)
            % rowcolposition{18*(i-1)+17,4} = skewness([controlanalysis.branchorder.rallratio(i).values]);
            % rowcolposition{18*(i-1)+18,4} = skewness([controlanalysis.branchorder.daughterratio(i).values]);
        % else
            % rowcolposition{18*(i-1)+17,4} = [];
            % rowcolposition{18*(i-1)+18,4} = [];
        % end
        
        % rowcolposition{18*(i-1)+1,5}  = ' ';
        % rowcolposition{18*(i-1)+2,5}  = 'Kurt';
        % rowcolposition{18*(i-1)+3,5}  = kurtosis([controlanalysis.branchorder.proximaldiameter(i).values]);
        % rowcolposition{18*(i-1)+4,5}  = kurtosis([controlanalysis.branchorder.cylindricaldiameter(i).values]);
        % rowcolposition{18*(i-1)+5,5}  = kurtosis([controlanalysis.branchorder.distaldiameter(i).values]);
        % rowcolposition{18*(i-1)+6,5}  = kurtosis([controlanalysis.branchorder.length(i).values]);
        % rowcolposition{18*(i-1)+7,5}  = kurtosis([controlanalysis.branchorder.surfacearea(i).values]);
        % rowcolposition{18*(i-1)+8,5}  = kurtosis([controlanalysis.branchorder.volume(i).values]);
        % rowcolposition{18*(i-1)+9,5}  = kurtosis([controlanalysis.branchorder.totallength(i).values]);
        % rowcolposition{18*(i-1)+10,5} = kurtosis([controlanalysis.branchorder.totalsurfacearea(i).values]);
        % rowcolposition{18*(i-1)+11,5} = kurtosis([controlanalysis.branchorder.totalvolume(i).values]);
        % rowcolposition{18*(i-1)+12,5} = kurtosis([controlanalysis.branchorder.numbersegments(i).values]);
        % rowcolposition{18*(i-1)+13,5} = kurtosis([controlanalysis.branchorder.numberbifurcations(i).values]);
        % rowcolposition{18*(i-1)+14,5} = kurtosis([controlanalysis.branchorder.numberterminations(i).values]);
        % rowcolposition{18*(i-1)+15,5} = kurtosis([controlanalysis.branchorder.taperrate(i).values]);
        % rowcolposition{18*(i-1)+16,5} = kurtosis([controlanalysis.branchorder.taperratio(i).values]);
        % if i < min(controlanalysis.maxbranchorder.max)
            % rowcolposition{18*(i-1)+17,5} = kurtosis([controlanalysis.branchorder.rallratio(i).values]);
            % rowcolposition{18*(i-1)+18,5} = kurtosis([controlanalysis.branchorder.daughterratio(i).values]);
        % else
            % rowcolposition{18*(i-1)+17,5} = [];
            % rowcolposition{18*(i-1)+18,5} = [];
        % end
        
        % rowcolposition{18*(i-1)+1,6}  = ' ';
        % rowcolposition{18*(i-1)+2,6}  = 'Min';
        % rowcolposition{18*(i-1)+3,6}  = min([controlanalysis.branchorder.proximaldiameter(i).values]);
        % rowcolposition{18*(i-1)+4,6}  = min([controlanalysis.branchorder.cylindricaldiameter(i).values]);
        % rowcolposition{18*(i-1)+5,6}  = min([controlanalysis.branchorder.distaldiameter(i).values]);
        % rowcolposition{18*(i-1)+6,6}  = min([controlanalysis.branchorder.length(i).values]);
        % rowcolposition{18*(i-1)+7,6}  = min([controlanalysis.branchorder.surfacearea(i).values]);
        % rowcolposition{18*(i-1)+8,6}  = min([controlanalysis.branchorder.volume(i).values]);
        % rowcolposition{18*(i-1)+9,6}  = min([controlanalysis.branchorder.totallength(i).values]);
        % rowcolposition{18*(i-1)+10,6} = min([controlanalysis.branchorder.totalsurfacearea(i).values]);
        % rowcolposition{18*(i-1)+11,6} = min([controlanalysis.branchorder.totalvolume(i).values]);
        % rowcolposition{18*(i-1)+12,6} = min([controlanalysis.branchorder.numbersegments(i).values]);
        % rowcolposition{18*(i-1)+13,6} = min([controlanalysis.branchorder.numberbifurcations(i).values]);
        % rowcolposition{18*(i-1)+14,6} = min([controlanalysis.branchorder.numberterminations(i).values]);
        % rowcolposition{18*(i-1)+15,6} = min([controlanalysis.branchorder.taperrate(i).values]);
        % rowcolposition{18*(i-1)+16,6} = min([controlanalysis.branchorder.taperratio(i).values]);
        % if i < min(controlanalysis.maxbranchorder.max)
            % rowcolposition{18*(i-1)+17,6} = min([controlanalysis.branchorder.rallratio(i).values]);
            % rowcolposition{18*(i-1)+18,6} = min([controlanalysis.branchorder.daughterratio(i).values]);
        % else
            % rowcolposition{18*(i-1)+17,6} = [];
            % rowcolposition{18*(i-1)+18,6} = [];
        % end
        
        % rowcolposition{18*(i-1)+1,7}  = ' ';
        % rowcolposition{18*(i-1)+2,7}  = 'Max';
        % rowcolposition{18*(i-1)+3,7}  = max([controlanalysis.branchorder.proximaldiameter(i).values]);
        % rowcolposition{18*(i-1)+4,7}  = max([controlanalysis.branchorder.cylindricaldiameter(i).values]);
        % rowcolposition{18*(i-1)+5,7}  = max([controlanalysis.branchorder.distaldiameter(i).values]);
        % rowcolposition{18*(i-1)+6,7}  = max([controlanalysis.branchorder.length(i).values]);
        % rowcolposition{18*(i-1)+7,7}  = max([controlanalysis.branchorder.surfacearea(i).values]);
        % rowcolposition{18*(i-1)+8,7}  = max([controlanalysis.branchorder.volume(i).values]);
        % rowcolposition{18*(i-1)+9,7}  = max([controlanalysis.branchorder.totallength(i).values]);
        % rowcolposition{18*(i-1)+10,7} = max([controlanalysis.branchorder.totalsurfacearea(i).values]);
        % rowcolposition{18*(i-1)+11,7} = max([controlanalysis.branchorder.totalvolume(i).values]);
        % rowcolposition{18*(i-1)+12,7} = max([controlanalysis.branchorder.numbersegments(i).values]);
        % rowcolposition{18*(i-1)+13,7} = max([controlanalysis.branchorder.numberbifurcations(i).values]);
        % rowcolposition{18*(i-1)+14,7} = max([controlanalysis.branchorder.numberterminations(i).values]);
        % rowcolposition{18*(i-1)+15,7} = max([controlanalysis.branchorder.taperrate(i).values]);
        % rowcolposition{18*(i-1)+16,7} = max([controlanalysis.branchorder.taperratio(i).values]);
        % if i < min(controlanalysis.maxbranchorder.max)
            % rowcolposition{18*(i-1)+17,7} = max([controlanalysis.branchorder.rallratio(i).values]);
            % rowcolposition{18*(i-1)+18,7} = max([controlanalysis.branchorder.daughterratio(i).values]);
        % else
            % rowcolposition{18*(i-1)+17,7} = [];
            % rowcolposition{18*(i-1)+18,7} = [];
        % end
        
    % end

    % filename = sprintf('%s_%s',controlanalysis.inputfilename,'branchorder_table.csv');
    %xlswrite(filename,rowcolposition);
	% cell2csv(filename,rowcolposition);
    % cd(currentdirectory);

end

if nargin == 2

    

    maxbranchorder(1) = controlanalysis.maxbranchorder.max;
    for i=1:length(fieldnames(testanalysis))
        names = fieldnames(testanalysis);
        eval(['currenttestanalysis = testanalysis.' char(names(i)) ';']);
        maxbranchorder(i+1) = currenttestanalysis.maxbranchorder.max;
    end
    overallmaxbranchorder = max(maxbranchorder);
    numberpops = 1 + length(fieldnames(testanalysis));

    for i = 1:overallmaxbranchorder

        rowcolposition{18*(i-1)+1,1} = sprintf('Branch Order %s',num2str(i));
        rowcolposition{18*(i-1)+2,1} = 'Values';
        rowcolposition{18*(i-1)+3,1} = 'Proximal Diameter';
        rowcolposition{18*(i-1)+4,1} = 'Cyl Diameter';
        rowcolposition{18*(i-1)+5,1} = 'Distal Diameter';
        rowcolposition{18*(i-1)+6,1} = 'Mean Length';
        rowcolposition{18*(i-1)+7,1} = 'Mean Surface Area';
        rowcolposition{18*(i-1)+8,1} = 'Mean Volume';
        rowcolposition{18*(i-1)+9,1} = 'Total Length';
        rowcolposition{18*(i-1)+10,1} = 'Total Surface Area';
        rowcolposition{18*(i-1)+11,1} = 'Total Volume';
        rowcolposition{18*(i-1)+12,1} = 'Num Segments';
        rowcolposition{18*(i-1)+13,1} = 'Num Bifurcations';
        rowcolposition{18*(i-1)+14,1} = 'Num Terminations';
        rowcolposition{18*(i-1)+15,1} = 'Mean Taper Rate';
        rowcolposition{18*(i-1)+16,1} = 'Mean Taper Ratio';
        rowcolposition{18*(i-1)+17,1} = 'Mean Rall Ratio';
        rowcolposition{18*(i-1)+18,1} = 'Mean Daught Ratio';

        for j = 1:numberpops

            rowcolposition{18*(i-1)+1,13*(j-1)+2}  = [];
            rowcolposition{18*(i-1)+2,13*(j-1)+2}  = [];
            rowcolposition{18*(i-1)+3,13*(j-1)+2}  = [];
            rowcolposition{18*(i-1)+4,13*(j-1)+2}  = [];
            rowcolposition{18*(i-1)+5,13*(j-1)+2}  = [];
            rowcolposition{18*(i-1)+6,13*(j-1)+2}  = [];
            rowcolposition{18*(i-1)+7,13*(j-1)+2}  = [];
            rowcolposition{18*(i-1)+8,13*(j-1)+2}  = [];
            rowcolposition{18*(i-1)+9,13*(j-1)+2}  = [];
            rowcolposition{18*(i-1)+10,13*(j-1)+2} = [];
            rowcolposition{18*(i-1)+11,13*(j-1)+2} = [];
            rowcolposition{18*(i-1)+12,13*(j-1)+2} = [];
            rowcolposition{18*(i-1)+13,13*(j-1)+2} = [];
            rowcolposition{18*(i-1)+14,13*(j-1)+2} = [];
            rowcolposition{18*(i-1)+15,13*(j-1)+2} = [];
            rowcolposition{18*(i-1)+16,13*(j-1)+2} = [];
            rowcolposition{18*(i-1)+17,13*(j-1)+2} = [];
            rowcolposition{18*(i-1)+18,13*(j-1)+2} = [];

        end
    end


    for i = 1:controlanalysis.maxbranchorder.max

        rowcolposition{18*(i-1)+1,1} = sprintf('Branch Order %s',num2str(i));
        rowcolposition{18*(i-1)+2,1} = 'Values';
        rowcolposition{18*(i-1)+3,1} = 'Proximal Diameter';
        rowcolposition{18*(i-1)+4,1} = 'Cyl Diameter';
        rowcolposition{18*(i-1)+5,1} = 'Distal Diameter';
        rowcolposition{18*(i-1)+6,1} = 'Mean Length';
        rowcolposition{18*(i-1)+7,1} = 'Mean Surface Area';
        rowcolposition{18*(i-1)+8,1} = 'Mean Volume';
        rowcolposition{18*(i-1)+9,1} = 'Total Length';
        rowcolposition{18*(i-1)+10,1} = 'Total Surface Area';
        rowcolposition{18*(i-1)+11,1} = 'Total Volume';
        rowcolposition{18*(i-1)+12,1} = 'Num Segments';
        rowcolposition{18*(i-1)+13,1} = 'Num Bifurcations';
        rowcolposition{18*(i-1)+14,1} = 'Num Terminations';
        rowcolposition{18*(i-1)+15,1} = 'Mean Taper Rate';
        rowcolposition{18*(i-1)+16,1} = 'Mean Taper Ratio';
        rowcolposition{18*(i-1)+17,1} = 'Mean Rall Ratio';
        rowcolposition{18*(i-1)+18,1} = 'Mean Daught Ratio';

        rowcolposition{18*(i-1)+1,2}  = controlanalysis.inputfilename;
        rowcolposition{18*(i-1)+2,2}  = 'Mean';
        rowcolposition{18*(i-1)+3,2}  = mean([controlanalysis.branchorder.proximaldiameter(i).values]);
        rowcolposition{18*(i-1)+4,2}  = mean([controlanalysis.branchorder.cylindricaldiameter(i).values]);
        rowcolposition{18*(i-1)+5,2}  = mean([controlanalysis.branchorder.distaldiameter(i).values]);
        rowcolposition{18*(i-1)+6,2}  = mean([controlanalysis.branchorder.length(i).values]);
        rowcolposition{18*(i-1)+7,2}  = mean([controlanalysis.branchorder.surfacearea(i).values]);
        rowcolposition{18*(i-1)+8,2}  = mean([controlanalysis.branchorder.volume(i).values]);
        rowcolposition{18*(i-1)+9,2}  = mean([controlanalysis.branchorder.totallength(i).values]);
        rowcolposition{18*(i-1)+10,2} = mean([controlanalysis.branchorder.totalsurfacearea(i).values]);
        rowcolposition{18*(i-1)+11,2} = mean([controlanalysis.branchorder.totalvolume(i).values]);
        rowcolposition{18*(i-1)+12,2} = mean([controlanalysis.branchorder.numbersegments(i).values]);
        rowcolposition{18*(i-1)+13,2} = mean([controlanalysis.branchorder.numberbifurcations(i).values]);
        rowcolposition{18*(i-1)+14,2} = mean([controlanalysis.branchorder.numberterminations(i).values]);
        rowcolposition{18*(i-1)+15,2} = mean([controlanalysis.branchorder.taperrate(i).values]);
        rowcolposition{18*(i-1)+16,2} = mean([controlanalysis.branchorder.taperratio(i).values]);
        if i < min(controlanalysis.maxbranchorder.max)
            rowcolposition{18*(i-1)+17,2} = mean([controlanalysis.branchorder.rallratio(i).values]);
            rowcolposition{18*(i-1)+18,2} = mean([controlanalysis.branchorder.daughterratio(i).values]);
        else
            rowcolposition{18*(i-1)+17,2} = [];
            rowcolposition{18*(i-1)+18,2} = [];
        end

        rowcolposition{18*(i-1)+1,3}  = ' ';
        rowcolposition{18*(i-1)+2,3}  = 'STD';
        rowcolposition{18*(i-1)+3,3}  = std([controlanalysis.branchorder.proximaldiameter(i).values]);
        rowcolposition{18*(i-1)+4,3}  = std([controlanalysis.branchorder.cylindricaldiameter(i).values]);
        rowcolposition{18*(i-1)+5,3}  = std([controlanalysis.branchorder.distaldiameter(i).values]);
        rowcolposition{18*(i-1)+6,3}  = std([controlanalysis.branchorder.length(i).values]);
        rowcolposition{18*(i-1)+7,3}  = std([controlanalysis.branchorder.surfacearea(i).values]);
        rowcolposition{18*(i-1)+8,3}  = std([controlanalysis.branchorder.volume(i).values]);
        rowcolposition{18*(i-1)+9,3}  = std([controlanalysis.branchorder.totallength(i).values]);
        rowcolposition{18*(i-1)+10,3} = std([controlanalysis.branchorder.totalsurfacearea(i).values]);
        rowcolposition{18*(i-1)+11,3} = std([controlanalysis.branchorder.totalvolume(i).values]);
        rowcolposition{18*(i-1)+12,3} = std([controlanalysis.branchorder.numbersegments(i).values]);
        rowcolposition{18*(i-1)+13,3} = std([controlanalysis.branchorder.numberbifurcations(i).values]);
        rowcolposition{18*(i-1)+14,3} = std([controlanalysis.branchorder.numberterminations(i).values]);
        rowcolposition{18*(i-1)+15,3} = std([controlanalysis.branchorder.taperrate(i).values]);
        rowcolposition{18*(i-1)+16,3} = std([controlanalysis.branchorder.taperratio(i).values]);
        if i < min(controlanalysis.maxbranchorder.max)
            rowcolposition{18*(i-1)+17,3} = std([controlanalysis.branchorder.rallratio(i).values]);
            rowcolposition{18*(i-1)+18,3} = std([controlanalysis.branchorder.daughterratio(i).values]);
        else
            rowcolposition{18*(i-1)+17,3} = [];
            rowcolposition{18*(i-1)+18,3} = [];
        end
    end

    for i=1:length(fieldnames(testanalysis))

        names = fieldnames(testanalysis);
        eval(['currenttestanalysis = testanalysis.' char(names(i)) ';']);

        for j = 1:currenttestanalysis.maxbranchorder.max

            rowcolposition{18*(j-1)+1,11*(i-1)+4}  = currenttestanalysis.inputfilename;
            rowcolposition{18*(j-1)+2,11*(i-1)+4}  = 'Mean';
            rowcolposition{18*(j-1)+3,11*(i-1)+4}  = mean([currenttestanalysis.branchorder.proximaldiameter(j).values]);
            rowcolposition{18*(j-1)+4,11*(i-1)+4}  = mean([currenttestanalysis.branchorder.cylindricaldiameter(j).values]);
            rowcolposition{18*(j-1)+5,11*(i-1)+4}  = mean([currenttestanalysis.branchorder.distaldiameter(j).values]);
            rowcolposition{18*(j-1)+6,11*(i-1)+4}  = mean([currenttestanalysis.branchorder.length(j).values]);
            rowcolposition{18*(j-1)+7,11*(i-1)+4}  = mean([currenttestanalysis.branchorder.surfacearea(j).values]);
            rowcolposition{18*(j-1)+8,11*(i-1)+4}  = mean([currenttestanalysis.branchorder.volume(j).values]);
            rowcolposition{18*(j-1)+9,11*(i-1)+4}  = mean([currenttestanalysis.branchorder.totallength(j).values]);
            rowcolposition{18*(j-1)+10,11*(i-1)+4} = mean([currenttestanalysis.branchorder.totalsurfacearea(j).values]);
            rowcolposition{18*(j-1)+11,11*(i-1)+4} = mean([currenttestanalysis.branchorder.totalvolume(j).values]);
            rowcolposition{18*(j-1)+12,11*(i-1)+4} = mean([currenttestanalysis.branchorder.numbersegments(j).values]);
            rowcolposition{18*(j-1)+13,11*(i-1)+4} = mean([currenttestanalysis.branchorder.numberbifurcations(j).values]);
            rowcolposition{18*(j-1)+14,11*(i-1)+4} = mean([currenttestanalysis.branchorder.numberterminations(j).values]);
            rowcolposition{18*(j-1)+15,11*(i-1)+4} = mean([currenttestanalysis.branchorder.taperrate(j).values]);
            rowcolposition{18*(j-1)+16,11*(i-1)+4} = mean([currenttestanalysis.branchorder.taperratio(j).values]);
            if j < currenttestanalysis.maxbranchorder.max
                rowcolposition{18*(j-1)+17,11*(i-1)+4} = mean([currenttestanalysis.branchorder.rallratio(j).values]);
                rowcolposition{18*(j-1)+18,11*(i-1)+4} = mean([currenttestanalysis.branchorder.daughterratio(j).values]);
            else
                rowcolposition{18*(j-1)+17,11*(i-1)+4} = [];
                rowcolposition{18*(j-1)+18,11*(i-1)+4} = [];
            end

            rowcolposition{18*(j-1)+1,11*(i-1)+5}  = ' ';
            rowcolposition{18*(j-1)+2,11*(i-1)+5}  = 'STD';
            rowcolposition{18*(j-1)+3,11*(i-1)+5}  = std([currenttestanalysis.branchorder.proximaldiameter(j).values]);
            rowcolposition{18*(j-1)+4,11*(i-1)+5}  = std([currenttestanalysis.branchorder.cylindricaldiameter(j).values]);
            rowcolposition{18*(j-1)+5,11*(i-1)+5}  = std([currenttestanalysis.branchorder.distaldiameter(j).values]);
            rowcolposition{18*(j-1)+6,11*(i-1)+5}  = std([currenttestanalysis.branchorder.length(j).values]);
            rowcolposition{18*(j-1)+7,11*(i-1)+5}  = std([currenttestanalysis.branchorder.surfacearea(j).values]);
            rowcolposition{18*(j-1)+8,11*(i-1)+5}  = std([currenttestanalysis.branchorder.volume(j).values]);
            rowcolposition{18*(j-1)+9,11*(i-1)+5}  = std([currenttestanalysis.branchorder.totallength(j).values]);
            rowcolposition{18*(j-1)+10,11*(i-1)+5} = std([currenttestanalysis.branchorder.totalsurfacearea(j).values]);
            rowcolposition{18*(j-1)+11,11*(i-1)+5} = std([currenttestanalysis.branchorder.totalvolume(j).values]);
            rowcolposition{18*(j-1)+12,11*(i-1)+5} = std([currenttestanalysis.branchorder.numbersegments(j).values]);
            rowcolposition{18*(j-1)+13,11*(i-1)+5} = std([currenttestanalysis.branchorder.numberbifurcations(j).values]);
            rowcolposition{18*(j-1)+14,11*(i-1)+5} = std([currenttestanalysis.branchorder.numberterminations(j).values]);
            rowcolposition{18*(j-1)+15,11*(i-1)+5} = std([currenttestanalysis.branchorder.taperrate(j).values]);
            rowcolposition{18*(j-1)+16,11*(i-1)+5} = std([currenttestanalysis.branchorder.taperratio(j).values]);
            if j < currenttestanalysis.maxbranchorder.max
                rowcolposition{18*(j-1)+17,11*(i-1)+5} = std([currenttestanalysis.branchorder.rallratio(j).values]);
                rowcolposition{18*(j-1)+18,11*(i-1)+5} = std([currenttestanalysis.branchorder.daughterratio(j).values]);
            else
                rowcolposition{18*(j-1)+17,11*(i-1)+5} = [];
                rowcolposition{18*(j-1)+18,11*(i-1)+5} = [];
            end

            if j <= controlanalysis.maxbranchorder.max

                proximaldiameterdiff        = 100*((mean(currenttestanalysis.branchorder.proximaldiameter(j).values)-mean(controlanalysis.branchorder.proximaldiameter(j).values))/mean(controlanalysis.branchorder.proximaldiameter(j).values));
                cylindricaldiameterdiff     = 100*((mean(currenttestanalysis.branchorder.cylindricaldiameter(j).values)-mean(controlanalysis.branchorder.cylindricaldiameter(j).values))/mean(controlanalysis.branchorder.cylindricaldiameter(j).values));
                distaldiameterdiff          = 100*((mean(currenttestanalysis.branchorder.distaldiameter(j).values)-mean(controlanalysis.branchorder.distaldiameter(j).values))/mean(controlanalysis.branchorder.distaldiameter(j).values));
                lengthdiff                  = 100*((mean(currenttestanalysis.branchorder.length(j).values)-mean(controlanalysis.branchorder.length(j).values))/mean(controlanalysis.branchorder.length(j).values));
                surfaceareadiff             = 100*((mean(currenttestanalysis.branchorder.surfacearea(j).values)-mean(controlanalysis.branchorder.surfacearea(j).values))/mean(controlanalysis.branchorder.surfacearea(j).values));
                volumediff                  = 100*((mean(currenttestanalysis.branchorder.volume(j).values)-mean(controlanalysis.branchorder.volume(j).values))/mean(controlanalysis.branchorder.volume(j).values));
                totallengthdiff                 = 100*((mean(currenttestanalysis.branchorder.totallength(j).values)-mean(controlanalysis.branchorder.totallength(j).values))/mean(controlanalysis.branchorder.totallength(j).values));
                totalsurfaceareadiff            = 100*((mean(currenttestanalysis.branchorder.totalsurfacearea(j).values)-mean(controlanalysis.branchorder.totalsurfacearea(j).values))/mean(controlanalysis.branchorder.totalsurfacearea(j).values));
                totalvolumediff                 = 100*((mean(currenttestanalysis.branchorder.totalvolume(j).values)-mean(controlanalysis.branchorder.totalvolume(j).values))/mean(controlanalysis.branchorder.totalvolume(j).values));
                numbersegmentsdiff              = 100*((mean(currenttestanalysis.branchorder.numbersegments(j).values)-mean(controlanalysis.branchorder.numbersegments(j).values))/mean(controlanalysis.branchorder.numbersegments(j).values));
                numberbifurcationsdiff          = 100*((mean(currenttestanalysis.branchorder.numberbifurcations(j).values)-mean(controlanalysis.branchorder.numberbifurcations(j).values))/mean(controlanalysis.branchorder.numberbifurcations(j).values));
                numberterminationsdiff          = 100*((mean(currenttestanalysis.branchorder.numberterminations(j).values)-mean(controlanalysis.branchorder.numberterminations(j).values))/mean(controlanalysis.branchorder.numberterminations(j).values));
                taperratediff               = 100*((mean(currenttestanalysis.branchorder.taperrate(j).values)-mean(controlanalysis.branchorder.taperrate(j).values))/mean(controlanalysis.branchorder.taperrate(j).values));
                taperratiodiff              = 100*((mean(currenttestanalysis.branchorder.taperratio(j).values)-mean(controlanalysis.branchorder.taperratio(j).values))/mean(controlanalysis.branchorder.taperratio(j).values));
                rallratiodiff               = 100*((mean(currenttestanalysis.branchorder.rallratio(j).values)-mean(controlanalysis.branchorder.rallratio(j).values))/mean(controlanalysis.branchorder.rallratio(j).values));
                daughterratiodiff           = 100*((mean(currenttestanalysis.branchorder.daughterratio(j).values)-mean(controlanalysis.branchorder.daughterratio(j).values))/mean(controlanalysis.branchorder.daughterratio(j).values));

                rowcolposition{18*(j-1)+1,11*(i-1)+6}  = '% Mean Diff';
                rowcolposition{18*(j-1)+2,11*(i-1)+6}  = ' ';
                rowcolposition{18*(j-1)+3,11*(i-1)+6}  = proximaldiameterdiff;
                rowcolposition{18*(j-1)+4,11*(i-1)+6}  = cylindricaldiameterdiff;
                rowcolposition{18*(j-1)+5,11*(i-1)+6}  = distaldiameterdiff;
                rowcolposition{18*(j-1)+6,11*(i-1)+6}  = lengthdiff;
                rowcolposition{18*(j-1)+7,11*(i-1)+6}  = surfaceareadiff;
                rowcolposition{18*(j-1)+8,11*(i-1)+6}  = volumediff;
                rowcolposition{18*(j-1)+9,11*(i-1)+6}  = totallengthdiff;
                rowcolposition{18*(j-1)+10,11*(i-1)+6} = totalsurfaceareadiff;
                rowcolposition{18*(j-1)+11,11*(i-1)+6} = totalvolumediff;
                rowcolposition{18*(j-1)+12,11*(i-1)+6} = numbersegmentsdiff;
                rowcolposition{18*(j-1)+13,11*(i-1)+6} = numberbifurcationsdiff;
                rowcolposition{18*(j-1)+14,11*(i-1)+6} = numberterminationsdiff;
                rowcolposition{18*(j-1)+15,11*(i-1)+6} = taperratediff;
                rowcolposition{18*(j-1)+16,11*(i-1)+6} = taperratiodiff;
                if j < min(controlanalysis.maxbranchorder.max,currenttestanalysis.maxbranchorder.max)
                    rowcolposition{18*(j-1)+17,11*(i-1)+6} = rallratiodiff;
                    rowcolposition{18*(j-1)+18,11*(i-1)+6} = daughterratiodiff;
                else
                    rowcolposition{18*(j-1)+17,11*(i-1)+6} = [];
                    rowcolposition{18*(j-1)+18,11*(i-1)+6} = [];
                end


                [proximaldiameterh,proximaldiameterp]             = ttest2(controlanalysis.branchorder.proximaldiameter(j).values,currenttestanalysis.branchorder.proximaldiameter(j).values);
                [cylindricaldiameterh,cylindricaldiameterp]       = ttest2(controlanalysis.branchorder.cylindricaldiameter(j).values,currenttestanalysis.branchorder.cylindricaldiameter(j).values);
                [distaldiameterh,distaldiameterp]                 = ttest2(controlanalysis.branchorder.distaldiameter(j).values,currenttestanalysis.branchorder.distaldiameter(j).values);
                [lengthh,lengthp]                                 = ttest2(controlanalysis.branchorder.length(j).values,currenttestanalysis.branchorder.length(j).values);
                [surfaceareah,surfaceareap]                       = ttest2(controlanalysis.branchorder.surfacearea(j).values,currenttestanalysis.branchorder.surfacearea(j).values);
                [volumeh,volumep]                                 = ttest2(controlanalysis.branchorder.volume(j).values,currenttestanalysis.branchorder.volume(j).values);
                [totallengthh,totallengthp]                               = ttest2(controlanalysis.branchorder.totallength(j).values,currenttestanalysis.branchorder.totallength(j).values);
                [totalsurfaceareah,totalsurfaceareap]                     = ttest2(controlanalysis.branchorder.totalsurfacearea(j).values,currenttestanalysis.branchorder.totalsurfacearea(j).values);
                [totalvolumeh,totalvolumep]                               = ttest2(controlanalysis.branchorder.totalvolume(j).values,currenttestanalysis.branchorder.totalvolume(j).values);
                [numbersegmentsh,numbersegmentsp]                         = ttest2(controlanalysis.branchorder.numbersegments(j).values,currenttestanalysis.branchorder.numbersegments(j).values);
                [numberbifurcationsh,numberbifurcationsp]                 = ttest2(controlanalysis.branchorder.numberbifurcations(j).values,currenttestanalysis.branchorder.numberbifurcations(j).values);
                [numberterminationsh,numberterminationsp]                 = ttest2(controlanalysis.branchorder.numberterminations(j).values,currenttestanalysis.branchorder.numberterminations(j).values);
                [taperrateh,taperratep]                           = ttest2(controlanalysis.branchorder.taperrate(j).values,currenttestanalysis.branchorder.taperrate(j).values);
                [taperratioh,taperratiop]                         = ttest2(controlanalysis.branchorder.taperratio(j).values,currenttestanalysis.branchorder.taperratio(j).values);
                if j < min(controlanalysis.maxbranchorder.max,currenttestanalysis.maxbranchorder.max)
                    [rallratioh,rallratiop]                       = ttest2(controlanalysis.branchorder.rallratio(j).values,currenttestanalysis.branchorder.rallratio(j).values);
                    [daughterratioh,daughterratiop]               = ttest2(controlanalysis.branchorder.daughterratio(j).values,currenttestanalysis.branchorder.daughterratio(j).values);
                else
                    rallratiop                                        = [];
                    rallratioh                                        = [];
                    daughterratiop                                    = [];
                    daughterratioh                                    = [];
                end


                if proximaldiameterh         == 0, proximaldiameterh = 'same'; else proximaldiameterh = 'diff'; end;
                if cylindricaldiameterh      == 0, cylindricaldiameterh = 'same'; else cylindricaldiameterh = 'diff'; end;
                if distaldiameterh           == 0, distaldiameterh = 'same'; else distaldiameterh = 'diff'; end;
                if lengthh                   == 0, lengthh = 'same'; else lengthh = 'diff'; end;
                if surfaceareah              == 0, surfaceareah = 'same'; else surfaceareah = 'diff'; end;
                if volumeh                   == 0, volumeh = 'same'; else volumeh = 'diff'; end;
                if totallengthh                  == 0, totallengthh = 'same'; else totallengthh = 'diff'; end;
                if totalsurfaceareah             == 0, totalsurfaceareah = 'same'; else totalsurfaceareah = 'diff'; end;
                if totalvolumeh                  == 0, totalvolumeh = 'same'; else totalvolumeh = 'diff'; end;
                if numbersegmentsh               == 0, numbersegmentsh = 'same'; else numbersegmentsh = 'diff'; end;
                if numberbifurcationsh           == 0, numberbifurcationsh = 'same'; else numberbifurcationsh = 'diff'; end;
                if numberterminationsh           == 0, numberterminationsh = 'same'; else numberterminationsh = 'diff'; end;
                if taperrateh                == 0, taperrateh = 'same'; else taperrateh = 'diff'; end;
                if taperratioh               == 0, taperratioh = 'same'; else taperratioh = 'diff'; end;
                if rallratioh                == 0, rallratioh = 'same'; else rallratioh = 'diff'; end;
                if daughterratioh            == 0, daughterratioh = 'same'; else daughterratioh = 'diff'; end;

                rowcolposition{18*(j-1)+1,11*(i-1)+7}  = 't-test ';
                rowcolposition{18*(j-1)+2,11*(i-1)+7}  = 'h';
                rowcolposition{18*(j-1)+3,11*(i-1)+7}  = proximaldiameterh;
                rowcolposition{18*(j-1)+4,11*(i-1)+7}  = cylindricaldiameterh;
                rowcolposition{18*(j-1)+5,11*(i-1)+7}  = distaldiameterh;
                rowcolposition{18*(j-1)+6,11*(i-1)+7}  = lengthh;
                rowcolposition{18*(j-1)+7,11*(i-1)+7}  = surfaceareah;
                rowcolposition{18*(j-1)+8,11*(i-1)+7}  = volumeh;
                rowcolposition{18*(j-1)+9,11*(i-1)+7}  = totallengthh;
                rowcolposition{18*(j-1)+10,11*(i-1)+7} = totalsurfaceareah;
                rowcolposition{18*(j-1)+11,11*(i-1)+7} = totalvolumeh;
                rowcolposition{18*(j-1)+12,11*(i-1)+7} = numbersegmentsh;
                rowcolposition{18*(j-1)+13,11*(i-1)+7} = numberbifurcationsh;
                rowcolposition{18*(j-1)+14,11*(i-1)+7} = numberterminationsh;
                rowcolposition{18*(j-1)+15,11*(i-1)+7} = taperrateh;
                rowcolposition{18*(j-1)+16,11*(i-1)+7} = taperratioh;
                if j < min(controlanalysis.maxbranchorder.max,currenttestanalysis.maxbranchorder.max)
                    rowcolposition{18*(j-1)+17,11*(i-1)+7} = rallratioh;
                    rowcolposition{18*(j-1)+18,11*(i-1)+7} = daughterratioh;
                else
                    rowcolposition{18*(j-1)+17,11*(i-1)+7} = [];
                    rowcolposition{18*(j-1)+18,11*(i-1)+7} = [];
                end

                rowcolposition{18*(j-1)+1,11*(i-1)+8}  = '(mean)';
                rowcolposition{18*(j-1)+2,11*(i-1)+8}  = 'p';
                rowcolposition{18*(j-1)+3,11*(i-1)+8}  = proximaldiameterp;
                rowcolposition{18*(j-1)+4,11*(i-1)+8}  = cylindricaldiameterp;
                rowcolposition{18*(j-1)+5,11*(i-1)+8}  = distaldiameterp;
                rowcolposition{18*(j-1)+6,11*(i-1)+8}  = lengthp;
                rowcolposition{18*(j-1)+7,11*(i-1)+8}  = surfaceareap;
                rowcolposition{18*(j-1)+8,11*(i-1)+8}  = volumep;
                rowcolposition{18*(j-1)+9,11*(i-1)+8}  = totallengthp;
                rowcolposition{18*(j-1)+10,11*(i-1)+8} = totalsurfaceareap;
                rowcolposition{18*(j-1)+11,11*(i-1)+8} = totalvolumep;
                rowcolposition{18*(j-1)+12,11*(i-1)+8} = numbersegmentsp;
                rowcolposition{18*(j-1)+13,11*(i-1)+8} = numberbifurcationsp;
                rowcolposition{18*(j-1)+14,11*(i-1)+8} = numberterminationsp;
                rowcolposition{18*(j-1)+15,11*(i-1)+8} = taperratep;
                rowcolposition{18*(j-1)+16,11*(i-1)+8} = taperratiop;
                if j < currenttestanalysis.maxbranchorder.max
                    rowcolposition{18*(j-1)+17,11*(i-1)+8} = rallratiop;
                    rowcolposition{18*(j-1)+18,11*(i-1)+8} = daughterratiop;
                else
                    rowcolposition{18*(j-1)+17,11*(i-1)+8} = [];
                    rowcolposition{18*(j-1)+18,11*(i-1)+8} = [];
                end


                [proximaldiameterp,proximaldiameterh]             = ranksum(controlanalysis.branchorder.proximaldiameter(j).values,currenttestanalysis.branchorder.proximaldiameter(j).values);
                [cylindricaldiameterp,cylindricaldiameterh]       = ranksum(controlanalysis.branchorder.cylindricaldiameter(j).values,currenttestanalysis.branchorder.cylindricaldiameter(j).values);
                [distaldiameterp,distaldiameterh]                 = ranksum(controlanalysis.branchorder.distaldiameter(j).values,currenttestanalysis.branchorder.distaldiameter(j).values);
                [lengthp,lengthh]                                 = ranksum(controlanalysis.branchorder.length(j).values,currenttestanalysis.branchorder.length(j).values);
                [surfaceareap,surfaceareah]                       = ranksum(controlanalysis.branchorder.surfacearea(j).values,currenttestanalysis.branchorder.surfacearea(j).values);
                [volumep,volumeh]                                 = ranksum(controlanalysis.branchorder.volume(j).values,currenttestanalysis.branchorder.volume(j).values);
                [totallengthp,totallengthh]                               = ranksum(controlanalysis.branchorder.totallength(j).values,currenttestanalysis.branchorder.totallength(j).values);
                [totalsurfaceareap,totalsurfaceareah]                     = ranksum(controlanalysis.branchorder.totalsurfacearea(j).values,currenttestanalysis.branchorder.totalsurfacearea(j).values);
                [totalvolumep,totalvolumeh]                               = ranksum(controlanalysis.branchorder.totalvolume(j).values,currenttestanalysis.branchorder.totalvolume(j).values);
                [numbersegmentsp,numbersegmentsh]                         = ranksum(controlanalysis.branchorder.numbersegments(j).values,currenttestanalysis.branchorder.numbersegments(j).values);
                [numberbifurcationsp,numberbifurcationsh]                 = ranksum(controlanalysis.branchorder.numberbifurcations(j).values,currenttestanalysis.branchorder.numberbifurcations(j).values);
                [numberterminationsp,numberterminationsh]                 = ranksum(controlanalysis.branchorder.numberterminations(j).values,currenttestanalysis.branchorder.numberterminations(j).values);
                [taperratep,taperrateh]                           = ranksum(controlanalysis.branchorder.taperrate(j).values,currenttestanalysis.branchorder.taperrate(j).values);
                [taperratiop,taperratioh]                         = ranksum(controlanalysis.branchorder.taperratio(j).values,currenttestanalysis.branchorder.taperratio(j).values);
                if j < min(controlanalysis.maxbranchorder.max,currenttestanalysis.maxbranchorder.max)
                    [rallratiop,rallratioh]                       = ranksum(controlanalysis.branchorder.rallratio(j).values,currenttestanalysis.branchorder.rallratio(j).values);
                    [daughterratiop,daughterratioh]               = ranksum(controlanalysis.branchorder.daughterratio(j).values,currenttestanalysis.branchorder.daughterratio(j).values);
                else
                    rallratiop                                        = [];
                    rallratioh                                        = [];
                    daughterratiop                                    = [];
                    daughterratioh                                    = [];
                end

                if proximaldiameterh         == 0, proximaldiameterh = 'same'; else proximaldiameterh = 'diff'; end;
                if cylindricaldiameterh      == 0, cylindricaldiameterh = 'same'; else cylindricaldiameterh = 'diff'; end;
                if distaldiameterh           == 0, distaldiameterh = 'same'; else distaldiameterh = 'diff'; end;
                if lengthh                   == 0, lengthh = 'same'; else lengthh = 'diff'; end;
                if surfaceareah              == 0, surfaceareah = 'same'; else surfaceareah = 'diff'; end;
                if volumeh                   == 0, volumeh = 'same'; else volumeh = 'diff'; end;
                if totallengthh                  == 0, totallengthh = 'same'; else totallengthh = 'diff'; end;
                if totalsurfaceareah             == 0, totalsurfaceareah = 'same'; else totalsurfaceareah = 'diff'; end;
                if totalvolumeh                  == 0, totalvolumeh = 'same'; else totalvolumeh = 'diff'; end;
                if numbersegmentsh               == 0, numbersegmentsh = 'same'; else numbersegmentsh = 'diff'; end;
                if numberbifurcationsh           == 0, numberbifurcationsh = 'same'; else numberbifurcationsh = 'diff'; end;
                if numberterminationsh           == 0, numberterminationsh = 'same'; else numberterminationsh = 'diff'; end;
                if taperrateh                == 0, taperrateh = 'same'; else taperrateh = 'diff'; end;
                if taperratioh               == 0, taperratioh = 'same'; else taperratioh = 'diff'; end;
                if rallratioh                == 0, rallratioh = 'same'; else rallratioh = 'diff'; end;
                if daughterratioh            == 0, daughterratioh = 'same'; else daughterratioh = 'diff'; end;

                rowcolposition{18*(j-1)+1,11*(i-1)+9}  = 'RS-test ';
                rowcolposition{18*(j-1)+2,11*(i-1)+9}  = 'h';
                rowcolposition{18*(j-1)+3,11*(i-1)+9}  = proximaldiameterh;
                rowcolposition{18*(j-1)+4,11*(i-1)+9}  = cylindricaldiameterh;
                rowcolposition{18*(j-1)+5,11*(i-1)+9}  = distaldiameterh;
                rowcolposition{18*(j-1)+6,11*(i-1)+9}  = lengthh;
                rowcolposition{18*(j-1)+7,11*(i-1)+9}  = surfaceareah;
                rowcolposition{18*(j-1)+8,11*(i-1)+9}  = volumeh;
                rowcolposition{18*(j-1)+9,11*(i-1)+9}  = totallengthh;
                rowcolposition{18*(j-1)+10,11*(i-1)+9} = totalsurfaceareah;
                rowcolposition{18*(j-1)+11,11*(i-1)+9} = totalvolumeh;
                rowcolposition{18*(j-1)+12,11*(i-1)+9} = numbersegmentsh;
                rowcolposition{18*(j-1)+13,11*(i-1)+9} = numberbifurcationsh;
                rowcolposition{18*(j-1)+14,11*(i-1)+9} = numberterminationsh;
                rowcolposition{18*(j-1)+15,11*(i-1)+9} = taperrateh;
                rowcolposition{18*(j-1)+16,11*(i-1)+9} = taperratioh;
                if j < min(controlanalysis.maxbranchorder.max,currenttestanalysis.maxbranchorder.max)
                    rowcolposition{18*(j-1)+17,11*(i-1)+9} = rallratioh;
                    rowcolposition{18*(j-1)+18,11*(i-1)+9} = daughterratioh;
                else
                    rowcolposition{18*(j-1)+17,11*(i-1)+9} = [];
                    rowcolposition{18*(j-1)+18,11*(i-1)+9} = [];
                end

                rowcolposition{18*(j-1)+1,11*(i-1)+10}  = '(median)';
                rowcolposition{18*(j-1)+2,11*(i-1)+10}  = 'p';
                rowcolposition{18*(j-1)+3,11*(i-1)+10}  = proximaldiameterp;
                rowcolposition{18*(j-1)+4,11*(i-1)+10}  = cylindricaldiameterp;
                rowcolposition{18*(j-1)+5,11*(i-1)+10}  = distaldiameterp;
                rowcolposition{18*(j-1)+6,11*(i-1)+10}  = lengthp;
                rowcolposition{18*(j-1)+7,11*(i-1)+10}  = surfaceareap;
                rowcolposition{18*(j-1)+8,11*(i-1)+10}  = volumep;
                rowcolposition{18*(j-1)+9,11*(i-1)+10}  = totallengthp;
                rowcolposition{18*(j-1)+10,11*(i-1)+10} = totalsurfaceareap;
                rowcolposition{18*(j-1)+11,11*(i-1)+10} = totalvolumep;
                rowcolposition{18*(j-1)+12,11*(i-1)+10} = numbersegmentsp;
                rowcolposition{18*(j-1)+13,11*(i-1)+10} = numberbifurcationsp;
                rowcolposition{18*(j-1)+14,11*(i-1)+10} = numberterminationsp;
                rowcolposition{18*(j-1)+15,11*(i-1)+10} = taperratep;
                rowcolposition{18*(j-1)+16,11*(i-1)+10} = taperratiop;
                if j < min(controlanalysis.maxbranchorder.max,currenttestanalysis.maxbranchorder.max)
                    rowcolposition{18*(j-1)+17,11*(i-1)+10} = rallratiop;
                    rowcolposition{18*(j-1)+18,11*(i-1)+10} = daughterratiop;
                else
                    rowcolposition{18*(j-1)+17,11*(i-1)+10} = [];
                    rowcolposition{18*(j-1)+18,11*(i-1)+10} = [];
                end


                if length(controlanalysis.branchorder.proximaldiameter(j).values) == length(currenttestanalysis.branchorder.proximaldiameter(j).values)
                    [proximaldiameterh,proximaldiameterp]             = ansaribradley(controlanalysis.branchorder.proximaldiameter(j).values,currenttestanalysis.branchorder.proximaldiameter(j).values);
                    [cylindricaldiameterh,cylindricaldiameterp]       = ansaribradley(controlanalysis.branchorder.cylindricaldiameter(j).values,currenttestanalysis.branchorder.cylindricaldiameter(j).values);
                    [distaldiameterh,distaldiameterp]                 = ansaribradley(controlanalysis.branchorder.distaldiameter(j).values,currenttestanalysis.branchorder.distaldiameter(j).values);
                    [lengthh,lengthp]                                 = ansaribradley(controlanalysis.branchorder.length(j).values,currenttestanalysis.branchorder.length(j).values);
                    [surfaceareah,surfaceareap]                       = ansaribradley(controlanalysis.branchorder.surfacearea(j).values,currenttestanalysis.branchorder.surfacearea(j).values);
                    [volumeh,volumep]                                 = ansaribradley(controlanalysis.branchorder.volume(j).values,currenttestanalysis.branchorder.volume(j).values);
                    [totallengthh,totallengthp]                               = ansaribradley(controlanalysis.branchorder.totallength(j).values,currenttestanalysis.branchorder.totallength(j).values);
                    [totalsurfaceareah,totalsurfaceareap]                     = ansaribradley(controlanalysis.branchorder.totalsurfacearea(j).values,currenttestanalysis.branchorder.totalsurfacearea(j).values);
                    [totalvolumeh,totalvolumep]                               = ansaribradley(controlanalysis.branchorder.totalvolume(j).values,currenttestanalysis.branchorder.totalvolume(j).values);
                    [numbersegmentsh,numbersegmentsp]                         = ansaribradley(controlanalysis.branchorder.numbersegments(j).values,currenttestanalysis.branchorder.numbersegments(j).values);
                    [numberbifurcationsh,numberbifurcationsp]                 = ansaribradley(controlanalysis.branchorder.numberbifurcations(j).values,currenttestanalysis.branchorder.numberbifurcations(j).values);
                    [numberterminationsh,numberterminationsp]                 = ansaribradley(controlanalysis.branchorder.numberterminations(j).values,currenttestanalysis.branchorder.numberterminations(j).values);
                    [taperrateh,taperratep]                           = ansaribradley(controlanalysis.branchorder.taperrate(j).values,currenttestanalysis.branchorder.taperrate(j).values);
                    [taperratioh,taperratiop]                         = ansaribradley(controlanalysis.branchorder.taperratio(j).values,currenttestanalysis.branchorder.taperratio(j).values);
                    if j < min(controlanalysis.maxbranchorder.max,currenttestanalysis.maxbranchorder.max) && length(controlanalysis.branchorder.rallratio(j).values) == length(currenttestanalysis.branchorder.rallratio(j).values)
                        [rallratioh,rallratiop]                       = ansaribradley(controlanalysis.branchorder.rallratio(j).values,currenttestanalysis.branchorder.rallratio(j).values);
                        [daughterratioh,daughterratiop]               = ansaribradley(controlanalysis.branchorder.daughterratio(j).values,currenttestanalysis.branchorder.daughterratio(j).values);
                    else
                        rallratiop                                        = [];
                        rallratioh                                        = [];
                        daughterratiop                                    = [];
                        daughterratioh                                    = [];
                    end
                end

                if proximaldiameterh         == 0, proximaldiameterh = 'same'; else proximaldiameterh = 'diff'; end;
                if cylindricaldiameterh      == 0, cylindricaldiameterh = 'same'; else cylindricaldiameterh = 'diff'; end;
                if distaldiameterh           == 0, distaldiameterh = 'same'; else distaldiameterh = 'diff'; end;
                if lengthh                   == 0, lengthh = 'same'; else lengthh = 'diff'; end;
                if surfaceareah              == 0, surfaceareah = 'same'; else surfaceareah = 'diff'; end;
                if volumeh                   == 0, volumeh = 'same'; else volumeh = 'diff'; end;
                if totallengthh                  == 0, totallengthh = 'same'; else totallengthh = 'diff'; end;
                if totalsurfaceareah             == 0, totalsurfaceareah = 'same'; else totalsurfaceareah = 'diff'; end;
                if totalvolumeh                  == 0, totalvolumeh = 'same'; else totalvolumeh = 'diff'; end;
                if numbersegmentsh               == 0, numbersegmentsh = 'same'; else numbersegmentsh = 'diff'; end;
                if numberbifurcationsh           == 0, numberbifurcationsh = 'same'; else numberbifurcationsh = 'diff'; end;
                if numberterminationsh           == 0, numberterminationsh = 'same'; else numberterminationsh = 'diff'; end;
                if taperrateh                == 0, taperrateh = 'same'; else taperrateh = 'diff'; end;
                if taperratioh               == 0, taperratioh = 'same'; else taperratioh = 'diff'; end;
                if rallratioh                == 0, rallratioh = 'same'; else rallratioh = 'diff'; end;
                if daughterratioh            == 0, daughterratioh = 'same'; else daughterratioh = 'diff'; end;

                rowcolposition{18*(j-1)+1,11*(i-1)+11}  = 'AB-test ';
                rowcolposition{18*(j-1)+2,11*(i-1)+11}  = 'h';
                rowcolposition{18*(j-1)+3,11*(i-1)+11}  = proximaldiameterh;
                rowcolposition{18*(j-1)+4,11*(i-1)+11}  = cylindricaldiameterh;
                rowcolposition{18*(j-1)+5,11*(i-1)+11}  = distaldiameterh;
                rowcolposition{18*(j-1)+6,11*(i-1)+11}  = lengthh;
                rowcolposition{18*(j-1)+7,11*(i-1)+11}  = surfaceareah;
                rowcolposition{18*(j-1)+8,11*(i-1)+11}  = volumeh;
                rowcolposition{18*(j-1)+9,11*(i-1)+11}  = totallengthh;
                rowcolposition{18*(j-1)+10,11*(i-1)+11} = totalsurfaceareah;
                rowcolposition{18*(j-1)+11,11*(i-1)+11} = totalvolumeh;
                rowcolposition{18*(j-1)+12,11*(i-1)+11} = numbersegmentsh;
                rowcolposition{18*(j-1)+13,11*(i-1)+11} = numberbifurcationsh;
                rowcolposition{18*(j-1)+14,11*(i-1)+11} = numberterminationsh;
                rowcolposition{18*(j-1)+15,11*(i-1)+11} = taperrateh;
                rowcolposition{18*(j-1)+16,11*(i-1)+11} = taperratioh;
                if j < min(controlanalysis.maxbranchorder.max,currenttestanalysis.maxbranchorder.max)
                    rowcolposition{18*(j-1)+17,11*(i-1)+11} = rallratioh;
                    rowcolposition{18*(j-1)+18,11*(i-1)+11} = daughterratioh;
                else
                    rowcolposition{18*(j-1)+17,11*(i-1)+11} = [];
                    rowcolposition{18*(j-1)+18,11*(i-1)+11} = [];
                end

                rowcolposition{18*(j-1)+1,11*(i-1)+12}  = '(variability)';
                rowcolposition{18*(j-1)+2,11*(i-1)+12}  = 'p';
                rowcolposition{18*(j-1)+3,11*(i-1)+12}  = proximaldiameterp;
                rowcolposition{18*(j-1)+4,11*(i-1)+12}  = cylindricaldiameterp;
                rowcolposition{18*(j-1)+5,11*(i-1)+12}  = distaldiameterp;
                rowcolposition{18*(j-1)+6,11*(i-1)+12}  = lengthp;
                rowcolposition{18*(j-1)+7,11*(i-1)+12}  = surfaceareap;
                rowcolposition{18*(j-1)+8,11*(i-1)+12}  = volumep;
                rowcolposition{18*(j-1)+9,11*(i-1)+12}  = totallengthp;
                rowcolposition{18*(j-1)+10,11*(i-1)+12} = totalsurfaceareap;
                rowcolposition{18*(j-1)+11,11*(i-1)+12} = totalvolumep;
                rowcolposition{18*(j-1)+12,11*(i-1)+12} = numbersegmentsp;
                rowcolposition{18*(j-1)+13,11*(i-1)+12} = numberbifurcationsp;
                rowcolposition{18*(j-1)+14,11*(i-1)+12} = numberterminationsp;
                rowcolposition{18*(j-1)+15,11*(i-1)+12} = taperratep;
                rowcolposition{18*(j-1)+16,11*(i-1)+12} = taperratiop;
                if j < min(controlanalysis.maxbranchorder.max,currenttestanalysis.maxbranchorder.max)
                    rowcolposition{18*(j-1)+17,11*(i-1)+12} = rallratiop;
                    rowcolposition{18*(j-1)+18,11*(i-1)+12} = daughterratiop;
                else
                    rowcolposition{18*(j-1)+17,11*(i-1)+12} = [];
                    rowcolposition{18*(j-1)+18,11*(i-1)+12} = [];
                end



                [proximaldiameterh,proximaldiameterp]             = kstest2(controlanalysis.branchorder.proximaldiameter(j).values,currenttestanalysis.branchorder.proximaldiameter(j).values);
                [cylindricaldiameterh,cylindricaldiameterp]       = kstest2(controlanalysis.branchorder.cylindricaldiameter(j).values,currenttestanalysis.branchorder.cylindricaldiameter(j).values);
                [distaldiameterh,distaldiameterp]                 = kstest2(controlanalysis.branchorder.distaldiameter(j).values,currenttestanalysis.branchorder.distaldiameter(j).values);
                [lengthh,lengthp]                                 = kstest2(controlanalysis.branchorder.length(j).values,currenttestanalysis.branchorder.length(j).values);
                [surfaceareah,surfaceareap]                       = kstest2(controlanalysis.branchorder.surfacearea(j).values,currenttestanalysis.branchorder.surfacearea(j).values);
                [volumeh,volumep]                                 = kstest2(controlanalysis.branchorder.volume(j).values,currenttestanalysis.branchorder.volume(j).values);
                [totallengthh,totallengthp]                               = kstest2(controlanalysis.branchorder.totallength(j).values,currenttestanalysis.branchorder.totallength(j).values);
                [totalsurfaceareah,totalsurfaceareap]                     = kstest2(controlanalysis.branchorder.totalsurfacearea(j).values,currenttestanalysis.branchorder.totalsurfacearea(j).values);
                [totalvolumeh,totalvolumep]                               = kstest2(controlanalysis.branchorder.totalvolume(j).values,currenttestanalysis.branchorder.totalvolume(j).values);
                [numbersegmentsh,numbersegmentsp]                         = kstest2(controlanalysis.branchorder.numbersegments(j).values,currenttestanalysis.branchorder.numbersegments(j).values);
                [numberbifurcationsh,numberbifurcationsp]                 = kstest2(controlanalysis.branchorder.numberbifurcations(j).values,currenttestanalysis.branchorder.numberbifurcations(j).values);
                [numberterminationsh,numberterminationsp]                 = kstest2(controlanalysis.branchorder.numberterminations(j).values,currenttestanalysis.branchorder.numberterminations(j).values);
                [taperrateh,taperratep]                           = kstest2(controlanalysis.branchorder.taperrate(j).values,currenttestanalysis.branchorder.taperrate(j).values);
                [taperratioh,taperratiop]                         = kstest2(controlanalysis.branchorder.taperratio(j).values,currenttestanalysis.branchorder.taperratio(j).values);
                if j < min(controlanalysis.maxbranchorder.max,currenttestanalysis.maxbranchorder.max)
                    [rallratioh,rallratiop]                       = kstest2(controlanalysis.branchorder.rallratio(j).values,currenttestanalysis.branchorder.rallratio(j).values);
                    [daughterratioh,daughterratiop]               = kstest2(controlanalysis.branchorder.daughterratio(j).values,currenttestanalysis.branchorder.daughterratio(j).values);
                else
                    rallratiop                                        = [];
                    rallratioh                                        = [];
                    daughterratiop                                    = [];
                    daughterratioh                                    = [];
                end

                if proximaldiameterh         == 0, proximaldiameterh = 'same'; else proximaldiameterh = 'diff'; end;
                if cylindricaldiameterh      == 0, cylindricaldiameterh = 'same'; else cylindricaldiameterh = 'diff'; end;
                if distaldiameterh           == 0, distaldiameterh = 'same'; else distaldiameterh = 'diff'; end;
                if lengthh                   == 0, lengthh = 'same'; else lengthh = 'diff'; end;
                if surfaceareah              == 0, surfaceareah = 'same'; else surfaceareah = 'diff'; end;
                if volumeh                   == 0, volumeh = 'same'; else volumeh = 'diff'; end;
                if totallengthh                  == 0, totallengthh = 'same'; else totallengthh = 'diff'; end;
                if totalsurfaceareah             == 0, totalsurfaceareah = 'same'; else totalsurfaceareah = 'diff'; end;
                if totalvolumeh                  == 0, totalvolumeh = 'same'; else totalvolumeh = 'diff'; end;
                if numbersegmentsh               == 0, numbersegmentsh = 'same'; else numbersegmentsh = 'diff'; end;
                if numberbifurcationsh           == 0, numberbifurcationsh = 'same'; else numberbifurcationsh = 'diff'; end;
                if numberterminationsh           == 0, numberterminationsh = 'same'; else numberterminationsh = 'diff'; end;
                if taperrateh                == 0, taperrateh = 'same'; else taperrateh = 'diff'; end;
                if taperratioh               == 0, taperratioh = 'same'; else taperratioh = 'diff'; end;
                if rallratioh                == 0, rallratioh = 'same'; else rallratioh = 'diff'; end;
                if daughterratioh            == 0, daughterratioh = 'same'; else daughterratioh = 'diff'; end;

                rowcolposition{18*(j-1)+1,11*(i-1)+13}  = 'KS-test ';
                rowcolposition{18*(j-1)+2,11*(i-1)+13}  = 'h';
                rowcolposition{18*(j-1)+3,11*(i-1)+13}  = proximaldiameterh;
                rowcolposition{18*(j-1)+4,11*(i-1)+13}  = cylindricaldiameterh;
                rowcolposition{18*(j-1)+5,11*(i-1)+13}  = distaldiameterh;
                rowcolposition{18*(j-1)+6,11*(i-1)+13}  = lengthh;
                rowcolposition{18*(j-1)+7,11*(i-1)+13}  = surfaceareah;
                rowcolposition{18*(j-1)+8,11*(i-1)+13}  = volumeh;
                rowcolposition{18*(j-1)+9,11*(i-1)+13}  = totallengthh;
                rowcolposition{18*(j-1)+10,11*(i-1)+13} = totalsurfaceareah;
                rowcolposition{18*(j-1)+11,11*(i-1)+13} = totalvolumeh;
                rowcolposition{18*(j-1)+12,11*(i-1)+13} = numbersegmentsh;
                rowcolposition{18*(j-1)+13,11*(i-1)+13} = numberbifurcationsh;
                rowcolposition{18*(j-1)+14,11*(i-1)+13} = numberterminationsh;
                rowcolposition{18*(j-1)+15,11*(i-1)+13} = taperrateh;
                rowcolposition{18*(j-1)+16,11*(i-1)+13} = taperratioh;
                if j < min(controlanalysis.maxbranchorder.max,currenttestanalysis.maxbranchorder.max)
                    rowcolposition{18*(j-1)+17,11*(i-1)+13} = rallratioh;
                    rowcolposition{18*(j-1)+18,11*(i-1)+13} = daughterratioh;
                else
                    rowcolposition{18*(j-1)+17,11*(i-1)+13} = [];
                    rowcolposition{18*(j-1)+18,11*(i-1)+13} = [];
                end

                rowcolposition{18*(j-1)+1,11*(i-1)+14}  = '(mean + var)';
                rowcolposition{18*(j-1)+2,11*(i-1)+14}  = 'p';
                rowcolposition{18*(j-1)+3,11*(i-1)+14}  = proximaldiameterp;
                rowcolposition{18*(j-1)+4,11*(i-1)+14}  = cylindricaldiameterp;
                rowcolposition{18*(j-1)+5,11*(i-1)+14}  = distaldiameterp;
                rowcolposition{18*(j-1)+6,11*(i-1)+14}  = lengthp;
                rowcolposition{18*(j-1)+7,11*(i-1)+14}  = surfaceareap;
                rowcolposition{18*(j-1)+8,11*(i-1)+14}  = volumep;
                rowcolposition{18*(j-1)+9,11*(i-1)+14}  = totallengthp;
                rowcolposition{18*(j-1)+10,11*(i-1)+14} = totalsurfaceareap;
                rowcolposition{18*(j-1)+11,11*(i-1)+14} = totalvolumep;
                rowcolposition{18*(j-1)+12,11*(i-1)+14} = numbersegmentsp;
                rowcolposition{18*(j-1)+13,11*(i-1)+14} = numberbifurcationsp;
                rowcolposition{18*(j-1)+14,11*(i-1)+14} = numberterminationsp;
                rowcolposition{18*(j-1)+15,11*(i-1)+14} = taperratep;
                rowcolposition{18*(j-1)+16,11*(i-1)+14} = taperratiop;
                if j < min(controlanalysis.maxbranchorder.max,currenttestanalysis.maxbranchorder.max)
                    rowcolposition{18*(j-1)+17,11*(i-1)+14} = rallratiop;
                    rowcolposition{18*(j-1)+18,11*(i-1)+14} = daughterratiop;
                else
                    rowcolposition{18*(j-1)+17,11*(i-1)+14} = [];
                    rowcolposition{18*(j-1)+18,11*(i-1)+14} = [];
                end

            end
        end

        if i == 1
            testanalysisfilenames = currenttestanalysis.inputfilename;
        else
            testanalysisfilenames = [testanalysisfilenames '_' currenttestanalysis.inputfilename];
        end

    end

    currentdirectory = cd;
    cd(controlanalysis.datapathname);
    cd ..

    if exist(sprintf('%s_%s_comparison',controlanalysis.inputfilename,currenttestanalysis.inputfilename),'dir')==7;
        cd(sprintf('%s_%s_comparison',controlanalysis.inputfilename,currenttestanalysis.inputfilename));
    else
        mkdir(sprintf('%s_%s_comparison',controlanalysis.inputfilename,currenttestanalysis.inputfilename));
        cd(sprintf('%s_%s_comparison',controlanalysis.inputfilename,currenttestanalysis.inputfilename));
    end

    if exist('comparisontables','dir')==7
        cd('comparisontables');
    else
        mkdir('comparisontables');
        cd('comparisontables');
    end
    
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysisfilenames,'branchorder_comparison_table');
    xlswrite(filename,rowcolposition);
    cd(currentdirectory);

end

warning('on', 'MATLAB:divideByZero');