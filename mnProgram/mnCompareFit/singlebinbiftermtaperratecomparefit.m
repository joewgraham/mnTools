function singlebinbiftermtaperratecomparefit(controlanalysis,testanalysis,mncomparefitoption)

disp('     Single Bin Bif/Term Taper Rate.');
%mncomparefitoptions;

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
% if exist('taperrate','dir')==7
    % cd('taperrate');
% else
    % mkdir('taperrate');
    % cd('taperrate');
% end
mainfolder = cd;
figurecount = 0;


measures = {'taperrate'};
measureslabels = {'Taper Rate'};

branches = {'bifurcation','termination'};
brancheslabels = {'Bifurcation','Termination'};
controlbranchesmarkers = {'''ks'',''MarkerFaceColor'',''g'',''MarkerSize'',10','''kd'',''MarkerFaceColor'',''r'',''MarkerSize'',10'};
testbranchesmarkers = {'''ks'',''MarkerFaceColor'',''y'',''MarkerSize'',6','''kd'',''MarkerFaceColor'',''m'',''MarkerSize'',6'};
controlfitstyles = {'''-g'',''LineWidth'',6','''-r'',''LineWidth'',6'};
testfitstyles = {'''-y'',''LineWidth'',4','''-m'',''LineWidth'',4'};
branchestokeep = [false false];
eval(['currentoption = mncomparefitoption.' measures{1} ';']);
if strcmp(currentoption.bifurcation,'y')
    branchestokeep(1) = true;
end
if strcmp(currentoption.termination,'y')
    branchestokeep(2) = true;
end
branches = branches(branchestokeep);
brancheslabels = brancheslabels(branchestokeep);
controlbranchesmarkers = controlbranchesmarkers(branchestokeep);
testbranchesmarkers = testbranchesmarkers(branchestokeep);
controlfitstyles = controlfitstyles(branchestokeep);
testfitstyles = testfitstyles(branchestokeep);


versuses  = {'diameter','pathlength','radialdistance','branchlength'};
versuseslabels = {'Diameter (\mum)','Path Length from Soma (\mum)','Radial Distance from Soma (\mum)','Branch Length (\mum)'};
versusestitles = {'Diameter','Path Length','Radial Distance','Branch Length'};
versusestokeep = [false false false false];
eval(['currentoption = mncomparefitoption.' measures{1} ';']);
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
versuses = versuses(versusestokeep);
versuseslabels = versuseslabels(versusestokeep);
versusestitles = versusestitles(versusestokeep);

statistics = {'mean','std','skew','kurt'};
statisticslabels = {'Mean','Standard Deviation','Skewness','Kurtosis'};
statisticsfolders = {'1_mean','2_std','3_skew','4_kurt'};
statisticstokeep = [false false false false];
eval(['currentoption = mncomparefitoption.' measures{1} ';']);
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
eval(['currentoption = mncomparefitoption.' measures{1} ';']);
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
eval(['currentoption = mncomparefitoption.' measures{1} ';']);
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

parameterlabels = char('         P_1: ','         P_2: ','         P_3: ','         P_4: ');     

for f = 1:length(branches)
    branch = branches{f};
    branchlabel = brancheslabels{f};
    controlbranchmarker = controlbranchesmarkers{f};
	testbranchmarker = testbranchesmarkers{f};
	controlfitstyle = controlfitstyles{f};
	testfitstyle = testfitstyles{f};

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

                eval(['controlx = [controlanalysis.' branch '.' versus '.' versus ']'';']);
                eval(['controly = [controlanalysis.' branch '.' versus '.' measure '.' statistic ']'';']);
                eval(['controlweight = [controlanalysis.' branch '.' versus '.length.total]'';']);
                controlweight = controlweight(isfinite(controly));
                controlx      = controlx(isfinite(controly));
                controly      = controly(isfinite(controly));
				
				eval(['testx = [testanalysis.' branch '.' versus '.' versus ']'';']);
                eval(['testy = [testanalysis.' branch '.' versus '.' measure '.' statistic ']'';']);
                eval(['testweight = [testanalysis.' branch '.' versus '.length.total]'';']);
                testweight = testweight(isfinite(testy));
                testx      = testx(isfinite(testy));
                testy      = testy(isfinite(testy));
				
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
				
				figure; figurecount = figurecount + 1;
				eval(['plot(controlx,controly,' controlbranchmarker ');']);
				hold on;
				eval(['plot(testx,testy,' testbranchmarker ');']);
				ylimits = ylim;
				xlabel(versuslabel,'FontSize',8,'FontWeight','b');
				ylabel([measurelabel ' ' statisticlabel],'FontSize',8,'FontWeight','b');
				title(char(' ',[branchlabel ' ' measurelabel ' ' statisticlabel  ' vs ' versustitle],' '),'FontSize',12,'FontWeight','b');
				legend(controlanalysis.inputfilename,testanalysis.inputfilename);
                set(gca,'FontSize',6);
				filename = sprintf('%s_1_SingleBin_%s_%s_%s_%s_vs_%s',controlanalysis.inputfilename,testanalysis.inputfilename,branch,measure,statisticfolder,versus);
				print('-djpeg',filename);
				set(gca,'YScale','log');
				filename = sprintf('%s_1_SingleBin_%s_%s_%s_%s_vs_%s_logy',controlanalysis.inputfilename,testanalysis.inputfilename,branch,measure,statisticfolder,versus);
				print('-djpeg',filename);
				set(gca,'XScale','log');
				filename = sprintf('%s_1_SingleBin_%s_%s_%s_%s_vs_%s_logy_logx',controlanalysis.inputfilename,testanalysis.inputfilename,branch,measure,statisticfolder,versus);
				print('-djpeg',filename);
								
				eval(['currentoption = mncomparefitoption.' measure ';']);
                if strcmp(currentoption.singlebins.fit,'y') == 1
				
					for j = 1:length(fits)
						fit = fits{j};
						fitlabel = fitslabels{j};

						for k = 1:length(fittypes)
							fittype = fittypes{k};
							fittypelabel = fittypeslabels{k};

							figure;  figurecount = figurecount + 1;
							eval(['plot(controlx,controly,' controlbranchmarker ');']);
							hold on;
							ylimits = ylim;
							xlabel(versuslabel,'FontSize',8,'FontWeight','b');
							ylabel([measurelabel ' ' statisticlabel],'FontSize',8,'FontWeight','b');
							title(char(' ',[branchlabel ' ' measurelabel ' ' statisticlabel  ' vs ' versustitle ' -- ' fitlabel],' '),'FontSize',12,'FontWeight','b');
							set(gca,'FontSize',6);
							
							
							eval(['[controlparameter controlrmse] = ' fit 'fitter' fittype '(controlx,controly,controlweight);']);
							eval(['[testparameter testrmse] = ' fit 'fitter' fittype '(testx,testy,testweight);']);
							
							controlfity = fitter(fit,controlparameter,controlx);
							eval(['plot(controlx,controlfity,' controlfitstyle ');']);
                            
							eval(['plot(testx,testy,' testbranchmarker ');']);
                            testfity = fitter(fit,testparameter,testx);
							eval(['plot(testx,testfity,' testfitstyle ');']);
							
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
							
							eval(['plot(controlx,controly,' controlbranchmarker ');']);
							eval(['plot(testx,testy,' testbranchmarker ');']);
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
							filename = sprintf('%s_%s_%s_%s_%s_vs_%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,branch,measure,statisticfolder,versus,fit,fittype);
							print('-djpeg',filename);
							set(gca,'YScale','log');
							filename = sprintf('%s_%s_%s_%s_%s_vs_%s_%s_%s_logy',controlanalysis.inputfilename,testanalysis.inputfilename,branch,measure,statisticfolder,versus,fit,fittype);
							print('-djpeg',filename);
							set(gca,'XScale','log');
							filename = sprintf('%s_%s_%s_%s_%s_vs_%s_%s_%s_logy_logx',controlanalysis.inputfilename,testanalysis.inputfilename,branch,measure,statisticfolder,versus,fit,fittype);
							print('-djpeg',filename);
							cd(mainfolder);
                            if figurecount > 25; close all; end;
						end
						if strcmp(mncomparefitoption.figuresopen,'n'); close all; end;
					end
				end
            end
        end
    end
end
