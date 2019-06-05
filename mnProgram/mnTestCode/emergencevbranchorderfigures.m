function emergencevbranchorderfigures(cullheimanalysis,hillmananalysis,burkeanalysis,grahamanalysis)
% Bif/term branch order figures

titlefontsize = 8;
labelfontsize = 7;
axesfontsize  = 5;
insetfontsize = 5;

greenmarkersize   = 6;
yellowmarkersize  = 5;
redmarkersize     = 5;
magentamarkersize = 4;

figure;

cullheimbifx    = [cullheimanalysis.bifurcation.branchorder.branchorder];
cullheimbify    = [cullheimanalysis.bifurcation.branchorder.numbersegments.mean];
cullheimbifstd  = [cullheimanalysis.bifurcation.branchorder.numbersegments.std];
cullheimtermx   = [cullheimanalysis.termination.branchorder.branchorder];
cullheimtermy   = [cullheimanalysis.termination.branchorder.numbersegments.mean];
cullheimtermstd   = [cullheimanalysis.termination.branchorder.numbersegments.std];

hillmanbifx    = [hillmananalysis.bifurcation.branchorder.branchorder];
hillmanbify    = [hillmananalysis.bifurcation.branchorder.numbersegments.mean];
hillmanbifstd  = [hillmananalysis.bifurcation.branchorder.numbersegments.std];
hillmantermx   = [hillmananalysis.termination.branchorder.branchorder];
hillmantermy   = [hillmananalysis.termination.branchorder.numbersegments.mean];
hillmantermstd = [hillmananalysis.termination.branchorder.numbersegments.std];

burkebifx    = [burkeanalysis.bifurcation.branchorder.branchorder];
burkebify    = [burkeanalysis.bifurcation.branchorder.numbersegments.mean];
burkebifstd  = [burkeanalysis.bifurcation.branchorder.numbersegments.std];
burketermx   = [burkeanalysis.termination.branchorder.branchorder];
burketermy   = [burkeanalysis.termination.branchorder.numbersegments.mean];
burketermstd = [burkeanalysis.termination.branchorder.numbersegments.std];

grahambifx    = [grahamanalysis.bifurcation.branchorder.branchorder];
grahambify    = [grahamanalysis.bifurcation.branchorder.numbersegments.mean];
grahambifstd  = [grahamanalysis.bifurcation.branchorder.numbersegments.std];
grahamtermx   = [grahamanalysis.termination.branchorder.branchorder];
grahamtermy   = [grahamanalysis.termination.branchorder.numbersegments.mean];
grahamtermstd = [grahamanalysis.termination.branchorder.numbersegments.std];


