function parameterfits = singlebinpiecebiftermprobfitter(analysis,parameterfits,mnfitteroption)

disp('     Single Bin Piece Bif/Term Probability.');
%mnfitteroptions;

branches = {'bifurcation','termination'};
brancheslabels = {'Bifurcation','Termination'};
branchesnames = {'piecebifprob','piecetermprob'};
branchesmarkers = {'''gs'',''MarkerFaceColor'',''g''','''rd'',''MarkerFaceColor'',''r'''};
branchestokeep = [false false];
if strcmp(mnfitteroption.piecebifprob.fit,'y')
    branchestokeep(1) = true;
end
if strcmp(mnfitteroption.piecetermprob.fit,'y')
    branchestokeep(2) = true;
end
branches = branches(branchestokeep);
brancheslabels = brancheslabels(branchestokeep);
branchesnames = branchesnames(branchestokeep);
branchesmarkers = branchesmarkers(branchestokeep);

for f = 1:length(branches)
    branch = branches{f};
    branchlabel = brancheslabels{f};
    branchname = branchesnames{f};
    branchmarker = branchesmarkers{f};

	versuses  = {'diameter','pathlength','radialdistance'};
	versuseslabels = {'Diameter (\mum)','Path Length from Soma (\mum)','Radial Distance from Soma (\mum)'};
	versusestitles = {'Diameter','Path Length','Radial Distance'};
	versusestokeep = [false false false];
	eval(['currentoption = mnfitteroption.' branchname ';']);;
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

    pooleds = {'y','n'};
    pooledstokeep = [false false];
    eval(['currentoption = mnfitteroption.' branchname ';']);
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
    eval(['currentoption = mnfitteroption.' branchname ';']);
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
                    eval(['x = [analysis.' versus '.' versus ']'';']);
                    eval(['y = [analysis.' versus '.' branch 'probability.' by ']'';']);
                    eval(['weight = [analysis.' versus '.' by '.total]'';']);
                    weight = weight(isfinite(y));
                    x      = x(isfinite(y));
                    y      = y(isfinite(y));
                elseif strcmp(pooled,'n') == 1
                    eval(['x = [analysis.' branch '.' versus '.' versus ']'';']);
                    eval(['y = [analysis.' branch '.' versus '.' branch 'probability.' by ']'';']);
                    %eval(['weight = [analysis.' branch '.' versus '.' branch 'probability.' by ']'';']);
					eval(['weight = [analysis.' branch '.' versus '.' by '.total]'';']);
                    weight = weight(isfinite(y));
                    x      = x(isfinite(y));
                    y      = y(isfinite(y));
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
				
				figure;
				eval(['plot(x,y,' branchmarker ');']);
				ylimits = ylim;
				xlabel(versuslabel,'FontSize',8,'FontWeight','b');
				ylabel([branchlabel ' Probability'],'FontSize',8,'FontWeight','b');
				if strcmp(pooled,'y') == 1
					title(char(' ',['Piece ' branchlabel ' Probability by Pooled ' bylabel  ' vs ' versustitle],' '),'FontSize',12,'FontWeight','b');
				elseif strcmp(pooled,'n') == 1
					title(char(' ',['Piece ' branchlabel ' Probability by ' bylabel  ' vs ' versustitle],' '),'FontSize',12,'FontWeight','b');
				end
				set(gca,'FontSize',6);
				filename = sprintf('%s_1_SingleBin_%s_vs_%s_by_%s',analysis.inputfilename,branchname,versus,by);
				print('-djpeg',filename);
				set(gca,'YScale','log');
				filename = sprintf('%s_1_SingleBin_%s_vs_%s_by_%s_logy',analysis.inputfilename,branchname,versus,by);
				print('-djpeg',filename);
				set(gca,'XScale','log');
				filename = sprintf('%s_1_SingleBin_%s_vs_%s_by_%s_logy_logx',analysis.inputfilename,branchname,versus,by);
				print('-djpeg',filename);
				
				eval(['currentoption = mnfitteroption.' branchname ';']);
                if strcmp(currentoption.singlebins,'y') == 1
				
					for j = 1:length(fits)
						fit = fits{j};
						fitlabel = fitslabels{j};

						figure;
						eval(['plot(x,y,' branchmarker ');']);
						ylimits = ylim;
						xlabel(versuslabel,'FontSize',8,'FontWeight','b');
						ylabel([branchlabel ' Probability'],'FontSize',8,'FontWeight','b');
						if strcmp(pooled,'y') == 1
							title(char(' ',['Piece ' branchlabel ' Probability by Pooled ' bylabel  ' vs ' versustitle ' -- ' fitlabel],' '),'FontSize',12,'FontWeight','b');
						elseif strcmp(pooled,'n') == 1
							title(char(' ',['Piece ' branchlabel ' Probability by ' bylabel  ' vs ' versustitle ' -- ' fitlabel],' '),'FontSize',12,'FontWeight','b');
						end
						set(gca,'FontSize',6);
						hold on;
						

						for k = 1:length(fittypes)
							fittype = fittypes{k};
							fittypelabel = fittypeslabels{k};
							fitstyle = fitstyles{k};

							eval(['[parameter rmse] = ' fit 'fitter' fittype '(x,y,weight);']);
							if strcmp(pooled,'y') == 1
								eval(['parameterfits.pooled' branchname '.' by '.' versus '.' fit '.' fittype '.parameter = parameter;']);
								eval(['parameterfits.pooled' branchname '.' by '.' versus '.' fit '.' fittype '.rmse = rmse;']);
							elseif strcmp(pooled,'n') == 1
								eval(['parameterfits.' branchname '.' by '.' versus '.' fit '.' fittype '.parameter = parameter;']);
								eval(['parameterfits.' branchname '.' by '.' versus '.' fit '.' fittype '.rmse = rmse;']);
							end

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


						eval(['plot(x,y,' branchmarker ');']);
						figurecount = figurecount + 1;
						%fillscreen;
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
						
						filename = sprintf('%s_ParameterFits_%03d_%s_vs_%s_by_%s_%s',analysis.inputfilename,figurecount,branchname,versus,by,fit);
						print('-djpeg',filename);
						set(gca,'YScale','log');
						filename = sprintf('%s_ParameterFits_%03d_%s_vs_%s_by_%s_%s_logy',analysis.inputfilename,figurecount,branchname,versus,by,fit);
						print('-djpeg',filename);
						set(gca,'XScale','log');
						filename = sprintf('%s_ParameterFits_%03d_%s_vs_%s_by_%s_%s_logy_logx',analysis.inputfilename,figurecount,branchname,versus,by,fit);
						print('-djpeg',filename);
						cd(mainfolder);
						if strcmp(mnfitteroption.figuresopen,'n'); close all; end;

					end
                end
            end
        end
    end
end
