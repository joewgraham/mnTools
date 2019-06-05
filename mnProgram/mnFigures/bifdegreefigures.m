function bifdegreefigures(controlanalysis,testanalysis)
% Bif degree figures

titlefontsize = 14;
labelfontsize = 7;
axesfontsize  = 5;
insetfontsize = 5;

indbluemarkersize = 6;
bluemarkersize    = 8;
cyanmarkersize    = 6;


figure;

if nargin == 1

    
    subplot(3,2,1); box on; 
    controldatax1   = [controlanalysis.degree.degree];
    controldatay1   = [controlanalysis.degree.rallratio1.mean];
    controldatastd1 = [controlanalysis.degree.rallratio1.std];
    errorbar(controldatax1,controldatay1,controldatastd1/2,'-ob','LineWidth',2,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',indbluemarkersize);   
    hold on;   
    ylabel('Rall Ratio (D^{1.0})','FontSize',labelfontsize,'FontWeight','b');   
    legendhandle = gca;    
    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);
    xlimits=xlim;
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);
    set(gca,'FontSize',axesfontsize);hold off;


    subplot(3,2,3); box on; 
    controldatax1   = [controlanalysis.degree.degree];
    controldatay1   = [controlanalysis.degree.rallratio.mean];
    controldatastd1 = [controlanalysis.degree.rallratio.std];
    errorbar(controldatax1,controldatay1,controldatastd1/2,'-ob','LineWidth',2,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',indbluemarkersize);
    hold on;
    ylabel('Rall Ratio (D^{1.5})','FontSize',labelfontsize,'FontWeight','b');
    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);
    xlimits=xlim;
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);
    set(gca,'FontSize',axesfontsize);hold off;


    subplot(3,2,5); box on; 
    controldatax1   = [controlanalysis.degree.degree];
    controldatay1   = [controlanalysis.degree.rallratio2.mean];
    controldatastd1 = [controlanalysis.degree.rallratio2.std];
    errorbar(controldatax1,controldatay1,controldatastd1/2,'-ob','LineWidth',2,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',indbluemarkersize);
    hold on;
    ylabel('Rall Ratio (D^{2.0})','FontSize',labelfontsize,'FontWeight','b');   
    xlabel('Degree','FontSize',labelfontsize,'FontWeight','b');   
    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);
    %     xlimits=xlim;
    %     xtick = get(gca,'xtick');
    %     set(gca,'xticklabel', []);
    set(gca,'FontSize',axesfontsize);hold off;


    subplot(3,2,2); box on;  
    controldatax1   = [controlanalysis.degree.degree];
    controldatay1   = [controlanalysis.degree.parentdaughterratio.mean];
    controldatastd1 = [controlanalysis.degree.parentdaughterratio.std];
    errorbar(controldatax1,controldatay1,controldatastd1/2,'-ob','LineWidth',2,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',indbluemarkersize);
    hold on;
    ylabel('Parent / Daughter_1 Ratio','FontSize',labelfontsize,'FontWeight','b'); 
    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);
    xlimits=xlim;
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);
    set(gca,'FontSize',axesfontsize);hold off;


    subplot(3,2,4); box on;    
    controldatax1   = [controlanalysis.degree.degree];
    controldatay1   = [controlanalysis.degree.parentdaughter2ratio.mean];
    controldatastd1 = [controlanalysis.degree.parentdaughter2ratio.std];
    errorbar(controldatax1,controldatay1,controldatastd1/2,'-ob','LineWidth',2,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',indbluemarkersize);
    hold on;
    ylabel('Parent / Daughter_2 Ratio','FontSize',labelfontsize,'FontWeight','b');
    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);
    xlimits=xlim;
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);
    set(gca,'FontSize',axesfontsize);hold off;


    subplot(3,2,6); box on; 
    controldatax1   = [controlanalysis.degree.degree];
    controldatay1   = [controlanalysis.degree.daughterratio.mean];
    controldatastd1 = [controlanalysis.degree.daughterratio.std];
    errorbar(controldatax1,controldatay1,controldatastd1/2,'-ob','LineWidth',2,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',indbluemarkersize);
    hold on;
    ylabel('Daughter Ratio','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Degree','FontSize',labelfontsize,'FontWeight','b');   
    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);
    %     xlimits=xlim;
    %     xtick = get(gca,'xtick');
    %     set(gca,'xticklabel', []);
    set(gca,'FontSize',axesfontsize);hold off;




    %subplotspace('horizontal',-20);
    subplotspace('vertical',-15);

    [ax,h3]=suplabel('Branching Parameters versus Degree'  ,'t');
    set(h3,'FontSize',titlefontsize);


    currentdirectory = cd;
    cd(controlanalysis.datapathname);

    if exist('figures','dir')==7
        cd('figures');
    else
        mkdir('figures');
        cd('figures');
    end

    %fillscreen;
    
    filename = sprintf('%s_%s',controlanalysis.inputfilename,'201_Branching_v_Degree');
    print('-djpeg',filename);
    %saveas(gcf,filename,'fig');

