function chenradialdistancefigures(controlanalysis,testanalysis);
% Path Length Figures

labelfontsize = 12;
insetfontsize = 10;

figure;

if nargin == 1

    controldatax   = controlanalysis.radialdistance.radialdistance;

    subplot(3,3,1); box on; hold on;
    ylabel('Number Segments','FontSize',labelfontsize,'FontWeight','b');

    controldatay   = [controlanalysis.radialdistance.numbersegments.mean];
    controldatastd = [controlanalysis.radialdistance.numbersegments.std];

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

    controldatay   = [controlanalysis.radialdistance.numberbifurcations.mean];
    controldatastd = [controlanalysis.radialdistance.numberbifurcations.std];

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

    controldatay   = [controlanalysis.radialdistance.numberterminations.mean];
    controldatastd = [controlanalysis.radialdistance.numberterminations.std];

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

    controldatay   = [controlanalysis.radialdistance.length.mean];
    controldatastd = [controlanalysis.radialdistance.length.std];

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

    controldatay   = [controlanalysis.radialdistance.surfacearea.mean];
    controldatastd = [controlanalysis.radialdistance.surfacearea.std];

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

    controldatay   = [controlanalysis.radialdistance.volume.mean];
    controldatastd = [controlanalysis.radialdistance.volume.std];

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

    controldatay   = [controlanalysis.radialdistance.rallratio.mean];
    controldatastd = [controlanalysis.radialdistance.rallratio.std];

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

    controldatay   = [controlanalysis.radialdistance.daughterratio.mean];
    controldatastd = [controlanalysis.radialdistance.daughterratio.std];

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

    controldatay   = [controlanalysis.radialdistance.meandiameter.mean];
    controldatastd = [controlanalysis.radialdistance.meandiameter.std];

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

    controldatax   = controlanalysis.radialdistance.radialdistance;
    testdatax      = testanalysis.radialdistance.radialdistance;

    subplot(3,3,1); box on; hold on;
    ylabel('Number Segments','FontSize',labelfontsize,'FontWeight','b');

    controldatay   = [controlanalysis.radialdistance.numbersegments.mean];
    controldatastd = [controlanalysis.radialdistance.numbersegments.std];

    errorbar(controldatax,controldatay,controldatastd/2,'-ob','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);

    testdatay   = [testanalysis.radialdistance.numbersegments.mean];
    testdatastd = [testanalysis.radialdistance.numbersegments.std];

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

    controldatay   = [controlanalysis.radialdistance.numberbifurcations.mean];
    controldatastd = [controlanalysis.radialdistance.numberbifurcations.std];

    errorbar(controldatax,controldatay,controldatastd/2,'-ob','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);

    testdatay   = [testanalysis.radialdistance.numberbifurcations.mean];
    testdatastd = [testanalysis.radialdistance.numberbifurcations.std];

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

    controldatay   = [controlanalysis.radialdistance.numberterminations.mean];
    controldatastd = [controlanalysis.radialdistance.numberterminations.std];

    errorbar(controldatax,controldatay,controldatastd/2,'-ob','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);

    testdatay   = [testanalysis.radialdistance.numberterminations.mean];
    testdatastd = [testanalysis.radialdistance.numberterminations.std];

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

    controldatay   = [controlanalysis.radialdistance.length.mean];
    controldatastd = [controlanalysis.radialdistance.length.std];

    errorbar(controldatax,controldatay,controldatastd/2,'-ob','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);

    testdatay   = [testanalysis.radialdistance.length.mean]/1000;
    testdatastd = [testanalysis.radialdistance.length.std]/1000;

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

    controldatay   = [controlanalysis.radialdistance.surfacearea.mean];
    controldatastd = [controlanalysis.radialdistance.surfacearea.std];

    errorbar(controldatax,controldatay,controldatastd/2,'-ob','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);

    testdatay   = [testanalysis.radialdistance.surfacearea.mean]/1000;
    testdatastd = [testanalysis.radialdistance.surfacearea.std]/1000;

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

    controldatay   = [controlanalysis.radialdistance.volume.mean];
    controldatastd = [controlanalysis.radialdistance.volume.std];

    errorbar(controldatax,controldatay,controldatastd/2,'-ob','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);

    testdatay   = [testanalysis.radialdistance.volume.mean]/1000;
    testdatastd = [testanalysis.radialdistance.volume.std]/1000;

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

    controldatay   = [controlanalysis.radialdistance.rallratio.mean];
    controldatastd = [controlanalysis.radialdistance.rallratio.std];

    errorbar(controldatax,controldatay,controldatastd/2,'-ob','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);

    testdatay   = [testanalysis.radialdistance.rallratio.mean];
    testdatastd = [testanalysis.radialdistance.rallratio.std];

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

%     controldatay   = [controlanalysis.radialdistance.daughterratio.mean];
%     controldatastd = [controlanalysis.radialdistance.daughterratio.std];

%     errorbar(controldatax,controldatay,controldatastd/2,'-ob','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);

    testdatay   = [testanalysis.radialdistance.daughterratio.mean];
    testdatastd = [testanalysis.radialdistance.daughterratio.std];

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

    controldatay   = [controlanalysis.radialdistance.meandiameter.mean];
    controldatastd = [controlanalysis.radialdistance.meandiameter.std];

    errorbar(controldatax,controldatay,controldatastd/2,'-ob','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);

    testdatay   = [testanalysis.radialdistance.meandiameter.mean];
    testdatastd = [testanalysis.radialdistance.meandiameter.std];

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

    [ax,h1]=suplabel('Radial Distance from Soma (\mum)');
    [ax,h3]=suplabel('Comparison of Morphometrics versus Radial Distance from Soma'  ,'t');
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

    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'Radial_Distance_Comparison_Figure');
    print('-dmeta',filename);
    saveas(gcf,filename,'fig');

end
 
cd(currentdirectory);
 
 
 
 
 
 
 
 
 
 
 
 
 