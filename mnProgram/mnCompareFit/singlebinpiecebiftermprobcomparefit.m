function singlebinpiecebiftermprobcomparefit(controlanalysis,testanalysis,mncomparefitoption)

disp('     Single Bin Piece Bif/Term Probability.');
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
mainfolder = cd;
figurecount = 0;

branches = {'bifurcation','termination'};
brancheslabels = {'Bifurcation','Termination'};
branchesnames = {'piecebifprob','piecetermprob'};
controlbranchesmarkers = {'''gs'',''MarkerFaceColor'',''g'',''MarkerSize'',6','''rd'',''MarkerFaceColor'',''r'',''MarkerSize'',8'};
testbranchesmarkers = {'''ks'',''MarkerFaceColor'',''y'',''MarkerSize'',4','''kd'',''MarkerFaceColor'',''m'',''MarkerSize'',6'};
controlfitstyles = {'''-g'',''LineWidth'',6','''-r'',''LineWidth'',6'};
testfitstyles = {'''-y'',''LineWidth'',4','''-m'',''LineWidth'',4'};
branchestokeep = [false false];
if strcmp(mncomparefitoption.piecebifprob.fit,'y')
    branchestokeep(1) = true;
end
if strcmp(mncomparefitoption.piecetermprob.fit,'y')
    branchestokeep(2) = true;
end
branches = branches(branchestokeep);
brancheslabels = brancheslabels(branchestokeep);
branchesnames = branchesnames(branchestokeep);
controlbranchesmarkers = controlbranchesmarkers(branchestokeep);
testbranchesmarkers = testbranchesmarkers(branchestokeep);
controlfitstyles = controlfitstyles(branchestokeep);
testfitstyles = testfitstyles(branchestokeep);

for f = 1:length(branches)
    branch = branches{f};
    branchlabel = brancheslabels{f};
    branchname = branchesnames{f};
    controlbranchmarker = controlbranchesmarkers{f};
    controlfitstyle = controlfitstyles{f};
    testbranchmarker = testbranchesmarkers{f};
    testfitstyle = testfitstyles{f};

	versuses  = {'diameter','pathlength','radialdistance','branchlength'};
	versuseslabels = {'Diameter (\mum)','Path Length from Soma (\mum)','Radial Distance from Soma (\mum)','Branch Length (\mum)'};
	versusestitles = {'Diameter','Path Length','Radial Distance','Branch Length'};
	versusestokeep = [false false false false];
	eval(['currentoption = mncomparefitoption.' branchname ';']);
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

    pooleds = {'y','n'};
    pooledstokeep = [false false];
    eval(['currentoption = mncomparefitoption.' branchname ';']);
    if strcmp(currentoption.pooled,'y')
        pooledstokeep(1) = true;
    end
    if strcmp(currentoption.bifterm,'y')
        pooledstokeep(2) = true;
    end
    pooleds = pooleds(pooledstokeep);

    bys = {'length','surfacearea','volume'};
    byslabels = {'Length','Surface Area','Volume'};
    bystokeep = [false false false];
    eval(['currentoption = mncomparefitoption.' branchname ';']);
    if strcmp(currentoption.bylength,'y')
        bystokeep(1) = true;
    end
    if strcmp(currentoption.bysurfacearea,'y')
        bystokeep(2) = true;
    end
    if strcmp(currentoption.byvolume,'y')
        bystokeep(3) = true;
    end
    bys = bys(bystokeep);
    byslabels = byslabels(bystokeep);

    fits = {'linear','exponential','exponentialoffset','power','poweroffset','sigmoid'};
	fitslabels = {'Linear Fits','Exponential Fits','Exponential Offset Fits','Power Fits','Power Offset Fits','Sigmoid Fits'};
    fitstokeep = [false false false false false false];
	eval(['currentoption = mncomparefitoption.' branchname ';']);
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
	eval(['currentoption = mncomparefitoption.' branchname ';']);
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
	
   
    for g = 1:length(versuses)
        versus = versuses{g};
        versuslabel = versuseslabels{g};
        versustitle = versusestitles{g};

        for h = 1:length(pooleds)
            pooled = pooleds{h};

            for i = 1:length(bys)
                by = bys{i};
                bylabel = byslabels{i};

                if strcmp(pooled,'y') == 1
                    eval(['controlx = [controlanalysis.' versus '.' versus ']'';']);
                    eval(['controly = [controlanalysis.' versus '.' branch 'probability.' by ']'';']);
                    eval(['controlweight = [controlanalysis.' versus '.' by '.total]'';']);
                    controlweight = controlweight(isfinite(controly));
                    controlx      = controlx(isfinite(controly));
                    controly      = controly(isfinite(controly));
					eval(['testx = [testanalysis.' versus '.' versus ']'';']);
                    eval(['testy = [testanalysis.' versus '.' branch 'probability.' by ']'';']);
                    eval(['testweight = [testanalysis.' versus '.' by '.total]'';']);
                    testweight = testweight(isfinite(testy));
                    testx      = testx(isfinite(testy));
                    testy      = testy(isfinite(testy));
                elseif strcmp(pooled,'n') == 1
                    eval(['controlx = [controlanalysis.' branch '.' versus '.' versus ']'';']);
                    eval(['controly = [controlanalysis.' branch '.' versus '.' branch 'probability.' by ']'';']);
                    eval(['controlweight = [controlanalysis.' branch '.' versus '.' by '.total]'';']);
                    controlweight = controlweight(isfinite(controly));
                    controlx      = controlx(isfinite(controly));
                    controly      = controly(isfinite(controly));
					eval(['testx = [testanalysis.' branch '.' versus '.' versus ']'';']);
                    eval(['testy = [testanalysis.' branch '.' versus '.' branch 'probability.' by ']'';']);
                    eval(['testweight = [testanalysis.' branch '.' versus '.' by '.total]'';']);
                    testweight = testweight(isfinite(testy));
                    testx      = testx(isfinite(testy));
                    testy      = testy(isfinite(testy));
                end
				
				cd(mainfolder);
				if exist(sprintf('%s',branchname),'dir')==7
					cd(sprintf('%s',branchname));
				else
					mkdir(sprintf('%s',branchname));
					cd(sprintf('%s',branchname));
				end
				if strcmp(pooled,'y') == 1
					if exist('pooled','dir')==7
						cd('pooled');
					else
						mkdir('pooled');
						cd('pooled');
					end
				end
				
				figure; figurecount = figurecount + 1;
				eval(['plot(controlx,controly,' controlbranchmarker ');']);
				hold on;
				eval(['plot(testx,testy,' testbranchmarker ');']);
				ylimits = ylim;
				xlabel(versuslabel,'FontSize',8,'FontWeight','b');
				ylabel([branchlabel ' Probability'],'FontSize',8,'FontWeight','b');
				if strcmp(pooled,'y') == 1
					title(char(' ',['Piece ' branchlabel ' Probability by Pooled ' bylabel  ' vs ' versustitle],' '),'FontSize',12,'FontWeight','b');
				elseif strcmp(pooled,'n') == 1
					title(char(' ',['Piece ' branchlabel ' Probability by ' bylabel  ' vs ' versustitle],' '),'FontSize',12,'FontWeight','b');
				end
				legendtext(1) = {controlanalysis.inputfilename};
				legendtext(2) = {testanalysis.inputfilename};
				legend(legendtext,'Location','NorthEastOutside');
				set(gca,'FontSize',6);
				
				filename = sprintf('%s_%s_1_SingleBin_%s_vs_%s_by_%s',controlanalysis.inputfilename,testanalysis.inputfilename,branchname,versus,by);
				print('-djpeg',filename);
				set(gca,'YScale','log');
				filename = sprintf('%s_%s_1_SingleBin_%s_vs_%s_by_%s_logy',controlanalysis.inputfilename,testanalysis.inputfilename,branchname,versus,by);
				print('-djpeg',filename);
				set(gca,'XScale','log');
				filename = sprintf('%s_%s_1_SingleBin_%s_vs_%s_by_%s_logy_logx',controlanalysis.inputfilename,testanalysis.inputfilename,branchname,versus,by);
				print('-djpeg',filename);
				
				eval(['currentoption = mncomparefitoption.' branchname ';']);
                if strcmp(currentoption.singlebins.fit,'y') == 1
				
					for j = 1:length(fits)
						fit = fits{j};
						fitlabel = fitslabels{j};

						for k = 1:length(fittypes)
							fittype = fittypes{k};
							fittypelabel = fittypeslabels{k};
							
							figure; figurecount = figurecount + 1;
							eval(['plot(controlx,controly,' controlbranchmarker ');']);
							hold on;
							ylimits = ylim;
							xlabel(versuslabel,'FontSize',8,'FontWeight','b');
							ylabel([branchlabel ' Probability'],'FontSize',8,'FontWeight','b');
							if strcmp(pooled,'y') == 1
								title(char(' ',['Piece ' branchlabel ' Probability by Pooled ' bylabel  ' vs ' versustitle ' -- ' fitlabel],' '),'FontSize',12,'FontWeight','b');
							elseif strcmp(pooled,'n') == 1
								title(char(' ',['Piece ' branchlabel ' Probability by ' bylabel  ' vs ' versustitle ' -- ' fitlabel],' '),'FontSize',12,'FontWeight','b');
							end
							set(gca,'FontSize',6);
							
							
							eval(['[controlparameter controlrmse] = ' fit 'fitter' fittype '(controlx,controly,controlweight);']);
							% if strcmp(pooled,'y') == 1
								% eval(['parameterfits.pooled' branchname '.' by '.' versus '.' fit '.' fittype '.parameter = parameter;']);
								% eval(['parameterfits.pooled' branchname '.' by '.' versus '.' fit '.' fittype '.rmse = rmse;']);
							% elseif strcmp(pooled,'n') == 1
								% eval(['parameterfits.' branchname '.' by '.' versus '.' fit '.' fittype '.parameter = parameter;']);
								% eval(['parameterfits.' branchname '.' by '.' versus '.' fit '.' fittype '.rmse = rmse;']);
							% end
							eval(['[testparameter testrmse] = ' fit 'fitter' fittype '(testx,testy,testweight);']);

							controlfity = fitter(fit,controlparameter,controlx);
							eval(['plot(controlx,controlfity,' controlfitstyle ');']);
							
							eval(['plot(testx,testy,' testbranchmarker ');']);
							testfity = fitter(fit,testparameter,testx);
							eval(['plot(testx,testfity,' testfitstyle ');']);
							
							ylim(ylimits);
							
							controlparameterlabel = parameterlabels(1:length(controlparameter),:);
							controlparametervalues = num2str(controlparameter','%.3e');
							controlparameterlegend = [controlparameterlabel controlparametervalues];
							controlrmselegend = sprintf('    rmse: %.3e',controlrmse(1));
							testparameterlabel = parameterlabels(1:length(testparameter),:);
							testparametervalues = num2str(testparameter','%.3e');
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
							if exist(sprintf('%s',branchname),'dir')==7
								cd(sprintf('%s',branchname));
							else
								mkdir(sprintf('%s',branchname));
								cd(sprintf('%s',branchname));
							end
							if exist('singlebinfits','dir')==7
								cd('singlebinfits');
							else
								mkdir('singlebinfits');
								cd('singlebinfits');
							end
							if strcmp(pooled,'y') == 1
								if exist('pooled','dir')==7
									cd('pooled');
								else
									mkdir('pooled');
									cd('pooled');
								end
							end
							
							filename = sprintf('%s_%s_%s_vs_%s_by_%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,branchname,versus,by,fit,fittype);
							print('-djpeg',filename);
							set(gca,'YScale','log');
							filename = sprintf('%s_%s_%s_vs_%s_by_%s_%s_%s_logy',controlanalysis.inputfilename,testanalysis.inputfilename,branchname,versus,by,fit,fittype);
							print('-djpeg',filename);
							set(gca,'XScale','log');
							filename = sprintf('%s_%s_%s_vs_%s_by_%s_%s_%s_logy_logx',controlanalysis.inputfilename,testanalysis.inputfilename,branchname,versus,by,fit,fittype);
							print('-djpeg',filename);
							cd(mainfolder);
							if figurecount > 25; close all; end;
							if strcmp(mncomparefitoption.figuresopen,'n'); close all; end;
						end
					end
                end
            end
        end
    end
end
