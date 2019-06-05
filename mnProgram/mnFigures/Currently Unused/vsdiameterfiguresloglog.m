function vsdiameterfiguresloglog(controlanalysis,testanalysis)
% Diameter Figures

labelfontsize = 12;
insetfontsize = 10;

figure;

if nargin == 1

    controldatax   = controlanalysis.diameter.diameter;

    
    subplot(3,3,1); box on; 
    controldatay   = [controlanalysis.diameter.numbersegments.mean];
    controldatastd = [controlanalysis.diameter.numbersegments.std];
    loglog(controldatax,controldatay,'-ob','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);
    hold on;
    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);
    h=gca; set(gca,'XDir','reverse');
    xlimits=xlim;
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);
    ylabel('Number Segments','FontSize',labelfontsize,'FontWeight','b');
    hold off;


    subplot(3,3,4); box on; 
    controldatay   = [controlanalysis.diameter.numberbifurcations.mean];
    controldatastd = [controlanalysis.diameter.numberbifurcations.std];
    loglog(controldatax,controldatay,'-ob','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);
    hold on;
    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);
    h=gca; set(gca,'XDir','reverse');
    xlimits=xlim;
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);
    ylabel('Number Bifurcations','FontSize',labelfontsize,'FontWeight','b');
    hold off;


    subplot(3,3,7); box on; 
    controldatay   = [controlanalysis.diameter.numberterminations.mean];
    controldatastd = [controlanalysis.diameter.numberterminations.std];
    loglog(controldatax,controldatay,'-ob','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);
    hold on;
    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);
    h=gca; set(gca,'XDir','reverse');
    %     xlimits=xlim;
    %     xtick = get(gca,'xtick');
    %     set(gca,'xticklabel', []);
    ylabel('Number Terminations','FontSize',labelfontsize,'FontWeight','b');
    hold off;


    subplot(3,3,2); box on; 
    controldatay   = [controlanalysis.diameter.length.mean];
    controldatastd = [controlanalysis.diameter.length.std];
    loglog(controldatax,controldatay,'-ob','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);
    hold on;
    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);
    h=gca; set(gca,'XDir','reverse');
    xlimits=xlim;
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);
    ylabel('Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    hold off;


    subplot(3,3,5); box on; 
    controldatay   = [controlanalysis.diameter.surfacearea.mean];
    controldatastd = [controlanalysis.diameter.surfacearea.std];
    loglog(controldatax,controldatay,'-ob','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);
    hold on;
    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);
    h=gca; set(gca,'XDir','reverse');
    xlimits=xlim;
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);
    ylabel('Surface Area (\mum^2)','FontSize',labelfontsize,'FontWeight','b');
    hold off;


    subplot(3,3,8); box on; 
    controldatay   = [controlanalysis.diameter.volume.mean];
    controldatastd = [controlanalysis.diameter.volume.std];
    loglog(controldatax,controldatay,'-ob','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);
    hold on;
    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);
    h=gca; set(gca,'XDir','reverse');
    %     xlimits=xlim;
    %     xtick = get(gca,'xtick');
    %     set(gca,'xticklabel', []);
    ylabel('Volume (\mum^3)','FontSize',labelfontsize,'FontWeight','b');
    hold off;


    subplot(3,3,3); box on; 
    controldatay   = [controlanalysis.diameter.rallratio.mean];
    controldatastd = [controlanalysis.diameter.rallratio.std];
    loglog(controldatax,controldatay,'-ob','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);
    hold on;
    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);
    h=gca; set(gca,'XDir','reverse');
    xlimits=xlim;
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);
    ylabel('Rall Ratio','FontSize',labelfontsize,'FontWeight','b');
    hold off;


    subplot(3,3,6); box on; 
    controldatay   = [controlanalysis.diameter.parentdaughterratio.mean];
    controldatastd = [controlanalysis.diameter.parentdaughterratio.std];
    loglog(controldatax,controldatay,'-ob','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);
    hold on;
    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);
    h=gca; set(gca,'XDir','reverse');
    xlimits=xlim;
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);
    ylabel('Parent/Daughter Ratio','FontSize',labelfontsize,'FontWeight','b');
    hold off;


    subplot(3,3,9); box on; 
    controldatay   = [controlanalysis.diameter.daughterratio.mean];
    controldatastd = [controlanalysis.diameter.daughterratio.std];
    loglog(controldatax,controldatay,'-ob','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);
    hold on;
    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);
    h=gca; set(gca,'XDir','reverse');
    %     xlimits=xlim;
    %     xtick = get(gca,'xtick');
    %     set(gca,'xticklabel', []);
    ylabel('Daughter Ratio','FontSize',labelfontsize,'FontWeight','b');
    hold off;


    %subplotspace('horizontal',-20);
    subplotspace('vertical',-20);

    [ax,h1]=suplabel('Local Diameter (\mum)');
    [ax,h3]=suplabel('Morphometrics versus Local Diameter (Log-Log)'  ,'t');
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

    filename = sprintf('%s_%s',controlanalysis.inputfilename,'vs_Diameter_Figure_Log_Log');
    print('-dmeta',filename);
    saveas(gcf,filename,'fig');

