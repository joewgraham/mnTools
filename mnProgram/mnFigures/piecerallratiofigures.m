function piecerallratiofigures(controlanalysis,testanalysis)

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
controlrallratio1 = [controlanalysis.bifurcation.cable.rallratio1.values];
controlrallratio1 = controlrallratio1(controlindex);
controlrallratio  = [controlanalysis.bifurcation.cable.rallratio.values];
controlrallratio  = controlrallratio(controlindex);
controlrallratio2 = [controlanalysis.bifurcation.cable.rallratio2.values];
controlrallratio2 = controlrallratio2(controlindex);
controlrallratio3 = [controlanalysis.bifurcation.cable.rallratio3.values];
controlrallratio3 = controlrallratio3(controlindex);

[testdiameter,testindex] = sort([testanalysis.bifurcation.cable.distaldiameter.values]);
testrallratio1 = [testanalysis.bifurcation.cable.rallratio1.values];
testrallratio1 = testrallratio1(testindex);
testrallratio  = [testanalysis.bifurcation.cable.rallratio.values];
testrallratio  = testrallratio(testindex);
testrallratio2 = [testanalysis.bifurcation.cable.rallratio2.values];
testrallratio2 = testrallratio2(testindex);
testrallratio3 = [testanalysis.bifurcation.cable.rallratio3.values];
testrallratio3 = testrallratio3(testindex);


figure;
plot(controldiameter,controlrallratio1,'bo','MarkerSize',5,'MarkerFaceColor','b');
hold on;
plot(testdiameter,testrallratio1,'rd','MarkerSize',5); %,'MarkerFaceColor','r');
legendhandle = gca;
xlabel('Proximal Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
ylabel('Rall Ratio (D^{1.0})','FontSize',labelfontsize,'FontWeight','b');
set(gca,'FontSize',axesfontsize);
[ax,h3]=suplabel('Rall Ratio (D^{1.0}) versus Local Diameter'  ,'t');
set(h3,'FontSize',titlefontsize);
legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
legend('boxoff');
filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'RallRatio_10_Diam');
print('-djpeg',filename);

figure;
plot(controldiameter,controlrallratio,'bo','MarkerSize',5,'MarkerFaceColor','b');
hold on;
plot(testdiameter,testrallratio,'rd','MarkerSize',5); %,'MarkerFaceColor','r');
legendhandle = gca;
xlabel('Proximal Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
ylabel('Rall Ratio (D^{1.5})','FontSize',labelfontsize,'FontWeight','b');
set(gca,'FontSize',axesfontsize);
[ax,h3]=suplabel('Rall Ratio (D^{1.5}) versus Local Diameter'  ,'t');
set(h3,'FontSize',titlefontsize);
legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
legend('boxoff');
filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'RallRatio_15_Diam');
print('-djpeg',filename);

figure;
plot(controldiameter,controlrallratio2,'bo','MarkerSize',5,'MarkerFaceColor','b');
hold on;
plot(testdiameter,testrallratio2,'rd','MarkerSize',5); %,'MarkerFaceColor','r');
legendhandle = gca;
xlabel('Proximal Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
ylabel('Rall Ratio (D^{2.0})','FontSize',labelfontsize,'FontWeight','b');
set(gca,'FontSize',axesfontsize);
[ax,h3]=suplabel('Rall Ratio (D^{2.0}) versus Local Diameter'  ,'t');
set(h3,'FontSize',titlefontsize);
legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
legend('boxoff');
filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'RallRatio_20_Diam');
print('-djpeg',filename);

figure;
plot(controldiameter,controlrallratio3,'bo','MarkerSize',5,'MarkerFaceColor','b');
alpha(0.5);
hold on;
plot(testdiameter,testrallratio3,'rd','MarkerSize',5); %,'MarkerFaceColor','r');
legendhandle = gca;
xlabel('Proximal Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
ylabel('Rall Ratio (D^{3.0})','FontSize',labelfontsize,'FontWeight','b');
set(gca,'FontSize',axesfontsize);
[ax,h3]=suplabel('Rall Ratio (D^{3.0}) versus Local Diameter'  ,'t');
set(h3,'FontSize',titlefontsize);
legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
legend('boxoff');
filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'RallRatio_30_Diam');
print('-djpeg',filename);











