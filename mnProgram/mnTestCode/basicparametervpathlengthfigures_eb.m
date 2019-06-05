function basicparametervpathlengthfigures(cullheimanalysis,hillmananalysis,burkeanalysis,grahamanalysis)
% Bif/term pathlength figures

titlefontsize = 8;
labelfontsize = 7;
axesfontsize  = 5;
insetfontsize = 5;

greenmarkersize   = 6;
yellowmarkersize  = 5;
redmarkersize     = 6;
magentamarkersize = 3;

figure;

cullheimbifx    = [cullheimanalysis.pathlength.pathlength]';
cullheimbify    = [cullheimanalysis.pathlength.numberbifurcatingbranches.total]'./([cullheimanalysis.pathlength.numberbifurcatingbranches.total]'+[cullheimanalysis.pathlength.numberterminatingbranches.total]');
cullheimtermx   = [cullheimanalysis.pathlength.pathlength]';
cullheimtermy   = [cullheimanalysis.pathlength.numberterminatingbranches.total]'./([cullheimanalysis.pathlength.numberbifurcatingbranches.total]'+[cullheimanalysis.pathlength.numberterminatingbranches.total]');

hillmanbifx    = [hillmananalysis.pathlength.pathlength]';
hillmanbify    = [hillmananalysis.pathlength.numberbifurcatingbranches.total]'./([hillmananalysis.pathlength.numberbifurcatingbranches.total]'+[hillmananalysis.pathlength.numberterminatingbranches.total]');
hillmantermx   = [hillmananalysis.pathlength.pathlength]';
hillmantermy   = [hillmananalysis.pathlength.numberterminatingbranches.total]'./([hillmananalysis.pathlength.numberbifurcatingbranches.total]'+[hillmananalysis.pathlength.numberterminatingbranches.total]');

burkebifx    = [burkeanalysis.pathlength.pathlength]';
burkebify    = [burkeanalysis.pathlength.numberbifurcatingbranches.total]'./([burkeanalysis.pathlength.numberbifurcatingbranches.total]'+[burkeanalysis.pathlength.numberterminatingbranches.total]');
burketermx   = [burkeanalysis.pathlength.pathlength]';
burketermy   = [burkeanalysis.pathlength.numberterminatingbranches.total]'./([burkeanalysis.pathlength.numberbifurcatingbranches.total]'+[burkeanalysis.pathlength.numberterminatingbranches.total]');

grahambifx    = [grahamanalysis.pathlength.pathlength]';
grahambify    = [grahamanalysis.pathlength.numberbifurcatingbranches.total]'./([grahamanalysis.pathlength.numberbifurcatingbranches.total]'+[grahamanalysis.pathlength.numberterminatingbranches.total]');
grahamtermx   = [grahamanalysis.pathlength.pathlength]';
grahamtermy   = [grahamanalysis.pathlength.numberterminatingbranches.total]'./([grahamanalysis.pathlength.numberbifurcatingbranches.total]'+[grahamanalysis.pathlength.numberterminatingbranches.total]');


