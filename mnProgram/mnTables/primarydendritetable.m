function primarydendritetable(controlanalysis,testanalysis)

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
    rowcolposition{3,1} = 'Proximal Diameter';
    rowcolposition{4,1} = 'Cyl Diameter';
    rowcolposition{5,1} = 'Distal Diameter';
    rowcolposition{6,1} = 'Length';
    rowcolposition{7,1} = 'Surface Area';
    rowcolposition{8,1} = 'Volume';
    rowcolposition{9,1} = 'Min Branch Order';
    rowcolposition{10,1} = 'Max Branch Order';
    rowcolposition{11,1} = 'Total Length';
    rowcolposition{12,1} = 'Total Surface Area';
    rowcolposition{13,1} = 'Total Volume';
    rowcolposition{14,1} = 'Num Segments';
    rowcolposition{15,1} = 'Num Bifurcations';
    rowcolposition{16,1} = 'Num Terminations';

    rowcolposition{1,2}  = controlanalysis.inputfilename;
    rowcolposition{2,2}  = 'Mean';
    rowcolposition{3,2}  = mean([controlanalysis.primarydendrite.proximaldiameter.values]);
    rowcolposition{4,2}  = mean([controlanalysis.primarydendrite.cylindricaldiameter.values]);
    rowcolposition{5,2}  = mean([controlanalysis.primarydendrite.distaldiameter.values]);
    rowcolposition{6,2}  = mean([controlanalysis.primarydendrite.length.values]);
    rowcolposition{7,2}  = mean([controlanalysis.primarydendrite.surfacearea.values]);
    rowcolposition{8,2}  = mean([controlanalysis.primarydendrite.volume.values]);
    rowcolposition{9,2}  = mean([controlanalysis.primarydendrite.minbranchorder.values]);
    rowcolposition{10,2} = mean([controlanalysis.primarydendrite.maxbranchorder.values]);
    rowcolposition{11,2} = mean([controlanalysis.primarydendrite.totallength.values]);
    rowcolposition{12,2} = mean([controlanalysis.primarydendrite.totalsurfacearea.values]);
    rowcolposition{13,2} = mean([controlanalysis.primarydendrite.totalvolume.values]);
    rowcolposition{14,2} = mean([controlanalysis.primarydendrite.numbersegments.values]);
    rowcolposition{15,2} = mean([controlanalysis.primarydendrite.numberbifurcations.values]);
    rowcolposition{16,2} = mean([controlanalysis.primarydendrite.numberterminations.values]);

    rowcolposition{1,3}  = ' ';
    rowcolposition{2,3}  = 'STD';
    rowcolposition{3,3}  = std([controlanalysis.primarydendrite.proximaldiameter.values]);
    rowcolposition{4,3}  = std([controlanalysis.primarydendrite.cylindricaldiameter.values]);
    rowcolposition{5,3}  = std([controlanalysis.primarydendrite.distaldiameter.values]);
    rowcolposition{6,3}  = std([controlanalysis.primarydendrite.length.values]);
    rowcolposition{7,3}  = std([controlanalysis.primarydendrite.surfacearea.values]);
    rowcolposition{8,3}  = std([controlanalysis.primarydendrite.volume.values]);
    rowcolposition{9,3}  = std([controlanalysis.primarydendrite.minbranchorder.values]);
    rowcolposition{10,3} = std([controlanalysis.primarydendrite.maxbranchorder.values]);
    rowcolposition{11,3} = std([controlanalysis.primarydendrite.totallength.values]);
    rowcolposition{12,3} = std([controlanalysis.primarydendrite.totalsurfacearea.values]);
    rowcolposition{13,3} = std([controlanalysis.primarydendrite.totalvolume.values]);
    rowcolposition{14,3} = std([controlanalysis.primarydendrite.numbersegments.values]);
    rowcolposition{15,3} = std([controlanalysis.primarydendrite.numberbifurcations.values]);
    rowcolposition{16,3} = std([controlanalysis.primarydendrite.numberterminations.values]);
    
    rowcolposition{1,4}  = ' ';
    rowcolposition{2,4}  = 'Skew';
    rowcolposition{3,4}  = skewness([controlanalysis.primarydendrite.proximaldiameter.values]);
    rowcolposition{4,4}  = skewness([controlanalysis.primarydendrite.cylindricaldiameter.values]);
    rowcolposition{5,4}  = skewness([controlanalysis.primarydendrite.distaldiameter.values]);
    rowcolposition{6,4}  = skewness([controlanalysis.primarydendrite.length.values]);
    rowcolposition{7,4}  = skewness([controlanalysis.primarydendrite.surfacearea.values]);
    rowcolposition{8,4}  = skewness([controlanalysis.primarydendrite.volume.values]);
    rowcolposition{9,4}  = skewness([controlanalysis.primarydendrite.minbranchorder.values]);
    rowcolposition{10,4} = skewness([controlanalysis.primarydendrite.maxbranchorder.values]);
    rowcolposition{11,4} = skewness([controlanalysis.primarydendrite.totallength.values]);
    rowcolposition{12,4} = skewness([controlanalysis.primarydendrite.totalsurfacearea.values]);
    rowcolposition{13,4} = skewness([controlanalysis.primarydendrite.totalvolume.values]);
    rowcolposition{14,4} = skewness([controlanalysis.primarydendrite.numbersegments.values]);
    rowcolposition{15,4} = skewness([controlanalysis.primarydendrite.numberbifurcations.values]);
    rowcolposition{16,4} = skewness([controlanalysis.primarydendrite.numberterminations.values]);
    
    rowcolposition{1,5}  = ' ';
    rowcolposition{2,5}  = 'Kurt';
    rowcolposition{3,5}  = kurtosis([controlanalysis.primarydendrite.proximaldiameter.values]);
    rowcolposition{4,5}  = kurtosis([controlanalysis.primarydendrite.cylindricaldiameter.values]);
    rowcolposition{5,5}  = kurtosis([controlanalysis.primarydendrite.distaldiameter.values]);
    rowcolposition{6,5}  = kurtosis([controlanalysis.primarydendrite.length.values]);
    rowcolposition{7,5}  = kurtosis([controlanalysis.primarydendrite.surfacearea.values]);
    rowcolposition{8,5}  = kurtosis([controlanalysis.primarydendrite.volume.values]);
    rowcolposition{9,5}  = kurtosis([controlanalysis.primarydendrite.minbranchorder.values]);
    rowcolposition{10,5} = kurtosis([controlanalysis.primarydendrite.maxbranchorder.values]);
    rowcolposition{11,5} = kurtosis([controlanalysis.primarydendrite.totallength.values]);
    rowcolposition{12,5} = kurtosis([controlanalysis.primarydendrite.totalsurfacearea.values]);
    rowcolposition{13,5} = kurtosis([controlanalysis.primarydendrite.totalvolume.values]);
    rowcolposition{14,5} = kurtosis([controlanalysis.primarydendrite.numbersegments.values]);
    rowcolposition{15,5} = kurtosis([controlanalysis.primarydendrite.numberbifurcations.values]);
    rowcolposition{16,5} = kurtosis([controlanalysis.primarydendrite.numberterminations.values]);
    
    rowcolposition{1,6}  = ' ';
    rowcolposition{2,6}  = 'Min';
    rowcolposition{3,6}  = min([controlanalysis.primarydendrite.proximaldiameter.values]);
    rowcolposition{4,6}  = min([controlanalysis.primarydendrite.cylindricaldiameter.values]);
    rowcolposition{5,6}  = min([controlanalysis.primarydendrite.distaldiameter.values]);
    rowcolposition{6,6}  = min([controlanalysis.primarydendrite.length.values]);
    rowcolposition{7,6}  = min([controlanalysis.primarydendrite.surfacearea.values]);
    rowcolposition{8,6}  = min([controlanalysis.primarydendrite.volume.values]);
    rowcolposition{9,6}  = min([controlanalysis.primarydendrite.minbranchorder.values]);
    rowcolposition{10,6} = min([controlanalysis.primarydendrite.maxbranchorder.values]);
    rowcolposition{11,6} = min([controlanalysis.primarydendrite.totallength.values]);
    rowcolposition{12,6} = min([controlanalysis.primarydendrite.totalsurfacearea.values]);
    rowcolposition{13,6} = min([controlanalysis.primarydendrite.totalvolume.values]);
    rowcolposition{14,6} = min([controlanalysis.primarydendrite.numbersegments.values]);
    rowcolposition{15,6} = min([controlanalysis.primarydendrite.numberbifurcations.values]);
    rowcolposition{16,6} = min([controlanalysis.primarydendrite.numberterminations.values]);
    
    rowcolposition{1,7}  = ' ';
    rowcolposition{2,7}  = 'Max';
    rowcolposition{3,7}  = max([controlanalysis.primarydendrite.proximaldiameter.values]);
    rowcolposition{4,7}  = max([controlanalysis.primarydendrite.cylindricaldiameter.values]);
    rowcolposition{5,7}  = max([controlanalysis.primarydendrite.distaldiameter.values]);
    rowcolposition{6,7}  = max([controlanalysis.primarydendrite.length.values]);
    rowcolposition{7,7}  = max([controlanalysis.primarydendrite.surfacearea.values]);
    rowcolposition{8,7}  = max([controlanalysis.primarydendrite.volume.values]);
    rowcolposition{9,7}  = max([controlanalysis.primarydendrite.minbranchorder.values]);
    rowcolposition{10,7} = max([controlanalysis.primarydendrite.maxbranchorder.values]);
    rowcolposition{11,7} = max([controlanalysis.primarydendrite.totallength.values]);
    rowcolposition{12,7} = max([controlanalysis.primarydendrite.totalsurfacearea.values]);
    rowcolposition{13,7} = max([controlanalysis.primarydendrite.totalvolume.values]);
    rowcolposition{14,7} = max([controlanalysis.primarydendrite.numbersegments.values]);
    rowcolposition{15,7} = max([controlanalysis.primarydendrite.numberbifurcations.values]);
    rowcolposition{16,7} = max([controlanalysis.primarydendrite.numberterminations.values]);

    
    filename = sprintf('%s_%s',controlanalysis.inputfilename,'primarydendrite_table.csv');
    %xlswrite(filename,rowcolposition);
	cell2csv(filename,rowcolposition);
    cd(currentdirectory);