end


if nargin == 2

    controldatax   = controlanalysis.diameter.diameter;
    testdatax      = testanalysis.diameter.diameter;

    subplot(3,3,1); box on; 
    controldatay   = [controlanalysis.diameter.numbersegments.mean];
    controldatastd = [controlanalysis.diameter.numbersegments.std];
    loglog(controldatax,controldatay,'-ob','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);
    hold on;
    testdatay   = [testanalysis.diameter.numbersegments.mean];
    testdatastd = [testanalysis.diameter.numbersegments.std];
    loglog(testdatax,testdatay,'-^r','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',6);
    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);
    xlimits=xlim;
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);
    ylabel('Number Segments','FontSize',labelfontsize,'FontWeight','b');
    hold off;


    subplot(3,3,4); box on; 
    controldatay   = [controlanalysis.diameter.numberbifurcations.mean];
    controldatastd = [controlanalysis.diameter.numberbifurcations.std];
    loglog(controldatax,controldatay,'-ob','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);
    hold on;
    testdatay   = [testanalysis.diameter.numberbifurcations.mean];
    testdatastd = [testanalysis.diameter.numberbifurcations.std];
    loglog(testdatax,testdatay,'-^r','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',6);
    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);
    xlimits=xlim;
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);
    ylabel('Number Bifurcations','FontSize',labelfontsize,'FontWeight','b');
    hold off;


    subplot(3,3,7); box on; 
    controldatay   = [controlanalysis.diameter.numberterminations.mean];
    controldatastd = [controlanalysis.diameter.numberterminations.std];
    loglog(controldatax,controldatay,'-ob','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);
    hold on;
    testdatay   = [testanalysis.diameter.numberterminations.mean];
    testdatastd = [testanalysis.diameter.numberterminations.std];
    loglog(testdatax,testdatay,'-^r','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',6);
    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);
    %     xlimits=xlim;
    %     xtick = get(gca,'xtick');
    %     set(gca,'xticklabel', []);
    ylabel('Number Terminations','FontSize',labelfontsize,'FontWeight','b');
    hold off;


    subplot(3,3,2); box on; 
    controldatay   = [controlanalysis.diameter.length.mean];
    controldatastd = [controlanalysis.diameter.length.std];
    loglog(controldatax,controldatay,'-ob','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);
    hold on;
    testdatay   = [testanalysis.diameter.length.mean];
    testdatastd = [testanalysis.diameter.length.std];
    loglog(testdatax,testdatay,'-^r','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',6);
    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);
    xlimits=xlim;
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);
    ylabel('Length (\mum))','FontSize',labelfontsize,'FontWeight','b');
    hold off;


    subplot(3,3,5); box on; 
    controldatay   = [controlanalysis.diameter.surfacearea.mean];
    controldatastd = [controlanalysis.diameter.surfacearea.std];
    loglog(controldatax,controldatay,'-ob','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);
    hold on;
    testdatay   = [testanalysis.diameter.surfacearea.mean];
    testdatastd = [testanalysis.diameter.surfacearea.std];
    loglog(testdatax,testdatay,'-^r','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',6);
    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);
    xlimits=xlim;
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);
    ylabel('Surface Area (\mum^2)','FontSize',labelfontsize,'FontWeight','b');
    hold off;


    subplot(3,3,8); box on; 
    controldatay   = [controlanalysis.diameter.volume.mean];
    controldatastd = [controlanalysis.diameter.volume.std];
    loglog(controldatax,controldatay,'-ob','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);
    hold on;
    testdatay   = [testanalysis.diameter.volume.mean];
    testdatastd = [testanalysis.diameter.volume.std];
    loglog(testdatax,testdatay,'-^r','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',6);
    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);
    %     xlimits=xlim;
    %     xtick = get(gca,'xtick');
    %     set(gca,'xticklabel', []);
    ylabel('Volume (\mum^3)','FontSize',labelfontsize,'FontWeight','b');
    hold off;


    subplot(3,3,3); box on; 
    controldatay   = [controlanalysis.diameter.rallratio.mean];
    controldatastd = [controlanalysis.diameter.rallratio.std];
    loglog(controldatax,controldatay,'-ob','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);
    hold on;
    testdatay   = [testanalysis.diameter.rallratio.mean];
    testdatastd = [testanalysis.diameter.rallratio.std];
    loglog(testdatax,testdatay,'-^r','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',6);
    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);
    xlimits=xlim;
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);
    ylabel('Rall Ratio','FontSize',labelfontsize,'FontWeight','b');
    hold off;


    subplot(3,3,6); box on; 
    controldatay   = [controlanalysis.diameter.parentdaughterratio.mean];
    controldatastd = [controlanalysis.diameter.parentdaughterratio.std];
    loglog(controldatax,controldatay,'-ob','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);
    hold on;
    testdatay   = [testanalysis.diameter.parentdaughterratio.mean];
    testdatastd = [testanalysis.diameter.parentdaughterratio.std];
    loglog(testdatax,testdatay,'-^r','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',6);
    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);
    xlimits=xlim;
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);
    ylabel('Parent/Daughter Ratio','FontSize',labelfontsize,'FontWeight','b');
    hold off;


    subplot(3,3,9); box on; 
    controldatay   = [controlanalysis.diameter.daughterratio.mean];
    controldatastd = [controlanalysis.diameter.daughterratio.std];
    loglog(controldatax,controldatay,'-ob','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);
    hold on;
    testdatay   = [testanalysis.diameter.daughterratio.mean];
    testdatastd = [testanalysis.diameter.daughterratio.std];
    loglog(testdatax,testdatay,'-^r','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',6);
    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);
%     xlimits=xlim;
%     xtick = get(gca,'xtick');
%     set(gca,'xticklabel', []);
    ylabel('Daughter Ratio','FontSize',labelfontsize,'FontWeight','b');
    hold off;


    %subplotspace('horizontal',-20);
    subplotspace('vertical',-20);

    [ax,h1]=suplabel('Local Diameter (\mum)');
    [ax,h3]=suplabel('Comparison of Morphometrics versus Local Diameter (Log-Log)'  ,'t');
    set(h1,'FontSize',15);
    set(h3,'FontSize',20);


    currentdirectory = cd;
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

    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'vs_Diameter_Comparison_Figure_Log_Log');
    print('-dmeta',filename);
    saveas(gcf,filename,'fig');
    
    
end

 
 
 
 
 
 
 
 
 
 
 
 
 
 