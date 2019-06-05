function parameterfits = singlebinbranchingparametersfitter(analysis,parameterfits,mnfitteroption)

disp('     Single Bin Branching Parameters.');
%mnfitteroptions;

measures = {'rallratio','rallratio1','rallratio2','rallratio3','parentdaughterratio','parentdaughter2ratio','daughterratio'};
measureslabels = {'Rall Ratio (D^{1.5})','Rall Ratio (D^{1.0})','Rall Ratio (D^{2.0})','Rall Ratio (D^{3.0})','Parent / Daughter_1 Ratio','Parent / Daughter_2 Ratio','Daughter Ratio'};
measurestokeep = [false false false false false false false];
for measurescount = 1:length(measures)
    eval(['currentmeasure = mnfitteroption.' measures{measurescount} '.fit;']);
    if strcmp(currentmeasure,'y')
        measurestokeep(measurescount) = true;
    end
end
measures = measures(measurestokeep);
measureslabels = measureslabels(measurestokeep);

for g = 1:length(measures)
    measure = measures{g};
    measurelabel = measureslabels{g};
	
	if strcmp(measure,'rallratio') || strcmp(measure,'rallratio1') || strcmp(measure,'rallratio2') || strcmp(measure,'rallratio3')
        parentmeasure = 'rallratio';
    elseif strcmp(measure,'parentdaughterratio') || strcmp(measure,'parentdaughter2ratio')
        parentmeasure = 'parentdaughterratio';
    elseif strcmp(measure,'daughterratio')
        parentmeasure = 'daughterratio';
    end

    versuses  = {'diameter','pathlength','radialdistance'};
	versuseslabels = {'Diameter (\mum)','Path Length from Soma (\mum)','Radial Distance from Soma (\mum)'};
	versusestitles = {'Diameter','Path Length','Radial Distance'};
	versusestokeep = [false false false];
	eval(['currentoption = mnfitteroption.' parentmeasure ';']);
	if strcmp(currentoption.diameter.fit,'y')
		versusestokeep(1) = true;
	end
	if strcmp(currentoption.pathlength.fit,'y')
		versusestokeep(2) = true;
	end
	if strcmp(currentoption.radialdistance.fit,'y')
		versusestokeep(3) = true;
	end
	versuses = versuses(versusestokeep);
	versuseslabels = versuseslabels(versusestokeep);
	versusestitles = versusestitles(versusestokeep);

    statistics = {'mean','std','skew','kurt'};
    statisticslabels = {'Mean','Standard Deviation','Skewness','Kurtosis'};
    statisticstokeep = [false false false false];
    
    eval(['currentoption = mnfitteroption.' parentmeasure ';']);
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

    fits = {'linear','exponential','power','sigmoid'};
    fitslabels = {'Linear Fits','Exponential Fits','Power Fits','Sigmoid Fits'};
    fittypes = {'unweighted','weighted','robust','robustweighted'};
    fittypeslabels = {'Unweighted Fit','Weighted Fit','Robust Fit','Robust Weighted Fit'};
    fitstyles = {'''-c'',''LineWidth'',6','''--y'',''LineWidth'',5','''-.m'',''LineWidth'',4',''':k'',''LineWidth'',3'};

    legendtext(1) = {sprintf('%s Data',analysis.inputfilename)};
    parameterlabels = char('         P_1: ','         P_2: ','         P_3: ','         P_4: ');
    figurecount = 0;

    cd(analysis.datapathname);
    if exist('figures','dir')==7
        cd('figures');
    else
        mkdir('figures');
        cd('figures');
    end
    if exist('basicparameters','dir')==7
        cd('basicparameters');
    else
        mkdir('basicparameters');
        cd('basicparameters');
    end
    mainfolder = cd;


    for h = 1:length(versuses)
        versus = versuses{h};
        versuslabel = versuseslabels{h};
        versustitle = versusestitles{h};

        for i = 1:length(statistics)
            statistic = statistics{i};
            statisticlabel = statisticslabels{i};

            eval(['x = [analysis.' versus '.' versus ']'';']);
            eval(['y = [analysis.' versus '.' measure '.' statistic ']'';']);
            eval(['weight = [analysis.' versus '.length.total]'';']);
            weight = weight(isfinite(y));
            x      = x(isfinite(y));
            y      = y(isfinite(y));
			
			cd(mainfolder);
			if exist(sprintf(measure),'dir')==7
				cd(sprintf(measure));
			else
				mkdir(sprintf(measure));
				cd(sprintf(measure));
			end
			if exist(sprintf(statistic),'dir')==7
				cd(sprintf(statistic));
			else
				mkdir(sprintf(statistic));
				cd(sprintf(statistic));
			end
			figure;
			plot(x,y,'bo','MarkerFaceColor','b');
			ylimits = ylim;
			xlabel(versuslabel,'FontSize',8,'FontWeight','b');
			ylabel([measurelabel ' ' statisticlabel],'FontSize',8,'FontWeight','b');
			title(char(' ',[measurelabel ' ' statisticlabel  ' vs ' versustitle],' '),'FontSize',12,'FontWeight','b');
			set(gca,'FontSize',6);
			filename = sprintf('%s_1_SingleBin_%s_%s_vs_%s',analysis.inputfilename,measure,statistic,versus);
			print('-djpeg',filename);
			set(gca,'YScale','log');
			filename = sprintf('%s_1_SingleBin_%s_%s_vs_%s_logy',analysis.inputfilename,measure,statistic,versus);
			print('-djpeg',filename);
			set(gca,'XScale','log');
			filename = sprintf('%s_1_SingleBin_%s_%s_vs_%s_logy_logx',analysis.inputfilename,measure,statistic,versus);
			print('-djpeg',filename);
			
			eval(['currentoption = mnfitteroption.' parentmeasure ';']);
			if strcmp(currentoption.singlebins,'y') == 1
			
				for j = 1:length(fits)
					fit = fits{j};
					fitlabel = fitslabels{j};

					figure;
					plot(x,y,'bo','MarkerFaceColor','b');
					ylimits = ylim;
					xlabel(versuslabel,'FontSize',8,'FontWeight','b');
					ylabel([measurelabel ' ' statisticlabel],'FontSize',8,'FontWeight','b');
					title(char(' ',[measurelabel ' ' statisticlabel  ' vs ' versustitle ' -- ' fitlabel],' '),'FontSize',12,'FontWeight','b');
					set(gca,'FontSize',6);
					hold on;

					for k = 1:length(fittypes)
						fittype = fittypes{k};
						fitstyle = fitstyles{k};
						fittypelabel = fittypeslabels{k};

						eval(['[parameter rmse] = ' fit 'fitter' fittype '(x,y,weight);']);
						eval(['parameterfits.' measure '.' statistic '.' versus '.' fit '.' fittype '.parameter = parameter;']);
						eval(['parameterfits.' measure '.' statistic '.' versus '.' fit '.' fittype '.rmse = rmse;']);

						fity = fitter(fit,parameter,x);
						eval(['plot(x,fity,' fitstyle ');']);
						ylim(ylimits);
						parameterlabel = parameterlabels(1:length(parameter),:);
						parametervalues = num2str(parameter','%.3e');
						parameterlegend = [parameterlabel parametervalues];
						rmselegend = sprintf('    rmse: %.3e',rmse(1));
						totallegend = char(' ',fittypelabel,' ',parameterlegend,rmselegend);
						legendtext(k+1) = {totallegend};

					end

					plot(x,y,'bo','MarkerFaceColor','b');
					figurecount = figurecount + 1;
					%fillscreen;
					legend(legendtext,'Location','NorthEastOutside');
					cd(mainfolder);
					if exist(sprintf(measure),'dir')==7
						cd(sprintf(measure));
					else
						mkdir(sprintf(measure));
						cd(sprintf(measure));
					end
					if exist(sprintf(statistic),'dir')==7
						cd(sprintf(statistic));
					else
						mkdir(sprintf(statistic));
						cd(sprintf(statistic));
					end
					if exist('singlebinfits','dir')==7
						cd('singlebinfits');
					else
						mkdir('singlebinfits');
						cd('singlebinfits');
					end
					
					filename = sprintf('%s_ParameterFits_%03d_%s_%s_vs_%s_%s',analysis.inputfilename,figurecount,measure,statistic,versus,fit);
					print('-djpeg',filename);
					set(gca,'YScale','log');
					filename = sprintf('%s_ParameterFits_%03d_%s_%s_vs_%s_%s_logy',analysis.inputfilename,figurecount,measure,statistic,versus,fit);
					print('-djpeg',filename);
					set(gca,'XScale','log');
					filename = sprintf('%s_ParameterFits_%03d_%s_%s_vs_%s_%s_logy_logx',analysis.inputfilename,figurecount,measure,statistic,versus,fit);
					print('-djpeg',filename);
					cd(mainfolder);
					if strcmp(mnfitteroption.figuresopen,'n'); close all; end;
				end
            end
        end
    end
end

