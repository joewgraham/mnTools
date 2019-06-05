function emergencevpathlengthfigures(cullheimanalysis,hillmananalysis,burkeanalysis,grahamanalysis)
% Bif/term path length figures

titlefontsize = 8;
labelfontsize = 7;
axesfontsize  = 5;
insetfontsize = 5;

greenmarkersize   = 6;
yellowmarkersize  = 5;
redmarkersize     = 5;
magentamarkersize = 4;

figure;

cullheimbifx    = [cullheimanalysis.bifurcation.pathlength.pathlength];
cullheimbify    = [cullheimanalysis.bifurcation.pathlength.numbersegments.mean];
cullheimbifstd  = [cullheimanalysis.bifurcation.pathlength.numbersegments.std];
cullheimtermx   = [cullheimanalysis.termination.pathlength.pathlength];
cullheimtermy   = [cullheimanalysis.termination.pathlength.numbersegments.mean];
cullheimtermstd   = [cullheimanalysis.termination.pathlength.numbersegments.std];

hillmanbifx    = [hillmananalysis.bifurcation.pathlength.pathlength];
hillmanbify    = [hillmananalysis.bifurcation.pathlength.numbersegments.mean];
hillmanbifstd  = [hillmananalysis.bifurcation.pathlength.numbersegments.std];
hillmantermx   = [hillmananalysis.termination.pathlength.pathlength];
hillmantermy   = [hillmananalysis.termination.pathlength.numbersegments.mean];
hillmantermstd = [hillmananalysis.termination.pathlength.numbersegments.std];

burkebifx    = [burkeanalysis.bifurcation.pathlength.pathlength];
burkebify    = [burkeanalysis.bifurcation.pathlength.numbersegments.mean];
burkebifstd  = [burkeanalysis.bifurcation.pathlength.numbersegments.std];
burketermx   = [burkeanalysis.termination.pathlength.pathlength];
burketermy   = [burkeanalysis.termination.pathlength.numbersegments.mean];
burketermstd = [burkeanalysis.termination.pathlength.numbersegments.std];

grahambifx    = [grahamanalysis.bifurcation.pathlength.pathlength];
grahambify    = [grahamanalysis.bifurcation.pathlength.numbersegments.mean];
grahambifstd  = [grahamanalysis.bifurcation.pathlength.numbersegments.std];
grahamtermx   = [grahamanalysis.termination.pathlength.pathlength];
grahamtermy   = [grahamanalysis.termination.pathlength.numbersegments.mean];
grahamtermstd = [grahamanalysis.termination.pathlength.numbersegments.std];


