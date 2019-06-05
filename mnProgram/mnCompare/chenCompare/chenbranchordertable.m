function chenbranchordertable(controlanalysis,testanalysis)

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

    overallmaxbranchorder = controlanalysis.maxbranchorder.max;

    for i = 1:overallmaxbranchorder

        rowcolposition{18*(i-1)+1,1} = sprintf('Branch Order %s',num2str(i));
        rowcolposition{18*(i-1)+2,1} = 'Values';
        %rowcolposition{18*(i-1)+3,1} = 'Proximal Diameter';
        rowcolposition{18*(i-1)+4,1} = 'Cyl Diameter';
        %rowcolposition{18*(i-1)+5,1} = 'Distal Diameter';
        rowcolposition{18*(i-1)+6,1} = 'Mean Length';
        rowcolposition{18*(i-1)+7,1} = 'Mean Surface Area';
        rowcolposition{18*(i-1)+8,1} = 'Mean Volume';
        rowcolposition{18*(i-1)+9,1} = 'Total Length';
        rowcolposition{18*(i-1)+10,1} = 'Total Surface Area';
        rowcolposition{18*(i-1)+11,1} = 'Total Volume';
        rowcolposition{18*(i-1)+12,1} = 'Num Segments';
        %rowcolposition{18*(i-1)+13,1} = 'Num Bifurcations';
        %rowcolposition{18*(i-1)+14,1} = 'Num Terminations';
        rowcolposition{18*(i-1)+15,1} = 'Mean Taper Rate';
        rowcolposition{18*(i-1)+16,1} = 'Mean Taper Ratio';
        rowcolposition{18*(i-1)+17,1} = 'Mean Rall Ratio';
        %rowcolposition{18*(i-1)+18,1} = 'Mean Daught Ratio';

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
        rowcolposition{18*(i-1)+3,2}  = mean([controlanalysis.branchorder.meanproximaldiameter(i).values]);
        rowcolposition{18*(i-1)+4,2}  = mean([controlanalysis.branchorder.meancylindricaldiameter(i).values]);
        rowcolposition{18*(i-1)+5,2}  = mean([controlanalysis.branchorder.meandistaldiameter(i).values]);
        rowcolposition{18*(i-1)+6,2}  = mean([controlanalysis.branchorder.meanlength(i).values]);
        rowcolposition{18*(i-1)+7,2}  = mean([controlanalysis.branchorder.meansurfacearea(i).values]);
        rowcolposition{18*(i-1)+8,2}  = mean([controlanalysis.branchorder.meanvolume(i).values]);
        rowcolposition{18*(i-1)+9,2}  = mean([controlanalysis.branchorder.totallength(i).values]);
        rowcolposition{18*(i-1)+10,2} = mean([controlanalysis.branchorder.totalsurfacearea(i).values]);
        rowcolposition{18*(i-1)+11,2} = mean([controlanalysis.branchorder.totalvolume(i).values]);
        rowcolposition{18*(i-1)+12,2} = mean([controlanalysis.branchorder.numbersegments(i).values]);
        rowcolposition{18*(i-1)+13,2} = mean([controlanalysis.branchorder.numberbifurcations(i).values]);
        rowcolposition{18*(i-1)+14,2} = mean([controlanalysis.branchorder.numberterminations(i).values]);
        rowcolposition{18*(i-1)+15,2} = mean([controlanalysis.branchorder.meantaperrate(i).values]);
        rowcolposition{18*(i-1)+16,2} = mean([controlanalysis.branchorder.meantaperratio(i).values]);
        if i < min(controlanalysis.maxbranchorder.max)
            rowcolposition{18*(i-1)+17,2} = mean([controlanalysis.branchorder.meanrallratio(i).values]);
            rowcolposition{18*(i-1)+18,2} = mean([controlanalysis.branchorder.meandaughterratio(i).values]);
        else
            rowcolposition{18*(i-1)+17,2} = [];
            rowcolposition{18*(i-1)+18,2} = [];
        end

        rowcolposition{18*(i-1)+1,3}  = ' ';
        rowcolposition{18*(i-1)+2,3}  = 'STD';
        rowcolposition{18*(i-1)+3,3}  = std([controlanalysis.branchorder.meanproximaldiameter(i).values]);
        rowcolposition{18*(i-1)+4,3}  = std([controlanalysis.branchorder.meancylindricaldiameter(i).values]);
        rowcolposition{18*(i-1)+5,3}  = std([controlanalysis.branchorder.meandistaldiameter(i).values]);
        rowcolposition{18*(i-1)+6,3}  = std([controlanalysis.branchorder.meanlength(i).values]);
        rowcolposition{18*(i-1)+7,3}  = std([controlanalysis.branchorder.meansurfacearea(i).values]);
        rowcolposition{18*(i-1)+8,3}  = std([controlanalysis.branchorder.meanvolume(i).values]);
        rowcolposition{18*(i-1)+9,3}  = std([controlanalysis.branchorder.totallength(i).values]);
        rowcolposition{18*(i-1)+10,3} = std([controlanalysis.branchorder.totalsurfacearea(i).values]);
        rowcolposition{18*(i-1)+11,3} = std([controlanalysis.branchorder.totalvolume(i).values]);
        rowcolposition{18*(i-1)+12,3} = std([controlanalysis.branchorder.numbersegments(i).values]);
        rowcolposition{18*(i-1)+13,3} = std([controlanalysis.branchorder.numberbifurcations(i).values]);
        rowcolposition{18*(i-1)+14,3} = std([controlanalysis.branchorder.numberterminations(i).values]);
        rowcolposition{18*(i-1)+15,3} = std([controlanalysis.branchorder.meantaperrate(i).values]);
        rowcolposition{18*(i-1)+16,3} = std([controlanalysis.branchorder.meantaperratio(i).values]);
        if i < min(controlanalysis.maxbranchorder.max)
            rowcolposition{18*(i-1)+17,3} = std([controlanalysis.branchorder.meanrallratio(i).values]);
            rowcolposition{18*(i-1)+18,3} = std([controlanalysis.branchorder.meandaughterratio(i).values]);
        else
            rowcolposition{18*(i-1)+17,3} = [];
            rowcolposition{18*(i-1)+18,3} = [];
        end

        rowcolposition{18*(i-1)+1,4}  = ' ';
        rowcolposition{18*(i-1)+2,4}  = 'Skew';
        rowcolposition{18*(i-1)+3,4}  = skewness([controlanalysis.branchorder.meanproximaldiameter(i).values]);
        rowcolposition{18*(i-1)+4,4}  = skewness([controlanalysis.branchorder.meancylindricaldiameter(i).values]);
        rowcolposition{18*(i-1)+5,4}  = skewness([controlanalysis.branchorder.meandistaldiameter(i).values]);
        rowcolposition{18*(i-1)+6,4}  = skewness([controlanalysis.branchorder.meanlength(i).values]);
        rowcolposition{18*(i-1)+7,4}  = skewness([controlanalysis.branchorder.meansurfacearea(i).values]);
        rowcolposition{18*(i-1)+8,4}  = skewness([controlanalysis.branchorder.meanvolume(i).values]);
        rowcolposition{18*(i-1)+9,4}  = skewness([controlanalysis.branchorder.totallength(i).values]);
        rowcolposition{18*(i-1)+10,4} = skewness([controlanalysis.branchorder.totalsurfacearea(i).values]);
        rowcolposition{18*(i-1)+11,4} = skewness([controlanalysis.branchorder.totalvolume(i).values]);
        rowcolposition{18*(i-1)+12,4} = skewness([controlanalysis.branchorder.numbersegments(i).values]);
        rowcolposition{18*(i-1)+13,4} = skewness([controlanalysis.branchorder.numberbifurcations(i).values]);
        rowcolposition{18*(i-1)+14,4} = skewness([controlanalysis.branchorder.numberterminations(i).values]);
        rowcolposition{18*(i-1)+15,4} = skewness([controlanalysis.branchorder.meantaperrate(i).values]);
        rowcolposition{18*(i-1)+16,4} = skewness([controlanalysis.branchorder.meantaperratio(i).values]);
        if i < min(controlanalysis.maxbranchorder.max)
            rowcolposition{18*(i-1)+17,4} = skewness([controlanalysis.branchorder.meanrallratio(i).values]);
            rowcolposition{18*(i-1)+18,4} = skewness([controlanalysis.branchorder.meandaughterratio(i).values]);
        else
            rowcolposition{18*(i-1)+17,4} = [];
            rowcolposition{18*(i-1)+18,4} = [];
        end

        rowcolposition{18*(i-1)+1,5}  = ' ';
        rowcolposition{18*(i-1)+2,5}  = 'Kurt';
        rowcolposition{18*(i-1)+3,5}  = kurtosis([controlanalysis.branchorder.meanproximaldiameter(i).values]);
        rowcolposition{18*(i-1)+4,5}  = kurtosis([controlanalysis.branchorder.meancylindricaldiameter(i).values]);
        rowcolposition{18*(i-1)+5,5}  = kurtosis([controlanalysis.branchorder.meandistaldiameter(i).values]);
        rowcolposition{18*(i-1)+6,5}  = kurtosis([controlanalysis.branchorder.meanlength(i).values]);
        rowcolposition{18*(i-1)+7,5}  = kurtosis([controlanalysis.branchorder.meansurfacearea(i).values]);
        rowcolposition{18*(i-1)+8,5}  = kurtosis([controlanalysis.branchorder.meanvolume(i).values]);
        rowcolposition{18*(i-1)+9,5}  = kurtosis([controlanalysis.branchorder.totallength(i).values]);
        rowcolposition{18*(i-1)+10,5} = kurtosis([controlanalysis.branchorder.totalsurfacearea(i).values]);
        rowcolposition{18*(i-1)+11,5} = kurtosis([controlanalysis.branchorder.totalvolume(i).values]);
        rowcolposition{18*(i-1)+12,5} = kurtosis([controlanalysis.branchorder.numbersegments(i).values]);
        rowcolposition{18*(i-1)+13,5} = kurtosis([controlanalysis.branchorder.numberbifurcations(i).values]);
        rowcolposition{18*(i-1)+14,5} = kurtosis([controlanalysis.branchorder.numberterminations(i).values]);
        rowcolposition{18*(i-1)+15,5} = kurtosis([controlanalysis.branchorder.meantaperrate(i).values]);
        rowcolposition{18*(i-1)+16,5} = kurtosis([controlanalysis.branchorder.meantaperratio(i).values]);
        if i < min(controlanalysis.maxbranchorder.max)
            rowcolposition{18*(i-1)+17,5} = kurtosis([controlanalysis.branchorder.meanrallratio(i).values]);
            rowcolposition{18*(i-1)+18,5} = kurtosis([controlanalysis.branchorder.meandaughterratio(i).values]);
        else
            rowcolposition{18*(i-1)+17,5} = [];
            rowcolposition{18*(i-1)+18,5} = [];
        end

        rowcolposition{18*(i-1)+1,6}  = ' ';
        rowcolposition{18*(i-1)+2,6}  = 'Min';
        rowcolposition{18*(i-1)+3,6}  = min([controlanalysis.branchorder.meanproximaldiameter(i).values]);
        rowcolposition{18*(i-1)+4,6}  = min([controlanalysis.branchorder.meancylindricaldiameter(i).values]);
        rowcolposition{18*(i-1)+5,6}  = min([controlanalysis.branchorder.meandistaldiameter(i).values]);
        rowcolposition{18*(i-1)+6,6}  = min([controlanalysis.branchorder.meanlength(i).values]);
        rowcolposition{18*(i-1)+7,6}  = min([controlanalysis.branchorder.meansurfacearea(i).values]);
        rowcolposition{18*(i-1)+8,6}  = min([controlanalysis.branchorder.meanvolume(i).values]);
        rowcolposition{18*(i-1)+9,6}  = min([controlanalysis.branchorder.totallength(i).values]);
        rowcolposition{18*(i-1)+10,6} = min([controlanalysis.branchorder.totalsurfacearea(i).values]);
        rowcolposition{18*(i-1)+11,6} = min([controlanalysis.branchorder.totalvolume(i).values]);
        rowcolposition{18*(i-1)+12,6} = min([controlanalysis.branchorder.numbersegments(i).values]);
        rowcolposition{18*(i-1)+13,6} = min([controlanalysis.branchorder.numberbifurcations(i).values]);
        rowcolposition{18*(i-1)+14,6} = min([controlanalysis.branchorder.numberterminations(i).values]);
        rowcolposition{18*(i-1)+15,6} = min([controlanalysis.branchorder.meantaperrate(i).values]);
        rowcolposition{18*(i-1)+16,6} = min([controlanalysis.branchorder.meantaperratio(i).values]);
        if i < min(controlanalysis.maxbranchorder.max)
            rowcolposition{18*(i-1)+17,6} = min([controlanalysis.branchorder.meanrallratio(i).values]);
            rowcolposition{18*(i-1)+18,6} = min([controlanalysis.branchorder.meandaughterratio(i).values]);
        else
            rowcolposition{18*(i-1)+17,6} = [];
            rowcolposition{18*(i-1)+18,6} = [];
        end

        rowcolposition{18*(i-1)+1,7}  = ' ';
        rowcolposition{18*(i-1)+2,7}  = 'Max';
        rowcolposition{18*(i-1)+3,7}  = max([controlanalysis.branchorder.meanproximaldiameter(i).values]);
        rowcolposition{18*(i-1)+4,7}  = max([controlanalysis.branchorder.meancylindricaldiameter(i).values]);
        rowcolposition{18*(i-1)+5,7}  = max([controlanalysis.branchorder.meandistaldiameter(i).values]);
        rowcolposition{18*(i-1)+6,7}  = max([controlanalysis.branchorder.meanlength(i).values]);
        rowcolposition{18*(i-1)+7,7}  = max([controlanalysis.branchorder.meansurfacearea(i).values]);
        rowcolposition{18*(i-1)+8,7}  = max([controlanalysis.branchorder.meanvolume(i).values]);
        rowcolposition{18*(i-1)+9,7}  = max([controlanalysis.branchorder.totallength(i).values]);
        rowcolposition{18*(i-1)+10,7} = max([controlanalysis.branchorder.totalsurfacearea(i).values]);
        rowcolposition{18*(i-1)+11,7} = max([controlanalysis.branchorder.totalvolume(i).values]);
        rowcolposition{18*(i-1)+12,7} = max([controlanalysis.branchorder.numbersegments(i).values]);
        rowcolposition{18*(i-1)+13,7} = max([controlanalysis.branchorder.numberbifurcations(i).values]);
        rowcolposition{18*(i-1)+14,7} = max([controlanalysis.branchorder.numberterminations(i).values]);
        rowcolposition{18*(i-1)+15,7} = max([controlanalysis.branchorder.meantaperrate(i).values]);
        rowcolposition{18*(i-1)+16,7} = max([controlanalysis.branchorder.meantaperratio(i).values]);
        if i < min(controlanalysis.maxbranchorder.max)
            rowcolposition{18*(i-1)+17,7} = max([controlanalysis.branchorder.meanrallratio(i).values]);
            rowcolposition{18*(i-1)+18,7} = max([controlanalysis.branchorder.meandaughterratio(i).values]);
        else
            rowcolposition{18*(i-1)+17,7} = [];
            rowcolposition{18*(i-1)+18,7} = [];
        end

    end

    filename = sprintf('%s_%s',controlanalysis.inputfilename,'branchorder_table');
    xlswrite(filename,rowcolposition);
    cd(currentdirectory);

