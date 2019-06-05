function parameterfits = singlebinbiftermtaperratefitter(analysis,parameterfits,mnfitteroption)

disp('     Single Bin Bif/Term Taper Rate.');
%mnfitteroptions;

piecetypes{1} = 'soma';
piecetypes{2} = 'axon';
piecetypes{3} = 'dendrite';
piecetypes{4} = 'apical';

piecetitles{1} = 'Somatic';
piecetitles{2} = 'Axonal';
piecetitles{3} = 'Dendritic';
piecetitles{4} = 'Apical';

weightvar = mnfitteroption.weight;

for piecetype = 2:4
    
    eval(['fittypeoption = mnfitteroption.' piecetypes{piecetype} ';']);
    
    if isfield(analysis,piecetypes{piecetype}) && strcmp(fittypeoption,'y')
        
        eval(['typeanalysis = analysis.' piecetypes{piecetype} ';']);
        
        measures = {'taperrate'};
        measureslabels = {'Taper Rate'};
        
        branches = {'bifurcation','termination'};
        brancheslabels = {'Bifurcation','Termination'};
        branchesmarkers = {'''gs'',''MarkerFaceColor'',''g''','''rd'',''MarkerFaceColor'',''r'''};
        branchestokeep = [false false];
        eval(['currentoption = mnfitteroption.' measures{1} ';']);
        if strcmp(currentoption.bifurcation,'y')
            branchestokeep(1) = true;
        end
        if strcmp(currentoption.termination,'y')
            branchestokeep(2) = true;
        end
        branches = branches(branchestokeep);
        brancheslabels = brancheslabels(branchestokeep);
        branchesmarkers = branchesmarkers(branchestokeep);
        
        versuses  = {'diameter','pathlength','radialdistance','branchlength','branchorder'};
        versuseslabels = {'Diameter (\mum)','Path Length from Soma (\mum)','Radial Distance from Soma (\mum)','Branch Length (\mum)','Branch Order'};
        versusestitles = {'Diameter','Path Length','Radial Distance','Branch Length','Branch Order'};
        versusestokeep = [false false false false false];
        eval(['currentoption = mnfitteroption.' measures{1} ';']);
        if strcmp(currentoption.diameter.fit,'y')
            versusestokeep(1) = true;
        end
        if strcmp(currentoption.pathlength.fit,'y')
            versusestokeep(2) = true;
        end
        if strcmp(currentoption.radialdistance.fit,'y')
            versusestokeep(3) = true;
        end
        if strcmp(currentoption.branchlength.fit,'y')
            versusestokeep(4) = true;
        end
        if strcmp(currentoption.branchorder.fit,'y')
            versusestokeep(5) = true;
        end
        versuses = versuses(versusestokeep);
        versuseslabels = versuseslabels(versusestokeep);
        versusestitles = versusestitles(versusestokeep);
        
        statistics = {'mean','std','skew','kurt'};
        statisticslabels = {'Mean','Standard Deviation','Skewness','Kurtosis'};
        statisticsfolders = {'1_mean','2_std','3_skew','4_kurt'};
        statisticstokeep = [false false false false];
        eval(['currentoption = mnfitteroption.' measures{1} ';']);
        if strcmp(currentoption.mean,'y')
            statisticstokeep(1) = true;
        end
        if strcmp(currentoption.std,'y')
            statisticstokeep(2) = true;
        end
        if strcmp(currentoption.skew,'y')
            statisticstokeep(3) = true;
        end
        if strcmp(currentoption.kurt,'y')
            statisticstokeep(4) = true;
        end
        statistics = statistics(statisticstokeep);
        statisticslabels = statisticslabels(statisticstokeep);
        statisticsfolders = statisticsfolders(statisticstokeep);
        
        fits = {'linear','exponential','exponentialoffset','power','poweroffset','sigmoid'};
        fitslabels = {'Linear Fits','Exponential Fits','Exponential Offset Fits','Power Fits','Power Offset Fits','Sigmoid Fits'};
        fittypes = {'unweighted','weighted','robust','robustweighted'};
        fittypeslabels = {'Unweighted Fit','Weighted Fit','Robust Fit','Robust Weighted Fit'};
        fitstyles = {'''-c'',''LineWidth'',6','''--y'',''LineWidth'',5','''-.m'',''LineWidth'',4',''':k'',''LineWidth'',3'};
        
        legendtext(1) = {sprintf('%s Data',analysis.inputfilename)};
        parameterlabels = char('         P_1: ','         P_2: ','         P_3: ','         P_4: ');
        figurecount = 0;
        
        cd(analysis.datapathname);
        if exist(piecetypes{piecetype},'dir')==7
            cd(piecetypes{piecetype});
        else
            mkdir(piecetypes{piecetype});
            cd(piecetypes{piecetype});
        end
        if exist('basicparameters','dir')==7
            cd('basicparameters');
        else
            mkdir('basicparameters');
            cd('basicparameters');
        end
        mainfolder = cd;
        
        
        for f = 1:length(branches)
            branch = branches{f};
            branchlabel = brancheslabels{f};
            branchmarker = branchesmarkers{f};
            
            if strcmp(weightvar,'numbersegments')
                weightvar = ['number' branch 's'];
            end
            
            for g = 1:length(measures)
                measure = measures{g};
                measurelabel = measureslabels{g};
                
                for h = 1:length(versuses)
                    versus = versuses{h};
                    versuslabel = versuseslabels{h};
                    versustitle = versusestitles{h};
                    
                    for i = 1:length(statistics)
                        statistic = statistics{i};
                        statisticlabel = statisticslabels{i};
                        statisticfolder = statisticsfolders{i};
                        
                        eval(['x = [typeanalysis.' branch '.' versus '.' versus ']'';']);
                        eval(['y = [typeanalysis.' branch '.' versus '.' measure '.' statistic ']'';']);
                        eval(['weight = [typeanalysis.' branch '.' versus '.' weightvar '.mean]'';']);
                        
                        if strcmp(statistic,'std')
                            for value = 1:length(y)
                                if y(value) == 0
                                    y(value) = NaN;
                                end
                            end
                        end
                        
                        weight = weight(isfinite(y));
                        x      = x(isfinite(y));
                        y      = y(isfinite(y));
                        
                        cd(mainfolder);
                        if exist(sprintf('%s_%s',measure,branch),'dir')==7
                            cd(sprintf('%s_%s',measure,branch));
                        else
                            mkdir(sprintf('%s_%s',measure,branch));
                            cd(sprintf('%s_%s',measure,branch));
                        end
                        if exist(sprintf(statisticfolder),'dir')==7
                            cd(sprintf(statisticfolder));
                        else
                            mkdir(sprintf(statisticfolder));
                            cd(sprintf(statisticfolder));
                        end
                        
                        figure;
                        eval(['plot(x,y,' branchmarker ');']);
                        ylimits = ylim;
                        xlabel(versuslabel,'FontSize',8,'FontWeight','b');
                        ylabel([measurelabel ' ' statisticlabel],'FontSize',8,'FontWeight','b');
                        title(char(' ',[piecetitles{piecetype} ' ' branchlabel ' ' measurelabel ' ' statisticlabel  ' vs ' versustitle],' '),'FontSize',12,'FontWeight','b');
                        set(gca,'FontSize',6);
                        filename = sprintf('%s_%s_1_SingleBin_%s_%s_%s_vs_%s',analysis.inputfilename,piecetitles{piecetype},branch,measure,statistic,versus);
                        print('-djpeg',filename);
                        set(gca,'YScale','log');
                        filename = sprintf('%s_%s_1_SingleBin_%s_%s_%s_vs_%s_logy',analysis.inputfilename,piecetitles{piecetype},branch,measure,statistic,versus);
                        print('-djpeg',filename);
                        set(gca,'XScale','log');
                        filename = sprintf('%s_%s_1_SingleBin_%s_%s_%s_vs_%s_logy_logx',analysis.inputfilename,piecetitles{piecetype},branch,measure,statistic,versus);
                        print('-djpeg',filename);
                        
                        eval(['currentoption = mnfitteroption.' measure ';']);
                        if strcmp(currentoption.singlebins,'y') == 1
                            
                            for j = 1:length(fits)
                                fit = fits{j};
                                fitlabel = fitslabels{j};
                                
                                figure;  figurecount = figurecount + 1;
                                eval(['plot(x,y,' branchmarker ');']);
                                ylimits = ylim;
                                xlabel(versuslabel,'FontSize',8,'FontWeight','b');
                                ylabel([measurelabel ' ' statisticlabel],'FontSize',8,'FontWeight','b');
                                title(char(' ',[piecetitles{piecetype} ' ' branchlabel ' ' measurelabel ' ' statisticlabel  ' vs ' versustitle ' -- ' fitlabel],' '),'FontSize',12,'FontWeight','b');
                                set(gca,'FontSize',6);
                                hold on;
                                
                                try
                                    
                                    for k = 1:length(fittypes)
                                        fittype = fittypes{k};
                                        fitstyle = fitstyles{k};
                                        fittypelabel = fittypeslabels{k};
                                        
                                        eval(['[parameter rmse] = ' fit 'fitter' fittype '(x,y,weight);']);
                                        eval(['parameterfits.' branch  measure '.' statistic '.' versus '.' fit '.' fittype '.parameter = parameter;']);
                                        eval(['parameterfits.' branch  measure '.' statistic '.' versus '.' fit '.' fittype '.rmse = rmse;']);
                                        
                                        fity = fitter(fit,parameter,x);
                                        eval(['plot(x,fity,' fitstyle ');']);
                                        ylim(ylimits);
                                        parameterlabel = parameterlabels(1:length(parameter),:);
                                        parametervalues = num2str(parameter','%.3e');
                                        parameterlegend = [parameterlabel parametervalues];
                                        rmselegend  = sprintf('      rmse: %.3e',rmse(1));
                                        wrmselegend = sprintf('  rmse-w: %.3e',rmse(2));
                                        totallegend = char(' ',fittypelabel,' ',parameterlegend,rmselegend,wrmselegend);
                                        legendtext(k+1) = {totallegend};
                                    end
                                    
                                catch tapererror
                                    disp(' ');
                                    disp('   Warning: not able to perform fit (singlebinbiftermtaperratefitter).');
                                    disp(' ');
                                    continue
                                end
                                
                                eval(['plot(x,y,' branchmarker ');']);
                                %fillscreen;
                                legend(legendtext,'Location','NorthEastOutside');
                                cd(mainfolder);
                                if exist(sprintf('%s_%s',measure,branch),'dir')==7
                                    cd(sprintf('%s_%s',measure,branch));
                                else
                                    mkdir(sprintf('%s_%s',measure,branch));
                                    cd(sprintf('%s_%s',measure,branch));
                                end
                                if exist(sprintf(statisticfolder),'dir')==7
                                    cd(sprintf(statisticfolder));
                                else
                                    mkdir(sprintf(statisticfolder));
                                    cd(sprintf(statisticfolder));
                                end
                                if exist('singlebinfits','dir')==7
                                    cd('singlebinfits');
                                else
                                    mkdir('singlebinfits');
                                    cd('singlebinfits');
                                end
                                filename = sprintf('%s_%s_%03d_%s_%s_%s_vs_%s_%s',analysis.inputfilename,piecetitles{piecetype},figurecount,branch,measure,statistic,versus,fit);
                                print('-djpeg',filename);
                                set(gca,'YScale','log');
                                filename = sprintf('%s_%s_%03d_%s_%s_%s_vs_%s_%s_logy',analysis.inputfilename,piecetitles{piecetype},figurecount,branch,measure,statistic,versus,fit);
                                print('-djpeg',filename);
                                set(gca,'XScale','log');
                                filename = sprintf('%s_%s_%03d_%s_%s_%s_vs_%s_%s_logy_logx',analysis.inputfilename,piecetitles{piecetype},figurecount,branch,measure,statistic,versus,fit);
                                print('-djpeg',filename);
                                cd(mainfolder);
                                if strcmp(mnfitteroption.figuresopen,'n'); close all; end;
                            end
                        end
                    end
                end
            end
        end
        
    end
end