subplot(5,3,1); box on;
plot(cullheimbifx,cullheimbify,'sg','MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
hold on;
plot(cullheimtermx,cullheimtermy,'dr','MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
plot(hillmanbifx,hillmanbify,'sy','MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
plot(hillmantermx,hillmantermy,'dm','MarkerEdgeColor','k','MarkerFaceColor','m','MarkerSize',magentamarkersize);
ylabel('Branch Type Prob','FontSize',labelfontsize,'FontWeight','b');
title('Hillman/Ascoli Algorithm','FontSize',titlefontsize,'FontWeight','b');
%set(gca,'xscale','log');
xlim([0 3000]);
ylim([-0.1 1.1]);
set(gca,'xticklabel', []);
set(gca,'FontSize',axesfontsize); hold off;

subplot(5,3,2); box on;
plot(cullheimbifx,cullheimbify,'sg','MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
hold on;
plot(cullheimtermx,cullheimtermy,'dr','MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
plot(burkebifx,burkebify,'sy','MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
plot(burketermx,burketermy,'dm','MarkerEdgeColor','k','MarkerFaceColor','m','MarkerSize',magentamarkersize);
title('Burke/Ascoli Algorithm','FontSize',titlefontsize,'FontWeight','b');
%set(gca,'xscale','log');
xlim([0 3000]);
ylim([-0.1 1.1]);
set(gca,'xticklabel', []);
set(gca,'yticklabel', []);
set(gca,'FontSize',axesfontsize); hold off;

subplot(5,3,3); box on;
plot(cullheimbifx,cullheimbify,'sg','MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
hold on;
plot(cullheimtermx,cullheimtermy,'dr','MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
plot(grahambifx,grahambify,'sy','MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
plot(grahamtermx,grahamtermy,'dm','MarkerEdgeColor','k','MarkerFaceColor','m','MarkerSize',magentamarkersize);
title('Graham Algorithm','FontSize',titlefontsize,'FontWeight','b');
%set(gca,'xscale','log');
xlim([0 3000]);
ylim([-0.1 1.1]);
set(gca,'xticklabel', []);
set(gca,'yticklabel', []);
set(gca,'FontSize',axesfontsize); hold off;


cullheimbifx    = [cullheimanalysis.bifurcation.pathlength.pathlength];
cullheimbify    = [cullheimanalysis.bifurcation.pathlength.taperrate.mean];
cullheimbifstd  = [cullheimanalysis.bifurcation.pathlength.taperrate.std];
cullheimtermx   = [cullheimanalysis.termination.pathlength.pathlength];
cullheimtermy   = [cullheimanalysis.termination.pathlength.taperrate.mean];
cullheimtermstd = [cullheimanalysis.termination.pathlength.taperrate.std];

hillmanbifx    = [hillmananalysis.bifurcation.pathlength.pathlength];
hillmanbify    = [hillmananalysis.bifurcation.pathlength.taperrate.mean];
hillmanbifstd  = [hillmananalysis.bifurcation.pathlength.taperrate.std];
hillmantermx   = [hillmananalysis.termination.pathlength.pathlength];
hillmantermy   = [hillmananalysis.termination.pathlength.taperrate.mean];
hillmantermstd = [hillmananalysis.termination.pathlength.taperrate.std];

burkebifx    = [burkeanalysis.bifurcation.pathlength.pathlength];
burkebify    = [burkeanalysis.bifurcation.pathlength.taperrate.mean];
burkebifstd  = [burkeanalysis.bifurcation.pathlength.taperrate.std];
burketermx   = [burkeanalysis.termination.pathlength.pathlength];
burketermy   = [burkeanalysis.termination.pathlength.taperrate.mean];
burketermstd = [burkeanalysis.termination.pathlength.taperrate.std];

grahambifx    = [grahamanalysis.bifurcation.pathlength.pathlength];
grahambify    = [grahamanalysis.bifurcation.pathlength.taperrate.mean];
grahambifstd  = [grahamanalysis.bifurcation.pathlength.taperrate.std];
grahamtermx   = [grahamanalysis.termination.pathlength.pathlength];
grahamtermy   = [grahamanalysis.termination.pathlength.taperrate.mean];
grahamtermstd = [grahamanalysis.termination.pathlength.taperrate.std];

subplot(5,3,4); box on;
plot(cullheimbifx,cullheimbify,'sg','MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
hold on;
plot(cullheimtermx,cullheimtermy,'dr','MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
plot(hillmanbifx,hillmanbify,'sk','MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',yellowmarkersize);  
plot(hillmantermx,hillmantermy,'dk','MarkerEdgeColor','k','MarkerFaceColor','m','MarkerSize',magentamarkersize);   
ylabel('Taper Rate','FontSize',labelfontsize,'FontWeight','b');
set(gca,'yscale','log');
%set(gca,'xscale','log');
xlim([0 3000]);
ylim([0.0001 0.02]);
set(gca,'xticklabel', []);
set(gca,'FontSize',axesfontsize); hold off;

subplot(5,3,5); box on;
plot(cullheimbifx,cullheimbify,'sg','MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
hold on;
plot(cullheimtermx,cullheimtermy,'dr','MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
plot(burkebifx,burkebify,'sk','MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',yellowmarkersize);  
plot(burketermx,burketermy,'dk','MarkerEdgeColor','k','MarkerFaceColor','m','MarkerSize',magentamarkersize);  
set(gca,'yscale','log');
%set(gca,'xscale','log');
xlim([0 3000]);
ylim([0.0001 0.02]);
set(gca,'xticklabel', []);
set(gca,'yticklabel', []);
set(gca,'FontSize',axesfontsize); hold off; 


subplot(5,3,6); box on;
plot(cullheimbifx,cullheimbify,'sg','MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
hold on;
plot(cullheimtermx,cullheimtermy,'dr','MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
plot(grahambifx,grahambify,'sk','MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',yellowmarkersize);  
plot(grahamtermx,grahamtermy,'dk','MarkerEdgeColor','k','MarkerFaceColor','m','MarkerSize',magentamarkersize);  
set(gca,'yscale','log');
%set(gca,'xscale','log');
xlim([0 3000]);
ylim([0.0001 0.02]);
set(gca,'xticklabel', []);
set(gca,'yticklabel', []);
set(gca,'FontSize',axesfontsize); hold off; 


cullheimbifx    = [cullheimanalysis.bifurcation.pathlength.pathlength];
cullheimbify    = [cullheimanalysis.bifurcation.pathlength.bifurcationprobability.length];
cullheimtermx   = [cullheimanalysis.termination.pathlength.pathlength];
cullheimtermy   = [cullheimanalysis.termination.pathlength.terminationprobability.length];

hillmanbifx    = [hillmananalysis.bifurcation.pathlength.pathlength];
hillmanbify    = [hillmananalysis.bifurcation.pathlength.bifurcationprobability.length];
hillmantermx   = [hillmananalysis.termination.pathlength.pathlength];
hillmantermy   = [hillmananalysis.termination.pathlength.terminationprobability.length];

burkebifx    = [burkeanalysis.bifurcation.pathlength.pathlength];
burkebify    = [burkeanalysis.bifurcation.pathlength.bifurcationprobability.length];
burketermx   = [burkeanalysis.termination.pathlength.pathlength];
burketermy   = [burkeanalysis.termination.pathlength.terminationprobability.length];

grahambifx    = [grahamanalysis.bifurcation.pathlength.pathlength];
grahambify    = [grahamanalysis.bifurcation.pathlength.bifurcationprobability.length];
grahamtermx   = [grahamanalysis.termination.pathlength.pathlength];
grahamtermy   = [grahamanalysis.termination.pathlength.terminationprobability.length];

subplot(5,3,7); box on;
plot(cullheimbifx,cullheimbify,'sg','MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
hold on;
plot(cullheimtermx,cullheimtermy,'dr','MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
plot(hillmanbifx,hillmanbify,'sk','MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',yellowmarkersize);  
plot(hillmantermx,hillmantermy,'dk','MarkerEdgeColor','k','MarkerFaceColor','m','MarkerSize',magentamarkersize);   
set(gca,'xticklabel', []);
set(gca,'yscale','log');
xlim([0 3000]);
ylim([0.0001 0.1]);
set(gca,'FontSize',axesfontsize); hold off;
ylabel('Branch End Prob','FontSize',labelfontsize,'FontWeight','b');

subplot(5,3,8); box on;
plot(cullheimbifx,cullheimbify,'sg','MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
hold on;
plot(cullheimtermx,cullheimtermy,'dr','MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
plot(burkebifx,burkebify,'sk','MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',yellowmarkersize);  
plot(burketermx,burketermy,'dk','MarkerEdgeColor','k','MarkerFaceColor','m','MarkerSize',magentamarkersize);   
set(gca,'xticklabel', []);
set(gca,'yticklabel', []);
set(gca,'yscale','log');
xlim([0 3000]);
ylim([0.0001 0.1]);
set(gca,'FontSize',axesfontsize); hold off;

subplot(5,3,9); box on;
plot(cullheimbifx,cullheimbify,'sg','MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
hold on;
plot(cullheimtermx,cullheimtermy,'dr','MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
plot(grahambifx,grahambify,'sk','MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',yellowmarkersize);  
plot(grahamtermx,grahamtermy,'dk','MarkerEdgeColor','k','MarkerFaceColor','m','MarkerSize',magentamarkersize);   
set(gca,'xticklabel', []);
set(gca,'yticklabel', []);
set(gca,'yscale','log');
xlim([0 3000]);
ylim([0.0001 0.1]);
set(gca,'FontSize',axesfontsize); hold off;


cullheimbifx    = [cullheimanalysis.bifurcation.pathlength.pathlength];
cullheimbify    = [cullheimanalysis.bifurcation.pathlength.rallratio.mean];
cullheimbifstd  = [cullheimanalysis.bifurcation.pathlength.rallratio.std];

hillmanbifx    = [hillmananalysis.bifurcation.pathlength.pathlength];
hillmanbify    = [hillmananalysis.bifurcation.pathlength.rallratio.mean];
hillmanbifstd  = [hillmananalysis.bifurcation.pathlength.rallratio.std];

burkebifx    = [burkeanalysis.bifurcation.pathlength.pathlength];
burkebify    = [burkeanalysis.bifurcation.pathlength.rallratio.mean];
burkebifstd  = [burkeanalysis.bifurcation.pathlength.rallratio.std];

grahambifx    = [grahamanalysis.bifurcation.pathlength.pathlength];
grahambify    = [grahamanalysis.bifurcation.pathlength.rallratio.mean];
grahambifstd  = [grahamanalysis.bifurcation.pathlength.rallratio.std];

subplot(5,3,10); box on;
errorbar(cullheimbifx,cullheimbify,cullheimbifstd/2,'sg','MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
hold on;
errorbar(hillmanbifx,hillmanbify,hillmanbifstd/2,'sk','MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',yellowmarkersize);  
ylabel('Rall Ratio','FontSize',labelfontsize,'FontWeight','b');
%set(gca,'yscale','log');
%set(gca,'xscale','log');
set(gca,'xticklabel', []);
xlim([0 3000]);
ylim([0.6 1.6]);
set(gca,'FontSize',axesfontsize); hold off;

subplot(5,3,11); box on;
errorbar(cullheimbifx,cullheimbify,cullheimbifstd/2,'sg','MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
hold on;
errorbar(burkebifx,burkebify,burkebifstd/2,'sk','MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',yellowmarkersize);  
%set(gca,'yscale','log');
%set(gca,'xscale','log');
set(gca,'xticklabel', []);
set(gca,'yticklabel', []);
xlim([0 3000]);
ylim([0.6 1.6]);
set(gca,'FontSize',axesfontsize); hold off;   

subplot(5,3,12); box on;
errorbar(cullheimbifx,cullheimbify,cullheimbifstd/2,'sg','MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
hold on;
errorbar(grahambifx,grahambify,grahambifstd/2,'sk','MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',yellowmarkersize);  
%set(gca,'yscale','log');
%set(gca,'xscale','log');
set(gca,'xticklabel', []);
set(gca,'yticklabel', []);
xlim([0 3000]);
ylim([0.6 1.6]);
set(gca,'FontSize',axesfontsize); hold off; 


cullheimbifx    = [cullheimanalysis.bifurcation.pathlength.pathlength];
cullheimbify    = [cullheimanalysis.bifurcation.pathlength.daughterratio.mean];
cullheimbifstd  = [cullheimanalysis.bifurcation.pathlength.daughterratio.std];

hillmanbifx    = [hillmananalysis.bifurcation.pathlength.pathlength];
hillmanbify    = [hillmananalysis.bifurcation.pathlength.daughterratio.mean];
hillmanbifstd  = [hillmananalysis.bifurcation.pathlength.daughterratio.std];

burkebifx    = [burkeanalysis.bifurcation.pathlength.pathlength];
burkebify    = [burkeanalysis.bifurcation.pathlength.daughterratio.mean];
burkebifstd  = [burkeanalysis.bifurcation.pathlength.daughterratio.std];

grahambifx    = [grahamanalysis.bifurcation.pathlength.pathlength];
grahambify    = [grahamanalysis.bifurcation.pathlength.daughterratio.mean];
grahambifstd  = [grahamanalysis.bifurcation.pathlength.daughterratio.std];

subplot(5,3,13); box on;
errorbar(cullheimbifx,cullheimbify,cullheimbifstd/2,'sg','MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
hold on;
errorbar(hillmanbifx,hillmanbify,hillmanbifstd/2,'sk','MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',yellowmarkersize);  
ylabel('Daughter Ratio','FontSize',labelfontsize,'FontWeight','b');
xlabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
%set(gca,'yscale','log');
%set(gca,'xscale','log');
xlim([0 3000]);
ylim([1 3]);
set(gca,'FontSize',axesfontsize); hold off;

subplot(5,3,14); box on;
errorbar(cullheimbifx,cullheimbify,cullheimbifstd/2,'sg','MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
hold on;
errorbar(burkebifx,burkebify,burkebifstd/2,'sk','MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',yellowmarkersize);  
xlabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
set(gca,'yticklabel', []);
%set(gca,'yscale','log');
%set(gca,'xscale','log');
xlim([0 3000]);
ylim([1 3]);
set(gca,'FontSize',axesfontsize); hold off;

subplot(5,3,15); box on;
errorbar(cullheimbifx,cullheimbify,cullheimbifstd/2,'sg','MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
hold on;
errorbar(grahambifx,grahambify,grahambifstd/2,'sk','MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',yellowmarkersize);  
xlabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
set(gca,'yticklabel', []);
%set(gca,'yscale','log');
%set(gca,'xscale','log');
xlim([0 3000]);
ylim([1 3]);
set(gca,'FontSize',axesfontsize); hold off;

subplotspace('horizontal',-20);
subplotspace('vertical',-20);

currentdirectory = cd;
cd(cullheimanalysis.datapathname);
cd ..

filename = 'ParameterVPathLength';
print('-djpeg99',filename);
print('-dill',filename);