subplot(5,3,1); box on;
errorbar(cullheimbifx,cullheimbify,cullheimbifstd,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
hold on;
errorbar(cullheimtermx,cullheimtermy,cullheimtermstd,'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
errorbar(hillmanbifx,hillmanbify,hillmanbifstd,'-sk','MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
errorbar(hillmantermx,hillmantermy,hillmantermstd,'-dk','MarkerEdgeColor','k','MarkerFaceColor','m','MarkerSize',magentamarkersize);
ylabel('Number of Segments','FontSize',labelfontsize,'FontWeight','b');
title('Hillman/Ascoli Algorithm','FontSize',titlefontsize,'FontWeight','b');
%set(gca,'xscale','log');
xlim([0 15]);
ylim([0 60]);
set(gca,'xticklabel', []);
set(gca,'FontSize',axesfontsize); hold off;

subplot(5,3,2); box on;
errorbar(cullheimbifx,cullheimbify,cullheimbifstd,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
hold on;
errorbar(cullheimtermx,cullheimtermy,cullheimtermstd,'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
errorbar(burkebifx,burkebify,burkebifstd,'-sk','MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
errorbar(burketermx,burketermy,burketermstd,'-dk','MarkerEdgeColor','k','MarkerFaceColor','m','MarkerSize',magentamarkersize);
title('Burke/Ascoli Algorithm','FontSize',titlefontsize,'FontWeight','b');
%set(gca,'xscale','log');
xlim([0 15]);
ylim([0 60]);
set(gca,'xticklabel', []);
set(gca,'yticklabel', []);
set(gca,'FontSize',axesfontsize); hold off;

subplot(5,3,3); box on;
errorbar(cullheimbifx,cullheimbify,cullheimbifstd,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
hold on;
errorbar(cullheimtermx,cullheimtermy,cullheimtermstd,'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
errorbar(grahambifx,grahambify,grahambifstd,'-sk','MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
errorbar(grahamtermx,grahamtermy,grahamtermstd,'-dk','MarkerEdgeColor','k','MarkerFaceColor','m','MarkerSize',magentamarkersize);
title('Graham Algorithm','FontSize',titlefontsize,'FontWeight','b');
%set(gca,'xscale','log');
xlim([0 15]);
ylim([0 60]);
set(gca,'xticklabel', []);
set(gca,'yticklabel', []);
set(gca,'FontSize',axesfontsize); hold off;


cullheimbifx    = [cullheimanalysis.bifurcation.branchorder.branchorder];
cullheimbify    = [cullheimanalysis.bifurcation.branchorder.cylindricaldiameter.mean];
cullheimbifstd  = [cullheimanalysis.bifurcation.branchorder.cylindricaldiameter.std];
cullheimtermx   = [cullheimanalysis.termination.branchorder.branchorder];
cullheimtermy   = [cullheimanalysis.termination.branchorder.cylindricaldiameter.mean];
cullheimtermstd = [cullheimanalysis.termination.branchorder.cylindricaldiameter.std];

hillmanbifx    = [hillmananalysis.bifurcation.branchorder.branchorder];
hillmanbify    = [hillmananalysis.bifurcation.branchorder.cylindricaldiameter.mean];
hillmanbifstd  = [hillmananalysis.bifurcation.branchorder.cylindricaldiameter.std];
hillmantermx   = [hillmananalysis.termination.branchorder.branchorder];
hillmantermy   = [hillmananalysis.termination.branchorder.cylindricaldiameter.mean];
hillmantermstd = [hillmananalysis.termination.branchorder.cylindricaldiameter.std];

burkebifx    = [burkeanalysis.bifurcation.branchorder.branchorder];
burkebify    = [burkeanalysis.bifurcation.branchorder.cylindricaldiameter.mean];
burkebifstd  = [burkeanalysis.bifurcation.branchorder.cylindricaldiameter.std];
burketermx   = [burkeanalysis.termination.branchorder.branchorder];
burketermy   = [burkeanalysis.termination.branchorder.cylindricaldiameter.mean];
burketermstd = [burkeanalysis.termination.branchorder.cylindricaldiameter.std];

grahambifx    = [grahamanalysis.bifurcation.branchorder.branchorder];
grahambify    = [grahamanalysis.bifurcation.branchorder.cylindricaldiameter.mean];
grahambifstd  = [grahamanalysis.bifurcation.branchorder.cylindricaldiameter.std];
grahamtermx   = [grahamanalysis.termination.branchorder.branchorder];
grahamtermy   = [grahamanalysis.termination.branchorder.cylindricaldiameter.mean];
grahamtermstd = [grahamanalysis.termination.branchorder.cylindricaldiameter.std];

subplot(5,3,4); box on;
errorbar(cullheimbifx,cullheimbify,cullheimbifstd,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
hold on;
errorbar(cullheimtermx,cullheimtermy,cullheimtermstd,'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
errorbar(hillmanbifx,hillmanbify,hillmanbifstd,'-sk','MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',yellowmarkersize);  
errorbar(hillmantermx,hillmantermy,hillmantermstd,'-dk','MarkerEdgeColor','k','MarkerFaceColor','m','MarkerSize',magentamarkersize);   
ylabel('Diameter','FontSize',labelfontsize,'FontWeight','b');
%set(gca,'yscale','log');
%set(gca,'xscale','log');
xlim([0 15]);
ylim([0 10]);
set(gca,'xticklabel', []);
set(gca,'FontSize',axesfontsize); hold off;

subplot(5,3,5); box on;
errorbar(cullheimbifx,cullheimbify,cullheimbifstd,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
hold on;
errorbar(cullheimtermx,cullheimtermy,cullheimtermstd,'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
errorbar(burkebifx,burkebify,burkebifstd,'-sk','MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',yellowmarkersize);  
errorbar(burketermx,burketermy,burketermstd,'-dk','MarkerEdgeColor','k','MarkerFaceColor','m','MarkerSize',magentamarkersize);  
%set(gca,'yscale','log');
%set(gca,'xscale','log');
xlim([0 15]);
ylim([0 10]);
set(gca,'xticklabel', []);
set(gca,'yticklabel', []);
set(gca,'FontSize',axesfontsize); hold off; 


subplot(5,3,6); box on;
errorbar(cullheimbifx,cullheimbify,cullheimbifstd,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
hold on;
errorbar(cullheimtermx,cullheimtermy,cullheimtermstd,'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
errorbar(grahambifx,grahambify,grahambifstd,'-sk','MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',yellowmarkersize);  
errorbar(grahamtermx,grahamtermy,grahamtermstd,'-dk','MarkerEdgeColor','k','MarkerFaceColor','m','MarkerSize',magentamarkersize);  
%set(gca,'yscale','log');
%set(gca,'xscale','log');
xlim([0 15]);
ylim([0 10]);
set(gca,'xticklabel', []);
set(gca,'yticklabel', []);
set(gca,'FontSize',axesfontsize); hold off; 


cullheimbifx    = [cullheimanalysis.bifurcation.branchorder.branchorder];
cullheimbify    = [cullheimanalysis.bifurcation.branchorder.totallength.mean];
cullheimbifstd  = [cullheimanalysis.bifurcation.branchorder.totallength.std];
cullheimtermx   = [cullheimanalysis.termination.branchorder.branchorder];
cullheimtermy   = [cullheimanalysis.termination.branchorder.totallength.mean];
cullheimtermstd = [cullheimanalysis.termination.branchorder.totallength.std];

hillmanbifx    = [hillmananalysis.bifurcation.branchorder.branchorder];
hillmanbify    = [hillmananalysis.bifurcation.branchorder.totallength.mean];
hillmanbifstd  = [hillmananalysis.bifurcation.branchorder.totallength.std];
hillmantermx   = [hillmananalysis.termination.branchorder.branchorder];
hillmantermy   = [hillmananalysis.termination.branchorder.totallength.mean];
hillmantermstd = [hillmananalysis.termination.branchorder.totallength.std];

burkebifx    = [burkeanalysis.bifurcation.branchorder.branchorder];
burkebify    = [burkeanalysis.bifurcation.branchorder.totallength.mean];
burkebifstd  = [burkeanalysis.bifurcation.branchorder.totallength.std];
burketermx   = [burkeanalysis.termination.branchorder.branchorder];
burketermy   = [burkeanalysis.termination.branchorder.totallength.mean];
burketermstd = [burkeanalysis.termination.branchorder.totallength.std];

grahambifx    = [grahamanalysis.bifurcation.branchorder.branchorder];
grahambify    = [grahamanalysis.bifurcation.branchorder.totallength.mean];
grahambifstd  = [grahamanalysis.bifurcation.branchorder.totallength.std];
grahamtermx   = [grahamanalysis.termination.branchorder.branchorder];
grahamtermy   = [grahamanalysis.termination.branchorder.totallength.mean];
grahamtermstd = [grahamanalysis.termination.branchorder.totallength.std];

subplot(5,3,7); box on;
errorbar(cullheimbifx,cullheimbify,cullheimbifstd,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
hold on;
errorbar(cullheimtermx,cullheimtermy,cullheimtermstd,'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
errorbar(hillmanbifx,hillmanbify,hillmanbifstd,'-sk','MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',yellowmarkersize);  
errorbar(hillmantermx,hillmantermy,hillmantermstd,'-dk','MarkerEdgeColor','k','MarkerFaceColor','m','MarkerSize',magentamarkersize);   
set(gca,'xticklabel', []);
%set(gca,'yscale','log');
xlim([0 15]);
ylim([0 27500]);
set(gca,'FontSize',axesfontsize); hold off;
ylabel('Length (\mum)','FontSize',labelfontsize,'FontWeight','b');

subplot(5,3,8); box on;
errorbar(cullheimbifx,cullheimbify,cullheimbifstd,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
hold on;
errorbar(cullheimtermx,cullheimtermy,cullheimtermstd,'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
errorbar(burkebifx,burkebify,burkebifstd,'-sk','MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',yellowmarkersize);  
errorbar(burketermx,burketermy,burketermstd,'-dk','MarkerEdgeColor','k','MarkerFaceColor','m','MarkerSize',magentamarkersize);   
set(gca,'xticklabel', []);
set(gca,'yticklabel', []);
%set(gca,'yscale','log');
xlim([0 15]);
ylim([0 27500]);
set(gca,'FontSize',axesfontsize); hold off;

subplot(5,3,9); box on;
errorbar(cullheimbifx,cullheimbify,cullheimbifstd,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
hold on;
errorbar(cullheimtermx,cullheimtermy,cullheimtermstd,'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
errorbar(grahambifx,grahambify,grahambifstd,'-sk','MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',yellowmarkersize);  
errorbar(grahamtermx,grahamtermy,grahamtermstd,'-dk','MarkerEdgeColor','k','MarkerFaceColor','m','MarkerSize',magentamarkersize);   
set(gca,'xticklabel', []);
set(gca,'yticklabel', []);
%set(gca,'yscale','log');
xlim([0 15]);
ylim([0 27500]);
set(gca,'FontSize',axesfontsize); hold off;


cullheimbifx    = [cullheimanalysis.bifurcation.branchorder.branchorder];
cullheimbify    = [cullheimanalysis.bifurcation.branchorder.totalsurfacearea.mean];
cullheimbifstd  = [cullheimanalysis.bifurcation.branchorder.totalsurfacearea.std];

hillmanbifx    = [hillmananalysis.bifurcation.branchorder.branchorder];
hillmanbify    = [hillmananalysis.bifurcation.branchorder.totalsurfacearea.mean];
hillmanbifstd  = [hillmananalysis.bifurcation.branchorder.totalsurfacearea.std];

burkebifx    = [burkeanalysis.bifurcation.branchorder.branchorder];
burkebify    = [burkeanalysis.bifurcation.branchorder.totalsurfacearea.mean];
burkebifstd  = [burkeanalysis.bifurcation.branchorder.totalsurfacearea.std];

grahambifx    = [grahamanalysis.bifurcation.branchorder.branchorder];
grahambify    = [grahamanalysis.bifurcation.branchorder.totalsurfacearea.mean];
grahambifstd  = [grahamanalysis.bifurcation.branchorder.totalsurfacearea.std];

subplot(5,3,10); box on;
errorbar(cullheimbifx,cullheimbify,cullheimbifstd,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
hold on;
errorbar(cullheimtermx,cullheimtermy,cullheimtermstd,'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
errorbar(hillmanbifx,hillmanbify,hillmanbifstd,'-sk','MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',yellowmarkersize);  
errorbar(hillmantermx,hillmantermy,hillmantermstd,'-dk','MarkerEdgeColor','k','MarkerFaceColor','m','MarkerSize',magentamarkersize);
ylabel('Surface Area (\mum^2)','FontSize',labelfontsize,'FontWeight','b');
%set(gca,'yscale','log');
%set(gca,'xscale','log');
set(gca,'xticklabel', []);
xlim([0 15]);
ylim([0 80000]);
set(gca,'FontSize',axesfontsize); hold off;

subplot(5,3,11); box on;
errorbar(cullheimbifx,cullheimbify,cullheimbifstd,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
hold on;
errorbar(cullheimtermx,cullheimtermy,cullheimtermstd,'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
errorbar(burkebifx,burkebify,burkebifstd,'-sk','MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',yellowmarkersize);  
errorbar(burketermx,burketermy,burketermstd,'-dk','MarkerEdgeColor','k','MarkerFaceColor','m','MarkerSize',magentamarkersize);
%set(gca,'yscale','log');
%set(gca,'xscale','log');
set(gca,'xticklabel', []);
set(gca,'yticklabel', []);
xlim([0 15]);
ylim([0 80000]);
set(gca,'FontSize',axesfontsize); hold off;   

subplot(5,3,12); box on;
errorbar(cullheimbifx,cullheimbify,cullheimbifstd,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
hold on;
errorbar(cullheimtermx,cullheimtermy,cullheimtermstd,'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
errorbar(grahambifx,grahambify,grahambifstd,'-sk','MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',yellowmarkersize);  
errorbar(grahamtermx,grahamtermy,grahamtermstd,'-dk','MarkerEdgeColor','k','MarkerFaceColor','m','MarkerSize',magentamarkersize);  
%set(gca,'yscale','log');
%set(gca,'xscale','log');
set(gca,'xticklabel', []);
set(gca,'yticklabel', []);
xlim([0 15]);
ylim([0 80000]);
set(gca,'FontSize',axesfontsize); hold off; 


cullheimbifx    = [cullheimanalysis.bifurcation.branchorder.branchorder];
cullheimbify    = [cullheimanalysis.bifurcation.branchorder.totalvolume.mean];
cullheimbifstd  = [cullheimanalysis.bifurcation.branchorder.totalvolume.std];

hillmanbifx    = [hillmananalysis.bifurcation.branchorder.branchorder];
hillmanbify    = [hillmananalysis.bifurcation.branchorder.totalvolume.mean];
hillmanbifstd  = [hillmananalysis.bifurcation.branchorder.totalvolume.std];

burkebifx    = [burkeanalysis.bifurcation.branchorder.branchorder];
burkebify    = [burkeanalysis.bifurcation.branchorder.totalvolume.mean];
burkebifstd  = [burkeanalysis.bifurcation.branchorder.totalvolume.std];

grahambifx    = [grahamanalysis.bifurcation.branchorder.branchorder];
grahambify    = [grahamanalysis.bifurcation.branchorder.totalvolume.mean];
grahambifstd  = [grahamanalysis.bifurcation.branchorder.totalvolume.std];

subplot(5,3,13); box on;
errorbar(cullheimbifx,cullheimbify,cullheimbifstd,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
hold on;
errorbar(cullheimtermx,cullheimtermy,cullheimtermstd,'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
errorbar(hillmanbifx,hillmanbify,hillmanbifstd,'-sk','MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',yellowmarkersize);  
errorbar(hillmantermx,hillmantermy,hillmantermstd,'-dk','MarkerEdgeColor','k','MarkerFaceColor','m','MarkerSize',magentamarkersize);
ylabel('Volume (\mum^3)','FontSize',labelfontsize,'FontWeight','b');
xlabel('Branch Order','FontSize',labelfontsize,'FontWeight','b');
%set(gca,'yscale','log');
%set(gca,'xscale','log');
xlim([0 15]);
ylim([0 100000]);
set(gca,'FontSize',axesfontsize); hold off;

subplot(5,3,14); box on;
errorbar(cullheimbifx,cullheimbify,cullheimbifstd,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
hold on;
errorbar(cullheimtermx,cullheimtermy,cullheimtermstd,'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
errorbar(burkebifx,burkebify,burkebifstd,'-sk','MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',yellowmarkersize);  
errorbar(burketermx,burketermy,burketermstd,'-dk','MarkerEdgeColor','k','MarkerFaceColor','m','MarkerSize',magentamarkersize);
xlabel('Branch Order','FontSize',labelfontsize,'FontWeight','b');
set(gca,'yticklabel', []);
%set(gca,'yscale','log');
%set(gca,'xscale','log');
xlim([0 15]);
ylim([0 100000]);
set(gca,'FontSize',axesfontsize); hold off;

subplot(5,3,15); box on;
errorbar(cullheimbifx,cullheimbify,cullheimbifstd,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
hold on;
errorbar(cullheimtermx,cullheimtermy,cullheimtermstd,'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
errorbar(grahambifx,grahambify,grahambifstd,'-sk','MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',yellowmarkersize);  
errorbar(grahamtermx,grahamtermy,grahamtermstd,'-dk','MarkerEdgeColor','k','MarkerFaceColor','m','MarkerSize',magentamarkersize);  
xlabel('Branch Order','FontSize',labelfontsize,'FontWeight','b');
set(gca,'yticklabel', []);
%set(gca,'yscale','log');
%set(gca,'xscale','log');
xlim([0 15]);
ylim([0 100000]);
set(gca,'FontSize',axesfontsize); hold off;

subplotspace('horizontal',-20);
subplotspace('vertical',-20);

currentdirectory = cd;
cd(cullheimanalysis.datapathname);
cd ..

filename = 'EmergenceVBranchOrder';
print('-djpeg99',filename);
print('-dill',filename);

