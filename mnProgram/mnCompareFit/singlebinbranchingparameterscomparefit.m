function singlebinbranchingparametersfitter(controlanalysis,testanalysis,mncomparefitoption)

disp('     Single Bin Branching Parameters.');
%mncomparefitoptions_none;

currentdirectory = cd;
cd(controlanalysis.datapathname);
cd ..

if exist(sprintf('%s_%s_comparison',controlanalysis.inputfilename,testanalysis.inputfilename),'dir')==7;
	cd(sprintf('%s_%s_comparison',controlanalysis.inputfilename,testanalysis.inputfilename));
else
	mkdir(sprintf('%s_%s_comparison',controlanalysis.inputfilename,testanalysis.inputfilename));
	cd(sprintf('%s_%s_comparison',controlanalysis.inputfilename,testanalysis.inputfilename));
end

if exist('comparisonfits','dir')==7
    cd('comparisonfits');
else
    mkdir('comparisonfits');
    cd('comparisonfits');
end
mainfolder = cd;
figurecount = 0;

measures = {'rallratio','rallratio1','rallratio2','rallratio3','parentdaughterratio','parentdaughter2ratio','daughterratio'};
measureslabels = {'Rall Ratio (D^{1.5})','Rall Ratio (D^{1.0})','Rall Ratio (D^{2.0})','Rall Ratio (D^{3.0})','Parent / Daughter_1 Ratio','Parent / Daughter_2 Ratio','Daughter Ratio'};
measurestokeep = [false false false false false false false];
for measurescount = 1:length(measures)
    eval(['currentmeasure = mncomparefitoption.' measures{measurescount} '.fit;']);
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

    versuses  = {'diameter','pathlength','radialdistance','branchlength'}; %,'branchorder'};
	versuseslabels = {'Diameter (\mum)','Path Length from Soma (\mum)','Radial Distance from Soma (\mum)','Branch Length (\mum)'}; %,'Branch Order'};
	versusestitles = {'Diameter','Path Length','Radial Distance','Branch Length'}; %,'Branch Order'};
	versusestokeep = [false false false false]; % false];
	eval(['currentoption = mncomparefitoption.' parentmeasure ';']);
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
	% if strcmp(currentoption.branchorder.fit,'y')
		% versusestokeep(5) = true;
	% end
	versuses = versuses(versusestokeep);
	versuseslabels = versuseslabels(versusestokeep);
	versusestitles = versusestitles(versusestokeep);

    statistics = {'mean','std','skew','kurt'};
    statisticslabels = {'Mean','Standard Deviation','Skewness','Kurtosis'};
	statisticsfolders = {'1_mean','2_std','3_skew','4_kurt'};
    statisticstokeep = [false false false false];
    eval(['currentoption = mncomparefitoption.' parentmeasure ';']);
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
    fitstokeep = [false false false false false false];
	eval(['currentoption = mncomparefitoption.' parentmeasure ';']);
	if strcmp(currentoption.singlebins.linear,'y')
		fitstokeep(1) = true;
	end
	if strcmp(currentoption.singlebins.exponential,'y')
		fitstokeep(2) = true;
	end
	if strcmp(currentoption.singlebins.exponentialoffset,'y')
		fitstokeep(3) = true;
	end
	if strcmp(currentoption.singlebins.power,'y')
		fitstokeep(4) = true;
	end
	if strcmp(currentoption.singlebins.poweroffset,'y')
		fitstokeep(5) = true;
	end
	if strcmp(currentoption.singlebins.sigmoid,'y')
		fitstokeep(6) = true;
	end
	fits = fits(fitstokeep);
	fitslabels = fitslabels(fitstokeep);
	
	fittypes = {'unweighted','weighted','robust','robustweighted'};
    fittypeslabels = {'Unweighted Fit','Weighted Fit','Robust Fit','Robust Weighted Fit'};
    fittypestokeep = [false false false false false false];
	eval(['currentoption = mncomparefitoption.' parentmeasure ';']);
	if strcmp(currentoption.singlebins.unweighted,'y')
		fittypestokeep(1) = true;
	end
	if strcmp(currentoption.singlebins.weighted,'y')
		fittypestokeep(2) = true;
	end
	if strcmp(currentoption.singlebins.robust,'y')
		fittypestokeep(3) = true;
	end
	if strcmp(currentoption.singlebins.robustweighted,'y')
		fittypestokeep(4) = true;
	end
	fittypes = fittypes(fittypestokeep);
	fittypeslabels = fittypeslabels(fittypestokeep);
	
	controlmarker = {'''bo'',''MarkerFaceColor'',''b'',''MarkerSize'',10'};
	testmarker = {'''ko'',''MarkerFaceColor'',''c'',''MarkerSize'',6'};
	controlfitstyle = {'''-b'',''LineWidth'',6'};
	testfitstyle = {'''-c'',''LineWidth'',4'};
	
    %legendtext(1) = {sprintf('%s Data',analysis.inputfilename)};
    parameterlabels = char('         P_1: ','         P_2: ','         P_3: ','         P_4: ');
    figurecount = 0;


    for h = 1:length(versuses)
        versus = versuses{h};
        versuslabel = versuseslabels{h};
        versustitle = versusestitles{h};

        for i = 1:length(statistics)
            statistic = statistics{i};
            statisticlabel = statisticslabels{i};
			statisticfolder = statisticsfolders{i};

            eval(['controlx = [controlanalysis.' versus '.' versus ']'';']);
            eval(['controly = [controlanalysis.' versus '.' measure '.' statistic ']'';']);
            eval(['controlweight = [controlanalysis.' versus '.numberbifurcations.total]'';']);
			
			eval(['testx = [testanalysis.' versus '.' versus ']'';']);
            eval(['testy = [testanalysis.' versus '.' measure '.' statistic ']'';']);
            eval(['testweight = [testanalysis.' versus '.numberbifurcations.total]'';']);
            
			if strcmp(statistic,'std')
				for value = 1:length(controly)
					if controly(value) == 0
						controly(value) = NaN;
					end
				end
				for value = 1:length(testy)
					if testy(value) == 0
						testy(value) = NaN;
					end
				end
			end
				
			controlweight = controlweight(isfinite(controly));
            controlx      = controlx(isfinite(controly));
            controly      = controly(isfinite(controly));
			
			testweight = testweight(isfinite(testy));
            testx      = testx(isfinite(testy));
            testy      = testy(isfinite(testy));
			
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
			eval(['plot(controlx,controly,' controlmarker{1} ');']);
			hold on;
			eval(['plot(testx,testy,' testmarker{1} ');']);
			ylimits = ylim;
			xlabel(versuslabel,'FontSize',8,'FontWeight','b');
			ylabel([measurelabel ' ' statisticlabel],'FontSize',8,'FontWeight','b');
			title(char(' ',[measurelabel ' ' statisticlabel  ' vs ' versustitle],' '),'FontSize',12,'FontWeight','b');
			legend(controlanalysis.inputfilename,testanalysis.inputfilename);
			set(gca,'FontSize',6);
			filename = sprintf('%s_%s_1_SingleBin_%s_%s_vs_%s',controlanalysis.inputfilename,testanalysis.inputfilename,measure,statisticfolder,versus);
			print('-djpeg',filename);
			set(gca,'YScale','log');
			filename = sprintf('%s_%s_1_SingleBin_%s_%s_vs_%s_logy',controlanalysis.inputfilename,testanalysis.inputfilename,measure,statisticfolder,versus);
			print('-djpeg',filename);
			set(gca,'XScale','log');
			filename = sprintf('%s_%s_1_SingleBin_%s_%s_vs_%s_logy_logx',controlanalysis.inputfilename,testanalysis.inputfilename,measure,statisticfolder,versus);
			print('-djpeg',filename);
			
			eval(['currentoption = mncomparefitoption.' parentmeasure ';']);
			if strcmp(currentoption.singlebins,'y') == 1
			
				for j = 1:length(fits)
					fit = fits{j};
					fitlabel = fitslabels{j};

					for k = 1:length(fittypes)
						fittype = fittypes{k};
						fitstyle = fitstyles{k};
						fittypelabel = fittypeslabels{k};
					
						figure;
						eval(['plot(controlx,controly,' controlmarker{1} ');']);
						hold on;
						ylimits = ylim;
						xlabel(versuslabel,'FontSize',8,'FontWeight','b');
						ylabel([measurelabel ' ' statisticlabel],'FontSize',8,'FontWeight','b');
						title(char(' ',[measurelabel ' ' statisticlabel  ' vs ' versustitle ' -- ' fitlabel],' '),'FontSize',12,'FontWeight','b');
						set(gca,'FontSize',6);
						hold on;

						eval(['[controlparameter controlrmse] = ' fit 'fitter' fittype '(controlx,controly,controlweight);']);
						eval(['[testparameter testrmse] = ' fit 'fitter' fittype '(testx,testy,testweight);']);
						

						controlfity = fitter(fit,controlparameter,controlx);
						eval(['plot(controlx,controlfity,' controlfitstyle{1} ');']);
						
						eval(['plot(testx,testy,' testmarker{1} ');']);
						testfity = fitter(fit,testparameter,testx);
						eval(['plot(testx,testfity,' testfitstyle{1} ');']);
						
						ylim(ylimits);
						
						controlparameterlabel = parameterlabels(1:length(controlparameter),:);
						controlparametervalues = num2str(controlparameter','%.3e');
						testparameterlabel = parameterlabels(1:length(testparameter),:);
						testparametervalues = num2str(testparameter','%.3e');
						controlparameterlegend = [controlparameterlabel controlparametervalues];
						controlrmselegend = sprintf('    rmse: %.3e',controlrmse(1));
						testparameterlegend = [testparameterlabel testparametervalues];
						testrmselegend = sprintf('    rmse: %.3e',testrmse(1));
						
						legendtext{1} = controlanalysis.inputfilename;
						legendtext{2} = char(' ',fittypelabel,' ',controlparameterlegend,controlrmselegend);
						legendtext{3} = testanalysis.inputfilename;
						legendtext{4} = char(' ',fittypelabel,' ',testparameterlegend,testrmselegend);
						
						eval(['plot(controlx,controly,' controlmarker{1} ');']);
						eval(['plot(testx,testy,' testmarker{1} ');']);
						legend(legendtext,'Location','NorthEastOutside');
					
					end

					%plot(x,y,'bo','MarkerFaceColor','b');
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
					
					filename = sprintf('%s_%s_%s_%s_vs_%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,measure,statisticfolder,versus,fit,fittype);
					print('-djpeg',filename);
					set(gca,'YScale','log');
					filename = sprintf('%s_%s_%s_vs_%s_%s_%s_logy',controlanalysis.inputfilename,testanalysis.inputfilename,measure,statisticfolder,versus,fit,fittype);
					print('-djpeg',filename);
					set(gca,'XScale','log');
					filename = sprintf('%s_%s_%s_vs_%s_%s_%s_logy_logx',controlanalysis.inputfilename,testanalysis.inputfilename,measure,statisticfolder,versus,fit,fittype);
					print('-djpeg',filename);
					cd(mainfolder);
					if strcmp(mncomparefitoption.figuresopen,'n'); close all; end;
				end
            end
        end
    end
end

