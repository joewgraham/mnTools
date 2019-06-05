function basicparametervdiameterfigures_multi(bipolaranalysis,purkinjeanalysis,martinottianalysis)
% Bif/term diameter figures

titlefontsize = 8;
labelfontsize = 7;
axesfontsize  = 5;
insetfontsize = 5;

greenmarkersize   = 5;
yellowmarkersize  = 5;
redmarkersize     = 4;
magentamarkersize = 3;

figure;

bipolarbifx    = [bipolaranalysis.bifurcation.diameter.diameter];
bipolarbify    = [bipolaranalysis.bifurcation.diameter.taperrate.mean];
bipolarbifstd  = [bipolaranalysis.bifurcation.diameter.taperrate.std];
bipolartermx   = [bipolaranalysis.termination.diameter.diameter];
bipolartermy   = [bipolaranalysis.termination.diameter.taperrate.mean];
bipolartermstd = [bipolaranalysis.termination.diameter.taperrate.std];

purkinjebifx    = [purkinjeanalysis.bifurcation.diameter.diameter];
purkinjebify    = [purkinjeanalysis.bifurcation.diameter.taperrate.mean];
purkinjebifstd  = [purkinjeanalysis.bifurcation.diameter.taperrate.std];
purkinjetermx   = [purkinjeanalysis.termination.diameter.diameter];
purkinjetermy   = [purkinjeanalysis.termination.diameter.taperrate.mean];
purkinjetermstd = [purkinjeanalysis.termination.diameter.taperrate.std];

martinottibifx    = [martinottianalysis.bifurcation.diameter.diameter];
martinottibify    = [martinottianalysis.bifurcation.diameter.taperrate.mean];
martinottibifstd  = [martinottianalysis.bifurcation.diameter.taperrate.std];
martinottitermx   = [martinottianalysis.termination.diameter.diameter];
martinottitermy   = [martinottianalysis.termination.diameter.taperrate.mean];
martinottitermstd = [martinottianalysis.termination.diameter.taperrate.std];

