function parameterfits = parameterfitter7(analysis,parameterfits)

disp('   Fitting doublebin piece bif/term prob.');
options;

if strcmp(option.fitter.parameters.firstbin.figures,'n') ~= 1
    firstbinfigures = 'y';
else
    firstbinfigures = 'n';
end
if strcmp(option.fitter.parameters.secondbin.fits,'n') ~= 1
    secondbinfits = 'y';
    if strcmp(option.fitter.parameters.secondbin.figures,'n') ~= 1
        secondbinfigures = 'y';
    else
        secondbinfigures = 'n';
    end
else
    secondbinfits = 'n';
    secondbinfigures = 'n';
end

branches = {'bifurcation','termination'};
brancheslabels = {'Bifurcation','Termination'};
branchesnames = {'piecebifprob','piecetermprob'};
branchesmarkers = {'''gs'',''MarkerFaceColor'',''g''','''rd'',''MarkerFaceColor'',''r'''};

% measures = {'taperrate'};
% measureslabels = {'Taper Rate'};

firstbins  = {'diameter','pathlength'};
firstbinslabels = {'Diameter (\mum)','Path Length from Soma (\mum)'};
firstbinstitles = {'Diameter','Path Length'};

secondbins  = {'pathlength','diameter'};
secondbinslabels = {'Path Length from Soma (\mum)','Diameter (\mum)'};
secondbinstitles = {'Path Length','Diameter'};

% Complete Analysis
%    pooleds = {'y','n'};
pooleds = {'n'};

% statistics = {'mean','std','skew','kurt'};
% statisticslabels = {'Mean','Standard Deviation','Skewness','Kurtosis'};

bys = {'length','surfacearea','volume'};
byslabels = {'Length','Surface Area','Volume'};

