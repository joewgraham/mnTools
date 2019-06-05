function biftermdegreefigures1(controlanalysis,testanalysis)
% Bif/term degree figures

titlefontsize = 14;
labelfontsize = 7;
axesfontsize  = 5;
insetfontsize = 5;


indbluemarkersize  = 7;
indgreenmarkersize = 3;
indredmarkersize   = 5;

bluemarkersize    = 10;
greenmarkersize   = 6;
redmarkersize     = 8;
cyanmarkersize    = 8;
yellowmarkersize  = 4;
magentamarkersize = 6;

figure;

if nargin == 1

    
    subplot(3,2,1); box on; 
    controldatax1   = [controlanalysis.degree.degree];
    controldatay1   = [controlanalysis.degree.numbersegments.mean];
    controldatastd1 = [controlanalysis.degree.numbersegments.std];
    %errorbar(controldatax1,controldatay1,controldatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10);   
    plot(controldatax1,controldatay1,'-ob','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',indbluemarkersize);   
    hold on;   
    controldatax2   = [controlanalysis.bifurcation.degree.degree];
    controldatay2   = [controlanalysis.bifurcation.degree.numbersegments.mean];
    controldatastd2 = [controlanalysis.bifurcation.degree.numbersegments.std];
    errorbar(controldatax2,controldatay2,controldatastd2/2,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);  
    controldatax3   = [controlanalysis.termination.degree.degree];
    controldatay3   = [controlanalysis.termination.degree.numbersegments.mean];
    controldatastd3 = [controlanalysis.termination.degree.numbersegments.std];
    errorbar(controldatax3,controldatay3,controldatastd3/2,'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);   
    ylabel('Number Segments','FontSize',labelfontsize,'FontWeight','b');
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
    controldatay1   = [controlanalysis.degree.taperrate.mean];
    controldatastd1 = [controlanalysis.degree.taperrate.std];
    %errorbar(controldatax1,controldatay1,controldatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10);   
    plot(controldatax1,controldatay1,'-ob','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',indbluemarkersize);   
    hold on;
    controldatax2   = [controlanalysis.bifurcation.degree.degree];
    controldatay2   = [controlanalysis.bifurcation.degree.taperrate.mean];
    controldatastd2 = [controlanalysis.bifurcation.degree.taperrate.std];
    errorbar(controldatax2,controldatay2,controldatastd2/2,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
    controldatax3   = [controlanalysis.termination.degree.degree];
    controldatay3   = [controlanalysis.termination.degree.taperrate.mean];
    controldatastd3 = [controlanalysis.termination.degree.taperrate.std];
    errorbar(controldatax3,controldatay3,controldatastd3/2,'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
    ylabel('Taper Rate','FontSize',labelfontsize,'FontWeight','b');
    
    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);
    xlimits=xlim;
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);
    set(gca,'FontSize',axesfontsize);hold off;


    subplot(3,2,5); box on; 
    controldatax1   = [controlanalysis.degree.degree];
    controldatay1   = [controlanalysis.degree.taperratio.mean];
    controldatastd1 = [controlanalysis.degree.taperratio.std];
    %errorbar(controldatax1,controldatay1,controldatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10);   
    plot(controldatax1,controldatay1,'-ob','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',indbluemarkersize);   
    hold on;
    controldatax2   = [controlanalysis.bifurcation.degree.degree];
    controldatay2   = [controlanalysis.bifurcation.degree.taperratio.mean];
    controldatastd2 = [controlanalysis.bifurcation.degree.taperratio.std];
    errorbar(controldatax2,controldatay2,controldatastd2/2,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
    controldatax3   = [controlanalysis.termination.degree.degree];
    controldatay3   = [controlanalysis.termination.degree.taperratio.mean];
    controldatastd3 = [controlanalysis.termination.degree.taperratio.std];
    errorbar(controldatax3,controldatay3,controldatastd3/2,'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
    ylabel('Taper Ratio','FontSize',labelfontsize,'FontWeight','b');
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
    controldatay1   = [controlanalysis.degree.proximaldiameter.mean];
    controldatastd1 = [controlanalysis.degree.proximaldiameter.std];
    %errorbar(controldatax1,controldatay1,controldatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10);   
    plot(controldatax1,controldatay1,'-ob','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',indbluemarkersize);   
    hold on;
    controldatax2   = [controlanalysis.bifurcation.degree.degree];
    controldatay2   = [controlanalysis.bifurcation.degree.proximaldiameter.mean];
    controldatastd2 = [controlanalysis.bifurcation.degree.proximaldiameter.std];
    errorbar(controldatax2,controldatay2,controldatastd2/2,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
    controldatax3   = [controlanalysis.termination.degree.degree];
    controldatay3   = [controlanalysis.termination.degree.proximaldiameter.mean];
    controldatastd3 = [controlanalysis.termination.degree.proximaldiameter.std];
    errorbar(controldatax3,controldatay3,controldatastd3/2,'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
    ylabel('Proximal Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);
    xlimits=xlim;
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);
    set(gca,'FontSize',axesfontsize);hold off;


    subplot(3,2,4); box on;    
    controldatax1   = [controlanalysis.degree.degree];
    controldatay1   = [controlanalysis.degree.cylindricaldiameter.mean];
    controldatastd1 = [controlanalysis.degree.cylindricaldiameter.std];
    %errorbar(controldatax1,controldatay1,controldatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10);   
    plot(controldatax1,controldatay1,'-ob','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',indbluemarkersize);   
    hold on;
    controldatax2   = [controlanalysis.bifurcation.degree.degree];
    controldatay2   = [controlanalysis.bifurcation.degree.cylindricaldiameter.mean];
    controldatastd2 = [controlanalysis.bifurcation.degree.cylindricaldiameter.std];
    errorbar(controldatax2,controldatay2,controldatastd2/2,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
    controldatax3   = [controlanalysis.termination.degree.degree];
    controldatay3   = [controlanalysis.termination.degree.cylindricaldiameter.mean];
    controldatastd3 = [controlanalysis.termination.degree.cylindricaldiameter.std];
    errorbar(controldatax3,controldatay3,controldatastd3/2,'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
    ylabel('Cylindrical Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);
    xlimits=xlim;
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);
    set(gca,'FontSize',axesfontsize);hold off;


    subplot(3,2,6); box on; 
    controldatax1   = [controlanalysis.degree.degree];
    controldatay1   = [controlanalysis.degree.distaldiameter.mean];
    controldatastd1 = [controlanalysis.degree.distaldiameter.std];
    %errorbar(controldatax1,controldatay1,controldatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10);   
    plot(controldatax1,controldatay1,'-ob','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',indbluemarkersize);   
    hold on;
    controldatax2   = [controlanalysis.bifurcation.degree.degree];
    controldatay2   = [controlanalysis.bifurcation.degree.distaldiameter.mean];
    controldatastd2 = [controlanalysis.bifurcation.degree.distaldiameter.std];
    errorbar(controldatax2,controldatay2,controldatastd2/2,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
    controldatax3   = [controlanalysis.termination.degree.degree];
    controldatay3   = [controlanalysis.termination.degree.distaldiameter.mean];
    controldatastd3 = [controlanalysis.termination.degree.distaldiameter.std];
    errorbar(controldatax3,controldatay3,controldatastd3/2,'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
    ylabel('Distal Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Degree','FontSize',labelfontsize,'FontWeight','b');
    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);
    %     xlimits=xlim;
    %     xtick = get(gca,'xtick');
    %     set(gca,'xticklabel', []);
    set(gca,'FontSize',axesfontsize);hold off;




    subplotspace('horizontal',-5);
    subplotspace('vertical',-15);

    %[ax,h1]=suplabel('Degree');
    [ax,h3]=suplabel('Morphometrics versus Degree'  ,'t');
    %set(h1,'FontSize',15);
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
    
    legend(legendhandle,[controlanalysis.inputfilename ' All'],[controlanalysis.inputfilename ' Bifs'],[controlanalysis.inputfilename ' Terms'],'Location','NorthEast');
    legend('boxoff');

    filename = sprintf('%s_%s',controlanalysis.inputfilename,'101_Morph_v_Degree');
    print('-djpeg',filename);
    %saveas(gcf,filename,'fig');

end


if nargin == 2

    subplot(3,2,1); box on; 
    controldatax1   = [controlanalysis.degree.degree];
    controldatay1   = [controlanalysis.degree.numbersegments.mean];
    controldatastd1 = [controlanalysis.degree.numbersegments.std];
    %errorbar(controldatax1,controldatay1,controldatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10);   
    %plot(controldatax1,controldatay1,'-ob','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',bluemarkersize);   
    hold on;   
    controldatax2   = [controlanalysis.bifurcation.degree.degree];
    controldatay2   = [controlanalysis.bifurcation.degree.numbersegments.mean];
    controldatastd2 = [controlanalysis.bifurcation.degree.numbersegments.std];
    errorbar(controldatax2,controldatay2,controldatastd2/2,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);  
    controldatax3   = [controlanalysis.termination.degree.degree];
    controldatay3   = [controlanalysis.termination.degree.numbersegments.mean];
    controldatastd3 = [controlanalysis.termination.degree.numbersegments.std];
    errorbar(controldatax3,controldatay3,controldatastd3/2,'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);   
    
    testdatax1   = [testanalysis.degree.degree];
    testdatay1   = [testanalysis.degree.numbersegments.mean];
    testdatastd1 = [testanalysis.degree.numbersegments.std];
    %errorbar(testdatax1,testdatay1,testdatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10);   
    %plot(testdatax1,testdatay1,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','c','MarkerSize',cyanmarkersize);   
    hold on;   
    testdatax2   = [testanalysis.bifurcation.degree.degree];
    testdatay2   = [testanalysis.bifurcation.degree.numbersegments.mean];
    testdatastd2 = [testanalysis.bifurcation.degree.numbersegments.std];
    errorbar(testdatax2,testdatay2,testdatastd2/2,'-sk','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',yellowmarkersize);  
    testdatax3   = [testanalysis.termination.degree.degree];
    testdatay3   = [testanalysis.termination.degree.numbersegments.mean];
    testdatastd3 = [testanalysis.termination.degree.numbersegments.std];
    errorbar(testdatax3,testdatay3,testdatastd3/2,'-dk','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','m','MarkerSize',magentamarkersize);   
    ylabel('Number Segments','FontSize',labelfontsize,'FontWeight','b');
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
    controldatay1   = [controlanalysis.degree.taperrate.mean];
    controldatastd1 = [controlanalysis.degree.taperrate.std];
    %errorbar(controldatax1,controldatay1,controldatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10);   
    %plot(controldatax1,controldatay1,'-ob','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',bluemarkersize);   
    hold on;
    controldatax2   = [controlanalysis.bifurcation.degree.degree];
    controldatay2   = [controlanalysis.bifurcation.degree.taperrate.mean];
    controldatastd2 = [controlanalysis.bifurcation.degree.taperrate.std];
    errorbar(controldatax2,controldatay2,controldatastd2/2,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
    controldatax3   = [controlanalysis.termination.degree.degree];
    controldatay3   = [controlanalysis.termination.degree.taperrate.mean];
    controldatastd3 = [controlanalysis.termination.degree.taperrate.std];
    errorbar(controldatax3,controldatay3,controldatastd3/2,'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
    
    testdatax1   = [testanalysis.degree.degree];
    testdatay1   = [testanalysis.degree.taperrate.mean];
    testdatastd1 = [testanalysis.degree.taperrate.std];
    %errorbar(testdatax1,testdatay1,testdatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10);   
    %plot(testdatax1,testdatay1,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','c','MarkerSize',cyanmarkersize);   
    hold on;
    testdatax2   = [testanalysis.bifurcation.degree.degree];
    testdatay2   = [testanalysis.bifurcation.degree.taperrate.mean];
    testdatastd2 = [testanalysis.bifurcation.degree.taperrate.std];
    errorbar(testdatax2,testdatay2,testdatastd2/2,'-sk','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
    testdatax3   = [testanalysis.termination.degree.degree];
    testdatay3   = [testanalysis.termination.degree.taperrate.mean];
    testdatastd3 = [testanalysis.termination.degree.taperrate.std];
    errorbar(testdatax3,testdatay3,testdatastd3/2,'-dk','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','m','MarkerSize',magentamarkersize);
    ylabel('Taper Rate','FontSize',labelfontsize,'FontWeight','b');
    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);
    xlimits=xlim;
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);
    set(gca,'FontSize',axesfontsize);hold off;


    subplot(3,2,5); box on; 
    controldatax1   = [controlanalysis.degree.degree];
    controldatay1   = [controlanalysis.degree.taperratio.mean];
    controldatastd1 = [controlanalysis.degree.taperratio.std];
    %errorbar(controldatax1,controldatay1,controldatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10);   
    %plot(controldatax1,controldatay1,'-ob','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',bluemarkersize);   
    hold on;
    controldatax2   = [controlanalysis.bifurcation.degree.degree];
    controldatay2   = [controlanalysis.bifurcation.degree.taperratio.mean];
    controldatastd2 = [controlanalysis.bifurcation.degree.taperratio.std];
    errorbar(controldatax2,controldatay2,controldatastd2/2,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
    controldatax3   = [controlanalysis.termination.degree.degree];
    controldatay3   = [controlanalysis.termination.degree.taperratio.mean];
    controldatastd3 = [controlanalysis.termination.degree.taperratio.std];
    errorbar(controldatax3,controldatay3,controldatastd3/2,'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
    
    testdatax1   = [testanalysis.degree.degree];
    testdatay1   = [testanalysis.degree.taperratio.mean];
    testdatastd1 = [testanalysis.degree.taperratio.std];
    %errorbar(testdatax1,testdatay1,testdatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10);   
    %plot(testdatax1,testdatay1,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','c','MarkerSize',cyanmarkersize);   
    hold on;
    testdatax2   = [testanalysis.bifurcation.degree.degree];
    testdatay2   = [testanalysis.bifurcation.degree.taperratio.mean];
    testdatastd2 = [testanalysis.bifurcation.degree.taperratio.std];
    errorbar(testdatax2,testdatay2,testdatastd2/2,'-sk','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
    testdatax3   = [testanalysis.termination.degree.degree];
    testdatay3   = [testanalysis.termination.degree.taperratio.mean];
    testdatastd3 = [testanalysis.termination.degree.taperratio.std];
    errorbar(testdatax3,testdatay3,testdatastd3/2,'-dk','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','m','MarkerSize',magentamarkersize);
    ylabel('Taper Ratio','FontSize',labelfontsize,'FontWeight','b');
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
    controldatay1   = [controlanalysis.degree.proximaldiameter.mean];
    controldatastd1 = [controlanalysis.degree.proximaldiameter.std];
    %errorbar(controldatax1,controldatay1,controldatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10);   
    %plot(controldatax1,controldatay1,'-ob','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',bluemarkersize);   
    hold on;
    controldatax2   = [controlanalysis.bifurcation.degree.degree];
    controldatay2   = [controlanalysis.bifurcation.degree.proximaldiameter.mean];
    controldatastd2 = [controlanalysis.bifurcation.degree.proximaldiameter.std];
    errorbar(controldatax2,controldatay2,controldatastd2/2,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
    controldatax3   = [controlanalysis.termination.degree.degree];
    controldatay3   = [controlanalysis.termination.degree.proximaldiameter.mean];
    controldatastd3 = [controlanalysis.termination.degree.proximaldiameter.std];
    errorbar(controldatax3,controldatay3,controldatastd3/2,'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
    
    testdatax1   = [testanalysis.degree.degree];
    testdatay1   = [testanalysis.degree.proximaldiameter.mean];
    testdatastd1 = [testanalysis.degree.proximaldiameter.std];
    %errorbar(testdatax1,testdatay1,testdatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10);   
    %plot(testdatax1,testdatay1,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','c','MarkerSize',cyanmarkersize);   
    hold on;
    testdatax2   = [testanalysis.bifurcation.degree.degree];
    testdatay2   = [testanalysis.bifurcation.degree.proximaldiameter.mean];
    testdatastd2 = [testanalysis.bifurcation.degree.proximaldiameter.std];
    errorbar(testdatax2,testdatay2,testdatastd2/2,'-sk','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
    testdatax3   = [testanalysis.termination.degree.degree];
    testdatay3   = [testanalysis.termination.degree.proximaldiameter.mean];
    testdatastd3 = [testanalysis.termination.degree.proximaldiameter.std];
    errorbar(testdatax3,testdatay3,testdatastd3/2,'-dk','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','m','MarkerSize',magentamarkersize);
    ylabel('Proximal Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);
    xlimits=xlim;
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);
    set(gca,'FontSize',axesfontsize);hold off;


    subplot(3,2,4); box on;    
    controldatax1   = [controlanalysis.degree.degree];
    controldatay1   = [controlanalysis.degree.cylindricaldiameter.mean];
    controldatastd1 = [controlanalysis.degree.cylindricaldiameter.std];
    %errorbar(controldatax1,controldatay1,controldatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10);   
    %plot(controldatax1,controldatay1,'-ob','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',bluemarkersize);   
    hold on;
    controldatax2   = [controlanalysis.bifurcation.degree.degree];
    controldatay2   = [controlanalysis.bifurcation.degree.cylindricaldiameter.mean];
    controldatastd2 = [controlanalysis.bifurcation.degree.cylindricaldiameter.std];
    errorbar(controldatax2,controldatay2,controldatastd2/2,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
    controldatax3   = [controlanalysis.termination.degree.degree];
    controldatay3   = [controlanalysis.termination.degree.cylindricaldiameter.mean];
    controldatastd3 = [controlanalysis.termination.degree.cylindricaldiameter.std];
    errorbar(controldatax3,controldatay3,controldatastd3/2,'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
    
    testdatax1   = [testanalysis.degree.degree];
    testdatay1   = [testanalysis.degree.cylindricaldiameter.mean];
    testdatastd1 = [testanalysis.degree.cylindricaldiameter.std];
    %errorbar(testdatax1,testdatay1,testdatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10);   
    %plot(testdatax1,testdatay1,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','c','MarkerSize',cyanmarkersize);   
    hold on;
    testdatax2   = [testanalysis.bifurcation.degree.degree];
    testdatay2   = [testanalysis.bifurcation.degree.cylindricaldiameter.mean];
    testdatastd2 = [testanalysis.bifurcation.degree.cylindricaldiameter.std];
    errorbar(testdatax2,testdatay2,testdatastd2/2,'-sk','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
    testdatax3   = [testanalysis.termination.degree.degree];
    testdatay3   = [testanalysis.termination.degree.cylindricaldiameter.mean];
    testdatastd3 = [testanalysis.termination.degree.cylindricaldiameter.std];
    errorbar(testdatax3,testdatay3,testdatastd3/2,'-dk','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','m','MarkerSize',magentamarkersize);
    ylabel('Cylindrical Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);
    xlimits=xlim;
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);
    set(gca,'FontSize',axesfontsize);hold off;


    subplot(3,2,6); box on; 
    controldatax1   = [controlanalysis.degree.degree];
    controldatay1   = [controlanalysis.degree.distaldiameter.mean];
    controldatastd1 = [controlanalysis.degree.distaldiameter.std];
    %errorbar(controldatax1,controldatay1,controldatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10);   
    %plot(controldatax1,controldatay1,'-ob','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',bluemarkersize);   
    hold on;
    controldatax2   = [controlanalysis.bifurcation.degree.degree];
    controldatay2   = [controlanalysis.bifurcation.degree.distaldiameter.mean];
    controldatastd2 = [controlanalysis.bifurcation.degree.distaldiameter.std];
    errorbar(controldatax2,controldatay2,controldatastd2/2,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
    controldatax3   = [controlanalysis.termination.degree.degree];
    controldatay3   = [controlanalysis.termination.degree.distaldiameter.mean];
    controldatastd3 = [controlanalysis.termination.degree.distaldiameter.std];
    errorbar(controldatax3,controldatay3,controldatastd3/2,'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
    
    testdatax1   = [testanalysis.degree.degree];
    testdatay1   = [testanalysis.degree.distaldiameter.mean];
    testdatastd1 = [testanalysis.degree.distaldiameter.std];
    %errorbar(testdatax1,testdatay1,testdatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10);   
    %plot(testdatax1,testdatay1,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','c','MarkerSize',cyanmarkersize);   
    hold on;
    testdatax2   = [testanalysis.bifurcation.degree.degree];
    testdatay2   = [testanalysis.bifurcation.degree.distaldiameter.mean];
    testdatastd2 = [testanalysis.bifurcation.degree.distaldiameter.std];
    errorbar(testdatax2,testdatay2,testdatastd2/2,'-sk','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
    testdatax3   = [testanalysis.termination.degree.degree];
    testdatay3   = [testanalysis.termination.degree.distaldiameter.mean];
    testdatastd3 = [testanalysis.termination.degree.distaldiameter.std];
    errorbar(testdatax3,testdatay3,testdatastd3/2,'-dk','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','m','MarkerSize',magentamarkersize);
    ylabel('Distal Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Degree','FontSize',labelfontsize,'FontWeight','b');
    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);
    %     xlimits=xlim;
    %     xtick = get(gca,'xtick');
    %     set(gca,'xticklabel', []);
    set(gca,'FontSize',axesfontsize);hold off;



    subplotspace('horizontal',-5);
    subplotspace('vertical',-15);

    %[ax,h1]=suplabel('Degree');
    [ax,h3]=suplabel('Morphometrics versus Degree'  ,'t');
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
    
    legend(legendhandle,[controlanalysis.inputfilename ' Bifs'],[controlanalysis.inputfilename ' Terms'],[testanalysis.inputfilename ' Bifs'],[testanalysis.inputfilename ' Terms'],'Location','NorthEast');
    legend('boxoff');

    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'101_Morph_v_Degree');
    print('-djpeg',filename);
    %saveas(gcf,filename,'fig');

end
 