end


if nargin == 2

    subplot(3,2,1); box on; 
    controldatax1   = [controlanalysis.degree.degree];
    controldatay1   = [controlanalysis.degree.rallratio1.mean];
    controldatastd1 = [controlanalysis.degree.rallratio1.std];
    errorbar(controldatax1,controldatay1,controldatastd1/2,'-ob','LineWidth',2,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',bluemarkersize);   
    hold on;   
    testdatax1   = [testanalysis.degree.degree];
    testdatay1   = [testanalysis.degree.rallratio1.mean];
    testdatastd1 = [testanalysis.degree.rallratio1.std];
    errorbar(testdatax1,testdatay1,testdatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','c','MarkerSize',cyanmarkersize);   
    ylabel('Rall Ratio (D^{1.0})','FontSize',labelfontsize,'FontWeight','b');   
    legendhandle = gca;    
    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);
    xlimits=xlim;
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);
    set(gca,'FontSize',axesfontsize);hold off;


    subplot(3,2,3); box on; 
    controldatax1   = [controlanalysis.degree.degree];
    controldatay1   = [controlanalysis.degree.rallratio.mean];
    controldatastd1 = [controlanalysis.degree.rallratio.std];
    errorbar(controldatax1,controldatay1,controldatastd1/2,'-ob','LineWidth',2,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',bluemarkersize);
    hold on;
    testdatax1   = [testanalysis.degree.degree];
    testdatay1   = [testanalysis.degree.rallratio.mean];
    testdatastd1 = [testanalysis.degree.rallratio.std];
    errorbar(testdatax1,testdatay1,testdatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','c','MarkerSize',cyanmarkersize);
    ylabel('Rall Ratio (D^{1.5})','FontSize',labelfontsize,'FontWeight','b');
    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);
    xlimits=xlim;
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);
    set(gca,'FontSize',axesfontsize);hold off;


    subplot(3,2,5); box on; 
    controldatax1   = [controlanalysis.degree.degree];
    controldatay1   = [controlanalysis.degree.rallratio2.mean];
    controldatastd1 = [controlanalysis.degree.rallratio2.std];
    errorbar(controldatax1,controldatay1,controldatastd1/2,'-ob','LineWidth',2,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',bluemarkersize);
    hold on;
    testdatax1   = [testanalysis.degree.degree];
    testdatay1   = [testanalysis.degree.rallratio2.mean];
    testdatastd1 = [testanalysis.degree.rallratio2.std];
    errorbar(testdatax1,testdatay1,testdatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','c','MarkerSize',cyanmarkersize);
    ylabel('Rall Ratio (D^{2.0})','FontSize',labelfontsize,'FontWeight','b');   
    xlabel('Degree','FontSize',labelfontsize,'FontWeight','b');   
    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);
    %     xlimits=xlim;
    %     xtick = get(gca,'xtick');
    %     set(gca,'xticklabel', []);
    set(gca,'FontSize',axesfontsize);hold off;


    subplot(3,2,2); box on;  
    controldatax1   = [controlanalysis.degree.degree];
    controldatay1   = [controlanalysis.degree.parentdaughterratio.mean];
    controldatastd1 = [controlanalysis.degree.parentdaughterratio.std];
    errorbar(controldatax1,controldatay1,controldatastd1/2,'-ob','LineWidth',2,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',bluemarkersize);
    hold on;
    testdatax1   = [testanalysis.degree.degree];
    testdatay1   = [testanalysis.degree.parentdaughterratio.mean];
    testdatastd1 = [testanalysis.degree.parentdaughterratio.std];
    errorbar(testdatax1,testdatay1,testdatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','c','MarkerSize',cyanmarkersize);
    ylabel('Parent / Daughter_1 Ratio','FontSize',labelfontsize,'FontWeight','b'); 
    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);
    xlimits=xlim;
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);
    set(gca,'FontSize',axesfontsize);hold off;


    subplot(3,2,4); box on;    
    controldatax1   = [controlanalysis.degree.degree];
    controldatay1   = [controlanalysis.degree.parentdaughter2ratio.mean];
    controldatastd1 = [controlanalysis.degree.parentdaughter2ratio.std];
    errorbar(controldatax1,controldatay1,controldatastd1/2,'-ob','LineWidth',2,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',bluemarkersize);
    hold on;
    testdatax1   = [testanalysis.degree.degree];
    testdatay1   = [testanalysis.degree.parentdaughter2ratio.mean];
    testdatastd1 = [testanalysis.degree.parentdaughter2ratio.std];
    errorbar(testdatax1,testdatay1,testdatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','c','MarkerSize',cyanmarkersize);
    ylabel('Parent / Daughter_2 Ratio','FontSize',labelfontsize,'FontWeight','b');
    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);
    xlimits=xlim;
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);
    set(gca,'FontSize',axesfontsize);hold off;


    subplot(3,2,6); box on; 
    controldatax1   = [controlanalysis.degree.degree];
    controldatay1   = [controlanalysis.degree.daughterratio.mean];
    controldatastd1 = [controlanalysis.degree.daughterratio.std];
    errorbar(controldatax1,controldatay1,controldatastd1/2,'-ob','LineWidth',2,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',bluemarkersize);
    hold on;
    testdatax1   = [testanalysis.degree.degree];
    testdatay1   = [testanalysis.degree.daughterratio.mean];
    testdatastd1 = [testanalysis.degree.daughterratio.std];
    errorbar(testdatax1,testdatay1,testdatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','c','MarkerSize',cyanmarkersize);
    ylabel('Daughter Ratio','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Degree','FontSize',labelfontsize,'FontWeight','b');   
    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);
    %     xlimits=xlim;
    %     xtick = get(gca,'xtick');
    %     set(gca,'xticklabel', []);
    set(gca,'FontSize',axesfontsize);hold off;
    
    
    


    %subplotspace('horizontal',-20);
    subplotspace('vertical',-15);

    %[ax,h1]=suplabel('Degree');
    [ax,h3]=suplabel('Branching Parameters versus Degree'  ,'t');
    %set(h1,'FontSize',15);
    set(h3,'FontSize',titlefontsize);


    currentdirectory = cd;
    cd(controlanalysis.datapathname);
    cd ..

    if exist(sprintf('%s_%s_comparison',controlanalysis.inputfilename,testanalysis.inputfilename),'dir')==7;
        cd(sprintf('%s_%s_comparison',controlanalysis.inputfilename,testanalysis.inputfilename));
    else
        mkdir(sprintf('%s_%s_comparison',controlanalysis.inputfilename,testanalysis.inputfilename));
        cd(sprintf('%s_%s_comparison',controlanalysis.inputfilename,testanalysis.inputfilename));
    end

    if exist('comparisonfigures','dir')==7
        cd('comparisonfigures');
    else
        mkdir('comparisonfigures');
        cd('comparisonfigures');
    end

    %fillscreen;
    
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    legend('boxoff');

    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'201_Branching_v_Degree');
    print('-djpeg',filename);
    %saveas(gcf,filename,'fig');

end
