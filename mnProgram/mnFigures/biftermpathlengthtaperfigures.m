function biftermpathlengthtaperfigures(controlanalysis,testanalysis)
% Bif/term pathlength figures

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
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
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
    
    controldatax1   = [controlanalysis.pathlength.pathlength];
    controldatay1   = [controlanalysis.pathlength.taperratevolume.mean];
    controldatastd1 = [controlanalysis.pathlength.taperratevolume.std];
    %errorbar(controldatax1,controldatay1,controldatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10);
    %plot(controldatax1,controldatay1,'-ob','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',bluemarkersize);
    hold on;
    controldatax2   = [controlanalysis.bifurcation.pathlength.pathlength];
    controldatay2   = [controlanalysis.bifurcation.pathlength.taperratevolume.mean];
    controldatastd2 = [controlanalysis.bifurcation.pathlength.taperratevolume.std];
    errorbar(controldatax2,controldatay2,controldatastd2/2,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
    controldatax3   = [controlanalysis.termination.pathlength.pathlength];
    controldatay3   = [controlanalysis.termination.pathlength.taperratevolume.mean];
    controldatastd3 = [controlanalysis.termination.pathlength.taperratevolume.std];
    errorbar(controldatax3,controldatay3,controldatastd3/2,'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
    
    testdatax1   = [testanalysis.pathlength.pathlength];
    testdatay1   = [testanalysis.pathlength.taperratevolume.mean];
    testdatastd1 = [testanalysis.pathlength.taperratevolume.std];
    %errorbar(testdatax1,testdatay1,testdatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10);
    %plot(testdatax1,testdatay1,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','c','MarkerSize',cyanmarkersize);
    hold on;
    testdatax2   = [testanalysis.bifurcation.pathlength.pathlength];
    testdatay2   = [testanalysis.bifurcation.pathlength.taperratevolume.mean];
    testdatastd2 = [testanalysis.bifurcation.pathlength.taperratevolume.std];
    errorbar(testdatax2,testdatay2,testdatastd2/2,'-sk','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
    testdatax3   = [testanalysis.termination.pathlength.pathlength];
    testdatay3   = [testanalysis.termination.pathlength.taperratevolume.mean];
    testdatastd3 = [testanalysis.termination.pathlength.taperratevolume.std];
    errorbar(testdatax3,testdatay3,testdatastd3/2,'-dk','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','m','MarkerSize',magentamarkersize);
    
    ylabel('Volume Taper Rate','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
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
    
    controldatax1   = [controlanalysis.pathlength.pathlength];
    controldatay1   = [controlanalysis.pathlength.taperratesurfacearea.mean];
    controldatastd1 = [controlanalysis.pathlength.taperratesurfacearea.std];
    %errorbar(controldatax1,controldatay1,controldatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10);
    %plot(controldatax1,controldatay1,'-ob','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',bluemarkersize);
    hold on;
    controldatax2   = [controlanalysis.bifurcation.pathlength.pathlength];
    controldatay2   = [controlanalysis.bifurcation.pathlength.taperratesurfacearea.mean];
    controldatastd2 = [controlanalysis.bifurcation.pathlength.taperratesurfacearea.std];
    errorbar(controldatax2,controldatay2,controldatastd2/2,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
    controldatax3   = [controlanalysis.termination.pathlength.pathlength];
    controldatay3   = [controlanalysis.termination.pathlength.taperratesurfacearea.mean];
    controldatastd3 = [controlanalysis.termination.pathlength.taperratesurfacearea.std];
    errorbar(controldatax3,controldatay3,controldatastd3/2,'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
    
    testdatax1   = [testanalysis.pathlength.pathlength];
    testdatay1   = [testanalysis.pathlength.taperratesurfacearea.mean];
    testdatastd1 = [testanalysis.pathlength.taperratesurfacearea.std];
    %errorbar(testdatax1,testdatay1,testdatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10);
    %plot(testdatax1,testdatay1,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','c','MarkerSize',cyanmarkersize);
    hold on;
    testdatax2   = [testanalysis.bifurcation.pathlength.pathlength];
    testdatay2   = [testanalysis.bifurcation.pathlength.taperratesurfacearea.mean];
    testdatastd2 = [testanalysis.bifurcation.pathlength.taperratesurfacearea.std];
    errorbar(testdatax2,testdatay2,testdatastd2/2,'-sk','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
    testdatax3   = [testanalysis.termination.pathlength.pathlength];
    testdatay3   = [testanalysis.termination.pathlength.taperratesurfacearea.mean];
    testdatastd3 = [testanalysis.termination.pathlength.taperratesurfacearea.std];
    errorbar(testdatax3,testdatay3,testdatastd3/2,'-dk','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','m','MarkerSize',magentamarkersize);
    
    ylabel('Surface Area Taper Rate','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
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
    [ax,h3]=suplabel('Morphometrics versus Local Path Length'  ,'t');
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

    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'103_Taper_v_Path');
    print('-djpeg',filename);
    %saveas(gcf,filename,'fig');

end