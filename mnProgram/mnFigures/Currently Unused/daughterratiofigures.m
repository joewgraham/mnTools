function daughterratiofigures(controlanalysis,testanalysis)
% Daughter Ratio Figures

labelfontsize = 12;
insetfontsize = 10;

figure;

if nargin == 1

    controldatax   = controlanalysis.diameter.diameter;

    subplot(2,2,1); box on; hold on;
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    h=gca; set(gca,'XDir','reverse');

    controldatay   = [controlanalysis.diameter.daughterratio.mean];
    controldatastd = [controlanalysis.diameter.daughterratio.std];

    errorbar(controldatax,controldatay,controldatastd/2,'-ob','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);
    

    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);

    %     xlimits=xlim;
    %     xtick = get(gca,'xtick');
    %     set(gca,'xticklabel', []);

    hold off;

    
    controldatax   = controlanalysis.pathlength.pathlength;

    subplot(2,2,2); box on; hold on;
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');

    controldatay   = [controlanalysis.pathlength.daughterratio.mean];
    controldatastd = [controlanalysis.pathlength.daughterratio.std];

    errorbar(controldatax,controldatay,controldatastd/2,'-ob','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);

    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);

    %     xlimits=xlim;
    %     xtick = get(gca,'xtick');
    %     set(gca,'xticklabel', []);

    hold off;

    
    controldatax   = controlanalysis.branchorder.branchorder;

    subplot(2,2,3); box on; hold on;
    xlabel('Branch Order','FontSize',labelfontsize,'FontWeight','b');

    controldatay   = [controlanalysis.branchorder.daughterratio.mean];
    controldatastd = [controlanalysis.branchorder.daughterratio.std];

    errorbar(controldatax,controldatay,controldatastd/2,'-ob','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);

    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);

    %     xlimits=xlim;
    %     xtick = get(gca,'xtick');
    %     set(gca,'xticklabel', []);

    hold off;

    
    controldatax   = controlanalysis.radialdistance.radialdistance;

    subplot(2,2,4); box on; hold on;
    xlabel('Local Radial Distance (\mum)','FontSize',labelfontsize,'FontWeight','b');

    controldatay   = [controlanalysis.radialdistance.daughterratio.mean];
    controldatastd = [controlanalysis.radialdistance.daughterratio.std];

    errorbar(controldatax,controldatay,controldatastd/2,'-ob','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);

    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);

    %     xlimits=xlim;
    %     xtick = get(gca,'xtick');
    %     set(gca,'xticklabel', []);

    hold off;


    %subplotspace('horizontal',-20);
    %subplotspace('vertical',-20);

    %[ax,h1]=suplabel('Soma Diameter (\mum)');
    [ax,h2]=suplabel('Daughter Ratio','y');
    [ax,h3]=suplabel('Daughter Ratio versus Local Properties'  ,'t');
    set(h2,'FontSize',15);
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

    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Daughter_Ratio_Figure');
    print('-dmeta',filename);
    saveas(gcf,filename,'fig');

end

if nargin == 2

    controldatax   = controlanalysis.diameter.diameter;
    testdatax      = testanalysis.diameter.diameter;

    subplot(2,2,1); box on; hold on;
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');

    h=gca; set(gca,'XDir','reverse');

    controldatay   = [controlanalysis.diameter.daughterratio.mean];
    controldatastd = [controlanalysis.diameter.daughterratio.std];

    errorbar(controldatax,controldatay,controldatastd/2,'-vb','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);
    h=gca; set(gca,'XDir','reverse');
    testdatay   = [testanalysis.diameter.daughterratio.mean];
    testdatastd = [testanalysis.diameter.daughterratio.std];

    errorbar(testdatax,testdatay,testdatastd/2,'-^r','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',6);

    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);

    %     xlimits=xlim;
    %     xtick = get(gca,'xtick');
    %     set(gca,'xticklabel', []);

    hold off;

    controldatax   = controlanalysis.pathlength.pathlength;
    testdatax      = testanalysis.pathlength.pathlength;

    subplot(2,2,2); box on; hold on;
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');

    controldatay   = [controlanalysis.pathlength.daughterratio.mean];
    controldatastd = [controlanalysis.pathlength.daughterratio.std];

    errorbar(controldatax,controldatay,controldatastd/2,'-vb','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);

    testdatay   = [testanalysis.pathlength.daughterratio.mean];
    testdatastd = [testanalysis.pathlength.daughterratio.std];

    errorbar(testdatax,testdatay,testdatastd/2,'-^r','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',6);

    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);

    %     xlimits=xlim;
    %     xtick = get(gca,'xtick');
    %     set(gca,'xticklabel', []);

    hold off;

    controldatax   = controlanalysis.branchorder.branchorder;
    testdatax      = testanalysis.branchorder.branchorder;

    subplot(2,2,3); box on; hold on;
    xlabel('Branch Order','FontSize',labelfontsize,'FontWeight','b');

    controldatay   = [controlanalysis.branchorder.meandaughterratio.mean];
    controldatastd = [controlanalysis.branchorder.meandaughterratio.std];

    errorbar(controldatax,controldatay,controldatastd/2,'-vb','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);

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

    controldatax   = controlanalysis.radialdistance.radialdistance;
    testdatax      = testanalysis.radialdistance.radialdistance;

    subplot(2,2,4); box on; hold on;
    xlabel('Local Radial Distance (\mum)','FontSize',labelfontsize,'FontWeight','b');

    controldatay   = [controlanalysis.radialdistance.daughterratio.mean];
    controldatastd = [controlanalysis.radialdistance.daughterratio.std];

    errorbar(controldatax,controldatay,controldatastd/2,'-vb','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);

    testdatay   = [testanalysis.radialdistance.daughterratio.mean];
    testdatastd = [testanalysis.radialdistance.daughterratio.std];

    errorbar(testdatax,testdatay,testdatastd/2,'-^r','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',6);

    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);

    %     xlimits=xlim;
    %     xtick = get(gca,'xtick');
    %     set(gca,'xticklabel', []);

    hold off;


    %subplotspace('horizontal',-20);
    %subplotspace('vertical',-20);

    %[ax,h1]=suplabel('Soma Diameter (\mum)');
    [ax,h2]=suplabel('Daughter Ratio','y');
    [ax,h3]=suplabel('Comparison of Daughter Ratio versus Local Properties'  ,'t');
    set(h2,'FontSize',15);
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

    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'Daughter_Ratio_Comparison_Figure');
    print('-dmeta',filename);
    saveas(gcf,filename,'fig');

end


 
 
 
 
 