end

if nargin == 2

    

    rowcolposition{1,1} = ' ';
    rowcolposition{2,1} = 'Values';
    rowcolposition{3,1} = 'Proximal Diameter';
    rowcolposition{4,1} = 'Cyl Diameter';
    rowcolposition{5,1} = 'Distal Diameter';
    rowcolposition{6,1} = 'Length';
    rowcolposition{7,1} = 'Surface Area';
    rowcolposition{8,1} = 'Volume';
    rowcolposition{9,1} = 'Min Branch Order';
    rowcolposition{10,1} = 'Max Branch Order';
    rowcolposition{11,1} = 'Total Length';
    rowcolposition{12,1} = 'Total Surface Area';
    rowcolposition{13,1} = 'Total Volume';
    rowcolposition{14,1} = 'Num Segments';
    rowcolposition{15,1} = 'Num Bifurcations';
    rowcolposition{16,1} = 'Num Terminations';

    rowcolposition{1,2}  = controlanalysis.inputfilename;
    rowcolposition{2,2}  = 'Mean';
    rowcolposition{3,2}  = mean([controlanalysis.primarydendrite.proximaldiameter.values]);
    rowcolposition{4,2}  = mean([controlanalysis.primarydendrite.cylindricaldiameter.values]);
    rowcolposition{5,2}  = mean([controlanalysis.primarydendrite.distaldiameter.values]);
    rowcolposition{6,2}  = mean([controlanalysis.primarydendrite.length.values]);
    rowcolposition{7,2}  = mean([controlanalysis.primarydendrite.surfacearea.values]);
    rowcolposition{8,2}  = mean([controlanalysis.primarydendrite.volume.values]);
    rowcolposition{9,2}  = mean([controlanalysis.primarydendrite.minbranchorder.values]);
    rowcolposition{10,2} = mean([controlanalysis.primarydendrite.maxbranchorder.values]);
    rowcolposition{11,2} = mean([controlanalysis.primarydendrite.totallength.values]);
    rowcolposition{12,2} = mean([controlanalysis.primarydendrite.totalsurfacearea.values]);
    rowcolposition{13,2} = mean([controlanalysis.primarydendrite.totalvolume.values]);
    rowcolposition{14,2} = mean([controlanalysis.primarydendrite.numbersegments.values]);
    rowcolposition{15,2} = mean([controlanalysis.primarydendrite.numberbifurcations.values]);
    rowcolposition{16,2} = mean([controlanalysis.primarydendrite.numberterminations.values]);

    rowcolposition{1,3}  = ' ';
    rowcolposition{2,3}  = 'STD';
    rowcolposition{3,3}  = std([controlanalysis.primarydendrite.proximaldiameter.values]);
    rowcolposition{4,3}  = std([controlanalysis.primarydendrite.cylindricaldiameter.values]);
    rowcolposition{5,3}  = std([controlanalysis.primarydendrite.distaldiameter.values]);
    rowcolposition{6,3}  = std([controlanalysis.primarydendrite.length.values]);
    rowcolposition{7,3}  = std([controlanalysis.primarydendrite.surfacearea.values]);
    rowcolposition{8,3}  = std([controlanalysis.primarydendrite.volume.values]);
    rowcolposition{9,3}  = std([controlanalysis.primarydendrite.minbranchorder.values]);
    rowcolposition{10,3} = std([controlanalysis.primarydendrite.maxbranchorder.values]);
    rowcolposition{11,3} = std([controlanalysis.primarydendrite.totallength.values]);
    rowcolposition{12,3} = std([controlanalysis.primarydendrite.totalsurfacearea.values]);
    rowcolposition{13,3} = std([controlanalysis.primarydendrite.totalvolume.values]);
    rowcolposition{14,3} = std([controlanalysis.primarydendrite.numbersegments.values]);
    rowcolposition{15,3} = std([controlanalysis.primarydendrite.numberbifurcations.values]);
    rowcolposition{16,3} = std([controlanalysis.primarydendrite.numberterminations.values]);


    for i=1:length(fieldnames(testanalysis))

        names = fieldnames(testanalysis);
        eval(['currenttestanalysis = testanalysis.' char(names(i)) ';']);

        rowcolposition{1,11*(i-1)+4}  = currenttestanalysis.inputfilename;
        rowcolposition{2,11*(i-1)+4}  = 'Mean';
        rowcolposition{3,11*(i-1)+4}  = mean([currenttestanalysis.primarydendrite.proximaldiameter.values]);
        rowcolposition{4,11*(i-1)+4}  = mean([currenttestanalysis.primarydendrite.cylindricaldiameter.values]);
        rowcolposition{5,11*(i-1)+4}  = mean([currenttestanalysis.primarydendrite.distaldiameter.values]);
        rowcolposition{6,11*(i-1)+4}  = mean([currenttestanalysis.primarydendrite.length.values]);
        rowcolposition{7,11*(i-1)+4}  = mean([currenttestanalysis.primarydendrite.surfacearea.values]);
        rowcolposition{8,11*(i-1)+4}  = mean([currenttestanalysis.primarydendrite.volume.values]);
        rowcolposition{9,11*(i-1)+4}  = mean([currenttestanalysis.primarydendrite.minbranchorder.values]);
        rowcolposition{10,11*(i-1)+4} = mean([currenttestanalysis.primarydendrite.maxbranchorder.values]);
        rowcolposition{11,11*(i-1)+4} = mean([currenttestanalysis.primarydendrite.totallength.values]);
        rowcolposition{12,11*(i-1)+4} = mean([currenttestanalysis.primarydendrite.totalsurfacearea.values]);
        rowcolposition{13,11*(i-1)+4} = mean([currenttestanalysis.primarydendrite.totalvolume.values]);
        rowcolposition{14,11*(i-1)+4} = mean([currenttestanalysis.primarydendrite.numbersegments.values]);
        rowcolposition{15,11*(i-1)+4} = mean([currenttestanalysis.primarydendrite.numberbifurcations.values]);
        rowcolposition{16,11*(i-1)+4} = mean([currenttestanalysis.primarydendrite.numberterminations.values]);

        rowcolposition{1,11*(i-1)+5}  = ' ';
        rowcolposition{2,11*(i-1)+5}  = 'STD';
        rowcolposition{3,11*(i-1)+5}  = std([currenttestanalysis.primarydendrite.proximaldiameter.values]);
        rowcolposition{4,11*(i-1)+5}  = std([currenttestanalysis.primarydendrite.cylindricaldiameter.values]);
        rowcolposition{5,11*(i-1)+5}  = std([currenttestanalysis.primarydendrite.distaldiameter.values]);
        rowcolposition{6,11*(i-1)+5}  = std([currenttestanalysis.primarydendrite.length.values]);
        rowcolposition{7,11*(i-1)+5}  = std([currenttestanalysis.primarydendrite.surfacearea.values]);
        rowcolposition{8,11*(i-1)+5}  = std([currenttestanalysis.primarydendrite.volume.values]);
        rowcolposition{9,11*(i-1)+5}  = std([currenttestanalysis.primarydendrite.minbranchorder.values]);
        rowcolposition{10,11*(i-1)+5} = std([currenttestanalysis.primarydendrite.maxbranchorder.values]);
        rowcolposition{11,11*(i-1)+5} = std([currenttestanalysis.primarydendrite.totallength.values]);
        rowcolposition{12,11*(i-1)+5} = std([currenttestanalysis.primarydendrite.totalsurfacearea.values]);
        rowcolposition{13,11*(i-1)+5} = std([currenttestanalysis.primarydendrite.totalvolume.values]);
        rowcolposition{14,11*(i-1)+5} = std([currenttestanalysis.primarydendrite.numbersegments.values]);
        rowcolposition{15,11*(i-1)+5} = std([currenttestanalysis.primarydendrite.numberbifurcations.values]);
        rowcolposition{16,11*(i-1)+5} = std([currenttestanalysis.primarydendrite.numberterminations.values]);


        proximaldiametermeandiff            = 100*((mean(currenttestanalysis.primarydendrite.proximaldiameter.values)-mean(controlanalysis.primarydendrite.proximaldiameter.values))/mean(controlanalysis.primarydendrite.proximaldiameter.values));
        cylindricaldiametermeandiff         = 100*((mean(currenttestanalysis.primarydendrite.cylindricaldiameter.values)-mean(controlanalysis.primarydendrite.cylindricaldiameter.values))/mean(controlanalysis.primarydendrite.cylindricaldiameter.values));
        distaldiametermeandiff              = 100*((mean(currenttestanalysis.primarydendrite.distaldiameter.values)-mean(controlanalysis.primarydendrite.distaldiameter.values))/mean(controlanalysis.primarydendrite.distaldiameter.values));
        lengthmeandiff                      = 100*((mean(currenttestanalysis.primarydendrite.length.values)-mean(controlanalysis.primarydendrite.length.values))/mean(controlanalysis.primarydendrite.length.values));
        surfaceareameandiff                 = 100*((mean(currenttestanalysis.primarydendrite.surfacearea.values)-mean(controlanalysis.primarydendrite.surfacearea.values))/mean(controlanalysis.primarydendrite.surfacearea.values));
        volumemeandiff                      = 100*((mean(currenttestanalysis.primarydendrite.volume.values)-mean(controlanalysis.primarydendrite.volume.values))/mean(controlanalysis.primarydendrite.volume.values));
        minbranchordermeandiff              = 100*((mean(currenttestanalysis.primarydendrite.minbranchorder.values)-mean(controlanalysis.primarydendrite.minbranchorder.values))/mean(controlanalysis.primarydendrite.minbranchorder.values));
        maxbranchordermeandiff              = 100*((mean(currenttestanalysis.primarydendrite.maxbranchorder.values)-mean(controlanalysis.primarydendrite.maxbranchorder.values))/mean(controlanalysis.primarydendrite.maxbranchorder.values));
        totallengthmeandiff                 = 100*((mean(currenttestanalysis.primarydendrite.totallength.values)-mean(controlanalysis.primarydendrite.totallength.values))/mean(controlanalysis.primarydendrite.totallength.values));
        totalsurfaceareameandiff            = 100*((mean(currenttestanalysis.primarydendrite.totalsurfacearea.values)-mean(controlanalysis.primarydendrite.totalsurfacearea.values))/mean(controlanalysis.primarydendrite.totalsurfacearea.values));
        totalvolumemeandiff                 = 100*((mean(currenttestanalysis.primarydendrite.totalvolume.values)-mean(controlanalysis.primarydendrite.totalvolume.values))/mean(controlanalysis.primarydendrite.totalvolume.values));
        numbersegmentsmeandiff              = 100*((mean(currenttestanalysis.primarydendrite.numbersegments.values)-mean(controlanalysis.primarydendrite.numbersegments.values))/mean(controlanalysis.primarydendrite.numbersegments.values));
        numberbifurcationsmeandiff          = 100*((mean(currenttestanalysis.primarydendrite.numberbifurcations.values)-mean(controlanalysis.primarydendrite.numberbifurcations.values))/mean(controlanalysis.primarydendrite.numberbifurcations.values));
        numberterminationsmeandiff          = 100*((mean(currenttestanalysis.primarydendrite.numberterminations.values)-mean(controlanalysis.primarydendrite.numberterminations.values))/mean(controlanalysis.primarydendrite.numberterminations.values));



        rowcolposition{1,11*(i-1)+6}  = '% Mean Diff';
        rowcolposition{2,11*(i-1)+6}  = ' ';
        rowcolposition{3,11*(i-1)+6}  = proximaldiametermeandiff;
        rowcolposition{4,11*(i-1)+6}  = cylindricaldiametermeandiff;
        rowcolposition{5,11*(i-1)+6}  = distaldiametermeandiff;
        rowcolposition{6,11*(i-1)+6}  = lengthmeandiff;
        rowcolposition{7,11*(i-1)+6}  = surfaceareameandiff;
        rowcolposition{8,11*(i-1)+6}  = volumemeandiff;
        rowcolposition{9,11*(i-1)+6}  = minbranchordermeandiff;
        rowcolposition{10,11*(i-1)+6} = maxbranchordermeandiff;
        rowcolposition{11,11*(i-1)+6} = totallengthmeandiff;
        rowcolposition{12,11*(i-1)+6} = totalsurfaceareameandiff;
        rowcolposition{13,11*(i-1)+6} = totalvolumemeandiff;
        rowcolposition{14,11*(i-1)+6} = numbersegmentsmeandiff;
        rowcolposition{15,11*(i-1)+6} = numberbifurcationsmeandiff;
        rowcolposition{16,11*(i-1)+6} = numberterminationsmeandiff;



        [proximaldiameterh,proximaldiameterp]             = ttest2(controlanalysis.primarydendrite.proximaldiameter.values,currenttestanalysis.primarydendrite.proximaldiameter.values);
        [cylindricaldiameterh,cylindricaldiameterp]       = ttest2(controlanalysis.primarydendrite.cylindricaldiameter.values,currenttestanalysis.primarydendrite.cylindricaldiameter.values);
        [distaldiameterh,distaldiameterp]                 = ttest2(controlanalysis.primarydendrite.distaldiameter.values,currenttestanalysis.primarydendrite.distaldiameter.values);
        [lengthh,lengthp]                                 = ttest2(controlanalysis.primarydendrite.length.values,currenttestanalysis.primarydendrite.length.values);
        [surfaceareah,surfaceareap]                       = ttest2(controlanalysis.primarydendrite.surfacearea.values,currenttestanalysis.primarydendrite.surfacearea.values);
        [volumeh,volumep]                                 = ttest2(controlanalysis.primarydendrite.volume.values,currenttestanalysis.primarydendrite.volume.values);
        [minbranchorderh,minbranchorderp]                 = ttest2(controlanalysis.primarydendrite.minbranchorder.values,currenttestanalysis.primarydendrite.minbranchorder.values);
        [maxbranchorderh,maxbranchorderp]                 = ttest2(controlanalysis.primarydendrite.maxbranchorder.values,currenttestanalysis.primarydendrite.maxbranchorder.values);
        [totallengthh,totallengthp]                       = ttest2(controlanalysis.primarydendrite.totallength.values,currenttestanalysis.primarydendrite.totallength.values);
        [totalsurfaceareah,totalsurfaceareap]             = ttest2(controlanalysis.primarydendrite.totalsurfacearea.values,currenttestanalysis.primarydendrite.totalsurfacearea.values);
        [totalvolumeh,totalvolumep]                       = ttest2(controlanalysis.primarydendrite.totalvolume.values,currenttestanalysis.primarydendrite.totalvolume.values);
        [numbersegmentsh,numbersegmentsp]                 = ttest2(controlanalysis.primarydendrite.numbersegments.values,currenttestanalysis.primarydendrite.numbersegments.values);
        [numberbifurcationsh,numberbifurcationsp]         = ttest2(controlanalysis.primarydendrite.numberbifurcations.values,currenttestanalysis.primarydendrite.numberbifurcations.values);
        [numberterminationsh,numberterminationsp]         = ttest2(controlanalysis.primarydendrite.numberterminations.values,currenttestanalysis.primarydendrite.numberterminations.values);

        if proximaldiameterh         == 0, proximaldiameterh = 'same'; else proximaldiameterh = 'diff'; end;
        if cylindricaldiameterh      == 0, cylindricaldiameterh = 'same'; else cylindricaldiameterh = 'diff'; end;
        if distaldiameterh           == 0, distaldiameterh = 'same'; else distaldiameterh = 'diff'; end;
        if lengthh                   == 0, lengthh = 'same'; else lengthh = 'diff'; end;
        if surfaceareah              == 0, surfaceareah = 'same'; else surfaceareah = 'diff'; end;
        if volumeh                   == 0, volumeh = 'same'; else volumeh = 'diff'; end;
        if minbranchorderh           == 0, minbranchorderh = 'same'; else minbranchorderh = 'diff'; end;
        if maxbranchorderh           == 0, maxbranchorderh = 'same'; else maxbranchorderh = 'diff'; end;
        if totallengthh              == 0, totallengthh = 'same'; else totallengthh = 'diff'; end;
        if totalsurfaceareah         == 0, totalsurfaceareah = 'same'; else totalsurfaceareah = 'diff'; end;
        if totalvolumeh              == 0, totalvolumeh = 'same'; else totalvolumeh = 'diff'; end;
        if numbersegmentsh           == 0, numbersegmentsh = 'same'; else numbersegmentsh = 'diff'; end;
        if numberbifurcationsh       == 0, numberbifurcationsh = 'same'; else numberbifurcationsh = 'diff'; end;
        if numberterminationsh       == 0, numberterminationsh = 'same'; else numberterminationsh = 'diff'; end;

        rowcolposition{1,11*(i-1)+7}  = 't-test ';
        rowcolposition{2,11*(i-1)+7}  = 'h';
        rowcolposition{3,11*(i-1)+7}  = proximaldiameterh;
        rowcolposition{4,11*(i-1)+7}  = cylindricaldiameterh;
        rowcolposition{5,11*(i-1)+7}  = distaldiameterh;
        rowcolposition{6,11*(i-1)+7}  = lengthh;
        rowcolposition{7,11*(i-1)+7}  = surfaceareah;
        rowcolposition{8,11*(i-1)+7}  = volumeh;
        rowcolposition{9,11*(i-1)+7}  = minbranchorderh;
        rowcolposition{10,11*(i-1)+7} = maxbranchorderh;
        rowcolposition{11,11*(i-1)+7} = totallengthh;
        rowcolposition{12,11*(i-1)+7} = totalsurfaceareah;
        rowcolposition{13,11*(i-1)+7} = totalvolumeh;
        rowcolposition{14,11*(i-1)+7} = numbersegmentsh;
        rowcolposition{15,11*(i-1)+7} = numberbifurcationsh;
        rowcolposition{16,11*(i-1)+7} = numberterminationsh;

        rowcolposition{1,11*(i-1)+8}  = '(mean)';
        rowcolposition{2,11*(i-1)+8}  = 'p';
        rowcolposition{3,11*(i-1)+8}  = proximaldiameterp;
        rowcolposition{4,11*(i-1)+8}  = cylindricaldiameterp;
        rowcolposition{5,11*(i-1)+8}  = distaldiameterp;
        rowcolposition{6,11*(i-1)+8}  = lengthp;
        rowcolposition{7,11*(i-1)+8}  = surfaceareap;
        rowcolposition{8,11*(i-1)+8}  = volumep;
        rowcolposition{9,11*(i-1)+8}  = minbranchorderp;
        rowcolposition{10,11*(i-1)+8} = maxbranchorderp;
        rowcolposition{11,11*(i-1)+8} = totallengthp;
        rowcolposition{12,11*(i-1)+8} = totalsurfaceareap;
        rowcolposition{13,11*(i-1)+8} = totalvolumep;
        rowcolposition{14,11*(i-1)+8} = numbersegmentsp;
        rowcolposition{15,11*(i-1)+8} = numberbifurcationsp;
        rowcolposition{16,11*(i-1)+8} = numberterminationsp;


        [proximaldiameterp,proximaldiameterh]             = ranksum(controlanalysis.primarydendrite.proximaldiameter.values,currenttestanalysis.primarydendrite.proximaldiameter.values);
        [cylindricaldiameterp,cylindricaldiameterh]       = ranksum(controlanalysis.primarydendrite.cylindricaldiameter.values,currenttestanalysis.primarydendrite.cylindricaldiameter.values);
        [distaldiameterp,distaldiameterh]                 = ranksum(controlanalysis.primarydendrite.distaldiameter.values,currenttestanalysis.primarydendrite.distaldiameter.values);
        [lengthp,lengthh]                                 = ranksum(controlanalysis.primarydendrite.length.values,currenttestanalysis.primarydendrite.length.values);
        [surfaceareap,surfaceareah]                       = ranksum(controlanalysis.primarydendrite.surfacearea.values,currenttestanalysis.primarydendrite.surfacearea.values);
        [volumep,volumeh]                                 = ranksum(controlanalysis.primarydendrite.volume.values,currenttestanalysis.primarydendrite.volume.values);
        [minbranchorderp,minbranchorderh]                 = ranksum(controlanalysis.primarydendrite.minbranchorder.values,currenttestanalysis.primarydendrite.minbranchorder.values);
        [maxbranchorderp,maxbranchorderh]                 = ranksum(controlanalysis.primarydendrite.maxbranchorder.values,currenttestanalysis.primarydendrite.maxbranchorder.values);
        [totallengthp,totallengthh]                       = ranksum(controlanalysis.primarydendrite.totallength.values,currenttestanalysis.primarydendrite.totallength.values);
        [totalsurfaceareap,totalsurfaceareah]             = ranksum(controlanalysis.primarydendrite.totalsurfacearea.values,currenttestanalysis.primarydendrite.totalsurfacearea.values);
        [totalvolumep,totalvolumeh]                       = ranksum(controlanalysis.primarydendrite.totalvolume.values,currenttestanalysis.primarydendrite.totalvolume.values);
        [numbersegmentsp,numbersegmentsh]                 = ranksum(controlanalysis.primarydendrite.numbersegments.values,currenttestanalysis.primarydendrite.numbersegments.values);
        [numberbifurcationsp,numberbifurcationsh]         = ranksum(controlanalysis.primarydendrite.numberbifurcations.values,currenttestanalysis.primarydendrite.numberbifurcations.values);
        [numberterminationsp,numberterminationsh]         = ranksum(controlanalysis.primarydendrite.numberterminations.values,currenttestanalysis.primarydendrite.numberterminations.values);

        if proximaldiameterh         == 0, proximaldiameterh = 'same'; else proximaldiameterh = 'diff'; end;
        if cylindricaldiameterh      == 0, cylindricaldiameterh = 'same'; else cylindricaldiameterh = 'diff'; end;
        if distaldiameterh           == 0, distaldiameterh = 'same'; else distaldiameterh = 'diff'; end;
        if lengthh                   == 0, lengthh = 'same'; else lengthh = 'diff'; end;
        if surfaceareah              == 0, surfaceareah = 'same'; else surfaceareah = 'diff'; end;
        if volumeh                   == 0, volumeh = 'same'; else volumeh = 'diff'; end;
        if minbranchorderh           == 0, minbranchorderh = 'same'; else minbranchorderh = 'diff'; end;
        if maxbranchorderh           == 0, maxbranchorderh = 'same'; else maxbranchorderh = 'diff'; end;
        if totallengthh              == 0, totallengthh = 'same'; else totallengthh = 'diff'; end;
        if totalsurfaceareah         == 0, totalsurfaceareah = 'same'; else totalsurfaceareah = 'diff'; end;
        if totalvolumeh              == 0, totalvolumeh = 'same'; else totalvolumeh = 'diff'; end;
        if numbersegmentsh           == 0, numbersegmentsh = 'same'; else numbersegmentsh = 'diff'; end;
        if numberbifurcationsh       == 0, numberbifurcationsh = 'same'; else numberbifurcationsh = 'diff'; end;
        if numberterminationsh       == 0, numberterminationsh = 'same'; else numberterminationsh = 'diff'; end;

        rowcolposition{1,11*(i-1)+9}  = 'RS-test ';
        rowcolposition{2,11*(i-1)+9}  = 'h';
        rowcolposition{3,11*(i-1)+9}  = proximaldiameterh;
        rowcolposition{4,11*(i-1)+9}  = cylindricaldiameterh;
        rowcolposition{5,11*(i-1)+9}  = distaldiameterh;
        rowcolposition{6,11*(i-1)+9}  = lengthh;
        rowcolposition{7,11*(i-1)+9}  = surfaceareah;
        rowcolposition{8,11*(i-1)+9}  = volumeh;
        rowcolposition{9,11*(i-1)+9}  = minbranchorderh;
        rowcolposition{10,11*(i-1)+9} = maxbranchorderh;
        rowcolposition{11,11*(i-1)+9} = totallengthh;
        rowcolposition{12,11*(i-1)+9} = totalsurfaceareah;
        rowcolposition{13,11*(i-1)+9} = totalvolumeh;
        rowcolposition{14,11*(i-1)+9} = numbersegmentsh;
        rowcolposition{15,11*(i-1)+9} = numberbifurcationsh;
        rowcolposition{16,11*(i-1)+9} = numberterminationsh;

        rowcolposition{1,11*(i-1)+10}  = '(median)';
        rowcolposition{2,11*(i-1)+10}  = 'p';
        rowcolposition{3,11*(i-1)+10}  = proximaldiameterp;
        rowcolposition{4,11*(i-1)+10}  = cylindricaldiameterp;
        rowcolposition{5,11*(i-1)+10}  = distaldiameterp;
        rowcolposition{6,11*(i-1)+10}  = lengthp;
        rowcolposition{7,11*(i-1)+10}  = surfaceareap;
        rowcolposition{8,11*(i-1)+10}  = volumep;
        rowcolposition{9,11*(i-1)+10}  = minbranchorderp;
        rowcolposition{10,11*(i-1)+10} = maxbranchorderp;
        rowcolposition{11,11*(i-1)+10} = totallengthp;
        rowcolposition{12,11*(i-1)+10} = totalsurfaceareap;
        rowcolposition{13,11*(i-1)+10} = totalvolumep;
        rowcolposition{14,11*(i-1)+10} = numbersegmentsp;
        rowcolposition{15,11*(i-1)+10} = numberbifurcationsp;
        rowcolposition{16,11*(i-1)+10} = numberterminationsp;


        [proximaldiameterh,proximaldiameterp]             = ansaribradley(controlanalysis.primarydendrite.proximaldiameter.values,currenttestanalysis.primarydendrite.proximaldiameter.values);
        [cylindricaldiameterh,cylindricaldiameterp]       = ansaribradley(controlanalysis.primarydendrite.cylindricaldiameter.values,currenttestanalysis.primarydendrite.cylindricaldiameter.values);
        [distaldiameterh,distaldiameterp]                 = ansaribradley(controlanalysis.primarydendrite.distaldiameter.values,currenttestanalysis.primarydendrite.distaldiameter.values);
        [lengthh,lengthp]                                 = ansaribradley(controlanalysis.primarydendrite.length.values,currenttestanalysis.primarydendrite.length.values);
        [surfaceareah,surfaceareap]                       = ansaribradley(controlanalysis.primarydendrite.surfacearea.values,currenttestanalysis.primarydendrite.surfacearea.values);
        [volumeh,volumep]                                 = ansaribradley(controlanalysis.primarydendrite.volume.values,currenttestanalysis.primarydendrite.volume.values);
        [minbranchorderh,minbranchorderp]                 = ansaribradley(controlanalysis.primarydendrite.minbranchorder.values,currenttestanalysis.primarydendrite.minbranchorder.values);
        [maxbranchorderh,maxbranchorderp]                 = ansaribradley(controlanalysis.primarydendrite.maxbranchorder.values,currenttestanalysis.primarydendrite.maxbranchorder.values);
        [totallengthh,totallengthp]                       = ansaribradley(controlanalysis.primarydendrite.totallength.values,currenttestanalysis.primarydendrite.totallength.values);
        [totalsurfaceareah,totalsurfaceareap]             = ansaribradley(controlanalysis.primarydendrite.totalsurfacearea.values,currenttestanalysis.primarydendrite.totalsurfacearea.values);
        [totalvolumeh,totalvolumep]                       = ansaribradley(controlanalysis.primarydendrite.totalvolume.values,currenttestanalysis.primarydendrite.totalvolume.values);
        [numbersegmentsh,numbersegmentsp]                 = ansaribradley(controlanalysis.primarydendrite.numbersegments.values,currenttestanalysis.primarydendrite.numbersegments.values);
        [numberbifurcationsh,numberbifurcationsp]         = ansaribradley(controlanalysis.primarydendrite.numberbifurcations.values,currenttestanalysis.primarydendrite.numberbifurcations.values);
        [numberterminationsh,numberterminationsp]         = ansaribradley(controlanalysis.primarydendrite.numberterminations.values,currenttestanalysis.primarydendrite.numberterminations.values);

        if proximaldiameterh         == 0, proximaldiameterh = 'same'; else proximaldiameterh = 'diff'; end;
        if cylindricaldiameterh      == 0, cylindricaldiameterh = 'same'; else cylindricaldiameterh = 'diff'; end;
        if distaldiameterh           == 0, distaldiameterh = 'same'; else distaldiameterh = 'diff'; end;
        if lengthh                   == 0, lengthh = 'same'; else lengthh = 'diff'; end;
        if surfaceareah              == 0, surfaceareah = 'same'; else surfaceareah = 'diff'; end;
        if volumeh                   == 0, volumeh = 'same'; else volumeh = 'diff'; end;
        if minbranchorderh           == 0, minbranchorderh = 'same'; else minbranchorderh = 'diff'; end;
        if maxbranchorderh           == 0, maxbranchorderh = 'same'; else maxbranchorderh = 'diff'; end;
        if totallengthh              == 0, totallengthh = 'same'; else totallengthh = 'diff'; end;
        if totalsurfaceareah         == 0, totalsurfaceareah = 'same'; else totalsurfaceareah = 'diff'; end;
        if totalvolumeh              == 0, totalvolumeh = 'same'; else totalvolumeh = 'diff'; end;
        if numbersegmentsh           == 0, numbersegmentsh = 'same'; else numbersegmentsh = 'diff'; end;
        if numberbifurcationsh       == 0, numberbifurcationsh = 'same'; else numberbifurcationsh = 'diff'; end;
        if numberterminationsh       == 0, numberterminationsh = 'same'; else numberterminationsh = 'diff'; end;

        rowcolposition{1,11*(i-1)+11}  = 'AB-test ';
        rowcolposition{2,11*(i-1)+11}  = 'h';
        rowcolposition{3,11*(i-1)+11}  = proximaldiameterh;
        rowcolposition{4,11*(i-1)+11}  = cylindricaldiameterh;
        rowcolposition{5,11*(i-1)+11}  = distaldiameterh;
        rowcolposition{6,11*(i-1)+11}  = lengthh;
        rowcolposition{7,11*(i-1)+11}  = surfaceareah;
        rowcolposition{8,11*(i-1)+11}  = volumeh;
        rowcolposition{9,11*(i-1)+11}  = minbranchorderh;
        rowcolposition{10,11*(i-1)+11} = maxbranchorderh;
        rowcolposition{11,11*(i-1)+11} = totallengthh;
        rowcolposition{12,11*(i-1)+11} = totalsurfaceareah;
        rowcolposition{13,11*(i-1)+11} = totalvolumeh;
        rowcolposition{14,11*(i-1)+11} = numbersegmentsh;
        rowcolposition{15,11*(i-1)+11} = numberbifurcationsh;
        rowcolposition{16,11*(i-1)+11} = numberterminationsh;

        rowcolposition{1,11*(i-1)+12}  = '(variability) ';
        rowcolposition{2,11*(i-1)+12}  = 'p';
        rowcolposition{3,11*(i-1)+12}  = proximaldiameterp;
        rowcolposition{4,11*(i-1)+12}  = cylindricaldiameterp;
        rowcolposition{5,11*(i-1)+12}  = distaldiameterp;
        rowcolposition{6,11*(i-1)+12}  = lengthp;
        rowcolposition{7,11*(i-1)+12}  = surfaceareap;
        rowcolposition{8,11*(i-1)+12}  = volumep;
        rowcolposition{9,11*(i-1)+12}  = minbranchorderp;
        rowcolposition{10,11*(i-1)+12} = maxbranchorderp;
        rowcolposition{11,11*(i-1)+12} = totallengthp;
        rowcolposition{12,11*(i-1)+12} = totalsurfaceareap;
        rowcolposition{13,11*(i-1)+12} = totalvolumep;
        rowcolposition{14,11*(i-1)+12} = numbersegmentsp;
        rowcolposition{15,11*(i-1)+12} = numberbifurcationsp;
        rowcolposition{16,11*(i-1)+12} = numberterminationsp;


        [proximaldiameterh,proximaldiameterp]             = kstest2(controlanalysis.primarydendrite.proximaldiameter.values,currenttestanalysis.primarydendrite.proximaldiameter.values);
        [cylindricaldiameterh,cylindricaldiameterp]       = kstest2(controlanalysis.primarydendrite.cylindricaldiameter.values,currenttestanalysis.primarydendrite.cylindricaldiameter.values);
        [distaldiameterh,distaldiameterp]                 = kstest2(controlanalysis.primarydendrite.distaldiameter.values,currenttestanalysis.primarydendrite.distaldiameter.values);
        [lengthh,lengthp]                                 = kstest2(controlanalysis.primarydendrite.length.values,currenttestanalysis.primarydendrite.length.values);
        [surfaceareah,surfaceareap]                       = kstest2(controlanalysis.primarydendrite.surfacearea.values,currenttestanalysis.primarydendrite.surfacearea.values);
        [volumeh,volumep]                                 = kstest2(controlanalysis.primarydendrite.volume.values,currenttestanalysis.primarydendrite.volume.values);
        [minbranchorderh,minbranchorderp]                 = kstest2(controlanalysis.primarydendrite.minbranchorder.values,currenttestanalysis.primarydendrite.minbranchorder.values);
        [maxbranchorderh,maxbranchorderp]                 = kstest2(controlanalysis.primarydendrite.maxbranchorder.values,currenttestanalysis.primarydendrite.maxbranchorder.values);
        [totallengthh,totallengthp]                       = kstest2(controlanalysis.primarydendrite.totallength.values,currenttestanalysis.primarydendrite.totallength.values);
        [totalsurfaceareah,totalsurfaceareap]             = kstest2(controlanalysis.primarydendrite.totalsurfacearea.values,currenttestanalysis.primarydendrite.totalsurfacearea.values);
        [totalvolumeh,totalvolumep]                       = kstest2(controlanalysis.primarydendrite.totalvolume.values,currenttestanalysis.primarydendrite.totalvolume.values);
        [numbersegmentsh,numbersegmentsp]                 = kstest2(controlanalysis.primarydendrite.numbersegments.values,currenttestanalysis.primarydendrite.numbersegments.values);
        [numberbifurcationsh,numberbifurcationsp]         = kstest2(controlanalysis.primarydendrite.numberbifurcations.values,currenttestanalysis.primarydendrite.numberbifurcations.values);
        [numberterminationsh,numberterminationsp]         = kstest2(controlanalysis.primarydendrite.numberterminations.values,currenttestanalysis.primarydendrite.numberterminations.values);

        if proximaldiameterh         == 0, proximaldiameterh = 'same'; else proximaldiameterh = 'diff'; end;
        if cylindricaldiameterh      == 0, cylindricaldiameterh = 'same'; else cylindricaldiameterh = 'diff'; end;
        if distaldiameterh           == 0, distaldiameterh = 'same'; else distaldiameterh = 'diff'; end;
        if lengthh                   == 0, lengthh = 'same'; else lengthh = 'diff'; end;
        if surfaceareah              == 0, surfaceareah = 'same'; else surfaceareah = 'diff'; end;
        if volumeh                   == 0, volumeh = 'same'; else volumeh = 'diff'; end;
        if minbranchorderh           == 0, minbranchorderh = 'same'; else minbranchorderh = 'diff'; end;
        if maxbranchorderh           == 0, maxbranchorderh = 'same'; else maxbranchorderh = 'diff'; end;
        if totallengthh              == 0, totallengthh = 'same'; else totallengthh = 'diff'; end;
        if totalsurfaceareah         == 0, totalsurfaceareah = 'same'; else totalsurfaceareah = 'diff'; end;
        if totalvolumeh              == 0, totalvolumeh = 'same'; else totalvolumeh = 'diff'; end;
        if numbersegmentsh           == 0, numbersegmentsh = 'same'; else numbersegmentsh = 'diff'; end;
        if numberbifurcationsh       == 0, numberbifurcationsh = 'same'; else numberbifurcationsh = 'diff'; end;
        if numberterminationsh       == 0, numberterminationsh = 'same'; else numberterminationsh = 'diff'; end;

        rowcolposition{1,11*(i-1)+13}  = 'KS-test ';
        rowcolposition{2,11*(i-1)+13}  = 'h';
        rowcolposition{3,11*(i-1)+13}  = proximaldiameterh;
        rowcolposition{4,11*(i-1)+13}  = cylindricaldiameterh;
        rowcolposition{5,11*(i-1)+13}  = distaldiameterh;
        rowcolposition{6,11*(i-1)+13}  = lengthh;
        rowcolposition{7,11*(i-1)+13}  = surfaceareah;
        rowcolposition{8,11*(i-1)+13}  = volumeh;
        rowcolposition{9,11*(i-1)+13}  = minbranchorderh;
        rowcolposition{10,11*(i-1)+13} = maxbranchorderh;
        rowcolposition{11,11*(i-1)+13} = totallengthh;
        rowcolposition{12,11*(i-1)+13} = totalsurfaceareah;
        rowcolposition{13,11*(i-1)+13} = totalvolumeh;
        rowcolposition{14,11*(i-1)+13} = numbersegmentsh;
        rowcolposition{15,11*(i-1)+13} = numberbifurcationsh;
        rowcolposition{16,11*(i-1)+13} = numberterminationsh;

        rowcolposition{1,11*(i-1)+14}  = '(mean + var)';
        rowcolposition{2,11*(i-1)+14}  = 'p';
        rowcolposition{3,11*(i-1)+14}  = proximaldiameterp;
        rowcolposition{4,11*(i-1)+14}  = cylindricaldiameterp;
        rowcolposition{5,11*(i-1)+14}  = distaldiameterp;
        rowcolposition{6,11*(i-1)+14}  = lengthp;
        rowcolposition{7,11*(i-1)+14}  = surfaceareap;
        rowcolposition{8,11*(i-1)+14}  = volumep;
        rowcolposition{9,11*(i-1)+14}  = minbranchorderp;
        rowcolposition{10,11*(i-1)+14} = maxbranchorderp;
        rowcolposition{11,11*(i-1)+14} = totallengthp;
        rowcolposition{12,11*(i-1)+14} = totalsurfaceareap;
        rowcolposition{13,11*(i-1)+14} = totalvolumep;
        rowcolposition{14,11*(i-1)+14} = numbersegmentsp;
        rowcolposition{15,11*(i-1)+14} = numberbifurcationsp;
        rowcolposition{16,11*(i-1)+14} = numberterminationsp;


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
    
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysisfilenames,'primarydendrite_comparison_table');
    xlswrite(filename,rowcolposition);
    cd(currentdirectory);

end



warning('on', 'MATLAB:divideByZero');