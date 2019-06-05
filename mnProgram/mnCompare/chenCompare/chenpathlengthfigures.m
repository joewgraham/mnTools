function chenpathlengthfigures(controlanalysis,testanalysis);
% Path Length Figures

labelfontsize = 12;
insetfontsize = 10;

figure;

if nargin == 1

    controldatax   = controlanalysis.pathlength.pathlength;

    subplot(3,3,1); box on; hold on;
    ylabel('Number Segments','FontSize',labelfontsize,'FontWeight','b');

    controldatay   = [controlanalysis.pathlength.numbersegments.mean];
    controldatastd = [controlanalysis.pathlength.numbersegments.std];

    errorbar(controldatax,controldatay,controldatastd/2,'-ob','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);

    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);

    xlimits=xlim;
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);

    hold off;


    subplot(3,3,4); box on; hold on;
    ylabel('Number Bifurcations','FontSize',labelfontsize,'FontWeight','b');

    controldatay   = [controlanalysis.pathlength.numberbifurcations.mean];
    controldatastd = [controlanalysis.pathlength.numberbifurcations.std];

    errorbar(controldatax,controldatay,controldatastd/2,'-ob','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);

    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);

    xlimits=xlim;
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);

    hold off;


    subplot(3,3,7); box on; hold on;
    ylabel('Number Terminations','FontSize',labelfontsize,'FontWeight','b');

    controldatay   = [controlanalysis.pathlength.numberterminations.mean];
    controldatastd = [controlanalysis.pathlength.numberterminations.std];

    errorbar(controldatax,controldatay,controldatastd/2,'-ob','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);

    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);

    %     xlimits=xlim;
    %     xtick = get(gca,'xtick');
    %     set(gca,'xticklabel', []);

    hold off;


    subplot(3,3,2); box on; hold on;
    ylabel('Length (\mum))','FontSize',labelfontsize,'FontWeight','b');

    controldatay   = [controlanalysis.pathlength.length.mean];
    controldatastd = [controlanalysis.pathlength.length.std];

    errorbar(controldatax,controldatay,controldatastd/2,'-ob','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);

    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);

    xlimits=xlim;
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);

    hold off;


    subplot(3,3,5); box on; hold on;
    ylabel('Surface Area (\mum^2)','FontSize',labelfontsize,'FontWeight','b');

    controldatay   = [controlanalysis.pathlength.surfacearea.mean];
    controldatastd = [controlanalysis.pathlength.surfacearea.std];

    errorbar(controldatax,controldatay,controldatastd/2,'-ob','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);

    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);

    xlimits=xlim;
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);

    hold off;


    subplot(3,3,8); box on; hold on;
    ylabel('Volume (\mum^3)','FontSize',labelfontsize,'FontWeight','b');

    controldatay   = [controlanalysis.pathlength.volume.mean];
    controldatastd = [controlanalysis.pathlength.volume.std];

    errorbar(controldatax,controldatay,controldatastd/2,'-ob','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);

    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);

    %     xlimits=xlim;
    %     xtick = get(gca,'xtick');
    %     set(gca,'xticklabel', []);

    hold off;


    subplot(3,3,3); box on; hold on;
    ylabel('Rall Ratio','FontSize',labelfontsize,'FontWeight','b');

    controldatay   = [controlanalysis.pathlength.rallratio.mean];
    controldatastd = [controlanalysis.pathlength.rallratio.std];

    errorbar(controldatax,controldatay,controldatastd/2,'-ob','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);

    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);

    xlimits=xlim;
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);

    hold off;


    subplot(3,3,6); box on; hold on;
    ylabel('Daughter Ratio','FontSize',labelfontsize,'FontWeight','b');

    controldatay   = [controlanalysis.pathlength.daughterratio.mean];
    controldatastd = [controlanalysis.pathlength.daughterratio.std];

    errorbar(controldatax,controldatay,controldatastd/2,'-ob','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);

    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);

    xlimits=xlim;
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);

    hold off;


    subplot(3,3,9); box on; hold on;
    ylabel('Mean Diam (\mum)','FontSize',labelfontsize,'FontWeight','b');

    controldatay   = [controlanalysis.pathlength.meandiameter.mean];
    controldatastd = [controlanalysis.pathlength.meandiameter.std];

    errorbar(controldatax,controldatay,controldatastd/2,'-ob','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);

    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);

    %     xlimits=xlim;
    %     xtick = get(gca,'xtick');
    %     set(gca,'xticklabel', []);

    hold off;


    %subplotspace('horizontal',-20);
    subplotspace('vertical',-20);

    [ax,h1]=suplabel('Path Length Distance from Soma (\mum)');
    [ax,h3]=suplabel('Morphometrics versus Path Length from Soma'  ,'t');
    set(h1,'FontSize',15);
    set(h3,'FontSize',20);


    currentdirectory = cd;
    cd(controlanalysis.datapathname);

    if exist('figures','dir')==7
        cd('figures');
    else
        mkdir('figures');
        cd('figures');
    end

    fillscreen;

    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Path_Length_Figure');
    print('-dmeta',filename);
    saveas(gcf,filename,'fig');

