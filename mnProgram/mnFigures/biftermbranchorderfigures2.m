function biftermbranchorderfigures2(controlanalysis,testanalysis)
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
    controldatay1   = [controlanalysis.branchorder.length.mean];
    controldatastd1 = [controlanalysis.branchorder.length.std];
    %errorbar(controldatax1,controldatay1,controldatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10);   
    plot(controldatax1,controldatay1,'-ob','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',indbluemarkersize);   
    hold on;   
    controldatax2   = [controlanalysis.bifurcation.branchorder.branchorder];
    controldatay2   = [controlanalysis.bifurcation.branchorder.length.mean];
    controldatastd2 = [controlanalysis.bifurcation.branchorder.length.std];
    errorbar(controldatax2,controldatay2,controldatastd2/2,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);  
    controldatax3   = [controlanalysis.termination.branchorder.branchorder];
    controldatay3   = [controlanalysis.termination.branchorder.length.mean];
    controldatastd3 = [controlanalysis.termination.branchorder.length.std];
    errorbar(controldatax3,controldatay3,controldatastd3/2,'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);   
    ylabel('Mean Length (\mum)','FontSize',labelfontsize,'FontWeight','b'); 
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
    controldatay1   = [controlanalysis.branchorder.surfacearea.mean];
    controldatastd1 = [controlanalysis.branchorder.surfacearea.std];
    %errorbar(controldatax1,controldatay1,controldatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10);   
    plot(controldatax1,controldatay1,'-ob','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',indbluemarkersize);   
    hold on;
    controldatax2   = [controlanalysis.bifurcation.branchorder.branchorder];
    controldatay2   = [controlanalysis.bifurcation.branchorder.surfacearea.mean];
    controldatastd2 = [controlanalysis.bifurcation.branchorder.surfacearea.std];
    errorbar(controldatax2,controldatay2,controldatastd2/2,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
    controldatax3   = [controlanalysis.termination.branchorder.branchorder];
    controldatay3   = [controlanalysis.termination.branchorder.surfacearea.mean];
    controldatastd3 = [controlanalysis.termination.branchorder.surfacearea.std];
    errorbar(controldatax3,controldatay3,controldatastd3/2,'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
    ylabel('Mean Surface Area (\mum^2)','FontSize',labelfontsize,'FontWeight','b');
    
    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);
    xlimits=xlim;
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);
    set(gca,'FontSize',axesfontsize);hold off;


    subplot(3,2,5); box on; 
    controldatax1   = [controlanalysis.branchorder.branchorder];
    controldatay1   = [controlanalysis.branchorder.volume.mean];
    controldatastd1 = [controlanalysis.branchorder.volume.std];
    %errorbar(controldatax1,controldatay1,controldatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10);   
    plot(controldatax1,controldatay1,'-ob','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',indbluemarkersize);   
    hold on;
    controldatax2   = [controlanalysis.bifurcation.branchorder.branchorder];
    controldatay2   = [controlanalysis.bifurcation.branchorder.volume.mean];
    controldatastd2 = [controlanalysis.bifurcation.branchorder.volume.std];
    errorbar(controldatax2,controldatay2,controldatastd2/2,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
    controldatax3   = [controlanalysis.termination.branchorder.branchorder];
    controldatay3   = [controlanalysis.termination.branchorder.volume.mean];
    controldatastd3 = [controlanalysis.termination.branchorder.volume.std];
    errorbar(controldatax3,controldatay3,controldatastd3/2,'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
    ylabel('Mean Volume (\mum^3)','FontSize',labelfontsize,'FontWeight','b');
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
    controldatay1   = [controlanalysis.branchorder.totallength.mean];
    controldatastd1 = [controlanalysis.branchorder.totallength.std];
    %errorbar(controldatax1,controldatay1,controldatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10);   
    plot(controldatax1,controldatay1,'-ob','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',indbluemarkersize);   
    hold on;
    controldatax2   = [controlanalysis.bifurcation.branchorder.branchorder];
    controldatay2   = [controlanalysis.bifurcation.branchorder.totallength.mean];
    controldatastd2 = [controlanalysis.bifurcation.branchorder.totallength.std];
    errorbar(controldatax2,controldatay2,controldatastd2/2,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
    controldatax3   = [controlanalysis.termination.branchorder.branchorder];
    controldatay3   = [controlanalysis.termination.branchorder.totallength.mean];
    controldatastd3 = [controlanalysis.termination.branchorder.totallength.std];
    errorbar(controldatax3,controldatay3,controldatastd3/2,'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
    ylabel('Total Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);
    xlimits=xlim;
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);
    set(gca,'FontSize',axesfontsize);hold off;


    subplot(3,2,4); box on;    
    controldatax1   = [controlanalysis.branchorder.branchorder];
    controldatay1   = [controlanalysis.branchorder.totalsurfacearea.mean];
    controldatastd1 = [controlanalysis.branchorder.totalsurfacearea.std];
    %errorbar(controldatax1,controldatay1,controldatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10);   
    plot(controldatax1,controldatay1,'-ob','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',indbluemarkersize);   
    hold on;
    controldatax2   = [controlanalysis.bifurcation.branchorder.branchorder];
    controldatay2   = [controlanalysis.bifurcation.branchorder.totalsurfacearea.mean];
    controldatastd2 = [controlanalysis.bifurcation.branchorder.totalsurfacearea.std];
    errorbar(controldatax2,controldatay2,controldatastd2/2,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
    controldatax3   = [controlanalysis.termination.branchorder.branchorder];
    controldatay3   = [controlanalysis.termination.branchorder.totalsurfacearea.mean];
    controldatastd3 = [controlanalysis.termination.branchorder.totalsurfacearea.std];
    errorbar(controldatax3,controldatay3,controldatastd3/2,'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
    ylabel('Total Surface Area (\mum^2)','FontSize',labelfontsize,'FontWeight','b');
    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);
    xlimits=xlim;
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);
    set(gca,'FontSize',axesfontsize);hold off;


    subplot(3,2,6); box on; 
    
    controldatax1   = [controlanalysis.branchorder.branchorder];
    controldatay1   = [controlanalysis.branchorder.totalvolume.mean];
    controldatastd1 = [controlanalysis.branchorder.totalvolume.std];
    %errorbar(controldatax1,controldatay1,controldatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10);   
    plot(controldatax1,controldatay1,'-ob','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',indbluemarkersize);   
    hold on;
    controldatax2   = [controlanalysis.bifurcation.branchorder.branchorder];
    controldatay2   = [controlanalysis.bifurcation.branchorder.totalvolume.mean];
    controldatastd2 = [controlanalysis.bifurcation.branchorder.totalvolume.std];
    errorbar(controldatax2,controldatay2,controldatastd2/2,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
    controldatax3   = [controlanalysis.termination.branchorder.branchorder];
    controldatay3   = [controlanalysis.termination.branchorder.totalvolume.mean];
    controldatastd3 = [controlanalysis.termination.branchorder.totalvolume.std];
    errorbar(controldatax3,controldatay3,controldatastd3/2,'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
    ylabel('Total Volume (\mum^3)','FontSize',labelfontsize,'FontWeight','b');
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

    [ax,h3]=suplabel('Morphometrics versus Branch Order'  ,'t');
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

    filename = sprintf('%s_%s',controlanalysis.inputfilename,'102_Morph_v_Branch_Order');
    print('-djpeg',filename);
    %saveas(gcf,filename,'fig');

end


if nargin == 2

    subplot(3,2,1); box on; 
    controldatax1   = [controlanalysis.branchorder.branchorder];
    controldatay1   = [controlanalysis.branchorder.length.mean];
    controldatastd1 = [controlanalysis.branchorder.length.std];
    %errorbar(controldatax1,controldatay1,controldatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10);   
    %plot(controldatax1,controldatay1,'-ob','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',bluemarkersize);   
    hold on;   
    controldatax2   = [controlanalysis.bifurcation.branchorder.branchorder];
    controldatay2   = [controlanalysis.bifurcation.branchorder.length.mean];
    controldatastd2 = [controlanalysis.bifurcation.branchorder.length.std];
    errorbar(controldatax2,controldatay2,controldatastd2/2,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);  
    controldatax3   = [controlanalysis.termination.branchorder.branchorder];
    controldatay3   = [controlanalysis.termination.branchorder.length.mean];
    controldatastd3 = [controlanalysis.termination.branchorder.length.std];
    errorbar(controldatax3,controldatay3,controldatastd3/2,'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize); 
    
    testdatax1   = [testanalysis.branchorder.branchorder];
    testdatay1   = [testanalysis.branchorder.length.mean];
    testdatastd1 = [testanalysis.branchorder.length.std];
    %errorbar(testdatax1,testdatay1,testdatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10);   
    %plot(testdatax1,testdatay1,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','c','MarkerSize',cyanmarkersize);   
    hold on;   
    testdatax2   = [testanalysis.bifurcation.branchorder.branchorder];
    testdatay2   = [testanalysis.bifurcation.branchorder.length.mean];
    testdatastd2 = [testanalysis.bifurcation.branchorder.length.std];
    errorbar(testdatax2,testdatay2,testdatastd2/2,'-sk','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',yellowmarkersize);  
    testdatax3   = [testanalysis.termination.branchorder.branchorder];
    testdatay3   = [testanalysis.termination.branchorder.length.mean];
    testdatastd3 = [testanalysis.termination.branchorder.length.std];
    errorbar(testdatax3,testdatay3,testdatastd3/2,'-dk','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','m','MarkerSize',magentamarkersize); 
    ylabel('Mean Length (\mum)','FontSize',labelfontsize,'FontWeight','b'); 
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
    controldatay1   = [controlanalysis.branchorder.surfacearea.mean];
    controldatastd1 = [controlanalysis.branchorder.surfacearea.std];
    %errorbar(controldatax1,controldatay1,controldatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10);   
    %plot(controldatax1,controldatay1,'-ob','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',bluemarkersize);   
    hold on;
    controldatax2   = [controlanalysis.bifurcation.branchorder.branchorder];
    controldatay2   = [controlanalysis.bifurcation.branchorder.surfacearea.mean];
    controldatastd2 = [controlanalysis.bifurcation.branchorder.surfacearea.std];
    errorbar(controldatax2,controldatay2,controldatastd2/2,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
    controldatax3   = [controlanalysis.termination.branchorder.branchorder];
    controldatay3   = [controlanalysis.termination.branchorder.surfacearea.mean];
    controldatastd3 = [controlanalysis.termination.branchorder.surfacearea.std];
    errorbar(controldatax3,controldatay3,controldatastd3/2,'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
    testdatax1   = [testanalysis.branchorder.branchorder];
    testdatay1   = [testanalysis.branchorder.surfacearea.mean];
    testdatastd1 = [testanalysis.branchorder.surfacearea.std];
    %errorbar(testdatax1,testdatay1,testdatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10);   
    %plot(testdatax1,testdatay1,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','c','MarkerSize',cyanmarkersize);   
    hold on;
    testdatax2   = [testanalysis.bifurcation.branchorder.branchorder];
    testdatay2   = [testanalysis.bifurcation.branchorder.surfacearea.mean];
    testdatastd2 = [testanalysis.bifurcation.branchorder.surfacearea.std];
    errorbar(testdatax2,testdatay2,testdatastd2/2,'-sk','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
    testdatax3   = [testanalysis.termination.branchorder.branchorder];
    testdatay3   = [testanalysis.termination.branchorder.surfacearea.mean];
    testdatastd3 = [testanalysis.termination.branchorder.surfacearea.std];
    errorbar(testdatax3,testdatay3,testdatastd3/2,'-dk','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','m','MarkerSize',magentamarkersize);
    ylabel('Mean Surface Area (\mum^2)','FontSize',labelfontsize,'FontWeight','b');
    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);
    xlimits=xlim;
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);
    set(gca,'FontSize',axesfontsize);hold off;


    subplot(3,2,5); box on; 
    controldatax1   = [controlanalysis.branchorder.branchorder];
    controldatay1   = [controlanalysis.branchorder.volume.mean];
    controldatastd1 = [controlanalysis.branchorder.volume.std];
    %errorbar(controldatax1,controldatay1,controldatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10);   
    %plot(controldatax1,controldatay1,'-ob','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',bluemarkersize);   
    hold on;
    controldatax2   = [controlanalysis.bifurcation.branchorder.branchorder];
    controldatay2   = [controlanalysis.bifurcation.branchorder.volume.mean];
    controldatastd2 = [controlanalysis.bifurcation.branchorder.volume.std];
    errorbar(controldatax2,controldatay2,controldatastd2/2,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
    controldatax3   = [controlanalysis.termination.branchorder.branchorder];
    controldatay3   = [controlanalysis.termination.branchorder.volume.mean];
    controldatastd3 = [controlanalysis.termination.branchorder.volume.std];
    errorbar(controldatax3,controldatay3,controldatastd3/2,'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
    
    testdatax1   = [testanalysis.branchorder.branchorder];
    testdatay1   = [testanalysis.branchorder.volume.mean];
    testdatastd1 = [testanalysis.branchorder.volume.std];
    %errorbar(testdatax1,testdatay1,testdatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10);   
    %plot(testdatax1,testdatay1,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','c','MarkerSize',cyanmarkersize);   
    hold on;
    testdatax2   = [testanalysis.bifurcation.branchorder.branchorder];
    testdatay2   = [testanalysis.bifurcation.branchorder.volume.mean];
    testdatastd2 = [testanalysis.bifurcation.branchorder.volume.std];
    errorbar(testdatax2,testdatay2,testdatastd2/2,'-sk','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
    testdatax3   = [testanalysis.termination.branchorder.branchorder];
    testdatay3   = [testanalysis.termination.branchorder.volume.mean];
    testdatastd3 = [testanalysis.termination.branchorder.volume.std];
    errorbar(testdatax3,testdatay3,testdatastd3/2,'-dk','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','m','MarkerSize',magentamarkersize);
    ylabel('Mean Volume (\mum^3)','FontSize',labelfontsize,'FontWeight','b');
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
    controldatay1   = [controlanalysis.branchorder.totallength.mean];
    controldatastd1 = [controlanalysis.branchorder.totallength.std];
    %errorbar(controldatax1,controldatay1,controldatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10);   
    %plot(controldatax1,controldatay1,'-ob','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',bluemarkersize);   
    hold on;
    controldatax2   = [controlanalysis.bifurcation.branchorder.branchorder];
    controldatay2   = [controlanalysis.bifurcation.branchorder.totallength.mean];
    controldatastd2 = [controlanalysis.bifurcation.branchorder.totallength.std];
    errorbar(controldatax2,controldatay2,controldatastd2/2,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
    controldatax3   = [controlanalysis.termination.branchorder.branchorder];
    controldatay3   = [controlanalysis.termination.branchorder.totallength.mean];
    controldatastd3 = [controlanalysis.termination.branchorder.totallength.std];
    errorbar(controldatax3,controldatay3,controldatastd3/2,'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
    
    testdatax1   = [testanalysis.branchorder.branchorder];
    testdatay1   = [testanalysis.branchorder.totallength.mean];
    testdatastd1 = [testanalysis.branchorder.totallength.std];
    %errorbar(testdatax1,testdatay1,testdatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10);   
    %plot(testdatax1,testdatay1,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','c','MarkerSize',cyanmarkersize);   
    hold on;
    testdatax2   = [testanalysis.bifurcation.branchorder.branchorder];
    testdatay2   = [testanalysis.bifurcation.branchorder.totallength.mean];
    testdatastd2 = [testanalysis.bifurcation.branchorder.totallength.std];
    errorbar(testdatax2,testdatay2,testdatastd2/2,'-sk','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
    testdatax3   = [testanalysis.termination.branchorder.branchorder];
    testdatay3   = [testanalysis.termination.branchorder.totallength.mean];
    testdatastd3 = [testanalysis.termination.branchorder.totallength.std];
    errorbar(testdatax3,testdatay3,testdatastd3/2,'-dk','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','m','MarkerSize',magentamarkersize);
    ylabel('Total Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);
    xlimits=xlim;
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);
    set(gca,'FontSize',axesfontsize);hold off;


    subplot(3,2,4); box on;    
    controldatax1   = [controlanalysis.branchorder.branchorder];
    controldatay1   = [controlanalysis.branchorder.totalsurfacearea.mean];
    controldatastd1 = [controlanalysis.branchorder.totalsurfacearea.std];
    %errorbar(controldatax1,controldatay1,controldatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10);   
    %plot(controldatax1,controldatay1,'-ob','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',bluemarkersize);   
    hold on;
    controldatax2   = [controlanalysis.bifurcation.branchorder.branchorder];
    controldatay2   = [controlanalysis.bifurcation.branchorder.totalsurfacearea.mean];
    controldatastd2 = [controlanalysis.bifurcation.branchorder.totalsurfacearea.std];
    errorbar(controldatax2,controldatay2,controldatastd2/2,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
    controldatax3   = [controlanalysis.termination.branchorder.branchorder];
    controldatay3   = [controlanalysis.termination.branchorder.totalsurfacearea.mean];
    controldatastd3 = [controlanalysis.termination.branchorder.totalsurfacearea.std];
    errorbar(controldatax3,controldatay3,controldatastd3/2,'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
    
    testdatax1   = [testanalysis.branchorder.branchorder];
    testdatay1   = [testanalysis.branchorder.totalsurfacearea.mean];
    testdatastd1 = [testanalysis.branchorder.totalsurfacearea.std];
    %errorbar(testdatax1,testdatay1,testdatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10);   
    %plot(testdatax1,testdatay1,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','c','MarkerSize',cyanmarkersize);   
    hold on;
    testdatax2   = [testanalysis.bifurcation.branchorder.branchorder];
    testdatay2   = [testanalysis.bifurcation.branchorder.totalsurfacearea.mean];
    testdatastd2 = [testanalysis.bifurcation.branchorder.totalsurfacearea.std];
    errorbar(testdatax2,testdatay2,testdatastd2/2,'-sk','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
    testdatax3   = [testanalysis.termination.branchorder.branchorder];
    testdatay3   = [testanalysis.termination.branchorder.totalsurfacearea.mean];
    testdatastd3 = [testanalysis.termination.branchorder.totalsurfacearea.std];
    errorbar(testdatax3,testdatay3,testdatastd3/2,'-dk','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','m','MarkerSize',magentamarkersize);
    ylabel('Total Surface Area (\mum^2)','FontSize',labelfontsize,'FontWeight','b');
    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);
    xlimits=xlim;
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);
    set(gca,'FontSize',axesfontsize);hold off;


    subplot(3,2,6); box on; 
    controldatax1   = [controlanalysis.branchorder.branchorder];
    controldatay1   = [controlanalysis.branchorder.totalvolume.mean];
    controldatastd1 = [controlanalysis.branchorder.totalvolume.std];
    %errorbar(controldatax1,controldatay1,controldatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10);   
    %plot(controldatax1,controldatay1,'-ob','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',bluemarkersize);   
    hold on;
    controldatax2   = [controlanalysis.bifurcation.branchorder.branchorder];
    controldatay2   = [controlanalysis.bifurcation.branchorder.totalvolume.mean];
    controldatastd2 = [controlanalysis.bifurcation.branchorder.totalvolume.std];
    errorbar(controldatax2,controldatay2,controldatastd2/2,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
    controldatax3   = [controlanalysis.termination.branchorder.branchorder];
    controldatay3   = [controlanalysis.termination.branchorder.totalvolume.mean];
    controldatastd3 = [controlanalysis.termination.branchorder.totalvolume.std];
    errorbar(controldatax3,controldatay3,controldatastd3/2,'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
    
    testdatax1   = [testanalysis.branchorder.branchorder];
    testdatay1   = [testanalysis.branchorder.totalvolume.mean];
    testdatastd1 = [testanalysis.branchorder.totalvolume.std];
    %errorbar(testdatax1,testdatay1,testdatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10);   
    %plot(testdatax1,testdatay1,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','c','MarkerSize',cyanmarkersize);   
    hold on;
    testdatax2   = [testanalysis.bifurcation.branchorder.branchorder];
    testdatay2   = [testanalysis.bifurcation.branchorder.totalvolume.mean];
    testdatastd2 = [testanalysis.bifurcation.branchorder.totalvolume.std];
    errorbar(testdatax2,testdatay2,testdatastd2/2,'-sk','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
    testdatax3   = [testanalysis.termination.branchorder.branchorder];
    testdatay3   = [testanalysis.termination.branchorder.totalvolume.mean];
    testdatastd3 = [testanalysis.termination.branchorder.totalvolume.std];
    errorbar(testdatax3,testdatay3,testdatastd3/2,'-dk','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','m','MarkerSize',magentamarkersize);
    ylabel('Total Volume (\mum^3)','FontSize',labelfontsize,'FontWeight','b');
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

    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'102_Morph_v_Branch_Order');
    print('-djpeg',filename);
    %saveas(gcf,filename,'fig');

end
 