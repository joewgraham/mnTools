function piecedaughterratiofigures(controlanalysis,testanalysis)

titlefontsize = 14;
labelfontsize = 7;
axesfontsize  = 5;
insetfontsize = 5;

cd(controlanalysis.datapathname);
cd ..

if exist(sprintf('%s_%s_comparison',controlanalysis.inputfilename,testanalysis.inputfilename),'dir')==7;
	cd(sprintf('%s_%s_comparison',controlanalysis.inputfilename,testanalysis.inputfilename));
else
	mkdir(sprintf('%s_%s_comparison',controlanalysis.inputfilename,testanalysis.inputfilename));
	cd(sprintf('%s_%s_comparison',controlanalysis.inputfilename,testanalysis.inputfilename));
end

if exist('comparisonfigures','dir')==7
	cd('comparisonfigures');
else
	mkdir('comparisonfigures');
	cd('comparisonfigures');
end


[controldiameter,controlindex] = sort([controlanalysis.bifurcation.cable.distaldiameter.values]);
controldaughterratio  = [controlanalysis.bifurcation.cable.daughterratio.values];
controldaughterratio  = controldaughterratio(controlindex);
controlrallratio      = [controlanalysis.bifurcation.cable.rallratio.values];
controlrallratio      = controlrallratio(controlindex);

[testdiameter,testindex] = sort([testanalysis.bifurcation.cable.distaldiameter.values]);
testdaughterratio  = [testanalysis.bifurcation.cable.daughterratio.values];
testdaughterratio  = testdaughterratio(testindex);
testrallratio      = [testanalysis.bifurcation.cable.rallratio.values];
testrallratio      = testrallratio(testindex);


figure;
plot(controldiameter,controldaughterratio,'bo','MarkerSize',5,'MarkerFaceColor','b');
hold on;
plot(testdiameter,testdaughterratio,'rd','MarkerSize',5); %,'MarkerFaceColor','r');
legendhandle = gca;
xlabel('Proximal Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
ylabel('Daughter Ratio','FontSize',labelfontsize,'FontWeight','b');
set(gca,'FontSize',axesfontsize);
[ax,h3]=suplabel('Daughter Ratio versus Local Diameter'  ,'t');
set(h3,'FontSize',titlefontsize);
legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
legend('boxoff');
filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'DaughterRatio_Diam');
print('-djpeg',filename);







[controlpathlength,controlindex] = sort([controlanalysis.bifurcation.cable.distalpathlength.values]);
controldaughterratio  = [controlanalysis.bifurcation.cable.daughterratio.values];
controldaughterratio  = controldaughterratio(controlindex);

[testpathlength,testindex] = sort([testanalysis.bifurcation.cable.distalpathlength.values]);
testdaughterratio  = [testanalysis.bifurcation.cable.daughterratio.values];
testdaughterratio  = testdaughterratio(testindex);


figure;
plot(controlpathlength,controldaughterratio,'bo','MarkerSize',5,'MarkerFaceColor','b');
hold on;
plot(testpathlength,testdaughterratio,'rd','MarkerSize',5); %,'MarkerFaceColor','r');
legendhandle = gca;
xlabel('Proximal Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
ylabel('Daughter Ratio','FontSize',labelfontsize,'FontWeight','b');
set(gca,'FontSize',axesfontsize);
[ax,h3]=suplabel('Daughter Ratio versus Local Path Length'  ,'t');
set(h3,'FontSize',titlefontsize);
legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
legend('boxoff');
filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'DaughterRatio_Path');
print('-djpeg',filename);









[controldegree,controlindex] = sort([controlanalysis.bifurcation.cable.degree.values]);
controldaughterratio  = [controlanalysis.bifurcation.cable.daughterratio.values];
controldaughterratio  = controldaughterratio(controlindex);

[testdegree,testindex] = sort([testanalysis.bifurcation.cable.degree.values]);
testdaughterratio  = [testanalysis.bifurcation.cable.daughterratio.values];
testdaughterratio  = testdaughterratio(testindex);


figure;
plot(controldegree,controldaughterratio,'bo','MarkerSize',5,'MarkerFaceColor','b');
hold on;
plot(testdegree,testdaughterratio,'rd','MarkerSize',5); %,'MarkerFaceColor','r');
legendhandle = gca;
xlabel('Degree (\mum)','FontSize',labelfontsize,'FontWeight','b');
ylabel('Daughter Ratio','FontSize',labelfontsize,'FontWeight','b');
set(gca,'FontSize',axesfontsize);
[ax,h3]=suplabel('Daughter Ratio versus Degree'  ,'t');
set(h3,'FontSize',titlefontsize);
legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
legend('boxoff');
filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'DaughterRatio_Degree');
print('-djpeg',filename);







figure;
plot(controlrallratio,controldaughterratio,'bo','MarkerSize',5,'MarkerFaceColor','b');
hold on;
plot(testrallratio,testdaughterratio,'rd','MarkerSize',5); %,'MarkerFaceColor','r');
legendhandle = gca;
xlabel('Rall Ratio (D^{1.5})','FontSize',labelfontsize,'FontWeight','b');
ylabel('Daughter Ratio','FontSize',labelfontsize,'FontWeight','b');
set(gca,'FontSize',axesfontsize);
[ax,h3]=suplabel('Daughter Ratio versus Rall Ratio (D^{1.5})'  ,'t');
set(h3,'FontSize',titlefontsize);
legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
legend('boxoff');
filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'DaughterRatio_Rall');
print('-djpeg',filename);

