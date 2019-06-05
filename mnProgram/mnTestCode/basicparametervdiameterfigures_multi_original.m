function basicparametervdiameterfigures_multi(iaintanalysis,purkinjeanalysis,martinottianalysis)
% Bif/term diameter figures

titlefontsize = 8;
labelfontsize = 7;
axesfontsize  = 5;
insetfontsize = 5;

greenmarkersize   = 6;
yellowmarkersize  = 5;
redmarkersize     = 6;
magentamarkersize = 3;

figure;

iaintbifx    = [iaintanalysis.diameter.diameter]';
iaintbify    = [iaintanalysis.diameter.numberbifurcatingbranches.total]'./([iaintanalysis.diameter.numberbifurcatingbranches.total]'+[iaintanalysis.diameter.numberterminatingbranches.total]');
iainttermx   = [iaintanalysis.diameter.diameter]';
iainttermy   = [iaintanalysis.diameter.numberterminatingbranches.total]'./([iaintanalysis.diameter.numberbifurcatingbranches.total]'+[iaintanalysis.diameter.numberterminatingbranches.total]');

purkinjebifx    = [purkinjeanalysis.diameter.diameter]';
purkinjebify    = [purkinjeanalysis.diameter.numberbifurcatingbranches.total]'./([purkinjeanalysis.diameter.numberbifurcatingbranches.total]'+[purkinjeanalysis.diameter.numberterminatingbranches.total]');
purkinjetermx   = [purkinjeanalysis.diameter.diameter]';
purkinjetermy   = [purkinjeanalysis.diameter.numberterminatingbranches.total]'./([purkinjeanalysis.diameter.numberbifurcatingbranches.total]'+[purkinjeanalysis.diameter.numberterminatingbranches.total]');

martinottibifx    = [martinottianalysis.diameter.diameter]';
martinottibify    = [martinottianalysis.diameter.numberbifurcatingbranches.total]'./([martinottianalysis.diameter.numberbifurcatingbranches.total]'+[martinottianalysis.diameter.numberterminatingbranches.total]');
martinottitermx   = [martinottianalysis.diameter.diameter]';
martinottitermy   = [martinottianalysis.diameter.numberterminatingbranches.total]'./([martinottianalysis.diameter.numberbifurcatingbranches.total]'+[martinottianalysis.diameter.numberterminatingbranches.total]');


