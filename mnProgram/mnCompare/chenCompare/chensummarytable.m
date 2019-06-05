function chensummarytable(controlanalysis,testanalysis)

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

    rowcolposition{1,1} = ' ';
    rowcolposition{2,1} = 'Values';
    rowcolposition{3,1} = 'Soma Diameter';
    rowcolposition{4,1} = '# Primary Dendrites';
    rowcolposition{5,1} = 'PD Mean Prox Diam';
    rowcolposition{6,1} = 'PD Mean Cyl Diam';
    rowcolposition{7,1} = 'Tot Dend Length';
    rowcolposition{8,1} = 'Tot Dend SA';
    rowcolposition{9,1} = 'Tot Dend Vol';
    rowcolposition{10,1} = '# Segments';
    rowcolposition{11,1} = '# Bifurcations';
    rowcolposition{12,1} = '# Terminations';
    rowcolposition{13,1} = 'Max Branch Order';

    rowcolposition{1,2}  = controlanalysis.inputfilename;
    rowcolposition{2,2}  = 'Mean';
    rowcolposition{3,2}  = mean([controlanalysis.somadiameter.values]);
    rowcolposition{4,2}  = mean([controlanalysis.numberprimarydendrites.values]);
    rowcolposition{5,2}  = mean([controlanalysis.primarydendrite.meanproximaldiameter.values]);
    rowcolposition{6,2}  = mean([controlanalysis.primarydendrite.meancylindricaldiameter.values]);
    rowcolposition{7,2}  = mean([controlanalysis.totallength.values]);
    rowcolposition{8,2}  = mean([controlanalysis.totalsurfacearea.values]);
    rowcolposition{9,2}  = mean([controlanalysis.totalvolume.values]);
    rowcolposition{10,2} = mean([controlanalysis.numbersegments.values]);
    rowcolposition{11,2} = mean([controlanalysis.numberbifurcations.values]);
    rowcolposition{12,2} = mean([controlanalysis.numberterminations.values]);
    rowcolposition{13,2} = mean([controlanalysis.maxbranchorder.values]);

    rowcolposition{1,3}  = ' ';
    rowcolposition{2,3}  = 'STD';
    rowcolposition{3,3}  = std([controlanalysis.somadiameter.values]);
    rowcolposition{4,3}  = std([controlanalysis.numberprimarydendrites.values]);
    rowcolposition{5,3}  = std([controlanalysis.primarydendrite.meanproximaldiameter.values]);
    rowcolposition{6,3}  = std([controlanalysis.primarydendrite.meancylindricaldiameter.values]);
    rowcolposition{7,3}  = std([controlanalysis.totallength.values]);
    rowcolposition{8,3}  = std([controlanalysis.totalsurfacearea.values]);
    rowcolposition{9,3}  = std([controlanalysis.totalvolume.values]);
    rowcolposition{10,3} = std([controlanalysis.numbersegments.values]);
    rowcolposition{11,3} = std([controlanalysis.numberbifurcations.values]);
    rowcolposition{12,3} = std([controlanalysis.numberterminations.values]);
    rowcolposition{13,3} = std([controlanalysis.maxbranchorder.values]);
    
    rowcolposition{1,4}  = ' ';
    rowcolposition{2,4}  = 'Skew';
    rowcolposition{3,4}  = skewness([controlanalysis.somadiameter.values]);
    rowcolposition{4,4}  = skewness([controlanalysis.numberprimarydendrites.values]);
    rowcolposition{5,4}  = skewness([controlanalysis.primarydendrite.meanproximaldiameter.values]);
    rowcolposition{6,4}  = skewness([controlanalysis.primarydendrite.meancylindricaldiameter.values]);
    rowcolposition{7,4}  = skewness([controlanalysis.totallength.values]);
    rowcolposition{8,4}  = skewness([controlanalysis.totalsurfacearea.values]);
    rowcolposition{9,4}  = skewness([controlanalysis.totalvolume.values]);
    rowcolposition{10,4} = skewness([controlanalysis.numbersegments.values]);
    rowcolposition{11,4} = skewness([controlanalysis.numberbifurcations.values]);
    rowcolposition{12,4} = skewness([controlanalysis.numberterminations.values]);
    rowcolposition{13,4} = skewness([controlanalysis.maxbranchorder.values]);
    
    rowcolposition{1,5}  = ' ';
    rowcolposition{2,5}  = 'Kurt';
    rowcolposition{3,5}  = kurtosis([controlanalysis.somadiameter.values]);
    rowcolposition{4,5}  = kurtosis([controlanalysis.numberprimarydendrites.values]);
    rowcolposition{5,5}  = kurtosis([controlanalysis.primarydendrite.meanproximaldiameter.values]);
    rowcolposition{6,5}  = kurtosis([controlanalysis.primarydendrite.meancylindricaldiameter.values]);
    rowcolposition{7,5}  = kurtosis([controlanalysis.totallength.values]);
    rowcolposition{8,5}  = kurtosis([controlanalysis.totalsurfacearea.values]);
    rowcolposition{9,5}  = kurtosis([controlanalysis.totalvolume.values]);
    rowcolposition{10,5} = kurtosis([controlanalysis.numbersegments.values]);
    rowcolposition{11,5} = kurtosis([controlanalysis.numberbifurcations.values]);
    rowcolposition{12,5} = kurtosis([controlanalysis.numberterminations.values]);
    rowcolposition{13,5} = kurtosis([controlanalysis.maxbranchorder.values]);
    
    rowcolposition{1,6}  = ' ';
    rowcolposition{2,6}  = 'Min';
    rowcolposition{3,6}  = min([controlanalysis.somadiameter.values]);
    rowcolposition{4,6}  = min([controlanalysis.numberprimarydendrites.values]);
    rowcolposition{5,6}  = min([controlanalysis.primarydendrite.meanproximaldiameter.values]);
    rowcolposition{6,6}  = min([controlanalysis.primarydendrite.meancylindricaldiameter.values]);
    rowcolposition{7,6}  = min([controlanalysis.totallength.values]);
    rowcolposition{8,6}  = min([controlanalysis.totalsurfacearea.values]);
    rowcolposition{9,6}  = min([controlanalysis.totalvolume.values]);
    rowcolposition{10,6} = min([controlanalysis.numbersegments.values]);
    rowcolposition{11,6} = min([controlanalysis.numberbifurcations.values]);
    rowcolposition{12,6} = min([controlanalysis.numberterminations.values]);
    rowcolposition{13,6} = min([controlanalysis.maxbranchorder.values]);
    
    rowcolposition{1,7}  = ' ';
    rowcolposition{2,7}  = 'Max';
    rowcolposition{3,7}  = max([controlanalysis.somadiameter.values]);
    rowcolposition{4,7}  = max([controlanalysis.numberprimarydendrites.values]);
    rowcolposition{5,7}  = max([controlanalysis.primarydendrite.meanproximaldiameter.values]);
    rowcolposition{6,7}  = max([controlanalysis.primarydendrite.meancylindricaldiameter.values]);
    rowcolposition{7,7}  = max([controlanalysis.totallength.values]);
    rowcolposition{8,7}  = max([controlanalysis.totalsurfacearea.values]);
    rowcolposition{9,7}  = max([controlanalysis.totalvolume.values]);
    rowcolposition{10,7} = max([controlanalysis.numbersegments.values]);
    rowcolposition{11,7} = max([controlanalysis.numberbifurcations.values]);
    rowcolposition{12,7} = max([controlanalysis.numberterminations.values]);
    rowcolposition{13,7} = max([controlanalysis.maxbranchorder.values]);
    

    filename = sprintf('%s_%s',controlanalysis.inputfilename,'summary_table');
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

    rowcolposition{1,1} = ' ';
    rowcolposition{2,1} = 'Values';
    rowcolposition{3,1} = 'Soma Diameter (\mum)';
    rowcolposition{4,1} = '# Primary Dendrites';
    rowcolposition{5,1} = 'Total PD Cyl Diam (\mum)';
    rowcolposition{6,1} = 'Mean PD Cyl Diam';
    rowcolposition{7,1} = 'Tot Dend Length (10^3 \mum)';
    rowcolposition{8,1} = 'Tot Dend SA (10^3 \mum^2)';
    rowcolposition{9,1} = 'Tot Dend Vol (10^3 \mum^3)';
    rowcolposition{10,1} = '# Segments';
    rowcolposition{11,1} = '# Bifurcations';
    rowcolposition{12,1} = '# Terminations';
    rowcolposition{13,1} = 'Max Branch Order';

    rowcolposition{1,2}  = controlanalysis.inputfilename;
    rowcolposition{2,2}  = 'Mean';
    rowcolposition{3,2}  = mean([controlanalysis.somadiameter.values]);
    rowcolposition{4,2}  = mean([controlanalysis.numberprimarydendrites.values]);
    rowcolposition{5,2}  = mean([controlanalysis.numberprimarydendrites.values].*[controlanalysis.primarydendrite.meancylindricaldiameter.values]);
    rowcolposition{6,2}  = mean([controlanalysis.primarydendrite.meancylindricaldiameter.values]);
    rowcolposition{7,2}  = mean([controlanalysis.totallength.values]);
    rowcolposition{8,2}  = mean([controlanalysis.totalsurfacearea.values]);
    rowcolposition{9,2}  = mean([controlanalysis.totalvolume.values]);
    rowcolposition{10,2} = mean([controlanalysis.numbersegments.values]);
    rowcolposition{11,2} = mean([controlanalysis.numberbifurcations.values]);
    rowcolposition{12,2} = mean([controlanalysis.numberterminations.values]);
    rowcolposition{13,2} = mean([controlanalysis.maxbranchorder.values]);

    rowcolposition{1,3}  = ' ';
    rowcolposition{2,3}  = 'STD';
    rowcolposition{3,3}  = std([controlanalysis.somadiameter.values]);
    rowcolposition{4,3}  = std([controlanalysis.numberprimarydendrites.values]);
    rowcolposition{5,3} =  std([controlanalysis.numberprimarydendrites.values].*[controlanalysis.primarydendrite.meancylindricaldiameter.values]);
    rowcolposition{6,3}  = std([controlanalysis.primarydendrite.meancylindricaldiameter.values]);
    rowcolposition{7,3}  = std([controlanalysis.totallength.values]);
    rowcolposition{8,3}  = std([controlanalysis.totalsurfacearea.values]);
    rowcolposition{9,3}  = std([controlanalysis.totalvolume.values]);
    rowcolposition{10,3} = std([controlanalysis.numbersegments.values]);
    rowcolposition{11,3} = std([controlanalysis.numberbifurcations.values]);
    rowcolposition{12,3} = std([controlanalysis.numberterminations.values]);
    rowcolposition{13,3} = std([controlanalysis.maxbranchorder.values]);


