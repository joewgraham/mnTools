function basicparametervdiameterfigures(cullheimanalysis,hillmananalysis,burkeanalysis,grahamanalysis)
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

cullheimbifx    = [cullheimanalysis.diameter.diameter]';
cullheimbify    = [cullheimanalysis.diameter.numberbifurcatingbranches.total]'./([cullheimanalysis.diameter.numberbifurcatingbranches.total]'+[cullheimanalysis.diameter.numberterminatingbranches.total]');
cullheimtermx   = [cullheimanalysis.diameter.diameter]';
cullheimtermy   = [cullheimanalysis.diameter.numberterminatingbranches.total]'./([cullheimanalysis.diameter.numberbifurcatingbranches.total]'+[cullheimanalysis.diameter.numberterminatingbranches.total]');

hillmanbifx    = [hillmananalysis.diameter.diameter]';
hillmanbify    = [hillmananalysis.diameter.numberbifurcatingbranches.total]'./([hillmananalysis.diameter.numberbifurcatingbranches.total]'+[hillmananalysis.diameter.numberterminatingbranches.total]');
hillmantermx   = [hillmananalysis.diameter.diameter]';
hillmantermy   = [hillmananalysis.diameter.numberterminatingbranches.total]'./([hillmananalysis.diameter.numberbifurcatingbranches.total]'+[hillmananalysis.diameter.numberterminatingbranches.total]');

burkebifx    = [burkeanalysis.diameter.diameter]';
burkebify    = [burkeanalysis.diameter.numberbifurcatingbranches.total]'./([burkeanalysis.diameter.numberbifurcatingbranches.total]'+[burkeanalysis.diameter.numberterminatingbranches.total]');
burketermx   = [burkeanalysis.diameter.diameter]';
burketermy   = [burkeanalysis.diameter.numberterminatingbranches.total]'./([burkeanalysis.diameter.numberbifurcatingbranches.total]'+[burkeanalysis.diameter.numberterminatingbranches.total]');

grahambifx    = [grahamanalysis.diameter.diameter]';
grahambify    = [grahamanalysis.diameter.numberbifurcatingbranches.total]'./([grahamanalysis.diameter.numberbifurcatingbranches.total]'+[grahamanalysis.diameter.numberterminatingbranches.total]');
grahamtermx   = [grahamanalysis.diameter.diameter]';
grahamtermy   = [grahamanalysis.diameter.numberterminatingbranches.total]'./([grahamanalysis.diameter.numberbifurcatingbranches.total]'+[grahamanalysis.diameter.numberterminatingbranches.total]');