end

if nargin == 2

    currentdirectory = cd;
    cd(testanalysis.datapathname);
    %cd ..

    if exist(sprintf('%s_comparison',controlanalysis.inputfilename),'dir')==7;
        cd(sprintf('%s_comparison',controlanalysis.inputfilename));
    else
        mkdir(sprintf('%s_comparison',controlanalysis.inputfilename));
        cd(sprintf('%s_comparison',controlanalysis.inputfilename));
    end

    if exist('tables','dir')==7
        cd('tables');
    else
        mkdir('tables');
        cd('tables');
    end

    maxbranchorder(1) = controlanalysis.maxbranchorder.max;
    maxbranchorder(2) = testanalysis.maxbranchorder.max;
    overallmaxbranchorder = max(maxbranchorder);

    for i = 1:overallmaxbranchorder

        rowcolposition{14*(i-1)+1,1} = sprintf('Branch Order %s',num2str(i));
        rowcolposition{14*(i-1)+2,1} = 'Values';
        rowcolposition{14*(i-1)+3,1} = 'Cyl Diameter (\mum)'; 
        rowcolposition{14*(i-1)+4,1} = 'Mean Length (\mum)';
        rowcolposition{14*(i-1)+5,1} = 'Mean Surface Area (\mum^2)';
        rowcolposition{14*(i-1)+6,1} = 'Mean Volume (\mum^3)';
        rowcolposition{14*(i-1)+7,1} = 'Total Length (10^3 \mum)';
        rowcolposition{14*(i-1)+8,1} = 'Total Surface Area (10^3 \mum^2)';
        rowcolposition{14*(i-1)+9,1} = 'Total Volume (10^3 \mum^3)';
        rowcolposition{14*(i-1)+10,1} = 'Num Segments'; 
        rowcolposition{14*(i-1)+11,1} = 'Mean Taper Rate';
        rowcolposition{14*(i-1)+12,1} = 'Mean Taper Ratio';
        rowcolposition{14*(i-1)+13,1} = 'Mean Rall Ratio';

        j = 1;
      
        rowcolposition{14*(i-1)+1,13*(j-1)+2}  = [];
        rowcolposition{14*(i-1)+2,13*(j-1)+2}  = [];
        rowcolposition{14*(i-1)+3,13*(j-1)+2}  = [];
        rowcolposition{14*(i-1)+4,13*(j-1)+2}  = [];
        rowcolposition{14*(i-1)+5,13*(j-1)+2}  = [];
        rowcolposition{14*(i-1)+6,13*(j-1)+2}  = [];
        rowcolposition{14*(i-1)+7,13*(j-1)+2}  = [];
        rowcolposition{14*(i-1)+8,13*(j-1)+2} = [];
        rowcolposition{14*(i-1)+9,13*(j-1)+2} = [];
        rowcolposition{14*(i-1)+10,13*(j-1)+2} = [];
        rowcolposition{14*(i-1)+11,13*(j-1)+2} = [];
        rowcolposition{14*(i-1)+12,13*(j-1)+2} = [];
        rowcolposition{14*(i-1)+13,13*(j-1)+2} = [];

    end


    for i = 1:controlanalysis.maxbranchorder.max

        rowcolposition{14*(i-1)+1,1} = sprintf('Branch Order %s',num2str(i));
        rowcolposition{14*(i-1)+2,1} = 'Values';
        rowcolposition{14*(i-1)+3,1} = 'Cyl Diameter (\mum)'; 
        rowcolposition{14*(i-1)+4,1} = 'Mean Length (\mum)';
        rowcolposition{14*(i-1)+5,1} = 'Mean Surface Area (\mum^2)';
        rowcolposition{14*(i-1)+6,1} = 'Mean Volume (\mum^3)';
        rowcolposition{14*(i-1)+7,1} = 'Total Length (10^3 \mum)';
        rowcolposition{14*(i-1)+8,1} = 'Total Surface Area (10^3 \mum^2)';
        rowcolposition{14*(i-1)+9,1} = 'Total Volume (10^3 \mum^3)';
        rowcolposition{14*(i-1)+10,1} = 'Num Segments';
        rowcolposition{14*(i-1)+11,1} = 'Mean Taper Rate';
        rowcolposition{14*(i-1)+12,1} = 'Mean Taper Ratio';
        rowcolposition{14*(i-1)+13,1} = 'Mean Rall Ratio';
  

        rowcolposition{14*(i-1)+1,2}  = controlanalysis.inputfilename;
        rowcolposition{14*(i-1)+2,2}  = 'Mean';
        rowcolposition{14*(i-1)+3,2}  = controlanalysis.branchorder.meancylindricaldiameter.mean(i);     
        rowcolposition{14*(i-1)+4,2}  = controlanalysis.branchorder.meanlength.mean(i);
        rowcolposition{14*(i-1)+5,2}  = controlanalysis.branchorder.meansurfacearea.mean(i);
        rowcolposition{14*(i-1)+6,2}  = controlanalysis.branchorder.meanvolume.mean(i);
        rowcolposition{14*(i-1)+7,2}  = controlanalysis.branchorder.totallength.mean(i);
        rowcolposition{14*(i-1)+8,2}  = controlanalysis.branchorder.totalsurfacearea.mean(i);
        rowcolposition{14*(i-1)+9,2}  = controlanalysis.branchorder.totalvolume.mean(i);
        rowcolposition{14*(i-1)+10,2} = controlanalysis.branchorder.numbersegments.mean(i);    
        rowcolposition{14*(i-1)+11,2} = controlanalysis.branchorder.meantaperrate.mean(i);
        rowcolposition{14*(i-1)+12,2} = controlanalysis.branchorder.meantaperratio.mean(i);
        if i < min(controlanalysis.maxbranchorder.max)
            rowcolposition{14*(i-1)+13,2} = controlanalysis.branchorder.meanrallratio.mean(i);
      
        else
            rowcolposition{14*(i-1)+13,2} = [];
           
        end

        rowcolposition{14*(i-1)+1,3}  = ' ';
        rowcolposition{14*(i-1)+2,3}  = 'STD';      
        rowcolposition{14*(i-1)+3,3}  = controlanalysis.branchorder.meancylindricaldiameter.std(i);
        rowcolposition{14*(i-1)+4,3}  = controlanalysis.branchorder.meanlength.std(i);
        rowcolposition{14*(i-1)+5,3}  = controlanalysis.branchorder.meansurfacearea.std(i);
        rowcolposition{14*(i-1)+6,3}  = controlanalysis.branchorder.meanvolume.std(i);
        rowcolposition{14*(i-1)+7,3}  = controlanalysis.branchorder.totallength.std(i);
        rowcolposition{14*(i-1)+8,3}  = controlanalysis.branchorder.totalsurfacearea.std(i);
        rowcolposition{14*(i-1)+9,3}  = controlanalysis.branchorder.totalvolume.std(i);
        rowcolposition{14*(i-1)+10,3} = controlanalysis.branchorder.numbersegments.std(i);   
        rowcolposition{14*(i-1)+11,3} = controlanalysis.branchorder.meantaperrate.std(i);
        rowcolposition{14*(i-1)+12,3} = controlanalysis.branchorder.meantaperratio.std(i);
        if i < min(controlanalysis.maxbranchorder.max)
            rowcolposition{14*(i-1)+13,3} = controlanalysis.branchorder.meanrallratio.std(i);
          
        else
            rowcolposition{14*(i-1)+13,3} = [];
         
        end
    end

  
              currenttestanalysis = testanalysis;
              i=1;
   

    for j = 1:currenttestanalysis.maxbranchorder.max

        rowcolposition{14*(j-1)+1,11*(i-1)+4}  = currenttestanalysis.inputfilename;
        rowcolposition{14*(j-1)+2,11*(i-1)+4}  = 'Mean';     
        rowcolposition{14*(j-1)+3,11*(i-1)+4}  = mean([currenttestanalysis.branchorder.cylindricaldiameter(j).values]);     
        rowcolposition{14*(j-1)+4,11*(i-1)+4}  = mean([currenttestanalysis.branchorder.length(j).values]);
        rowcolposition{14*(j-1)+5,11*(i-1)+4}  = mean([currenttestanalysis.branchorder.surfacearea(j).values]);
        rowcolposition{14*(j-1)+6,11*(i-1)+4}  = mean([currenttestanalysis.branchorder.volume(j).values]);
        rowcolposition{14*(j-1)+7,11*(i-1)+4}  = mean([currenttestanalysis.branchorder.totallength(j).values]);
        rowcolposition{14*(j-1)+8,11*(i-1)+4}  = mean([currenttestanalysis.branchorder.totalsurfacearea(j).values]);
        rowcolposition{14*(j-1)+9,11*(i-1)+4}  = mean([currenttestanalysis.branchorder.totalvolume(j).values]);
        rowcolposition{14*(j-1)+10,11*(i-1)+4} = mean([currenttestanalysis.branchorder.numbersegments(j).values]);     
        rowcolposition{14*(j-1)+11,11*(i-1)+4} = mean([currenttestanalysis.branchorder.taperrate(j).values]);
        rowcolposition{14*(j-1)+12,11*(i-1)+4} = mean([currenttestanalysis.branchorder.taperratio(j).values]);
        if j < currenttestanalysis.maxbranchorder.max
            rowcolposition{14*(j-1)+13,11*(i-1)+4} = mean([currenttestanalysis.branchorder.rallratio(j).values]);
          
        else
            rowcolposition{14*(j-1)+13,11*(i-1)+4} = [];
           
        end

        rowcolposition{14*(j-1)+1,11*(i-1)+5}  = ' ';
        rowcolposition{14*(j-1)+2,11*(i-1)+5}  = 'STD';   
        rowcolposition{14*(j-1)+3,11*(i-1)+5}  = std([currenttestanalysis.branchorder.cylindricaldiameter(j).values]);
        rowcolposition{14*(j-1)+4,11*(i-1)+5}  = std([currenttestanalysis.branchorder.length(j).values]);
        rowcolposition{14*(j-1)+5,11*(i-1)+5}  = std([currenttestanalysis.branchorder.surfacearea(j).values]);
        rowcolposition{14*(j-1)+6,11*(i-1)+5}  = std([currenttestanalysis.branchorder.volume(j).values]);
        rowcolposition{14*(j-1)+7,11*(i-1)+5}  = std([currenttestanalysis.branchorder.totallength(j).values]);
        rowcolposition{14*(j-1)+8,11*(i-1)+5}  = std([currenttestanalysis.branchorder.totalsurfacearea(j).values]);
        rowcolposition{14*(j-1)+9,11*(i-1)+5}  = std([currenttestanalysis.branchorder.totalvolume(j).values]);
        rowcolposition{14*(j-1)+10,11*(i-1)+5} = std([currenttestanalysis.branchorder.numbersegments(j).values]);
        rowcolposition{14*(j-1)+11,11*(i-1)+5} = std([currenttestanalysis.branchorder.taperrate(j).values]);
        rowcolposition{14*(j-1)+12,11*(i-1)+5} = std([currenttestanalysis.branchorder.taperratio(j).values]);
        if j < currenttestanalysis.maxbranchorder.max
            rowcolposition{14*(j-1)+13,11*(i-1)+5} = std([currenttestanalysis.branchorder.rallratio(j).values]);
   
        else
            rowcolposition{14*(j-1)+13,11*(i-1)+5} = [];
   
        end

        if j <= controlanalysis.maxbranchorder.max

 
            meancylindricaldiametermeandiff     = 100*((mean(currenttestanalysis.branchorder.cylindricaldiameter(j).values)- controlanalysis.branchorder.meancylindricaldiameter.mean(j))      / controlanalysis.branchorder.meancylindricaldiameter.mean(j));
            meanlengthmeandiff                  = 100*((mean(currenttestanalysis.branchorder.length(j).values)             - controlanalysis.branchorder.meanlength.mean(j))                   / controlanalysis.branchorder.meanlength.mean(j));
            meansurfaceareameandiff             = 100*((mean(currenttestanalysis.branchorder.surfacearea(j).values)        - controlanalysis.branchorder.meansurfacearea.mean(j))              / controlanalysis.branchorder.meansurfacearea.mean(j));
            meanvolumemeandiff                  = 100*((mean(currenttestanalysis.branchorder.volume(j).values)             - controlanalysis.branchorder.meanvolume.mean(j))                   / controlanalysis.branchorder.meanvolume.mean(j));
            totallengthmeandiff                 = 100*((mean(currenttestanalysis.branchorder.totallength(j).values)            - controlanalysis.branchorder.totallength.mean(j))                  / controlanalysis.branchorder.totallength.mean(j));
            totalsurfaceareameandiff            = 100*((mean(currenttestanalysis.branchorder.totalsurfacearea(j).values)       - controlanalysis.branchorder.totalsurfacearea.mean(j))             / controlanalysis.branchorder.totalsurfacearea.mean(j));
            totalvolumemeandiff                 = 100*((mean(currenttestanalysis.branchorder.totalvolume(j).values)            - controlanalysis.branchorder.totalvolume.mean(j))                  / controlanalysis.branchorder.totalvolume.mean(j));
            numbersegmentsmeandiff              = 100*((mean(currenttestanalysis.branchorder.numbersegments(j).values)         - controlanalysis.branchorder.numbersegments.mean(j))               / controlanalysis.branchorder.numbersegments.mean(j));
            meantaperratemeandiff               = 100*((mean(currenttestanalysis.branchorder.taperrate(j).values)          - controlanalysis.branchorder.meantaperrate.mean(j))                / controlanalysis.branchorder.meantaperrate.mean(j));
            meantaperratiomeandiff              = 100*((mean(currenttestanalysis.branchorder.taperratio(j).values)         - controlanalysis.branchorder.meantaperratio.mean(j))               / controlanalysis.branchorder.meantaperratio.mean(j));
            meanrallratiomeandiff               = 100*((mean(currenttestanalysis.branchorder.rallratio(j).values)          - controlanalysis.branchorder.meanrallratio.mean(j))                / controlanalysis.branchorder.meanrallratio.mean(j));
     
            rowcolposition{14*(j-1)+1,11*(i-1)+6}  = '% Mean Diff';
            rowcolposition{14*(j-1)+2,11*(i-1)+6}  = ' ';
            rowcolposition{14*(j-1)+3,11*(i-1)+6}  = meancylindricaldiametermeandiff;
            rowcolposition{14*(j-1)+4,11*(i-1)+6}  = meanlengthmeandiff;
            rowcolposition{14*(j-1)+5,11*(i-1)+6}  = meansurfaceareameandiff;
            rowcolposition{14*(j-1)+6,11*(i-1)+6}  = meanvolumemeandiff;
            rowcolposition{14*(j-1)+7,11*(i-1)+6}  = totallengthmeandiff;
            rowcolposition{14*(j-1)+8,11*(i-1)+6} = totalsurfaceareameandiff;
            rowcolposition{14*(j-1)+9,11*(i-1)+6} = totalvolumemeandiff;
            rowcolposition{14*(j-1)+10,11*(i-1)+6} = numbersegmentsmeandiff;
            rowcolposition{14*(j-1)+11,11*(i-1)+6} = meantaperratemeandiff;
            rowcolposition{14*(j-1)+12,11*(i-1)+6} = meantaperratiomeandiff;
            if j < min(controlanalysis.maxbranchorder.max,currenttestanalysis.maxbranchorder.max)
                rowcolposition{14*(j-1)+13,11*(i-1)+6} = meanrallratiomeandiff;
            else
                rowcolposition{14*(j-1)+13,11*(i-1)+6} = [];
            end


                         
                            [meancylindricaldiameterh,meancylindricaldiameterp]       = ttest(currenttestanalysis.branchorder.cylindricaldiameter(j).values,controlanalysis.branchorder.meancylindricaldiameter.mean(j));                           
                            [meanlengthh,meanlengthp]                                 = ttest(currenttestanalysis.branchorder.length(j).values,controlanalysis.branchorder.meanlength.mean(j));
                            [meansurfaceareah,meansurfaceareap]                       = ttest(currenttestanalysis.branchorder.surfacearea(j).values,controlanalysis.branchorder.meansurfacearea.mean(j));
                            [meanvolumeh,meanvolumep]                                 = ttest(currenttestanalysis.branchorder.volume(j).values,controlanalysis.branchorder.meanvolume.mean(j));
                            [totallengthh,totallengthp]                               = ttest(currenttestanalysis.branchorder.totallength(j).values,controlanalysis.branchorder.totallength.mean(j));
                            [totalsurfaceareah,totalsurfaceareap]                     = ttest(currenttestanalysis.branchorder.totalsurfacearea(j).values,controlanalysis.branchorder.totalsurfacearea.mean(j));
                            [totalvolumeh,totalvolumep]                               = ttest(currenttestanalysis.branchorder.totalvolume(j).values,controlanalysis.branchorder.totalvolume.mean(j));
                            [numbersegmentsh,numbersegmentsp]                         = ttest(currenttestanalysis.branchorder.numbersegments(j).values,controlanalysis.branchorder.numbersegments.mean(j));
                            [meantaperrateh,meantaperratep]                           = ttest(currenttestanalysis.branchorder.taperrate(j).values,controlanalysis.branchorder.meantaperrate.mean(j));
                            [meantaperratioh,meantaperratiop]                         = ttest(currenttestanalysis.branchorder.taperratio(j).values,controlanalysis.branchorder.meantaperratio.mean(j));
                            if j < min(controlanalysis.maxbranchorder.max,currenttestanalysis.maxbranchorder.max)
                                [meanrallratioh,meanrallratiop]                       = ttest(currenttestanalysis.branchorder.rallratio(j).values,controlanalysis.branchorder.meanrallratio.mean(j));
                               else
                                meanrallratiop                                        = [];
                                meanrallratioh                                        = [];
                            end
            
            
                            if meancylindricaldiameterh      == 0, meancylindricaldiameterh = 'same'; else meancylindricaldiameterh = 'diff'; end;
                            if meanlengthh                   == 0, meanlengthh = 'same'; else meanlengthh = 'diff'; end;
                            if meansurfaceareah              == 0, meansurfaceareah = 'same'; else meansurfaceareah = 'diff'; end;
                            if meanvolumeh                   == 0, meanvolumeh = 'same'; else meanvolumeh = 'diff'; end;
                            if totallengthh                  == 0, totallengthh = 'same'; else totallengthh = 'diff'; end;
                            if totalsurfaceareah             == 0, totalsurfaceareah = 'same'; else totalsurfaceareah = 'diff'; end;
                            if totalvolumeh                  == 0, totalvolumeh = 'same'; else totalvolumeh = 'diff'; end;
                            if numbersegmentsh               == 0, numbersegmentsh = 'same'; else numbersegmentsh = 'diff'; end;
                            if meantaperrateh                == 0, meantaperrateh = 'same'; else meantaperrateh = 'diff'; end;
                            if meantaperratioh               == 0, meantaperratioh = 'same'; else meantaperratioh = 'diff'; end;
                            if meanrallratioh                == 0, meanrallratioh = 'same'; else meanrallratioh = 'diff'; end;
                          
                            rowcolposition{14*(j-1)+1,11*(i-1)+7}  = 't-test ';
                            rowcolposition{14*(j-1)+2,11*(i-1)+7}  = 'h';
                            rowcolposition{14*(j-1)+3,11*(i-1)+7}  = meancylindricaldiameterh;
                            rowcolposition{14*(j-1)+4,11*(i-1)+7}  = meanlengthh;
                            rowcolposition{14*(j-1)+5,11*(i-1)+7}  = meansurfaceareah;
                            rowcolposition{14*(j-1)+6,11*(i-1)+7}  = meanvolumeh;
                            rowcolposition{14*(j-1)+7,11*(i-1)+7}  = totallengthh;
                            rowcolposition{14*(j-1)+8,11*(i-1)+7} = totalsurfaceareah;
                            rowcolposition{14*(j-1)+9,11*(i-1)+7} = totalvolumeh;
                            rowcolposition{14*(j-1)+10,11*(i-1)+7} = numbersegmentsh;
                            rowcolposition{14*(j-1)+11,11*(i-1)+7} = meantaperrateh;
                            rowcolposition{14*(j-1)+12,11*(i-1)+7} = meantaperratioh;
                            if j < min(controlanalysis.maxbranchorder.max,currenttestanalysis.maxbranchorder.max)
                                rowcolposition{14*(j-1)+13,11*(i-1)+7} = meanrallratioh;
                            else
                                rowcolposition{14*(j-1)+13,11*(i-1)+7} = [];
                            end
            
                            rowcolposition{14*(j-1)+1,11*(i-1)+8}  = '(mean)';
                            rowcolposition{14*(j-1)+2,11*(i-1)+8}  = 'p';
                            rowcolposition{14*(j-1)+3,11*(i-1)+8}  = meancylindricaldiameterp;
                            rowcolposition{14*(j-1)+4,11*(i-1)+8}  = meanlengthp;
                            rowcolposition{14*(j-1)+5,11*(i-1)+8}  = meansurfaceareap;
                            rowcolposition{14*(j-1)+6,11*(i-1)+8}  = meanvolumep;
                            rowcolposition{14*(j-1)+7,11*(i-1)+8}  = totallengthp;
                            rowcolposition{14*(j-1)+8,11*(i-1)+8} = totalsurfaceareap;
                            rowcolposition{14*(j-1)+9,11*(i-1)+8} = totalvolumep;
                            rowcolposition{14*(j-1)+10,11*(i-1)+8} = numbersegmentsp;
                            rowcolposition{14*(j-1)+11,11*(i-1)+8} = meantaperratep;
                            rowcolposition{14*(j-1)+12,11*(i-1)+8} = meantaperratiop;
                            if j < currenttestanalysis.maxbranchorder.max
                                rowcolposition{14*(j-1)+13,11*(i-1)+8} = meanrallratiop;
                             else
                                rowcolposition{14*(j-1)+13,11*(i-1)+8} = [];
                            end
            %
            %
            %                 [meanproximaldiameterp,meanproximaldiameterh]             = ranksum(controlanalysis.branchorder.meanproximaldiameter(j).values,currenttestanalysis.branchorder.meanproximaldiameter(j).values);
            %                 [meancylindricaldiameterp,meancylindricaldiameterh]       = ranksum(controlanalysis.branchorder.meancylindricaldiameter(j).values,currenttestanalysis.branchorder.meancylindricaldiameter(j).values);
            %                 [meandistaldiameterp,meandistaldiameterh]                 = ranksum(controlanalysis.branchorder.meandistaldiameter(j).values,currenttestanalysis.branchorder.meandistaldiameter(j).values);
            %                 [meanlengthp,meanlengthh]                                 = ranksum(controlanalysis.branchorder.meanlength(j).values,currenttestanalysis.branchorder.meanlength(j).values);
            %                 [meansurfaceareap,meansurfaceareah]                       = ranksum(controlanalysis.branchorder.meansurfacearea(j).values,currenttestanalysis.branchorder.meansurfacearea(j).values);
            %                 [meanvolumep,meanvolumeh]                                 = ranksum(controlanalysis.branchorder.meanvolume(j).values,currenttestanalysis.branchorder.meanvolume(j).values);
            %                 [totallengthp,totallengthh]                               = ranksum(controlanalysis.branchorder.totallength(j).values,currenttestanalysis.branchorder.totallength(j).values);
            %                 [totalsurfaceareap,totalsurfaceareah]                     = ranksum(controlanalysis.branchorder.totalsurfacearea(j).values,currenttestanalysis.branchorder.totalsurfacearea(j).values);
            %                 [totalvolumep,totalvolumeh]                               = ranksum(controlanalysis.branchorder.totalvolume(j).values,currenttestanalysis.branchorder.totalvolume(j).values);
            %                 [numbersegmentsp,numbersegmentsh]                         = ranksum(controlanalysis.branchorder.numbersegments(j).values,currenttestanalysis.branchorder.numbersegments(j).values);
            %                 [numberbifurcationsp,numberbifurcationsh]                 = ranksum(controlanalysis.branchorder.numberbifurcations(j).values,currenttestanalysis.branchorder.numberbifurcations(j).values);
            %                 [numberterminationsp,numberterminationsh]                 = ranksum(controlanalysis.branchorder.numberterminations(j).values,currenttestanalysis.branchorder.numberterminations(j).values);
            %                 [meantaperratep,meantaperrateh]                           = ranksum(controlanalysis.branchorder.meantaperrate(j).values,currenttestanalysis.branchorder.meantaperrate(j).values);
            %                 [meantaperratiop,meantaperratioh]                         = ranksum(controlanalysis.branchorder.meantaperratio(j).values,currenttestanalysis.branchorder.meantaperratio(j).values);
            %                 if j < min(controlanalysis.maxbranchorder.max,currenttestanalysis.maxbranchorder.max)
            %                     [meanrallratiop,meanrallratioh]                       = ranksum(controlanalysis.branchorder.meanrallratio(j).values,currenttestanalysis.branchorder.meanrallratio(j).values);
            %                     [meandaughterratiop,meandaughterratioh]               = ranksum(controlanalysis.branchorder.meandaughterratio(j).values,currenttestanalysis.branchorder.meandaughterratio(j).values);
            %                 else
            %                     meanrallratiop                                        = [];
            %                     meanrallratioh                                        = [];
            %                     meandaughterratiop                                    = [];
            %                     meandaughterratioh                                    = [];
            %                 end
            %
            %                 if meanproximaldiameterh         == 0, meanproximaldiameterh = 'same'; else meanproximaldiameterh = 'diff'; end;
            %                 if meancylindricaldiameterh      == 0, meancylindricaldiameterh = 'same'; else meancylindricaldiameterh = 'diff'; end;
            %                 if meandistaldiameterh           == 0, meandistaldiameterh = 'same'; else meandistaldiameterh = 'diff'; end;
            %                 if meanlengthh                   == 0, meanlengthh = 'same'; else meanlengthh = 'diff'; end;
            %                 if meansurfaceareah              == 0, meansurfaceareah = 'same'; else meansurfaceareah = 'diff'; end;
            %                 if meanvolumeh                   == 0, meanvolumeh = 'same'; else meanvolumeh = 'diff'; end;
            %                 if totallengthh                  == 0, totallengthh = 'same'; else totallengthh = 'diff'; end;
            %                 if totalsurfaceareah             == 0, totalsurfaceareah = 'same'; else totalsurfaceareah = 'diff'; end;
            %                 if totalvolumeh                  == 0, totalvolumeh = 'same'; else totalvolumeh = 'diff'; end;
            %                 if numbersegmentsh               == 0, numbersegmentsh = 'same'; else numbersegmentsh = 'diff'; end;
            %                 if numberbifurcationsh           == 0, numberbifurcationsh = 'same'; else numberbifurcationsh = 'diff'; end;
            %                 if numberterminationsh           == 0, numberterminationsh = 'same'; else numberterminationsh = 'diff'; end;
            %                 if meantaperrateh                == 0, meantaperrateh = 'same'; else meantaperrateh = 'diff'; end;
            %                 if meantaperratioh               == 0, meantaperratioh = 'same'; else meantaperratioh = 'diff'; end;
            %                 if meanrallratioh                == 0, meanrallratioh = 'same'; else meanrallratioh = 'diff'; end;
            %                 if meandaughterratioh            == 0, meandaughterratioh = 'same'; else meandaughterratioh = 'diff'; end;
            %
            %                 rowcolposition{14*(j-1)+1,11*(i-1)+9}  = 'RS-test ';
            %                 rowcolposition{14*(j-1)+2,11*(i-1)+9}  = 'h';
            %                 rowcolposition{14*(j-1)+3,11*(i-1)+9}  = meanproximaldiameterh;
            %                 rowcolposition{14*(j-1)+4,11*(i-1)+9}  = meancylindricaldiameterh;
            %                 rowcolposition{14*(j-1)+5,11*(i-1)+9}  = meandistaldiameterh;
            %                 rowcolposition{14*(j-1)+6,11*(i-1)+9}  = meanlengthh;
            %                 rowcolposition{14*(j-1)+7,11*(i-1)+9}  = meansurfaceareah;
            %                 rowcolposition{14*(j-1)+8,11*(i-1)+9}  = meanvolumeh;
            %                 rowcolposition{14*(j-1)+9,11*(i-1)+9}  = totallengthh;
            %                 rowcolposition{14*(j-1)+10,11*(i-1)+9} = totalsurfaceareah;
            %                 rowcolposition{14*(j-1)+11,11*(i-1)+9} = totalvolumeh;
            %                 rowcolposition{14*(j-1)+12,11*(i-1)+9} = numbersegmentsh;
            %                 rowcolposition{14*(j-1)+13,11*(i-1)+9} = numberbifurcationsh;
            %                 rowcolposition{14*(j-1)+14,11*(i-1)+9} = numberterminationsh;
            %                 rowcolposition{14*(j-1)+15,11*(i-1)+9} = meantaperrateh;
            %                 rowcolposition{14*(j-1)+16,11*(i-1)+9} = meantaperratioh;
            %                 if j < min(controlanalysis.maxbranchorder.max,currenttestanalysis.maxbranchorder.max)
            %                     rowcolposition{14*(j-1)+17,11*(i-1)+9} = meanrallratioh;
            %                     rowcolposition{14*(j-1)+18,11*(i-1)+9} = meandaughterratioh;
            %                 else
            %                     rowcolposition{14*(j-1)+17,11*(i-1)+9} = [];
            %                     rowcolposition{14*(j-1)+18,11*(i-1)+9} = [];
            %                 end
            %
            %                 rowcolposition{14*(j-1)+1,11*(i-1)+10}  = '(median)';
            %                 rowcolposition{14*(j-1)+2,11*(i-1)+10}  = 'p';
            %                 rowcolposition{14*(j-1)+3,11*(i-1)+10}  = meanproximaldiameterp;
            %                 rowcolposition{14*(j-1)+4,11*(i-1)+10}  = meancylindricaldiameterp;
            %                 rowcolposition{14*(j-1)+5,11*(i-1)+10}  = meandistaldiameterp;
            %                 rowcolposition{14*(j-1)+6,11*(i-1)+10}  = meanlengthp;
            %                 rowcolposition{14*(j-1)+7,11*(i-1)+10}  = meansurfaceareap;
            %                 rowcolposition{14*(j-1)+8,11*(i-1)+10}  = meanvolumep;
            %                 rowcolposition{14*(j-1)+9,11*(i-1)+10}  = totallengthp;
            %                 rowcolposition{14*(j-1)+10,11*(i-1)+10} = totalsurfaceareap;
            %                 rowcolposition{14*(j-1)+11,11*(i-1)+10} = totalvolumep;
            %                 rowcolposition{14*(j-1)+12,11*(i-1)+10} = numbersegmentsp;
            %                 rowcolposition{14*(j-1)+13,11*(i-1)+10} = numberbifurcationsp;
            %                 rowcolposition{14*(j-1)+14,11*(i-1)+10} = numberterminationsp;
            %                 rowcolposition{14*(j-1)+15,11*(i-1)+10} = meantaperratep;
            %                 rowcolposition{14*(j-1)+16,11*(i-1)+10} = meantaperratiop;
            %                 if j < min(controlanalysis.maxbranchorder.max,currenttestanalysis.maxbranchorder.max)
            %                     rowcolposition{14*(j-1)+17,11*(i-1)+10} = meanrallratiop;
            %                     rowcolposition{14*(j-1)+18,11*(i-1)+10} = meandaughterratiop;
            %                 else
            %                     rowcolposition{14*(j-1)+17,11*(i-1)+10} = [];
            %                     rowcolposition{14*(j-1)+18,11*(i-1)+10} = [];
            %                 end
            %
            %
            %                 if length(controlanalysis.branchorder.meanproximaldiameter(j).values) == length(currenttestanalysis.branchorder.meanproximaldiameter(j).values)
            %                     [meanproximaldiameterh,meanproximaldiameterp]             = ansaribradley(controlanalysis.branchorder.meanproximaldiameter(j).values,currenttestanalysis.branchorder.meanproximaldiameter(j).values);
            %                     [meancylindricaldiameterh,meancylindricaldiameterp]       = ansaribradley(controlanalysis.branchorder.meancylindricaldiameter(j).values,currenttestanalysis.branchorder.meancylindricaldiameter(j).values);
            %                     [meandistaldiameterh,meandistaldiameterp]                 = ansaribradley(controlanalysis.branchorder.meandistaldiameter(j).values,currenttestanalysis.branchorder.meandistaldiameter(j).values);
            %                     [meanlengthh,meanlengthp]                                 = ansaribradley(controlanalysis.branchorder.meanlength(j).values,currenttestanalysis.branchorder.meanlength(j).values);
            %                     [meansurfaceareah,meansurfaceareap]                       = ansaribradley(controlanalysis.branchorder.meansurfacearea(j).values,currenttestanalysis.branchorder.meansurfacearea(j).values);
            %                     [meanvolumeh,meanvolumep]                                 = ansaribradley(controlanalysis.branchorder.meanvolume(j).values,currenttestanalysis.branchorder.meanvolume(j).values);
            %                     [totallengthh,totallengthp]                               = ansaribradley(controlanalysis.branchorder.totallength(j).values,currenttestanalysis.branchorder.totallength(j).values);
            %                     [totalsurfaceareah,totalsurfaceareap]                     = ansaribradley(controlanalysis.branchorder.totalsurfacearea(j).values,currenttestanalysis.branchorder.totalsurfacearea(j).values);
            %                     [totalvolumeh,totalvolumep]                               = ansaribradley(controlanalysis.branchorder.totalvolume(j).values,currenttestanalysis.branchorder.totalvolume(j).values);
            %                     [numbersegmentsh,numbersegmentsp]                         = ansaribradley(controlanalysis.branchorder.numbersegments(j).values,currenttestanalysis.branchorder.numbersegments(j).values);
            %                     [numberbifurcationsh,numberbifurcationsp]                 = ansaribradley(controlanalysis.branchorder.numberbifurcations(j).values,currenttestanalysis.branchorder.numberbifurcations(j).values);
            %                     [numberterminationsh,numberterminationsp]                 = ansaribradley(controlanalysis.branchorder.numberterminations(j).values,currenttestanalysis.branchorder.numberterminations(j).values);
            %                     [meantaperrateh,meantaperratep]                           = ansaribradley(controlanalysis.branchorder.meantaperrate(j).values,currenttestanalysis.branchorder.meantaperrate(j).values);
            %                     [meantaperratioh,meantaperratiop]                         = ansaribradley(controlanalysis.branchorder.meantaperratio(j).values,currenttestanalysis.branchorder.meantaperratio(j).values);
            %                     if j < min(controlanalysis.maxbranchorder.max,currenttestanalysis.maxbranchorder.max) && length(controlanalysis.branchorder.meanrallratio(j).values) == length(currenttestanalysis.branchorder.meanrallratio(j).values)
            %                         [meanrallratioh,meanrallratiop]                       = ansaribradley(controlanalysis.branchorder.meanrallratio(j).values,currenttestanalysis.branchorder.meanrallratio(j).values);
            %                         [meandaughterratioh,meandaughterratiop]               = ansaribradley(controlanalysis.branchorder.meandaughterratio(j).values,currenttestanalysis.branchorder.meandaughterratio(j).values);
            %                     else
            %                         meanrallratiop                                        = [];
            %                         meanrallratioh                                        = [];
            %                         meandaughterratiop                                    = [];
            %                         meandaughterratioh                                    = [];
            %                     end
            %                 end
            %
            %                 if meanproximaldiameterh         == 0, meanproximaldiameterh = 'same'; else meanproximaldiameterh = 'diff'; end;
            %                 if meancylindricaldiameterh      == 0, meancylindricaldiameterh = 'same'; else meancylindricaldiameterh = 'diff'; end;
            %                 if meandistaldiameterh           == 0, meandistaldiameterh = 'same'; else meandistaldiameterh = 'diff'; end;
            %                 if meanlengthh                   == 0, meanlengthh = 'same'; else meanlengthh = 'diff'; end;
            %                 if meansurfaceareah              == 0, meansurfaceareah = 'same'; else meansurfaceareah = 'diff'; end;
            %                 if meanvolumeh                   == 0, meanvolumeh = 'same'; else meanvolumeh = 'diff'; end;
            %                 if totallengthh                  == 0, totallengthh = 'same'; else totallengthh = 'diff'; end;
            %                 if totalsurfaceareah             == 0, totalsurfaceareah = 'same'; else totalsurfaceareah = 'diff'; end;
            %                 if totalvolumeh                  == 0, totalvolumeh = 'same'; else totalvolumeh = 'diff'; end;
            %                 if numbersegmentsh               == 0, numbersegmentsh = 'same'; else numbersegmentsh = 'diff'; end;
            %                 if numberbifurcationsh           == 0, numberbifurcationsh = 'same'; else numberbifurcationsh = 'diff'; end;
            %                 if numberterminationsh           == 0, numberterminationsh = 'same'; else numberterminationsh = 'diff'; end;
            %                 if meantaperrateh                == 0, meantaperrateh = 'same'; else meantaperrateh = 'diff'; end;
            %                 if meantaperratioh               == 0, meantaperratioh = 'same'; else meantaperratioh = 'diff'; end;
            %                 if meanrallratioh                == 0, meanrallratioh = 'same'; else meanrallratioh = 'diff'; end;
            %                 if meandaughterratioh            == 0, meandaughterratioh = 'same'; else meandaughterratioh = 'diff'; end;
            %
            %                 rowcolposition{14*(j-1)+1,11*(i-1)+11}  = 'AB-test ';
            %                 rowcolposition{14*(j-1)+2,11*(i-1)+11}  = 'h';
            %                 rowcolposition{14*(j-1)+3,11*(i-1)+11}  = meanproximaldiameterh;
            %                 rowcolposition{14*(j-1)+4,11*(i-1)+11}  = meancylindricaldiameterh;
            %                 rowcolposition{14*(j-1)+5,11*(i-1)+11}  = meandistaldiameterh;
            %                 rowcolposition{14*(j-1)+6,11*(i-1)+11}  = meanlengthh;
            %                 rowcolposition{14*(j-1)+7,11*(i-1)+11}  = meansurfaceareah;
            %                 rowcolposition{14*(j-1)+8,11*(i-1)+11}  = meanvolumeh;
            %                 rowcolposition{14*(j-1)+9,11*(i-1)+11}  = totallengthh;
            %                 rowcolposition{14*(j-1)+10,11*(i-1)+11} = totalsurfaceareah;
            %                 rowcolposition{14*(j-1)+11,11*(i-1)+11} = totalvolumeh;
            %                 rowcolposition{14*(j-1)+12,11*(i-1)+11} = numbersegmentsh;
            %                 rowcolposition{14*(j-1)+13,11*(i-1)+11} = numberbifurcationsh;
            %                 rowcolposition{14*(j-1)+14,11*(i-1)+11} = numberterminationsh;
            %                 rowcolposition{14*(j-1)+15,11*(i-1)+11} = meantaperrateh;
            %                 rowcolposition{14*(j-1)+16,11*(i-1)+11} = meantaperratioh;
            %                 if j < min(controlanalysis.maxbranchorder.max,currenttestanalysis.maxbranchorder.max)
            %                     rowcolposition{14*(j-1)+17,11*(i-1)+11} = meanrallratioh;
            %                     rowcolposition{14*(j-1)+18,11*(i-1)+11} = meandaughterratioh;
            %                 else
            %                     rowcolposition{14*(j-1)+17,11*(i-1)+11} = [];
            %                     rowcolposition{14*(j-1)+18,11*(i-1)+11} = [];
            %                 end
            %
            %                 rowcolposition{14*(j-1)+1,11*(i-1)+12}  = '(variability)';
            %                 rowcolposition{14*(j-1)+2,11*(i-1)+12}  = 'p';
            %                 rowcolposition{14*(j-1)+3,11*(i-1)+12}  = meanproximaldiameterp;
            %                 rowcolposition{14*(j-1)+4,11*(i-1)+12}  = meancylindricaldiameterp;
            %                 rowcolposition{14*(j-1)+5,11*(i-1)+12}  = meandistaldiameterp;
            %                 rowcolposition{14*(j-1)+6,11*(i-1)+12}  = meanlengthp;
            %                 rowcolposition{14*(j-1)+7,11*(i-1)+12}  = meansurfaceareap;
            %                 rowcolposition{14*(j-1)+8,11*(i-1)+12}  = meanvolumep;
            %                 rowcolposition{14*(j-1)+9,11*(i-1)+12}  = totallengthp;
            %                 rowcolposition{14*(j-1)+10,11*(i-1)+12} = totalsurfaceareap;
            %                 rowcolposition{14*(j-1)+11,11*(i-1)+12} = totalvolumep;
            %                 rowcolposition{14*(j-1)+12,11*(i-1)+12} = numbersegmentsp;
            %                 rowcolposition{14*(j-1)+13,11*(i-1)+12} = numberbifurcationsp;
            %                 rowcolposition{14*(j-1)+14,11*(i-1)+12} = numberterminationsp;
            %                 rowcolposition{14*(j-1)+15,11*(i-1)+12} = meantaperratep;
            %                 rowcolposition{14*(j-1)+16,11*(i-1)+12} = meantaperratiop;
            %                 if j < min(controlanalysis.maxbranchorder.max,currenttestanalysis.maxbranchorder.max)
            %                     rowcolposition{14*(j-1)+17,11*(i-1)+12} = meanrallratiop;
            %                     rowcolposition{14*(j-1)+18,11*(i-1)+12} = meandaughterratiop;
            %                 else
            %                     rowcolposition{14*(j-1)+17,11*(i-1)+12} = [];
            %                     rowcolposition{14*(j-1)+18,11*(i-1)+12} = [];
            %                 end
            %
            %
            %
            %                 [meanproximaldiameterh,meanproximaldiameterp]             = kstest2(controlanalysis.branchorder.meanproximaldiameter(j).values,currenttestanalysis.branchorder.meanproximaldiameter(j).values);
            %                 [meancylindricaldiameterh,meancylindricaldiameterp]       = kstest2(controlanalysis.branchorder.meancylindricaldiameter(j).values,currenttestanalysis.branchorder.meancylindricaldiameter(j).values);
            %                 [meandistaldiameterh,meandistaldiameterp]                 = kstest2(controlanalysis.branchorder.meandistaldiameter(j).values,currenttestanalysis.branchorder.meandistaldiameter(j).values);
            %                 [meanlengthh,meanlengthp]                                 = kstest2(controlanalysis.branchorder.meanlength(j).values,currenttestanalysis.branchorder.meanlength(j).values);
            %                 [meansurfaceareah,meansurfaceareap]                       = kstest2(controlanalysis.branchorder.meansurfacearea(j).values,currenttestanalysis.branchorder.meansurfacearea(j).values);
            %                 [meanvolumeh,meanvolumep]                                 = kstest2(controlanalysis.branchorder.meanvolume(j).values,currenttestanalysis.branchorder.meanvolume(j).values);
            %                 [totallengthh,totallengthp]                               = kstest2(controlanalysis.branchorder.totallength(j).values,currenttestanalysis.branchorder.totallength(j).values);
            %                 [totalsurfaceareah,totalsurfaceareap]                     = kstest2(controlanalysis.branchorder.totalsurfacearea(j).values,currenttestanalysis.branchorder.totalsurfacearea(j).values);
            %                 [totalvolumeh,totalvolumep]                               = kstest2(controlanalysis.branchorder.totalvolume(j).values,currenttestanalysis.branchorder.totalvolume(j).values);
            %                 [numbersegmentsh,numbersegmentsp]                         = kstest2(controlanalysis.branchorder.numbersegments(j).values,currenttestanalysis.branchorder.numbersegments(j).values);
            %                 [numberbifurcationsh,numberbifurcationsp]                 = kstest2(controlanalysis.branchorder.numberbifurcations(j).values,currenttestanalysis.branchorder.numberbifurcations(j).values);
            %                 [numberterminationsh,numberterminationsp]                 = kstest2(controlanalysis.branchorder.numberterminations(j).values,currenttestanalysis.branchorder.numberterminations(j).values);
            %                 [meantaperrateh,meantaperratep]                           = kstest2(controlanalysis.branchorder.meantaperrate(j).values,currenttestanalysis.branchorder.meantaperrate(j).values);
            %                 [meantaperratioh,meantaperratiop]                         = kstest2(controlanalysis.branchorder.meantaperratio(j).values,currenttestanalysis.branchorder.meantaperratio(j).values);
            %                 if j < min(controlanalysis.maxbranchorder.max,currenttestanalysis.maxbranchorder.max)
            %                     [meanrallratioh,meanrallratiop]                       = kstest2(controlanalysis.branchorder.meanrallratio(j).values,currenttestanalysis.branchorder.meanrallratio(j).values);
            %                     [meandaughterratioh,meandaughterratiop]               = kstest2(controlanalysis.branchorder.meandaughterratio(j).values,currenttestanalysis.branchorder.meandaughterratio(j).values);
            %                 else
            %                     meanrallratiop                                        = [];
            %                     meanrallratioh                                        = [];
            %                     meandaughterratiop                                    = [];
            %                     meandaughterratioh                                    = [];
            %                 end
            %
            %                 if meanproximaldiameterh         == 0, meanproximaldiameterh = 'same'; else meanproximaldiameterh = 'diff'; end;
            %                 if meancylindricaldiameterh      == 0, meancylindricaldiameterh = 'same'; else meancylindricaldiameterh = 'diff'; end;
            %                 if meandistaldiameterh           == 0, meandistaldiameterh = 'same'; else meandistaldiameterh = 'diff'; end;
            %                 if meanlengthh                   == 0, meanlengthh = 'same'; else meanlengthh = 'diff'; end;
            %                 if meansurfaceareah              == 0, meansurfaceareah = 'same'; else meansurfaceareah = 'diff'; end;
            %                 if meanvolumeh                   == 0, meanvolumeh = 'same'; else meanvolumeh = 'diff'; end;
            %                 if totallengthh                  == 0, totallengthh = 'same'; else totallengthh = 'diff'; end;
            %                 if totalsurfaceareah             == 0, totalsurfaceareah = 'same'; else totalsurfaceareah = 'diff'; end;
            %                 if totalvolumeh                  == 0, totalvolumeh = 'same'; else totalvolumeh = 'diff'; end;
            %                 if numbersegmentsh               == 0, numbersegmentsh = 'same'; else numbersegmentsh = 'diff'; end;
            %                 if numberbifurcationsh           == 0, numberbifurcationsh = 'same'; else numberbifurcationsh = 'diff'; end;
            %                 if numberterminationsh           == 0, numberterminationsh = 'same'; else numberterminationsh = 'diff'; end;
            %                 if meantaperrateh                == 0, meantaperrateh = 'same'; else meantaperrateh = 'diff'; end;
            %                 if meantaperratioh               == 0, meantaperratioh = 'same'; else meantaperratioh = 'diff'; end;
            %                 if meanrallratioh                == 0, meanrallratioh = 'same'; else meanrallratioh = 'diff'; end;
            %                 if meandaughterratioh            == 0, meandaughterratioh = 'same'; else meandaughterratioh = 'diff'; end;
            %
            %                 rowcolposition{14*(j-1)+1,11*(i-1)+13}  = 'KS-test ';
            %                 rowcolposition{14*(j-1)+2,11*(i-1)+13}  = 'h';
            %                 rowcolposition{14*(j-1)+3,11*(i-1)+13}  = meanproximaldiameterh;
            %                 rowcolposition{14*(j-1)+4,11*(i-1)+13}  = meancylindricaldiameterh;
            %                 rowcolposition{14*(j-1)+5,11*(i-1)+13}  = meandistaldiameterh;
            %                 rowcolposition{14*(j-1)+6,11*(i-1)+13}  = meanlengthh;
            %                 rowcolposition{14*(j-1)+7,11*(i-1)+13}  = meansurfaceareah;
            %                 rowcolposition{14*(j-1)+8,11*(i-1)+13}  = meanvolumeh;
            %                 rowcolposition{14*(j-1)+9,11*(i-1)+13}  = totallengthh;
            %                 rowcolposition{14*(j-1)+10,11*(i-1)+13} = totalsurfaceareah;
            %                 rowcolposition{14*(j-1)+11,11*(i-1)+13} = totalvolumeh;
            %                 rowcolposition{14*(j-1)+12,11*(i-1)+13} = numbersegmentsh;
            %                 rowcolposition{14*(j-1)+13,11*(i-1)+13} = numberbifurcationsh;
            %                 rowcolposition{14*(j-1)+14,11*(i-1)+13} = numberterminationsh;
            %                 rowcolposition{14*(j-1)+15,11*(i-1)+13} = meantaperrateh;
            %                 rowcolposition{14*(j-1)+16,11*(i-1)+13} = meantaperratioh;
            %                 if j < min(controlanalysis.maxbranchorder.max,currenttestanalysis.maxbranchorder.max)
            %                     rowcolposition{14*(j-1)+17,11*(i-1)+13} = meanrallratioh;
            %                     rowcolposition{14*(j-1)+18,11*(i-1)+13} = meandaughterratioh;
            %                 else
            %                     rowcolposition{14*(j-1)+17,11*(i-1)+13} = [];
            %                     rowcolposition{14*(j-1)+18,11*(i-1)+13} = [];
            %                 end
            %
            %                 rowcolposition{14*(j-1)+1,11*(i-1)+14}  = '(mean + var)';
            %                 rowcolposition{14*(j-1)+2,11*(i-1)+14}  = 'p';
            %                 rowcolposition{14*(j-1)+3,11*(i-1)+14}  = meanproximaldiameterp;
            %                 rowcolposition{14*(j-1)+4,11*(i-1)+14}  = meancylindricaldiameterp;
            %                 rowcolposition{14*(j-1)+5,11*(i-1)+14}  = meandistaldiameterp;
            %                 rowcolposition{14*(j-1)+6,11*(i-1)+14}  = meanlengthp;
            %                 rowcolposition{14*(j-1)+7,11*(i-1)+14}  = meansurfaceareap;
            %                 rowcolposition{14*(j-1)+8,11*(i-1)+14}  = meanvolumep;
            %                 rowcolposition{14*(j-1)+9,11*(i-1)+14}  = totallengthp;
            %                 rowcolposition{14*(j-1)+10,11*(i-1)+14} = totalsurfaceareap;
            %                 rowcolposition{14*(j-1)+11,11*(i-1)+14} = totalvolumep;
            %                 rowcolposition{14*(j-1)+12,11*(i-1)+14} = numbersegmentsp;
            %                 rowcolposition{14*(j-1)+13,11*(i-1)+14} = numberbifurcationsp;
            %                 rowcolposition{14*(j-1)+14,11*(i-1)+14} = numberterminationsp;
            %                 rowcolposition{14*(j-1)+15,11*(i-1)+14} = meantaperratep;
            %                 rowcolposition{14*(j-1)+16,11*(i-1)+14} = meantaperratiop;
            %                 if j < min(controlanalysis.maxbranchorder.max,currenttestanalysis.maxbranchorder.max)
            %                     rowcolposition{14*(j-1)+17,11*(i-1)+14} = meanrallratiop;
            %                     rowcolposition{14*(j-1)+18,11*(i-1)+14} = meandaughterratiop;
            %                 else
            %                     rowcolposition{14*(j-1)+17,11*(i-1)+14} = [];
            %                     rowcolposition{14*(j-1)+18,11*(i-1)+14} = [];
            %                 end
            %
            %             end
            %         end
            %
            %         if i == 1
            %             testanalysisfilenames = currenttestanalysis.inputfilename;
            %         else
            %             testanalysisfilenames = [testanalysisfilenames '_' currenttestanalysis.inputfilename];
        end

    end

    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'branchorder_comparison_table');
    xlswrite(filename,rowcolposition);
    cd(currentdirectory);

end

warning('on', 'MATLAB:divideByZero');