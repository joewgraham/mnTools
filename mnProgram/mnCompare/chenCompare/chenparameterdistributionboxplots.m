function chenparameterdistributionboxplots(controlanalysis,testanalysis)
% Parameter Distribution Comparison Box Plots

labelfontsize = 12;

figure;

subplot(3,3,1); box on; hold on;
label='Soma Diameter (\mum)';
names=strvcat('Control','Comparison');
controldata = controlanalysis.somadiameter.values;
comparisondata = testanalysis.somadiameter.values;
boxplots(boxprep(controldata,comparisondata),names,label,1);
hold off;


subplot(3,3,4); box on; hold on;
label='Number PDs';
names=strvcat('Control','Comparison');
controldata = controlanalysis.numberprimarydendrites.values;
comparisondata = testanalysis.numberprimarydendrites.values;
boxplots(boxprep(controldata,comparisondata),names,label,1);
hold off;

subplot(3,3,7); box on; hold on;
label='Number Segs';
names=strvcat('Control','Comparison');
controldata = controlanalysis.numbersegments.values;
comparisondata = testanalysis.numbersegments.values;
boxplots(boxprep(controldata,comparisondata),names,label,1);
hold off;

subplot(3,3,2); box on; hold on;
label='Total Length (10^3 \mum)';
names=strvcat('Control','Comparison');
controldata = controlanalysis.totallength.values;
comparisondata = testanalysis.totallength.values/1000;
boxplots(boxprep(controldata,comparisondata),names,label,1);
hold off;

subplot(3,3,5); box on; hold on;
label='Total SA (10^3 \mum^2)';
names=strvcat('Control','Comparison');
controldata = controlanalysis.totalsurfacearea.values;
comparisondata = testanalysis.totalsurfacearea.values/1000;
boxplots(boxprep(controldata,comparisondata),names,label,1);
hold off;

subplot(3,3,8); box on; hold on;
label='Total Volume (10^3 \mum^3)';
names=strvcat('Control','Comparison');
controldata = controlanalysis.totalvolume.values;
comparisondata = testanalysis.totalvolume.values/1000;
boxplots(boxprep(controldata,comparisondata),names,label,1);
hold off;

subplot(3,3,3); box on; hold on;
label='PD Tot Cyl Diam (\mum)';
names=strvcat('Control','Comparison');
controldata = [controlanalysis.numberprimarydendrites.values].*[controlanalysis.primarydendrite.meancylindricaldiameter.values];
comparisondata = [testanalysis.numberprimarydendrites.values].*[testanalysis.primarydendrite.meancylindricaldiameter.values];
boxplots(boxprep(controldata,comparisondata),names,label,1);
hold off;

subplot(3,3,6); box on; hold on;
label='PD Mean Cyl Diam (\mum)';
names=strvcat('Control','Comparison');
controldata = controlanalysis.primarydendrite.cylindricaldiameter.values;
comparisondata = testanalysis.primarydendrite.cylindricaldiameter.values;
boxplots(boxprep(controldata,comparisondata),names,label,1);
hold off;

subplot(3,3,9); box on; hold on;
label='Max Branch Order';
names=strvcat('Control','Comparison');
controldata = controlanalysis.maxbranchorder.values;
comparisondata = testanalysis.maxbranchorder.values;
boxplots(boxprep(controldata,comparisondata),names,label,1);
hold off;


subplotspace('horizontal',-20);
subplotspace('vertical',-20);

%[ax,h2]=suplabel('Number of Motoneurons','y');
[ax,h3]=suplabel('Box Plot Comparison of Population Parameter Distributions'  ,'t');
%set(h2,'FontSize',15);
set(h3,'FontSize',20);


currentdirectory = cd;
cd(testanalysis.datapathname);
%cd ..

if exist(sprintf('%s_comparison',controlanalysis.inputfilename),'dir')==7;
    cd(sprintf('%s_comparison',controlanalysis.inputfilename));
else
    mkdir(sprintf('%s_comparison',controlanalysis.inputfilename));
    cd(sprintf('%s_comparison',controlanalysis.inputfilename));
end

if exist('figures','dir')==7
    cd('figures');
else
    mkdir('figures');
    cd('figures');
end

fillscreen;

filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'Parameter_Distribution_Comparison_Boxplots');
print('-dmeta',filename);
saveas(gcf,filename,'fig');

cd(currentdirectory);


 
 
 
 
 
 
 
 