function chenparameterdistributionfigures(controlanalysis,testanalysis)
% Parameter Distribution Figures

labelfontsize = 12;

figure;

if nargin == 1
    
    subplot(3,3,1); box on; hold on;
    xlabel('Soma Diam (\mum)','FontSize',labelfontsize,'FontWeight','b');
    hist(controlanalysis.somadiameter.values);
    h = findobj(gca,'Type','patch');
    set(h(1),'FaceColor','b','EdgeColor','b','FaceAlpha',0.5,'EdgeAlpha',0.5);
    hold off;


    subplot(3,3,4); box on; hold on;
    xlabel('Number PDs','FontSize',labelfontsize,'FontWeight','b');
    hist(controlanalysis.numberprimarydendrites.values);
    h = findobj(gca,'Type','patch');
    set(h(1),'FaceColor','b','EdgeColor','b','FaceAlpha',0.5,'EdgeAlpha',0.5);
    hold off;

    subplot(3,3,7); box on; hold on;
    xlabel('Number Segs','FontSize',labelfontsize,'FontWeight','b');
    hist(controlanalysis.numbersegments.values);
    h = findobj(gca,'Type','patch');
    set(h(1),'FaceColor','b','EdgeColor','b','FaceAlpha',0.5,'EdgeAlpha',0.5);
    hold off;

    subplot(3,3,2); box on; hold on;
    xlabel('Tot Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    hist(controlanalysis.totallength.values);
    h = findobj(gca,'Type','patch');
    set(h(1),'FaceColor','b','EdgeColor','b','FaceAlpha',0.5,'EdgeAlpha',0.5);
    hold off;

    subplot(3,3,5); box on; hold on;
    xlabel('Tot SA (\mum^2)','FontSize',labelfontsize,'FontWeight','b');
    hist(controlanalysis.totalsurfacearea.values);
    h = findobj(gca,'Type','patch');
    set(h(1),'FaceColor','b','EdgeColor','b','FaceAlpha',0.5,'EdgeAlpha',0.5);
    hold off;

    subplot(3,3,8); box on; hold on;
    xlabel('Tot Vol (\mum^3)','FontSize',labelfontsize,'FontWeight','b');
    hist(controlanalysis.totalvolume.values);
    h = findobj(gca,'Type','patch');
    set(h(1),'FaceColor','b','EdgeColor','b','FaceAlpha',0.5,'EdgeAlpha',0.5);
    hold off;

    subplot(3,3,3); box on; hold on;
    xlabel('PD Prox Diam (\mum)','FontSize',labelfontsize,'FontWeight','b');
%     hist(controlanalysis.primarydendrite.meanproximaldiameter.values);
%     h = findobj(gca,'Type','patch');
%     set(h(1),'FaceColor','b','EdgeColor','b','FaceAlpha',0.5,'EdgeAlpha',0.5);
    hold off;

    subplot(3,3,6); box on; hold on;
    xlabel('PD Cyl Diam (\mum)','FontSize',labelfontsize,'FontWeight','b');
    hist(controlanalysis.primarydendrite.meancylindricaldiameter.values);
    h = findobj(gca,'Type','patch');
    set(h(1),'FaceColor','b','EdgeColor','b','FaceAlpha',0.5,'EdgeAlpha',0.5);
    hold off;

    subplot(3,3,9); box on; hold on;
    xlabel('Max Branch Ord','FontSize',labelfontsize,'FontWeight','b');
    hist(controlanalysis.maxbranchorder.values);
    h = findobj(gca,'Type','patch');
    set(h(1),'FaceColor','b','EdgeColor','b','FaceAlpha',0.5,'EdgeAlpha',0.5);
    hold off;


    %subplotspace('horizontal',-20);
    %subplotspace('vertical',-20);

    [ax,h2]=suplabel('Number of Motoneurons','y');
    [ax,h3]=suplabel('Population Parameter Distributions'  ,'t');
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

    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Parameter_Distribution_Figure');
    print('-dmeta',filename);
    saveas(gcf,filename,'fig');

    cd(currentdirectory);

end

if nargin == 2

    subplot(3,3,1); box on; hold on;
    xlabel('Soma Diam (\mum)','FontSize',labelfontsize,'FontWeight','b');
    [totaldata xvalues] = hist([controlanalysis.somadiameter.values testanalysis.somadiameter.values]);
    hist(controlanalysis.somadiameter.values,xvalues);
    hist(testanalysis.somadiameter.values,xvalues);
    h = findobj(gca,'Type','patch');
    set(h(2),'FaceColor','b','EdgeColor','b','FaceAlpha',0.5,'EdgeAlpha',0.5);
    set(h(1),'FaceColor','r','EdgeColor','r','FaceAlpha',0.5,'EdgeAlpha',0.5);
    hold off;


    subplot(3,3,4); box on; hold on;
    xlabel('Number PDs','FontSize',labelfontsize,'FontWeight','b');
    [totaldata xvalues] = hist([controlanalysis.numberprimarydendrites.values testanalysis.numberprimarydendrites.values]);
    hist(controlanalysis.numberprimarydendrites.values,xvalues);
    hist(testanalysis.numberprimarydendrites.values,xvalues);
    h = findobj(gca,'Type','patch');
    set(h(2),'FaceColor','b','EdgeColor','b','FaceAlpha',0.5,'EdgeAlpha',0.5);
    set(h(1),'FaceColor','r','EdgeColor','r','FaceAlpha',0.5,'EdgeAlpha',0.5);
    hold off;

    subplot(3,3,7); box on; hold on;
    xlabel('Number Segs','FontSize',labelfontsize,'FontWeight','b');
    [totaldata xvalues] = hist([controlanalysis.numbersegments.values testanalysis.numbersegments.values]);
    hist(controlanalysis.numbersegments.values,xvalues);
    hist(testanalysis.numbersegments.values,xvalues);
    h = findobj(gca,'Type','patch');
    set(h(2),'FaceColor','b','EdgeColor','b','FaceAlpha',0.5,'EdgeAlpha',0.5);
    set(h(1),'FaceColor','r','EdgeColor','r','FaceAlpha',0.5,'EdgeAlpha',0.5);
    hold off;

    subplot(3,3,2); box on; hold on;
    xlabel('Tot Length (10^3 \mum)','FontSize',labelfontsize,'FontWeight','b');
    [totaldata xvalues] = hist([controlanalysis.totallength.values (testanalysis.totallength.values/1000)]);
    hist(controlanalysis.totallength.values,xvalues);
    hist(testanalysis.totallength.values/1000,xvalues);
    h = findobj(gca,'Type','patch');
    set(h(2),'FaceColor','b','EdgeColor','b','FaceAlpha',0.5,'EdgeAlpha',0.5);
    set(h(1),'FaceColor','r','EdgeColor','r','FaceAlpha',0.5,'EdgeAlpha',0.5);
    hold off;

    subplot(3,3,5); box on; hold on;
    xlabel('Tot SA (10^3 \mum^2)','FontSize',labelfontsize,'FontWeight','b');
    [totaldata xvalues] = hist([controlanalysis.totalsurfacearea.values (testanalysis.totalsurfacearea.values/1000)]);
    hist(controlanalysis.totalsurfacearea.values,xvalues);
    hist(testanalysis.totalsurfacearea.values/1000,xvalues);
    h = findobj(gca,'Type','patch');
    set(h(2),'FaceColor','b','EdgeColor','b','FaceAlpha',0.5,'EdgeAlpha',0.5);
    set(h(1),'FaceColor','r','EdgeColor','r','FaceAlpha',0.5,'EdgeAlpha',0.5);
    hold off;

    subplot(3,3,8); box on; hold on;
    xlabel('Tot Vol (10^3 \mum^3)','FontSize',labelfontsize,'FontWeight','b');
    [totaldata xvalues] = hist([controlanalysis.totalvolume.values (testanalysis.totalvolume.values/1000)]);
    hist(controlanalysis.totalvolume.values,xvalues);
    hist(testanalysis.totalvolume.values/1000,xvalues);
    h = findobj(gca,'Type','patch');
    set(h(2),'FaceColor','b','EdgeColor','b','FaceAlpha',0.5,'EdgeAlpha',0.5);
    set(h(1),'FaceColor','r','EdgeColor','r','FaceAlpha',0.5,'EdgeAlpha',0.5);
    hold off;

    subplot(3,3,3); box on; hold on;
    xlabel('PD Tot Cyl Diam (\mum)','FontSize',labelfontsize,'FontWeight','b');
    controldata = [controlanalysis.numberprimarydendrites.values].*[controlanalysis.primarydendrite.meancylindricaldiameter.values];
    testdata    = [testanalysis.numberprimarydendrites.values].*[testanalysis.primarydendrite.meancylindricaldiameter.values];
    [totaldata xvalues] = hist([controldata testdata]);
    hist(controldata,xvalues);
    hist(testdata,xvalues);
    h = findobj(gca,'Type','patch');
    set(h(2),'FaceColor','b','EdgeColor','b','FaceAlpha',0.5,'EdgeAlpha',0.5);
    set(h(1),'FaceColor','r','EdgeColor','r','FaceAlpha',0.5,'EdgeAlpha',0.5);
    hold off;

    subplot(3,3,6); box on; hold on;
    xlabel('PD Mean Cyl Diam (\mum)','FontSize',labelfontsize,'FontWeight','b');
    [totaldata xvalues] = hist([controlanalysis.primarydendrite.meancylindricaldiameter.values testanalysis.primarydendrite.meancylindricaldiameter.values]);
    hist(controlanalysis.primarydendrite.meancylindricaldiameter.values,xvalues);
    hist(testanalysis.primarydendrite.meancylindricaldiameter.values,xvalues);
    h = findobj(gca,'Type','patch');
    set(h(2),'FaceColor','b','EdgeColor','b','FaceAlpha',0.5,'EdgeAlpha',0.5);
    set(h(1),'FaceColor','r','EdgeColor','r','FaceAlpha',0.5,'EdgeAlpha',0.5);
    hold off;

    subplot(3,3,9); box on; hold on;
    xlabel('Max Branch Ord','FontSize',labelfontsize,'FontWeight','b');
    [totaldata xvalues] = hist([controlanalysis.maxbranchorder.values testanalysis.maxbranchorder.values]);
    hist(controlanalysis.maxbranchorder.values,xvalues);
    hist(testanalysis.maxbranchorder.values,xvalues);
    h = findobj(gca,'Type','patch');
    set(h(2),'FaceColor','b','EdgeColor','b','FaceAlpha',0.5,'EdgeAlpha',0.5);
    set(h(1),'FaceColor','r','EdgeColor','r','FaceAlpha',0.5,'EdgeAlpha',0.5);
    hold off;


    %subplotspace('horizontal',-20);
    %subplotspace('vertical',-20);

    [ax,h2]=suplabel('Number of Motoneurons','y');
    [ax,h3]=suplabel('Comparison of Population Parameter Distributions'  ,'t');
    set(h2,'FontSize',15);
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

    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'Parameter_Distribution_Comparison_Figure');
    print('-dmeta',filename);
    saveas(gcf,filename,'fig');

    cd(currentdirectory);

end












