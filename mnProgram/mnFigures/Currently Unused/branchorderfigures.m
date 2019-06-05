function branchorderfigures(controlanalysis,testanalysis)
% Branch Order Figures

labelfontsize = 12;

if nargin == 1
    
    figure;
    
    %----------------------------------------------------------------------
    controldatax   = controlanalysis.branchorder.branchorder;
    %testdatax      = testanalysis.branchorder.branchorder;

    subplot(3,3,1); box on; hold on;
    ylabel('# Segments','FontSize',labelfontsize,'FontWeight','b');

    controldatay   = [controlanalysis.branchorder.numbersegments.mean];
    controldatastd = [controlanalysis.branchorder.numbersegments.std];

    errorbar(controldatax,controldatay,controldatastd/2,'-ob','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);

    %testdatay   = [testanalysis.branchorder.numbersegments.mean];
    %testdatastd = [testanalysis.branchorder.numbersegments.std];

    %errorbar(testdatax,testdatay,testdatastd/2,'-^r','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',6);

    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);

    xlimits=xlim;
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);

    hold off;
    %----------------------------------------------------------------------
    controldatax   = controlanalysis.branchorder.branchorder;
    %testdatax      = testanalysis.branchorder.branchorder;

    subplot(3,3,4); box on; hold on;
    ylabel('# Bifurcations','FontSize',labelfontsize,'FontWeight','b');

    controldatay   = [controlanalysis.branchorder.numberbifurcations.mean];
    controldatastd = [controlanalysis.branchorder.numberbifurcations.std];

    errorbar(controldatax,controldatay,controldatastd/2,'-ob','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);

    %testdatay   = [testanalysis.branchorder.numberbifurcations.mean];
    %testdatastd = [testanalysis.branchorder.numberbifurcations.std];

    %errorbar(testdatax,testdatay,testdatastd/2,'-^r','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',6);

    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);

    xlimits=xlim;
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);

    hold off;
    %----------------------------------------------------------------------    
    controldatax   = controlanalysis.branchorder.branchorder;
    %testdatax      = testanalysis.branchorder.branchorder;

    subplot(3,3,7); box on; hold on;
    ylabel('# Terminations','FontSize',labelfontsize,'FontWeight','b');

    controldatay   = [controlanalysis.branchorder.numberterminations.mean];
    controldatastd = [controlanalysis.branchorder.numberterminations.std];

    errorbar(controldatax,controldatay,controldatastd/2,'-ob','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);

    %testdatay   = [testanalysis.branchorder.numberterminations.mean];
    %testdatastd = [testanalysis.branchorder.numberterminations.std];

    %errorbar(testdatax,testdatay,testdatastd/2,'-^r','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',6);

    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);

    %     xlimits=xlim;
    %     xtick = get(gca,'xtick');
    %     set(gca,'xticklabel', []);

    hold off;
    %----------------------------------------------------------------------
    controldatax   = controlanalysis.branchorder.branchorder;
    %testdatax      = testanalysis.branchorder.branchorder;

    subplot(3,3,2); box on; hold on;
    ylabel('Mean Length (\mum)','FontSize',labelfontsize,'FontWeight','b');

    controldatay   = [controlanalysis.branchorder.length.mean];
    controldatastd = [controlanalysis.branchorder.length.std];

    errorbar(controldatax,controldatay,controldatastd/2,'-ob','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);

    %testdatay   = [testanalysis.branchorder.meanlength.mean];
    %testdatastd = [testanalysis.branchorder.meanlength.std];

    %errorbar(testdatax,testdatay,testdatastd/2,'-^r','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',6);

    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);

    xlimits=xlim;
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);

    hold off;
    %----------------------------------------------------------------------    
    controldatax   = controlanalysis.branchorder.branchorder;
    %testdatax      = testanalysis.branchorder.branchorder;

    subplot(3,3,5); box on; hold on;
    ylabel('Mean Surface Area (\mum^2)','FontSize',labelfontsize,'FontWeight','b');

    controldatay   = [controlanalysis.branchorder.surfacearea.mean];
    controldatastd = [controlanalysis.branchorder.surfacearea.std];

    errorbar(controldatax,controldatay,controldatastd/2,'-ob','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);

    %testdatay   = [testanalysis.branchorder.meansurfacearea.mean];
    %testdatastd = [testanalysis.branchorder.meansurfacearea.std];

    %errorbar(testdatax,testdatay,testdatastd/2,'-^r','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',6);

    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);

    xlimits=xlim;
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);

    hold off;
    %----------------------------------------------------------------------        
    controldatax   = controlanalysis.branchorder.branchorder;
    %testdatax      = testanalysis.branchorder.branchorder;

    subplot(3,3,8); box on; hold on;
    ylabel('Mean Volume (\mum^3)','FontSize',labelfontsize,'FontWeight','b');

    controldatay   = [controlanalysis.branchorder.volume.mean];
    controldatastd = [controlanalysis.branchorder.volume.std];

    errorbar(controldatax,controldatay,controldatastd/2,'-ob','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);

    %testdatay   = [testanalysis.branchorder.meanvolume.mean];
    %testdatastd = [testanalysis.branchorder.meanvolume.std];

    %errorbar(testdatax,testdatay,testdatastd/2,'-^r','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',6);

    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);

    %     xlimits=xlim;
    %     xtick = get(gca,'xtick');
    %     set(gca,'xticklabel', []);

    hold off;
    %----------------------------------------------------------------------
    controldatax   = controlanalysis.branchorder.branchorder;
    %testdatax      = testanalysis.branchorder.branchorder;

    subplot(3,3,3); box on; hold on;
    ylabel('Total Length (\mum)','FontSize',labelfontsize,'FontWeight','b');

    controldatay   = [controlanalysis.branchorder.totallength.mean];
    controldatastd = [controlanalysis.branchorder.totallength.std];

    errorbar(controldatax,controldatay,controldatastd/2,'-ob','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);

    %testdatay   = [testanalysis.branchorder.totallength.mean];
    %testdatastd = [testanalysis.branchorder.totallength.std];

    %errorbar(testdatax,testdatay,testdatastd/2,'-^r','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',6);

    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);

    xlimits=xlim;
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);

    hold off;
    %----------------------------------------------------------------------    
    controldatax   = controlanalysis.branchorder.branchorder;
    %testdatax      = testanalysis.branchorder.branchorder;

    subplot(3,3,6); box on; hold on;
    ylabel('Total Surface Area (\mum^2)','FontSize',labelfontsize,'FontWeight','b');

    controldatay   = [controlanalysis.branchorder.totalsurfacearea.mean];
    controldatastd = [controlanalysis.branchorder.totalsurfacearea.std];

    errorbar(controldatax,controldatay,controldatastd/2,'-ob','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);

    %testdatay   = [testanalysis.branchorder.totalsurfacearea.mean];
    %testdatastd = [testanalysis.branchorder.totalsurfacearea.std];

    %errorbar(testdatax,testdatay,testdatastd/2,'-^r','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',6);

    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);

    xlimits=xlim;
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);

    hold off;
    %----------------------------------------------------------------------        
    controldatax   = controlanalysis.branchorder.branchorder;
    %testdatax      = testanalysis.branchorder.branchorder;

    subplot(3,3,9); box on; hold on;
    ylabel('Total Volume (\mum^3)','FontSize',labelfontsize,'FontWeight','b');

    controldatay   = [controlanalysis.branchorder.totalvolume.mean];
    controldatastd = [controlanalysis.branchorder.totalvolume.std];

    errorbar(controldatax,controldatay,controldatastd/2,'-ob','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);

    %testdatay   = [testanalysis.branchorder.totalvolume.mean];
    %testdatastd = [testanalysis.branchorder.totalvolume.std];

    %errorbar(testdatax,testdatay,testdatastd/2,'-^r','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',6);

    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);

    %     xlimits=xlim;
    %     xtick = get(gca,'xtick');
    %     set(gca,'xticklabel', []);

    hold off;
    %----------------------------------------------------------------------
    %subplotspace('horizontal',-20);
    subplotspace('vertical',-10);

    [ax,h1]=suplabel('Branch Order');
    [ax,h3]=suplabel('Morphometrics versus Branch Order'  ,'t');
    set(h1,'FontSize',15);
    set(h3,'FontSize',20);

    cd(controlanalysis.datapathname);

    if exist('figures','dir')==7
        cd('figures');
    else
        mkdir('figures');
        cd('figures');
    end

    fillscreen;

    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Branch_Order_Figure_1');
    print('-dmeta',filename);
    saveas(gcf,filename,'fig');
    %----------------------------------------------------------------------
    
    figure;
    
    %----------------------------------------------------------------------
    controldatax   = controlanalysis.branchorder.branchorder;
    %testdatax      = testanalysis.branchorder.branchorder;

    subplot(2,3,1); box on; hold on;
    ylabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');

    controldatay   = [controlanalysis.branchorder.proximaldiameter.mean];
    controldatastd = [controlanalysis.branchorder.proximaldiameter.std];

    errorbar(controldatax,controldatay,controldatastd/2,'-ob','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);

    %testdatay   = [testanalysis.branchorder.meanproximaldiameter.mean];
    %testdatastd = [testanalysis.branchorder.meanproximaldiameter.std];

    %errorbar(testdatax,testdatay,testdatastd/2,'-^r','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',6);

    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);

    xlimits=xlim;
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);

    hold off;
    %----------------------------------------------------------------------        
    controldatax   = controlanalysis.branchorder.branchorder;
    %testdatax      = testanalysis.branchorder.branchorder;

    subplot(2,3,2); box on; hold on;
    ylabel('Taper Rate','FontSize',labelfontsize,'FontWeight','b');

    controldatay   = [controlanalysis.branchorder.taperrate.mean];
    controldatastd = [controlanalysis.branchorder.taperrate.std];

    errorbar(controldatax,controldatay,controldatastd/2,'-ob','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);

    %testdatay   = [testanalysis.branchorder.meantaperrate.mean];
    %testdatastd = [testanalysis.branchorder.meantaperrate.std];

    %errorbar(testdatax,testdatay,testdatastd/2,'-^r','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',6);

    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);

    xlimits=xlim;
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);

    hold off;
    %----------------------------------------------------------------------
    controldatax   = controlanalysis.branchorder.branchorder;
    %testdatax      = testanalysis.branchorder.branchorder;

    subplot(2,3,3); box on; hold on;
    ylabel('Taper Ratio','FontSize',labelfontsize,'FontWeight','b');

    controldatay   = [controlanalysis.branchorder.taperratio.mean];
    controldatastd = [controlanalysis.branchorder.taperratio.std];

    errorbar(controldatax,controldatay,controldatastd/2,'-ob','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);

    %testdatay   = [testanalysis.branchorder.meantaperratio.mean];
    %testdatastd = [testanalysis.branchorder.meantaperratio.std];

    %errorbar(testdatax,testdatay,testdatastd/2,'-^r','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',6);

    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);

        xlimits=xlim;
        xtick = get(gca,'xtick');
        set(gca,'xticklabel', []);

    hold off;
    %----------------------------------------------------------------------
    controldatax   = controlanalysis.branchorder.branchorder;
    %testdatax      = testanalysis.branchorder.branchorder;

    subplot(2,3,4); box on; hold on;
    ylabel('Rall Ratio','FontSize',labelfontsize,'FontWeight','b');

    controldatay   = [controlanalysis.branchorder.rallratio.mean];
    controldatastd = [controlanalysis.branchorder.rallratio.std];

    errorbar(controldatax,controldatay,controldatastd/2,'-ob','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);

    %testdatay   = [testanalysis.branchorder.meanrallratio.mean];
    %testdatastd = [testanalysis.branchorder.meanrallratio.std];

    %errorbar(testdatax,testdatay,testdatastd/2,'-^r','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',6);

    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);

