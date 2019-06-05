function allbiftermfigure(measure,versus,scale,controlanalysis,testanalysis)
%

titlefontsize = 14;
labelfontsize = 7;
axesfontsize  = 5;
insetfontsize = 5;

bluemarkersize    = 10;
greenmarkersize   = 6;
redmarkersize     = 8;
cyanmarkersize    = 8;
yellowmarkersize  = 4;
magentamarkersize = 6;

sameyscale = 'n';

if nargin == 4

    eval(['controldatax1 = [controlanalysis.' versus '.' versus '];']);
    eval(['controldatay1 = [controlanalysis.' versus '.' measure '.mean];']);
    eval(['controldatastd1 = [controlanalysis.' versus '.' measure '.std];']);
    eval(['controldatax2 = [controlanalysis.bifurcation.' versus '.' versus '];']);
    eval(['controldatay2 = [controlanalysis.bifurcation.' versus '.' measure '.mean];']);
    eval(['controldatastd2 = [controlanalysis.bifurcation.' versus '.' measure '.std];']);
    eval(['controldatax3 = [controlanalysis.termination.' versus '.' versus '];']);
    eval(['controldatay3 = [controlanalysis.termination.' versus '.' measure '.mean];']);
    eval(['controldatastd3 = [controlanalysis.termination.' versus '.' measure '.std];']);

    if strcmp(measure,'numbersegments') == 1
        ylabeltext = 'Number Segments';
    elseif strcmp(measure,'taperrate') == 1
        ylabeltext = 'Taper Rate';
    elseif strcmp(measure,'taperratio') == 1
        ylabeltext = 'Taper Ratio';
    elseif strcmp(measure,'proximaldiameter') == 1
        ylabeltext = 'Proximal Diameter (\mum)';
    elseif strcmp(measure,'cylindricaldiameter') == 1
        ylabeltext = 'Cylindrical Diameter (\mum)';
    elseif strcmp(measure,'distaldiameter') == 1
        ylabeltext = 'Distal Diameter (\mum)';
    elseif strcmp(measure,'diameter') == 1
        ylabeltext = 'Diameter (\mum)';
    elseif strcmp(measure,'length') == 1
        ylabeltext = 'Length (\mum)';
    elseif strcmp(measure,'surfacearea') == 1
        ylabeltext = 'Surface Area (\mum^2)';
    elseif strcmp(measure,'volume') == 1
        ylabeltext = 'Volume (\mum^3)';
    elseif strcmp(measure,'totallength') == 1
        ylabeltext = 'Total Length (\mum)';
    elseif strcmp(measure,'totalsurfacearea') == 1
        ylabeltext = 'Total Surface Area (\mum^2)';
    elseif strcmp(measure,'totalvolume') == 1
        ylabeltext = 'Total Volume (\mum^3)';
    else
        disp('Error: measure type not properly defined.');
        keyboard;
    end

    if strcmp(versus,'diameter') == 1
        xlabeltext = 'Local Diameter (\mum)';
    elseif strcmp(versus,'branchorder') == 1
        xlabeltext = 'Branch Order';
    elseif strcmp(versus,'pathlength') == 1
        xlabeltext = 'Path Length from Soma (\mum)';
    elseif strcmp(versus,'radialdistance') == 1
        xlabeltext = 'Radial Distance from Soma (\mum)';
    else
        disp('Error: versus type bot properly defined.');
        keyboard;
    end

    figure;

    if strcmp(scale,'linear') == 1
        subplot(3,1,1);
            errorbar(controldatax1,controldatay1,controldatastd1/2,'-ob','LineWidth',2,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',bluemarkersize);
            hold on;
            %errorbar(testdatax1,testdatay1,testdatastd1/2,'-ob','LineWidth',1,'MarkerEdgeColor','b','MarkerFaceColor','w','MarkerSize',10);
            ylabel(ylabeltext,'FontSize',labelfontsize,'FontWeight','b');
            
            set(gca,'xticklabel', []);
            legendhandle1 = gca;
            xlimits = xlim;
            ylimits1 = ylim;
            set(gca,'FontSize',axesfontsize);hold off;
        subplot(3,1,2);
        errorbar(controldatax2,controldatay2,controldatastd2/2,'-sg','LineWidth',2,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
            hold on;
            %errorbar(testdatax2,testdatay2,testdatastd2/2,'-sg','LineWidth',1,'MarkerEdgeColor','g','MarkerFaceColor','w','MarkerSize',10);
            ylabel(ylabeltext,'FontSize',labelfontsize,'FontWeight','b');
            set(gca,'xticklabel', []);
            legendhandle2 = gca;
            xlim(xlimits);
            ylimits2 = ylim;
            set(gca,'FontSize',axesfontsize);hold off;
        subplot(3,1,3);
            errorbar(controldatax3,controldatay3,controldatastd3/2,'-dr','LineWidth',2,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
            hold on;
            %errorbar(testdatax1,testdatay1,testdatastd1/2,'-dr','LineWidth',1,'MarkerEdgeColor','r','MarkerFaceColor','w','MarkerSize',10);
            ylabel(ylabeltext,'FontSize',labelfontsize,'FontWeight','b');
            xlabel(xlabeltext,'FontSize',labelfontsize,'FontWeight','b');
            legendhandle3 = gca;
            xlim(xlimits);
            ylimits3 = ylim;
            set(gca,'FontSize',axesfontsize);hold off;
    elseif strcmp(scale,'semilog') == 1
        subplot(3,1,1);
            semilogx(controldatax1,controldatay1,'-ob','LineWidth',2,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',bluemarkersize);
            hold on;
            %semilogx(testdatax1,testdatay1,'-ob','LineWidth',1,'MarkerEdgeColor','b','MarkerFaceColor','w','MarkerSize',10);
            ylabel(ylabeltext,'FontSize',labelfontsize,'FontWeight','b');
            
            set(gca,'xticklabel', []);
            legendhandle1 = gca;
            xlimits = xlim;
            ylimits1 = ylim;
            set(gca,'FontSize',axesfontsize);hold off;
        subplot(3,1,2);
            semilogx(controldatax2,controldatay2,'-sg','LineWidth',2,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
            hold on;
            %semilogx(testdatax2,testdatay2,'-sg','LineWidth',1,'MarkerEdgeColor','g','MarkerFaceColor','w','MarkerSize',10);
            ylabel(ylabeltext,'FontSize',labelfontsize,'FontWeight','b');
            set(gca,'xticklabel', []);
            legendhandle2 = gca;
            xlim(xlimits);
            ylimits2 = ylim;
            set(gca,'FontSize',axesfontsize);hold off;
        subplot(3,1,3);
            semilogx(controldatax3,controldatay3,'-dr','LineWidth',2,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
            hold on;
            %semilogx(testdatax1,testdatay1,'-dr','LineWidth',1,'MarkerEdgeColor','r','MarkerFaceColor','w','MarkerSize',10);
            ylabel(ylabeltext,'FontSize',labelfontsize,'FontWeight','b');
            xlabel(xlabeltext,'FontSize',labelfontsize,'FontWeight','b');
            legendhandle3 = gca;
            xlim(xlimits);
            ylimits3 = ylim;
            set(gca,'FontSize',axesfontsize);hold off;
    elseif strcmp(scale,'loglog') == 1
        subplot(3,1,1);
            loglog(controldatax1,controldatay1,'-ob','LineWidth',2,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',bluemarkersize);
            hold on;
            %loglog(testdatax1,testdatay1,'-ob','LineWidth',1,'MarkerEdgeColor','b','MarkerFaceColor','w','MarkerSize',10);
            ylabel(ylabeltext,'FontSize',labelfontsize,'FontWeight','b');
            
            set(gca,'xticklabel', []);
            legendhandle1 = gca;
            xlimits = xlim;
            ylimits1 = ylim;
            set(gca,'FontSize',axesfontsize);hold off;
        subplot(3,1,2);
            loglog(controldatax2,controldatay2,'-sg','LineWidth',2,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
            hold on;
            %loglog(testdatax2,testdatay2,'-sg','LineWidth',1,'MarkerEdgeColor','g','MarkerFaceColor','w','MarkerSize',10);
            ylabel(ylabeltext,'FontSize',labelfontsize,'FontWeight','b');
            set(gca,'xticklabel', []);
            legendhandle2 = gca;
            xlim(xlimits);
            ylimits2 = ylim;
            set(gca,'FontSize',axesfontsize);hold off;
        subplot(3,1,3);
            loglog(controldatax3,controldatay3,'-dr','LineWidth',2,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
            hold on;
            %loglog(testdatax1,testdatay1,'-dr','LineWidth',1,'MarkerEdgeColor','r','MarkerFaceColor','w','MarkerSize',10);
            ylabel(ylabeltext,'FontSize',labelfontsize,'FontWeight','b');
            xlabel(xlabeltext,'FontSize',labelfontsize,'FontWeight','b');
            legendhandle3 = gca;
            xlim(xlimits);
            ylimits3 = ylim;
            set(gca,'FontSize',axesfontsize);hold off;
    else
        disp('Error: scale is not defined properly.');
        keyboard
    end

    
    subplotspace('vertical',-15);
    
    [ax,h3]=suplabel('Bifurcation / Termination Analysis'  ,'t');
    set(h3,'FontSize',titlefontsize);
    
    fillscreen;

    cd(controlanalysis.datapathname);
    
   
    if exist('figures','dir')==7
        cd('figures');
    else
        mkdir('figures');
        cd('figures');
    end
    
    if exist('bifterm','dir')==7
        cd('bifterm');
    else
        mkdir('bifterm');
        cd('bifterm');
    end


    legend(legendhandle1,[controlanalysis.inputfilename ' All'],'Location','NorthEast');
    legend(legendhandle2,[controlanalysis.inputfilename ' Bifs'],'Location','NorthEast');
    legend(legendhandle3,[controlanalysis.inputfilename ' Terms'],'Location','NorthEast');

    if strcmp(sameyscale,'y') == 1
        ymin = [ylimits1(1) ylimits2(1) ylimits3(1)];
        ymax = [ylimits1(2) ylimits2(2) ylimits3(2)];
        ylimits = [min(ymin) max(ymax)];
        ylim(legendhandle1,ylimits);
        ylim(legendhandle2,ylimits);
        ylim(legendhandle3,ylimits);
    end

    filename = sprintf('%s_Ind_Bif_Term_%s_%s_%s',controlanalysis.inputfilename,versus,measure,scale);
    print('-djpeg',filename); close all;
    %saveas(gcf,filename,'fig');

end

if nargin == 5

    eval(['controldatax1 = [controlanalysis.' versus '.' versus '];']);
    eval(['controldatay1 = [controlanalysis.' versus '.' measure '.mean];']);
    eval(['controldatastd1 = [controlanalysis.' versus '.' measure '.std];']);
    eval(['controldatax2 = [controlanalysis.bifurcation.' versus '.' versus '];']);
    eval(['controldatay2 = [controlanalysis.bifurcation.' versus '.' measure '.mean];']);
    eval(['controldatastd2 = [controlanalysis.bifurcation.' versus '.' measure '.std];']);
    eval(['controldatax3 = [controlanalysis.termination.' versus '.' versus '];']);
    eval(['controldatay3 = [controlanalysis.termination.' versus '.' measure '.mean];']);
    eval(['controldatastd3 = [controlanalysis.termination.' versus '.' measure '.std];']);

    eval(['testdatax1 = [testanalysis.' versus '.' versus '];']);
    eval(['testdatay1 = [testanalysis.' versus '.' measure '.mean];']);
    eval(['testdatastd1 = [testanalysis.' versus '.' measure '.std];']);
    eval(['testdatax2 = [testanalysis.bifurcation.' versus '.' versus '];']);
    eval(['testdatay2 = [testanalysis.bifurcation.' versus '.' measure '.mean];']);
    eval(['testdatastd2 = [testanalysis.bifurcation.' versus '.' measure '.std];']);
    eval(['testdatax3 = [testanalysis.termination.' versus '.' versus '];']);
    eval(['testdatay3 = [testanalysis.termination.' versus '.' measure '.mean];']);
    eval(['testdatastd3 = [testanalysis.termination.' versus '.' measure '.std];']);

    if strcmp(measure,'numbersegments') == 1
        ylabeltext = 'Number Segments';
    elseif strcmp(measure,'taperrate') == 1
        ylabeltext = 'Taper Rate';
    elseif strcmp(measure,'taperratio') == 1
        ylabeltext = 'Taper Ratio';
    elseif strcmp(measure,'proximaldiameter') == 1
        ylabeltext = 'Proximal Diameter (\mum)';
    elseif strcmp(measure,'cylindricaldiameter') == 1
        ylabeltext = 'Cylindrical Diameter (\mum)';
    elseif strcmp(measure,'distaldiameter') == 1
        ylabeltext = 'Distal Diameter (\mum)';
    elseif strcmp(measure,'diameter') == 1
        ylabeltext = 'Diameter (\mum)';
    elseif strcmp(measure,'length') == 1
        ylabeltext = 'Length (\mum)';
    elseif strcmp(measure,'surfacearea') == 1
        ylabeltext = 'Surface Area (\mum^2)';
    elseif strcmp(measure,'volume') == 1
        ylabeltext = 'Volume (\mum^3)';
    elseif strcmp(measure,'totallength') == 1
        ylabeltext = 'Total Length (\mum)';
    elseif strcmp(measure,'totalsurfacearea') == 1
        ylabeltext = 'Total Surface Area (\mum^2)';
    elseif strcmp(measure,'totalvolume') == 1
        ylabeltext = 'Total Volume (\mum^3)';
    else
        disp('Error: measure type not properly defined.');
        keyboard;
    end

    if strcmp(versus,'diameter') == 1
        xlabeltext = 'Local Diameter (\mum)';
    elseif strcmp(versus,'branchorder') == 1
        xlabeltext = 'Branch Order';
    elseif strcmp(versus,'pathlength') == 1
        xlabeltext = 'Path Length from Soma (\mum)';
    elseif strcmp(versus,'radialdistance') == 1
        xlabeltext = 'Radial Distance from Soma (\mum)';
    else
        disp('Error: versus type bot properly defined.');
        keyboard;
    end

    figure;

    if strcmp(scale,'linear') == 1
        subplot(3,1,1);
            errorbar(controldatax1,controldatay1,controldatastd1/2,'-ob','LineWidth',2,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',bluemarkersize);
            hold on;
            errorbar(testdatax1,testdatay1,testdatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','c','MarkerSize',cyanmarkersize);
            ylabel(ylabeltext,'FontSize',labelfontsize,'FontWeight','b');
            
            set(gca,'xticklabel', []);
            legendhandle1 = gca;
            ylimits1 = ylim;
            xlimits = xlim;
            set(gca,'FontSize',axesfontsize);hold off;
        subplot(3,1,2);
            errorbar(controldatax2,controldatay2,controldatastd2/2,'-sg','LineWidth',2,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
            hold on;
            errorbar(testdatax2,testdatay2,testdatastd2/2,'-sk','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
            ylabel(ylabeltext,'FontSize',labelfontsize,'FontWeight','b');
            set(gca,'xticklabel', []);
            legendhandle2 = gca;
            ylimits2 = ylim;
            xlim(xlimits);
            set(gca,'FontSize',axesfontsize);hold off;
        subplot(3,1,3);
            errorbar(controldatax3,controldatay3,controldatastd3/2,'-dr','LineWidth',2,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
            hold on;
            errorbar(testdatax3,testdatay3,testdatastd3/2,'-dk','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','m','MarkerSize',magentamarkersize);
            ylabel(ylabeltext,'FontSize',labelfontsize,'FontWeight','b');
            xlabel(xlabeltext,'FontSize',labelfontsize,'FontWeight','b');
            legendhandle3 = gca;
            ylimits3 = ylim;
            xlim(xlimits);
            set(gca,'FontSize',axesfontsize);hold off;
    elseif strcmp(scale,'semilog') == 1
        subplot(3,1,1);
            semilogx(controldatax1,controldatay1,'-ob','LineWidth',2,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',bluemarkersize);
            hold on;
            semilogx(testdatax1,testdatay1,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','c','MarkerSize',cyanmarkersize);
            ylabel(ylabeltext,'FontSize',labelfontsize,'FontWeight','b');
            
            set(gca,'xticklabel', []);
            legendhandle1 = gca;
            ylimits1 = ylim;
            xlimits = xlim;
            set(gca,'FontSize',axesfontsize);hold off;
        subplot(3,1,2);
            semilogx(controldatax2,controldatay2,'-sg','LineWidth',2,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
            hold on;
            semilogx(testdatax2,testdatay2,'-sk','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
            ylabel(ylabeltext,'FontSize',labelfontsize,'FontWeight','b');
            set(gca,'xticklabel', []);
            legendhandle2 = gca;
            ylimits2 = ylim;
            xlim(xlimits);
            set(gca,'FontSize',axesfontsize);hold off;
        subplot(3,1,3);
            semilogx(controldatax3,controldatay3,'-dr','LineWidth',2,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
            hold on;
            semilogx(testdatax3,testdatay3,'-dk','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','m','MarkerSize',magentamarkersize);
            ylabel(ylabeltext,'FontSize',labelfontsize,'FontWeight','b');
            xlabel(xlabeltext,'FontSize',labelfontsize,'FontWeight','b');
            legendhandle3 = gca;
            ylimits3 = ylim;
            xlim(xlimits);
            set(gca,'FontSize',axesfontsize);hold off;
    elseif strcmp(scale,'loglog') == 1
        subplot(3,1,1);
            loglog(controldatax1,controldatay1,'-ob','LineWidth',2,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',bluemarkersize);
            hold on;
            loglog(testdatax1,testdatay1,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','c','MarkerSize',cyanmarkersize);
            ylabel(ylabeltext,'FontSize',labelfontsize,'FontWeight','b');
            
            set(gca,'xticklabel', []);
            legendhandle1 = gca;
            ylimits1 = ylim;
            xlimits = xlim;
            set(gca,'FontSize',axesfontsize);hold off;
        subplot(3,1,2);
            loglog(controldatax2,controldatay2,'-sg','LineWidth',2,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
            hold on;
            loglog(testdatax2,testdatay2,'-sk','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
            ylabel(ylabeltext,'FontSize',labelfontsize,'FontWeight','b');
            set(gca,'xticklabel', []);
            legendhandle2 = gca;
            ylimits2 = ylim;
            xlim(xlimits);
            set(gca,'FontSize',axesfontsize);hold off;
        subplot(3,1,3);
            loglog(controldatax3,controldatay3,'-dr','LineWidth',2,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
            hold on;
            loglog(testdatax3,testdatay3,'-dk','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','m','MarkerSize',magentamarkersize);
            ylabel(ylabeltext,'FontSize',labelfontsize,'FontWeight','b');
            xlabel(xlabeltext,'FontSize',labelfontsize,'FontWeight','b');
            legendhandle3 = gca;
            ylimits3 = ylim;
            xlim(xlimits);
            set(gca,'FontSize',axesfontsize);hold off;
    else
        disp('Error: scale is not defined properly.');
        keyboard
    end

    
    subplotspace('vertical',-15);
    
    [ax,h3]=suplabel('Bifurcation / Termination Analysis'  ,'t');
    set(h3,'FontSize',titlefontsize);
    
    fillscreen;

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
    
    if exist('bifterm','dir')==7
        cd('bifterm');
    else
        mkdir('bifterm');
        cd('bifterm');
    end


    legend(legendhandle1,[controlanalysis.inputfilename ' All' ],[testanalysis.inputfilename ' All'],'Location','NorthEast');
    legend(legendhandle2,[controlanalysis.inputfilename ' Bifs'],[testanalysis.inputfilename ' Bifs'],'Location','NorthEast');
    legend(legendhandle3,[controlanalysis.inputfilename ' Terms'],[testanalysis.inputfilename ' Terms'],'Location','NorthEast');

    if strcmp(sameyscale,'y') == 1
        ymin = [ylimits1(1) ylimits2(1) ylimits3(1)];
        ymax = [ylimits1(2) ylimits2(2) ylimits3(2)];
        ylimits = [min(ymin) max(ymax)];
        ylim(legendhandle1,ylimits);
        ylim(legendhandle2,ylimits);
        ylim(legendhandle3,ylimits);
    end
        

    filename = sprintf('%s_%s_Ind_Bif_Term_%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,versus,measure,scale);
    print('-djpeg',filename); close all;
    %saveas(gcf,filename,'fig');

end
