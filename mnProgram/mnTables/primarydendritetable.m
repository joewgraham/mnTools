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
    rowcolposition{3,2}  = mean([controlanalysis.dendrite.trunk.proximaldiameter.values]);
    rowcolposition{4,2}  = mean([controlanalysis.dendrite.trunk.cylindricaldiameter.values]);
    rowcolposition{5,2}  = mean([controlanalysis.dendrite.trunk.distaldiameter.values]);
    rowcolposition{6,2}  = mean([controlanalysis.dendrite.trunk.length.values]);
    rowcolposition{7,2}  = mean([controlanalysis.dendrite.trunk.surfacearea.values]);
    rowcolposition{8,2}  = mean([controlanalysis.dendrite.trunk.volume.values]);
    rowcolposition{9,2}  = mean([controlanalysis.dendrite.trunk.minbranchorder.values]);
    rowcolposition{10,2} = mean([controlanalysis.dendrite.trunk.maxbranchorder.values]);
    rowcolposition{11,2} = mean([controlanalysis.dendrite.trunk.totallength.values]);
    rowcolposition{12,2} = mean([controlanalysis.dendrite.trunk.totalsurfacearea.values]);
    rowcolposition{13,2} = mean([controlanalysis.dendrite.trunk.totalvolume.values]);
    rowcolposition{14,2} = mean([controlanalysis.dendrite.trunk.numbersegments.values]);
    rowcolposition{15,2} = mean([controlanalysis.dendrite.trunk.numberbifurcations.values]);
    rowcolposition{16,2} = mean([controlanalysis.dendrite.trunk.numberterminations.values]);

    rowcolposition{1,3}  = ' ';
    rowcolposition{2,3}  = 'STD';
    rowcolposition{3,3}  = std([controlanalysis.dendrite.trunk.proximaldiameter.values]);
    rowcolposition{4,3}  = std([controlanalysis.dendrite.trunk.cylindricaldiameter.values]);
    rowcolposition{5,3}  = std([controlanalysis.dendrite.trunk.distaldiameter.values]);
    rowcolposition{6,3}  = std([controlanalysis.dendrite.trunk.length.values]);
    rowcolposition{7,3}  = std([controlanalysis.dendrite.trunk.surfacearea.values]);
    rowcolposition{8,3}  = std([controlanalysis.dendrite.trunk.volume.values]);
    rowcolposition{9,3}  = std([controlanalysis.dendrite.trunk.minbranchorder.values]);
    rowcolposition{10,3} = std([controlanalysis.dendrite.trunk.maxbranchorder.values]);
    rowcolposition{11,3} = std([controlanalysis.dendrite.trunk.totallength.values]);
    rowcolposition{12,3} = std([controlanalysis.dendrite.trunk.totalsurfacearea.values]);
    rowcolposition{13,3} = std([controlanalysis.dendrite.trunk.totalvolume.values]);
    rowcolposition{14,3} = std([controlanalysis.dendrite.trunk.numbersegments.values]);
    rowcolposition{15,3} = std([controlanalysis.dendrite.trunk.numberbifurcations.values]);
    rowcolposition{16,3} = std([controlanalysis.dendrite.trunk.numberterminations.values]);
    
    rowcolposition{1,4}  = ' ';
    rowcolposition{2,4}  = 'Skew';
    rowcolposition{3,4}  = skewness([controlanalysis.dendrite.trunk.proximaldiameter.values]);
    rowcolposition{4,4}  = skewness([controlanalysis.dendrite.trunk.cylindricaldiameter.values]);
    rowcolposition{5,4}  = skewness([controlanalysis.dendrite.trunk.distaldiameter.values]);
    rowcolposition{6,4}  = skewness([controlanalysis.dendrite.trunk.length.values]);
    rowcolposition{7,4}  = skewness([controlanalysis.dendrite.trunk.surfacearea.values]);
    rowcolposition{8,4}  = skewness([controlanalysis.dendrite.trunk.volume.values]);
    rowcolposition{9,4}  = skewness([controlanalysis.dendrite.trunk.minbranchorder.values]);
    rowcolposition{10,4} = skewness([controlanalysis.dendrite.trunk.maxbranchorder.values]);
    rowcolposition{11,4} = skewness([controlanalysis.dendrite.trunk.totallength.values]);
    rowcolposition{12,4} = skewness([controlanalysis.dendrite.trunk.totalsurfacearea.values]);
    rowcolposition{13,4} = skewness([controlanalysis.dendrite.trunk.totalvolume.values]);
    rowcolposition{14,4} = skewness([controlanalysis.dendrite.trunk.numbersegments.values]);
    rowcolposition{15,4} = skewness([controlanalysis.dendrite.trunk.numberbifurcations.values]);
    rowcolposition{16,4} = skewness([controlanalysis.dendrite.trunk.numberterminations.values]);
    
    rowcolposition{1,5}  = ' ';
    rowcolposition{2,5}  = 'Kurt';
    rowcolposition{3,5}  = kurtosis([controlanalysis.dendrite.trunk.proximaldiameter.values]);
    rowcolposition{4,5}  = kurtosis([controlanalysis.dendrite.trunk.cylindricaldiameter.values]);
    rowcolposition{5,5}  = kurtosis([controlanalysis.dendrite.trunk.distaldiameter.values]);
    rowcolposition{6,5}  = kurtosis([controlanalysis.dendrite.trunk.length.values]);
    rowcolposition{7,5}  = kurtosis([controlanalysis.dendrite.trunk.surfacearea.values]);
    rowcolposition{8,5}  = kurtosis([controlanalysis.dendrite.trunk.volume.values]);
    rowcolposition{9,5}  = kurtosis([controlanalysis.dendrite.trunk.minbranchorder.values]);
    rowcolposition{10,5} = kurtosis([controlanalysis.dendrite.trunk.maxbranchorder.values]);
    rowcolposition{11,5} = kurtosis([controlanalysis.dendrite.trunk.totallength.values]);
    rowcolposition{12,5} = kurtosis([controlanalysis.dendrite.trunk.totalsurfacearea.values]);
    rowcolposition{13,5} = kurtosis([controlanalysis.dendrite.trunk.totalvolume.values]);
    rowcolposition{14,5} = kurtosis([controlanalysis.dendrite.trunk.numbersegments.values]);
    rowcolposition{15,5} = kurtosis([controlanalysis.dendrite.trunk.numberbifurcations.values]);
    rowcolposition{16,5} = kurtosis([controlanalysis.dendrite.trunk.numberterminations.values]);
    
    rowcolposition{1,6}  = ' ';
    rowcolposition{2,6}  = 'Min';
    rowcolposition{3,6}  = min([controlanalysis.dendrite.trunk.proximaldiameter.values]);
    rowcolposition{4,6}  = min([controlanalysis.dendrite.trunk.cylindricaldiameter.values]);
    rowcolposition{5,6}  = min([controlanalysis.dendrite.trunk.distaldiameter.values]);
    rowcolposition{6,6}  = min([controlanalysis.dendrite.trunk.length.values]);
    rowcolposition{7,6}  = min([controlanalysis.dendrite.trunk.surfacearea.values]);
    rowcolposition{8,6}  = min([controlanalysis.dendrite.trunk.volume.values]);
    rowcolposition{9,6}  = min([controlanalysis.dendrite.trunk.minbranchorder.values]);
    rowcolposition{10,6} = min([controlanalysis.dendrite.trunk.maxbranchorder.values]);
    rowcolposition{11,6} = min([controlanalysis.dendrite.trunk.totallength.values]);
    rowcolposition{12,6} = min([controlanalysis.dendrite.trunk.totalsurfacearea.values]);
    rowcolposition{13,6} = min([controlanalysis.dendrite.trunk.totalvolume.values]);
    rowcolposition{14,6} = min([controlanalysis.dendrite.trunk.numbersegments.values]);
    rowcolposition{15,6} = min([controlanalysis.dendrite.trunk.numberbifurcations.values]);
    rowcolposition{16,6} = min([controlanalysis.dendrite.trunk.numberterminations.values]);
    
    rowcolposition{1,7}  = ' ';
    rowcolposition{2,7}  = 'Max';
    rowcolposition{3,7}  = max([controlanalysis.dendrite.trunk.proximaldiameter.values]);
    rowcolposition{4,7}  = max([controlanalysis.dendrite.trunk.cylindricaldiameter.values]);
    rowcolposition{5,7}  = max([controlanalysis.dendrite.trunk.distaldiameter.values]);
    rowcolposition{6,7}  = max([controlanalysis.dendrite.trunk.length.values]);
    rowcolposition{7,7}  = max([controlanalysis.dendrite.trunk.surfacearea.values]);
    rowcolposition{8,7}  = max([controlanalysis.dendrite.trunk.volume.values]);
    rowcolposition{9,7}  = max([controlanalysis.dendrite.trunk.minbranchorder.values]);
    rowcolposition{10,7} = max([controlanalysis.dendrite.trunk.maxbranchorder.values]);
    rowcolposition{11,7} = max([controlanalysis.dendrite.trunk.totallength.values]);
    rowcolposition{12,7} = max([controlanalysis.dendrite.trunk.totalsurfacearea.values]);
    rowcolposition{13,7} = max([controlanalysis.dendrite.trunk.totalvolume.values]);
    rowcolposition{14,7} = max([controlanalysis.dendrite.trunk.numbersegments.values]);
    rowcolposition{15,7} = max([controlanalysis.dendrite.trunk.numberbifurcations.values]);
    rowcolposition{16,7} = max([controlanalysis.dendrite.trunk.numberterminations.values]);

    
    filename = sprintf('%s_%s',controlanalysis.inputfilename,'primarydendrite_table.csv');
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
    rowcolposition{3,2}  = mean([controlanalysis.dendrite.trunk.proximaldiameter.values]);
    rowcolposition{4,2}  = mean([controlanalysis.dendrite.trunk.cylindricaldiameter.values]);
    rowcolposition{5,2}  = mean([controlanalysis.dendrite.trunk.distaldiameter.values]);
    rowcolposition{6,2}  = mean([controlanalysis.dendrite.trunk.length.values]);
    rowcolposition{7,2}  = mean([controlanalysis.dendrite.trunk.surfacearea.values]);
    rowcolposition{8,2}  = mean([controlanalysis.dendrite.trunk.volume.values]);
    rowcolposition{9,2}  = mean([controlanalysis.dendrite.trunk.minbranchorder.values]);
    rowcolposition{10,2} = mean([controlanalysis.dendrite.trunk.maxbranchorder.values]);
    rowcolposition{11,2} = mean([controlanalysis.dendrite.trunk.totallength.values]);
    rowcolposition{12,2} = mean([controlanalysis.dendrite.trunk.totalsurfacearea.values]);
    rowcolposition{13,2} = mean([controlanalysis.dendrite.trunk.totalvolume.values]);
    rowcolposition{14,2} = mean([controlanalysis.dendrite.trunk.numbersegments.values]);
    rowcolposition{15,2} = mean([controlanalysis.dendrite.trunk.numberbifurcations.values]);
    rowcolposition{16,2} = mean([controlanalysis.dendrite.trunk.numberterminations.values]);

    rowcolposition{1,3}  = ' ';
    rowcolposition{2,3}  = 'STD';
    rowcolposition{3,3}  = std([controlanalysis.dendrite.trunk.proximaldiameter.values]);
    rowcolposition{4,3}  = std([controlanalysis.dendrite.trunk.cylindricaldiameter.values]);
    rowcolposition{5,3}  = std([controlanalysis.dendrite.trunk.distaldiameter.values]);
    rowcolposition{6,3}  = std([controlanalysis.dendrite.trunk.length.values]);
    rowcolposition{7,3}  = std([controlanalysis.dendrite.trunk.surfacearea.values]);
    rowcolposition{8,3}  = std([controlanalysis.dendrite.trunk.volume.values]);
    rowcolposition{9,3}  = std([controlanalysis.dendrite.trunk.minbranchorder.values]);
    rowcolposition{10,3} = std([controlanalysis.dendrite.trunk.maxbranchorder.values]);
    rowcolposition{11,3} = std([controlanalysis.dendrite.trunk.totallength.values]);
    rowcolposition{12,3} = std([controlanalysis.dendrite.trunk.totalsurfacearea.values]);
    rowcolposition{13,3} = std([controlanalysis.dendrite.trunk.totalvolume.values]);
    rowcolposition{14,3} = std([controlanalysis.dendrite.trunk.numbersegments.values]);
    rowcolposition{15,3} = std([controlanalysis.dendrite.trunk.numberbifurcations.values]);
    rowcolposition{16,3} = std([controlanalysis.dendrite.trunk.numberterminations.values]);



    rowcolposition{1,4}  = testanalysis.inputfilename;
    rowcolposition{2,4}  = 'Mean';
    rowcolposition{3,4}  = mean([testanalysis.dendrite.trunk.proximaldiameter.values]);
    rowcolposition{4,4}  = mean([testanalysis.dendrite.trunk.cylindricaldiameter.values]);
    rowcolposition{5,4}  = mean([testanalysis.dendrite.trunk.distaldiameter.values]);
    rowcolposition{6,4}  = mean([testanalysis.dendrite.trunk.length.values]);
    rowcolposition{7,4}  = mean([testanalysis.dendrite.trunk.surfacearea.values]);
    rowcolposition{8,4}  = mean([testanalysis.dendrite.trunk.volume.values]);
    rowcolposition{9,4}  = mean([testanalysis.dendrite.trunk.minbranchorder.values]);
    rowcolposition{10,4} = mean([testanalysis.dendrite.trunk.maxbranchorder.values]);
    rowcolposition{11,4} = mean([testanalysis.dendrite.trunk.totallength.values]);
    rowcolposition{12,4} = mean([testanalysis.dendrite.trunk.totalsurfacearea.values]);
    rowcolposition{13,4} = mean([testanalysis.dendrite.trunk.totalvolume.values]);
    rowcolposition{14,4} = mean([testanalysis.dendrite.trunk.numbersegments.values]);
    rowcolposition{15,4} = mean([testanalysis.dendrite.trunk.numberbifurcations.values]);
    rowcolposition{16,4} = mean([testanalysis.dendrite.trunk.numberterminations.values]);

    rowcolposition{1,5}  = ' ';
    rowcolposition{2,5}  = 'STD';
    rowcolposition{3,5}  = std([testanalysis.dendrite.trunk.proximaldiameter.values]);
    rowcolposition{4,5}  = std([testanalysis.dendrite.trunk.cylindricaldiameter.values]);
    rowcolposition{5,5}  = std([testanalysis.dendrite.trunk.distaldiameter.values]);
    rowcolposition{6,5}  = std([testanalysis.dendrite.trunk.length.values]);
    rowcolposition{7,5}  = std([testanalysis.dendrite.trunk.surfacearea.values]);
    rowcolposition{8,5}  = std([testanalysis.dendrite.trunk.volume.values]);
    rowcolposition{9,5}  = std([testanalysis.dendrite.trunk.minbranchorder.values]);
    rowcolposition{10,5} = std([testanalysis.dendrite.trunk.maxbranchorder.values]);
    rowcolposition{11,5} = std([testanalysis.dendrite.trunk.totallength.values]);
    rowcolposition{12,5} = std([testanalysis.dendrite.trunk.totalsurfacearea.values]);
    rowcolposition{13,5} = std([testanalysis.dendrite.trunk.totalvolume.values]);
    rowcolposition{14,5} = std([testanalysis.dendrite.trunk.numbersegments.values]);
    rowcolposition{15,5} = std([testanalysis.dendrite.trunk.numberbifurcations.values]);
    rowcolposition{16,5} = std([testanalysis.dendrite.trunk.numberterminations.values]);


    proximaldiametermeandiff            = 100*((mean(testanalysis.dendrite.trunk.proximaldiameter.values)-mean(controlanalysis.dendrite.trunk.proximaldiameter.values))/mean(controlanalysis.dendrite.trunk.proximaldiameter.values));
    cylindricaldiametermeandiff         = 100*((mean(testanalysis.dendrite.trunk.cylindricaldiameter.values)-mean(controlanalysis.dendrite.trunk.cylindricaldiameter.values))/mean(controlanalysis.dendrite.trunk.cylindricaldiameter.values));
    distaldiametermeandiff              = 100*((mean(testanalysis.dendrite.trunk.distaldiameter.values)-mean(controlanalysis.dendrite.trunk.distaldiameter.values))/mean(controlanalysis.dendrite.trunk.distaldiameter.values));
    lengthmeandiff                      = 100*((mean(testanalysis.dendrite.trunk.length.values)-mean(controlanalysis.dendrite.trunk.length.values))/mean(controlanalysis.dendrite.trunk.length.values));
    surfaceareameandiff                 = 100*((mean(testanalysis.dendrite.trunk.surfacearea.values)-mean(controlanalysis.dendrite.trunk.surfacearea.values))/mean(controlanalysis.dendrite.trunk.surfacearea.values));
    volumemeandiff                      = 100*((mean(testanalysis.dendrite.trunk.volume.values)-mean(controlanalysis.dendrite.trunk.volume.values))/mean(controlanalysis.dendrite.trunk.volume.values));
    minbranchordermeandiff              = 100*((mean(testanalysis.dendrite.trunk.minbranchorder.values)-mean(controlanalysis.dendrite.trunk.minbranchorder.values))/mean(controlanalysis.dendrite.trunk.minbranchorder.values));
    maxbranchordermeandiff              = 100*((mean(testanalysis.dendrite.trunk.maxbranchorder.values)-mean(controlanalysis.dendrite.trunk.maxbranchorder.values))/mean(controlanalysis.dendrite.trunk.maxbranchorder.values));
    totallengthmeandiff                 = 100*((mean(testanalysis.dendrite.trunk.totallength.values)-mean(controlanalysis.dendrite.trunk.totallength.values))/mean(controlanalysis.dendrite.trunk.totallength.values));
    totalsurfaceareameandiff            = 100*((mean(testanalysis.dendrite.trunk.totalsurfacearea.values)-mean(controlanalysis.dendrite.trunk.totalsurfacearea.values))/mean(controlanalysis.dendrite.trunk.totalsurfacearea.values));
    totalvolumemeandiff                 = 100*((mean(testanalysis.dendrite.trunk.totalvolume.values)-mean(controlanalysis.dendrite.trunk.totalvolume.values))/mean(controlanalysis.dendrite.trunk.totalvolume.values));
    numbersegmentsmeandiff              = 100*((mean(testanalysis.dendrite.trunk.numbersegments.values)-mean(controlanalysis.dendrite.trunk.numbersegments.values))/mean(controlanalysis.dendrite.trunk.numbersegments.values));
    numberbifurcationsmeandiff          = 100*((mean(testanalysis.dendrite.trunk.numberbifurcations.values)-mean(controlanalysis.dendrite.trunk.numberbifurcations.values))/mean(controlanalysis.dendrite.trunk.numberbifurcations.values));
    numberterminationsmeandiff          = 100*((mean(testanalysis.dendrite.trunk.numberterminations.values)-mean(controlanalysis.dendrite.trunk.numberterminations.values))/mean(controlanalysis.dendrite.trunk.numberterminations.values));



    rowcolposition{1,6}  = '% Mean Diff';
    rowcolposition{2,6}  = ' ';
    rowcolposition{3,6}  = proximaldiametermeandiff;
    rowcolposition{4,6}  = cylindricaldiametermeandiff;
    rowcolposition{5,6}  = distaldiametermeandiff;
    rowcolposition{6,6}  = lengthmeandiff;
    rowcolposition{7,6}  = surfaceareameandiff;
    rowcolposition{8,6}  = volumemeandiff;
    rowcolposition{9,6}  = minbranchordermeandiff;
    rowcolposition{10,6} = maxbranchordermeandiff;
    rowcolposition{11,6} = totallengthmeandiff;
    rowcolposition{12,6} = totalsurfaceareameandiff;
    rowcolposition{13,6} = totalvolumemeandiff;
    rowcolposition{14,6} = numbersegmentsmeandiff;
    rowcolposition{15,6} = numberbifurcationsmeandiff;
    rowcolposition{16,6} = numberterminationsmeandiff;



    [proximaldiameterh,proximaldiameterp]             = ttest2(controlanalysis.dendrite.trunk.proximaldiameter.values,testanalysis.dendrite.trunk.proximaldiameter.values);
    [cylindricaldiameterh,cylindricaldiameterp]       = ttest2(controlanalysis.dendrite.trunk.cylindricaldiameter.values,testanalysis.dendrite.trunk.cylindricaldiameter.values);
    [distaldiameterh,distaldiameterp]                 = ttest2(controlanalysis.dendrite.trunk.distaldiameter.values,testanalysis.dendrite.trunk.distaldiameter.values);
    [lengthh,lengthp]                                 = ttest2(controlanalysis.dendrite.trunk.length.values,testanalysis.dendrite.trunk.length.values);
    [surfaceareah,surfaceareap]                       = ttest2(controlanalysis.dendrite.trunk.surfacearea.values,testanalysis.dendrite.trunk.surfacearea.values);
    [volumeh,volumep]                                 = ttest2(controlanalysis.dendrite.trunk.volume.values,testanalysis.dendrite.trunk.volume.values);
    [minbranchorderh,minbranchorderp]                 = ttest2(controlanalysis.dendrite.trunk.minbranchorder.values,testanalysis.dendrite.trunk.minbranchorder.values);
    [maxbranchorderh,maxbranchorderp]                 = ttest2(controlanalysis.dendrite.trunk.maxbranchorder.values,testanalysis.dendrite.trunk.maxbranchorder.values);
    [totallengthh,totallengthp]                       = ttest2(controlanalysis.dendrite.trunk.totallength.values,testanalysis.dendrite.trunk.totallength.values);
    [totalsurfaceareah,totalsurfaceareap]             = ttest2(controlanalysis.dendrite.trunk.totalsurfacearea.values,testanalysis.dendrite.trunk.totalsurfacearea.values);
    [totalvolumeh,totalvolumep]                       = ttest2(controlanalysis.dendrite.trunk.totalvolume.values,testanalysis.dendrite.trunk.totalvolume.values);
    [numbersegmentsh,numbersegmentsp]                 = ttest2(controlanalysis.dendrite.trunk.numbersegments.values,testanalysis.dendrite.trunk.numbersegments.values);
    [numberbifurcationsh,numberbifurcationsp]         = ttest2(controlanalysis.dendrite.trunk.numberbifurcations.values,testanalysis.dendrite.trunk.numberbifurcations.values);
    [numberterminationsh,numberterminationsp]         = ttest2(controlanalysis.dendrite.trunk.numberterminations.values,testanalysis.dendrite.trunk.numberterminations.values);

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

    rowcolposition{1,7}  = 't-test ';
    rowcolposition{2,7}  = 'h';
    rowcolposition{3,7}  = proximaldiameterh;
    rowcolposition{4,7}  = cylindricaldiameterh;
    rowcolposition{5,7}  = distaldiameterh;
    rowcolposition{6,7}  = lengthh;
    rowcolposition{7,7}  = surfaceareah;
    rowcolposition{8,7}  = volumeh;
    rowcolposition{9,7}  = minbranchorderh;
    rowcolposition{10,7} = maxbranchorderh;
    rowcolposition{11,7} = totallengthh;
    rowcolposition{12,7} = totalsurfaceareah;
    rowcolposition{13,7} = totalvolumeh;
    rowcolposition{14,7} = numbersegmentsh;
    rowcolposition{15,7} = numberbifurcationsh;
    rowcolposition{16,7} = numberterminationsh;

    rowcolposition{1,8}  = '(mean)';
    rowcolposition{2,8}  = 'p';
    rowcolposition{3,8}  = proximaldiameterp;
    rowcolposition{4,8}  = cylindricaldiameterp;
    rowcolposition{5,8}  = distaldiameterp;
    rowcolposition{6,8}  = lengthp;
    rowcolposition{7,8}  = surfaceareap;
    rowcolposition{8,8}  = volumep;
    rowcolposition{9,8}  = minbranchorderp;
    rowcolposition{10,8} = maxbranchorderp;
    rowcolposition{11,8} = totallengthp;
    rowcolposition{12,8} = totalsurfaceareap;
    rowcolposition{13,8} = totalvolumep;
    rowcolposition{14,8} = numbersegmentsp;
    rowcolposition{15,8} = numberbifurcationsp;
    rowcolposition{16,8} = numberterminationsp;


    [proximaldiameterp,proximaldiameterh]             = ranksum(controlanalysis.dendrite.trunk.proximaldiameter.values,testanalysis.dendrite.trunk.proximaldiameter.values);
    [cylindricaldiameterp,cylindricaldiameterh]       = ranksum(controlanalysis.dendrite.trunk.cylindricaldiameter.values,testanalysis.dendrite.trunk.cylindricaldiameter.values);
    [distaldiameterp,distaldiameterh]                 = ranksum(controlanalysis.dendrite.trunk.distaldiameter.values,testanalysis.dendrite.trunk.distaldiameter.values);
    [lengthp,lengthh]                                 = ranksum(controlanalysis.dendrite.trunk.length.values,testanalysis.dendrite.trunk.length.values);
    [surfaceareap,surfaceareah]                       = ranksum(controlanalysis.dendrite.trunk.surfacearea.values,testanalysis.dendrite.trunk.surfacearea.values);
    [volumep,volumeh]                                 = ranksum(controlanalysis.dendrite.trunk.volume.values,testanalysis.dendrite.trunk.volume.values);
    [minbranchorderp,minbranchorderh]                 = ranksum(controlanalysis.dendrite.trunk.minbranchorder.values,testanalysis.dendrite.trunk.minbranchorder.values);
    [maxbranchorderp,maxbranchorderh]                 = ranksum(controlanalysis.dendrite.trunk.maxbranchorder.values,testanalysis.dendrite.trunk.maxbranchorder.values);
    [totallengthp,totallengthh]                       = ranksum(controlanalysis.dendrite.trunk.totallength.values,testanalysis.dendrite.trunk.totallength.values);
    [totalsurfaceareap,totalsurfaceareah]             = ranksum(controlanalysis.dendrite.trunk.totalsurfacearea.values,testanalysis.dendrite.trunk.totalsurfacearea.values);
    [totalvolumep,totalvolumeh]                       = ranksum(controlanalysis.dendrite.trunk.totalvolume.values,testanalysis.dendrite.trunk.totalvolume.values);
    [numbersegmentsp,numbersegmentsh]                 = ranksum(controlanalysis.dendrite.trunk.numbersegments.values,testanalysis.dendrite.trunk.numbersegments.values);
    [numberbifurcationsp,numberbifurcationsh]         = ranksum(controlanalysis.dendrite.trunk.numberbifurcations.values,testanalysis.dendrite.trunk.numberbifurcations.values);
    [numberterminationsp,numberterminationsh]         = ranksum(controlanalysis.dendrite.trunk.numberterminations.values,testanalysis.dendrite.trunk.numberterminations.values);

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

    rowcolposition{1,9}  = 'RS-test ';
    rowcolposition{2,9}  = 'h';
    rowcolposition{3,9}  = proximaldiameterh;
    rowcolposition{4,9}  = cylindricaldiameterh;
    rowcolposition{5,9}  = distaldiameterh;
    rowcolposition{6,9}  = lengthh;
    rowcolposition{7,9}  = surfaceareah;
    rowcolposition{8,9}  = volumeh;
    rowcolposition{9,9}  = minbranchorderh;
    rowcolposition{10,9} = maxbranchorderh;
    rowcolposition{11,9} = totallengthh;
    rowcolposition{12,9} = totalsurfaceareah;
    rowcolposition{13,9} = totalvolumeh;
    rowcolposition{14,9} = numbersegmentsh;
    rowcolposition{15,9} = numberbifurcationsh;
    rowcolposition{16,9} = numberterminationsh;

    rowcolposition{1,10}  = '(median)';
    rowcolposition{2,10}  = 'p';
    rowcolposition{3,10}  = proximaldiameterp;
    rowcolposition{4,10}  = cylindricaldiameterp;
    rowcolposition{5,10}  = distaldiameterp;
    rowcolposition{6,10}  = lengthp;
    rowcolposition{7,10}  = surfaceareap;
    rowcolposition{8,10}  = volumep;
    rowcolposition{9,10}  = minbranchorderp;
    rowcolposition{10,10} = maxbranchorderp;
    rowcolposition{11,10} = totallengthp;
    rowcolposition{12,10} = totalsurfaceareap;
    rowcolposition{13,10} = totalvolumep;
    rowcolposition{14,10} = numbersegmentsp;
    rowcolposition{15,10} = numberbifurcationsp;
    rowcolposition{16,10} = numberterminationsp;


    [proximaldiameterh,proximaldiameterp]             = ansaribradley(controlanalysis.dendrite.trunk.proximaldiameter.values,testanalysis.dendrite.trunk.proximaldiameter.values);
    [cylindricaldiameterh,cylindricaldiameterp]       = ansaribradley(controlanalysis.dendrite.trunk.cylindricaldiameter.values,testanalysis.dendrite.trunk.cylindricaldiameter.values);
    [distaldiameterh,distaldiameterp]                 = ansaribradley(controlanalysis.dendrite.trunk.distaldiameter.values,testanalysis.dendrite.trunk.distaldiameter.values);
    [lengthh,lengthp]                                 = ansaribradley(controlanalysis.dendrite.trunk.length.values,testanalysis.dendrite.trunk.length.values);
    [surfaceareah,surfaceareap]                       = ansaribradley(controlanalysis.dendrite.trunk.surfacearea.values,testanalysis.dendrite.trunk.surfacearea.values);
    [volumeh,volumep]                                 = ansaribradley(controlanalysis.dendrite.trunk.volume.values,testanalysis.dendrite.trunk.volume.values);
    [minbranchorderh,minbranchorderp]                 = ansaribradley(controlanalysis.dendrite.trunk.minbranchorder.values,testanalysis.dendrite.trunk.minbranchorder.values);
    [maxbranchorderh,maxbranchorderp]                 = ansaribradley(controlanalysis.dendrite.trunk.maxbranchorder.values,testanalysis.dendrite.trunk.maxbranchorder.values);
    [totallengthh,totallengthp]                       = ansaribradley(controlanalysis.dendrite.trunk.totallength.values,testanalysis.dendrite.trunk.totallength.values);
    [totalsurfaceareah,totalsurfaceareap]             = ansaribradley(controlanalysis.dendrite.trunk.totalsurfacearea.values,testanalysis.dendrite.trunk.totalsurfacearea.values);
    [totalvolumeh,totalvolumep]                       = ansaribradley(controlanalysis.dendrite.trunk.totalvolume.values,testanalysis.dendrite.trunk.totalvolume.values);
    [numbersegmentsh,numbersegmentsp]                 = ansaribradley(controlanalysis.dendrite.trunk.numbersegments.values,testanalysis.dendrite.trunk.numbersegments.values);
    [numberbifurcationsh,numberbifurcationsp]         = ansaribradley(controlanalysis.dendrite.trunk.numberbifurcations.values,testanalysis.dendrite.trunk.numberbifurcations.values);
    [numberterminationsh,numberterminationsp]         = ansaribradley(controlanalysis.dendrite.trunk.numberterminations.values,testanalysis.dendrite.trunk.numberterminations.values);

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

    rowcolposition{1,11}  = 'AB-test ';
    rowcolposition{2,11}  = 'h';
    rowcolposition{3,11}  = proximaldiameterh;
    rowcolposition{4,11}  = cylindricaldiameterh;
    rowcolposition{5,11}  = distaldiameterh;
    rowcolposition{6,11}  = lengthh;
    rowcolposition{7,11}  = surfaceareah;
    rowcolposition{8,11}  = volumeh;
    rowcolposition{9,11}  = minbranchorderh;
    rowcolposition{10,11} = maxbranchorderh;
    rowcolposition{11,11} = totallengthh;
    rowcolposition{12,11} = totalsurfaceareah;
    rowcolposition{13,11} = totalvolumeh;
    rowcolposition{14,11} = numbersegmentsh;
    rowcolposition{15,11} = numberbifurcationsh;
    rowcolposition{16,11} = numberterminationsh;

    rowcolposition{1,12}  = '(variability) ';
    rowcolposition{2,12}  = 'p';
    rowcolposition{3,12}  = proximaldiameterp;
    rowcolposition{4,12}  = cylindricaldiameterp;
    rowcolposition{5,12}  = distaldiameterp;
    rowcolposition{6,12}  = lengthp;
    rowcolposition{7,12}  = surfaceareap;
    rowcolposition{8,12}  = volumep;
    rowcolposition{9,12}  = minbranchorderp;
    rowcolposition{10,12} = maxbranchorderp;
    rowcolposition{11,12} = totallengthp;
    rowcolposition{12,12} = totalsurfaceareap;
    rowcolposition{13,12} = totalvolumep;
    rowcolposition{14,12} = numbersegmentsp;
    rowcolposition{15,12} = numberbifurcationsp;
    rowcolposition{16,12} = numberterminationsp;


    [proximaldiameterh,proximaldiameterp]             = kstest2(controlanalysis.dendrite.trunk.proximaldiameter.values,testanalysis.dendrite.trunk.proximaldiameter.values);
    [cylindricaldiameterh,cylindricaldiameterp]       = kstest2(controlanalysis.dendrite.trunk.cylindricaldiameter.values,testanalysis.dendrite.trunk.cylindricaldiameter.values);
    [distaldiameterh,distaldiameterp]                 = kstest2(controlanalysis.dendrite.trunk.distaldiameter.values,testanalysis.dendrite.trunk.distaldiameter.values);
    [lengthh,lengthp]                                 = kstest2(controlanalysis.dendrite.trunk.length.values,testanalysis.dendrite.trunk.length.values);
    [surfaceareah,surfaceareap]                       = kstest2(controlanalysis.dendrite.trunk.surfacearea.values,testanalysis.dendrite.trunk.surfacearea.values);
    [volumeh,volumep]                                 = kstest2(controlanalysis.dendrite.trunk.volume.values,testanalysis.dendrite.trunk.volume.values);
    [minbranchorderh,minbranchorderp]                 = kstest2(controlanalysis.dendrite.trunk.minbranchorder.values,testanalysis.dendrite.trunk.minbranchorder.values);
    [maxbranchorderh,maxbranchorderp]                 = kstest2(controlanalysis.dendrite.trunk.maxbranchorder.values,testanalysis.dendrite.trunk.maxbranchorder.values);
    [totallengthh,totallengthp]                       = kstest2(controlanalysis.dendrite.trunk.totallength.values,testanalysis.dendrite.trunk.totallength.values);
    [totalsurfaceareah,totalsurfaceareap]             = kstest2(controlanalysis.dendrite.trunk.totalsurfacearea.values,testanalysis.dendrite.trunk.totalsurfacearea.values);
    [totalvolumeh,totalvolumep]                       = kstest2(controlanalysis.dendrite.trunk.totalvolume.values,testanalysis.dendrite.trunk.totalvolume.values);
    [numbersegmentsh,numbersegmentsp]                 = kstest2(controlanalysis.dendrite.trunk.numbersegments.values,testanalysis.dendrite.trunk.numbersegments.values);
    [numberbifurcationsh,numberbifurcationsp]         = kstest2(controlanalysis.dendrite.trunk.numberbifurcations.values,testanalysis.dendrite.trunk.numberbifurcations.values);
    [numberterminationsh,numberterminationsp]         = kstest2(controlanalysis.dendrite.trunk.numberterminations.values,testanalysis.dendrite.trunk.numberterminations.values);

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

    rowcolposition{1,13}  = 'KS-test ';
    rowcolposition{2,13}  = 'h';
    rowcolposition{3,13}  = proximaldiameterh;
    rowcolposition{4,13}  = cylindricaldiameterh;
    rowcolposition{5,13}  = distaldiameterh;
    rowcolposition{6,13}  = lengthh;
    rowcolposition{7,13}  = surfaceareah;
    rowcolposition{8,13}  = volumeh;
    rowcolposition{9,13}  = minbranchorderh;
    rowcolposition{10,13} = maxbranchorderh;
    rowcolposition{11,13} = totallengthh;
    rowcolposition{12,13} = totalsurfaceareah;
    rowcolposition{13,13} = totalvolumeh;
    rowcolposition{14,13} = numbersegmentsh;
    rowcolposition{15,13} = numberbifurcationsh;
    rowcolposition{16,13} = numberterminationsh;

    rowcolposition{1,14}  = '(mean + var)';
    rowcolposition{2,14}  = 'p';
    rowcolposition{3,14}  = proximaldiameterp;
    rowcolposition{4,14}  = cylindricaldiameterp;
    rowcolposition{5,14}  = distaldiameterp;
    rowcolposition{6,14}  = lengthp;
    rowcolposition{7,14}  = surfaceareap;
    rowcolposition{8,14}  = volumep;
    rowcolposition{9,14}  = minbranchorderp;
    rowcolposition{10,14} = maxbranchorderp;
    rowcolposition{11,14} = totallengthp;
    rowcolposition{12,14} = totalsurfaceareap;
    rowcolposition{13,14} = totalvolumep;
    rowcolposition{14,14} = numbersegmentsp;
    rowcolposition{15,14} = numberbifurcationsp;
    rowcolposition{16,14} = numberterminationsp;



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
    
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'primarydendrite_comparison_table.csv');
    cell2csv(filename,rowcolposition);
    cd(currentdirectory);

end



warning('on', 'MATLAB:divideByZero');