[controlpathlength,controlindex] = sort([controlanalysis.bifurcation.cable.distalpathlength.values]);
controlrallratio1 = [controlanalysis.bifurcation.cable.rallratio1.values];
controlrallratio1 = controlrallratio1(controlindex);
controlrallratio  = [controlanalysis.bifurcation.cable.rallratio.values];
controlrallratio  = controlrallratio(controlindex);
controlrallratio2 = [controlanalysis.bifurcation.cable.rallratio2.values];
controlrallratio2 = controlrallratio2(controlindex);
controlrallratio3 = [controlanalysis.bifurcation.cable.rallratio3.values];
controlrallratio3 = controlrallratio3(controlindex);

[testpathlength,testindex] = sort([testanalysis.bifurcation.cable.distalpathlength.values]);
testrallratio1 = [testanalysis.bifurcation.cable.rallratio1.values];
testrallratio1 = testrallratio1(testindex);
testrallratio  = [testanalysis.bifurcation.cable.rallratio.values];
testrallratio  = testrallratio(testindex);
testrallratio2 = [testanalysis.bifurcation.cable.rallratio2.values];
testrallratio2 = testrallratio2(testindex);
testrallratio3 = [testanalysis.bifurcation.cable.rallratio3.values];
testrallratio3 = testrallratio3(testindex);


figure;
plot(controlpathlength,controlrallratio1,'bo','MarkerSize',5,'MarkerFaceColor','b');
hold on;
plot(testpathlength,testrallratio1,'rd','MarkerSize',5); %,'MarkerFaceColor','r');
legendhandle = gca;
xlabel('Proximal Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
ylabel('Rall Ratio (D^{1.0})','FontSize',labelfontsize,'FontWeight','b');
set(gca,'FontSize',axesfontsize);
[ax,h3]=suplabel('Rall Ratio (D^{1.0}) versus Local Path Length'  ,'t');
set(h3,'FontSize',titlefontsize);
legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
legend('boxoff');
filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'RallRatio_10_Path');
print('-djpeg',filename);

figure;
plot(controlpathlength,controlrallratio,'bo','MarkerSize',5,'MarkerFaceColor','b');
hold on;
plot(testpathlength,testrallratio,'rd','MarkerSize',5); %,'MarkerFaceColor','r');
legendhandle = gca;
xlabel('Proximal Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
ylabel('Rall Ratio (D^{1.5})','FontSize',labelfontsize,'FontWeight','b');
set(gca,'FontSize',axesfontsize);
[ax,h3]=suplabel('Rall Ratio (D^{1.5}) versus Local Path Length'  ,'t');
set(h3,'FontSize',titlefontsize);
legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
legend('boxoff');
filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'RallRatio_15_Path');
print('-djpeg',filename);

figure;
plot(controlpathlength,controlrallratio2,'bo','MarkerSize',5,'MarkerFaceColor','b');
hold on;
plot(testpathlength,testrallratio2,'rd','MarkerSize',5); %,'MarkerFaceColor','r');
legendhandle = gca;
xlabel('Proximal Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
ylabel('Rall Ratio (D^{2.0})','FontSize',labelfontsize,'FontWeight','b');
set(gca,'FontSize',axesfontsize);
[ax,h3]=suplabel('Rall Ratio (D^{2.0}) versus Local Path Length'  ,'t');
set(h3,'FontSize',titlefontsize);
legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
legend('boxoff');
filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'RallRatio_20_Path');
print('-djpeg',filename);

figure;
plot(controlpathlength,controlrallratio3,'bo','MarkerSize',5,'MarkerFaceColor','b');
alpha(0.5);
hold on;
plot(testpathlength,testrallratio3,'rd','MarkerSize',5); %,'MarkerFaceColor','r');
legendhandle = gca;
xlabel('Proximal Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
ylabel('Rall Ratio (D^{3.0})','FontSize',labelfontsize,'FontWeight','b');
set(gca,'FontSize',axesfontsize);
[ax,h3]=suplabel('Rall Ratio (D^{3.0}) versus Local Path Length'  ,'t');
set(h3,'FontSize',titlefontsize);
legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
legend('boxoff');
filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'RallRatio_30_Path');
print('-djpeg',filename);














