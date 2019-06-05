function meanstdskewkurtfigure(measure,versus,scale,controlanalysis,testanalysis)
%

titlefontsize = 20;
labelfontsize = 12;
insetfontsize = 10;
sameyscale = 'n';

if nargin == 4

    eval(['controldatax1 = [controlanalysis.bifurcatingcable.distal' versus '.values];']);
    eval(['controldatay1 = [controlanalysis.bifurcatingcable.' measure '.values];']);
    
    eval(['controldatax12 = [controlanalysis.bifurcation.' versus '.' versus '];']);
    eval(['controldatay12 = [controlanalysis.bifurcation.' versus '.' measure '.mean];']);
    eval(['controldatastd12 = [controlanalysis.bifurcation.' versus '.' measure '.std];']);
    
    eval(['controldatax2 = [controlanalysis.bifurcation.' versus '.' versus '];']);
    eval(['controldatay2 = [controlanalysis.bifurcation.' versus '.' measure '.std];']);
    
    eval(['controldatax3 = [controlanalysis.bifurcation.' versus '.' versus '];']);
    for i = 1:length(controldatax3)
        ans = eval(['isempty(controlanalysis.bifurcation.' versus '.' measure '(' int2str(i) ').skew);']);
        if ans == 1
            controldatay3(i) = NaN;
        else
            eval(['controldatay3(' int2str(i) ') = controlanalysis.bifurcation.' versus '.' measure '(' int2str(i) ').skew;']);
        end
    end
    
    eval(['controldatax4 = [controlanalysis.bifurcation.' versus '.' versus '];']);
    for i = 1:length(controldatax4)
        ans = eval(['isempty(controlanalysis.bifurcation.' versus '.' measure '(' int2str(i) ').kurt);']);
        if ans == 1
            controldatay4(i) = NaN;
        else
            eval(['controldatay4(' int2str(i) ') = controlanalysis.bifurcation.' versus '.' measure '(' int2str(i) ').kurt;']);
        end
    end
    


    if strcmp(measure,'rallratio') == 1
        ylabel1text = 'Rall Ratio';
        ylabel2text = 'Mean';
        ylabel3text = 'Standard Deviation';
        ylabel4text = 'Skewness';
        ylabel5text = 'Kurtosis';
    elseif strcmp(measure,'rallratio1') == 1
        ylabel1text = 'Rall Ratio (^{1.0})';
        ylabel2text = 'Mean';
        ylabel3text = 'Standard Deviation';
        ylabel4text = 'Skewness';
        ylabel5text = 'Kurtosis';
    elseif strcmp(measure,'rallratio2') == 1
        ylabel1text = 'Rall Ratio (^{2.0})';
        ylabel2text = 'Mean';
        ylabel3text = 'Standard Deviation';
        ylabel4text = 'Skewness';
        ylabel5text = 'Kurtosis';
    elseif strcmp(measure,'parentdaughterratio') == 1
        ylabel1text = 'Parent/Daughter_1 Ratio';
        ylabel2text = 'Mean';
        ylabel3text = 'Standard Deviation';
        ylabel4text = 'Skewness';
        ylabel5text = 'Kurtosis';
    elseif strcmp(measure,'parentdaughter2ratio') == 1
        ylabel1text = 'Parent/Daughter_2 Ratio';
        ylabel2text = 'Mean';
        ylabel3text = 'Standard Deviation';
        ylabel4text = 'Skewness';
        ylabel5text = 'Kurtosis';
    elseif strcmp(measure,'daughterratio') == 1
        ylabel1text = 'Daughter Ratio';
        ylabel2text = 'Mean';
        ylabel3text = 'Standard Deviation';
        ylabel4text = 'Skewness';
        ylabel5text = 'Kurtosis';
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
        subplot(5,1,1);
            plot(controldatax1,controldatay1,'.b');
            hold on;           
            ylabel(ylabel1text,'FontSize',labelfontsize,'FontWeight','b');
            title(sprintf('%s Pearson Analysis',ylabel1text),'FontSize',titlefontsize,'FontWeight','b');
            set(gca,'xticklabel', []);
            legendhandle1 = gca;
            xlimits = xlim;
            ylimits1 = ylim;
            hold off;
        subplot(5,1,2);
            plot(controldatax12,controldatay12,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',10);
            hold on;
            ylabel(ylabel2text,'FontSize',labelfontsize,'FontWeight','b');
            set(gca,'xticklabel', []);
            legendhandle2 = gca;
            xlim(xlimits);
            ylimits2 = ylim;
            hold off;
        subplot(5,1,3);
            plot(controldatax2,controldatay2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',10);
            hold on;
            ylabel(ylabel3text,'FontSize',labelfontsize,'FontWeight','b');
            set(gca,'xticklabel', []);
            legendhandle2 = gca;
            xlim(xlimits);
            ylimits2 = ylim;
            hold off;
        subplot(5,1,4);
            plot(controldatax3,controldatay3,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',10);
            hold on;
            ylabel(ylabel4text,'FontSize',labelfontsize,'FontWeight','b');
            legendhandle3 = gca;
            xlim(xlimits);
            ylimits3 = ylim;
            hold off;
        subplot(5,1,5);
            plot(controldatax4,controldatay4,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',10);
            hold on;
            ylabel(ylabel5text,'FontSize',labelfontsize,'FontWeight','b');
            xlabel(xlabeltext,'FontSize',labelfontsize,'FontWeight','b');
            legendhandle4 = gca;
            xlim(xlimits);
            ylimits4 = ylim;
            hold off;
    elseif strcmp(scale,'semilog') == 1
        subplot(5,1,1);
            semilogx(controldatax1,controldatay1,'.b');
            hold on;           
            ylabel(ylabel1text,'FontSize',labelfontsize,'FontWeight','b');
            title(sprintf('%s Pearson Analysis',ylabel1text),'FontSize',titlefontsize,'FontWeight','b');
            set(gca,'xticklabel', []);
            legendhandle1 = gca;
            xlimits = xlim;
            ylimits1 = ylim;
            hold off;
        subplot(5,1,2);
            semilogx(controldatax12,controldatay12,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',10);
            hold on;
            ylabel(ylabel2text,'FontSize',labelfontsize,'FontWeight','b');
            set(gca,'xticklabel', []);
            legendhandle2 = gca;
            xlim(xlimits);
            ylimits2 = ylim;
            hold off;
        subplot(5,1,3);
            semilogx(controldatax2,controldatay2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',10);
            hold on;
            ylabel(ylabel3text,'FontSize',labelfontsize,'FontWeight','b');
            set(gca,'xticklabel', []);
            legendhandle2 = gca;
            xlim(xlimits);
            ylimits2 = ylim;
            hold off;
        subplot(5,1,4);
            semilogx(controldatax3,controldatay3,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',10);
            hold on;
            ylabel(ylabel4text,'FontSize',labelfontsize,'FontWeight','b');
            legendhandle3 = gca;
            xlim(xlimits);
            ylimits3 = ylim;
            hold off;
        subplot(5,1,5);
            semilogx(controldatax4,controldatay4,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',10);
            hold on;
            ylabel(ylabel5text,'FontSize',labelfontsize,'FontWeight','b');
            xlabel(xlabeltext,'FontSize',labelfontsize,'FontWeight','b');
            legendhandle4 = gca;
            xlim(xlimits);
            ylimits4 = ylim;
            hold off;
    elseif strcmp(scale,'loglog') == 1
        subplot(5,1,1);
            loglog(controldatax1,controldatay1,'.b');
            hold on;           
            ylabel(ylabel1text,'FontSize',labelfontsize,'FontWeight','b');
            title(sprintf('%s Pearson Analysis',ylabel1text),'FontSize',titlefontsize,'FontWeight','b');
            set(gca,'xticklabel', []);
            legendhandle1 = gca;
            xlimits = xlim;
            ylimits1 = ylim;
            hold off;
        subplot(5,1,2);
            loglog(controldatax12,controldatay12,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',10);
            hold on;
            ylabel(ylabel2text,'FontSize',labelfontsize,'FontWeight','b');
            set(gca,'xticklabel', []);
            legendhandle2 = gca;
            xlim(xlimits);
            ylimits2 = ylim;
            hold off;
        subplot(5,1,3);
            loglog(controldatax2,controldatay2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',10);
            hold on;
            ylabel(ylabel3text,'FontSize',labelfontsize,'FontWeight','b');
            set(gca,'xticklabel', []);
            legendhandle2 = gca;
            xlim(xlimits);
            ylimits2 = ylim;
            hold off;
        subplot(5,1,4);
            loglog(controldatax3,controldatay3,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',10);
            hold on;
            ylabel(ylabel4text,'FontSize',labelfontsize,'FontWeight','b');
            legendhandle3 = gca;
            xlim(xlimits);
            ylimits3 = ylim;
            hold off;
        subplot(5,1,5);
            loglog(controldatax4,controldatay4,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',10);
            hold on;
            ylabel(ylabel5text,'FontSize',labelfontsize,'FontWeight','b');
            xlabel(xlabeltext,'FontSize',labelfontsize,'FontWeight','b');
            legendhandle4 = gca;
            xlim(xlimits);
            ylimits4 = ylim;
            hold off;
    else
        disp('Error: scale is not defined properly.');
        keyboard
    end

    subplotspace('horizontal',-5);
    subplotspace('vertical',-15);
    fillscreen;

    cd(controlanalysis.datapathname);
    
   
    if exist('figures','dir')==7
        cd('figures');
    else
        mkdir('figures');
        cd('figures');
    end


%     legend(legendhandle1,[controlanalysis.inputfilename ' All'],'Location','NorthEast');
%     legend(legendhandle2,[controlanalysis.inputfilename ' Bifs'],'Location','NorthEast');
%     legend(legendhandle3,[controlanalysis.inputfilename ' Terms'],'Location','NorthEast');

    if strcmp(sameyscale,'y') == 1
        ymin = [ylimits1(1) ylimits2(1) ylimits3(1)];
        ymax = [ylimits1(2) ylimits2(2) ylimits3(2)];
        ylimits = [min(ymin) max(ymax)];
        ylim(legendhandle1,ylimits);
        ylim(legendhandle2,ylimits);
        ylim(legendhandle3,ylimits);
    end

    filename = sprintf('%s_meanstdskewkurt_%s_%s_%s',controlanalysis.inputfilename,versus,measure,scale);
    print('-djpeg',filename);
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
            errorbar(controldatax1,controldatay1,controldatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',10);
            hold on;
            errorbar(testdatax1,testdatay1,testdatastd1/2,'-ob','LineWidth',1,'MarkerEdgeColor','b','MarkerFaceColor','w','MarkerSize',10);
            ylabel(ylabeltext,'FontSize',labelfontsize,'FontWeight','b');
            title('Pearson Parameter Analysis','FontSize',titlefontsize,'FontWeight','b');
            set(gca,'xticklabel', []);
            legendhandle1 = gca;
            ylimits1 = ylim;
            xlimits = xlim;
            hold off;
        subplot(3,1,2);
            errorbar(controldatax2,controldatay2,controldatastd2/2,'-sk','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','g','MarkerSize',10);
            hold on;
            errorbar(testdatax2,testdatay2,testdatastd2/2,'-sg','LineWidth',1,'MarkerEdgeColor','g','MarkerFaceColor','w','MarkerSize',10);
            ylabel(ylabeltext,'FontSize',labelfontsize,'FontWeight','b');
            set(gca,'xticklabel', []);
            legendhandle2 = gca;
            ylimits2 = ylim;
            xlim(xlimits);
            hold off;
        subplot(3,1,3);
            errorbar(controldatax3,controldatay3,controldatastd3/2,'-dk','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',10);
            hold on;
            errorbar(testdatax3,testdatay3,testdatastd3/2,'-dr','LineWidth',1,'MarkerEdgeColor','r','MarkerFaceColor','w','MarkerSize',10);
            ylabel(ylabeltext,'FontSize',labelfontsize,'FontWeight','b');
            xlabel(xlabeltext,'FontSize',labelfontsize,'FontWeight','b');
            legendhandle3 = gca;
            ylimits3 = ylim;
            xlim(xlimits);
            hold off;
    elseif strcmp(scale,'semilog') == 1
        subplot(3,1,1);
            semilogx(controldatax1,controldatay1,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',10);
            hold on;
            semilogx(testdatax1,testdatay1,'-ob','LineWidth',1,'MarkerEdgeColor','b','MarkerFaceColor','w','MarkerSize',10);
            ylabel(ylabeltext,'FontSize',labelfontsize,'FontWeight','b');
            title('Pearson Parameter Analysis','FontSize',titlefontsize,'FontWeight','b');
            set(gca,'xticklabel', []);
            legendhandle1 = gca;
            ylimits1 = ylim;
            xlimits = xlim;
            hold off;
        subplot(3,1,2);
            semilogx(controldatax2,controldatay2,'-sk','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','g','MarkerSize',10);
            hold on;
            semilogx(testdatax2,testdatay2,'-sg','LineWidth',1,'MarkerEdgeColor','g','MarkerFaceColor','w','MarkerSize',10);
            ylabel(ylabeltext,'FontSize',labelfontsize,'FontWeight','b');
            set(gca,'xticklabel', []);
            legendhandle2 = gca;
            ylimits2 = ylim;
            xlim(xlimits);
            hold off;
        subplot(3,1,3);
            semilogx(controldatax3,controldatay3,'-dk','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',10);
            hold on;
            semilogx(testdatax3,testdatay3,'-dr','LineWidth',1,'MarkerEdgeColor','r','MarkerFaceColor','w','MarkerSize',10);
            ylabel(ylabeltext,'FontSize',labelfontsize,'FontWeight','b');
            xlabel(xlabeltext,'FontSize',labelfontsize,'FontWeight','b');
            legendhandle3 = gca;
            ylimits3 = ylim;
            xlim(xlimits);
            hold off;
    elseif strcmp(scale,'loglog') == 1
        subplot(3,1,1);
            loglog(controldatax1,controldatay1,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',10);
            hold on;
            loglog(testdatax1,testdatay1,'-ob','LineWidth',1,'MarkerEdgeColor','b','MarkerFaceColor','w','MarkerSize',10);
            ylabel(ylabeltext,'FontSize',labelfontsize,'FontWeight','b');
            title('Pearson Parameter Analysis','FontSize',titlefontsize,'FontWeight','b');
            set(gca,'xticklabel', []);
            legendhandle1 = gca;
            ylimits1 = ylim;
            xlimits = xlim;
            hold off;
        subplot(3,1,2);
            loglog(controldatax2,controldatay2,'-sk','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','g','MarkerSize',10);
            hold on;
            loglog(testdatax2,testdatay2,'-sg','LineWidth',1,'MarkerEdgeColor','g','MarkerFaceColor','w','MarkerSize',10);
            ylabel(ylabeltext,'FontSize',labelfontsize,'FontWeight','b');
            set(gca,'xticklabel', []);
            legendhandle2 = gca;
            ylimits2 = ylim;
            xlim(xlimits);
            hold off;
        subplot(3,1,3);
            loglog(controldatax3,controldatay3,'-dk','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',10);
            hold on;
            loglog(testdatax3,testdatay3,'-dr','LineWidth',1,'MarkerEdgeColor','r','MarkerFaceColor','w','MarkerSize',10);
            ylabel(ylabeltext,'FontSize',labelfontsize,'FontWeight','b');
            xlabel(xlabeltext,'FontSize',labelfontsize,'FontWeight','b');
            legendhandle3 = gca;
            ylimits3 = ylim;
            xlim(xlimits);
            hold off;
    else
        disp('Error: scale is not defined properly.');
        keyboard
    end

    %subplotspace('horizontal',-20);
    subplotspace('vertical',-20);
    fillscreen;

    cd(controlanalysis.datapathname);
    cd ..

    if exist(sprintf('%s_%s_comparison',controlanalysis.inputfilename,controlanalysis.datetime),'dir')==7;
        cd(sprintf('%s_%s_comparison',controlanalysis.inputfilename,controlanalysis.datetime));
    else
        mkdir(sprintf('%s_%s_comparison',controlanalysis.inputfilename,controlanalysis.datetime));
        cd(sprintf('%s_%s_comparison',controlanalysis.inputfilename,controlanalysis.datetime));
    end

    if exist('comparisonfigures','dir')==7
        cd('comparisonfigures');
    else
        mkdir('comparisonfigures');
        cd('comparisonfigures');
    end


    legend(legendhandle1,['All: ' controlanalysis.inputfilename],['All: ' testanalysis.inputfilename],'Location','NorthEast');
    legend(legendhandle2,['Bifs: ' controlanalysis.inputfilename],['Bifs: ' testanalysis.inputfilename],'Location','NorthEast');
    legend(legendhandle3,['Terms: ' controlanalysis.inputfilename],['Terms: ' testanalysis.inputfilename],'Location','NorthEast');

    if strcmp(sameyscale,'y') == 1
        ymin = [ylimits1(1) ylimits2(1) ylimits3(1)];
        ymax = [ylimits1(2) ylimits2(2) ylimits3(2)];
        ylimits = [min(ymin) max(ymax)];
        ylim(legendhandle1,ylimits);
        ylim(legendhandle2,ylimits);
        ylim(legendhandle3,ylimits);
    end
        

    filename = sprintf('%s_%s_%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,versus,measure,scale);
    print('-dmeta',filename);
    saveas(gcf,filename,'fig');

end
