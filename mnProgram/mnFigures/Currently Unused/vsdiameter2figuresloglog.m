function vsdiameter2figuresloglog(controlanalysis,testanalysis)
% Diameter Figures

labelfontsize = 12;
insetfontsize = 10;

figure;

if nargin == 1

    controldatax   = controlanalysis.diameter.diameter;

    subplot(2,2,1); box on; 

    controldatay   = [controlanalysis.diameter.meantaperrate.mean];
    controldatastd = [controlanalysis.diameter.meantaperrate.std];

    loglog(controldatax,controldatay,'-ob','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);
    ylabel('Taper Rate','FontSize',labelfontsize,'FontWeight','b');
    h=gca; set(gca,'XDir','reverse');
    hold on;


    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);

    %     xlimits=xlim;
    %     xtick = get(gca,'xtick');
    %     set(gca,'xticklabel', []);

    hold off;

    
    controldatax   = controlanalysis.diameter.diameter;

    subplot(2,2,2); box on; 

    controldatay   = [controlanalysis.diameter.rallratio.mean];
    controldatastd = [controlanalysis.diameter.rallratio.std];

    loglog(controldatax,controldatay,'-ob','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);
    ylabel('Rall Ratio','FontSize',labelfontsize,'FontWeight','b');
    h=gca; set(gca,'XDir','reverse');
    hold on;
    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);

    %     xlimits=xlim;
    %     xtick = get(gca,'xtick');
    %     set(gca,'xticklabel', []);

    hold off;

    
    controldatax   = controlanalysis.diameter.diameter;

    subplot(2,2,3); box on;

    controldatay   = [controlanalysis.diameter.daughterratio.mean];
    controldatastd = [controlanalysis.diameter.daughterratio.std];

    loglog(controldatax,controldatay,'-ob','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);
    ylabel('Daughter Ratio','FontSize',labelfontsize,'FontWeight','b');
    h=gca; set(gca,'XDir','reverse');
    hold on;
    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);

    %     xlimits=xlim;
    %     xtick = get(gca,'xtick');
    %     set(gca,'xticklabel', []);

    hold off;

    
    controldatax   = controlanalysis.diameter.diameter;

    subplot(2,2,4); box on;
   
    controldatay   = [controlanalysis.diameter.parentdaughterratio.mean];
    controldatastd = [controlanalysis.diameter.parentdaughterratio.std];

    loglog(controldatax,controldatay,'-ob','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);
    ylabel('Parent/Daughter Ratio','FontSize',labelfontsize,'FontWeight','b');
    h=gca; set(gca,'XDir','reverse');
    hold on;
    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);

    %     xlimits=xlim;
    %     xtick = get(gca,'xtick');
    %     set(gca,'xticklabel', []);

    hold off;


    %subplotspace('horizontal',-20);
    %subplotspace('vertical',-20);

    [ax,h1]=suplabel('Local Diameter (\mum)');
    %[ax,h2]=suplabel('Diameter (\mum)','y');
    [ax,h3]=suplabel('Basic Parameters versus Local Diameter (Log-Log)'  ,'t');
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

    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Diameter_Figure_2_Log_Log');
    print('-dmeta',filename);
    saveas(gcf,filename,'fig');

end

if nargin == 2

    controldatax   = controlanalysis.diameter.diameter;
    testdatax      = testanalysis.diameter.diameter;

    subplot(2,2,1); box on; hold on;
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');

    h=gca; set(gca,'XDir','reverse');

    controldatay   = [controlanalysis.diameter.diameter];
    %controldatastd = [controlanalysis.diameter.diameter];

    errorbar(controldatax,controldatay,0,'-vb','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);
    
    h=gca; set(gca,'XDir','reverse');
    
    testdatay   = [testanalysis.diameter.diameter];
    %testdatastd = [testanalysis.diameter.diameter];

    errorbar(testdatax,testdatay,0,'-^r','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',6);

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

    controldatay   = [controlanalysis.pathlength.meandiameter.mean];
    controldatastd = [controlanalysis.pathlength.meandiameter.std];

    errorbar(controldatax,controldatay,controldatastd/2,'-vb','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);

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

    controldatax   = controlanalysis.branchorder.branchorder;
    testdatax      = testanalysis.branchorder.branchorder;

    subplot(2,2,3); box on; hold on;
    xlabel('Branch Order','FontSize',labelfontsize,'FontWeight','b');

    controldatay   = [controlanalysis.branchorder.meancylindricaldiameter.mean];
    controldatastd = [controlanalysis.branchorder.meancylindricaldiameter.std];

    errorbar(controldatax,controldatay,controldatastd/2,'-vb','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);

    testdatay   = [testanalysis.branchorder.meancylindricaldiameter.mean];
    testdatastd = [testanalysis.branchorder.meancylindricaldiameter.std];

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

    controldatay   = [controlanalysis.radialdistance.meandiameter.mean];
    controldatastd = [controlanalysis.radialdistance.meandiameter.std];

    errorbar(controldatax,controldatay,controldatastd/2,'-vb','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);

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
    %subplotspace('vertical',-20);

    %[ax,h1]=suplabel('Soma Diameter (\mum)');
    [ax,h2]=suplabel('Diameter (\mm)','y');
    [ax,h3]=suplabel('Comparison of Diameter versus Local Properties'  ,'t');
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

    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'Diameter_Comparison_Figure');
    print('-dmeta',filename);
    saveas(gcf,filename,'fig');

end


 
 
 
 
 