[controldegree,controlindex] = sort([controlanalysis.bifurcation.cable.degree.values]);
controlrallratio1 = [controlanalysis.bifurcation.cable.rallratio1.values];
controlrallratio1 = controlrallratio1(controlindex);
controlrallratio  = [controlanalysis.bifurcation.cable.rallratio.values];
controlrallratio  = controlrallratio(controlindex);
controlrallratio2 = [controlanalysis.bifurcation.cable.rallratio2.values];
controlrallratio2 = controlrallratio2(controlindex);
controlrallratio3 = [controlanalysis.bifurcation.cable.rallratio3.values];
controlrallratio3 = controlrallratio3(controlindex);

[testdegree,testindex] = sort([testanalysis.bifurcation.cable.degree.values]);
testrallratio1 = [testanalysis.bifurcation.cable.rallratio1.values];
testrallratio1 = testrallratio1(testindex);
testrallratio  = [testanalysis.bifurcation.cable.rallratio.values];
testrallratio  = testrallratio(testindex);
testrallratio2 = [testanalysis.bifurcation.cable.rallratio2.values];
testrallratio2 = testrallratio2(testindex);
testrallratio3 = [testanalysis.bifurcation.cable.rallratio3.values];
testrallratio3 = testrallratio3(testindex);


figure;
plot(controldegree,controlrallratio1,'bo','MarkerSize',5,'MarkerFaceColor','b');
hold on;
plot(testdegree,testrallratio1,'rd','MarkerSize',5); %,'MarkerFaceColor','r');
legendhandle = gca;
xlabel('Degree','FontSize',labelfontsize,'FontWeight','b');
ylabel('Rall Ratio (D^{1.0})','FontSize',labelfontsize,'FontWeight','b');
set(gca,'FontSize',axesfontsize);
[ax,h3]=suplabel('Rall Ratio (D^{1.0}) versus Degree'  ,'t');
set(h3,'FontSize',titlefontsize);
legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
legend('boxoff');
filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'RallRatio_10_Degree');
print('-djpeg',filename);

figure;
plot(controldegree,controlrallratio,'bo','MarkerSize',5,'MarkerFaceColor','b');
hold on;
plot(testdegree,testrallratio,'rd','MarkerSize',5); %,'MarkerFaceColor','r');
legendhandle = gca;
xlabel('Degree','FontSize',labelfontsize,'FontWeight','b');
ylabel('Rall Ratio (D^{1.5})','FontSize',labelfontsize,'FontWeight','b');
set(gca,'FontSize',axesfontsize);
[ax,h3]=suplabel('Rall Ratio (D^{1.5}) versus Degree'  ,'t');
set(h3,'FontSize',titlefontsize);
legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
legend('boxoff');
filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'RallRatio_15_Degree');
print('-djpeg',filename);

figure;
plot(controldegree,controlrallratio2,'bo','MarkerSize',5,'MarkerFaceColor','b');
hold on;
plot(testdegree,testrallratio2,'rd','MarkerSize',5); %,'MarkerFaceColor','r');
legendhandle = gca;
xlabel('Degree','FontSize',labelfontsize,'FontWeight','b');
ylabel('Rall Ratio (D^{2.0})','FontSize',labelfontsize,'FontWeight','b');
set(gca,'FontSize',axesfontsize);
[ax,h3]=suplabel('Rall Ratio (D^{2.0}) versus Degree'  ,'t');
set(h3,'FontSize',titlefontsize);
legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
legend('boxoff');
filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'RallRatio_20_Degree');
print('-djpeg',filename);

figure;
plot(controldegree,controlrallratio3,'bo','MarkerSize',5,'MarkerFaceColor','b');
alpha(0.5);
hold on;
plot(testdegree,testrallratio3,'rd','MarkerSize',5); %,'MarkerFaceColor','r');
legendhandle = gca;
xlabel('Degree','FontSize',labelfontsize,'FontWeight','b');
ylabel('Rall Ratio (D^{3.0})','FontSize',labelfontsize,'FontWeight','b');
set(gca,'FontSize',axesfontsize);
[ax,h3]=suplabel('Rall Ratio (D^{3.0}) versus Degree'  ,'t');
set(h3,'FontSize',titlefontsize);
legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
legend('boxoff');
filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'RallRatio_30_Degree');
print('-djpeg',filename);