%         xlimits=xlim;
%         xtick = get(gca,'xtick');
%         set(gca,'xticklabel', []);

    hold off;
    %----------------------------------------------------------------------
    controldatax   = controlanalysis.branchorder.branchorder;
    %testdatax      = testanalysis.branchorder.branchorder;

    subplot(2,3,5); box on; hold on;
    ylabel('Parent/Daughter Ratio','FontSize',labelfontsize,'FontWeight','b');

    controldatay   = [controlanalysis.branchorder.parentdaughterratio.mean];
    controldatastd = [controlanalysis.branchorder.parentdaughterratio.std];

    errorbar(controldatax,controldatay,controldatastd/2,'-ob','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);

    %testdatay   = [testanalysis.branchorder.meanparentdaughterratio.mean];
    %testdatastd = [testanalysis.branchorder.meanparentdaughterratio.std];

    %errorbar(testdatax,testdatay,testdatastd/2,'-^r','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',6);

    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);

%         xlimits=xlim;
%         xtick = get(gca,'xtick');
%         set(gca,'xticklabel', []);

    hold off;
    %----------------------------------------------------------------------
    controldatax   = controlanalysis.branchorder.branchorder;
    %testdatax      = testanalysis.branchorder.branchorder;

    subplot(2,3,6); box on; hold on;
    ylabel('Daughter Ratio','FontSize',labelfontsize,'FontWeight','b');

    controldatay   = [controlanalysis.branchorder.daughterratio.mean];
    controldatastd = [controlanalysis.branchorder.daughterratio.std];

    errorbar(controldatax,controldatay,controldatastd/2,'-ob','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);

    %testdatay   = [testanalysis.branchorder.meandaughterratio.mean];
    %testdatastd = [testanalysis.branchorder.meandaughterratio.std];

    %errorbar(testdatax,testdatay,testdatastd/2,'-^r','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',6);

    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);

    %     xlimits=xlim;
    %     xtick = get(gca,'xtick');
    %     set(gca,'xticklabel', []);

    hold off;
    %----------------------------------------------------------------------
    %subplotspace('horizontal',-20);
    subplotspace('vertical',-10);

    [ax,h1]=suplabel('Branch Order');
    [ax,h3]=suplabel('Morphometrics versus Branch Order'  ,'t');
    set(h1,'FontSize',15);
    set(h3,'FontSize',20);

    cd(controlanalysis.datapathname);

    if exist('figures','dir')==7
        cd('figures');
    else
        mkdir('figures');
        cd('figures');
    end

    fillscreen;

    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Branch_Order_Figure_2');
    print('-dmeta',filename);
    saveas(gcf,filename,'fig');
    %----------------------------------------------------------------------