subplot(5,3,1); box on;
plot(cullheimbifx,cullheimbify,'sg','MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
hold on;
plot(cullheimtermx,cullheimtermy,'dr','MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
plot(hillmanbifx,hillmanbify,'sy','MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
plot(hillmantermx,hillmantermy,'dm','MarkerEdgeColor','k','MarkerFaceColor','m','MarkerSize',magentamarkersize);
ylabel('Branch Type Prob','FontSize',labelfontsize,'FontWeight','b');
title('Hillman/Ascoli Algorithm','FontSize',titlefontsize,'FontWeight','b');
set(gca,'xscale','log');
axis([0.3 15 -0.1 1.1]);
set(gca,'xticklabel', []);
set(gca,'FontSize',axesfontsize); hold off;

subplot(5,3,2); box on;
plot(cullheimbifx,cullheimbify,'sg','MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
hold on;
plot(cullheimtermx,cullheimtermy,'dr','MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
plot(burkebifx,burkebify,'sy','MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
plot(burketermx,burketermy,'dm','MarkerEdgeColor','k','MarkerFaceColor','m','MarkerSize',magentamarkersize);
title('Burke/Ascoli Algorithm','FontSize',titlefontsize,'FontWeight','b');
set(gca,'xscale','log');
axis([0.3 15 -0.1 1.1]);
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
set(gca,'xscale','log');
axis([0.3 15 -0.1 1.1]);
set(gca,'xticklabel', []);
set(gca,'yticklabel', []);
set(gca,'FontSize',axesfontsize); hold off;


cullheimbifx    = [cullheimanalysis.bifurcation.diameter.diameter];
cullheimbify    = [cullheimanalysis.bifurcation.diameter.taperrate.mean];
cullheimbifstd  = [cullheimanalysis.bifurcation.diameter.taperrate.std];
cullheimtermx   = [cullheimanalysis.termination.diameter.diameter];
cullheimtermy   = [cullheimanalysis.termination.diameter.taperrate.mean];
cullheimtermstd = [cullheimanalysis.termination.diameter.taperrate.std];

hillmanbifx    = [hillmananalysis.bifurcation.diameter.diameter];
hillmanbify    = [hillmananalysis.bifurcation.diameter.taperrate.mean];
hillmanbifstd  = [hillmananalysis.bifurcation.diameter.taperrate.std];
hillmantermx   = [hillmananalysis.termination.diameter.diameter];
hillmantermy   = [hillmananalysis.termination.diameter.taperrate.mean];
hillmantermstd = [hillmananalysis.termination.diameter.taperrate.std];

burkebifx    = [burkeanalysis.bifurcation.diameter.diameter];
burkebify    = [burkeanalysis.bifurcation.diameter.taperrate.mean];
burkebifstd  = [burkeanalysis.bifurcation.diameter.taperrate.std];
burketermx   = [burkeanalysis.termination.diameter.diameter];
burketermy   = [burkeanalysis.termination.diameter.taperrate.mean];
burketermstd = [burkeanalysis.termination.diameter.taperrate.std];

grahambifx    = [grahamanalysis.bifurcation.diameter.diameter];
grahambify    = [grahamanalysis.bifurcation.diameter.taperrate.mean];
grahambifstd  = [grahamanalysis.bifurcation.diameter.taperrate.std];
grahamtermx   = [grahamanalysis.termination.diameter.diameter];
grahamtermy   = [grahamanalysis.termination.diameter.taperrate.mean];
grahamtermstd = [grahamanalysis.termination.diameter.taperrate.std];

subplot(5,3,4); box on;
plot(cullheimbifx,cullheimbify,'sg','MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
hold on;
plot(cullheimtermx,cullheimtermy,'dr','MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
plot(hillmanbifx,hillmanbify,'sk','MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',yellowmarkersize);  
plot(hillmantermx,hillmantermy,'dk','MarkerEdgeColor','k','MarkerFaceColor','m','MarkerSize',magentamarkersize);   
ylabel('Taper Rate','FontSize',labelfontsize,'FontWeight','b');
set(gca,'yscale','log');
set(gca,'xscale','log');
axis([0.3 15 0.2e-5 0.075]);
set(gca,'xticklabel', []);
set(gca,'FontSize',axesfontsize); hold off;

subplot(5,3,5); box on;
plot(cullheimbifx,cullheimbify,'sg','MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
hold on;
plot(cullheimtermx,cullheimtermy,'dr','MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
plot(burkebifx,burkebify,'sk','MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',yellowmarkersize);  
plot(burketermx,burketermy,'dk','MarkerEdgeColor','k','MarkerFaceColor','m','MarkerSize',magentamarkersize);  
set(gca,'yscale','log');
set(gca,'xscale','log');
axis([0.3 15 0.2e-5 0.075]);
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
set(gca,'xscale','log');
axis([0.3 15 0.2e-5 0.075]);
set(gca,'xticklabel', []);
set(gca,'yticklabel', []);
set(gca,'FontSize',axesfontsize); hold off; 


cullheimbifx    = [cullheimanalysis.bifurcation.diameter.diameter];
cullheimbify    = [cullheimanalysis.bifurcation.diameter.bifurcationprobability.length];
cullheimtermx   = [cullheimanalysis.termination.diameter.diameter];
cullheimtermy   = [cullheimanalysis.termination.diameter.terminationprobability.length];

hillmanbifx    = [hillmananalysis.bifurcation.diameter.diameter];
hillmanbify    = [hillmananalysis.bifurcation.diameter.bifurcationprobability.length];
hillmantermx   = [hillmananalysis.termination.diameter.diameter];
hillmantermy   = [hillmananalysis.termination.diameter.terminationprobability.length];

burkebifx    = [burkeanalysis.bifurcation.diameter.diameter];
burkebify    = [burkeanalysis.bifurcation.diameter.bifurcationprobability.length];
burketermx   = [burkeanalysis.termination.diameter.diameter];
burketermy   = [burkeanalysis.termination.diameter.terminationprobability.length];

grahambifx    = [grahamanalysis.bifurcation.diameter.diameter];
grahambify    = [grahamanalysis.bifurcation.diameter.bifurcationprobability.length];
grahamtermx   = [grahamanalysis.termination.diameter.diameter];
grahamtermy   = [grahamanalysis.termination.diameter.terminationprobability.length];

subplot(5,3,7); box on;
loglog(cullheimbifx,cullheimbify,'sg','MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
hold on;
loglog(cullheimtermx,cullheimtermy,'dr','MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
loglog(hillmanbifx,hillmanbify,'sk','MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',yellowmarkersize);  
loglog(hillmantermx,hillmantermy,'dk','MarkerEdgeColor','k','MarkerFaceColor','m','MarkerSize',magentamarkersize);   
set(gca,'xticklabel', []);
axis([0.3 15 0.0001 0.1]);
set(gca,'FontSize',axesfontsize); hold off;
ylabel('Branch End Prob','FontSize',labelfontsize,'FontWeight','b');

subplot(5,3,8); box on;
loglog(cullheimbifx,cullheimbify,'sg','MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
hold on;
loglog(cullheimtermx,cullheimtermy,'dr','MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
loglog(burkebifx,burkebify,'sk','MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',yellowmarkersize);  
loglog(burketermx,burketermy,'dk','MarkerEdgeColor','k','MarkerFaceColor','m','MarkerSize',magentamarkersize);   
set(gca,'xticklabel', []);
set(gca,'yticklabel', []);
axis([0.3 15 0.0001 0.1]);
set(gca,'FontSize',axesfontsize); hold off;

subplot(5,3,9); box on;
loglog(cullheimbifx,cullheimbify,'sg','MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
hold on;
loglog(cullheimtermx,cullheimtermy,'dr','MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
loglog(grahambifx,grahambify,'sk','MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',yellowmarkersize);  
loglog(grahamtermx,grahamtermy,'dk','MarkerEdgeColor','k','MarkerFaceColor','m','MarkerSize',magentamarkersize);   
set(gca,'xticklabel', []);
set(gca,'yticklabel', []);
axis([0.3 15 0.0001 0.1]);
set(gca,'FontSize',axesfontsize); hold off;


cullheimbifx    = [cullheimanalysis.bifurcation.diameter.diameter];
cullheimbify    = [cullheimanalysis.bifurcation.diameter.rallratio.mean];
cullheimbifstd  = [cullheimanalysis.bifurcation.diameter.rallratio.std];

hillmanbifx    = [hillmananalysis.bifurcation.diameter.diameter];
hillmanbify    = [hillmananalysis.bifurcation.diameter.rallratio.mean];
hillmanbifstd  = [hillmananalysis.bifurcation.diameter.rallratio.std];

burkebifx    = [burkeanalysis.bifurcation.diameter.diameter];
burkebify    = [burkeanalysis.bifurcation.diameter.rallratio.mean];
burkebifstd  = [burkeanalysis.bifurcation.diameter.rallratio.std];

grahambifx    = [grahamanalysis.bifurcation.diameter.diameter];
grahambify    = [grahamanalysis.bifurcation.diameter.rallratio.mean];
grahambifstd  = [grahamanalysis.bifurcation.diameter.rallratio.std];

subplot(5,3,10); box on;
plot(cullheimbifx,cullheimbify,'sg','MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
hold on;
plot(hillmanbifx,hillmanbify,'sk','MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',yellowmarkersize);  
ylabel('Rall Ratio','FontSize',labelfontsize,'FontWeight','b');
set(gca,'yscale','log');
set(gca,'xscale','log');
set(gca,'xticklabel', []);
axis([0.3 15 0.85 1.8]);
set(gca,'FontSize',axesfontsize); hold off;

subplot(5,3,11); box on;
plot(cullheimbifx,cullheimbify,'sg','MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
hold on;
plot(burkebifx,burkebify,'sk','MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',yellowmarkersize);  
set(gca,'yscale','log');
set(gca,'xscale','log');
set(gca,'xticklabel', []);
set(gca,'yticklabel', []);
axis([0.3 15 0.85 1.8]);
set(gca,'FontSize',axesfontsize); hold off;   

subplot(5,3,12); box on;
plot(cullheimbifx,cullheimbify,'sg','MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
hold on;
plot(grahambifx,grahambify,'sk','MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',yellowmarkersize);  
set(gca,'yscale','log');
set(gca,'xscale','log');
set(gca,'xticklabel', []);
set(gca,'yticklabel', []);
axis([0.3 15 0.85 1.8]);
set(gca,'FontSize',axesfontsize); hold off; 


cullheimbifx    = [cullheimanalysis.bifurcation.diameter.diameter];
cullheimbify    = [cullheimanalysis.bifurcation.diameter.daughterratio.mean];
cullheimbifstd  = [cullheimanalysis.bifurcation.diameter.daughterratio.std];

hillmanbifx    = [hillmananalysis.bifurcation.diameter.diameter];
hillmanbify    = [hillmananalysis.bifurcation.diameter.daughterratio.mean];
hillmanbifstd  = [hillmananalysis.bifurcation.diameter.daughterratio.std];

burkebifx    = [burkeanalysis.bifurcation.diameter.diameter];
burkebify    = [burkeanalysis.bifurcation.diameter.daughterratio.mean];
burkebifstd  = [burkeanalysis.bifurcation.diameter.daughterratio.std];

grahambifx    = [grahamanalysis.bifurcation.diameter.diameter];
grahambify    = [grahamanalysis.bifurcation.diameter.daughterratio.mean];
grahambifstd  = [grahamanalysis.bifurcation.diameter.daughterratio.std];

subplot(5,3,13); box on;
plot(cullheimbifx,cullheimbify,'sg','MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
hold on;
plot(hillmanbifx,hillmanbify,'sk','MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',yellowmarkersize);  
ylabel('Daughter Ratio','FontSize',labelfontsize,'FontWeight','b');
xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
set(gca,'yscale','log');
set(gca,'xscale','log');
axis([0.3 15 1.1 3.3]);
set(gca,'FontSize',axesfontsize); hold off;

subplot(5,3,14); box on;
plot(cullheimbifx,cullheimbify,'sg','MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
hold on;
plot(burkebifx,burkebify,'sk','MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',yellowmarkersize);  
xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
set(gca,'yticklabel', []);
set(gca,'yscale','log');
set(gca,'xscale','log');
axis([0.3 15 1.1 3.3]);
set(gca,'FontSize',axesfontsize); hold off;

subplot(5,3,15); box on;
plot(cullheimbifx,cullheimbify,'sg','MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
hold on;
plot(grahambifx,grahambify,'sk','MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',yellowmarkersize);  
xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
set(gca,'yticklabel', []);
set(gca,'yscale','log');
set(gca,'xscale','log');
axis([0.3 15 1.1 3.3]);
set(gca,'FontSize',axesfontsize); hold off;

subplotspace('horizontal',-20);
subplotspace('vertical',-20);

currentdirectory = cd;
cd(cullheimanalysis.datapathname);
cd ..

filename = 'ParameterVDiameter';
print('-djpeg99',filename);
print('-dill',filename);

