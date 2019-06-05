function taperratefigures(controlanalysis,testanalysis)
% Taper Rate Figures

labelfontsize = 12;
insetfontsize = 10;

figure;

if nargin == 1

    controldatax   = controlanalysis.diameter.diameter;

    subplot(2,2,1); box on; hold on;
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    h=gca; set(gca,'XDir','reverse');

    controldatay   = [controlanalysis.diameter.meantaperrate.mean];
    controldatastd = [controlanalysis.diameter.meantaperrate.std];

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

    controldatay   = [controlanalysis.pathlength.meantaperrate.mean];
    controldatastd = [controlanalysis.pathlength.meantaperrate.std];

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

    controldatay   = [controlanalysis.branchorder.taperrate.mean];
    controldatastd = [controlanalysis.branchorder.taperrate.std];

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

    controldatay   = [controlanalysis.radialdistance.meantaperrate.mean];
    controldatastd = [controlanalysis.radialdistance.meantaperrate.std];

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
    [ax,h2]=suplabel('Taper Rate','y');
    [ax,h3]=suplabel('Taper Rate versus Local Properties'  ,'t');
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

    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Taper_Rate_Figure');
    print('-dmeta',filename);
    saveas(gcf,filename,'fig');

end

if nargin == 2

    controldatax   = controlanalysis.diameter.diameter;
    testdatax      = testanalysis.diameter.diameter;

    subplot(2,2,1); box on; hold on;
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');

    h=gca; set(gca,'XDir','reverse');

    controldatay   = [controlanalysis.diameter.meantaperrate.mean];
    controldatastd = [controlanalysis.diameter.meantaperrate.std];

    errorbar(controldatax,controldatay,controldatastd/2,'-vb','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);
    h=gca; set(gca,'XDir','reverse');
    testdatay   = [testanalysis.diameter.meantaperrate.mean];
    testdatastd = [testanalysis.diameter.meantaperrate.std];

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

    controldatay   = [controlanalysis.pathlength.meantaperrate.mean];
    controldatastd = [controlanalysis.pathlength.meantaperrate.std];

    errorbar(controldatax,controldatay,controldatastd/2,'-vb','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);

    testdatay   = [testanalysis.pathlength.meantaperrate.mean];
    testdatastd = [testanalysis.pathlength.meantaperrate.std];

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

    controldatay   = [controlanalysis.branchorder.meantaperrate.mean];
    controldatastd = [controlanalysis.branchorder.meantaperrate.std];

    errorbar(controldatax,controldatay,controldatastd/2,'-vb','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);

    testdatay   = [testanalysis.branchorder.meantaperrate.mean];
    testdatastd = [testanalysis.branchorder.meantaperrate.std];

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

    controldatay   = [controlanalysis.radialdistance.meantaperrate.mean];
    controldatastd = [controlanalysis.radialdistance.meantaperrate.std];

    errorbar(controldatax,controldatay,controldatastd/2,'-vb','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);

    testdatay   = [testanalysis.radialdistance.meantaperrate.mean];
    testdatastd = [testanalysis.radialdistance.meantaperrate.std];

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
    [ax,h2]=suplabel('Taper Rate','y');
    [ax,h3]=suplabel('Comparison of Taper Rate versus Local Properties'  ,'t');
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

    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'Taper_Rate_Comparison_Figure');
    print('-dmeta',filename);
    saveas(gcf,filename,'fig');

end


 
 
 
 
 