subplot(5,3,1); box on;
errorbar(cullheimbifx,cullheimbify,cullheimbifstd,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
hold on;
errorbar(cullheimtermx,cullheimtermy,cullheimtermstd,'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
errorbar(hillmanbifx,hillmanbify,hillmanbifstd,'-sk','MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
errorbar(hillmantermx,hillmantermy,hillmantermstd,'-dk','MarkerEdgeColor','k','MarkerFaceColor','m','MarkerSize',magentamarkersize);
ylabel('Number of Segments','FontSize',labelfontsize,'FontWeight','b');
title('Hillman/Ascoli Algorithm','FontSize',titlefontsize,'FontWeight','b');
%set(gca,'xscale','log');
xlim([0 2500]);
ylim([0 150]);
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
xlim([0 2500]);
ylim([0 150]);
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
xlim([0 2500]);
ylim([0 150]);
set(gca,'xticklabel', []);
set(gca,'yticklabel', []);
set(gca,'FontSize',axesfontsize); hold off;


cullheimbifx    = [cullheimanalysis.bifurcation.pathlength.pathlength];
cullheimbify    = [cullheimanalysis.bifurcation.pathlength.diameter.mean];
cullheimbifstd  = [cullheimanalysis.bifurcation.pathlength.diameter.std];
cullheimtermx   = [cullheimanalysis.termination.pathlength.pathlength];
cullheimtermy   = [cullheimanalysis.termination.pathlength.diameter.mean];
cullheimtermstd = [cullheimanalysis.termination.pathlength.diameter.std];

hillmanbifx    = [hillmananalysis.bifurcation.pathlength.pathlength];
hillmanbify    = [hillmananalysis.bifurcation.pathlength.diameter.mean];
hillmanbifstd  = [hillmananalysis.bifurcation.pathlength.diameter.std];
hillmantermx   = [hillmananalysis.termination.pathlength.pathlength];
hillmantermy   = [hillmananalysis.termination.pathlength.diameter.mean];
hillmantermstd = [hillmananalysis.termination.pathlength.diameter.std];

burkebifx    = [burkeanalysis.bifurcation.pathlength.pathlength];
burkebify    = [burkeanalysis.bifurcation.pathlength.diameter.mean];
burkebifstd  = [burkeanalysis.bifurcation.pathlength.diameter.std];
burketermx   = [burkeanalysis.termination.pathlength.pathlength];
burketermy   = [burkeanalysis.termination.pathlength.diameter.mean];
burketermstd = [burkeanalysis.termination.pathlength.diameter.std];

grahambifx    = [grahamanalysis.bifurcation.pathlength.pathlength];
grahambify    = [grahamanalysis.bifurcation.pathlength.diameter.mean];
grahambifstd  = [grahamanalysis.bifurcation.pathlength.diameter.std];
grahamtermx   = [grahamanalysis.termination.pathlength.pathlength];
grahamtermy   = [grahamanalysis.termination.pathlength.diameter.mean];
grahamtermstd = [grahamanalysis.termination.pathlength.diameter.std];

subplot(5,3,4); box on;
errorbar(cullheimbifx,cullheimbify,cullheimbifstd,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
hold on;
errorbar(cullheimtermx,cullheimtermy,cullheimtermstd,'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
errorbar(hillmanbifx,hillmanbify,hillmanbifstd,'-sk','MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',yellowmarkersize);  
errorbar(hillmantermx,hillmantermy,hillmantermstd,'-dk','MarkerEdgeColor','k','MarkerFaceColor','m','MarkerSize',magentamarkersize);   
ylabel('Diameter','FontSize',labelfontsize,'FontWeight','b');
%set(gca,'yscale','log');
%set(gca,'xscale','log');
xlim([0 2500]);
ylim([0 8]);
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
xlim([0 2500]);
ylim([0 8]);
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
xlim([0 2500]);
ylim([0 8]);
set(gca,'xticklabel', []);
set(gca,'yticklabel', []);
set(gca,'FontSize',axesfontsize); hold off; 


cullheimbifx    = [cullheimanalysis.bifurcation.pathlength.pathlength];
cullheimbify    = [cullheimanalysis.bifurcation.pathlength.length.mean];
cullheimbifstd  = [cullheimanalysis.bifurcation.pathlength.length.std];
cullheimtermx   = [cullheimanalysis.termination.pathlength.pathlength];
cullheimtermy   = [cullheimanalysis.termination.pathlength.length.mean];
cullheimtermstd = [cullheimanalysis.termination.pathlength.length.std];

hillmanbifx    = [hillmananalysis.bifurcation.pathlength.pathlength];
hillmanbify    = [hillmananalysis.bifurcation.pathlength.length.mean];
hillmanbifstd  = [hillmananalysis.bifurcation.pathlength.length.std];
hillmantermx   = [hillmananalysis.termination.pathlength.pathlength];
hillmantermy   = [hillmananalysis.termination.pathlength.length.mean];
hillmantermstd = [hillmananalysis.termination.pathlength.length.std];

burkebifx    = [burkeanalysis.bifurcation.pathlength.pathlength];
burkebify    = [burkeanalysis.bifurcation.pathlength.length.mean];
burkebifstd  = [burkeanalysis.bifurcation.pathlength.length.std];
burketermx   = [burkeanalysis.termination.pathlength.pathlength];
burketermy   = [burkeanalysis.termination.pathlength.length.mean];
burketermstd = [burkeanalysis.termination.pathlength.length.std];

grahambifx    = [grahamanalysis.bifurcation.pathlength.pathlength];
grahambify    = [grahamanalysis.bifurcation.pathlength.length.mean];
grahambifstd  = [grahamanalysis.bifurcation.pathlength.length.std];
grahamtermx   = [grahamanalysis.termination.pathlength.pathlength];
grahamtermy   = [grahamanalysis.termination.pathlength.length.mean];
grahamtermstd = [grahamanalysis.termination.pathlength.length.std];

subplot(5,3,7); box on;
errorbar(cullheimbifx,cullheimbify,cullheimbifstd,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
hold on;
errorbar(cullheimtermx,cullheimtermy,cullheimtermstd,'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
errorbar(hillmanbifx,hillmanbify,hillmanbifstd,'-sk','MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',yellowmarkersize);  
errorbar(hillmantermx,hillmantermy,hillmantermstd,'-dk','MarkerEdgeColor','k','MarkerFaceColor','m','MarkerSize',magentamarkersize);   
set(gca,'xticklabel', []);
%set(gca,'yscale','log');
xlim([0 2500]);
ylim([0 13000]);
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
xlim([0 2500]);
ylim([0 13000]);
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
xlim([0 2500]);
ylim([0 13000]);
set(gca,'FontSize',axesfontsize); hold off;


cullheimbifx    = [cullheimanalysis.bifurcation.pathlength.pathlength];
cullheimbify    = [cullheimanalysis.bifurcation.pathlength.surfacearea.mean];
cullheimbifstd  = [cullheimanalysis.bifurcation.pathlength.surfacearea.std];

hillmanbifx    = [hillmananalysis.bifurcation.pathlength.pathlength];
hillmanbify    = [hillmananalysis.bifurcation.pathlength.surfacearea.mean];
hillmanbifstd  = [hillmananalysis.bifurcation.pathlength.surfacearea.std];

burkebifx    = [burkeanalysis.bifurcation.pathlength.pathlength];
burkebify    = [burkeanalysis.bifurcation.pathlength.surfacearea.mean];
burkebifstd  = [burkeanalysis.bifurcation.pathlength.surfacearea.std];

grahambifx    = [grahamanalysis.bifurcation.pathlength.pathlength];
grahambify    = [grahamanalysis.bifurcation.pathlength.surfacearea.mean];
grahambifstd  = [grahamanalysis.bifurcation.pathlength.surfacearea.std];

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
xlim([0 2500]);
ylim([0 50000]);
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
xlim([0 2500]);
ylim([0 50000]);
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
xlim([0 2500]);
ylim([0 50000]);
set(gca,'FontSize',axesfontsize); hold off; 


cullheimbifx    = [cullheimanalysis.bifurcation.pathlength.pathlength];
cullheimbify    = [cullheimanalysis.bifurcation.pathlength.volume.mean];
cullheimbifstd  = [cullheimanalysis.bifurcation.pathlength.volume.std];

hillmanbifx    = [hillmananalysis.bifurcation.pathlength.pathlength];
hillmanbify    = [hillmananalysis.bifurcation.pathlength.volume.mean];
hillmanbifstd  = [hillmananalysis.bifurcation.pathlength.volume.std];

burkebifx    = [burkeanalysis.bifurcation.pathlength.pathlength];
burkebify    = [burkeanalysis.bifurcation.pathlength.volume.mean];
burkebifstd  = [burkeanalysis.bifurcation.pathlength.volume.std];

grahambifx    = [grahamanalysis.bifurcation.pathlength.pathlength];
grahambify    = [grahamanalysis.bifurcation.pathlength.volume.mean];
grahambifstd  = [grahamanalysis.bifurcation.pathlength.volume.std];

subplot(5,3,13); box on;
errorbar(cullheimbifx,cullheimbify,cullheimbifstd,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
hold on;
errorbar(cullheimtermx,cullheimtermy,cullheimtermstd,'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
errorbar(hillmanbifx,hillmanbify,hillmanbifstd,'-sk','MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',yellowmarkersize);  
errorbar(hillmantermx,hillmantermy,hillmantermstd,'-dk','MarkerEdgeColor','k','MarkerFaceColor','m','MarkerSize',magentamarkersize);
ylabel('Volume (\mum^3)','FontSize',labelfontsize,'FontWeight','b');
xlabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
%set(gca,'yscale','log');
%set(gca,'xscale','log');
xlim([0 2500]);
ylim([0 70000]);
set(gca,'FontSize',axesfontsize); hold off;

subplot(5,3,14); box on;
errorbar(cullheimbifx,cullheimbify,cullheimbifstd,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
hold on;
errorbar(cullheimtermx,cullheimtermy,cullheimtermstd,'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
errorbar(burkebifx,burkebify,burkebifstd,'-sk','MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',yellowmarkersize);  
errorbar(burketermx,burketermy,burketermstd,'-dk','MarkerEdgeColor','k','MarkerFaceColor','m','MarkerSize',magentamarkersize);
xlabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
set(gca,'yticklabel', []);
%set(gca,'yscale','log');
%set(gca,'xscale','log');
xlim([0 2500]);
ylim([0 70000]);
set(gca,'FontSize',axesfontsize); hold off;

subplot(5,3,15); box on;
errorbar(cullheimbifx,cullheimbify,cullheimbifstd,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
hold on;
errorbar(cullheimtermx,cullheimtermy,cullheimtermstd,'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
errorbar(grahambifx,grahambify,grahambifstd,'-sk','MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',yellowmarkersize);  
errorbar(grahamtermx,grahamtermy,grahamtermstd,'-dk','MarkerEdgeColor','k','MarkerFaceColor','m','MarkerSize',magentamarkersize);  
xlabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
set(gca,'yticklabel', []);
%set(gca,'yscale','log');
%set(gca,'xscale','log');
xlim([0 2500]);
ylim([0 70000]);
set(gca,'FontSize',axesfontsize); hold off;

subplotspace('horizontal',-20);
subplotspace('vertical',-20);

currentdirectory = cd;
cd(cullheimanalysis.datapathname);
cd ..

filename = 'EmergenceVPathLength';
print('-djpeg99',filename);
print('-dill',filename);