end


if nargin == 2

    controldatax   = controlanalysis.pathlength.pathlength;
    testdatax      = testanalysis.pathlength.pathlength;

    subplot(3,3,1); box on; hold on;
    ylabel('Number Segments','FontSize',labelfontsize,'FontWeight','b');

    controldatay   = [controlanalysis.pathlength.numbersegments.mean];
    controldatastd = [controlanalysis.pathlength.numbersegments.std];

    errorbar(controldatax,controldatay,controldatastd/2,'-ob','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);

    testdatay   = [testanalysis.pathlength.numbersegments.mean];
    testdatastd = [testanalysis.pathlength.numbersegments.std];

    errorbar(testdatax,testdatay,testdatastd/2,'-^r','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',6);

    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);

    xlimits=xlim;
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);

    hold off;


    subplot(3,3,4); box on; hold on;
    ylabel('Number Bifurcations','FontSize',labelfontsize,'FontWeight','b');

    controldatay   = [controlanalysis.pathlength.numberbifurcations.mean];
    controldatastd = [controlanalysis.pathlength.numberbifurcations.std];

    errorbar(controldatax,controldatay,controldatastd/2,'-ob','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);

    testdatay   = [testanalysis.pathlength.numberbifurcations.mean];
    testdatastd = [testanalysis.pathlength.numberbifurcations.std];

    errorbar(testdatax,testdatay,testdatastd/2,'-^r','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',6);

    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);

    xlimits=xlim;
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);

    hold off;


    subplot(3,3,7); box on; hold on;
    ylabel('Number Terminations','FontSize',labelfontsize,'FontWeight','b');

    controldatay   = [controlanalysis.pathlength.numberterminations.mean];
    controldatastd = [controlanalysis.pathlength.numberterminations.std];

    errorbar(controldatax,controldatay,controldatastd/2,'-ob','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);

    testdatay   = [testanalysis.pathlength.numberterminations.mean];
    testdatastd = [testanalysis.pathlength.numberterminations.std];

    errorbar(testdatax,testdatay,testdatastd/2,'-^r','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',6);

    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);

    %     xlimits=xlim;
    %     xtick = get(gca,'xtick');
    %     set(gca,'xticklabel', []);

    hold off;


    subplot(3,3,2); box on; hold on;
    ylabel('Length (10^3 \mum)','FontSize',labelfontsize,'FontWeight','b');

    controldatay   = [controlanalysis.pathlength.length.mean];
    controldatastd = [controlanalysis.pathlength.length.std];

    errorbar(controldatax,controldatay,controldatastd/2,'-ob','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);

    testdatay   = [testanalysis.pathlength.length.mean]/1000;
    testdatastd = [testanalysis.pathlength.length.std]/1000;

    errorbar(testdatax,testdatay,testdatastd/2,'-^r','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',6);

    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);

    xlimits=xlim;
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);

    hold off;


    subplot(3,3,5); box on; hold on;
    ylabel('Surface Area (10^3 \mum^2)','FontSize',labelfontsize,'FontWeight','b');

    controldatay   = [controlanalysis.pathlength.surfacearea.mean];
    controldatastd = [controlanalysis.pathlength.surfacearea.std];

    errorbar(controldatax,controldatay,controldatastd/2,'-ob','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);

    testdatay   = [testanalysis.pathlength.surfacearea.mean]/1000;
    testdatastd = [testanalysis.pathlength.surfacearea.std]/1000;

    errorbar(testdatax,testdatay,testdatastd/2,'-^r','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',6);

    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);

    xlimits=xlim;
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);

    hold off;


    subplot(3,3,8); box on; hold on;
    ylabel('Volume (10^3 \mum^3)','FontSize',labelfontsize,'FontWeight','b');

    controldatay   = [controlanalysis.pathlength.volume.mean];
    controldatastd = [controlanalysis.pathlength.volume.std];

    errorbar(controldatax,controldatay,controldatastd/2,'-ob','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);

    testdatay   = [testanalysis.pathlength.volume.mean]/1000;
    testdatastd = [testanalysis.pathlength.volume.std]/1000;

    errorbar(testdatax,testdatay,testdatastd/2,'-^r','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',6);

    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);

    %     xlimits=xlim;
    %     xtick = get(gca,'xtick');
    %     set(gca,'xticklabel', []);

    hold off;


    subplot(3,3,3); box on; hold on;
    ylabel('Rall Ratio','FontSize',labelfontsize,'FontWeight','b');

    controldatay   = [controlanalysis.pathlength.rallratio.mean];
    controldatastd = [controlanalysis.pathlength.rallratio.std];

    errorbar(controldatax,controldatay,controldatastd/2,'-ob','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);

    testdatay   = [testanalysis.pathlength.rallratio.mean];
    testdatastd = [testanalysis.pathlength.rallratio.std];

    errorbar(testdatax,testdatay,testdatastd/2,'-^r','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',6);

    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);

    xlimits=xlim;
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);

    hold off;


    subplot(3,3,6); box on; hold on;
    ylabel('Daughter Ratio','FontSize',labelfontsize,'FontWeight','b');

