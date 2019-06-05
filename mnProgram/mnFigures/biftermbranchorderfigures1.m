function biftermbranchorderfigures1(controlanalysis,testanalysis)
% Bif/term branch order figures

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
    controldatax1   = [controlanalysis.branchorder.branchorder];
    controldatay1   = [controlanalysis.branchorder.numbersegments.mean];
    controldatastd1 = [controlanalysis.branchorder.numbersegments.std];
    %errorbar(controldatax1,controldatay1,controldatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10);   
    plot(controldatax1,controldatay1,'-ob','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',indbluemarkersize);   
    hold on;   
    controldatax2   = [controlanalysis.bifurcation.branchorder.branchorder];
    controldatay2   = [controlanalysis.bifurcation.branchorder.numbersegments.mean];
    controldatastd2 = [controlanalysis.bifurcation.branchorder.numbersegments.std];
    errorbar(controldatax2,controldatay2,controldatastd2/2,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);  
    controldatax3   = [controlanalysis.termination.branchorder.branchorder];
    controldatay3   = [controlanalysis.termination.branchorder.numbersegments.mean];
    controldatastd3 = [controlanalysis.termination.branchorder.numbersegments.std];
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
    controldatax1   = [controlanalysis.branchorder.branchorder];
    controldatay1   = [controlanalysis.branchorder.taperrate.mean];
    controldatastd1 = [controlanalysis.branchorder.taperrate.std];
    %errorbar(controldatax1,controldatay1,controldatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10);   
    plot(controldatax1,controldatay1,'-ob','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',indbluemarkersize);   
    hold on;
    controldatax2   = [controlanalysis.bifurcation.branchorder.branchorder];
    controldatay2   = [controlanalysis.bifurcation.branchorder.taperrate.mean];
    controldatastd2 = [controlanalysis.bifurcation.branchorder.taperrate.std];
    errorbar(controldatax2,controldatay2,controldatastd2/2,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
    controldatax3   = [controlanalysis.termination.branchorder.branchorder];
    controldatay3   = [controlanalysis.termination.branchorder.taperrate.mean];
    controldatastd3 = [controlanalysis.termination.branchorder.taperrate.std];
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
    controldatax1   = [controlanalysis.branchorder.branchorder];
    controldatay1   = [controlanalysis.branchorder.taperratio.mean];
    controldatastd1 = [controlanalysis.branchorder.taperratio.std];
    %errorbar(controldatax1,controldatay1,controldatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10);   
    plot(controldatax1,controldatay1,'-ob','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',indbluemarkersize);   
    hold on;
    controldatax2   = [controlanalysis.bifurcation.branchorder.branchorder];
    controldatay2   = [controlanalysis.bifurcation.branchorder.taperratio.mean];
    controldatastd2 = [controlanalysis.bifurcation.branchorder.taperratio.std];
    errorbar(controldatax2,controldatay2,controldatastd2/2,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
    controldatax3   = [controlanalysis.termination.branchorder.branchorder];
    controldatay3   = [controlanalysis.termination.branchorder.taperratio.mean];
    controldatastd3 = [controlanalysis.termination.branchorder.taperratio.std];
    errorbar(controldatax3,controldatay3,controldatastd3/2,'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
    ylabel('Taper Ratio','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Branch Order','FontSize',labelfontsize,'FontWeight','b');
    
    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);
    %     xlimits=xlim;
    %     xtick = get(gca,'xtick');
    %     set(gca,'xticklabel', []);
    set(gca,'FontSize',axesfontsize);hold off;


    subplot(3,2,2); box on; 
    controldatax1   = [controlanalysis.branchorder.branchorder];
    controldatay1   = [controlanalysis.branchorder.proximaldiameter.mean];
    controldatastd1 = [controlanalysis.branchorder.proximaldiameter.std];
    %errorbar(controldatax1,controldatay1,controldatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10);   
    plot(controldatax1,controldatay1,'-ob','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',indbluemarkersize);   
    hold on;
    controldatax2   = [controlanalysis.bifurcation.branchorder.branchorder];
    controldatay2   = [controlanalysis.bifurcation.branchorder.proximaldiameter.mean];
    controldatastd2 = [controlanalysis.bifurcation.branchorder.proximaldiameter.std];
    errorbar(controldatax2,controldatay2,controldatastd2/2,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
    controldatax3   = [controlanalysis.termination.branchorder.branchorder];
    controldatay3   = [controlanalysis.termination.branchorder.proximaldiameter.mean];
    controldatastd3 = [controlanalysis.termination.branchorder.proximaldiameter.std];
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
    controldatax1   = [controlanalysis.branchorder.branchorder];
    controldatay1   = [controlanalysis.branchorder.cylindricaldiameter.mean];
    controldatastd1 = [controlanalysis.branchorder.cylindricaldiameter.std];
    %errorbar(controldatax1,controldatay1,controldatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10);   
    plot(controldatax1,controldatay1,'-ob','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',indbluemarkersize);   
    hold on;
    controldatax2   = [controlanalysis.bifurcation.branchorder.branchorder];
    controldatay2   = [controlanalysis.bifurcation.branchorder.cylindricaldiameter.mean];
    controldatastd2 = [controlanalysis.bifurcation.branchorder.cylindricaldiameter.std];
    errorbar(controldatax2,controldatay2,controldatastd2/2,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
    controldatax3   = [controlanalysis.termination.branchorder.branchorder];
    controldatay3   = [controlanalysis.termination.branchorder.cylindricaldiameter.mean];
    controldatastd3 = [controlanalysis.termination.branchorder.cylindricaldiameter.std];
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
    controldatax1   = [controlanalysis.branchorder.branchorder];
    controldatay1   = [controlanalysis.branchorder.distaldiameter.mean];
    controldatastd1 = [controlanalysis.branchorder.distaldiameter.std];
    %errorbar(controldatax1,controldatay1,controldatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10);   
    plot(controldatax1,controldatay1,'-ob','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',indbluemarkersize);   
    hold on;
    controldatax2   = [controlanalysis.bifurcation.branchorder.branchorder];
    controldatay2   = [controlanalysis.bifurcation.branchorder.distaldiameter.mean];
    controldatastd2 = [controlanalysis.bifurcation.branchorder.distaldiameter.std];
    errorbar(controldatax2,controldatay2,controldatastd2/2,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
    controldatax3   = [controlanalysis.termination.branchorder.branchorder];
    controldatay3   = [controlanalysis.termination.branchorder.distaldiameter.mean];
    controldatastd3 = [controlanalysis.termination.branchorder.distaldiameter.std];
    errorbar(controldatax3,controldatay3,controldatastd3/2,'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
    ylabel('Distal Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Branch Order','FontSize',labelfontsize,'FontWeight','b');
    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);
    %     xlimits=xlim;
    %     xtick = get(gca,'xtick');
    %     set(gca,'xticklabel', []);
    set(gca,'FontSize',axesfontsize);hold off;




    subplotspace('horizontal',-5);
    subplotspace('vertical',-15);

    %[ax,h1]=suplabel('Branch Order');
    [ax,h3]=suplabel('Morphometrics versus Branch Order'  ,'t');
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

    filename = sprintf('%s_%s',controlanalysis.inputfilename,'101_Morph_v_Branch_Order');
    print('-djpeg',filename);
    %saveas(gcf,filename,'fig');

end


if nargin == 2

    subplot(3,2,1); box on; 
    controldatax1   = [controlanalysis.branchorder.branchorder];
    controldatay1   = [controlanalysis.branchorder.numbersegments.mean];
    controldatastd1 = [controlanalysis.branchorder.numbersegments.std];
    %errorbar(controldatax1,controldatay1,controldatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10);   
    %plot(controldatax1,controldatay1,'-ob','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',bluemarkersize);   
    hold on;   
    controldatax2   = [controlanalysis.bifurcation.branchorder.branchorder];
    controldatay2   = [controlanalysis.bifurcation.branchorder.numbersegments.mean];
    controldatastd2 = [controlanalysis.bifurcation.branchorder.numbersegments.std];
    errorbar(controldatax2,controldatay2,controldatastd2/2,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);  
    controldatax3   = [controlanalysis.termination.branchorder.branchorder];
    controldatay3   = [controlanalysis.termination.branchorder.numbersegments.mean];
    controldatastd3 = [controlanalysis.termination.branchorder.numbersegments.std];
    errorbar(controldatax3,controldatay3,controldatastd3/2,'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);   
    
    testdatax1   = [testanalysis.branchorder.branchorder];
    testdatay1   = [testanalysis.branchorder.numbersegments.mean];
    testdatastd1 = [testanalysis.branchorder.numbersegments.std];
    %errorbar(testdatax1,testdatay1,testdatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10);   
    %plot(testdatax1,testdatay1,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','c','MarkerSize',cyanmarkersize);   
    hold on;   
    testdatax2   = [testanalysis.bifurcation.branchorder.branchorder];
    testdatay2   = [testanalysis.bifurcation.branchorder.numbersegments.mean];
    testdatastd2 = [testanalysis.bifurcation.branchorder.numbersegments.std];
    errorbar(testdatax2,testdatay2,testdatastd2/2,'-sk','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',yellowmarkersize);  
    testdatax3   = [testanalysis.termination.branchorder.branchorder];
    testdatay3   = [testanalysis.termination.branchorder.numbersegments.mean];
    testdatastd3 = [testanalysis.termination.branchorder.numbersegments.std];
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
    controldatax1   = [controlanalysis.branchorder.branchorder];
    controldatay1   = [controlanalysis.branchorder.taperrate.mean];
    controldatastd1 = [controlanalysis.branchorder.taperrate.std];
    %errorbar(controldatax1,controldatay1,controldatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10);   
    %plot(controldatax1,controldatay1,'-ob','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',bluemarkersize);   
    hold on;
    controldatax2   = [controlanalysis.bifurcation.branchorder.branchorder];
    controldatay2   = [controlanalysis.bifurcation.branchorder.taperrate.mean];
    controldatastd2 = [controlanalysis.bifurcation.branchorder.taperrate.std];
    errorbar(controldatax2,controldatay2,controldatastd2/2,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
    controldatax3   = [controlanalysis.termination.branchorder.branchorder];
    controldatay3   = [controlanalysis.termination.branchorder.taperrate.mean];
    controldatastd3 = [controlanalysis.termination.branchorder.taperrate.std];
    errorbar(controldatax3,controldatay3,controldatastd3/2,'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
    
    testdatax1   = [testanalysis.branchorder.branchorder];
    testdatay1   = [testanalysis.branchorder.taperrate.mean];
    testdatastd1 = [testanalysis.branchorder.taperrate.std];
    %errorbar(testdatax1,testdatay1,testdatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10);   
    %plot(testdatax1,testdatay1,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','c','MarkerSize',cyanmarkersize);   
    hold on;
    testdatax2   = [testanalysis.bifurcation.branchorder.branchorder];
    testdatay2   = [testanalysis.bifurcation.branchorder.taperrate.mean];
    testdatastd2 = [testanalysis.bifurcation.branchorder.taperrate.std];
    errorbar(testdatax2,testdatay2,testdatastd2/2,'-sk','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
    testdatax3   = [testanalysis.termination.branchorder.branchorder];
    testdatay3   = [testanalysis.termination.branchorder.taperrate.mean];
    testdatastd3 = [testanalysis.termination.branchorder.taperrate.std];
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
    controldatax1   = [controlanalysis.branchorder.branchorder];
    controldatay1   = [controlanalysis.branchorder.taperratio.mean];
    controldatastd1 = [controlanalysis.branchorder.taperratio.std];
    %errorbar(controldatax1,controldatay1,controldatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10);   
    %plot(controldatax1,controldatay1,'-ob','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',bluemarkersize);   
    hold on;
    controldatax2   = [controlanalysis.bifurcation.branchorder.branchorder];
    controldatay2   = [controlanalysis.bifurcation.branchorder.taperratio.mean];
    controldatastd2 = [controlanalysis.bifurcation.branchorder.taperratio.std];
    errorbar(controldatax2,controldatay2,controldatastd2/2,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
    controldatax3   = [controlanalysis.termination.branchorder.branchorder];
    controldatay3   = [controlanalysis.termination.branchorder.taperratio.mean];
    controldatastd3 = [controlanalysis.termination.branchorder.taperratio.std];
    errorbar(controldatax3,controldatay3,controldatastd3/2,'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
    
    testdatax1   = [testanalysis.branchorder.branchorder];
    testdatay1   = [testanalysis.branchorder.taperratio.mean];
    testdatastd1 = [testanalysis.branchorder.taperratio.std];
    %errorbar(testdatax1,testdatay1,testdatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10);   
    %plot(testdatax1,testdatay1,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','c','MarkerSize',cyanmarkersize);   
    hold on;
    testdatax2   = [testanalysis.bifurcation.branchorder.branchorder];
    testdatay2   = [testanalysis.bifurcation.branchorder.taperratio.mean];
    testdatastd2 = [testanalysis.bifurcation.branchorder.taperratio.std];
    errorbar(testdatax2,testdatay2,testdatastd2/2,'-sk','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
    testdatax3   = [testanalysis.termination.branchorder.branchorder];
    testdatay3   = [testanalysis.termination.branchorder.taperratio.mean];
    testdatastd3 = [testanalysis.termination.branchorder.taperratio.std];
    errorbar(testdatax3,testdatay3,testdatastd3/2,'-dk','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','m','MarkerSize',magentamarkersize);
    ylabel('Taper Ratio','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Branch Order','FontSize',labelfontsize,'FontWeight','b');
    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);
    %     xlimits=xlim;
    %     xtick = get(gca,'xtick');
    %     set(gca,'xticklabel', []);
    set(gca,'FontSize',axesfontsize);hold off;


    subplot(3,2,2); box on; 
    controldatax1   = [controlanalysis.branchorder.branchorder];
    controldatay1   = [controlanalysis.branchorder.proximaldiameter.mean];
    controldatastd1 = [controlanalysis.branchorder.proximaldiameter.std];
    %errorbar(controldatax1,controldatay1,controldatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10);   
    %plot(controldatax1,controldatay1,'-ob','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',bluemarkersize);   
    hold on;
    controldatax2   = [controlanalysis.bifurcation.branchorder.branchorder];
    controldatay2   = [controlanalysis.bifurcation.branchorder.proximaldiameter.mean];
    controldatastd2 = [controlanalysis.bifurcation.branchorder.proximaldiameter.std];
    errorbar(controldatax2,controldatay2,controldatastd2/2,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
    controldatax3   = [controlanalysis.termination.branchorder.branchorder];
    controldatay3   = [controlanalysis.termination.branchorder.proximaldiameter.mean];
    controldatastd3 = [controlanalysis.termination.branchorder.proximaldiameter.std];
    errorbar(controldatax3,controldatay3,controldatastd3/2,'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
    
    testdatax1   = [testanalysis.branchorder.branchorder];
    testdatay1   = [testanalysis.branchorder.proximaldiameter.mean];
    testdatastd1 = [testanalysis.branchorder.proximaldiameter.std];
    %errorbar(testdatax1,testdatay1,testdatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10);   
    %plot(testdatax1,testdatay1,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','c','MarkerSize',cyanmarkersize);   
    hold on;
    testdatax2   = [testanalysis.bifurcation.branchorder.branchorder];
    testdatay2   = [testanalysis.bifurcation.branchorder.proximaldiameter.mean];
    testdatastd2 = [testanalysis.bifurcation.branchorder.proximaldiameter.std];
    errorbar(testdatax2,testdatay2,testdatastd2/2,'-sk','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
    testdatax3   = [testanalysis.termination.branchorder.branchorder];
    testdatay3   = [testanalysis.termination.branchorder.proximaldiameter.mean];
    testdatastd3 = [testanalysis.termination.branchorder.proximaldiameter.std];
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
    controldatax1   = [controlanalysis.branchorder.branchorder];
    controldatay1   = [controlanalysis.branchorder.cylindricaldiameter.mean];
    controldatastd1 = [controlanalysis.branchorder.cylindricaldiameter.std];
    %errorbar(controldatax1,controldatay1,controldatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10);   
    %plot(controldatax1,controldatay1,'-ob','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',bluemarkersize);   
    hold on;
    controldatax2   = [controlanalysis.bifurcation.branchorder.branchorder];
    controldatay2   = [controlanalysis.bifurcation.branchorder.cylindricaldiameter.mean];
    controldatastd2 = [controlanalysis.bifurcation.branchorder.cylindricaldiameter.std];
    errorbar(controldatax2,controldatay2,controldatastd2/2,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
    controldatax3   = [controlanalysis.termination.branchorder.branchorder];
    controldatay3   = [controlanalysis.termination.branchorder.cylindricaldiameter.mean];
    controldatastd3 = [controlanalysis.termination.branchorder.cylindricaldiameter.std];
    errorbar(controldatax3,controldatay3,controldatastd3/2,'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
    
    testdatax1   = [testanalysis.branchorder.branchorder];
    testdatay1   = [testanalysis.branchorder.cylindricaldiameter.mean];
    testdatastd1 = [testanalysis.branchorder.cylindricaldiameter.std];
    %errorbar(testdatax1,testdatay1,testdatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10);   
    %plot(testdatax1,testdatay1,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','c','MarkerSize',cyanmarkersize);   
    hold on;
    testdatax2   = [testanalysis.bifurcation.branchorder.branchorder];
    testdatay2   = [testanalysis.bifurcation.branchorder.cylindricaldiameter.mean];
    testdatastd2 = [testanalysis.bifurcation.branchorder.cylindricaldiameter.std];
    errorbar(testdatax2,testdatay2,testdatastd2/2,'-sk','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
    testdatax3   = [testanalysis.termination.branchorder.branchorder];
    testdatay3   = [testanalysis.termination.branchorder.cylindricaldiameter.mean];
    testdatastd3 = [testanalysis.termination.branchorder.cylindricaldiameter.std];
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
    controldatax1   = [controlanalysis.branchorder.branchorder];
    controldatay1   = [controlanalysis.branchorder.distaldiameter.mean];
    controldatastd1 = [controlanalysis.branchorder.distaldiameter.std];
    %errorbar(controldatax1,controldatay1,controldatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10);   
    %plot(controldatax1,controldatay1,'-ob','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',bluemarkersize);   
    hold on;
    controldatax2   = [controlanalysis.bifurcation.branchorder.branchorder];
    controldatay2   = [controlanalysis.bifurcation.branchorder.distaldiameter.mean];
    controldatastd2 = [controlanalysis.bifurcation.branchorder.distaldiameter.std];
    errorbar(controldatax2,controldatay2,controldatastd2/2,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
    controldatax3   = [controlanalysis.termination.branchorder.branchorder];
    controldatay3   = [controlanalysis.termination.branchorder.distaldiameter.mean];
    controldatastd3 = [controlanalysis.termination.branchorder.distaldiameter.std];
    errorbar(controldatax3,controldatay3,controldatastd3/2,'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
    
    testdatax1   = [testanalysis.branchorder.branchorder];
    testdatay1   = [testanalysis.branchorder.distaldiameter.mean];
    testdatastd1 = [testanalysis.branchorder.distaldiameter.std];
    %errorbar(testdatax1,testdatay1,testdatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10);   
    %plot(testdatax1,testdatay1,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','c','MarkerSize',cyanmarkersize);   
    hold on;
    testdatax2   = [testanalysis.bifurcation.branchorder.branchorder];
    testdatay2   = [testanalysis.bifurcation.branchorder.distaldiameter.mean];
    testdatastd2 = [testanalysis.bifurcation.branchorder.distaldiameter.std];
    errorbar(testdatax2,testdatay2,testdatastd2/2,'-sk','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
    testdatax3   = [testanalysis.termination.branchorder.branchorder];
    testdatay3   = [testanalysis.termination.branchorder.distaldiameter.mean];
    testdatastd3 = [testanalysis.termination.branchorder.distaldiameter.std];
    errorbar(testdatax3,testdatay3,testdatastd3/2,'-dk','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','m','MarkerSize',magentamarkersize);
    ylabel('Distal Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Branch Order','FontSize',labelfontsize,'FontWeight','b');
    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);
    %     xlimits=xlim;
    %     xtick = get(gca,'xtick');
    %     set(gca,'xticklabel', []);
    set(gca,'FontSize',axesfontsize);hold off;



    subplotspace('horizontal',-5);
    subplotspace('vertical',-15);

    %[ax,h1]=suplabel('Branch Order');
    [ax,h3]=suplabel('Morphometrics versus Branch Order'  ,'t');
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

    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'101_Morph_v_Branch_Order');
    print('-djpeg',filename);
    %saveas(gcf,filename,'fig');

end
 