fits = {'linear','exponential','power','sigmoid'};
fitslabels = {'Linear','Exponential','Power','Sigmoid'};
fittypes = {'unweighted','weighted','robust','robustweighted'};
fittypeslabels = {'Unweighted Fits','Weighted Fits','Robust Fits','Robust Weighted Fits'};
fitstyles = {'''-c'',''LineWidth'',6','''--y'',''LineWidth'',5','''-.m'',''LineWidth'',4',''':k'',''LineWidth'',3'};

parameterfits = {'linear','exponential','power','sigmoid'};
parameterfitslabels = {'Linear','Exponential','Power','Sigmoid'};
parameterfittypes = {'unweighted','weighted','robust','robustweighted'};
parameterfittypeslabels = {'Unweighted Fits','Weighted Fits','Robust Fits','Robust Weighted Fits'};
parameterfitstyles = {'''-c'',''LineWidth'',6','''--y'',''LineWidth'',5','''-.m'',''LineWidth'',4',''':k'',''LineWidth'',3'};

legendtext(1) = {sprintf('%s Data',analysis.inputfilename)};
parameterlabels = char('         P_1: ','         P_2: ','         P_3: ','         P_4: ');
parametertitles = {'Parameter 1','Parameter 2','Parameter 3','Parameter 4'};
figurecount = 0;

styles(1,1)  = {'''-yo'',''MarkerFaceColor'',''y'''};
styles(1,2)  = {'''-gv'''};
styles(1,3)  = {'''-cs'',''MarkerFaceColor'',''c'''};
styles(1,4)  = {'''-bh'''};
styles(1,5)  = {'''-m^'',''MarkerFaceColor'',''m'''};
styles(1,6)  = {'''-yd'''};
styles(1,7)  = {'''-gp'',''MarkerFaceColor'',''g'''};
styles(1,8)  = {'''-co'''};
styles(1,9)  = {'''-bv'',''MarkerFaceColor'',''b'''};
styles(1,10) = {'''-ms'''};
styles(1,11) = {'''-yh'',''MarkerFaceColor'',''y'''};
styles(1,12) = {'''-g^'''};
styles(1,13) = {'''-cd'',''MarkerFaceColor'',''c'''};
styles(1,14) = {'''-bp'''};
styles(1,15) = {'''-mo'',''MarkerFaceColor'',''m'''};
styles(1,16) = {'''-yv'''};
styles(1,17) = {'''-gs'',''MarkerFaceColor'',''g'''};
styles(1,18) = {'''-ch'''};
styles(1,19) = {'''-b^'',''MarkerFaceColor'',''b'''};
styles(1,20) = {'''-md'''};
styles(1,21) = {'''-yp'',''MarkerFaceColor'',''y'''};
styles(1,22) = {'''-go'''};
styles(1,23) = {'''-cv'',''MarkerFaceColor'',''c'''};
styles(1,24) = {'''-bs'''};
styles(1,25) = {'''-mh'',''MarkerFaceColor'',''m'''};
styles(1,26) = {'''-y^'''};
styles(1,27) = {'''-gd'',''MarkerFaceColor'',''g'''};
styles(1,28) = {'''-cp'''};
styles(1,29) = {'''-bo'',''MarkerFaceColor'',''b'''};
styles(1,30) = {'''-mv'''};
styles(1,31) = {'''-ys'',''MarkerFaceColor'',''y'''};
styles(1,32) = {'''-gh'''};
styles(1,33) = {'''-c^'',''MarkerFaceColor'',''c'''};
styles(1,34) = {'''-bd'''};
styles(1,35) = {'''-mp'',''MarkerFaceColor'',''m'''};
styles(1,36) = {'''-yo'''};
styles(1,37) = {'''-gv'',''MarkerFaceColor'',''g'''};
styles(1,38) = {'''-cs'''};
styles(1,39) = {'''-bh'',''MarkerFaceColor'',''b'''};
styles(1,40) = {'''-m^'''};

if strcmp(firstbinfigures,'y') == 1 || strcmp(secondbinfigures,'y') == 1
    cd(analysis.datapathname);
    if exist('figures','dir')==7
        cd('figures');
    else
        mkdir('figures');
        cd('figures');
    end
    if exist('parameterfitting','dir')==7
        cd('parameterfitting');
    else
        mkdir('parameterfitting');
        cd('parameterfitting');
    end
    mainfolder = cd;
end

for f = 1:length(branches)
    branch = branches{f};
    branchlabel = brancheslabels{f};
    branchname = branchesnames{f};
    branchmarker = branchesmarkers{f};

    for g = 1:length(firstbins)
        firstbin = firstbins{g};
        firstbinlabel = firstbinslabels{g};
        firstbintitle = firstbinstitles{g};
        secondbin = secondbins{g};
        secondbinlabel = secondbinslabels{g};
        secondbintitle = secondbinstitles{g};
        
        for h = 1:length(pooleds)
            pooled = pooleds(h);

            for i = 1:length(bys)
                by = bys{i};
                bylabel = byslabels{i};

                clear firstbindataraw2 secondbindataraw2 measuredataraw2 weightdataraw2
                clear firstbindataraw secondbindataraw measuredataraw weightdataraw
                clear firstbindata secondbindata measuredata weightdata

                if strcmp(pooled,'y') == 1
                    if strcmp(firstbin,'diameter') == 1
                        eval(['firstbindataraw2 = [analysis.doublebin.' firstbin '];']);
                        eval(['secondbindataraw2 = [analysis.doublebin.' secondbin '];']);
                        eval(['measuredataraw2 = [analysis.doublebin.' branch 'probability.by' by '];']);
                        eval(['weightdataraw2 = [analysis.doublebin.' by '];']);
                    elseif strcmp(firstbin,'pathlength') == 1
                        eval(['firstbindataraw2 = [analysis.doublebin.' firstbin ']'';']);
                        eval(['secondbindataraw2 = [analysis.doublebin.' secondbin ']'';']);
                        eval(['measuredataraw2 = [analysis.doublebin.' branch 'probability.by' by ']'';']);
                        eval(['weightdataraw2 = [analysis.doublebin.' by '];']);
                    else
                        disp('Error in parameterfitter5.m');
                        keyboard;
                    end
                elseif strcmp(pooled,'n') == 1
                    if strcmp(firstbin,'diameter') == 1
                        eval(['firstbindataraw2 = [analysis.' branch '.doublebin.' firstbin '];']);
                        eval(['secondbindataraw2 = [analysis.' branch '.doublebin.' secondbin '];']);
                        eval(['measuredataraw2 = [analysis.' branch '.doublebin.' branch 'probability.by' by '];']);
                        eval(['weightdataraw2 = [analysis.' branch '.doublebin.' by '];']);
                    elseif strcmp(firstbin,'pathlength') == 1
                        eval(['firstbindataraw2 = [analysis.' branch '.doublebin.' firstbin ']'';']);
                        eval(['secondbindataraw2 = [analysis.' branch '.doublebin.' secondbin ']'';']);
                        eval(['measuredataraw2 = [analysis.' branch '.doublebin.' branch 'probability.by' by ']'';']);
                        eval(['weightdataraw2 = [analysis.' branch '.doublebin.' by '];']);
                    else
                        disp('Error in parameterfitter7.m');
                        keyboard;
                    end
                end
                    

                counter = 0;
                for rows=1:max(size(measuredataraw2(:,1)))
                    if sum((isnan(measuredataraw2(rows,:)))) ~= max(size(measuredataraw2(rows,:)))
                        counter = counter+1;
                        firstbindataraw(counter,:) = firstbindataraw2(rows,:);
                        secondbindataraw(counter,:) = secondbindataraw2(rows,:);
                        measuredataraw(counter,:) = measuredataraw2(rows,:);
                        weightdataraw(counter,:) = weightdataraw2(rows,:);
                    end
                end
                counter = 0;
                for columns=1:max(size(measuredataraw(1,:)))
                    if sum((isnan(measuredataraw(:,columns)))) ~= max(size(measuredataraw(:,columns)))
                        counter = counter+1;
                        firstbindata(:,counter) = firstbindataraw(:,columns);
                        secondbindata(:,counter) = secondbindataraw(:,columns);
                        measuredata(:,counter) = measuredataraw(:,columns);
                        weightdata(:,counter) = weightdataraw(:,columns);
                    end
                end

                for j = 1:length(fits)
                    fit = fits{j};
                    fitlabel = fitslabels{j};

                    for k = 1:length(fittypes)
                        fittype = fittypes{k};
                        fitstyle = fitstyles{k};
                        fittypelabel = fittypeslabels{k};

                        if strcmp(firstbinfigures,'y') == 1
                            figure;
                        end

                        fitcount = 0;
                        for measurecolumn = 1:size(measuredata,2)

                            y = measuredata(:,measurecolumn);
                            x = firstbindata(:,measurecolumn);
                            x2 = secondbindata(:,measurecolumn);
                            weight = weightdata(:,measurecolumn);
                            weight = weight(isfinite(y));
                            x      = x(isfinite(y));
                            x2     = x2(isfinite(y));
                            y      = y(isfinite(y));

                            if (sum(~isnan(y))-length(y(y==0))) > 2
                                fitcount = fitcount + 1;

                                clear parameter rmse
                                eval(['[parameter rmse] = ' fit 'fitter' fittype '(x,y,weight);']);
                                if strcmp(pooled,'y') == 1
                                    eval(['parameterfits.pooled' branchname '.' by '.doublebin.' firstbin '.' fit '.' fittype '.' secondbin '.parameter(' num2str(fitcount) ',:) = parameter;']);
                                    eval(['parameterfits.pooled' branchname '.' by '.doublebin.' firstbin '.' fit '.' fittype '.' secondbin '.rmse(' num2str(fitcount) ',:) = rmse(1);']);
                                    eval(['parameterfits.pooled' branchname '.' by '.doublebin.' firstbin '.' fit '.' fittype '.' secondbin '.weight(' num2str(fitcount) ',:) = ' num2str(sum(weight)) ';']);
                                    eval(['parameterfits.pooled' branchname '.' by '.doublebin.' firstbin '.' fit '.' fittype '.' secondbin '.' secondbin '(' num2str(fitcount) ',:) = ' num2str(x2(1,1)) ';']);
                                elseif strcmp(pooled,'n') == 1
                                    eval(['parameterfits.' branchname '.' by '.doublebin.' firstbin '.' fit '.' fittype '.' secondbin '.parameter(' num2str(fitcount) ',:) = parameter;']);
                                    eval(['parameterfits.' branchname '.' by '.doublebin.' firstbin '.' fit '.' fittype '.' secondbin '.rmse(' num2str(fitcount) ',:) = rmse(1);']);
                                    eval(['parameterfits.' branchname '.' by '.doublebin.' firstbin '.' fit '.' fittype '.' secondbin '.weight(' num2str(fitcount) ',:) = ' num2str(sum(weight)) ';']);
                                    eval(['parameterfits.' branchname '.' by '.doublebin.' firstbin '.' fit '.' fittype '.' secondbin '.' secondbin '(' num2str(fitcount) ',:) = ' num2str(x2(1,1)) ';']);
                                end
                                if strcmp(firstbinfigures,'y') == 1
                                    eval(['plot3(x,x2,y,' styles{1,measurecolumn} ');']);
                                    hold on;
                                    fity = fitter(fit,parameter,x);
                                    fithandle = plot3(x,x2,fity,':r','LineWidth',2);
                                end

                            end
                        end

                        if strcmp(pooled,'y') == 1
                            eval(['meanrmse = mean([parameterfits.pooled' branchname '.' by '.doublebin.' firstbin '.' fit '.' fittype '.' secondbin '.rmse]);']);
                            eval(['totalrmse = sum([parameterfits.pooled' branchname '.' by '.doublebin.' firstbin '.' fit '.' fittype '.' secondbin '.rmse]);']);
                            eval(['parameterfits.pooled' branchname '.' by '.doublebin.' firstbin '.' fit '.' fittype '.' secondbin '.meanrmse = meanrmse;']);
                            eval(['parameterfits.pooled' branchname '.' by '.doublebin.' firstbin '.' fit '.' fittype '.' secondbin '.totalrmse = totalrmse;']);
                        elseif strcmp(pooled,'n') == 1
                            eval(['meanrmse = mean([parameterfits.' branchname '.' by '.doublebin.' firstbin '.' fit '.' fittype '.' secondbin '.rmse]);']);
                            eval(['totalrmse = sum([parameterfits.' branchname '.' by '.doublebin.' firstbin '.' fit '.' fittype '.' secondbin '.rmse]);']);
                            eval(['parameterfits.' branchname '.' by '.doublebin.' firstbin '.' fit '.' fittype '.' secondbin '.meanrmse = meanrmse;']);
                            eval(['parameterfits.' branchname '.' by '.doublebin.' firstbin '.' fit '.' fittype '.' secondbin '.totalrmse = totalrmse;']);

                        end

                        if strcmp(firstbinfigures,'y') == 1
                            figurecount = figurecount + 1;
                            fillscreen;
                            xlabel(firstbinlabel,'FontSize',8,'FontWeight','b');
                            ylabel(secondbinlabel,'FontSize',8,'FontWeight','b');
                            zlabel([branchlabel ' Probability'],'FontSize',8,'FontWeight','b');
                            if strcmp(pooled,'y') == 1
                                title(char(' ',['Piece ' branchlabel ' Probability vs ' firstbintitle ' by Pooled ' bylabel ' -- ' fitlabel],' '),'FontSize',12,'FontWeight','b');
                            elseif strcmp(pooled,'n') == 1
                                title(char(' ',['Piece ' branchlabel ' Probability vs ' firstbintitle ' by ' bylabel ' -- ' fitlabel],' '),'FontSize',12,'FontWeight','b');
                            end
                            set(gca,'FontSize',6);
                            legendtext(1) = {char(sprintf('%s %s',fitlabel,fittypelabel),sprintf('     Total RMSE: %.3e',totalrmse),sprintf('    Mean RMSE:  %.3e',meanrmse))};
                            legend(fithandle,legendtext,'Location','NorthEast');
                            clear totalrmse meanrmse;
                            filename = sprintf('%s_ParameterFits_%03d_DoubleBin_%s_by_%s_vs_%s_%s_%s',analysis.inputfilename,figurecount,branchname,by,firstbin,fit,fittype);
                            cd(mainfolder);
                        end
                        if strcmp(firstbinfigures,'y') == 1 || strcmp(secondbinfigures,'y') == 1
                            if exist(sprintf('%s',branchname),'dir')==7
                                cd(sprintf('%s',branchname));
                            else
                                mkdir(sprintf('%s',branchname));
                                cd(sprintf('%s',branchname));
                            end
                            if exist('doublebinfits','dir')==7
                                cd('doublebinfits');
                            else
                                mkdir('doublebinfits');
                                cd('doublebinfits');
                            end
                            if strcmp(pooled,'y') == 1
                                if exist('pooled','dir')==7
                                    cd('pooled');
                                else
                                    mkdir('pooled');
                                    cd('pooled');
                                end
                            end
                        end
                        if strcmp(firstbinfigures,'y') == 1
                            print('-djpeg',filename);
                            if strcmp(fit,'exponential') == 1
                                set(gca,'ZScale','log');
                                filename = sprintf('%s_ParameterFits_%03d_DoubleBin_%s_by_%s_vs_%s_%s_%s_logplot',analysis.inputfilename,figurecount,branchname,by,firstbin,fit,fittype);
                                print('-djpeg',filename);
                            elseif strcmp(fit,'power') == 1
                                set(gca,'ZScale','log');
                                set(gca,'XScale','log');
                                filename = sprintf('%s_ParameterFits_%03d_DoubleBin_%s_by_%s_vs_%s_%s_%s_loglogplot',analysis.inputfilename,figurecount,branchname,by,firstbin,fit,fittype);
                                print('-djpeg',filename);
                            elseif strcmp(fit,'sigmoid') == 1
                                set(gca,'ZScale','log');
                                set(gca,'XScale','linear');
                                filename = sprintf('%s_ParameterFits_%03d_DoubleBin_%s_by_%s_vs_%s_%s_%s_logplot',analysis.inputfilename,figurecount,branchname,by,firstbin,fit,fittype);
                                print('-djpeg',filename);
                            end
                        end
                        if strcmp(secondbinfigures,'y') == 1
                            if exist('parameterfits','dir')==7
                                cd('parameterfits');
                            else
                                mkdir('parameterfits');
                                cd('parameterfits');
                            end
                        end
                        
                        
                        if strcmp(secondbinfits,'y') == 1

                            parameterfitcount = 0;
                            for m = 1:length(parameter)
                                parametertitle = parametertitles{m};

                                if strcmp(pooled,'y') == 1
                                    eval(['x = [parameterfits.pooled' branchname '.' by '.doublebin.' firstbin '.' fit '.' fittype '.' secondbin '.' secondbin '];']);
                                    eval(['y = [parameterfits.pooled' branchname '.' by '.doublebin.' firstbin '.' fit '.' fittype '.' secondbin '.parameter(:,' num2str(m) ')];']);
                                    eval(['weight = [parameterfits.pooled' branchname '.' by '.doublebin.' firstbin '.' fit '.' fittype '.' secondbin '.weight];']);
                                elseif strcmp(pooled,'n') == 1
                                    eval(['x = [parameterfits.' branchname '.' by '.doublebin.' firstbin '.' fit '.' fittype '.' secondbin '.' secondbin '];']);
                                    eval(['y = [parameterfits.' branchname '.' by '.doublebin.' firstbin '.' fit '.' fittype '.' secondbin '.parameter(:,' num2str(m) ')];']);
                                    eval(['weight = [parameterfits.' branchname '.' by '.doublebin.' firstbin '.' fit '.' fittype '.' secondbin '.weight];']);
                                end
                                weight = weight(isfinite(y));
                                x      = x(isfinite(y));
                                y      = y(isfinite(y));

                                for n = 1:length(parameterfits)
                                    parameterfitcount = parameterfitcount + 1;
                                    parameterfit = parameterfits{n};
                                    parameterfitlabel = parameterfitslabels{n};

                                    if strcmp(secondbinfigures,'y') == 1
                                        figure;
                                        plot(x,y,'bo','MarkerFaceColor','b');
                                        ylimits = ylim;
                                        xlabel(secondbinlabel,'FontSize',8,'FontWeight','b');
                                        ylabel(parametertitle,'FontSize',8,'FontWeight','b');
                                        title(char(' ',['Piece ' branchlabel ' Probability by ' bylabel ' (' fitlabel ' ' fittypelabel ' of ' firstbintitle ')'],[parametertitle ' vs ' secondbintitle ' -- ' parameterfitlabel ' Fits'],' '),'FontSize',12,'FontWeight','b');
                                        set(gca,'FontSize',6);
                                        hold on;
                                    end

                                    for o = 1:length(parameterfittypes)
                                        parameterfittype = parameterfittypes{o};
                                        parameterfitstyle = parameterfitstyles{o};
                                        parameterfittypelabel = parameterfittypeslabels{o};

                                        clear parameter rmse
                                        eval(['[parameter rmse] = ' parameterfit 'fitter' parameterfittype '(x,y,weight);']);
                                        if strcmp(pooled,'y') == 1
                                            eval(['parameterfits.pooled' branchname '.' by '.doublebin.' firstbin '.' fit '.' fittype '.parameter(' num2str(m) ').' parameterfit '.' parameterfittype '.parameter = parameter;']);
                                            eval(['parameterfits.pooled' branchname '.' by '.doublebin.' firstbin '.' fit '.' fittype '.parameter(' num2str(m) ').' parameterfit '.' parameterfittype '.rmse = rmse;']);
                                        elseif strcmp(pooled,'n') == 1
                                            eval(['parameterfits.' branchname '.' by '.doublebin.' firstbin '.' fit '.' fittype '.parameter(' num2str(m) ').' parameterfit '.' parameterfittype '.parameter = parameter;']);
                                            eval(['parameterfits.' branchname '.' by '.doublebin.' firstbin '.' fit '.' fittype '.parameter(' num2str(m) ').' parameterfit '.' parameterfittype '.rmse = rmse;']);
                                        end
                                        if strcmp(secondbinfigures,'y') == 1
                                            fity = fitter(parameterfit,parameter,x);
                                            eval(['plot(x,fity,' parameterfitstyle ');']);
                                            ylim(ylimits);
                                            parameterlabel = parameterlabels(1:length(parameter),:);
                                            parametervalues = num2str(parameter','%.3e');
                                            parameterlegend = [parameterlabel parametervalues];
                                            rmselegend = sprintf('    rmse: %.3e',rmse(1));
                                            totallegend = char(' ',[parameterfitlabel ' ' parameterfittypelabel],' ',parameterlegend,rmselegend);
                                            legendtext(o+1) = {totallegend};
                                        end
                                    end

                                    if strcmp(secondbinfigures,'y') == 1
                                        plot(x,y,'bo','MarkerFaceColor','b');
                                        fillscreen;
                                        legend(legendtext,'Location','NorthEastOutside');
                                        filename = sprintf('%s_%03d_%s_%s_%s_%s_%s_P%d_%s',analysis.inputfilename,figurecount,branchname,by,firstbin,fit,fittype,m,parameterfit);
                                        print('-djpeg',filename);
                                        if strcmp(parameterfit,'exponential') == 1
                                            set(gca,'YScale','log');
                                            filename = sprintf('%s_%03d_%s_%s_%s_%s_%s_P%d_%s_logplot',analysis.inputfilename,figurecount,branchname,by,firstbin,fit,fittype,m,parameterfit);
                                            print('-djpeg',filename);
                                        elseif strcmp(parameterfit,'power') == 1
                                            set(gca,'YScale','log');
                                            set(gca,'XScale','log');
                                            filename = sprintf('%s_%03d_%s_%s_%s_%s_%s_P%d_%s_loglogplot',analysis.inputfilename,figurecount,branchname,by,firstbin,fit,fittype,m,parameterfit);
                                            print('-djpeg',filename);
                                        end
                                    end
                                end
                            end

                        end

                        
                        
                        
                        
                        %cd(mainfolder);
                        close all;
                    end
                end
            end
        end
    end
end