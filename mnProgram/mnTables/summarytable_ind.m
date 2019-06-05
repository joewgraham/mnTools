function summarytable_ind(analysis)

warning('off', 'MATLAB:divideByZero');

currentdirectory = cd;
cd(analysis.datapathname);

if exist('tables','dir')==7
    cd('tables');
else
    mkdir('tables');
    cd('tables');
end

filename = sprintf('%s_%s',analysis.inputfilename,'ind_summary_table.csv');

for i = 1:length(analysis.somadiameter.values)    
    tableleftlabels{i} = sprintf('%0.0f',i);
end

somadiameters = [analysis.somadiameter.values];
somadiameters = [somadiameters mean(somadiameters) std(somadiameters) skewness(somadiameters) kurtosis(somadiameters) min(somadiameters) max(somadiameters)]';
numberprimarydendrites = [analysis.numberprimarydendrites.values];
numberprimarydendrites = [numberprimarydendrites mean(numberprimarydendrites) std(numberprimarydendrites) skewness(numberprimarydendrites) kurtosis(numberprimarydendrites) min(numberprimarydendrites) max(numberprimarydendrites)]';
primarydendritemeanproximaldiameter = [analysis.primarydendrite.meanproximaldiameter.values];
primarydendritemeanproximaldiameter = [primarydendritemeanproximaldiameter mean(primarydendritemeanproximaldiameter) std(primarydendritemeanproximaldiameter) skewness(primarydendritemeanproximaldiameter) kurtosis(primarydendritemeanproximaldiameter) min(primarydendritemeanproximaldiameter) max(primarydendritemeanproximaldiameter)]';
primarydendritemeancylindricaldiameter = [analysis.primarydendrite.meancylindricaldiameter.values]; 
primarydendritemeancylindricaldiameter = [primarydendritemeancylindricaldiameter mean(primarydendritemeancylindricaldiameter) std(primarydendritemeancylindricaldiameter) skewness(primarydendritemeancylindricaldiameter) kurtosis(primarydendritemeancylindricaldiameter) min(primarydendritemeancylindricaldiameter) max(primarydendritemeancylindricaldiameter)]';
totaldendriticlength = [analysis.totallength.values];
totaldendriticlength = [totaldendriticlength mean(totaldendriticlength) std(totaldendriticlength) skewness(totaldendriticlength) kurtosis(totaldendriticlength) min(totaldendriticlength) max(totaldendriticlength)]';
totaldendriticsurfacearea = [analysis.totalsurfacearea.values];
totaldendriticsurfacearea = [totaldendriticsurfacearea mean(totaldendriticsurfacearea) std(totaldendriticsurfacearea) skewness(totaldendriticsurfacearea) kurtosis(totaldendriticsurfacearea) min(totaldendriticsurfacearea) max(totaldendriticsurfacearea)]';
totaldendriticvolume = [analysis.totalvolume.values];
totaldendriticvolume = [totaldendriticvolume mean(totaldendriticvolume) std(totaldendriticvolume) skewness(totaldendriticvolume) kurtosis(totaldendriticvolume) min(totaldendriticvolume) max(totaldendriticvolume)]';
numbersegments = [analysis.numbersegments.values];
numbersegments = [numbersegments mean(numbersegments) std(numbersegments) skewness(numbersegments) kurtosis(numbersegments) min(numbersegments) max(numbersegments)]';
numberbifurcations = [analysis.numberbifurcations.values];
numberbifurcations = [numberbifurcations mean(numberbifurcations) std(numberbifurcations) skewness(numberbifurcations) kurtosis(numberbifurcations) min(numberbifurcations) max(numberbifurcations)]';
numberterminations = [analysis.numberterminations.values];
numberterminations = [numberterminations mean(numberterminations) std(numberterminations) skewness(numberterminations) kurtosis(numberterminations) min(numberterminations) max(numberterminations)]';
maxbranchorder = [analysis.maxbranchorder.values];    
maxbranchorder = [maxbranchorder mean(maxbranchorder) std(maxbranchorder) skewness(maxbranchorder) kurtosis(maxbranchorder) min(maxbranchorder) max(maxbranchorder)]';

tableheadlabels{1} = 'Neuron #';
tableheadlabels{2} = 'Soma Diameter';
tableheadlabels{3} = '# Primary Dendrites';
tableheadlabels{4} = 'PD Mean Prox Diam';
tableheadlabels{5} = 'PD Mean Cyl Diam';
tableheadlabels{6} = 'Tot Dend Length';
tableheadlabels{7} = 'Tot Dend SA';
tableheadlabels{8} = 'Tot Dend Vol';
tableheadlabels{9} = '# Segments';
tableheadlabels{10} = '# Bifurcations';
tableheadlabels{11} = '# Terminations';
tableheadlabels{12} = 'Max Branch Order';


tableleftlabels{i+1} = 'Mean';
tableleftlabels{i+2} = 'StDv';
tableleftlabels{i+3} = 'Skew';
tableleftlabels{i+4} = 'Kurt';
tableleftlabels{i+5} = 'Min';
tableleftlabels{i+6} = 'Max';

tableleftlabels = tableleftlabels';
table = [somadiameters numberprimarydendrites primarydendritemeanproximaldiameter primarydendritemeancylindricaldiameter totaldendriticlength totaldendriticsurfacearea totaldendriticvolume numbersegments numberbifurcations numberterminations maxbranchorder];

tablesize = size(table);
tablecell = cell(size(table));
for i = 1:tablesize(1)
    for j = 1:tablesize(2)
        tablecell(i,j) = {table(i,j)};
    end
end

table = horzcat(tableleftlabels,tablecell);
table = [tableheadlabels ; table]';

%xlswrite(filename,table);
cell2csv(filename,table);

cd(currentdirectory);

warning('on', 'MATLAB:divideByZero');