elseif nargin == 2
    
    figure;
    
    %----------------------------------------------------------------------
    controldatax   = controlanalysis.branchorder.branchorder;
    testdatax      = testanalysis.branchorder.branchorder;

    subplot(3,3,1); box on; hold on;
    ylabel('# Segments','FontSize',labelfontsize,'FontWeight','b');

    controldatay   = [controlanalysis.branchorder.numbersegments.mean];
    controldatastd = [controlanalysis.branchorder.numbersegments.std];

    errorbar(controldatax,controldatay,controldatastd/2,'-ob','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);

    testdatay   = [testanalysis.branchorder.numbersegments.mean];
    testdatastd = [testanalysis.branchorder.numbersegments.std];

    errorbar(testdatax,testdatay,testdatastd/2,'-^r','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',6);

    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);

    xlimits=xlim;
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);

    hold off;
    %----------------------------------------------------------------------
    controldatax   = controlanalysis.branchorder.branchorder;
    testdatax      = testanalysis.branchorder.branchorder;

    subplot(3,3,4); box on; hold on;
    ylabel('# Bifurcations','FontSize',labelfontsize,'FontWeight','b');

    controldatay   = [controlanalysis.branchorder.numberbifurcations.mean];
    controldatastd = [controlanalysis.branchorder.numberbifurcations.std];

    errorbar(controldatax,controldatay,controldatastd/2,'-ob','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);

    testdatay   = [testanalysis.branchorder.numberbifurcations.mean];
    testdatastd = [testanalysis.branchorder.numberbifurcations.std];

    errorbar(testdatax,testdatay,testdatastd/2,'-^r','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',6);

    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);

    xlimits=xlim;
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);

    hold off;
    %----------------------------------------------------------------------    
    controldatax   = controlanalysis.branchorder.branchorder;
    testdatax      = testanalysis.branchorder.branchorder;

    subplot(3,3,7); box on; hold on;
    ylabel('# Terminations','FontSize',labelfontsize,'FontWeight','b');

    controldatay   = [controlanalysis.branchorder.numberterminations.mean];
    controldatastd = [controlanalysis.branchorder.numberterminations.std];

    errorbar(controldatax,controldatay,controldatastd/2,'-ob','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);

    testdatay   = [testanalysis.branchorder.numberterminations.mean];
    testdatastd = [testanalysis.branchorder.numberterminations.std];

    errorbar(testdatax,testdatay,testdatastd/2,'-^r','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',6);

    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);

    %     xlimits=xlim;
    %     xtick = get(gca,'xtick');
    %     set(gca,'xticklabel', []);

    hold off;
    %----------------------------------------------------------------------
    controldatax   = controlanalysis.branchorder.branchorder;
    testdatax      = testanalysis.branchorder.branchorder;

    subplot(3,3,2); box on; hold on;
    ylabel('Mean Length (\mum)','FontSize',labelfontsize,'FontWeight','b');

    controldatay   = [controlanalysis.branchorder.meanlength.mean];
    controldatastd = [controlanalysis.branchorder.meanlength.std];

    errorbar(controldatax,controldatay,controldatastd/2,'-ob','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);

    testdatay   = [testanalysis.branchorder.meanlength.mean];
    testdatastd = [testanalysis.branchorder.meanlength.std];

    errorbar(testdatax,testdatay,testdatastd/2,'-^r','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',6);

    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);

    xlimits=xlim;
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);

    hold off;
    %----------------------------------------------------------------------    
    controldatax   = controlanalysis.branchorder.branchorder;
    testdatax      = testanalysis.branchorder.branchorder;

    subplot(3,3,5); box on; hold on;
    ylabel('Mean Surface Area (\mum^2)','FontSize',labelfontsize,'FontWeight','b');

    controldatay   = [controlanalysis.branchorder.meansurfacearea.mean];
    controldatastd = [controlanalysis.branchorder.meansurfacearea.std];

    errorbar(controldatax,controldatay,controldatastd/2,'-ob','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);

    testdatay   = [testanalysis.branchorder.meansurfacearea.mean];
    testdatastd = [testanalysis.branchorder.meansurfacearea.std];

    errorbar(testdatax,testdatay,testdatastd/2,'-^r','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',6);

    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);

    xlimits=xlim;
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);

    hold off;
    %----------------------------------------------------------------------        
    controldatax   = controlanalysis.branchorder.branchorder;
    testdatax      = testanalysis.branchorder.branchorder;

    subplot(3,3,8); box on; hold on;
    ylabel('Mean Volume (\mum^3)','FontSize',labelfontsize,'FontWeight','b');

    controldatay   = [controlanalysis.branchorder.meanvolume.mean];
    controldatastd = [controlanalysis.branchorder.meanvolume.std];

    errorbar(controldatax,controldatay,controldatastd/2,'-ob','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);

    testdatay   = [testanalysis.branchorder.meanvolume.mean];
    testdatastd = [testanalysis.branchorder.meanvolume.std];

    errorbar(testdatax,testdatay,testdatastd/2,'-^r','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',6);

    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);

    %     xlimits=xlim;
    %     xtick = get(gca,'xtick');
    %     set(gca,'xticklabel', []);

    hold off;
    %----------------------------------------------------------------------
    controldatax   = controlanalysis.branchorder.branchorder;
    testdatax      = testanalysis.branchorder.branchorder;

    subplot(3,3,3); box on; hold on;
    ylabel('Total Length (\mum)','FontSize',labelfontsize,'FontWeight','b');

    controldatay   = [controlanalysis.branchorder.totallength.mean];
    controldatastd = [controlanalysis.branchorder.totallength.std];

    errorbar(controldatax,controldatay,controldatastd/2,'-ob','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);

    testdatay   = [testanalysis.branchorder.totallength.mean];
    testdatastd = [testanalysis.branchorder.totallength.std];

    errorbar(testdatax,testdatay,testdatastd/2,'-^r','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',6);

    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);

    xlimits=xlim;
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);

    hold off;
    %----------------------------------------------------------------------    
    controldatax   = controlanalysis.branchorder.branchorder;
    testdatax      = testanalysis.branchorder.branchorder;

    subplot(3,3,6); box on; hold on;
    ylabel('Total Surface Area (\mum^2)','FontSize',labelfontsize,'FontWeight','b');

    controldatay   = [controlanalysis.branchorder.totalsurfacearea.mean];
    controldatastd = [controlanalysis.branchorder.totalsurfacearea.std];

    errorbar(controldatax,controldatay,controldatastd/2,'-ob','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);

    testdatay   = [testanalysis.branchorder.totalsurfacearea.mean];
    testdatastd = [testanalysis.branchorder.totalsurfacearea.std];

    errorbar(testdatax,testdatay,testdatastd/2,'-^r','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',6);

    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);

    xlimits=xlim;
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);

    hold off;
    %----------------------------------------------------------------------        
    controldatax   = controlanalysis.branchorder.branchorder;
    testdatax      = testanalysis.branchorder.branchorder;

    subplot(3,3,9); box on; hold on;
    ylabel('Total Volume (\mum^3)','FontSize',labelfontsize,'FontWeight','b');

    controldatay   = [controlanalysis.branchorder.totalvolume.mean];
    controldatastd = [controlanalysis.branchorder.totalvolume.std];

    errorbar(controldatax,controldatay,controldatastd/2,'-ob','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);

    testdatay   = [testanalysis.branchorder.totalvolume.mean];
    testdatastd = [testanalysis.branchorder.totalvolume.std];

    errorbar(testdatax,testdatay,testdatastd/2,'-^r','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',6);

    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);

    %     xlimits=xlim;
    %     xtick = get(gca,'xtick');
    %     set(gca,'xticklabel', []);

    hold off;
    %----------------------------------------------------------------------
    %subplotspace('horizontal',-20);
    subplotspace('vertical',-10);

    [ax,h1]=suplabel('Branch Order');
    [ax,h3]=suplabel('Comparison of Morphometrics versus Branch Order'  ,'t');
    set(h1,'FontSize',15);
    set(h3,'FontSize',20);

    cd(controlanalysis.datapathname);
    cd ..

    if exist(sprintf('%s_%s_comparison',controlanalysis.inputfilename,controlanalysis.datetime),'dir')==7;
        cd(sprintf('%s_%s_comparison',controlanalysis.inputfilename,controlanalysis.datetime));
    else
        mkdir(sprintf('%s_%s_comparison',controlanalysis.inputfilename,controlanalysis.datetime));
        cd(sprintf('%s_%s_comparison',controlanalysis.inputfilename,controlanalysis.datetime));
    end

    if exist('comparisonfigures','dir')==7
        cd('comparisonfigures');
    else
        mkdir('comparisonfigures');
        cd('comparisonfigures');
    end

    fillscreen;

    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'Branch_Order_Comparison_Figure_1');
    print('-dmeta',filename);
    saveas(gcf,filename,'fig');
    %----------------------------------------------------------------------
    
    figure;
    
    %----------------------------------------------------------------------
    controldatax   = controlanalysis.branchorder.branchorder;
    testdatax      = testanalysis.branchorder.branchorder;

    subplot(2,3,1); box on; hold on;
    ylabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');

    controldatay   = [controlanalysis.branchorder.meanproximaldiameter.mean];
    controldatastd = [controlanalysis.branchorder.meanproximaldiameter.std];

    errorbar(controldatax,controldatay,controldatastd/2,'-ob','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);

    testdatay   = [testanalysis.branchorder.meanproximaldiameter.mean];
    testdatastd = [testanalysis.branchorder.meanproximaldiameter.std];

    errorbar(testdatax,testdatay,testdatastd/2,'-^r','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',6);

    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);

    xlimits=xlim;
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);

    hold off;
    %----------------------------------------------------------------------        
    controldatax   = controlanalysis.branchorder.branchorder;
    testdatax      = testanalysis.branchorder.branchorder;

    subplot(2,3,2); box on; hold on;
    ylabel('Taper Rate','FontSize',labelfontsize,'FontWeight','b');

    controldatay   = [controlanalysis.branchorder.meantaperrate.mean];
    controldatastd = [controlanalysis.branchorder.meantaperrate.std];

    errorbar(controldatax,controldatay,controldatastd/2,'-ob','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);

    testdatay   = [testanalysis.branchorder.meantaperrate.mean];
    testdatastd = [testanalysis.branchorder.meantaperrate.std];

    errorbar(testdatax,testdatay,testdatastd/2,'-^r','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',6);

    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);

    xlimits=xlim;
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);

    hold off;
    %----------------------------------------------------------------------
    controldatax   = controlanalysis.branchorder.branchorder;
    testdatax      = testanalysis.branchorder.branchorder;

    subplot(2,3,3); box on; hold on;
    ylabel('Taper Ratio','FontSize',labelfontsize,'FontWeight','b');

    controldatay   = [controlanalysis.branchorder.meantaperratio.mean];
    controldatastd = [controlanalysis.branchorder.meantaperratio.std];

    errorbar(controldatax,controldatay,controldatastd/2,'-ob','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);

    testdatay   = [testanalysis.branchorder.meantaperratio.mean];
    testdatastd = [testanalysis.branchorder.meantaperratio.std];

    errorbar(testdatax,testdatay,testdatastd/2,'-^r','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',6);

    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);

        xlimits=xlim;
        xtick = get(gca,'xtick');
        set(gca,'xticklabel', []);

    hold off;
    %----------------------------------------------------------------------
    controldatax   = controlanalysis.branchorder.branchorder;
    testdatax      = testanalysis.branchorder.branchorder;

    subplot(2,3,4); box on; hold on;
    ylabel('Rall Ratio','FontSize',labelfontsize,'FontWeight','b');

    controldatay   = [controlanalysis.branchorder.meanrallratio.mean];
    controldatastd = [controlanalysis.branchorder.meanrallratio.std];

    errorbar(controldatax,controldatay,controldatastd/2,'-ob','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);

    testdatay   = [testanalysis.branchorder.meanrallratio.mean];
    testdatastd = [testanalysis.branchorder.meanrallratio.std];

    errorbar(testdatax,testdatay,testdatastd/2,'-^r','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',6);

    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);