subplot(5,3,1); box on;
plot(iaintbifx,iaintbify,'sg','MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
hold on;
plot(iainttermx,iainttermy,'dr','MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
ylabel('Branch Type Prob','FontSize',labelfontsize,'FontWeight','b');
title('Ia Interneurons','FontSize',titlefontsize,'FontWeight','b');
set(gca,'xscale','log');
%axis([0.3 15 -0.1 1.1]);
%set(gca,'xticklabel', []);
set(gca,'FontSize',axesfontsize); hold off;

subplot(5,3,2); box on;
plot(purkinjebifx,purkinjebify,'sg','MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
hold on;
plot(purkinjetermx,purkinjetermy,'dr','MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
title('Purkinje Cells','FontSize',titlefontsize,'FontWeight','b');
%set(gca,'xscale','log');
%axis([0.3 15 -0.1 1.1]);
%set(gca,'xticklabel', []);
%set(gca,'yticklabel', []);
set(gca,'FontSize',axesfontsize); hold off;

subplot(5,3,3); box on;
plot(martinottibifx,martinottibify,'sg','MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
hold on;
plot(martinottitermx,martinottitermy,'dr','MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
title('Martinotti Cells','FontSize',titlefontsize,'FontWeight','b');
set(gca,'xscale','log');
%axis([0.3 15 -0.1 1.1]);
%set(gca,'xticklabel', []);
%set(gca,'yticklabel', []);
set(gca,'FontSize',axesfontsize); hold off;


iaintbifx    = [iaintanalysis.bifurcation.diameter.diameter];
iaintbify    = [iaintanalysis.bifurcation.diameter.taperrate.mean];
iaintbifstd  = [iaintanalysis.bifurcation.diameter.taperrate.std];
iainttermx   = [iaintanalysis.termination.diameter.diameter];
iainttermy   = [iaintanalysis.termination.diameter.taperrate.mean];
iainttermstd = [iaintanalysis.termination.diameter.taperrate.std];

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

subplot(5,3,4); box on;
plot(iaintbifx,iaintbify,'sg','MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);  
hold on;
plot(iainttermx,iainttermy,'dr','MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);   
ylabel('Taper Rate','FontSize',labelfontsize,'FontWeight','b');
set(gca,'yscale','log');
set(gca,'xscale','log');
%axis([0.3 15 0.2e-5 0.075]);
%set(gca,'xticklabel', []);
set(gca,'FontSize',axesfontsize); hold off;

subplot(5,3,5); box on;
plot(purkinjebifx,purkinjebify,'sg','MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);  
hold on;
plot(purkinjetermx,purkinjetermy,'dr','MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);  
set(gca,'yscale','log');
set(gca,'xscale','log');
%axis([0.3 15 0.2e-5 0.075]);
%set(gca,'xticklabel', []);
%set(gca,'yticklabel', []);
set(gca,'FontSize',axesfontsize); hold off; 


subplot(5,3,6); box on;
plot(martinottibifx,martinottibify,'sg','MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);  
hold on;
plot(martinottitermx,martinottitermy,'dr','MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);  
set(gca,'yscale','log');
set(gca,'xscale','log');
%axis([0.3 15 0.2e-5 0.075]);
%set(gca,'xticklabel', []);
%set(gca,'yticklabel', []);
set(gca,'FontSize',axesfontsize); hold off; 


iaintbifx    = [iaintanalysis.bifurcation.diameter.diameter];
iaintbify    = [iaintanalysis.bifurcation.diameter.bifurcationprobability.length];
iainttermx   = [iaintanalysis.termination.diameter.diameter];
iainttermy   = [iaintanalysis.termination.diameter.terminationprobability.length];

purkinjebifx    = [purkinjeanalysis.bifurcation.diameter.diameter];
purkinjebify    = [purkinjeanalysis.bifurcation.diameter.bifurcationprobability.length];
purkinjetermx   = [purkinjeanalysis.termination.diameter.diameter];
purkinjetermy   = [purkinjeanalysis.termination.diameter.terminationprobability.length];

martinottibifx    = [martinottianalysis.bifurcation.diameter.diameter];
martinottibify    = [martinottianalysis.bifurcation.diameter.bifurcationprobability.length];
martinottitermx   = [martinottianalysis.termination.diameter.diameter];
martinottitermy   = [martinottianalysis.termination.diameter.terminationprobability.length];

subplot(5,3,7); box on;
loglog(iaintbifx,iaintbify,'sg','MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);  
hold on;
loglog(iainttermx,iainttermy,'dr','MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);   
%set(gca,'xticklabel', []);
%axis([0.3 15 0.0001 0.1]);
set(gca,'FontSize',axesfontsize); hold off;
ylabel('Branch End Prob','FontSize',labelfontsize,'FontWeight','b');

subplot(5,3,8); box on;
loglog(purkinjebifx,purkinjebify,'sg','MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);  
hold on;
loglog(purkinjetermx,purkinjetermy,'dr','MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);   
%set(gca,'xticklabel', []);
%set(gca,'yticklabel', []);
%axis([0.3 15 0.0001 0.1]);
set(gca,'FontSize',axesfontsize); hold off;

subplot(5,3,9); box on;
loglog(martinottibifx,martinottibify,'sg','MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);  
hold on;
loglog(martinottitermx,martinottitermy,'dr','MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);   
%set(gca,'xticklabel', []);
%set(gca,'yticklabel', []);
%axis([0.3 15 0.0001 0.1]);
set(gca,'FontSize',axesfontsize); hold off;


iaintbifx    = [iaintanalysis.bifurcation.diameter.diameter];
iaintbify    = [iaintanalysis.bifurcation.diameter.rallratio.mean];
iaintbifstd  = [iaintanalysis.bifurcation.diameter.rallratio.std];

purkinjebifx    = [purkinjeanalysis.bifurcation.diameter.diameter];
purkinjebify    = [purkinjeanalysis.bifurcation.diameter.rallratio.mean];
purkinjebifstd  = [purkinjeanalysis.bifurcation.diameter.rallratio.std];

martinottibifx    = [martinottianalysis.bifurcation.diameter.diameter];
martinottibify    = [martinottianalysis.bifurcation.diameter.rallratio.mean];
martinottibifstd  = [martinottianalysis.bifurcation.diameter.rallratio.std];

subplot(5,3,10); box on;
errorbar(iaintbifx,iaintbify,iaintbifstd/2,'sg','MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);  
ylabel('Rall Ratio','FontSize',labelfontsize,'FontWeight','b');
%set(gca,'yscale','log');
%set(gca,'xscale','log');
%set(gca,'xticklabel', []);
%axis([0.3 15 0.85 1.8]);
errorbarlogx;
errorbarlogy;
set(gca,'FontSize',axesfontsize); hold off;

subplot(5,3,11); box on;
errorbar(purkinjebifx,purkinjebify,purkinjebifstd/2,'sg','MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);  
%set(gca,'yscale','log');
%set(gca,'xscale','log');
%set(gca,'xticklabel', []);
%set(gca,'yticklabel', []);
%axis([0.3 15 0.85 1.8]);
errorbarlogx;
errorbarlogy;
set(gca,'FontSize',axesfontsize); hold off;   

subplot(5,3,12); box on;
errorbar(martinottibifx,martinottibify,martinottibifstd/2,'sg','MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);  
%set(gca,'yscale','log');
%set(gca,'xscale','log');
%set(gca,'xticklabel', []);
%set(gca,'yticklabel', []);
%axis([0.3 15 0.85 1.8]);
errorbarlogx;
errorbarlogy;
set(gca,'FontSize',axesfontsize); hold off; 


iaintbifx    = [iaintanalysis.bifurcation.diameter.diameter];
iaintbify    = [iaintanalysis.bifurcation.diameter.daughterratio.mean];
iaintbifstd  = [iaintanalysis.bifurcation.diameter.daughterratio.std];

purkinjebifx    = [purkinjeanalysis.bifurcation.diameter.diameter];
purkinjebify    = [purkinjeanalysis.bifurcation.diameter.daughterratio.mean];
purkinjebifstd  = [purkinjeanalysis.bifurcation.diameter.daughterratio.std];

martinottibifx    = [martinottianalysis.bifurcation.diameter.diameter];
martinottibify    = [martinottianalysis.bifurcation.diameter.daughterratio.mean];
martinottibifstd  = [martinottianalysis.bifurcation.diameter.daughterratio.std];

subplot(5,3,13); box on;
errorbar(iaintbifx,iaintbify,iaintbifstd/2,'sg','MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);  
ylabel('Daughter Ratio','FontSize',labelfontsize,'FontWeight','b');
xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
%set(gca,'yscale','log');
%set(gca,'xscale','log');
%axis([0.3 15 1.1 3.3]);
errorbarlogx;
errorbarlogy;
set(gca,'FontSize',axesfontsize); hold off;

subplot(5,3,14); box on;
errorbar(purkinjebifx,purkinjebify,purkinjebifstd/2,'sg','MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);  
xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
%set(gca,'yticklabel', []);
%set(gca,'yscale','log');
%set(gca,'xscale','log');
%axis([0.3 15 1.1 3.3]);
errorbarlogx;
errorbarlogy;
set(gca,'FontSize',axesfontsize); hold off;

subplot(5,3,15); box on;
errorbar(martinottibifx,martinottibify,martinottibifstd/2,'sg','MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);  
xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
%set(gca,'yticklabel', []);
%set(gca,'yscale','log');
%set(gca,'xscale','log');
%axis([0.3 15 1.1 3.3]);
errorbarlogx;
errorbarlogy;
set(gca,'FontSize',axesfontsize); hold off;

subplotspace('horizontal',-15);
subplotspace('vertical',-15);

currentdirectory = cd;
cd(iaintanalysis.datapathname);
cd ..

filename = 'ParameterVDiameter_Multi';
print('-djpeg99',filename);
print('-dill',filename);