%     controldatay   = [controlanalysis.pathlength.daughterratio.mean];
%     controldatastd = [controlanalysis.pathlength.daughterratio.std];

%     errorbar(controldatax,controldatay,controldatastd/2,'-ob','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);

    testdatay   = [testanalysis.pathlength.daughterratio.mean];
    testdatastd = [testanalysis.pathlength.daughterratio.std];

    errorbar(testdatax,testdatay,testdatastd/2,'-^r','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',6);

    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);

    xlimits=xlim;
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);

    hold off;


    subplot(3,3,9); box on; hold on;
    ylabel('Mean Diam (\mum)','FontSize',labelfontsize,'FontWeight','b');

    controldatay   = [controlanalysis.pathlength.meandiameter.mean];
    controldatastd = [controlanalysis.pathlength.meandiameter.std];

    errorbar(controldatax,controldatay,controldatastd/2,'-ob','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);

    testdatay   = [testanalysis.pathlength.meandiameter.mean];
    testdatastd = [testanalysis.pathlength.meandiameter.std];

    errorbar(testdatax,testdatay,testdatastd/2,'-^r','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',6);

    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);

    %     xlimits=xlim;
    %     xtick = get(gca,'xtick');
    %     set(gca,'xticklabel', []);

    hold off;


    %subplotspace('horizontal',-20);
    subplotspace('vertical',-20);

    [ax,h1]=suplabel('Path Length Distance from Soma (\mum)');
    [ax,h3]=suplabel('Comparison of Morphometrics versus Path Length from Soma'  ,'t');
    set(h1,'FontSize',15);
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

    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'Path_Length_Comparison_Figure');
    print('-dmeta',filename);
    saveas(gcf,filename,'fig');

end
 
cd(currentdirectory);
 
 
 
 
 
 
 
 
 
 
 
 
 