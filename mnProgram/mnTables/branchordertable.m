function branchordertable(controlanalysis,testanalysis)

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

    overallmaxbranchorder = controlanalysis.dendrite.maxbranchorder.max;
    
    for i = 1:overallmaxbranchorder

        rowcolposition{18*(i-1)+1,1} = sprintf('Branch Order %s',num2str(i));
        rowcolposition{18*(i-1)+2,1} = '';
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

        rowcolposition{18*(i-1)+1,2}  = [];
        rowcolposition{18*(i-1)+2,2}  = [];
        rowcolposition{18*(i-1)+3,2}  = [];
        rowcolposition{18*(i-1)+4,2}  = [];
        rowcolposition{18*(i-1)+5,2}  = [];
        rowcolposition{18*(i-1)+6,2}  = [];
        rowcolposition{18*(i-1)+7,2}  = [];
        rowcolposition{18*(i-1)+8,2}  = [];
        rowcolposition{18*(i-1)+9,2}  = [];
        rowcolposition{18*(i-1)+10,2} = [];
        rowcolposition{18*(i-1)+11,2} = [];
        rowcolposition{18*(i-1)+12,2} = [];
        rowcolposition{18*(i-1)+13,2} = [];
        rowcolposition{18*(i-1)+14,2} = [];
        rowcolposition{18*(i-1)+15,2} = [];
        rowcolposition{18*(i-1)+16,2} = [];
        rowcolposition{18*(i-1)+17,2} = [];
        rowcolposition{18*(i-1)+18,2} = [];
        
    end


    for i = 1:controlanalysis.dendrite.maxbranchorder.max

        rowcolposition{18*(i-1)+1,1} = sprintf('Branch Order %s',num2str(i));
        rowcolposition{18*(i-1)+2,1} = '';
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
        rowcolposition{18*(i-1)+3,2}  = mean([controlanalysis.dendrite.branchorder.proximaldiameter(i).values]);
        rowcolposition{18*(i-1)+4,2}  = mean([controlanalysis.dendrite.branchorder.cylindricaldiameter(i).values]);
        rowcolposition{18*(i-1)+5,2}  = mean([controlanalysis.dendrite.branchorder.distaldiameter(i).values]);
        rowcolposition{18*(i-1)+6,2}  = mean([controlanalysis.dendrite.branchorder.length(i).values]);
        rowcolposition{18*(i-1)+7,2}  = mean([controlanalysis.dendrite.branchorder.surfacearea(i).values]);
        rowcolposition{18*(i-1)+8,2}  = mean([controlanalysis.dendrite.branchorder.volume(i).values]);
        rowcolposition{18*(i-1)+9,2}  = mean([controlanalysis.dendrite.branchorder.totallength(i).values]);
        rowcolposition{18*(i-1)+10,2} = mean([controlanalysis.dendrite.branchorder.totalsurfacearea(i).values]);
        rowcolposition{18*(i-1)+11,2} = mean([controlanalysis.dendrite.branchorder.totalvolume(i).values]);
        rowcolposition{18*(i-1)+12,2} = mean([controlanalysis.dendrite.branchorder.numbersegments(i).values]);
        rowcolposition{18*(i-1)+13,2} = mean([controlanalysis.dendrite.branchorder.numberbifurcations(i).values]);
        rowcolposition{18*(i-1)+14,2} = mean([controlanalysis.dendrite.branchorder.numberterminations(i).values]);
        rowcolposition{18*(i-1)+15,2} = mean([controlanalysis.dendrite.branchorder.taperrate(i).values]);
        rowcolposition{18*(i-1)+16,2} = mean([controlanalysis.dendrite.branchorder.taperratio(i).values]);
        if i < min(controlanalysis.dendrite.maxbranchorder.max)
            rowcolposition{18*(i-1)+17,2} = mean([controlanalysis.dendrite.branchorder.rallratio(i).values]);
            rowcolposition{18*(i-1)+18,2} = mean([controlanalysis.dendrite.branchorder.daughterratio(i).values]);
        else
            rowcolposition{18*(i-1)+17,2} = [];
            rowcolposition{18*(i-1)+18,2} = [];
        end

        rowcolposition{18*(i-1)+1,3}  = ' ';
        rowcolposition{18*(i-1)+2,3}  = 'STD';
        rowcolposition{18*(i-1)+3,3}  = std([controlanalysis.dendrite.branchorder.proximaldiameter(i).values]);
        rowcolposition{18*(i-1)+4,3}  = std([controlanalysis.dendrite.branchorder.cylindricaldiameter(i).values]);
        rowcolposition{18*(i-1)+5,3}  = std([controlanalysis.dendrite.branchorder.distaldiameter(i).values]);
        rowcolposition{18*(i-1)+6,3}  = std([controlanalysis.dendrite.branchorder.length(i).values]);
        rowcolposition{18*(i-1)+7,3}  = std([controlanalysis.dendrite.branchorder.surfacearea(i).values]);
        rowcolposition{18*(i-1)+8,3}  = std([controlanalysis.dendrite.branchorder.volume(i).values]);
        rowcolposition{18*(i-1)+9,3}  = std([controlanalysis.dendrite.branchorder.totallength(i).values]);
        rowcolposition{18*(i-1)+10,3} = std([controlanalysis.dendrite.branchorder.totalsurfacearea(i).values]);
        rowcolposition{18*(i-1)+11,3} = std([controlanalysis.dendrite.branchorder.totalvolume(i).values]);
        rowcolposition{18*(i-1)+12,3} = std([controlanalysis.dendrite.branchorder.numbersegments(i).values]);
        rowcolposition{18*(i-1)+13,3} = std([controlanalysis.dendrite.branchorder.numberbifurcations(i).values]);
        rowcolposition{18*(i-1)+14,3} = std([controlanalysis.dendrite.branchorder.numberterminations(i).values]);
        rowcolposition{18*(i-1)+15,3} = std([controlanalysis.dendrite.branchorder.taperrate(i).values]);
        rowcolposition{18*(i-1)+16,3} = std([controlanalysis.dendrite.branchorder.taperratio(i).values]);
        if i < min(controlanalysis.dendrite.maxbranchorder.max)
            rowcolposition{18*(i-1)+17,3} = std([controlanalysis.dendrite.branchorder.rallratio(i).values]);
            rowcolposition{18*(i-1)+18,3} = std([controlanalysis.dendrite.branchorder.daughterratio(i).values]);
        else
            rowcolposition{18*(i-1)+17,3} = [];
            rowcolposition{18*(i-1)+18,3} = [];
        end
        
        rowcolposition{18*(i-1)+1,4}  = ' ';
        rowcolposition{18*(i-1)+2,4}  = 'Skew';
        rowcolposition{18*(i-1)+3,4}  = skewness([controlanalysis.dendrite.branchorder.proximaldiameter(i).values]);
        rowcolposition{18*(i-1)+4,4}  = skewness([controlanalysis.dendrite.branchorder.cylindricaldiameter(i).values]);
        rowcolposition{18*(i-1)+5,4}  = skewness([controlanalysis.dendrite.branchorder.distaldiameter(i).values]);
        rowcolposition{18*(i-1)+6,4}  = skewness([controlanalysis.dendrite.branchorder.length(i).values]);
        rowcolposition{18*(i-1)+7,4}  = skewness([controlanalysis.dendrite.branchorder.surfacearea(i).values]);
        rowcolposition{18*(i-1)+8,4}  = skewness([controlanalysis.dendrite.branchorder.volume(i).values]);
        rowcolposition{18*(i-1)+9,4}  = skewness([controlanalysis.dendrite.branchorder.totallength(i).values]);
        rowcolposition{18*(i-1)+10,4} = skewness([controlanalysis.dendrite.branchorder.totalsurfacearea(i).values]);
        rowcolposition{18*(i-1)+11,4} = skewness([controlanalysis.dendrite.branchorder.totalvolume(i).values]);
        rowcolposition{18*(i-1)+12,4} = skewness([controlanalysis.dendrite.branchorder.numbersegments(i).values]);
        rowcolposition{18*(i-1)+13,4} = skewness([controlanalysis.dendrite.branchorder.numberbifurcations(i).values]);
        rowcolposition{18*(i-1)+14,4} = skewness([controlanalysis.dendrite.branchorder.numberterminations(i).values]);
        rowcolposition{18*(i-1)+15,4} = skewness([controlanalysis.dendrite.branchorder.taperrate(i).values]);
        rowcolposition{18*(i-1)+16,4} = skewness([controlanalysis.dendrite.branchorder.taperratio(i).values]);
        if i < min(controlanalysis.dendrite.maxbranchorder.max)
            rowcolposition{18*(i-1)+17,4} = skewness([controlanalysis.dendrite.branchorder.rallratio(i).values]);
            rowcolposition{18*(i-1)+18,4} = skewness([controlanalysis.dendrite.branchorder.daughterratio(i).values]);
        else
            rowcolposition{18*(i-1)+17,4} = [];
            rowcolposition{18*(i-1)+18,4} = [];
        end
        
        rowcolposition{18*(i-1)+1,5}  = ' ';
        rowcolposition{18*(i-1)+2,5}  = 'Kurt';
        rowcolposition{18*(i-1)+3,5}  = kurtosis([controlanalysis.dendrite.branchorder.proximaldiameter(i).values]);
        rowcolposition{18*(i-1)+4,5}  = kurtosis([controlanalysis.dendrite.branchorder.cylindricaldiameter(i).values]);
        rowcolposition{18*(i-1)+5,5}  = kurtosis([controlanalysis.dendrite.branchorder.distaldiameter(i).values]);
        rowcolposition{18*(i-1)+6,5}  = kurtosis([controlanalysis.dendrite.branchorder.length(i).values]);
        rowcolposition{18*(i-1)+7,5}  = kurtosis([controlanalysis.dendrite.branchorder.surfacearea(i).values]);
        rowcolposition{18*(i-1)+8,5}  = kurtosis([controlanalysis.dendrite.branchorder.volume(i).values]);
        rowcolposition{18*(i-1)+9,5}  = kurtosis([controlanalysis.dendrite.branchorder.totallength(i).values]);
        rowcolposition{18*(i-1)+10,5} = kurtosis([controlanalysis.dendrite.branchorder.totalsurfacearea(i).values]);
        rowcolposition{18*(i-1)+11,5} = kurtosis([controlanalysis.dendrite.branchorder.totalvolume(i).values]);
        rowcolposition{18*(i-1)+12,5} = kurtosis([controlanalysis.dendrite.branchorder.numbersegments(i).values]);
        rowcolposition{18*(i-1)+13,5} = kurtosis([controlanalysis.dendrite.branchorder.numberbifurcations(i).values]);
        rowcolposition{18*(i-1)+14,5} = kurtosis([controlanalysis.dendrite.branchorder.numberterminations(i).values]);
        rowcolposition{18*(i-1)+15,5} = kurtosis([controlanalysis.dendrite.branchorder.taperrate(i).values]);
        rowcolposition{18*(i-1)+16,5} = kurtosis([controlanalysis.dendrite.branchorder.taperratio(i).values]);
        if i < min(controlanalysis.dendrite.maxbranchorder.max)
            rowcolposition{18*(i-1)+17,5} = kurtosis([controlanalysis.dendrite.branchorder.rallratio(i).values]);
            rowcolposition{18*(i-1)+18,5} = kurtosis([controlanalysis.dendrite.branchorder.daughterratio(i).values]);
        else
            rowcolposition{18*(i-1)+17,5} = [];
            rowcolposition{18*(i-1)+18,5} = [];
        end
        
        rowcolposition{18*(i-1)+1,6}  = ' ';
        rowcolposition{18*(i-1)+2,6}  = 'Min';
        rowcolposition{18*(i-1)+3,6}  = min([controlanalysis.dendrite.branchorder.proximaldiameter(i).values]);
        rowcolposition{18*(i-1)+4,6}  = min([controlanalysis.dendrite.branchorder.cylindricaldiameter(i).values]);
        rowcolposition{18*(i-1)+5,6}  = min([controlanalysis.dendrite.branchorder.distaldiameter(i).values]);
        rowcolposition{18*(i-1)+6,6}  = min([controlanalysis.dendrite.branchorder.length(i).values]);
        rowcolposition{18*(i-1)+7,6}  = min([controlanalysis.dendrite.branchorder.surfacearea(i).values]);
        rowcolposition{18*(i-1)+8,6}  = min([controlanalysis.dendrite.branchorder.volume(i).values]);
        rowcolposition{18*(i-1)+9,6}  = min([controlanalysis.dendrite.branchorder.totallength(i).values]);
        rowcolposition{18*(i-1)+10,6} = min([controlanalysis.dendrite.branchorder.totalsurfacearea(i).values]);
        rowcolposition{18*(i-1)+11,6} = min([controlanalysis.dendrite.branchorder.totalvolume(i).values]);
        rowcolposition{18*(i-1)+12,6} = min([controlanalysis.dendrite.branchorder.numbersegments(i).values]);
        rowcolposition{18*(i-1)+13,6} = min([controlanalysis.dendrite.branchorder.numberbifurcations(i).values]);
        rowcolposition{18*(i-1)+14,6} = min([controlanalysis.dendrite.branchorder.numberterminations(i).values]);
        rowcolposition{18*(i-1)+15,6} = min([controlanalysis.dendrite.branchorder.taperrate(i).values]);
        rowcolposition{18*(i-1)+16,6} = min([controlanalysis.dendrite.branchorder.taperratio(i).values]);
        if i < min(controlanalysis.dendrite.maxbranchorder.max)
            rowcolposition{18*(i-1)+17,6} = min([controlanalysis.dendrite.branchorder.rallratio(i).values]);
            rowcolposition{18*(i-1)+18,6} = min([controlanalysis.dendrite.branchorder.daughterratio(i).values]);
        else
            rowcolposition{18*(i-1)+17,6} = [];
            rowcolposition{18*(i-1)+18,6} = [];
        end
        
        rowcolposition{18*(i-1)+1,7}  = ' ';
        rowcolposition{18*(i-1)+2,7}  = 'Max';
        rowcolposition{18*(i-1)+3,7}  = max([controlanalysis.dendrite.branchorder.proximaldiameter(i).values]);
        rowcolposition{18*(i-1)+4,7}  = max([controlanalysis.dendrite.branchorder.cylindricaldiameter(i).values]);
        rowcolposition{18*(i-1)+5,7}  = max([controlanalysis.dendrite.branchorder.distaldiameter(i).values]);
        rowcolposition{18*(i-1)+6,7}  = max([controlanalysis.dendrite.branchorder.length(i).values]);
        rowcolposition{18*(i-1)+7,7}  = max([controlanalysis.dendrite.branchorder.surfacearea(i).values]);
        rowcolposition{18*(i-1)+8,7}  = max([controlanalysis.dendrite.branchorder.volume(i).values]);
        rowcolposition{18*(i-1)+9,7}  = max([controlanalysis.dendrite.branchorder.totallength(i).values]);
        rowcolposition{18*(i-1)+10,7} = max([controlanalysis.dendrite.branchorder.totalsurfacearea(i).values]);
        rowcolposition{18*(i-1)+11,7} = max([controlanalysis.dendrite.branchorder.totalvolume(i).values]);
        rowcolposition{18*(i-1)+12,7} = max([controlanalysis.dendrite.branchorder.numbersegments(i).values]);
        rowcolposition{18*(i-1)+13,7} = max([controlanalysis.dendrite.branchorder.numberbifurcations(i).values]);
        rowcolposition{18*(i-1)+14,7} = max([controlanalysis.dendrite.branchorder.numberterminations(i).values]);
        rowcolposition{18*(i-1)+15,7} = max([controlanalysis.dendrite.branchorder.taperrate(i).values]);
        rowcolposition{18*(i-1)+16,7} = max([controlanalysis.dendrite.branchorder.taperratio(i).values]);
        if i < min(controlanalysis.dendrite.maxbranchorder.max)
            rowcolposition{18*(i-1)+17,7} = max([controlanalysis.dendrite.branchorder.rallratio(i).values]);
            rowcolposition{18*(i-1)+18,7} = max([controlanalysis.dendrite.branchorder.daughterratio(i).values]);
        else
            rowcolposition{18*(i-1)+17,7} = [];
            rowcolposition{18*(i-1)+18,7} = [];
        end
        
    end

    filename = sprintf('%s_%s',controlanalysis.inputfilename,'branchorder_table.csv');
    %xlswrite(filename,rowcolposition);
	cell2csv(filename,rowcolposition);
    cd(currentdirectory);

