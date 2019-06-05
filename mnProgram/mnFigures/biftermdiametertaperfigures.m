function biftermdiametertaperfigures(controlanalysis,testanalysis)
% Bif/term diameter figures

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
end


if nargin == 2
        
    subplot(2,2,1); box on; 
    
    controldatax1   = [controlanalysis.diameter.diameter];
    controldatay1   = [controlanalysis.diameter.taperrate.mean];
    controldatastd1 = [controlanalysis.diameter.taperrate.std];
    %errorbar(controldatax1,controldatay1,controldatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10);
    %plot(controldatax1,controldatay1,'-ob','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',bluemarkersize);
    hold on;
    controldatax2   = [controlanalysis.bifurcation.diameter.diameter];
    controldatay2   = [controlanalysis.bifurcation.diameter.taperrate.mean];
    controldatastd2 = [controlanalysis.bifurcation.diameter.taperrate.std];
    errorbar(controldatax2,controldatay2,controldatastd2/2,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
    controldatax3   = [controlanalysis.termination.diameter.diameter];
    controldatay3   = [controlanalysis.termination.diameter.taperrate.mean];
    controldatastd3 = [controlanalysis.termination.diameter.taperrate.std];
    errorbar(controldatax3,controldatay3,controldatastd3/2,'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
    
    testdatax1   = [testanalysis.diameter.diameter];
    testdatay1   = [testanalysis.diameter.taperrate.mean];
    testdatastd1 = [testanalysis.diameter.taperrate.std];
    %errorbar(testdatax1,testdatay1,testdatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10);
    %plot(testdatax1,testdatay1,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','c','MarkerSize',cyanmarkersize);
    hold on;
    testdatax2   = [testanalysis.bifurcation.diameter.diameter];
    testdatay2   = [testanalysis.bifurcation.diameter.taperrate.mean];
    testdatastd2 = [testanalysis.bifurcation.diameter.taperrate.std];
    errorbar(testdatax2,testdatay2,testdatastd2/2,'-sk','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
    testdatax3   = [testanalysis.termination.diameter.diameter];
    testdatay3   = [testanalysis.termination.diameter.taperrate.mean];
    testdatastd3 = [testanalysis.termination.diameter.taperrate.std];
    errorbar(testdatax3,testdatay3,testdatastd3/2,'-dk','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','m','MarkerSize',magentamarkersize);
    
    ylabel('Taper Rate','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
	legendhandle = gca;
    %h=gca; set(gca,'XDir','reverse');
    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);
    %     xlimits=xlim;
    %     xtick = get(gca,'xtick');
    %     set(gca,'xticklabel', []);
    set(gca,'FontSize',axesfontsize);hold off;
	
	
	subplot(2,2,2); box on; 
    
    controldatax1   = [controlanalysis.diameter.diameter];
    controldatay1   = [controlanalysis.diameter.taperratevolume.mean];
    controldatastd1 = [controlanalysis.diameter.taperratevolume.std];
    %errorbar(controldatax1,controldatay1,controldatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10);
    %plot(controldatax1,controldatay1,'-ob','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',bluemarkersize);
    hold on;
    controldatax2   = [controlanalysis.bifurcation.diameter.diameter];
    controldatay2   = [controlanalysis.bifurcation.diameter.taperratevolume.mean];
    controldatastd2 = [controlanalysis.bifurcation.diameter.taperratevolume.std];
    errorbar(controldatax2,controldatay2,controldatastd2/2,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
    controldatax3   = [controlanalysis.termination.diameter.diameter];
    controldatay3   = [controlanalysis.termination.diameter.taperratevolume.mean];
    controldatastd3 = [controlanalysis.termination.diameter.taperratevolume.std];
    errorbar(controldatax3,controldatay3,controldatastd3/2,'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
    
    testdatax1   = [testanalysis.diameter.diameter];
    testdatay1   = [testanalysis.diameter.taperratevolume.mean];
    testdatastd1 = [testanalysis.diameter.taperratevolume.std];
    %errorbar(testdatax1,testdatay1,testdatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10);
    %plot(testdatax1,testdatay1,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','c','MarkerSize',cyanmarkersize);
    hold on;
    testdatax2   = [testanalysis.bifurcation.diameter.diameter];
    testdatay2   = [testanalysis.bifurcation.diameter.taperratevolume.mean];
    testdatastd2 = [testanalysis.bifurcation.diameter.taperratevolume.std];
    errorbar(testdatax2,testdatay2,testdatastd2/2,'-sk','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
    testdatax3   = [testanalysis.termination.diameter.diameter];
    testdatay3   = [testanalysis.termination.diameter.taperratevolume.mean];
    testdatastd3 = [testanalysis.termination.diameter.taperratevolume.std];
    errorbar(testdatax3,testdatay3,testdatastd3/2,'-dk','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','m','MarkerSize',magentamarkersize);
    
    ylabel('Volume Taper Rate','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
	legendhandle = gca;
    %h=gca; set(gca,'XDir','reverse');
    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);
    %     xlimits=xlim;
    %     xtick = get(gca,'xtick');
    %     set(gca,'xticklabel', []);
    set(gca,'FontSize',axesfontsize);hold off;
	
	
	subplot(2,2,3); box on; 
    
    controldatax1   = [controlanalysis.diameter.diameter];
    controldatay1   = [controlanalysis.diameter.taperratesurfacearea.mean];
    controldatastd1 = [controlanalysis.diameter.taperratesurfacearea.std];
    %errorbar(controldatax1,controldatay1,controldatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10);
    %plot(controldatax1,controldatay1,'-ob','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',bluemarkersize);
    hold on;
    controldatax2   = [controlanalysis.bifurcation.diameter.diameter];
    controldatay2   = [controlanalysis.bifurcation.diameter.taperratesurfacearea.mean];
    controldatastd2 = [controlanalysis.bifurcation.diameter.taperratesurfacearea.std];
    errorbar(controldatax2,controldatay2,controldatastd2/2,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
    controldatax3   = [controlanalysis.termination.diameter.diameter];
    controldatay3   = [controlanalysis.termination.diameter.taperratesurfacearea.mean];
    controldatastd3 = [controlanalysis.termination.diameter.taperratesurfacearea.std];
    errorbar(controldatax3,controldatay3,controldatastd3/2,'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
    
    testdatax1   = [testanalysis.diameter.diameter];
    testdatay1   = [testanalysis.diameter.taperratesurfacearea.mean];
    testdatastd1 = [testanalysis.diameter.taperratesurfacearea.std];
    %errorbar(testdatax1,testdatay1,testdatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10);
    %plot(testdatax1,testdatay1,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','c','MarkerSize',cyanmarkersize);
    hold on;
    testdatax2   = [testanalysis.bifurcation.diameter.diameter];
    testdatay2   = [testanalysis.bifurcation.diameter.taperratesurfacearea.mean];
    testdatastd2 = [testanalysis.bifurcation.diameter.taperratesurfacearea.std];
    errorbar(testdatax2,testdatay2,testdatastd2/2,'-sk','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
    testdatax3   = [testanalysis.termination.diameter.diameter];
    testdatay3   = [testanalysis.termination.diameter.taperratesurfacearea.mean];
    testdatastd3 = [testanalysis.termination.diameter.taperratesurfacearea.std];
    errorbar(testdatax3,testdatay3,testdatastd3/2,'-dk','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','m','MarkerSize',magentamarkersize);
    
    ylabel('Surface Area Taper Rate','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
	legendhandle = gca;
    %h=gca; set(gca,'XDir','reverse');
    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);
    %     xlimits=xlim;
    %     xtick = get(gca,'xtick');
    %     set(gca,'xticklabel', []);
    set(gca,'FontSize',axesfontsize);hold off;


    subplot(2,2,4); box on; 
    
    controldatax1   = [controlanalysis.diameter.diameter];
    controldatay1   = [controlanalysis.diameter.meandiameter.mean];
    controldatastd1 = [controlanalysis.diameter.meandiameter.std];
    %errorbar(controldatax1,controldatay1,controldatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10);
    %plot(controldatax1,controldatay1,'-ob','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',bluemarkersize);
    hold on;
    controldatax2   = [controlanalysis.bifurcation.diameter.diameter];
    controldatay2   = [controlanalysis.bifurcation.diameter.meandiameter.mean];
    controldatastd2 = [controlanalysis.bifurcation.diameter.meandiameter.std];
    errorbar(controldatax2,controldatay2,controldatastd2/2,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
    controldatax3   = [controlanalysis.termination.diameter.diameter];
    controldatay3   = [controlanalysis.termination.diameter.meandiameter.mean];
    controldatastd3 = [controlanalysis.termination.diameter.meandiameter.std];
    errorbar(controldatax3,controldatay3,controldatastd3/2,'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
    
    testdatax1   = [testanalysis.diameter.diameter];
    testdatay1   = [testanalysis.diameter.meandiameter.mean];
    testdatastd1 = [testanalysis.diameter.meandiameter.std];
    %errorbar(testdatax1,testdatay1,testdatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10);
    %plot(testdatax1,testdatay1,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','c','MarkerSize',cyanmarkersize);
    hold on;
    testdatax2   = [testanalysis.bifurcation.diameter.diameter];
    testdatay2   = [testanalysis.bifurcation.diameter.meandiameter.mean];
    testdatastd2 = [testanalysis.bifurcation.diameter.meandiameter.std];
    errorbar(testdatax2,testdatay2,testdatastd2/2,'-sk','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
    testdatax3   = [testanalysis.termination.diameter.diameter];
    testdatay3   = [testanalysis.termination.diameter.meandiameter.mean];
    testdatastd3 = [testanalysis.termination.diameter.meandiameter.std];
    errorbar(testdatax3,testdatay3,testdatastd3/2,'-dk','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','m','MarkerSize',magentamarkersize);
    
    ylabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    %h=gca; set(gca,'XDir','reverse');
    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);
    xlimits=xlim;
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);
    set(gca,'FontSize',axesfontsize);hold off;


    


    




    subplotspace('horizontal',-5);
    subplotspace('vertical',-15);

    %[ax,h1]=suplabel('Diameter (\mum)');
    [ax,h3]=suplabel('Morphometrics versus Local Diameter'  ,'t');
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

    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'103_Taper_v_Diam');
    print('-djpeg',filename);
    %saveas(gcf,filename,'fig');

end