%         xlimits=xlim;
%         xtick = get(gca,'xtick');
%         set(gca,'xticklabel', []);

    hold off;
    %----------------------------------------------------------------------
    controldatax   = controlanalysis.branchorder.branchorder;
    testdatax      = testanalysis.branchorder.branchorder;

    subplot(2,3,5); box on; hold on;
    ylabel('Parent/Daughter Ratio','FontSize',labelfontsize,'FontWeight','b');

    controldatay   = [controlanalysis.branchorder.meanparentdaughterratio.mean];
    controldatastd = [controlanalysis.branchorder.meanparentdaughterratio.std];

    errorbar(controldatax,controldatay,controldatastd/2,'-ob','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);

    testdatay   = [testanalysis.branchorder.meanparentdaughterratio.mean];
    testdatastd = [testanalysis.branchorder.meanparentdaughterratio.std];

    errorbar(testdatax,testdatay,testdatastd/2,'-^r','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',6);

    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);

%         xlimits=xlim;
%         xtick = get(gca,'xtick');
%         set(gca,'xticklabel', []);

    hold off;
    %----------------------------------------------------------------------
    controldatax   = controlanalysis.branchorder.branchorder;
    testdatax      = testanalysis.branchorder.branchorder;

    subplot(2,3,6); box on; hold on;
    ylabel('Daughter Ratio','FontSize',labelfontsize,'FontWeight','b');

    controldatay   = [controlanalysis.branchorder.meandaughterratio.mean];
    controldatastd = [controlanalysis.branchorder.meandaughterratio.std];

    errorbar(controldatax,controldatay,controldatastd/2,'-ob','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);

    testdatay   = [testanalysis.branchorder.meandaughterratio.mean];
    testdatastd = [testanalysis.branchorder.meandaughterratio.std];

    errorbar(testdatax,testdatay,testdatastd/2,'-^r','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',6);

    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);

    %     xlimits=xlim;
    %     xtick = get(gca,'xtick');
    %     set(gca,'xticklabel', []);

    hold off;
    %----------------------------------------------------------------------
    %subplotspace('horizontal',-20);
    subplotspace('vertical',-10);

    [ax,h1]=suplabel('Branch Order');
    [ax,h3]=suplabel('Comparison of Morphometrics versus Branch Order'  ,'t');
    set(h1,'FontSize',15);
    set(h3,'FontSize',20);

    cd(controlanalysis.datapathname);
    cd ..

    if exist(sprintf('%s_%s_comparison',controlanalysis.inputfilename,controlanalysis.datetime),'dir')==7;
        cd(sprintf('%s_%s_comparison',controlanalysis.inputfilename,controlanalysis.datetime));
    else
        mkdir(sprintf('%s_%s_comparison',controlanalysis.inputfilename,controlanalysis.datetime));
        cd(sprintf('%s_%s_comparison',controlanalysis.inputfilename,controlanalysis.datetime));
    end

    if exist('comparisonfigures','dir')==7
        cd('comparisonfigures');
    else
        mkdir('comparisonfigures');
        cd('comparisonfigures');
    end

    fillscreen;

    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'Branch_Order_Comparison_Figure_2');
    print('-dmeta',filename);
    saveas(gcf,filename,'fig');
    %----------------------------------------------------------------------
    
else
    
    disp('  Error: A maximum of two inputs is allowed.');
    
end
 
 
 
 
 
 
 
 
 
 
 
 
 
 