%     for i=1:length(fieldnames(testanalysis))
% 
%         names = fieldnames(testanalysis);
%         eval(['currenttestanalysis = testanalysis.' char(names(i)) ';']);
          currenttestanalysis = testanalysis;
          i=1;
%
%
        rowcolposition{1,11*(i-1)+4}  = currenttestanalysis.inputfilename;
        rowcolposition{2,11*(i-1)+4}  = 'Mean';
        rowcolposition{3,11*(i-1)+4}  = mean([currenttestanalysis.somadiameter.values]);
        rowcolposition{4,11*(i-1)+4}  = mean([currenttestanalysis.numberprimarydendrites.values]);
        rowcolposition{5,11*(i-1)+4}  = mean([currenttestanalysis.numberprimarydendrites.values].*[currenttestanalysis.primarydendrite.meancylindricaldiameter.values]);
        rowcolposition{6,11*(i-1)+4}  = mean([currenttestanalysis.primarydendrite.meancylindricaldiameter.values]);
        rowcolposition{7,11*(i-1)+4}  = mean([currenttestanalysis.totallength.values]/1000);
        rowcolposition{8,11*(i-1)+4}  = mean([currenttestanalysis.totalsurfacearea.values]/1000);
        rowcolposition{9,11*(i-1)+4}  = mean([currenttestanalysis.totalvolume.values]/1000);
        rowcolposition{10,11*(i-1)+4} = mean([currenttestanalysis.numbersegments.values]);
        rowcolposition{11,11*(i-1)+4} = mean([currenttestanalysis.numberbifurcations.values]);
        rowcolposition{12,11*(i-1)+4} = mean([currenttestanalysis.numberterminations.values]);
        rowcolposition{13,11*(i-1)+4} = mean([currenttestanalysis.maxbranchorder.values]);

        rowcolposition{1,11*(i-1)+5}  = ' ';
        rowcolposition{2,11*(i-1)+5}  = 'STD';
        rowcolposition{3,11*(i-1)+5}  = std([currenttestanalysis.somadiameter.values]);
        rowcolposition{4,11*(i-1)+5}  = std([currenttestanalysis.numberprimarydendrites.values]);
        rowcolposition{5,11*(i-1)+5}  = std([currenttestanalysis.numberprimarydendrites.values].*[currenttestanalysis.primarydendrite.meancylindricaldiameter.values]);
        rowcolposition{6,11*(i-1)+5}  = std([currenttestanalysis.primarydendrite.meancylindricaldiameter.values]);
        rowcolposition{7,11*(i-1)+5}  = std([currenttestanalysis.totallength.values]/1000);
        rowcolposition{8,11*(i-1)+5}  = std([currenttestanalysis.totalsurfacearea.values]/1000);
        rowcolposition{9,11*(i-1)+5}  = std([currenttestanalysis.totalvolume.values]/1000);
        rowcolposition{10,11*(i-1)+5} = std([currenttestanalysis.numbersegments.values]);
        rowcolposition{11,11*(i-1)+5} = std([currenttestanalysis.numberbifurcations.values]);
        rowcolposition{12,11*(i-1)+5} = std([currenttestanalysis.numberterminations.values]);
        rowcolposition{13,11*(i-1)+5} = std([currenttestanalysis.maxbranchorder.values]);


        somadiametermeandiff            = 100*((mean(currenttestanalysis.somadiameter.values)-mean(controlanalysis.somadiameter.values))/mean(controlanalysis.somadiameter.values));
        numberprimarydendritesmeandiff  = 100*((mean(currenttestanalysis.numberprimarydendrites.values)-mean(controlanalysis.numberprimarydendrites.values))/mean(controlanalysis.numberprimarydendrites.values));
        meanproximaldiametermeandiff    = 100*((mean([controlanalysis.numberprimarydendrites.values].*[controlanalysis.primarydendrite.meancylindricaldiameter.values]) - mean([currenttestanalysis.numberprimarydendrites.values].*[currenttestanalysis.primarydendrite.meancylindricaldiameter.values]))/mean([controlanalysis.numberprimarydendrites.values].*[controlanalysis.primarydendrite.meancylindricaldiameter.values]));
        meancylindricaldiametermeandiff = 100*((mean(currenttestanalysis.primarydendrite.meancylindricaldiameter.values)-mean(currenttestanalysis.primarydendrite.meancylindricaldiameter.values))/mean(controlanalysis.primarydendrite.meancylindricaldiameter.values));
        totallengthmeandiff             = 100*((mean(currenttestanalysis.totallength.values/1000)-mean(controlanalysis.totallength.values))/mean(controlanalysis.totallength.values));
        totalsurfaceareameandiff        = 100*((mean(currenttestanalysis.totalsurfacearea.values/1000)-mean(controlanalysis.totalsurfacearea.values))/mean(controlanalysis.totalsurfacearea.values));
        totalvolumemeandiff             = 100*((mean(currenttestanalysis.totalvolume.values/1000)-mean(controlanalysis.totalvolume.values))/mean(controlanalysis.totalvolume.values));
        numbersegmentsmeandiff          = 100*((mean(currenttestanalysis.numbersegments.values)-mean(controlanalysis.numbersegments.values))/mean(controlanalysis.numbersegments.values));
        numberbifurcationsmeandiff      = 100*((mean(currenttestanalysis.numberbifurcations.values)-mean(controlanalysis.numberbifurcations.values))/mean(controlanalysis.numberbifurcations.values));
        numberterminationsmeandiff      = 100*((mean(currenttestanalysis.numberterminations.values)-mean(controlanalysis.numberterminations.values))/mean(controlanalysis.numberterminations.values));
        maxbranchordermeandiff          = 100*((mean(currenttestanalysis.maxbranchorder.values)-mean(controlanalysis.maxbranchorder.values))/mean(controlanalysis.maxbranchorder.values));

        rowcolposition{1,11*(i-1)+6}  = '% Mean Diff';
        rowcolposition{2,11*(i-1)+6}  = ' ';
        rowcolposition{3,11*(i-1)+6}  = somadiametermeandiff;
        rowcolposition{4,11*(i-1)+6}  = numberprimarydendritesmeandiff;
        rowcolposition{5,11*(i-1)+6}  = meanproximaldiametermeandiff;
        rowcolposition{6,11*(i-1)+6}  = meancylindricaldiametermeandiff;
        rowcolposition{7,11*(i-1)+6}  = totallengthmeandiff;
        rowcolposition{8,11*(i-1)+6}  = totalsurfaceareameandiff;
        rowcolposition{9,11*(i-1)+6}  = totalvolumemeandiff;
        rowcolposition{10,11*(i-1)+6} = numbersegmentsmeandiff;
        rowcolposition{11,11*(i-1)+6} = numberbifurcationsmeandiff;
        rowcolposition{12,11*(i-1)+6} = numberterminationsmeandiff;
        rowcolposition{13,11*(i-1)+6} = maxbranchordermeandiff;


        [somadiameterh,somadiameterp]                       = ttest2(controlanalysis.somadiameter.values,currenttestanalysis.somadiameter.values);
        [numberprimarydendritesh,numberprimarydendritesp]   = ttest2(controlanalysis.numberprimarydendrites.values,currenttestanalysis.numberprimarydendrites.values);
        [meanproximaldiameterh,meanproximaldiameterp]       = ttest2((([controlanalysis.numberprimarydendrites.values].*[controlanalysis.primarydendrite.meancylindricaldiameter.values])),(([currenttestanalysis.numberprimarydendrites.values].*[currenttestanalysis.primarydendrite.meancylindricaldiameter.values])));
        [meancylindricaldiameterh,meancylindricaldiameterp] = ttest2(controlanalysis.primarydendrite.meancylindricaldiameter.values,currenttestanalysis.primarydendrite.meancylindricaldiameter.values);
        [totallengthh,totallengthp]                         = ttest2(controlanalysis.totallength.values,currenttestanalysis.totallength.values/1000);
        [totalsurfaceareah,totalsurfaceareap]               = ttest2(controlanalysis.totalsurfacearea.values,currenttestanalysis.totalsurfacearea.values/1000);
        [totalvolumeh,totalvolumep]                         = ttest2(controlanalysis.totalvolume.values,currenttestanalysis.totalvolume.values/1000);
        [numbersegmentsh,numbersegmentsp]                   = ttest2(controlanalysis.numbersegments.values,currenttestanalysis.numbersegments.values);
        [numberbifurcationsh,numberbifurcationsp]           = ttest2(controlanalysis.numberbifurcations.values,currenttestanalysis.numberbifurcations.values);
        [numberterminationsh,numberterminationsp]           = ttest2(controlanalysis.numberterminations.values,currenttestanalysis.numberterminations.values);
        [maxbranchorderh,maxbranchorderp]                   = ttest2(controlanalysis.maxbranchorder.values,currenttestanalysis.maxbranchorder.values);

        if somadiameterh             == 0, somadiameterh = 'same'; else somadiameterh = 'diff'; end;
        if numberprimarydendritesh   == 0, numberprimarydendritesh = 'same'; else numberprimarydendritesh = 'diff'; end;
        if meanproximaldiameterh     == 0, meanproximaldiameterh = 'same'; else meanproximaldiameterh = 'diff'; end;
        if meancylindricaldiameterh  == 0, meancylindricaldiameterh = 'same'; else meancylindricaldiameterh = 'diff'; end;
        if totallengthh              == 0, totallengthh = 'same'; else totallengthh = 'diff'; end;
        if totalsurfaceareah         == 0, totalsurfaceareah = 'same'; else totalsurfaceareah = 'diff'; end;
        if totalvolumeh              == 0, totalvolumeh = 'same'; else totalvolumeh = 'diff'; end;
        if numbersegmentsh           == 0, numbersegmentsh = 'same'; else numbersegmentsh = 'diff'; end;
        if numberbifurcationsh       == 0, numberbifurcationsh = 'same'; else numberbifurcationsh = 'diff'; end;
        if numberterminationsh       == 0, numberterminationsh = 'same'; else numberterminationsh = 'diff'; end;
        if maxbranchorderh           == 0, maxbranchorderh = 'same'; else maxbranchorderh = 'diff'; end;


        rowcolposition{1,11*(i-1)+7}  = 't-test ';
        rowcolposition{2,11*(i-1)+7}  = 'h';
        rowcolposition{3,11*(i-1)+7}  = somadiameterh;
        rowcolposition{4,11*(i-1)+7}  = numberprimarydendritesh;
        rowcolposition{5,11*(i-1)+7}  = meanproximaldiameterh;
        rowcolposition{6,11*(i-1)+7}  = meancylindricaldiameterh;
        rowcolposition{7,11*(i-1)+7}  = totallengthh;
        rowcolposition{8,11*(i-1)+7}  = totalsurfaceareah;
        rowcolposition{9,11*(i-1)+7}  = totalvolumeh;
        rowcolposition{10,11*(i-1)+7} = numbersegmentsh;
        rowcolposition{11,11*(i-1)+7} = numberbifurcationsh;
        rowcolposition{12,11*(i-1)+7} = numberterminationsh;
        rowcolposition{13,11*(i-1)+7} = maxbranchorderh;

        rowcolposition{1,11*(i-1)+8}  = '(mean)';
        rowcolposition{2,11*(i-1)+8}  = 'p';
        rowcolposition{3,11*(i-1)+8}  = somadiameterp;
        rowcolposition{4,11*(i-1)+8}  = numberprimarydendritesp;
        rowcolposition{5,11*(i-1)+8}  = meanproximaldiameterp;
        rowcolposition{6,11*(i-1)+8}  = meancylindricaldiameterp;
        rowcolposition{7,11*(i-1)+8}  = totallengthp;
        rowcolposition{8,11*(i-1)+8}  = totalsurfaceareap;
        rowcolposition{9,11*(i-1)+8}  = totalvolumep;
        rowcolposition{10,11*(i-1)+8} = numbersegmentsp;
        rowcolposition{11,11*(i-1)+8} = numberbifurcationsp;
        rowcolposition{12,11*(i-1)+8} = numberterminationsp;
        rowcolposition{13,11*(i-1)+8} = maxbranchorderp;


        [somadiameterp,somadiameterh]                       = ranksum(controlanalysis.somadiameter.values,currenttestanalysis.somadiameter.values);
        [numberprimarydendritesp,numberprimarydendritesh]   = ranksum(controlanalysis.numberprimarydendrites.values,currenttestanalysis.numberprimarydendrites.values);
        [meanproximaldiameterp,meanproximaldiameterh]       = ranksum((mean([controlanalysis.numberprimarydendrites.values].*[controlanalysis.primarydendrite.meancylindricaldiameter.values])),(mean([currenttestanalysis.numberprimarydendrites.values].*[currenttestanalysis.primarydendrite.meancylindricaldiameter.values])));
        [meancylindricaldiameterp,meancylindricaldiameterh] = ranksum(controlanalysis.primarydendrite.meancylindricaldiameter.values,currenttestanalysis.primarydendrite.meancylindricaldiameter.values);
        [totallengthp,totallengthh]                         = ranksum(controlanalysis.totallength.values,currenttestanalysis.totallength.values/1000);
        [totalsurfaceareap,totalsurfaceareah]               = ranksum(controlanalysis.totalsurfacearea.values,currenttestanalysis.totalsurfacearea.values/1000);
        [totalvolumep,totalvolumeh]                         = ranksum(controlanalysis.totalvolume.values,currenttestanalysis.totalvolume.values/1000);
        [numbersegmentsp,numbersegmentsh]                   = ranksum(controlanalysis.numbersegments.values,currenttestanalysis.numbersegments.values);
        [numberbifurcationsp,numberbifurcationsh]           = ranksum(controlanalysis.numberbifurcations.values,currenttestanalysis.numberbifurcations.values);
        [numberterminationsp,numberterminationsh]           = ranksum(controlanalysis.numberterminations.values,currenttestanalysis.numberterminations.values);
        [maxbranchorderp,maxbranchorderh]                   = ranksum(controlanalysis.maxbranchorder.values,currenttestanalysis.maxbranchorder.values);

        if somadiameterh             == 0, somadiameterh = 'same'; else somadiameterh = 'diff'; end;
        if numberprimarydendritesh   == 0, numberprimarydendritesh = 'same'; else numberprimarydendritesh = 'diff'; end;
        if meanproximaldiameterh     == 0, meanproximaldiameterh = 'same'; else meanproximaldiameterh = 'diff'; end;
        if meancylindricaldiameterh  == 0, meancylindricaldiameterh = 'same'; else meancylindricaldiameterh = 'diff'; end;
        if totallengthh              == 0, totallengthh = 'same'; else totallengthh = 'diff'; end;
        if totalsurfaceareah         == 0, totalsurfaceareah = 'same'; else totalsurfaceareah = 'diff'; end;
        if totalvolumeh              == 0, totalvolumeh = 'same'; else totalvolumeh = 'diff'; end;
        if numbersegmentsh           == 0, numbersegmentsh = 'same'; else numbersegmentsh = 'diff'; end;
        if numberbifurcationsh       == 0, numberbifurcationsh = 'same'; else numberbifurcationsh = 'diff'; end;
        if numberterminationsh       == 0, numberterminationsh = 'same'; else numberterminationsh = 'diff'; end;
        if maxbranchorderh           == 0, maxbranchorderh = 'same'; else maxbranchorderh = 'diff'; end;

        rowcolposition{1,11*(i-1)+9}  = 'RS-test ';
        rowcolposition{2,11*(i-1)+9}  = 'h';
        rowcolposition{3,11*(i-1)+9}  = somadiameterh;
        rowcolposition{4,11*(i-1)+9}  = numberprimarydendritesh;
        rowcolposition{5,11*(i-1)+9}  = meanproximaldiameterh;
        rowcolposition{6,11*(i-1)+9}  = meancylindricaldiameterh;
        rowcolposition{7,11*(i-1)+9}  = totallengthh;
        rowcolposition{8,11*(i-1)+9}  = totalsurfaceareah;
        rowcolposition{9,11*(i-1)+9}  = totalvolumeh;
        rowcolposition{10,11*(i-1)+9} = numbersegmentsh;
        rowcolposition{11,11*(i-1)+9} = numberbifurcationsh;
        rowcolposition{12,11*(i-1)+9} = numberterminationsh;
        rowcolposition{13,11*(i-1)+9} = maxbranchorderh;

        rowcolposition{1,11*(i-1)+10}  = '(median)';
        rowcolposition{2,11*(i-1)+10}  = 'p';
        rowcolposition{3,11*(i-1)+10}  = somadiameterp;
        rowcolposition{4,11*(i-1)+10}  = numberprimarydendritesp;
        rowcolposition{5,11*(i-1)+10}  = meanproximaldiameterp;
        rowcolposition{6,11*(i-1)+10}  = meancylindricaldiameterp;
        rowcolposition{7,11*(i-1)+10}  = totallengthp;
        rowcolposition{8,11*(i-1)+10}  = totalsurfaceareap;
        rowcolposition{9,11*(i-1)+10}  = totalvolumep;
        rowcolposition{10,11*(i-1)+10} = numbersegmentsp;
        rowcolposition{11,11*(i-1)+10} = numberbifurcationsp;
        rowcolposition{12,11*(i-1)+10} = numberterminationsp;
        rowcolposition{13,11*(i-1)+10} = maxbranchorderp;


        [somadiameterh,somadiameterp]                       = ansaribradley(controlanalysis.somadiameter.values,currenttestanalysis.somadiameter.values);
        [numberprimarydendritesh,numberprimarydendritesp]   = ansaribradley(controlanalysis.numberprimarydendrites.values,currenttestanalysis.numberprimarydendrites.values);
        [meanproximaldiameterh,meanproximaldiameterp]       = ansaribradley((mean([controlanalysis.numberprimarydendrites.values].*[controlanalysis.primarydendrite.meancylindricaldiameter.values])),(mean([currenttestanalysis.numberprimarydendrites.values].*[currenttestanalysis.primarydendrite.meancylindricaldiameter.values])));
        [meancylindricaldiameterh,meancylindricaldiameterp] = ansaribradley(controlanalysis.primarydendrite.meancylindricaldiameter.values,currenttestanalysis.primarydendrite.meancylindricaldiameter.values);
        [totallengthh,totallengthp]                         = ansaribradley(controlanalysis.totallength.values,currenttestanalysis.totallength.values/1000);
        [totalsurfaceareah,totalsurfaceareap]               = ansaribradley(controlanalysis.totalsurfacearea.values,currenttestanalysis.totalsurfacearea.values/1000);
        [totalvolumeh,totalvolumep]                         = ansaribradley(controlanalysis.totalvolume.values,currenttestanalysis.totalvolume.values/1000);
        [numbersegmentsh,numbersegmentsp]                   = ansaribradley(controlanalysis.numbersegments.values,currenttestanalysis.numbersegments.values);
        [numberbifurcationsh,numberbifurcationsp]           = ansaribradley(controlanalysis.numberbifurcations.values,currenttestanalysis.numberbifurcations.values);
        [numberterminationsh,numberterminationsp]           = ansaribradley(controlanalysis.numberterminations.values,currenttestanalysis.numberterminations.values);
        [maxbranchorderh,maxbranchorderp]                   = ansaribradley(controlanalysis.maxbranchorder.values,currenttestanalysis.maxbranchorder.values);

        if somadiameterh             == 0, somadiameterh = 'same'; else somadiameterh = 'diff'; end;
        if numberprimarydendritesh   == 0, numberprimarydendritesh = 'same'; else numberprimarydendritesh = 'diff'; end;
        if meanproximaldiameterh     == 0, meanproximaldiameterh = 'same'; else meanproximaldiameterh = 'diff'; end;
        if meancylindricaldiameterh  == 0, meancylindricaldiameterh = 'same'; else meancylindricaldiameterh = 'diff'; end;
        if totallengthh              == 0, totallengthh = 'same'; else totallengthh = 'diff'; end;
        if totalsurfaceareah         == 0, totalsurfaceareah = 'same'; else totalsurfaceareah = 'diff'; end;
        if totalvolumeh              == 0, totalvolumeh = 'same'; else totalvolumeh = 'diff'; end;
        if numbersegmentsh           == 0, numbersegmentsh = 'same'; else numbersegmentsh = 'diff'; end;
        if numberbifurcationsh       == 0, numberbifurcationsh = 'same'; else numberbifurcationsh = 'diff'; end;
        if numberterminationsh       == 0, numberterminationsh = 'same'; else numberterminationsh = 'diff'; end;
        if maxbranchorderh           == 0, maxbranchorderh = 'same'; else maxbranchorderh = 'diff'; end;

        rowcolposition{1,11*(i-1)+11}  = 'AB-test ';
        rowcolposition{2,11*(i-1)+11}  = 'h';
        rowcolposition{3,11*(i-1)+11}  = somadiameterh;
        rowcolposition{4,11*(i-1)+11}  = numberprimarydendritesh;
        rowcolposition{5,11*(i-1)+11}  = meanproximaldiameterh;
        rowcolposition{6,11*(i-1)+11}  = meancylindricaldiameterh;
        rowcolposition{7,11*(i-1)+11}  = totallengthh;
        rowcolposition{8,11*(i-1)+11}  = totalsurfaceareah;
        rowcolposition{9,11*(i-1)+11}  = totalvolumeh;
        rowcolposition{10,11*(i-1)+11} = numbersegmentsh;
        rowcolposition{11,11*(i-1)+11} = numberbifurcationsh;
        rowcolposition{12,11*(i-1)+11} = numberterminationsh;
        rowcolposition{13,11*(i-1)+11} = maxbranchorderh;

        rowcolposition{1,11*(i-1)+12}  = '(variability)';
        rowcolposition{2,11*(i-1)+12}  = 'p';
        rowcolposition{3,11*(i-1)+12}  = somadiameterp;
        rowcolposition{4,11*(i-1)+12}  = numberprimarydendritesp;
        rowcolposition{5,11*(i-1)+12}  = meanproximaldiameterp;
        rowcolposition{6,11*(i-1)+12}  = meancylindricaldiameterp;
        rowcolposition{7,11*(i-1)+12}  = totallengthp;
        rowcolposition{8,11*(i-1)+12}  = totalsurfaceareap;
        rowcolposition{9,11*(i-1)+12}  = totalvolumep;
        rowcolposition{10,11*(i-1)+12} = numbersegmentsp;
        rowcolposition{11,11*(i-1)+12} = numberbifurcationsp;
        rowcolposition{12,11*(i-1)+12} = numberterminationsp;
        rowcolposition{13,11*(i-1)+12} = maxbranchorderp;


        [somadiameterh,somadiameterp]                       = kstest2(controlanalysis.somadiameter.values,currenttestanalysis.somadiameter.values);
        [numberprimarydendritesh,numberprimarydendritesp]   = kstest2(controlanalysis.numberprimarydendrites.values,currenttestanalysis.numberprimarydendrites.values);
        [meanproximaldiameterh,meanproximaldiameterp]       = kstest2((mean([controlanalysis.numberprimarydendrites.values].*[controlanalysis.primarydendrite.meancylindricaldiameter.values])),(mean([currenttestanalysis.numberprimarydendrites.values].*[currenttestanalysis.primarydendrite.meancylindricaldiameter.values])));
        [meancylindricaldiameterh,meancylindricaldiameterp] = kstest2(controlanalysis.primarydendrite.meancylindricaldiameter.values,currenttestanalysis.primarydendrite.meancylindricaldiameter.values);
        [totallengthh,totallengthp]                         = kstest2(controlanalysis.totallength.values,currenttestanalysis.totallength.values/1000);
        [totalsurfaceareah,totalsurfaceareap]               = kstest2(controlanalysis.totalsurfacearea.values,currenttestanalysis.totalsurfacearea.values/1000);
        [totalvolumeh,totalvolumep]                         = kstest2(controlanalysis.totalvolume.values,currenttestanalysis.totalvolume.values/1000);
        [numbersegmentsh,numbersegmentsp]                   = kstest2(controlanalysis.numbersegments.values,currenttestanalysis.numbersegments.values);
        [numberbifurcationsh,numberbifurcationsp]           = kstest2(controlanalysis.numberbifurcations.values,currenttestanalysis.numberbifurcations.values);
        [numberterminationsh,numberterminationsp]           = kstest2(controlanalysis.numberterminations.values,currenttestanalysis.numberterminations.values);
        [maxbranchorderh,maxbranchorderp]                   = kstest2(controlanalysis.maxbranchorder.values,currenttestanalysis.maxbranchorder.values);

        if somadiameterh             == 0, somadiameterh = 'same'; else somadiameterh = 'diff'; end;
        if numberprimarydendritesh   == 0, numberprimarydendritesh = 'same'; else numberprimarydendritesh = 'diff'; end;
        if meanproximaldiameterh     == 0, meanproximaldiameterh = 'same'; else meanproximaldiameterh = 'diff'; end;
        if meancylindricaldiameterh  == 0, meancylindricaldiameterh = 'same'; else meancylindricaldiameterh = 'diff'; end;
        if totallengthh              == 0, totallengthh = 'same'; else totallengthh = 'diff'; end;
        if totalsurfaceareah         == 0, totalsurfaceareah = 'same'; else totalsurfaceareah = 'diff'; end;
        if totalvolumeh              == 0, totalvolumeh = 'same'; else totalvolumeh = 'diff'; end;
        if numbersegmentsh           == 0, numbersegmentsh = 'same'; else numbersegmentsh = 'diff'; end;
        if numberbifurcationsh       == 0, numberbifurcationsh = 'same'; else numberbifurcationsh = 'diff'; end;
        if numberterminationsh       == 0, numberterminationsh = 'same'; else numberterminationsh = 'diff'; end;
        if maxbranchorderh           == 0, maxbranchorderh = 'same'; else maxbranchorderh = 'diff'; end;

        rowcolposition{1,11*(i-1)+13}  = 'KS-test ';
        rowcolposition{2,11*(i-1)+13}  = 'h';
        rowcolposition{3,11*(i-1)+13}  = somadiameterh;
        rowcolposition{4,11*(i-1)+13}  = numberprimarydendritesh;
        rowcolposition{5,11*(i-1)+13}  = meanproximaldiameterh;
        rowcolposition{6,11*(i-1)+13}  = meancylindricaldiameterh;
        rowcolposition{7,11*(i-1)+13}  = totallengthh;
        rowcolposition{8,11*(i-1)+13}  = totalsurfaceareah;
        rowcolposition{9,11*(i-1)+13}  = totalvolumeh;
        rowcolposition{10,11*(i-1)+13} = numbersegmentsh;
        rowcolposition{11,11*(i-1)+13} = numberbifurcationsh;
        rowcolposition{12,11*(i-1)+13} = numberterminationsh;
        rowcolposition{13,11*(i-1)+13} = maxbranchorderh;

        rowcolposition{1,11*(i-1)+14}  = '(mean + var)';
        rowcolposition{2,11*(i-1)+14}  = 'p';
        rowcolposition{3,11*(i-1)+14}  = somadiameterp;
        rowcolposition{4,11*(i-1)+14}  = numberprimarydendritesp;
        rowcolposition{5,11*(i-1)+14}  = meanproximaldiameterp;
        rowcolposition{6,11*(i-1)+14}  = meancylindricaldiameterp;
        rowcolposition{7,11*(i-1)+14}  = totallengthp;
        rowcolposition{8,11*(i-1)+14}  = totalsurfaceareap;
        rowcolposition{9,11*(i-1)+14}  = totalvolumep;
        rowcolposition{10,11*(i-1)+14} = numbersegmentsp;
        rowcolposition{11,11*(i-1)+14} = numberbifurcationsp;
        rowcolposition{12,11*(i-1)+14} = numberterminationsp;
        rowcolposition{13,11*(i-1)+14} = maxbranchorderp;

%         if i == 1
%             testanalysisfilenames = currenttestanalysis.inputfilename;
%         else
%             testanalysisfilenames = [testanalysisfilenames '_' currenttestanalysis.inputfilename];
%         end
%
%     end

    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'summary_comparison_table');
    xlswrite(filename,rowcolposition);
    cd(currentdirectory);

end

warning('on', 'MATLAB:divideByZero');