end

if nargin == 2


    maxbranchorder(1) = controlanalysis.dendrite.maxbranchorder.max;
    maxbranchorder(2) = testanalysis.dendrite.maxbranchorder.max;
    overallmaxbranchorder = max(maxbranchorder);


    for i = 1:overallmaxbranchorder

        rowcolposition{18*(i-1)+1,1} = sprintf('Branch Order %s',num2str(i));
        rowcolposition{18*(i-1)+2,1} = '';
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

        % for j = 1:1

        %     rowcolposition{18*(i-1)+1,13*(j-1)+2}  = [];
        %     rowcolposition{18*(i-1)+2,13*(j-1)+2}  = [];
        %     rowcolposition{18*(i-1)+3,13*(j-1)+2}  = [];
        %     rowcolposition{18*(i-1)+4,13*(j-1)+2}  = [];
        %     rowcolposition{18*(i-1)+5,13*(j-1)+2}  = [];
        %     rowcolposition{18*(i-1)+6,13*(j-1)+2}  = [];
        %     rowcolposition{18*(i-1)+7,13*(j-1)+2}  = [];
        %     rowcolposition{18*(i-1)+8,13*(j-1)+2}  = [];
        %     rowcolposition{18*(i-1)+9,13*(j-1)+2}  = [];
        %     rowcolposition{18*(i-1)+10,13*(j-1)+2} = [];
        %     rowcolposition{18*(i-1)+11,13*(j-1)+2} = [];
        %     rowcolposition{18*(i-1)+12,13*(j-1)+2} = [];
        %     rowcolposition{18*(i-1)+13,13*(j-1)+2} = [];
        %     rowcolposition{18*(i-1)+14,13*(j-1)+2} = [];
        %     rowcolposition{18*(i-1)+15,13*(j-1)+2} = [];
        %     rowcolposition{18*(i-1)+16,13*(j-1)+2} = [];
        %     rowcolposition{18*(i-1)+17,13*(j-1)+2} = [];
        %     rowcolposition{18*(i-1)+18,13*(j-1)+2} = [];

        % end
    end


    for i = 1:controlanalysis.dendrite.maxbranchorder.max

        rowcolposition{18*(i-1)+1,1} = sprintf('Branch Order %s',num2str(i));
        rowcolposition{18*(i-1)+2,1} = '';
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
        rowcolposition{18*(i-1)+3,2}  = mean([controlanalysis.dendrite.branchorder.proximaldiameter(i).values]);
        rowcolposition{18*(i-1)+4,2}  = mean([controlanalysis.dendrite.branchorder.cylindricaldiameter(i).values]);
        rowcolposition{18*(i-1)+5,2}  = mean([controlanalysis.dendrite.branchorder.distaldiameter(i).values]);
        rowcolposition{18*(i-1)+6,2}  = mean([controlanalysis.dendrite.branchorder.length(i).values]);
        rowcolposition{18*(i-1)+7,2}  = mean([controlanalysis.dendrite.branchorder.surfacearea(i).values]);
        rowcolposition{18*(i-1)+8,2}  = mean([controlanalysis.dendrite.branchorder.volume(i).values]);
        rowcolposition{18*(i-1)+9,2}  = mean([controlanalysis.dendrite.branchorder.totallength(i).values]);
        rowcolposition{18*(i-1)+10,2} = mean([controlanalysis.dendrite.branchorder.totalsurfacearea(i).values]);
        rowcolposition{18*(i-1)+11,2} = mean([controlanalysis.dendrite.branchorder.totalvolume(i).values]);
        rowcolposition{18*(i-1)+12,2} = mean([controlanalysis.dendrite.branchorder.numbersegments(i).values]);
        rowcolposition{18*(i-1)+13,2} = mean([controlanalysis.dendrite.branchorder.numberbifurcations(i).values]);
        rowcolposition{18*(i-1)+14,2} = mean([controlanalysis.dendrite.branchorder.numberterminations(i).values]);
        rowcolposition{18*(i-1)+15,2} = mean([controlanalysis.dendrite.branchorder.taperrate(i).values]);
        rowcolposition{18*(i-1)+16,2} = mean([controlanalysis.dendrite.branchorder.taperratio(i).values]);
        if i < min(controlanalysis.dendrite.maxbranchorder.max)
            rowcolposition{18*(i-1)+17,2} = mean([controlanalysis.dendrite.branchorder.rallratio(i).values]);
            rowcolposition{18*(i-1)+18,2} = mean([controlanalysis.dendrite.branchorder.daughterratio(i).values]);
        else
            rowcolposition{18*(i-1)+17,2} = [];
            rowcolposition{18*(i-1)+18,2} = [];
        end

        rowcolposition{18*(i-1)+1,3}  = ' ';
        rowcolposition{18*(i-1)+2,3}  = 'STD';
        rowcolposition{18*(i-1)+3,3}  = std([controlanalysis.dendrite.branchorder.proximaldiameter(i).values]);
        rowcolposition{18*(i-1)+4,3}  = std([controlanalysis.dendrite.branchorder.cylindricaldiameter(i).values]);
        rowcolposition{18*(i-1)+5,3}  = std([controlanalysis.dendrite.branchorder.distaldiameter(i).values]);
        rowcolposition{18*(i-1)+6,3}  = std([controlanalysis.dendrite.branchorder.length(i).values]);
        rowcolposition{18*(i-1)+7,3}  = std([controlanalysis.dendrite.branchorder.surfacearea(i).values]);
        rowcolposition{18*(i-1)+8,3}  = std([controlanalysis.dendrite.branchorder.volume(i).values]);
        rowcolposition{18*(i-1)+9,3}  = std([controlanalysis.dendrite.branchorder.totallength(i).values]);
        rowcolposition{18*(i-1)+10,3} = std([controlanalysis.dendrite.branchorder.totalsurfacearea(i).values]);
        rowcolposition{18*(i-1)+11,3} = std([controlanalysis.dendrite.branchorder.totalvolume(i).values]);
        rowcolposition{18*(i-1)+12,3} = std([controlanalysis.dendrite.branchorder.numbersegments(i).values]);
        rowcolposition{18*(i-1)+13,3} = std([controlanalysis.dendrite.branchorder.numberbifurcations(i).values]);
        rowcolposition{18*(i-1)+14,3} = std([controlanalysis.dendrite.branchorder.numberterminations(i).values]);
        rowcolposition{18*(i-1)+15,3} = std([controlanalysis.dendrite.branchorder.taperrate(i).values]);
        rowcolposition{18*(i-1)+16,3} = std([controlanalysis.dendrite.branchorder.taperratio(i).values]);
        if i < min(controlanalysis.dendrite.maxbranchorder.max)
            rowcolposition{18*(i-1)+17,3} = std([controlanalysis.dendrite.branchorder.rallratio(i).values]);
            rowcolposition{18*(i-1)+18,3} = std([controlanalysis.dendrite.branchorder.daughterratio(i).values]);
        else
            rowcolposition{18*(i-1)+17,3} = [];
            rowcolposition{18*(i-1)+18,3} = [];
        end
    end


    for j = 1:testanalysis.dendrite.maxbranchorder.max

        rowcolposition{18*(j-1)+1,4}  = testanalysis.inputfilename;
        rowcolposition{18*(j-1)+2,4}  = 'Mean';
        rowcolposition{18*(j-1)+3,4}  = mean([testanalysis.dendrite.branchorder.proximaldiameter(j).values]);
        rowcolposition{18*(j-1)+4,4}  = mean([testanalysis.dendrite.branchorder.cylindricaldiameter(j).values]);
        rowcolposition{18*(j-1)+5,4}  = mean([testanalysis.dendrite.branchorder.distaldiameter(j).values]);
        rowcolposition{18*(j-1)+6,4}  = mean([testanalysis.dendrite.branchorder.length(j).values]);
        rowcolposition{18*(j-1)+7,4}  = mean([testanalysis.dendrite.branchorder.surfacearea(j).values]);
        rowcolposition{18*(j-1)+8,4}  = mean([testanalysis.dendrite.branchorder.volume(j).values]);
        rowcolposition{18*(j-1)+9,4}  = mean([testanalysis.dendrite.branchorder.totallength(j).values]);
        rowcolposition{18*(j-1)+10,4} = mean([testanalysis.dendrite.branchorder.totalsurfacearea(j).values]);
        rowcolposition{18*(j-1)+11,4} = mean([testanalysis.dendrite.branchorder.totalvolume(j).values]);
        rowcolposition{18*(j-1)+12,4} = mean([testanalysis.dendrite.branchorder.numbersegments(j).values]);
        rowcolposition{18*(j-1)+13,4} = mean([testanalysis.dendrite.branchorder.numberbifurcations(j).values]);
        rowcolposition{18*(j-1)+14,4} = mean([testanalysis.dendrite.branchorder.numberterminations(j).values]);
        rowcolposition{18*(j-1)+15,4} = mean([testanalysis.dendrite.branchorder.taperrate(j).values]);
        rowcolposition{18*(j-1)+16,4} = mean([testanalysis.dendrite.branchorder.taperratio(j).values]);
        if j < testanalysis.dendrite.maxbranchorder.max
            rowcolposition{18*(j-1)+17,4} = mean([testanalysis.dendrite.branchorder.rallratio(j).values]);
            rowcolposition{18*(j-1)+18,4} = mean([testanalysis.dendrite.branchorder.daughterratio(j).values]);
        else
            rowcolposition{18*(j-1)+17,4} = [];
            rowcolposition{18*(j-1)+18,4} = [];
        end

        rowcolposition{18*(j-1)+1,5}  = ' ';
        rowcolposition{18*(j-1)+2,5}  = 'STD';
        rowcolposition{18*(j-1)+3,5}  = std([testanalysis.dendrite.branchorder.proximaldiameter(j).values]);
        rowcolposition{18*(j-1)+4,5}  = std([testanalysis.dendrite.branchorder.cylindricaldiameter(j).values]);
        rowcolposition{18*(j-1)+5,5}  = std([testanalysis.dendrite.branchorder.distaldiameter(j).values]);
        rowcolposition{18*(j-1)+6,5}  = std([testanalysis.dendrite.branchorder.length(j).values]);
        rowcolposition{18*(j-1)+7,5}  = std([testanalysis.dendrite.branchorder.surfacearea(j).values]);
        rowcolposition{18*(j-1)+8,5}  = std([testanalysis.dendrite.branchorder.volume(j).values]);
        rowcolposition{18*(j-1)+9,5}  = std([testanalysis.dendrite.branchorder.totallength(j).values]);
        rowcolposition{18*(j-1)+10,5} = std([testanalysis.dendrite.branchorder.totalsurfacearea(j).values]);
        rowcolposition{18*(j-1)+11,5} = std([testanalysis.dendrite.branchorder.totalvolume(j).values]);
        rowcolposition{18*(j-1)+12,5} = std([testanalysis.dendrite.branchorder.numbersegments(j).values]);
        rowcolposition{18*(j-1)+13,5} = std([testanalysis.dendrite.branchorder.numberbifurcations(j).values]);
        rowcolposition{18*(j-1)+14,5} = std([testanalysis.dendrite.branchorder.numberterminations(j).values]);
        rowcolposition{18*(j-1)+15,5} = std([testanalysis.dendrite.branchorder.taperrate(j).values]);
        rowcolposition{18*(j-1)+16,5} = std([testanalysis.dendrite.branchorder.taperratio(j).values]);
        if j < testanalysis.dendrite.maxbranchorder.max
            rowcolposition{18*(j-1)+17,5} = std([testanalysis.dendrite.branchorder.rallratio(j).values]);
            rowcolposition{18*(j-1)+18,5} = std([testanalysis.dendrite.branchorder.daughterratio(j).values]);
        else
            rowcolposition{18*(j-1)+17,5} = [];
            rowcolposition{18*(j-1)+18,5} = [];
        end

        if j <= controlanalysis.dendrite.maxbranchorder.max

            proximaldiameterdiff        = 100*((mean(testanalysis.dendrite.branchorder.proximaldiameter(j).values)-mean(controlanalysis.dendrite.branchorder.proximaldiameter(j).values))/mean(controlanalysis.dendrite.branchorder.proximaldiameter(j).values));
            cylindricaldiameterdiff     = 100*((mean(testanalysis.dendrite.branchorder.cylindricaldiameter(j).values)-mean(controlanalysis.dendrite.branchorder.cylindricaldiameter(j).values))/mean(controlanalysis.dendrite.branchorder.cylindricaldiameter(j).values));
            distaldiameterdiff          = 100*((mean(testanalysis.dendrite.branchorder.distaldiameter(j).values)-mean(controlanalysis.dendrite.branchorder.distaldiameter(j).values))/mean(controlanalysis.dendrite.branchorder.distaldiameter(j).values));
            lengthdiff                  = 100*((mean(testanalysis.dendrite.branchorder.length(j).values)-mean(controlanalysis.dendrite.branchorder.length(j).values))/mean(controlanalysis.dendrite.branchorder.length(j).values));
            surfaceareadiff             = 100*((mean(testanalysis.dendrite.branchorder.surfacearea(j).values)-mean(controlanalysis.dendrite.branchorder.surfacearea(j).values))/mean(controlanalysis.dendrite.branchorder.surfacearea(j).values));
            volumediff                  = 100*((mean(testanalysis.dendrite.branchorder.volume(j).values)-mean(controlanalysis.dendrite.branchorder.volume(j).values))/mean(controlanalysis.dendrite.branchorder.volume(j).values));
            totallengthdiff                 = 100*((mean(testanalysis.dendrite.branchorder.totallength(j).values)-mean(controlanalysis.dendrite.branchorder.totallength(j).values))/mean(controlanalysis.dendrite.branchorder.totallength(j).values));
            totalsurfaceareadiff            = 100*((mean(testanalysis.dendrite.branchorder.totalsurfacearea(j).values)-mean(controlanalysis.dendrite.branchorder.totalsurfacearea(j).values))/mean(controlanalysis.dendrite.branchorder.totalsurfacearea(j).values));
            totalvolumediff                 = 100*((mean(testanalysis.dendrite.branchorder.totalvolume(j).values)-mean(controlanalysis.dendrite.branchorder.totalvolume(j).values))/mean(controlanalysis.dendrite.branchorder.totalvolume(j).values));
            numbersegmentsdiff              = 100*((mean(testanalysis.dendrite.branchorder.numbersegments(j).values)-mean(controlanalysis.dendrite.branchorder.numbersegments(j).values))/mean(controlanalysis.dendrite.branchorder.numbersegments(j).values));
            numberbifurcationsdiff          = 100*((mean(testanalysis.dendrite.branchorder.numberbifurcations(j).values)-mean(controlanalysis.dendrite.branchorder.numberbifurcations(j).values))/mean(controlanalysis.dendrite.branchorder.numberbifurcations(j).values));
            numberterminationsdiff          = 100*((mean(testanalysis.dendrite.branchorder.numberterminations(j).values)-mean(controlanalysis.dendrite.branchorder.numberterminations(j).values))/mean(controlanalysis.dendrite.branchorder.numberterminations(j).values));
            taperratediff               = 100*((mean(testanalysis.dendrite.branchorder.taperrate(j).values)-mean(controlanalysis.dendrite.branchorder.taperrate(j).values))/mean(controlanalysis.dendrite.branchorder.taperrate(j).values));
            taperratiodiff              = 100*((mean(testanalysis.dendrite.branchorder.taperratio(j).values)-mean(controlanalysis.dendrite.branchorder.taperratio(j).values))/mean(controlanalysis.dendrite.branchorder.taperratio(j).values));
            rallratiodiff               = 100*((mean(testanalysis.dendrite.branchorder.rallratio(j).values)-mean(controlanalysis.dendrite.branchorder.rallratio(j).values))/mean(controlanalysis.dendrite.branchorder.rallratio(j).values));
            daughterratiodiff           = 100*((mean(testanalysis.dendrite.branchorder.daughterratio(j).values)-mean(controlanalysis.dendrite.branchorder.daughterratio(j).values))/mean(controlanalysis.dendrite.branchorder.daughterratio(j).values));

            rowcolposition{18*(j-1)+1,6}  = 'Mean Diff'; 
            rowcolposition{18*(j-1)+2,6}  = 'percent';
            rowcolposition{18*(j-1)+3,6}  = proximaldiameterdiff;
            rowcolposition{18*(j-1)+4,6}  = cylindricaldiameterdiff;
            rowcolposition{18*(j-1)+5,6}  = distaldiameterdiff;
            rowcolposition{18*(j-1)+6,6}  = lengthdiff;
            rowcolposition{18*(j-1)+7,6}  = surfaceareadiff;
            rowcolposition{18*(j-1)+8,6}  = volumediff;
            rowcolposition{18*(j-1)+9,6}  = totallengthdiff;
            rowcolposition{18*(j-1)+10,6} = totalsurfaceareadiff;
            rowcolposition{18*(j-1)+11,6} = totalvolumediff;
            rowcolposition{18*(j-1)+12,6} = numbersegmentsdiff;
            rowcolposition{18*(j-1)+13,6} = numberbifurcationsdiff;
            rowcolposition{18*(j-1)+14,6} = numberterminationsdiff;
            rowcolposition{18*(j-1)+15,6} = taperratediff;
            rowcolposition{18*(j-1)+16,6} = taperratiodiff;
            if j < min(controlanalysis.dendrite.maxbranchorder.max,testanalysis.dendrite.maxbranchorder.max)
                rowcolposition{18*(j-1)+17,6} = rallratiodiff;
                rowcolposition{18*(j-1)+18,6} = daughterratiodiff;
            else
                rowcolposition{18*(j-1)+17,6} = [];
                rowcolposition{18*(j-1)+18,6} = [];
            end


            [proximaldiameterh,proximaldiameterp]             = ttest2(controlanalysis.dendrite.branchorder.proximaldiameter(j).values,testanalysis.dendrite.branchorder.proximaldiameter(j).values);
            [cylindricaldiameterh,cylindricaldiameterp]       = ttest2(controlanalysis.dendrite.branchorder.cylindricaldiameter(j).values,testanalysis.dendrite.branchorder.cylindricaldiameter(j).values);
            [distaldiameterh,distaldiameterp]                 = ttest2(controlanalysis.dendrite.branchorder.distaldiameter(j).values,testanalysis.dendrite.branchorder.distaldiameter(j).values);
            [lengthh,lengthp]                                 = ttest2(controlanalysis.dendrite.branchorder.length(j).values,testanalysis.dendrite.branchorder.length(j).values);
            [surfaceareah,surfaceareap]                       = ttest2(controlanalysis.dendrite.branchorder.surfacearea(j).values,testanalysis.dendrite.branchorder.surfacearea(j).values);
            [volumeh,volumep]                                 = ttest2(controlanalysis.dendrite.branchorder.volume(j).values,testanalysis.dendrite.branchorder.volume(j).values);
            [totallengthh,totallengthp]                               = ttest2(controlanalysis.dendrite.branchorder.totallength(j).values,testanalysis.dendrite.branchorder.totallength(j).values);
            [totalsurfaceareah,totalsurfaceareap]                     = ttest2(controlanalysis.dendrite.branchorder.totalsurfacearea(j).values,testanalysis.dendrite.branchorder.totalsurfacearea(j).values);
            [totalvolumeh,totalvolumep]                               = ttest2(controlanalysis.dendrite.branchorder.totalvolume(j).values,testanalysis.dendrite.branchorder.totalvolume(j).values);
            [numbersegmentsh,numbersegmentsp]                         = ttest2(controlanalysis.dendrite.branchorder.numbersegments(j).values,testanalysis.dendrite.branchorder.numbersegments(j).values);
            [numberbifurcationsh,numberbifurcationsp]                 = ttest2(controlanalysis.dendrite.branchorder.numberbifurcations(j).values,testanalysis.dendrite.branchorder.numberbifurcations(j).values);
            [numberterminationsh,numberterminationsp]                 = ttest2(controlanalysis.dendrite.branchorder.numberterminations(j).values,testanalysis.dendrite.branchorder.numberterminations(j).values);
            [taperrateh,taperratep]                           = ttest2(controlanalysis.dendrite.branchorder.taperrate(j).values,testanalysis.dendrite.branchorder.taperrate(j).values);
            [taperratioh,taperratiop]                         = ttest2(controlanalysis.dendrite.branchorder.taperratio(j).values,testanalysis.dendrite.branchorder.taperratio(j).values);
            if j < min(controlanalysis.dendrite.maxbranchorder.max,testanalysis.dendrite.maxbranchorder.max)
                [rallratioh,rallratiop]                       = ttest2(controlanalysis.dendrite.branchorder.rallratio(j).values,testanalysis.dendrite.branchorder.rallratio(j).values);
                [daughterratioh,daughterratiop]               = ttest2(controlanalysis.dendrite.branchorder.daughterratio(j).values,testanalysis.dendrite.branchorder.daughterratio(j).values);
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

            rowcolposition{18*(j-1)+1,7}  = 't-test ';
            rowcolposition{18*(j-1)+2,7}  = 'h';
            rowcolposition{18*(j-1)+3,7}  = proximaldiameterh;
            rowcolposition{18*(j-1)+4,7}  = cylindricaldiameterh;
            rowcolposition{18*(j-1)+5,7}  = distaldiameterh;
            rowcolposition{18*(j-1)+6,7}  = lengthh;
            rowcolposition{18*(j-1)+7,7}  = surfaceareah;
            rowcolposition{18*(j-1)+8,7}  = volumeh;
            rowcolposition{18*(j-1)+9,7}  = totallengthh;
            rowcolposition{18*(j-1)+10,7} = totalsurfaceareah;
            rowcolposition{18*(j-1)+11,7} = totalvolumeh;
            rowcolposition{18*(j-1)+12,7} = numbersegmentsh;
            rowcolposition{18*(j-1)+13,7} = numberbifurcationsh;
            rowcolposition{18*(j-1)+14,7} = numberterminationsh;
            rowcolposition{18*(j-1)+15,7} = taperrateh;
            rowcolposition{18*(j-1)+16,7} = taperratioh;
            if j < min(controlanalysis.dendrite.maxbranchorder.max,testanalysis.dendrite.maxbranchorder.max)
                rowcolposition{18*(j-1)+17,7} = rallratioh;
                rowcolposition{18*(j-1)+18,7} = daughterratioh;
            else
                rowcolposition{18*(j-1)+17,7} = [];
                rowcolposition{18*(j-1)+18,7} = [];
            end

            rowcolposition{18*(j-1)+1,8}  = '(mean)';
            rowcolposition{18*(j-1)+2,8}  = 'p';
            rowcolposition{18*(j-1)+3,8}  = proximaldiameterp;
            rowcolposition{18*(j-1)+4,8}  = cylindricaldiameterp;
            rowcolposition{18*(j-1)+5,8}  = distaldiameterp;
            rowcolposition{18*(j-1)+6,8}  = lengthp;
            rowcolposition{18*(j-1)+7,8}  = surfaceareap;
            rowcolposition{18*(j-1)+8,8}  = volumep;
            rowcolposition{18*(j-1)+9,8}  = totallengthp;
            rowcolposition{18*(j-1)+10,8} = totalsurfaceareap;
            rowcolposition{18*(j-1)+11,8} = totalvolumep;
            rowcolposition{18*(j-1)+12,8} = numbersegmentsp;
            rowcolposition{18*(j-1)+13,8} = numberbifurcationsp;
            rowcolposition{18*(j-1)+14,8} = numberterminationsp;
            rowcolposition{18*(j-1)+15,8} = taperratep;
            rowcolposition{18*(j-1)+16,8} = taperratiop;
            if j < testanalysis.dendrite.maxbranchorder.max
                rowcolposition{18*(j-1)+17,8} = rallratiop;
                rowcolposition{18*(j-1)+18,8} = daughterratiop;
            else
                rowcolposition{18*(j-1)+17,8} = [];
                rowcolposition{18*(j-1)+18,8} = [];
            end


            [proximaldiameterp,proximaldiameterh]             = ranksum(controlanalysis.dendrite.branchorder.proximaldiameter(j).values,testanalysis.dendrite.branchorder.proximaldiameter(j).values);
            [cylindricaldiameterp,cylindricaldiameterh]       = ranksum(controlanalysis.dendrite.branchorder.cylindricaldiameter(j).values,testanalysis.dendrite.branchorder.cylindricaldiameter(j).values);
            [distaldiameterp,distaldiameterh]                 = ranksum(controlanalysis.dendrite.branchorder.distaldiameter(j).values,testanalysis.dendrite.branchorder.distaldiameter(j).values);
            [lengthp,lengthh]                                 = ranksum(controlanalysis.dendrite.branchorder.length(j).values,testanalysis.dendrite.branchorder.length(j).values);
            [surfaceareap,surfaceareah]                       = ranksum(controlanalysis.dendrite.branchorder.surfacearea(j).values,testanalysis.dendrite.branchorder.surfacearea(j).values);
            [volumep,volumeh]                                 = ranksum(controlanalysis.dendrite.branchorder.volume(j).values,testanalysis.dendrite.branchorder.volume(j).values);
            [totallengthp,totallengthh]                               = ranksum(controlanalysis.dendrite.branchorder.totallength(j).values,testanalysis.dendrite.branchorder.totallength(j).values);
            [totalsurfaceareap,totalsurfaceareah]                     = ranksum(controlanalysis.dendrite.branchorder.totalsurfacearea(j).values,testanalysis.dendrite.branchorder.totalsurfacearea(j).values);
            [totalvolumep,totalvolumeh]                               = ranksum(controlanalysis.dendrite.branchorder.totalvolume(j).values,testanalysis.dendrite.branchorder.totalvolume(j).values);
            [numbersegmentsp,numbersegmentsh]                         = ranksum(controlanalysis.dendrite.branchorder.numbersegments(j).values,testanalysis.dendrite.branchorder.numbersegments(j).values);
            [numberbifurcationsp,numberbifurcationsh]                 = ranksum(controlanalysis.dendrite.branchorder.numberbifurcations(j).values,testanalysis.dendrite.branchorder.numberbifurcations(j).values);
            [numberterminationsp,numberterminationsh]                 = ranksum(controlanalysis.dendrite.branchorder.numberterminations(j).values,testanalysis.dendrite.branchorder.numberterminations(j).values);
            [taperratep,taperrateh]                           = ranksum(controlanalysis.dendrite.branchorder.taperrate(j).values,testanalysis.dendrite.branchorder.taperrate(j).values);
            [taperratiop,taperratioh]                         = ranksum(controlanalysis.dendrite.branchorder.taperratio(j).values,testanalysis.dendrite.branchorder.taperratio(j).values);
            if j < min(controlanalysis.dendrite.maxbranchorder.max,testanalysis.dendrite.maxbranchorder.max)
                [rallratiop,rallratioh]                       = ranksum(controlanalysis.dendrite.branchorder.rallratio(j).values,testanalysis.dendrite.branchorder.rallratio(j).values);
                [daughterratiop,daughterratioh]               = ranksum(controlanalysis.dendrite.branchorder.daughterratio(j).values,testanalysis.dendrite.branchorder.daughterratio(j).values);
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

            rowcolposition{18*(j-1)+1,9}  = 'RS-test ';
            rowcolposition{18*(j-1)+2,9}  = 'h';
            rowcolposition{18*(j-1)+3,9}  = proximaldiameterh;
            rowcolposition{18*(j-1)+4,9}  = cylindricaldiameterh;
            rowcolposition{18*(j-1)+5,9}  = distaldiameterh;
            rowcolposition{18*(j-1)+6,9}  = lengthh;
            rowcolposition{18*(j-1)+7,9}  = surfaceareah;
            rowcolposition{18*(j-1)+8,9}  = volumeh;
            rowcolposition{18*(j-1)+9,9}  = totallengthh;
            rowcolposition{18*(j-1)+10,9} = totalsurfaceareah;
            rowcolposition{18*(j-1)+11,9} = totalvolumeh;
            rowcolposition{18*(j-1)+12,9} = numbersegmentsh;
            rowcolposition{18*(j-1)+13,9} = numberbifurcationsh;
            rowcolposition{18*(j-1)+14,9} = numberterminationsh;
            rowcolposition{18*(j-1)+15,9} = taperrateh;
            rowcolposition{18*(j-1)+16,9} = taperratioh;
            if j < min(controlanalysis.dendrite.maxbranchorder.max,testanalysis.dendrite.maxbranchorder.max)
                rowcolposition{18*(j-1)+17,9} = rallratioh;
                rowcolposition{18*(j-1)+18,9} = daughterratioh;
            else
                rowcolposition{18*(j-1)+17,9} = [];
                rowcolposition{18*(j-1)+18,9} = [];
            end

            rowcolposition{18*(j-1)+1,10}  = '(median)';
            rowcolposition{18*(j-1)+2,10}  = 'p';
            rowcolposition{18*(j-1)+3,10}  = proximaldiameterp;
            rowcolposition{18*(j-1)+4,10}  = cylindricaldiameterp;
            rowcolposition{18*(j-1)+5,10}  = distaldiameterp;
            rowcolposition{18*(j-1)+6,10}  = lengthp;
            rowcolposition{18*(j-1)+7,10}  = surfaceareap;
            rowcolposition{18*(j-1)+8,10}  = volumep;
            rowcolposition{18*(j-1)+9,10}  = totallengthp;
            rowcolposition{18*(j-1)+10,10} = totalsurfaceareap;
            rowcolposition{18*(j-1)+11,10} = totalvolumep;
            rowcolposition{18*(j-1)+12,10} = numbersegmentsp;
            rowcolposition{18*(j-1)+13,10} = numberbifurcationsp;
            rowcolposition{18*(j-1)+14,10} = numberterminationsp;
            rowcolposition{18*(j-1)+15,10} = taperratep;
            rowcolposition{18*(j-1)+16,10} = taperratiop;
            if j < min(controlanalysis.dendrite.maxbranchorder.max,testanalysis.dendrite.maxbranchorder.max)
                rowcolposition{18*(j-1)+17,10} = rallratiop;
                rowcolposition{18*(j-1)+18,10} = daughterratiop;
            else
                rowcolposition{18*(j-1)+17,10} = [];
                rowcolposition{18*(j-1)+18,10} = [];
            end


            if length(controlanalysis.dendrite.branchorder.proximaldiameter(j).values) == length(testanalysis.dendrite.branchorder.proximaldiameter(j).values)
                [proximaldiameterh,proximaldiameterp]             = ansaribradley(controlanalysis.dendrite.branchorder.proximaldiameter(j).values,testanalysis.dendrite.branchorder.proximaldiameter(j).values);
                [cylindricaldiameterh,cylindricaldiameterp]       = ansaribradley(controlanalysis.dendrite.branchorder.cylindricaldiameter(j).values,testanalysis.dendrite.branchorder.cylindricaldiameter(j).values);
                [distaldiameterh,distaldiameterp]                 = ansaribradley(controlanalysis.dendrite.branchorder.distaldiameter(j).values,testanalysis.dendrite.branchorder.distaldiameter(j).values);
                [lengthh,lengthp]                                 = ansaribradley(controlanalysis.dendrite.branchorder.length(j).values,testanalysis.dendrite.branchorder.length(j).values);
                [surfaceareah,surfaceareap]                       = ansaribradley(controlanalysis.dendrite.branchorder.surfacearea(j).values,testanalysis.dendrite.branchorder.surfacearea(j).values);
                [volumeh,volumep]                                 = ansaribradley(controlanalysis.dendrite.branchorder.volume(j).values,testanalysis.dendrite.branchorder.volume(j).values);
                [totallengthh,totallengthp]                               = ansaribradley(controlanalysis.dendrite.branchorder.totallength(j).values,testanalysis.dendrite.branchorder.totallength(j).values);
                [totalsurfaceareah,totalsurfaceareap]                     = ansaribradley(controlanalysis.dendrite.branchorder.totalsurfacearea(j).values,testanalysis.dendrite.branchorder.totalsurfacearea(j).values);
                [totalvolumeh,totalvolumep]                               = ansaribradley(controlanalysis.dendrite.branchorder.totalvolume(j).values,testanalysis.dendrite.branchorder.totalvolume(j).values);
                [numbersegmentsh,numbersegmentsp]                         = ansaribradley(controlanalysis.dendrite.branchorder.numbersegments(j).values,testanalysis.dendrite.branchorder.numbersegments(j).values);
                [numberbifurcationsh,numberbifurcationsp]                 = ansaribradley(controlanalysis.dendrite.branchorder.numberbifurcations(j).values,testanalysis.dendrite.branchorder.numberbifurcations(j).values);
                [numberterminationsh,numberterminationsp]                 = ansaribradley(controlanalysis.dendrite.branchorder.numberterminations(j).values,testanalysis.dendrite.branchorder.numberterminations(j).values);
                [taperrateh,taperratep]                           = ansaribradley(controlanalysis.dendrite.branchorder.taperrate(j).values,testanalysis.dendrite.branchorder.taperrate(j).values);
                [taperratioh,taperratiop]                         = ansaribradley(controlanalysis.dendrite.branchorder.taperratio(j).values,testanalysis.dendrite.branchorder.taperratio(j).values);
                if j < min(controlanalysis.dendrite.maxbranchorder.max,testanalysis.dendrite.maxbranchorder.max) && length(controlanalysis.dendrite.branchorder.rallratio(j).values) == length(testanalysis.dendrite.branchorder.rallratio(j).values)
                    [rallratioh,rallratiop]                       = ansaribradley(controlanalysis.dendrite.branchorder.rallratio(j).values,testanalysis.dendrite.branchorder.rallratio(j).values);
                    [daughterratioh,daughterratiop]               = ansaribradley(controlanalysis.dendrite.branchorder.daughterratio(j).values,testanalysis.dendrite.branchorder.daughterratio(j).values);
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

            rowcolposition{18*(j-1)+1,11}  = 'AB-test ';
            rowcolposition{18*(j-1)+2,11}  = 'h';
            rowcolposition{18*(j-1)+3,11}  = proximaldiameterh;
            rowcolposition{18*(j-1)+4,11}  = cylindricaldiameterh;
            rowcolposition{18*(j-1)+5,11}  = distaldiameterh;
            rowcolposition{18*(j-1)+6,11}  = lengthh;
            rowcolposition{18*(j-1)+7,11}  = surfaceareah;
            rowcolposition{18*(j-1)+8,11}  = volumeh;
            rowcolposition{18*(j-1)+9,11}  = totallengthh;
            rowcolposition{18*(j-1)+10,11} = totalsurfaceareah;
            rowcolposition{18*(j-1)+11,11} = totalvolumeh;
            rowcolposition{18*(j-1)+12,11} = numbersegmentsh;
            rowcolposition{18*(j-1)+13,11} = numberbifurcationsh;
            rowcolposition{18*(j-1)+14,11} = numberterminationsh;
            rowcolposition{18*(j-1)+15,11} = taperrateh;
            rowcolposition{18*(j-1)+16,11} = taperratioh;
            if j < min(controlanalysis.dendrite.maxbranchorder.max,testanalysis.dendrite.maxbranchorder.max)
                rowcolposition{18*(j-1)+17,11} = rallratioh;
                rowcolposition{18*(j-1)+18,11} = daughterratioh;
            else
                rowcolposition{18*(j-1)+17,11} = [];
                rowcolposition{18*(j-1)+18,11} = [];
            end

            rowcolposition{18*(j-1)+1,12}  = '(variability)';
            rowcolposition{18*(j-1)+2,12}  = 'p';
            rowcolposition{18*(j-1)+3,12}  = proximaldiameterp;
            rowcolposition{18*(j-1)+4,12}  = cylindricaldiameterp;
            rowcolposition{18*(j-1)+5,12}  = distaldiameterp;
            rowcolposition{18*(j-1)+6,12}  = lengthp;
            rowcolposition{18*(j-1)+7,12}  = surfaceareap;
            rowcolposition{18*(j-1)+8,12}  = volumep;
            rowcolposition{18*(j-1)+9,12}  = totallengthp;
            rowcolposition{18*(j-1)+10,12} = totalsurfaceareap;
            rowcolposition{18*(j-1)+11,12} = totalvolumep;
            rowcolposition{18*(j-1)+12,12} = numbersegmentsp;
            rowcolposition{18*(j-1)+13,12} = numberbifurcationsp;
            rowcolposition{18*(j-1)+14,12} = numberterminationsp;
            rowcolposition{18*(j-1)+15,12} = taperratep;
            rowcolposition{18*(j-1)+16,12} = taperratiop;
            if j < min(controlanalysis.dendrite.maxbranchorder.max,testanalysis.dendrite.maxbranchorder.max)
                rowcolposition{18*(j-1)+17,12} = rallratiop;
                rowcolposition{18*(j-1)+18,12} = daughterratiop;
            else
                rowcolposition{18*(j-1)+17,12} = [];
                rowcolposition{18*(j-1)+18,12} = [];
            end



            [proximaldiameterh,proximaldiameterp]             = kstest2(controlanalysis.dendrite.branchorder.proximaldiameter(j).values,testanalysis.dendrite.branchorder.proximaldiameter(j).values);
            [cylindricaldiameterh,cylindricaldiameterp]       = kstest2(controlanalysis.dendrite.branchorder.cylindricaldiameter(j).values,testanalysis.dendrite.branchorder.cylindricaldiameter(j).values);
            [distaldiameterh,distaldiameterp]                 = kstest2(controlanalysis.dendrite.branchorder.distaldiameter(j).values,testanalysis.dendrite.branchorder.distaldiameter(j).values);
            [lengthh,lengthp]                                 = kstest2(controlanalysis.dendrite.branchorder.length(j).values,testanalysis.dendrite.branchorder.length(j).values);
            [surfaceareah,surfaceareap]                       = kstest2(controlanalysis.dendrite.branchorder.surfacearea(j).values,testanalysis.dendrite.branchorder.surfacearea(j).values);
            [volumeh,volumep]                                 = kstest2(controlanalysis.dendrite.branchorder.volume(j).values,testanalysis.dendrite.branchorder.volume(j).values);
            [totallengthh,totallengthp]                               = kstest2(controlanalysis.dendrite.branchorder.totallength(j).values,testanalysis.dendrite.branchorder.totallength(j).values);
            [totalsurfaceareah,totalsurfaceareap]                     = kstest2(controlanalysis.dendrite.branchorder.totalsurfacearea(j).values,testanalysis.dendrite.branchorder.totalsurfacearea(j).values);
            [totalvolumeh,totalvolumep]                               = kstest2(controlanalysis.dendrite.branchorder.totalvolume(j).values,testanalysis.dendrite.branchorder.totalvolume(j).values);
            [numbersegmentsh,numbersegmentsp]                         = kstest2(controlanalysis.dendrite.branchorder.numbersegments(j).values,testanalysis.dendrite.branchorder.numbersegments(j).values);
            [numberbifurcationsh,numberbifurcationsp]                 = kstest2(controlanalysis.dendrite.branchorder.numberbifurcations(j).values,testanalysis.dendrite.branchorder.numberbifurcations(j).values);
            [numberterminationsh,numberterminationsp]                 = kstest2(controlanalysis.dendrite.branchorder.numberterminations(j).values,testanalysis.dendrite.branchorder.numberterminations(j).values);
            [taperrateh,taperratep]                           = kstest2(controlanalysis.dendrite.branchorder.taperrate(j).values,testanalysis.dendrite.branchorder.taperrate(j).values);
            [taperratioh,taperratiop]                         = kstest2(controlanalysis.dendrite.branchorder.taperratio(j).values,testanalysis.dendrite.branchorder.taperratio(j).values);
            if j < min(controlanalysis.dendrite.maxbranchorder.max,testanalysis.dendrite.maxbranchorder.max)
                [rallratioh,rallratiop]                       = kstest2(controlanalysis.dendrite.branchorder.rallratio(j).values,testanalysis.dendrite.branchorder.rallratio(j).values);
                [daughterratioh,daughterratiop]               = kstest2(controlanalysis.dendrite.branchorder.daughterratio(j).values,testanalysis.dendrite.branchorder.daughterratio(j).values);
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

            rowcolposition{18*(j-1)+1,13}  = 'KS-test ';
            rowcolposition{18*(j-1)+2,13}  = 'h';
            rowcolposition{18*(j-1)+3,13}  = proximaldiameterh;
            rowcolposition{18*(j-1)+4,13}  = cylindricaldiameterh;
            rowcolposition{18*(j-1)+5,13}  = distaldiameterh;
            rowcolposition{18*(j-1)+6,13}  = lengthh;
            rowcolposition{18*(j-1)+7,13}  = surfaceareah;
            rowcolposition{18*(j-1)+8,13}  = volumeh;
            rowcolposition{18*(j-1)+9,13}  = totallengthh;
            rowcolposition{18*(j-1)+10,13} = totalsurfaceareah;
            rowcolposition{18*(j-1)+11,13} = totalvolumeh;
            rowcolposition{18*(j-1)+12,13} = numbersegmentsh;
            rowcolposition{18*(j-1)+13,13} = numberbifurcationsh;
            rowcolposition{18*(j-1)+14,13} = numberterminationsh;
            rowcolposition{18*(j-1)+15,13} = taperrateh;
            rowcolposition{18*(j-1)+16,13} = taperratioh;
            if j < min(controlanalysis.dendrite.maxbranchorder.max,testanalysis.dendrite.maxbranchorder.max)
                rowcolposition{18*(j-1)+17,13} = rallratioh;
                rowcolposition{18*(j-1)+18,13} = daughterratioh;
            else
                rowcolposition{18*(j-1)+17,13} = [];
                rowcolposition{18*(j-1)+18,13} = [];
            end

            rowcolposition{18*(j-1)+1,14}  = '(mean + var)';
            rowcolposition{18*(j-1)+2,14}  = 'p';
            rowcolposition{18*(j-1)+3,14}  = proximaldiameterp;
            rowcolposition{18*(j-1)+4,14}  = cylindricaldiameterp;
            rowcolposition{18*(j-1)+5,14}  = distaldiameterp;
            rowcolposition{18*(j-1)+6,14}  = lengthp;
            rowcolposition{18*(j-1)+7,14}  = surfaceareap;
            rowcolposition{18*(j-1)+8,14}  = volumep;
            rowcolposition{18*(j-1)+9,14}  = totallengthp;
            rowcolposition{18*(j-1)+10,14} = totalsurfaceareap;
            rowcolposition{18*(j-1)+11,14} = totalvolumep;
            rowcolposition{18*(j-1)+12,14} = numbersegmentsp;
            rowcolposition{18*(j-1)+13,14} = numberbifurcationsp;
            rowcolposition{18*(j-1)+14,14} = numberterminationsp;
            rowcolposition{18*(j-1)+15,14} = taperratep;
            rowcolposition{18*(j-1)+16,14} = taperratiop;
            if j < min(controlanalysis.dendrite.maxbranchorder.max,testanalysis.dendrite.maxbranchorder.max)
                rowcolposition{18*(j-1)+17,14} = rallratiop;
                rowcolposition{18*(j-1)+18,14} = daughterratiop;
            else
                rowcolposition{18*(j-1)+17,14} = [];
                rowcolposition{18*(j-1)+18,14} = [];
            end

        end
    end

    currentdirectory = cd;
    cd(controlanalysis.datapathname);
    cd ..

    if exist(sprintf('%s_%s_comparison',controlanalysis.inputfilename,testanalysis.inputfilename),'dir')==7;
        cd(sprintf('%s_%s_comparison',controlanalysis.inputfilename,testanalysis.inputfilename));
    else
        mkdir(sprintf('%s_%s_comparison',controlanalysis.inputfilename,testanalysis.inputfilename));
        cd(sprintf('%s_%s_comparison',controlanalysis.inputfilename,testanalysis.inputfilename));
    end

    if exist('comparisontables','dir')==7
        cd('comparisontables');
    else
        mkdir('comparisontables');
        cd('comparisontables');
    end
    
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'branchorder_comparison_table.csv');
    %xlswrite(filename,rowcolposition);
    cell2csv(filename,rowcolposition);
    cd(currentdirectory);

end

warning('on', 'MATLAB:divideByZero');