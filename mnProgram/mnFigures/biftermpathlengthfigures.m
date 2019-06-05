function biftermpathlengthfigures(controlanalysis,testanalysis)
% Bif/term path length figures

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
    controldatax1   = [controlanalysis.pathlength.pathlength];
    controldatay1   = [controlanalysis.pathlength.numbersegments.mean];
    controldatastd1 = [controlanalysis.pathlength.numbersegments.std];
    %errorbar(controldatax1,controldatay1,controldatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10); 
    plot(controldatax1,controldatay1,'-ob','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',indbluemarkersize);
    hold on;   
    controldatax2   = [controlanalysis.bifurcation.pathlength.pathlength];
    controldatay2   = [controlanalysis.bifurcation.pathlength.numbersegments.mean];
    controldatastd2 = [controlanalysis.bifurcation.pathlength.numbersegments.std];
    errorbar(controldatax2,controldatay2,controldatastd2/2,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);  
    controldatax3   = [controlanalysis.termination.pathlength.pathlength];
    controldatay3   = [controlanalysis.termination.pathlength.numbersegments.mean];
    controldatastd3 = [controlanalysis.termination.pathlength.numbersegments.std];
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
    controldatax1   = [controlanalysis.pathlength.pathlength];
    controldatay1   = [controlanalysis.pathlength.diameter.mean];
    controldatastd1 = [controlanalysis.pathlength.diameter.std];
    %errorbar(controldatax1,controldatay1,controldatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10); 
    plot(controldatax1,controldatay1,'-ob','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',indbluemarkersize);
    hold on;
    controldatax2   = [controlanalysis.bifurcation.pathlength.pathlength];
    controldatay2   = [controlanalysis.bifurcation.pathlength.diameter.mean];
    controldatastd2 = [controlanalysis.bifurcation.pathlength.diameter.std];
    errorbar(controldatax2,controldatay2,controldatastd2/2,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
    controldatax3   = [controlanalysis.termination.pathlength.pathlength];
    controldatay3   = [controlanalysis.termination.pathlength.diameter.mean];
    controldatastd3 = [controlanalysis.termination.pathlength.diameter.std];
    errorbar(controldatax3,controldatay3,controldatastd3/2,'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
    ylabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);
    xlimits=xlim;
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);
    set(gca,'FontSize',axesfontsize);hold off;


    subplot(3,2,5); box on; 
    controldatax1   = [controlanalysis.pathlength.pathlength];
    controldatay1   = [controlanalysis.pathlength.taperrate.mean];
    controldatastd1 = [controlanalysis.pathlength.taperrate.std];
    %errorbar(controldatax1,controldatay1,controldatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10); 
    plot(controldatax1,controldatay1,'-ob','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',indbluemarkersize);
    hold on;
    controldatax2   = [controlanalysis.bifurcation.pathlength.pathlength];
    controldatay2   = [controlanalysis.bifurcation.pathlength.taperrate.mean];
    controldatastd2 = [controlanalysis.bifurcation.pathlength.taperrate.std];
    errorbar(controldatax2,controldatay2,controldatastd2/2,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
    controldatax3   = [controlanalysis.termination.pathlength.pathlength];
    controldatay3   = [controlanalysis.termination.pathlength.taperrate.mean];
    controldatastd3 = [controlanalysis.termination.pathlength.taperrate.std];
    errorbar(controldatax3,controldatay3,controldatastd3/2,'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
    ylabel('Taper Rate','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);
    %     xlimits=xlim;
    %     xtick = get(gca,'xtick');
    %     set(gca,'xticklabel', []);
    set(gca,'FontSize',axesfontsize);hold off;


    subplot(3,2,2); box on; 
    controldatax1   = [controlanalysis.pathlength.pathlength];
    controldatay1   = [controlanalysis.pathlength.length.mean];
    controldatastd1 = [controlanalysis.pathlength.length.std];
    %errorbar(controldatax1,controldatay1,controldatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10); 
    plot(controldatax1,controldatay1,'-ob','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',indbluemarkersize);
    hold on;
    controldatax2   = [controlanalysis.bifurcation.pathlength.pathlength];
    controldatay2   = [controlanalysis.bifurcation.pathlength.length.mean];
    controldatastd2 = [controlanalysis.bifurcation.pathlength.length.std];
    errorbar(controldatax2,controldatay2,controldatastd2/2,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
    controldatax3   = [controlanalysis.termination.pathlength.pathlength];
    controldatay3   = [controlanalysis.termination.pathlength.length.mean];
    controldatastd3 = [controlanalysis.termination.pathlength.length.std];
    errorbar(controldatax3,controldatay3,controldatastd3/2,'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
    ylabel('Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);
    xlimits=xlim;
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);
    set(gca,'FontSize',axesfontsize);hold off;


    subplot(3,2,4); box on;    
    controldatax1   = [controlanalysis.pathlength.pathlength];
    controldatay1   = [controlanalysis.pathlength.surfacearea.mean];
    controldatastd1 = [controlanalysis.pathlength.surfacearea.std];
    %errorbar(controldatax1,controldatay1,controldatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10); 
    plot(controldatax1,controldatay1,'-ob','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',indbluemarkersize);
    hold on;
    controldatax2   = [controlanalysis.bifurcation.pathlength.pathlength];
    controldatay2   = [controlanalysis.bifurcation.pathlength.surfacearea.mean];
    controldatastd2 = [controlanalysis.bifurcation.pathlength.surfacearea.std];
    errorbar(controldatax2,controldatay2,controldatastd2/2,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
    controldatax3   = [controlanalysis.termination.pathlength.pathlength];
    controldatay3   = [controlanalysis.termination.pathlength.surfacearea.mean];
    controldatastd3 = [controlanalysis.termination.pathlength.surfacearea.std];
    errorbar(controldatax3,controldatay3,controldatastd3/2,'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
    ylabel('Surface Area (\mum^2)','FontSize',labelfontsize,'FontWeight','b');
    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);
    xlimits=xlim;
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);
    set(gca,'FontSize',axesfontsize);hold off;


    subplot(3,2,6); box on; 
    controldatax1   = [controlanalysis.pathlength.pathlength];
    controldatay1   = [controlanalysis.pathlength.volume.mean];
    controldatastd1 = [controlanalysis.pathlength.volume.std];
    %errorbar(controldatax1,controldatay1,controldatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10); 
    plot(controldatax1,controldatay1,'-ob','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',indbluemarkersize);
    hold on;
    controldatax2   = [controlanalysis.bifurcation.pathlength.pathlength];
    controldatay2   = [controlanalysis.bifurcation.pathlength.volume.mean];
    controldatastd2 = [controlanalysis.bifurcation.pathlength.volume.std];
    errorbar(controldatax2,controldatay2,controldatastd2/2,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
    controldatax3   = [controlanalysis.termination.pathlength.pathlength];
    controldatay3   = [controlanalysis.termination.pathlength.volume.mean];
    controldatastd3 = [controlanalysis.termination.pathlength.volume.std];
    errorbar(controldatax3,controldatay3,controldatastd3/2,'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
    ylabel('Volume (\mum^3)','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);
    %     xlimits=xlim;
    %     xtick = get(gca,'xtick');
    %     set(gca,'xticklabel', []);
    set(gca,'FontSize',axesfontsize);hold off;




    subplotspace('horizontal',-5);
    subplotspace('vertical',-15);
    
    [ax,h3]=suplabel('Morphometrics versus Path Length from Soma'  ,'t');
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

    filename = sprintf('%s_%s',controlanalysis.inputfilename,'106_Morph_v_Path_Length');
    print('-djpeg',filename);
    %saveas(gcf,filename,'fig');

end


if nargin == 2

    subplot(3,2,1); box on; 
    controldatax1   = [controlanalysis.pathlength.pathlength];
    controldatay1   = [controlanalysis.pathlength.numbersegments.mean];
    controldatastd1 = [controlanalysis.pathlength.numbersegments.std];
    %errorbar(controldatax1,controldatay1,controldatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10); 
    %plot(controldatax1,controldatay1,'-ob','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',bluemarkersize);
    hold on;   
    controldatax2   = [controlanalysis.bifurcation.pathlength.pathlength];
    controldatay2   = [controlanalysis.bifurcation.pathlength.numbersegments.mean];
    controldatastd2 = [controlanalysis.bifurcation.pathlength.numbersegments.std];
    errorbar(controldatax2,controldatay2,controldatastd2/2,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);  
    controldatax3   = [controlanalysis.termination.pathlength.pathlength];
    controldatay3   = [controlanalysis.termination.pathlength.numbersegments.mean];
    controldatastd3 = [controlanalysis.termination.pathlength.numbersegments.std];
    errorbar(controldatax3,controldatay3,controldatastd3/2,'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);      
    testdatax1   = [testanalysis.pathlength.pathlength];
    testdatay1   = [testanalysis.pathlength.numbersegments.mean];
    testdatastd1 = [testanalysis.pathlength.numbersegments.std];
    %errorbar(testdatax1,testdatay1,testdatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10); 
    %plot(testdatax1,testdatay1,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','c','MarkerSize',cyanmarkersize);
    hold on;   
    testdatax2   = [testanalysis.bifurcation.pathlength.pathlength];
    testdatay2   = [testanalysis.bifurcation.pathlength.numbersegments.mean];
    testdatastd2 = [testanalysis.bifurcation.pathlength.numbersegments.std];
    errorbar(testdatax2,testdatay2,testdatastd2/2,'-sk','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',yellowmarkersize);  
    testdatax3   = [testanalysis.termination.pathlength.pathlength];
    testdatay3   = [testanalysis.termination.pathlength.numbersegments.mean];
    testdatastd3 = [testanalysis.termination.pathlength.numbersegments.std];
    errorbar(testdatax3,testdatay3,testdatastd3/2,'-dk','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','m','MarkerSize',magentamarkersize);
    ylabel('Number Segments','FontSize',labelfontsize,'FontWeight','b');
    legendhandle = gca;    
    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);
    xlimits=xlim;
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);
    set(gca,'FontSize',axesfontsize); hold off;


    subplot(3,2,3); box on; 
    controldatax1   = [controlanalysis.pathlength.pathlength];
    controldatay1   = [controlanalysis.pathlength.diameter.mean];
    controldatastd1 = [controlanalysis.pathlength.diameter.std];
    %errorbar(controldatax1,controldatay1,controldatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10); 
    %plot(controldatax1,controldatay1,'-ob','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',bluemarkersize);
    hold on;
    controldatax2   = [controlanalysis.bifurcation.pathlength.pathlength];
    controldatay2   = [controlanalysis.bifurcation.pathlength.diameter.mean];
    controldatastd2 = [controlanalysis.bifurcation.pathlength.diameter.std];
    errorbar(controldatax2,controldatay2,controldatastd2/2,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
    controldatax3   = [controlanalysis.termination.pathlength.pathlength];
    controldatay3   = [controlanalysis.termination.pathlength.diameter.mean];
    controldatastd3 = [controlanalysis.termination.pathlength.diameter.std];
    errorbar(controldatax3,controldatay3,controldatastd3/2,'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
    testdatax1   = [testanalysis.pathlength.pathlength];
    testdatay1   = [testanalysis.pathlength.diameter.mean];
    testdatastd1 = [testanalysis.pathlength.diameter.std];
    %errorbar(testdatax1,testdatay1,testdatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10); 
    %plot(testdatax1,testdatay1,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','c','MarkerSize',cyanmarkersize);
    hold on;   
    testdatax2   = [testanalysis.bifurcation.pathlength.pathlength];
    testdatay2   = [testanalysis.bifurcation.pathlength.diameter.mean];
    testdatastd2 = [testanalysis.bifurcation.pathlength.diameter.std];
    errorbar(testdatax2,testdatay2,testdatastd2/2,'-sk','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',yellowmarkersize);  
    testdatax3   = [testanalysis.termination.pathlength.pathlength];
    testdatay3   = [testanalysis.termination.pathlength.diameter.mean];
    testdatastd3 = [testanalysis.termination.pathlength.diameter.std];
    errorbar(testdatax3,testdatay3,testdatastd3/2,'-dk','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','m','MarkerSize',magentamarkersize);
    ylabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);
    xlimits=xlim;
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);
    set(gca,'FontSize',axesfontsize); hold off;


    subplot(3,2,5); box on; 
    controldatax1   = [controlanalysis.pathlength.pathlength];
    controldatay1   = [controlanalysis.pathlength.taperrate.mean];
    controldatastd1 = [controlanalysis.pathlength.taperrate.std];
    %errorbar(controldatax1,controldatay1,controldatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10); 
    %plot(controldatax1,controldatay1,'-ob','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',bluemarkersize);
    hold on;
    controldatax2   = [controlanalysis.bifurcation.pathlength.pathlength];
    controldatay2   = [controlanalysis.bifurcation.pathlength.taperrate.mean];
    controldatastd2 = [controlanalysis.bifurcation.pathlength.taperrate.std];
    errorbar(controldatax2,controldatay2,controldatastd2/2,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
    controldatax3   = [controlanalysis.termination.pathlength.pathlength];
    controldatay3   = [controlanalysis.termination.pathlength.taperrate.mean];
    controldatastd3 = [controlanalysis.termination.pathlength.taperrate.std];
    errorbar(controldatax3,controldatay3,controldatastd3/2,'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
    testdatax1   = [testanalysis.pathlength.pathlength];
    testdatay1   = [testanalysis.pathlength.taperrate.mean];
    testdatastd1 = [testanalysis.pathlength.taperrate.std];
    %errorbar(testdatax1,testdatay1,testdatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10); 
    %plot(testdatax1,testdatay1,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','c','MarkerSize',cyanmarkersize);
    hold on;   
    testdatax2   = [testanalysis.bifurcation.pathlength.pathlength];
    testdatay2   = [testanalysis.bifurcation.pathlength.taperrate.mean];
    testdatastd2 = [testanalysis.bifurcation.pathlength.taperrate.std];
    errorbar(testdatax2,testdatay2,testdatastd2/2,'-sk','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',yellowmarkersize);  
    testdatax3   = [testanalysis.termination.pathlength.pathlength];
    testdatay3   = [testanalysis.termination.pathlength.taperrate.mean];
    testdatastd3 = [testanalysis.termination.pathlength.taperrate.std];
    errorbar(testdatax3,testdatay3,testdatastd3/2,'-dk','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','m','MarkerSize',magentamarkersize);
    ylabel('Taper Rate','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);
    %     xlimits=xlim;
    %     xtick = get(gca,'xtick');
    %     set(gca,'xticklabel', []);
    set(gca,'FontSize',axesfontsize); hold off;


    subplot(3,2,2); box on; 
    controldatax1   = [controlanalysis.pathlength.pathlength];
    controldatay1   = [controlanalysis.pathlength.length.mean];
    controldatastd1 = [controlanalysis.pathlength.length.std];
    %errorbar(controldatax1,controldatay1,controldatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10); 
    %plot(controldatax1,controldatay1,'-ob','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',bluemarkersize);
    hold on;
    controldatax2   = [controlanalysis.bifurcation.pathlength.pathlength];
    controldatay2   = [controlanalysis.bifurcation.pathlength.length.mean];
    controldatastd2 = [controlanalysis.bifurcation.pathlength.length.std];
    errorbar(controldatax2,controldatay2,controldatastd2/2,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
    controldatax3   = [controlanalysis.termination.pathlength.pathlength];
    controldatay3   = [controlanalysis.termination.pathlength.length.mean];
    controldatastd3 = [controlanalysis.termination.pathlength.length.std];
    errorbar(controldatax3,controldatay3,controldatastd3/2,'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
    testdatax1   = [testanalysis.pathlength.pathlength];
    testdatay1   = [testanalysis.pathlength.length.mean];
    testdatastd1 = [testanalysis.pathlength.length.std];
    %errorbar(testdatax1,testdatay1,testdatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10); 
    %plot(testdatax1,testdatay1,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','c','MarkerSize',cyanmarkersize);
    hold on;   
    testdatax2   = [testanalysis.bifurcation.pathlength.pathlength];
    testdatay2   = [testanalysis.bifurcation.pathlength.length.mean];
    testdatastd2 = [testanalysis.bifurcation.pathlength.length.std];
    errorbar(testdatax2,testdatay2,testdatastd2/2,'-sk','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',yellowmarkersize);  
    testdatax3   = [testanalysis.termination.pathlength.pathlength];
    testdatay3   = [testanalysis.termination.pathlength.length.mean];
    testdatastd3 = [testanalysis.termination.pathlength.length.std];
    errorbar(testdatax3,testdatay3,testdatastd3/2,'-dk','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','m','MarkerSize',magentamarkersize);
    ylabel('Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);
    xlimits=xlim;
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);
    set(gca,'FontSize',axesfontsize); hold off;


    subplot(3,2,4); box on;    
    controldatax1   = [controlanalysis.pathlength.pathlength];
    controldatay1   = [controlanalysis.pathlength.surfacearea.mean];
    controldatastd1 = [controlanalysis.pathlength.surfacearea.std];
    %errorbar(controldatax1,controldatay1,controldatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10); 
    %plot(controldatax1,controldatay1,'-ob','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',bluemarkersize);
    hold on;
    controldatax2   = [controlanalysis.bifurcation.pathlength.pathlength];
    controldatay2   = [controlanalysis.bifurcation.pathlength.surfacearea.mean];
    controldatastd2 = [controlanalysis.bifurcation.pathlength.surfacearea.std];
    errorbar(controldatax2,controldatay2,controldatastd2/2,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
    controldatax3   = [controlanalysis.termination.pathlength.pathlength];
    controldatay3   = [controlanalysis.termination.pathlength.surfacearea.mean];
    controldatastd3 = [controlanalysis.termination.pathlength.surfacearea.std];
    errorbar(controldatax3,controldatay3,controldatastd3/2,'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
    testdatax1   = [testanalysis.pathlength.pathlength];
    testdatay1   = [testanalysis.pathlength.surfacearea.mean];
    testdatastd1 = [testanalysis.pathlength.surfacearea.std];
    %errorbar(testdatax1,testdatay1,testdatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10); 
    %plot(testdatax1,testdatay1,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','c','MarkerSize',cyanmarkersize);
    hold on;   
    testdatax2   = [testanalysis.bifurcation.pathlength.pathlength];
    testdatay2   = [testanalysis.bifurcation.pathlength.surfacearea.mean];
    testdatastd2 = [testanalysis.bifurcation.pathlength.surfacearea.std];
    errorbar(testdatax2,testdatay2,testdatastd2/2,'-sk','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',yellowmarkersize);  
    testdatax3   = [testanalysis.termination.pathlength.pathlength];
    testdatay3   = [testanalysis.termination.pathlength.surfacearea.mean];
    testdatastd3 = [testanalysis.termination.pathlength.surfacearea.std];
    errorbar(testdatax3,testdatay3,testdatastd3/2,'-dk','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','m','MarkerSize',magentamarkersize);
    ylabel('Surface Area (\mum^2)','FontSize',labelfontsize,'FontWeight','b');
    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);
    xlimits=xlim;
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);
    set(gca,'FontSize',axesfontsize); hold off;


    subplot(3,2,6); box on; 
    controldatax1   = [controlanalysis.pathlength.pathlength];
    controldatay1   = [controlanalysis.pathlength.volume.mean];
    controldatastd1 = [controlanalysis.pathlength.volume.std];
    %errorbar(controldatax1,controldatay1,controldatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10); 
    %plot(controldatax1,controldatay1,'-ob','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',bluemarkersize);
    hold on;
    controldatax2   = [controlanalysis.bifurcation.pathlength.pathlength];
    controldatay2   = [controlanalysis.bifurcation.pathlength.volume.mean];
    controldatastd2 = [controlanalysis.bifurcation.pathlength.volume.std];
    errorbar(controldatax2,controldatay2,controldatastd2/2,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
    controldatax3   = [controlanalysis.termination.pathlength.pathlength];
    controldatay3   = [controlanalysis.termination.pathlength.volume.mean];
    controldatastd3 = [controlanalysis.termination.pathlength.volume.std];
    errorbar(controldatax3,controldatay3,controldatastd3/2,'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
    testdatax1   = [testanalysis.pathlength.pathlength];
    testdatay1   = [testanalysis.pathlength.volume.mean];
    testdatastd1 = [testanalysis.pathlength.volume.std];
    %errorbar(testdatax1,testdatay1,testdatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10); 
    %plot(testdatax1,testdatay1,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','c','MarkerSize',cyanmarkersize);
    hold on;   
    testdatax2   = [testanalysis.bifurcation.pathlength.pathlength];
    testdatay2   = [testanalysis.bifurcation.pathlength.volume.mean];
    testdatastd2 = [testanalysis.bifurcation.pathlength.volume.std];
    errorbar(testdatax2,testdatay2,testdatastd2/2,'-sk','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',yellowmarkersize);  
    testdatax3   = [testanalysis.termination.pathlength.pathlength];
    testdatay3   = [testanalysis.termination.pathlength.volume.mean];
    testdatastd3 = [testanalysis.termination.pathlength.volume.std];
    errorbar(testdatax3,testdatay3,testdatastd3/2,'-dk','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','m','MarkerSize',magentamarkersize);
    ylabel('Volume (\mum^3)','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);
    %     xlimits=xlim;
    %     xtick = get(gca,'xtick');
    %     set(gca,'xticklabel', []);
    set(gca,'FontSize',axesfontsize); hold off;


    subplotspace('horizontal',-5);
    subplotspace('vertical',-15);

    [ax,h3]=suplabel('Morphometrics versus Path Length from Soma'  ,'t');
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

    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'106_Morph_v_Path_Length');
    
    print('-djpeg',filename);
    %saveas(gcf,filename,'fig');

end