subplot(3,3,1); box on;
errorbar(bipolarbifx,bipolarbify,bipolarbifstd/2,'sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);  
hold on;
errorbar(bipolartermx,bipolartermy,bipolartermstd/2,'dr','MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);   
ylabel('Taper Rate','FontSize',labelfontsize,'FontWeight','b');
title('Bipolar','FontSize',titlefontsize,'FontWeight','b');
%set(gca,'yscale','log');
%set(gca,'xscale','log');
%axis([0.3 15 0.2e-5 0.075]);
%errorbarlogx;
ylim([-.2 .7]);
set(gca,'xticklabel', []);
set(gca,'FontSize',axesfontsize); hold off;

subplot(3,3,2); box on;
errorbar(purkinjebifx,purkinjebify,purkinjebifstd/2,'sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);  
hold on;
errorbar(purkinjetermx,purkinjetermy,purkinjetermstd/2,'dr','MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);  
title('Purkinje','FontSize',titlefontsize,'FontWeight','b');
%set(gca,'yscale','log');
%set(gca,'xscale','log');
%axis([0.3 15 0.2e-5 0.075]);
ylim([-.125 .14]);
%errorbarlogx;
set(gca,'xticklabel', []);
%set(gca,'yticklabel', []);
set(gca,'FontSize',axesfontsize); hold off; 

subplot(3,3,3); box on;
errorbar(martinottibifx,martinottibify,martinottibifstd/2,'sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);  
hold on;
errorbar(martinottitermx,martinottitermy,martinottitermstd/2,'dr','MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);  
title('Martinotti','FontSize',titlefontsize,'FontWeight','b');
%set(gca,'yscale','log');
%set(gca,'xscale','log');
%axis([0.3 15 0.2e-5 0.075]);
ylim([-.3 1.4]);
%errorbarlogx;
set(gca,'xticklabel', []);
%set(gca,'yticklabel', []);
set(gca,'FontSize',axesfontsize); hold off; 



bipolarbifx    = [bipolaranalysis.bifurcation.diameter.diameter];
bipolarbify    = [bipolaranalysis.bifurcation.diameter.rallratio.mean];
bipolarbifstd  = [bipolaranalysis.bifurcation.diameter.rallratio.std];

purkinjebifx    = [purkinjeanalysis.bifurcation.diameter.diameter];
purkinjebify    = [purkinjeanalysis.bifurcation.diameter.rallratio.mean];
purkinjebifstd  = [purkinjeanalysis.bifurcation.diameter.rallratio.std];

martinottibifx    = [martinottianalysis.bifurcation.diameter.diameter];
martinottibify    = [martinottianalysis.bifurcation.diameter.rallratio.mean];
martinottibifstd  = [martinottianalysis.bifurcation.diameter.rallratio.std];

subplot(3,3,4); box on;
errorbar(bipolarbifx,bipolarbify,bipolarbifstd/2,'sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);  
ylabel('Rall Ratio','FontSize',labelfontsize,'FontWeight','b');
%set(gca,'yscale','log');
%set(gca,'xscale','log');
set(gca,'xticklabel', []);
%axis([0.3 15 0.85 1.8]);
ylim([0 7.25]);
%errorbarlogx;
%errorbarlogy;
set(gca,'FontSize',axesfontsize); hold off;

subplot(3,3,5); box on;
errorbar(purkinjebifx,purkinjebify,purkinjebifstd/2,'sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);  
%set(gca,'yscale','log');
%set(gca,'xscale','log');
set(gca,'xticklabel', []);
%set(gca,'yticklabel', []);
%axis([0.3 15 0.85 1.8]);
ylim([0.8 2.3]);
%errorbarlogx;
%errorbarlogy;
set(gca,'FontSize',axesfontsize); hold off;   

subplot(3,3,6); box on;
errorbar(martinottibifx,martinottibify,martinottibifstd/2,'sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);  
%set(gca,'yscale','log');
%set(gca,'xscale','log');
set(gca,'xticklabel', []);
%set(gca,'yticklabel', []);
%axis([0.3 15 0.85 1.8]);
ylim([0 7]);
%errorbarlogx;
%errorbarlogy;
set(gca,'FontSize',axesfontsize); hold off; 


bipolarbifx    = [bipolaranalysis.bifurcation.diameter.diameter];
bipolarbify    = [bipolaranalysis.bifurcation.diameter.daughterratio.mean];
bipolarbifstd  = [bipolaranalysis.bifurcation.diameter.daughterratio.std];

purkinjebifx    = [purkinjeanalysis.bifurcation.diameter.diameter];
purkinjebify    = [purkinjeanalysis.bifurcation.diameter.daughterratio.mean];
purkinjebifstd  = [purkinjeanalysis.bifurcation.diameter.daughterratio.std];

martinottibifx    = [martinottianalysis.bifurcation.diameter.diameter];
martinottibify    = [martinottianalysis.bifurcation.diameter.daughterratio.mean];
martinottibifstd  = [martinottianalysis.bifurcation.diameter.daughterratio.std];

subplot(3,3,7); box on;
errorbar(bipolarbifx,bipolarbify,bipolarbifstd/2,'sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);  
ylabel('Daughter Ratio','FontSize',labelfontsize,'FontWeight','b');
xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
%set(gca,'yscale','log');
%set(gca,'xscale','log');
%axis([0.3 15 1.1 3.3]);
ylim([0.9 2.9]);
%errorbarlogx;
%errorbarlogy;
set(gca,'FontSize',axesfontsize); hold off;

subplot(3,3,8); box on;
errorbar(purkinjebifx,purkinjebify,purkinjebifstd/2,'sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);  
xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
%set(gca,'yticklabel', []);
%set(gca,'yscale','log');
%set(gca,'xscale','log');
%axis([0.3 15 1.1 3.3]);
ylim([0.9 3.4]);
%errorbarlogx;
%errorbarlogy;
set(gca,'FontSize',axesfontsize); hold off;

subplot(3,3,9); box on;
errorbar(martinottibifx,martinottibify,martinottibifstd/2,'sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);  
xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
%set(gca,'yticklabel', []);
%set(gca,'yscale','log');
%set(gca,'xscale','log');
%axis([0.3 15 1.1 3.3]);
ylim([0.75 3.5]);
%errorbarlogx;
%errorbarlogy;
set(gca,'FontSize',axesfontsize); hold off;

subplotspace('horizontal',-5);
subplotspace('vertical',-15);

currentdirectory = cd;
cd(bipolaranalysis.datapathname);
cd ..

filename = 'ParameterVDiameter_Multi';
print('-djpeg99',filename);
print('-dill',filename);

