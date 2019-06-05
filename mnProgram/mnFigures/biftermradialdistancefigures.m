function biftermradialdistancefigures(controlanalysis,testanalysis)
% Bif/term radial distance figures

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
    controldatax1   = [controlanalysis.radialdistance.radialdistance];
    controldatay1   = [controlanalysis.radialdistance.numbersegments.mean];
    controldatastd1 = [controlanalysis.radialdistance.numbersegments.std];
    %errorbar(controldatax1,controldatay1,controldatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10); 
    plot(controldatax1,controldatay1,'-ob','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',indbluemarkersize);
    hold on;   
    controldatax2   = [controlanalysis.bifurcation.radialdistance.radialdistance];
    controldatay2   = [controlanalysis.bifurcation.radialdistance.numbersegments.mean];
    controldatastd2 = [controlanalysis.bifurcation.radialdistance.numbersegments.std];
    errorbar(controldatax2,controldatay2,controldatastd2/2,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);  
    controldatax3   = [controlanalysis.termination.radialdistance.radialdistance];
    controldatay3   = [controlanalysis.termination.radialdistance.numbersegments.mean];
    controldatastd3 = [controlanalysis.termination.radialdistance.numbersegments.std];
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
    controldatax1   = [controlanalysis.radialdistance.radialdistance];
    controldatay1   = [controlanalysis.radialdistance.diameter.mean];
    controldatastd1 = [controlanalysis.radialdistance.diameter.std];
    %errorbar(controldatax1,controldatay1,controldatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10); 
    plot(controldatax1,controldatay1,'-ob','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',indbluemarkersize);
    hold on;
    controldatax2   = [controlanalysis.bifurcation.radialdistance.radialdistance];
    controldatay2   = [controlanalysis.bifurcation.radialdistance.diameter.mean];
    controldatastd2 = [controlanalysis.bifurcation.radialdistance.diameter.std];
    errorbar(controldatax2,controldatay2,controldatastd2/2,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
    controldatax3   = [controlanalysis.termination.radialdistance.radialdistance];
    controldatay3   = [controlanalysis.termination.radialdistance.diameter.mean];
    controldatastd3 = [controlanalysis.termination.radialdistance.diameter.std];
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
    controldatax1   = [controlanalysis.radialdistance.radialdistance];
    controldatay1   = [controlanalysis.radialdistance.taperrate.mean];
    controldatastd1 = [controlanalysis.radialdistance.taperrate.std];
    %errorbar(controldatax1,controldatay1,controldatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10); 
    plot(controldatax1,controldatay1,'-ob','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',indbluemarkersize);
    hold on;
    controldatax2   = [controlanalysis.bifurcation.radialdistance.radialdistance];
    controldatay2   = [controlanalysis.bifurcation.radialdistance.taperrate.mean];
    controldatastd2 = [controlanalysis.bifurcation.radialdistance.taperrate.std];
    errorbar(controldatax2,controldatay2,controldatastd2/2,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
    controldatax3   = [controlanalysis.termination.radialdistance.radialdistance];
    controldatay3   = [controlanalysis.termination.radialdistance.taperrate.mean];
    controldatastd3 = [controlanalysis.termination.radialdistance.taperrate.std];
    errorbar(controldatax3,controldatay3,controldatastd3/2,'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
    ylabel('Taper Rate','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Radial Distance (\mum)','FontSize',labelfontsize,'FontWeight','b');
    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);
    %     xlimits=xlim;
    %     xtick = get(gca,'xtick');
    %     set(gca,'xticklabel', []);
    set(gca,'FontSize',axesfontsize);hold off;


    subplot(3,2,2); box on; 
    controldatax1   = [controlanalysis.radialdistance.radialdistance];
    controldatay1   = [controlanalysis.radialdistance.length.mean];
    controldatastd1 = [controlanalysis.radialdistance.length.std];
    %errorbar(controldatax1,controldatay1,controldatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10); 
    plot(controldatax1,controldatay1,'-ob','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',indbluemarkersize);
    hold on;
    controldatax2   = [controlanalysis.bifurcation.radialdistance.radialdistance];
    controldatay2   = [controlanalysis.bifurcation.radialdistance.length.mean];
    controldatastd2 = [controlanalysis.bifurcation.radialdistance.length.std];
    errorbar(controldatax2,controldatay2,controldatastd2/2,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
    controldatax3   = [controlanalysis.termination.radialdistance.radialdistance];
    controldatay3   = [controlanalysis.termination.radialdistance.length.mean];
    controldatastd3 = [controlanalysis.termination.radialdistance.length.std];
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
    controldatax1   = [controlanalysis.radialdistance.radialdistance];
    controldatay1   = [controlanalysis.radialdistance.surfacearea.mean];
    controldatastd1 = [controlanalysis.radialdistance.surfacearea.std];
    %errorbar(controldatax1,controldatay1,controldatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10); 
    plot(controldatax1,controldatay1,'-ob','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',indbluemarkersize);
    hold on;
    controldatax2   = [controlanalysis.bifurcation.radialdistance.radialdistance];
    controldatay2   = [controlanalysis.bifurcation.radialdistance.surfacearea.mean];
    controldatastd2 = [controlanalysis.bifurcation.radialdistance.surfacearea.std];
    errorbar(controldatax2,controldatay2,controldatastd2/2,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
    controldatax3   = [controlanalysis.termination.radialdistance.radialdistance];
    controldatay3   = [controlanalysis.termination.radialdistance.surfacearea.mean];
    controldatastd3 = [controlanalysis.termination.radialdistance.surfacearea.std];
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
    controldatax1   = [controlanalysis.radialdistance.radialdistance];
    controldatay1   = [controlanalysis.radialdistance.volume.mean];
    controldatastd1 = [controlanalysis.radialdistance.volume.std];
    %errorbar(controldatax1,controldatay1,controldatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10); 
    plot(controldatax1,controldatay1,'-ob','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',indbluemarkersize);
    hold on;
    controldatax2   = [controlanalysis.bifurcation.radialdistance.radialdistance];
    controldatay2   = [controlanalysis.bifurcation.radialdistance.volume.mean];
    controldatastd2 = [controlanalysis.bifurcation.radialdistance.volume.std];
    errorbar(controldatax2,controldatay2,controldatastd2/2,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
    controldatax3   = [controlanalysis.termination.radialdistance.radialdistance];
    controldatay3   = [controlanalysis.termination.radialdistance.volume.mean];
    controldatastd3 = [controlanalysis.termination.radialdistance.volume.std];
    errorbar(controldatax3,controldatay3,controldatastd3/2,'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
    ylabel('Volume (\mum^3)','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Radial Distance (\mum)','FontSize',labelfontsize,'FontWeight','b');
    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);
    %     xlimits=xlim;
    %     xtick = get(gca,'xtick');
    %     set(gca,'xticklabel', []);
    set(gca,'FontSize',axesfontsize);hold off;




    subplotspace('horizontal',-5);
    subplotspace('vertical',-15);
    
    [ax,h3]=suplabel('Morphometrics versus Radial Distance from Soma'  ,'t');
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

    filename = sprintf('%s_%s',controlanalysis.inputfilename,'107_Morph_v_Rad_Dist');
    print('-djpeg',filename);
    %saveas(gcf,filename,'fig');

end


if nargin == 2

    subplot(3,2,1); box on; 
    controldatax1   = [controlanalysis.radialdistance.radialdistance];
    controldatay1   = [controlanalysis.radialdistance.numbersegments.mean];
    controldatastd1 = [controlanalysis.radialdistance.numbersegments.std];
    %errorbar(controldatax1,controldatay1,controldatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10); 
    %plot(controldatax1,controldatay1,'-ob','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',bluemarkersize);
    hold on;   
    controldatax2   = [controlanalysis.bifurcation.radialdistance.radialdistance];
    controldatay2   = [controlanalysis.bifurcation.radialdistance.numbersegments.mean];
    controldatastd2 = [controlanalysis.bifurcation.radialdistance.numbersegments.std];
    errorbar(controldatax2,controldatay2,controldatastd2/2,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);  
    controldatax3   = [controlanalysis.termination.radialdistance.radialdistance];
    controldatay3   = [controlanalysis.termination.radialdistance.numbersegments.mean];
    controldatastd3 = [controlanalysis.termination.radialdistance.numbersegments.std];
    errorbar(controldatax3,controldatay3,controldatastd3/2,'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);      
    testdatax1   = [testanalysis.radialdistance.radialdistance];
    testdatay1   = [testanalysis.radialdistance.numbersegments.mean];
    testdatastd1 = [testanalysis.radialdistance.numbersegments.std];
    %errorbar(testdatax1,testdatay1,testdatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10); 
    %plot(testdatax1,testdatay1,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','c','MarkerSize',cyanmarkersize);
    hold on;   
    testdatax2   = [testanalysis.bifurcation.radialdistance.radialdistance];
    testdatay2   = [testanalysis.bifurcation.radialdistance.numbersegments.mean];
    testdatastd2 = [testanalysis.bifurcation.radialdistance.numbersegments.std];
    errorbar(testdatax2,testdatay2,testdatastd2/2,'-sk','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',yellowmarkersize);  
    testdatax3   = [testanalysis.termination.radialdistance.radialdistance];
    testdatay3   = [testanalysis.termination.radialdistance.numbersegments.mean];
    testdatastd3 = [testanalysis.termination.radialdistance.numbersegments.std];
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
    controldatax1   = [controlanalysis.radialdistance.radialdistance];
    controldatay1   = [controlanalysis.radialdistance.diameter.mean];
    controldatastd1 = [controlanalysis.radialdistance.diameter.std];
    %errorbar(controldatax1,controldatay1,controldatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10); 
    %plot(controldatax1,controldatay1,'-ob','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',bluemarkersize);
    hold on;
    controldatax2   = [controlanalysis.bifurcation.radialdistance.radialdistance];
    controldatay2   = [controlanalysis.bifurcation.radialdistance.diameter.mean];
    controldatastd2 = [controlanalysis.bifurcation.radialdistance.diameter.std];
    errorbar(controldatax2,controldatay2,controldatastd2/2,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
    controldatax3   = [controlanalysis.termination.radialdistance.radialdistance];
    controldatay3   = [controlanalysis.termination.radialdistance.diameter.mean];
    controldatastd3 = [controlanalysis.termination.radialdistance.diameter.std];
    errorbar(controldatax3,controldatay3,controldatastd3/2,'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
    testdatax1   = [testanalysis.radialdistance.radialdistance];
    testdatay1   = [testanalysis.radialdistance.diameter.mean];
    testdatastd1 = [testanalysis.radialdistance.diameter.std];
    %errorbar(testdatax1,testdatay1,testdatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10); 
    %plot(testdatax1,testdatay1,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','c','MarkerSize',cyanmarkersize);
    hold on;   
    testdatax2   = [testanalysis.bifurcation.radialdistance.radialdistance];
    testdatay2   = [testanalysis.bifurcation.radialdistance.diameter.mean];
    testdatastd2 = [testanalysis.bifurcation.radialdistance.diameter.std];
    errorbar(testdatax2,testdatay2,testdatastd2/2,'-sk','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',yellowmarkersize);  
    testdatax3   = [testanalysis.termination.radialdistance.radialdistance];
    testdatay3   = [testanalysis.termination.radialdistance.diameter.mean];
    testdatastd3 = [testanalysis.termination.radialdistance.diameter.std];
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
    controldatax1   = [controlanalysis.radialdistance.radialdistance];
    controldatay1   = [controlanalysis.radialdistance.taperrate.mean];
    controldatastd1 = [controlanalysis.radialdistance.taperrate.std];
    %errorbar(controldatax1,controldatay1,controldatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10); 
    %plot(controldatax1,controldatay1,'-ob','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',bluemarkersize);
    hold on;
    controldatax2   = [controlanalysis.bifurcation.radialdistance.radialdistance];
    controldatay2   = [controlanalysis.bifurcation.radialdistance.taperrate.mean];
    controldatastd2 = [controlanalysis.bifurcation.radialdistance.taperrate.std];
    errorbar(controldatax2,controldatay2,controldatastd2/2,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
    controldatax3   = [controlanalysis.termination.radialdistance.radialdistance];
    controldatay3   = [controlanalysis.termination.radialdistance.taperrate.mean];
    controldatastd3 = [controlanalysis.termination.radialdistance.taperrate.std];
    errorbar(controldatax3,controldatay3,controldatastd3/2,'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
    testdatax1   = [testanalysis.radialdistance.radialdistance];
    testdatay1   = [testanalysis.radialdistance.taperrate.mean];
    testdatastd1 = [testanalysis.radialdistance.taperrate.std];
    %errorbar(testdatax1,testdatay1,testdatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10); 
    %plot(testdatax1,testdatay1,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','c','MarkerSize',cyanmarkersize);
    hold on;   
    testdatax2   = [testanalysis.bifurcation.radialdistance.radialdistance];
    testdatay2   = [testanalysis.bifurcation.radialdistance.taperrate.mean];
    testdatastd2 = [testanalysis.bifurcation.radialdistance.taperrate.std];
    errorbar(testdatax2,testdatay2,testdatastd2/2,'-sk','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',yellowmarkersize);  
    testdatax3   = [testanalysis.termination.radialdistance.radialdistance];
    testdatay3   = [testanalysis.termination.radialdistance.taperrate.mean];
    testdatastd3 = [testanalysis.termination.radialdistance.taperrate.std];
    errorbar(testdatax3,testdatay3,testdatastd3/2,'-dk','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','m','MarkerSize',magentamarkersize);
    ylabel('Taper Rate','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Radial Distance (\mum)','FontSize',labelfontsize,'FontWeight','b');
    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);
    %     xlimits=xlim;
    %     xtick = get(gca,'xtick');
    %     set(gca,'xticklabel', []);
    set(gca,'FontSize',axesfontsize); hold off;


    subplot(3,2,2); box on; 
    controldatax1   = [controlanalysis.radialdistance.radialdistance];
    controldatay1   = [controlanalysis.radialdistance.length.mean];
    controldatastd1 = [controlanalysis.radialdistance.length.std];
    %errorbar(controldatax1,controldatay1,controldatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10); 
    %plot(controldatax1,controldatay1,'-ob','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',bluemarkersize);
    hold on;
    controldatax2   = [controlanalysis.bifurcation.radialdistance.radialdistance];
    controldatay2   = [controlanalysis.bifurcation.radialdistance.length.mean];
    controldatastd2 = [controlanalysis.bifurcation.radialdistance.length.std];
    errorbar(controldatax2,controldatay2,controldatastd2/2,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
    controldatax3   = [controlanalysis.termination.radialdistance.radialdistance];
    controldatay3   = [controlanalysis.termination.radialdistance.length.mean];
    controldatastd3 = [controlanalysis.termination.radialdistance.length.std];
    errorbar(controldatax3,controldatay3,controldatastd3/2,'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
    testdatax1   = [testanalysis.radialdistance.radialdistance];
    testdatay1   = [testanalysis.radialdistance.length.mean];
    testdatastd1 = [testanalysis.radialdistance.length.std];
    %errorbar(testdatax1,testdatay1,testdatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10); 
    %plot(testdatax1,testdatay1,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','c','MarkerSize',cyanmarkersize);
    hold on;   
    testdatax2   = [testanalysis.bifurcation.radialdistance.radialdistance];
    testdatay2   = [testanalysis.bifurcation.radialdistance.length.mean];
    testdatastd2 = [testanalysis.bifurcation.radialdistance.length.std];
    errorbar(testdatax2,testdatay2,testdatastd2/2,'-sk','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',yellowmarkersize);  
    testdatax3   = [testanalysis.termination.radialdistance.radialdistance];
    testdatay3   = [testanalysis.termination.radialdistance.length.mean];
    testdatastd3 = [testanalysis.termination.radialdistance.length.std];
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
    controldatax1   = [controlanalysis.radialdistance.radialdistance];
    controldatay1   = [controlanalysis.radialdistance.surfacearea.mean];
    controldatastd1 = [controlanalysis.radialdistance.surfacearea.std];
    %errorbar(controldatax1,controldatay1,controldatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10); 
    %plot(controldatax1,controldatay1,'-ob','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',bluemarkersize);
    hold on;
    controldatax2   = [controlanalysis.bifurcation.radialdistance.radialdistance];
    controldatay2   = [controlanalysis.bifurcation.radialdistance.surfacearea.mean];
    controldatastd2 = [controlanalysis.bifurcation.radialdistance.surfacearea.std];
    errorbar(controldatax2,controldatay2,controldatastd2/2,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
    controldatax3   = [controlanalysis.termination.radialdistance.radialdistance];
    controldatay3   = [controlanalysis.termination.radialdistance.surfacearea.mean];
    controldatastd3 = [controlanalysis.termination.radialdistance.surfacearea.std];
    errorbar(controldatax3,controldatay3,controldatastd3/2,'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
    testdatax1   = [testanalysis.radialdistance.radialdistance];
    testdatay1   = [testanalysis.radialdistance.surfacearea.mean];
    testdatastd1 = [testanalysis.radialdistance.surfacearea.std];
    %errorbar(testdatax1,testdatay1,testdatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10); 
    %plot(testdatax1,testdatay1,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','c','MarkerSize',cyanmarkersize);
    hold on;   
    testdatax2   = [testanalysis.bifurcation.radialdistance.radialdistance];
    testdatay2   = [testanalysis.bifurcation.radialdistance.surfacearea.mean];
    testdatastd2 = [testanalysis.bifurcation.radialdistance.surfacearea.std];
    errorbar(testdatax2,testdatay2,testdatastd2/2,'-sk','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',yellowmarkersize);  
    testdatax3   = [testanalysis.termination.radialdistance.radialdistance];
    testdatay3   = [testanalysis.termination.radialdistance.surfacearea.mean];
    testdatastd3 = [testanalysis.termination.radialdistance.surfacearea.std];
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
    controldatax1   = [controlanalysis.radialdistance.radialdistance];
    controldatay1   = [controlanalysis.radialdistance.volume.mean];
    controldatastd1 = [controlanalysis.radialdistance.volume.std];
    %errorbar(controldatax1,controldatay1,controldatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10); 
    %plot(controldatax1,controldatay1,'-ob','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',bluemarkersize);
    hold on;
    controldatax2   = [controlanalysis.bifurcation.radialdistance.radialdistance];
    controldatay2   = [controlanalysis.bifurcation.radialdistance.volume.mean];
    controldatastd2 = [controlanalysis.bifurcation.radialdistance.volume.std];
    errorbar(controldatax2,controldatay2,controldatastd2/2,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
    controldatax3   = [controlanalysis.termination.radialdistance.radialdistance];
    controldatay3   = [controlanalysis.termination.radialdistance.volume.mean];
    controldatastd3 = [controlanalysis.termination.radialdistance.volume.std];
    errorbar(controldatax3,controldatay3,controldatastd3/2,'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
    testdatax1   = [testanalysis.radialdistance.radialdistance];
    testdatay1   = [testanalysis.radialdistance.volume.mean];
    testdatastd1 = [testanalysis.radialdistance.volume.std];
    %errorbar(testdatax1,testdatay1,testdatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10); 
    %plot(testdatax1,testdatay1,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','c','MarkerSize',cyanmarkersize);
    hold on;   
    testdatax2   = [testanalysis.bifurcation.radialdistance.radialdistance];
    testdatay2   = [testanalysis.bifurcation.radialdistance.volume.mean];
    testdatastd2 = [testanalysis.bifurcation.radialdistance.volume.std];
    errorbar(testdatax2,testdatay2,testdatastd2/2,'-sk','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',yellowmarkersize);  
    testdatax3   = [testanalysis.termination.radialdistance.radialdistance];
    testdatay3   = [testanalysis.termination.radialdistance.volume.mean];
    testdatastd3 = [testanalysis.termination.radialdistance.volume.std];
    errorbar(testdatax3,testdatay3,testdatastd3/2,'-dk','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','m','MarkerSize',magentamarkersize);
    ylabel('Volume (\mum^3)','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Radial Distance (\mum)','FontSize',labelfontsize,'FontWeight','b');
    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);
    %     xlimits=xlim;
    %     xtick = get(gca,'xtick');
    %     set(gca,'xticklabel', []);
    set(gca,'FontSize',axesfontsize); hold off;


    subplotspace('horizontal',-5);
    subplotspace('vertical',-15);

    [ax,h3]=suplabel('Morphometrics versus Radial Distance from Soma'  ,'t');
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

    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'107_Morph_v_Rad_Dist');
    
    print('-djpeg',filename);
    %saveas(gcf,filename,'fig');

end
