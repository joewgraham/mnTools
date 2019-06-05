function parameterfits = doublebinpiecebiftermprobfitter(analysis,parameterfits,mnfitteroption)

disp('     Double Bin Piece Bif/Term Probability.');
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
            
            firstbins  = {'diameter','pathlength','branchlength','branchorder'};
            firstbinslabels = {'Diameter (\mum)','Path Length from Soma (\mum)','Intra-Branch Length (\mum)','Branch Order'};
            firstbinstitles = {'Diameter','Path Length','Branch Length','Branch Order'};
            firstbinstokeep = [false false false false];
            eval(['currentoption = mnfitteroption.' branchname ';']);
            if strcmp(currentoption.diameter.pathlength,'y') || strcmp(currentoption.diameter.branchlength,'y') || strcmp(currentoption.diameter.branchorder,'y')
                firstbinstokeep(1) = true;
            end
            if strcmp(currentoption.pathlength.diameter,'y')
                firstbinstokeep(2) = true;
            end
            if strcmp(currentoption.branchlength.diameter,'y')
                firstbinstokeep(3) = true;
            end
            if strcmp(currentoption.branchorder.diameter,'y')
                firstbinstokeep(4) = true;
            end
            firstbins = firstbins(firstbinstokeep);
            firstbinslabels = firstbinslabels(firstbinstokeep);
            firstbinstitles = firstbinstitles(firstbinstokeep);
            
            secondbins  = {'pathlength','diameter','branchlength','branchorder'};
            secondbinslabels = {'Path Length from Soma (\mum)','Diameter (\mum)','Intra-Branch Length (\mum)','Branch Order'};
            secondbinstitles = {'Path Length','Diameter','Branch Length','Branch Order'};
            secondbinstokeep = [false false false false];
            if strcmp(currentoption.diameter.pathlength,'y')
                secondbinstokeep(1) = true;
            end
            if strcmp(currentoption.pathlength.diameter,'y') || strcmp(currentoption.branchlength.diameter,'y') || strcmp(currentoption.branchorder.diameter,'y')
                secondbinstokeep(2) = true;
            end
            if strcmp(currentoption.diameter.branchlength,'y')
                secondbinstokeep(3) = true;
            end
            if strcmp(currentoption.diameter.branchorder,'y')
                secondbinstokeep(4) = true;
            end
            secondbins = secondbins(secondbinstokeep);
            secondbinslabels = secondbinslabels(secondbinstokeep);
            secondbinstitles = secondbinstitles(secondbinstokeep);
            
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
            fitsfilenames = {'1lin','2exp','3expoff','4pow','5powoff','6sig'};
            fitstokeep = [false false false false false false];
            eval(['currentoption = mnfitteroption.' branchname ';']);
            if strcmp(currentoption.firstbinfit.linear,'y')
                fitstokeep(1) = true;
            end
            if strcmp(currentoption.firstbinfit.exponential,'y')
                fitstokeep(2) = true;
            end
            if strcmp(currentoption.firstbinfit.exponentialoffset,'y')
                fitstokeep(3) = true;
            end
            if strcmp(currentoption.firstbinfit.power,'y')
                fitstokeep(4) = true;
            end
            if strcmp(currentoption.firstbinfit.poweroffset,'y')
                fitstokeep(5) = true;
            end
            if strcmp(currentoption.firstbinfit.sigmoid,'y')
                fitstokeep(6) = true;
            end
            fits = fits(fitstokeep);
            fitslabels = fitslabels(fitstokeep);
            fitsfilenames = fitsfilenames(fitstokeep);
            
            fittypes = {'unweighted','weighted','robust','robustweighted'};
            fittypeslabels = {'Unweighted Fits','Weighted Fits','Robust Fits','Robust Weighted Fits'};
            fitstyles = {'''-c'',''LineWidth'',6','''--y'',''LineWidth'',5','''-.m'',''LineWidth'',4',''':k'',''LineWidth'',3'};
            fittypesfilenames = {'1uw','2wt','3rb','4rw'};
            fittypestokeep = [false false false false];
            eval(['currentoption = mnfitteroption.' branchname ';']);
            if strcmp(currentoption.firstbinfittype.unweighted,'y')
                fittypestokeep(1) = true;
            end
            if strcmp(currentoption.firstbinfittype.weighted,'y')
                fittypestokeep(2) = true;
            end
            if strcmp(currentoption.firstbinfittype.robust,'y')
                fittypestokeep(3) = true;
            end
            if strcmp(currentoption.firstbinfittype.robustweighted,'y')
                fittypestokeep(4) = true;
            end
            fittypes = fittypes(fittypestokeep);
            fittypeslabels = fittypeslabels(fittypestokeep);
            fitstyles = fitstyles(fittypestokeep);
            fittypesfilenames = fittypesfilenames(fittypestokeep);
            
            secondfits = {'linear','exponential','exponentialoffset','power','poweroffset','sigmoid'};
            secondfitslabels = {'Linear','Exponential','Exponential Offset','Power','Power Offset','Sigmoid'};
            secondfitsfilenames = {'1lin','2exp','3expoff','4pow','5powoff','6sig'};
            secondfitstokeep = [false false false false false false];
            eval(['currentoption = mnfitteroption.' branchname ';']);
            if strcmp(currentoption.secondbinfit.linear,'y')
                secondfitstokeep(1) = true;
            end
            if strcmp(currentoption.secondbinfit.exponential,'y')
                secondfitstokeep(2) = true;
            end
            if strcmp(currentoption.secondbinfit.exponentialoffset,'y')
                secondfitstokeep(3) = true;
            end
            if strcmp(currentoption.secondbinfit.power,'y')
                secondfitstokeep(4) = true;
            end
            if strcmp(currentoption.secondbinfit.poweroffset,'y')
                secondfitstokeep(5) = true;
            end
            if strcmp(currentoption.secondbinfit.sigmoid,'y')
                secondfitstokeep(6) = true;
            end
            secondfits = secondfits(secondfitstokeep);
            secondfitslabels = secondfitslabels(secondfitstokeep);
            secondfitsfilenames = secondfitsfilenames(secondfitstokeep);
            
            secondfittypes = {'unweighted','weighted','robust','robustweighted'};
            secondfittypeslabels = {'Unweighted Fits','Weighted Fits','Robust Fits','Robust Weighted Fits'};
            secondfitstyles = {'''-c'',''LineWidth'',6','''--y'',''LineWidth'',5','''-.m'',''LineWidth'',4',''':k'',''LineWidth'',3'};
            secondfittypesfilenames = {'1uw','2wt','3rb','4rw'};
            
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
            styles(1,41)  = {'''-yo'',''MarkerFaceColor'',''y'''};
            styles(1,42)  = {'''-gv'''};
            styles(1,43)  = {'''-cs'',''MarkerFaceColor'',''c'''};
            styles(1,44)  = {'''-bh'''};
            styles(1,45)  = {'''-m^'',''MarkerFaceColor'',''m'''};
            styles(1,46)  = {'''-yd'''};
            styles(1,47)  = {'''-gp'',''MarkerFaceColor'',''g'''};
            styles(1,48)  = {'''-co'''};
            styles(1,49)  = {'''-bv'',''MarkerFaceColor'',''b'''};
            styles(1,50) = {'''-ms'''};
            styles(1,51) = {'''-yh'',''MarkerFaceColor'',''y'''};
            styles(1,52) = {'''-g^'''};
            styles(1,53) = {'''-cd'',''MarkerFaceColor'',''c'''};
            styles(1,54) = {'''-bp'''};
            styles(1,55) = {'''-mo'',''MarkerFaceColor'',''m'''};
            styles(1,56) = {'''-yv'''};
            styles(1,57) = {'''-gs'',''MarkerFaceColor'',''g'''};
            styles(1,58) = {'''-ch'''};
            styles(1,59) = {'''-b^'',''MarkerFaceColor'',''b'''};
            styles(1,60) = {'''-md'''};
            styles(1,61) = {'''-yp'',''MarkerFaceColor'',''y'''};
            styles(1,62) = {'''-go'''};
            styles(1,63) = {'''-cv'',''MarkerFaceColor'',''c'''};
            styles(1,64) = {'''-bs'''};
            styles(1,65) = {'''-mh'',''MarkerFaceColor'',''m'''};
            styles(1,66) = {'''-y^'''};
            styles(1,67) = {'''-gd'',''MarkerFaceColor'',''g'''};
            styles(1,68) = {'''-cp'''};
            styles(1,69) = {'''-bo'',''MarkerFaceColor'',''b'''};
            styles(1,70) = {'''-mv'''};
            styles(1,71) = {'''-ys'',''MarkerFaceColor'',''y'''};
            styles(1,72) = {'''-gh'''};
            styles(1,73) = {'''-c^'',''MarkerFaceColor'',''c'''};
            styles(1,74) = {'''-bd'''};
            styles(1,75) = {'''-mp'',''MarkerFaceColor'',''m'''};
            styles(1,76) = {'''-yo'''};
            styles(1,77) = {'''-gv'',''MarkerFaceColor'',''g'''};
            styles(1,78) = {'''-cs'''};
            styles(1,79) = {'''-bh'',''MarkerFaceColor'',''b'''};
            styles(1,80) = {'''-m^'''};
            
            
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
            
            
            for f = 1:length(secondbins)
                secondbin = secondbins{f};
                secondbinlabel = secondbinslabels{f};
                secondbintitle = secondbinstitles{f};
                
                for g = 1:length(firstbins)
                    firstbin = firstbins{g};
                    firstbinlabel = firstbinslabels{g};
                    firstbintitle = firstbinstitles{g};
                    
                    if ~strcmp(firstbin,secondbin) && (strcmp(firstbin,'diameter') || (strcmp(secondbin,'diameter')))
                        
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
                                        eval(['firstbindataraw2 = [typeanalysis.doublebin.' firstbin secondbin '.' firstbin '];']);
                                        eval(['secondbindataraw2 = [typeanalysis.doublebin.' firstbin secondbin '.' secondbin '];']);
                                        eval(['measuredataraw2 = [typeanalysis.doublebin.' firstbin secondbin '.' branch 'probability.by' by '];']);
                                        %eval(['weightdataraw2 = [typeanalysis.doublebin.' by '];']);
                                        %eval(['weightdataraw2 = [typeanalysis.doublebin.numberbifurcations]+[typeanalysis.doublebin.numberterminations];']);
                                        eval(['weightdataraw2 = [typeanalysis.doublebin.' firstbin secondbin '.' weightvar '];']);
                                    elseif strcmp(firstbin,'pathlength') == 1 || strcmp(firstbin,'branchlength') == 1 || strcmp(firstbin,'branchorder') == 1
                                        eval(['firstbindataraw2 = [typeanalysis.doublebin.' secondbin firstbin '.' firstbin ']'';']);
                                        eval(['secondbindataraw2 = [typeanalysis.doublebin.' secondbin firstbin '.' secondbin ']'';']);
                                        eval(['measuredataraw2 = [typeanalysis.doublebin.' secondbin firstbin '.' branch 'probability.by' by ']'';']);
                                        %eval(['weightdataraw2 = [typeanalysis.doublebin.' by ']'';']);
                                        %eval(['weightdataraw2 = [typeanalysis.doublebin.numberbifurcations]+[typeanalysis.doublebin.numberterminations]'';']);
                                        eval(['weightdataraw2 = [typeanalysis.doublebin.' secondbin firstbin '.' weightvar ']'';']);
                                    else
                                        disp('Error in parameterfitter5.m');
                                        keyboard;
                                    end
                                elseif strcmp(pooled,'n') == 1
                                    if strcmp(weightvar,'numbersegments')
                                        weightvar = ['number' branch 's'];
                                    end
                                    if strcmp(firstbin,'diameter') == 1
                                        eval(['firstbindataraw2 = [typeanalysis.' branch '.doublebin.' firstbin secondbin '.' firstbin '];']);
                                        eval(['secondbindataraw2 = [typeanalysis.' branch '.doublebin.' firstbin secondbin '.' secondbin '];']);
                                        eval(['measuredataraw2 = [typeanalysis.' branch '.doublebin.' firstbin secondbin '.' branch 'probability.by' by '];']);
                                        %eval(['weightdataraw2 = [typeanalysis.' branch '.doublebin.' by '];']);
                                        %eval(['weightdataraw2 = [typeanalysis.' branch '.doublebin.number' branch 's];']);
                                        eval(['weightdataraw2 = [typeanalysis.' branch '.doublebin.' firstbin secondbin '.' weightvar '];']);
                                    elseif strcmp(firstbin,'pathlength') == 1 || strcmp(firstbin,'branchlength') == 1 || strcmp(firstbin,'branchorder') == 1
                                        eval(['firstbindataraw2 = [typeanalysis.' branch '.doublebin.' secondbin firstbin '.' firstbin ']'';']);
                                        eval(['secondbindataraw2 = [typeanalysis.' branch '.doublebin.' secondbin firstbin '.' secondbin ']'';']);
                                        eval(['measuredataraw2 = [typeanalysis.' branch '.doublebin.' secondbin firstbin '.' branch 'probability.by' by ']'';']);
                                        %eval(['weightdataraw2 = [typeanalysis.' branch '.doublebin.' by ']'';']);
                                        %eval(['weightdataraw2 = [typeanalysis.' branch '.doublebin.number' branch 's]'';']);
                                        eval(['weightdataraw2 = [typeanalysis.' branch '.doublebin.' secondbin firstbin '.' weightvar ']'';']);
                                    else
                                        disp('Error in parameterfitter7.m');
                                        keyboard;
                                    end
                                else
                                    disp('Error in doublebinpiecebiftermprobfitter.m');
                                    keyboard;
                                end
                                
                                %This next bit of code shrinks the doublebin matrix, to remove
                                %empty rows and columns
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
                                %End of doublebin matrix shrinking
                                
                                %The next bit plots the doublebin data without any fits
                                figure; %figurecount = figurecount + 1;
                                for measurecolumn = 1:size(measuredata,2)
                                    y = measuredata(:,measurecolumn);
                                    x = firstbindata(:,measurecolumn);
                                    x2 = secondbindata(:,measurecolumn);
                                    x      = x(isfinite(y));
                                    x2     = x2(isfinite(y));
                                    y      = y(isfinite(y));
                                    if (sum(~isnan(y))-length(y(y==0))) > 1
                                        eval(['plot3(x,x2,y,' styles{1,measurecolumn} ');']);
                                        hold on;
                                    end
                                end
                                %fillscreen;
                                xlabel(firstbinlabel,'FontSize',8,'FontWeight','b');
                                ylabel(secondbinlabel,'FontSize',8,'FontWeight','b');
                                zlabel([branchlabel ' Probability'],'FontSize',8,'FontWeight','b');
                                if strcmp(pooled,'y') == 1
                                    title(char(' ',[piecetitles{piecetype} ' Piece ' branchlabel ' Probability vs ' firstbintitle ' by Pooled ' bylabel],' '),'FontSize',12,'FontWeight','b');
                                elseif strcmp(pooled,'n') == 1
                                    title(char(' ',[piecetitles{piecetype} ' Piece ' branchlabel ' Probability vs ' firstbintitle ' by ' bylabel],' '),'FontSize',12,'FontWeight','b');
                                end
                                set(gca,'FontSize',6);
                                
                                cd(mainfolder);
                                if exist((sprintf(branchname)),'dir')==7
                                    cd(sprintf(branchname));
                                else
                                    mkdir(sprintf(branchname));
                                    cd(sprintf(branchname));
                                end
                                if strcmp(pooled,'y') == 1
                                    if exist(('pooled'),'dir')==7
                                        cd('pooled');
                                    else
                                        mkdir('pooled');
                                        cd('pooled');
                                    end
                                end
                                filename = sprintf('%s_%s_2_DoubleBin_%s_by_%s_vs_%s_%s',analysis.inputfilename,piecetitles{piecetype},branchname,by,firstbin,secondbin);
                                saveas(gcf,filename,'fig');
                                print('-djpeg',filename);
                                set(gca,'ZScale','log');
                                filename = sprintf('%s_%s_2_DoubleBin_%s_by_%s_vs_%s_%s_logz',analysis.inputfilename,piecetitles{piecetype},branchname,by,firstbin,secondbin);
                                print('-djpeg',filename);
                                set(gca,'XScale','log');
                                filename = sprintf('%s_%s_2_DoubleBin_%s_by_%s_vs_%s_%s_logz_logx',analysis.inputfilename,piecetitles{piecetype},branchname,by,firstbin,secondbin);
                                print('-djpeg',filename);
                                %
                                %keyboard;
                                %
                                %End of plotting doublebin data without any fits
                                
                                
                                eval(['currentoption = mnfitteroption.' branchname ';']);
                                if strcmp(currentoption.firstbinfit.fit,'y')
                                    
                                    for j = 1:length(fits)
                                        fit = fits{j};
                                        fitlabel = fitslabels{j};
                                        fitfilename = fitsfilenames{j};
                                        
                                        for k = 1:length(fittypes)
                                            fittype = fittypes{k};
                                            fitstyle = fitstyles{k};
                                            fittypelabel = fittypeslabels{k};
                                            fittypefilename = fittypesfilenames{k};
                                            
                                            figure; figurecount = figurecount + 1;
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
                                                        eval(['parameterfits.pooled' branchname '.' by '.doublebin.' firstbin '.' fit '.' fittype '.' secondbin '.parametervalues(' num2str(fitcount) ',:) = parameter;']);
                                                        eval(['parameterfits.pooled' branchname '.' by '.doublebin.' firstbin '.' fit '.' fittype '.' secondbin '.rmse(' num2str(fitcount) ',:) = rmse(1);']);
                                                        eval(['parameterfits.pooled' branchname '.' by '.doublebin.' firstbin '.' fit '.' fittype '.' secondbin '.wrmse(' num2str(fitcount) ',:) = rmse(2);']);
                                                        eval(['parameterfits.pooled' branchname '.' by '.doublebin.' firstbin '.' fit '.' fittype '.' secondbin '.weight(' num2str(fitcount) ',:) = ' num2str(sum(weight)) ';']);
                                                        eval(['parameterfits.pooled' branchname '.' by '.doublebin.' firstbin '.' fit '.' fittype '.' secondbin '.' secondbin '(' num2str(fitcount) ',:) = ' num2str(x2(1,1)) ';']);
                                                    elseif strcmp(pooled,'n') == 1
                                                        eval(['parameterfits.' branchname '.' by '.doublebin.' firstbin '.' fit '.' fittype '.' secondbin '.parametervalues(' num2str(fitcount) ',:) = parameter;']);
                                                        eval(['parameterfits.' branchname '.' by '.doublebin.' firstbin '.' fit '.' fittype '.' secondbin '.rmse(' num2str(fitcount) ',:) = rmse(1);']);
                                                        eval(['parameterfits.' branchname '.' by '.doublebin.' firstbin '.' fit '.' fittype '.' secondbin '.wrmse(' num2str(fitcount) ',:) = rmse(2);']);
                                                        eval(['parameterfits.' branchname '.' by '.doublebin.' firstbin '.' fit '.' fittype '.' secondbin '.weight(' num2str(fitcount) ',:) = ' num2str(sum(weight)) ';']);
                                                        eval(['parameterfits.' branchname '.' by '.doublebin.' firstbin '.' fit '.' fittype '.' secondbin '.' secondbin '(' num2str(fitcount) ',:) = ' num2str(x2(1,1)) ';']);
                                                    end
                                                    eval(['plot3(x,x2,y,' styles{1,measurecolumn} ');']);
                                                    hold on;
                                                    fity = fitter(fit,parameter,x);
                                                    fithandle = plot3(x,x2,fity,':r','LineWidth',2);
                                                end
                                            end
                                            
                                            if strcmp(pooled,'y') == 1
                                                eval(['meanrmse = mean([parameterfits.pooled' branchname '.' by '.doublebin.' firstbin '.' fit '.' fittype '.' secondbin '.rmse]);']);
                                                eval(['totalrmse = sum([parameterfits.pooled' branchname '.' by '.doublebin.' firstbin '.' fit '.' fittype '.' secondbin '.rmse]);']);
                                                eval(['parameterfits.pooled' branchname '.' by '.doublebin.' firstbin '.' fit '.' fittype '.' secondbin '.meanrmse = meanrmse;']);
                                                eval(['parameterfits.pooled' branchname '.' by '.doublebin.' firstbin '.' fit '.' fittype '.' secondbin '.totalrmse = totalrmse;']);
                                                eval(['meanwrmse = mean([parameterfits.pooled' branchname '.' by '.doublebin.' firstbin '.' fit '.' fittype '.' secondbin '.wrmse]);']);
                                                eval(['totalwrmse = sum([parameterfits.pooled' branchname '.' by '.doublebin.' firstbin '.' fit '.' fittype '.' secondbin '.wrmse]);']);
                                                eval(['parameterfits.pooled' branchname '.' by '.doublebin.' firstbin '.' fit '.' fittype '.' secondbin '.meanwrmse = meanwrmse;']);
                                                eval(['parameterfits.pooled' branchname '.' by '.doublebin.' firstbin '.' fit '.' fittype '.' secondbin '.totalwrmse = totalwrmse;']);
                                            elseif strcmp(pooled,'n') == 1
                                                eval(['meanrmse = mean([parameterfits.' branchname '.' by '.doublebin.' firstbin '.' fit '.' fittype '.' secondbin '.rmse]);']);
                                                eval(['totalrmse = sum([parameterfits.' branchname '.' by '.doublebin.' firstbin '.' fit '.' fittype '.' secondbin '.rmse]);']);
                                                eval(['parameterfits.' branchname '.' by '.doublebin.' firstbin '.' fit '.' fittype '.' secondbin '.meanrmse = meanrmse;']);
                                                eval(['parameterfits.' branchname '.' by '.doublebin.' firstbin '.' fit '.' fittype '.' secondbin '.totalrmse = totalrmse;']);
                                                eval(['meanwrmse = mean([parameterfits.' branchname '.' by '.doublebin.' firstbin '.' fit '.' fittype '.' secondbin '.wrmse]);']);
                                                eval(['totalwrmse = sum([parameterfits.' branchname '.' by '.doublebin.' firstbin '.' fit '.' fittype '.' secondbin '.wrmse]);']);
                                                eval(['parameterfits.' branchname '.' by '.doublebin.' firstbin '.' fit '.' fittype '.' secondbin '.meanwrmse = meanwrmse;']);
                                                eval(['parameterfits.' branchname '.' by '.doublebin.' firstbin '.' fit '.' fittype '.' secondbin '.totalwrmse = totalwrmse;']);
                                            else
                                                disp('Error in doublebinpiecebiftermprobfitter.m line 399.');
                                                keyboard;
                                            end
                                            
                                            %fillscreen;
                                            xlabel(firstbinlabel,'FontSize',8,'FontWeight','b');
                                            ylabel(secondbinlabel,'FontSize',8,'FontWeight','b');
                                            zlabel([branchlabel ' Probability'],'FontSize',8,'FontWeight','b');
                                            if strcmp(pooled,'y') == 1
                                                title(char(' ',[piecetitles{piecetype} ' Piece ' branchlabel ' Probability vs ' firstbintitle ' by Pooled ' bylabel ' -- ' fitlabel ' ' fittypelabel],' '),'FontSize',12,'FontWeight','b');
                                            elseif strcmp(pooled,'n') == 1
                                                title(char(' ',[piecetitles{piecetype} ' Piece ' branchlabel ' Probability vs ' firstbintitle ' by ' bylabel ' -- ' fitlabel ' ' fittypelabel],' '),'FontSize',12,'FontWeight','b');
                                            end
                                            set(gca,'FontSize',6);
                                            legendtext(1) = {char(sprintf('%s %s',fitlabel,fittypelabel),sprintf('     Total RMSE: %.3e',totalrmse),sprintf('    Mean RMSE:  %.3e',meanrmse),sprintf('   Total wRMSE: %.3e',totalwrmse),sprintf('  Mean wRMSE:  %.3e',meanwrmse))};
                                            legend(fithandle,legendtext,'Location','NorthEast');
                                            clear totalrmse meanrmse;
                                            clear legendtext;
                                            
                                            cd(mainfolder);
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
                                            
                                            filename = sprintf('%s_%s_DoubleBin_%s_by_%s_vs_%s_%s_%s_%s',analysis.inputfilename,piecetitles{piecetype},branchname,by,firstbin,secondbin,fitfilename,fittypefilename);
                                            print('-djpeg',filename);
                                            set(gca,'ZScale','log');
                                            filename = sprintf('%s_%s_DoubleBin_%s_by_%s_vs_%s_%s_%s_%s_logz',analysis.inputfilename,piecetitles{piecetype},branchname,by,firstbin,secondbin,fitfilename,fittypefilename);
                                            print('-djpeg',filename);
                                            set(gca,'XScale','log');
                                            filename = sprintf('%s_%s_DoubleBin_%s_by_%s_vs_%s_%s_%s_%s_logz_logx',analysis.inputfilename,piecetitles{piecetype},branchname,by,firstbin,secondbin,fitfilename,fittypefilename);
                                            print('-djpeg',filename);
                                            if strcmp(mnfitteroption.figuresopen,'n'); close all; end;
                                            
                                            if strcmp(currentoption.secondbinfit.fit,'y')
                                                
                                                if exist('parameterfits','dir')==7
                                                    cd('parameterfits');
                                                else
                                                    mkdir('parameterfits');
                                                    cd('parameterfits');
                                                end
                                                if exist(sprintf('%s',fit),'dir')==7
                                                    cd(sprintf('%s',fit));
                                                else
                                                    mkdir(sprintf('%s',fit));
                                                    cd(sprintf('%s',fit));
                                                end
                                                
                                                secondfitcount = 0;
                                                for m = 1:length(parameter)
                                                    parametertitle = parametertitles{m};
                                                    
                                                    if strcmp(pooled,'y') == 1
                                                        eval(['x = [parameterfits.pooled' branchname '.' by '.doublebin.' firstbin '.' fit '.' fittype '.' secondbin '.' secondbin '];']);
                                                        eval(['y = [parameterfits.pooled' branchname '.' by '.doublebin.' firstbin '.' fit '.' fittype '.' secondbin '.parametervalues(:,' num2str(m) ')];']);
                                                        eval(['weight = [parameterfits.pooled' branchname '.' by '.doublebin.' firstbin '.' fit '.' fittype '.' secondbin '.weight];']);
                                                        %New: make weight inverse of rmse
                                                        %eval(['weight = [parameterfits.pooled' branchname '.' by '.doublebin.' firstbin '.' fit '.' fittype '.' secondbin '.rmse];']);
                                                        %weight = 1./(weight.^2);
                                                        %End new
                                                    elseif strcmp(pooled,'n') == 1
                                                        eval(['x = [parameterfits.' branchname '.' by '.doublebin.' firstbin '.' fit '.' fittype '.' secondbin '.' secondbin '];']);
                                                        eval(['y = [parameterfits.' branchname '.' by '.doublebin.' firstbin '.' fit '.' fittype '.' secondbin '.parametervalues(:,' num2str(m) ')];']);
                                                        eval(['weight = [parameterfits.' branchname '.' by '.doublebin.' firstbin '.' fit '.' fittype '.' secondbin '.weight];']);
                                                        %New: make weight inverse of rmse
                                                        %eval(['weight = [parameterfits.' branchname '.' by '.doublebin.' firstbin '.' fit '.' fittype '.' secondbin '.rmse];']);
                                                        %weight = 1./(weight.^2);
                                                        %End new
                                                    end
                                                    weight = weight(isfinite(y));
                                                    x      = x(isfinite(y));
                                                    y      = y(isfinite(y));
                                                    
                                                    for n = 1:length(secondfits)
                                                        secondfitcount = secondfitcount + 1;
                                                        secondfit = secondfits{n};
                                                        secondfitlabel = secondfitslabels{n};
                                                        secondfitfilename = secondfitsfilenames{n};
                                                        
                                                        figure; figurecount = figurecount + 1;
                                                        plot(x,y,'bo','MarkerFaceColor','b');
                                                        ylimits = ylim;
                                                        xlabel(secondbinlabel,'FontSize',8,'FontWeight','b');
                                                        ylabel(parametertitle,'FontSize',8,'FontWeight','b');
                                                        title(char(' ',[piecetitles{piecetype} ' Piece ' branchlabel ' Probability by ' bylabel ' vs ' firstbintitle ' -- ' fitlabel ' ' fittypelabel],[parametertitle ' vs ' secondbintitle ' -- ' secondfitlabel ' Fits'],' '),'FontSize',12,'FontWeight','b');
                                                        set(gca,'FontSize',6);
                                                        hold on;
                                                        
                                                        for o = 1:length(secondfittypes)
                                                            secondfittype = secondfittypes{o};
                                                            secondfitstyle = secondfitstyles{o};
                                                            secondfittypelabel = secondfittypeslabels{o};
                                                            secondfittypefilename = secondfittypesfilenames{o};
                                                            
                                                            clear parameter rmse
                                                            eval(['[parameter rmse] = ' secondfit 'fitter' secondfittype '(x,y,weight);']);
                                                            if strcmp(pooled,'y') == 1
                                                                eval(['parameterfits.pooled' branchname '.' by '.doublebin.' firstbin '.' fit '.' fittype '.parameter(' num2str(m) ').' secondfit '.' secondfittype '.parameter = parameter;']);
                                                                eval(['parameterfits.pooled' branchname '.' by '.doublebin.' firstbin '.' fit '.' fittype '.parameter(' num2str(m) ').' secondfit '.' secondfittype '.rmse = rmse;']);
                                                            elseif strcmp(pooled,'n') == 1
                                                                eval(['parameterfits.' branchname '.' by '.doublebin.' firstbin '.' fit '.' fittype '.parameter(' num2str(m) ').' secondfit '.' secondfittype '.parameter = parameter;']);
                                                                eval(['parameterfits.' branchname '.' by '.doublebin.' firstbin '.' fit '.' fittype '.parameter(' num2str(m) ').' secondfit '.' secondfittype '.rmse = rmse;']);
                                                            end
                                                            
                                                            fity = fitter(secondfit,parameter,x);
                                                            eval(['plot(x,fity,' secondfitstyle ');']);
                                                            parameterlabel = parameterlabels(1:length(parameter),:);
                                                            parametervalues = num2str(parameter','%.3e');
                                                            parameterlegend = [parameterlabel parametervalues];
                                                            rmselegend = sprintf('    rmse: %.3e',rmse(1));
                                                            wrmselegend = sprintf('  wrmse: %.3e',rmse(2));
                                                            totallegend = char(' ',[secondfitlabel ' ' secondfittypelabel],' ',parameterlegend,rmselegend,wrmselegend);
                                                            legendtext(1) = {sprintf('%s Data',analysis.inputfilename)};
                                                            legendtext(o+1) = {totallegend};
                                                            
                                                        end
                                                        
                                                        plot(x,y,'bo','MarkerFaceColor','b');
                                                        %fillscreen;
                                                        legend(legendtext,'Location','NorthEastOutside');
                                                        clear legendtext;
                                                        filename = sprintf('%s_%s_%s_%s_%s_%s_%s_%s_P%d_%s',analysis.inputfilename,piecetitles{piecetype},branchname,by,firstbin,secondbin,fitfilename,fittypefilename,m,secondfitfilename);
                                                        print('-djpeg',filename);
                                                        set(gca,'YScale','log');
                                                        filename = sprintf('%s_%s_%s_%s_%s_%s_%s_%s_P%d_%s_logy',analysis.inputfilename,piecetitles{piecetype},branchname,by,firstbin,secondbin,fitfilename,fittypefilename,m,secondfitfilename);
                                                        print('-djpeg',filename);
                                                        set(gca,'XScale','log');
                                                        filename = sprintf('%s_%s_%s_%s_%s_%s_%s_%s_P%d_%s_logy_logx',analysis.inputfilename,piecetitles{piecetype},branchname,by,firstbin,secondbin,fitfilename,fittypefilename,m,secondfitfilename);
                                                        print('-djpeg',filename);
                                                        if strcmp(mnfitteroption.figuresopen,'n'); close all; end;
                                                        if length(fits) > 1; close all; end;
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                                
                                eval(['currentoption = mnfitteroption.' branchname ';']);
                                if strcmp(currentoption.doublebins.fit,'y')
                                    
                                    if exist('doublebinfits','dir')==7
                                        cd('doublebinfits');
                                    else
                                        mkdir('doublebinfits');
                                        cd('doublebinfits');
                                    end
                                    
                                    clear doublefit;
                                    doublefit.measuredata = measuredata;
                                    doublefit.weightdata = weightdata;
                                    doublefit.firstbin.data = firstbindata;
                                    doublefit.secondbin.data = secondbindata;
                                    doublefit.firstbin.fit = currentoption.doublebins.firstbin.fit;
                                    doublefit.parameter(1).fit = currentoption.doublebins.parameter(1).fit;
                                    
                                    eval(['doublefit.parameter(1).parameter = parameterfits.' branchname '.' by '.doublebin.' firstbin '.' currentoption.doublebins.firstbin.fit '.' currentoption.doublebins.firstbin.fittype '.parameter(1).' currentoption.doublebins.parameter(1).fit '.' currentoption.doublebins.parameter(1).fittype '.parameter;']);
                                    doublefit.parameter(2).fit = currentoption.doublebins.parameter(2).fit;
                                    eval(['doublefit.parameter(2).parameter = parameterfits.' branchname '.' by '.doublebin.' firstbin '.' currentoption.doublebins.firstbin.fit '.' currentoption.doublebins.firstbin.fittype '.parameter(2).' currentoption.doublebins.parameter(2).fit '.' currentoption.doublebins.parameter(2).fittype '.parameter;']);
                                    if strcmp(currentoption.doublebins.parameter(3).fit,'none')~=1
                                        doublefit.parameter(3).fit = currentoption.doublebins.parameter(3).fit;
                                        eval(['doublefit.parameter(3).parameter = parameterfits.' branchname '.' by '.doublebin.' firstbin '.' currentoption.doublebins.firstbin.fit '.' currentoption.doublebins.firstbin.fittype '.parameter(3).' currentoption.doublebins.parameter(3).fit '.' currentoption.doublebins.parameter(3).fittype '.parameter;']);
                                    end
                                    if strcmp(currentoption.doublebins.parameter(4).fit,'none')~=1
                                        doublefit.parameter(4).fit = currentoption.doublebins.parameter(4).fit;
                                        eval(['doublefit.parameter(4).parameter = parameterfits.' branchname '.' by '.doublebin.' firstbin '.' currentoption.doublebins.firstbin.fit '.' currentoption.doublebins.firstbin.fittype '.parameter(4).' currentoption.doublebins.parameter(4).fit '.' currentoption.doublebins.parameter(4).fittype '.parameter;']);
                                    end
                                    % keyboard;
                                    
                                    [parameters,rmse,fitdata,unweightedparameters,unweightedrmse,unweightedfitdata,weightedparameters,weightedrmse,weightedfitdata,robustunweightedparameters,robustunweightedrmse,robustunweightedfitdata,robustweightedparameters,robustweightedrmse,robustweightedfitdata] = doublefitter_new(doublefit);
                                    
                                    eval(['parameterfits.' branchname '.' by '.doublebin.' firstbin '.' currentoption.doublebins.firstbin.fit '.' currentoption.doublebins.parameter(1).fit '.initial.parameters = parameters;']);
                                    eval(['parameterfits.' branchname '.' by '.doublebin.' firstbin '.' currentoption.doublebins.firstbin.fit '.' currentoption.doublebins.parameter(1).fit '.initial.rmse = rmse;']);
                                    eval(['parameterfits.' branchname '.' by '.doublebin.' firstbin '.' currentoption.doublebins.firstbin.fit '.' currentoption.doublebins.parameter(1).fit '.initial.fitdata = fitdata;']);
                                    eval(['parameterfits.' branchname '.' by '.doublebin.' firstbin '.' currentoption.doublebins.firstbin.fit '.' currentoption.doublebins.parameter(1).fit '.unweighted.parameters = unweightedparameters;']);
                                    eval(['parameterfits.' branchname '.' by '.doublebin.' firstbin '.' currentoption.doublebins.firstbin.fit '.' currentoption.doublebins.parameter(1).fit '.unweighted.rmse = unweightedrmse;']);
                                    eval(['parameterfits.' branchname '.' by '.doublebin.' firstbin '.' currentoption.doublebins.firstbin.fit '.' currentoption.doublebins.parameter(1).fit '.unweighted.fitdata = unweightedfitdata;']);
                                    eval(['parameterfits.' branchname '.' by '.doublebin.' firstbin '.' currentoption.doublebins.firstbin.fit '.' currentoption.doublebins.parameter(1).fit '.weighted.parameters = weightedparameters;']);
                                    eval(['parameterfits.' branchname '.' by '.doublebin.' firstbin '.' currentoption.doublebins.firstbin.fit '.' currentoption.doublebins.parameter(1).fit '.weighted.rmse = weightedrmse;']);
                                    eval(['parameterfits.' branchname '.' by '.doublebin.' firstbin '.' currentoption.doublebins.firstbin.fit '.' currentoption.doublebins.parameter(1).fit '.weighted.fitdata = weightedfitdata;']);
                                    eval(['parameterfits.' branchname '.' by '.doublebin.' firstbin '.' currentoption.doublebins.firstbin.fit '.' currentoption.doublebins.parameter(1).fit '.robustunweighted.parameters = robustunweightedparameters;']);
                                    eval(['parameterfits.' branchname '.' by '.doublebin.' firstbin '.' currentoption.doublebins.firstbin.fit '.' currentoption.doublebins.parameter(1).fit '.robustunweighted.rmse = robustunweightedrmse;']);
                                    eval(['parameterfits.' branchname '.' by '.doublebin.' firstbin '.' currentoption.doublebins.firstbin.fit '.' currentoption.doublebins.parameter(1).fit '.robustunweighted.fitdata = robustunweightedfitdata;']);
                                    eval(['parameterfits.' branchname '.' by '.doublebin.' firstbin '.' currentoption.doublebins.firstbin.fit '.' currentoption.doublebins.parameter(1).fit '.robustweighted.parameters = robustweightedparameters;']);
                                    eval(['parameterfits.' branchname '.' by '.doublebin.' firstbin '.' currentoption.doublebins.firstbin.fit '.' currentoption.doublebins.parameter(1).fit '.robustweighted.rmse = robustweightedrmse;']);
                                    eval(['parameterfits.' branchname '.' by '.doublebin.' firstbin '.' currentoption.doublebins.firstbin.fit '.' currentoption.doublebins.parameter(1).fit '.robustweighted.fitdata = robustweightedfitdata;']);
                                    
                                    
                                    % This next bit of code removes the triangles of NaNs from the double fit
                                    fitdata = triangleremover(fitdata,measuredata);
                                    unweightedfitdata = triangleremover(unweightedfitdata,measuredata);
                                    weightedfitdata = triangleremover(weightedfitdata,measuredata);
                                    robustunweightedfitdata = triangleremover(robustunweightedfitdata,measuredata);
                                    robustweightedfitdata = triangleremover(robustweightedfitdata,measuredata);
                                    % End of removing triangles of NaNs from the double fit
                                    
                                    if strcmp(currentoption.doublebins.firstbin.fit,'linear')
                                        filename1 = '1lin';
                                    elseif strcmp(currentoption.doublebins.firstbin.fit,'exponential')
                                        filename1 = '2exp';
                                    elseif strcmp(currentoption.doublebins.firstbin.fit,'exponentialoffset')
                                        filename1 = '3expoff';
                                    elseif strcmp(currentoption.doublebins.firstbin.fit,'power')
                                        filename1 = '4pow';
                                    elseif strcmp(currentoption.doublebins.firstbin.fit,'poweroffset')
                                        filename1 = '5powoff';
                                    elseif strcmp(currentoption.doublebins.firstbin.fit,'sigmoid')
                                        filename1 = '6sig';
                                    end
                                    if strcmp(currentoption.doublebins.firstbin.fittype,'unweighted')
                                        filename2 = '1uw';
                                    elseif strcmp(currentoption.doublebins.firstbin.fittype,'weighted')
                                        filename2 = '2wt';
                                    elseif strcmp(currentoption.doublebins.firstbin.fittype,'robust')
                                        filename2 = '3rb';
                                    elseif strcmp(currentoption.doublebins.firstbin.fittype,'robustweighted')
                                        filename2 = '4rw';
                                    end
                                    if strcmp(currentoption.doublebins.parameter(1).fit,'linear')
                                        filename3 = '1lin';
                                    elseif strcmp(currentoption.doublebins.parameter(1).fit,'exponential')
                                        filename3 = '2exp';
                                    elseif strcmp(currentoption.doublebins.parameter(1).fit,'exponentialoffset')
                                        filename3 = '3expoff';
                                    elseif strcmp(currentoption.doublebins.parameter(1).fit,'power')
                                        filename3 = '4pow';
                                    elseif strcmp(currentoption.doublebins.parameter(1).fit,'poweroffset')
                                        filename3 = '5powoff';
                                    elseif strcmp(currentoption.doublebins.parameter(1).fit,'sigmoid')
                                        filename3 = '6sig';
                                    end
                                    if strcmp(currentoption.doublebins.parameter(1).fittype,'unweighted')
                                        filename4 = '1uw';
                                    elseif strcmp(currentoption.doublebins.parameter(1).fittype,'weighted')
                                        filename4 = '2wt';
                                    elseif strcmp(currentoption.doublebins.parameter(1).fittype,'robust')
                                        filename4 = '3rb';
                                    elseif strcmp(currentoption.doublebins.parameter(1).fittype,'robustweighted')
                                        filename4 = '4rw';
                                    end
                                    if strcmp(currentoption.doublebins.parameter(2).fit,'linear')
                                        filename5 = '1lin';
                                    elseif strcmp(currentoption.doublebins.parameter(2).fit,'exponential')
                                        filename5 = '2exp';
                                    elseif strcmp(currentoption.doublebins.parameter(2).fit,'exponentialoffset')
                                        filename5 = '3expoff';
                                    elseif strcmp(currentoption.doublebins.parameter(2).fit,'power')
                                        filename5 = '4pow';
                                    elseif strcmp(currentoption.doublebins.parameter(2).fit,'poweroffset')
                                        filename5 = '5powoff';
                                    elseif strcmp(currentoption.doublebins.parameter(2).fit,'sigmoid')
                                        filename5 = '6sig';
                                    end
                                    if strcmp(currentoption.doublebins.parameter(2).fittype,'unweighted')
                                        filename6 = '1uw';
                                    elseif strcmp(currentoption.doublebins.parameter(2).fittype,'weighted')
                                        filename6 = '2wt';
                                    elseif strcmp(currentoption.doublebins.parameter(2).fittype,'robust')
                                        filename6 = '3rb';
                                    elseif strcmp(currentoption.doublebins.parameter(2).fittype,'robustweighted')
                                        filename6 = '4rw';
                                    end
                                    
                                    figure;
                                    eval(['legendhandle1 = plot3(firstbindata,secondbindata,measuredata,' branchmarker ');']);
                                    hold on;
                                    legendhandle2 = surf(firstbindata,secondbindata,fitdata);
                                    xlabel(firstbinlabel,'FontSize',8,'FontWeight','b');
                                    ylabel(secondbinlabel,'FontSize',8,'FontWeight','b');
                                    zlabel([branchlabel ' Probability'],'FontSize',8,'FontWeight','b');
                                    title(char(' ',[piecetitles{piecetype} ' ' branchlabel ' Probability by ' bylabel ' vs ' firstbintitle ' & ' secondbintitle ' -- Initial Fit'],' '),'FontSize',12,'FontWeight','b');
                                    set(gca,'FontSize',6);
                                    legendhandle1 = legendhandle1(1);
                                    legendhandles = [legendhandle1 legendhandle2];
                                    legendtext1 = char(' ',sprintf('%s Data',analysis.inputfilename),' ');
                                    legendtext(1) = {legendtext1};
                                    clear legendtextprep;
                                    legendtextprep(1) = {'Initial Fit'};
                                    legendtextprep(2) = {sprintf('rmse: %.3e',rmse)};
                                    legendtextprep(3) = {' '};
                                    legendtextprep(4) = {sprintf('%s: %s',firstbintitle,currentoption.doublebins.firstbin.fit)};
                                    linecount = 4;
                                    for i = 1:size(parameters,1)
                                        linecount = linecount + 1;
                                        legendtextprep(linecount) = {sprintf('  P_%d: %s',i,currentoption.doublebins.parameter(i).fit)};
                                        for j = 1:size(parameters,2)
                                            linecount = linecount + 1;
                                            legendtextprep(linecount) = {sprintf('    P_{%d,%d}: %.3e',i,j,parameters(i,j))};
                                        end
                                    end
                                    legendtextprep = char(legendtextprep);
                                    legendtext(2) = {legendtextprep};
                                    legend(legendhandles,legendtext,'Location','NorthEast');
                                    filename = sprintf('%s_%s_%s_%s_vs_%s_%s_%s_%s_%s_%s_%s_%s_1st',analysis.inputfilename,piecetitles{piecetype},branchname,by,firstbin,secondbin,filename1,filename2,filename3,filename4,filename5,filename6);
                                    saveas(gcf,filename,'fig');
                                    print('-djpeg',filename);
                                    set(gca,'ZScale','log');
                                    filename = sprintf('%s_%s_%s_%s_vs_%s_%s_%s_%s_%s_%s_%s_%s_1st_lz',analysis.inputfilename,piecetitles{piecetype},branchname,by,firstbin,secondbin,filename1,filename2,filename3,filename4,filename5,filename6);
                                    print('-djpeg',filename);
                                    set(gca,'XScale','log');
                                    filename = sprintf('%s_%s_%s_%s_vs_%s_%s_%s_%s_%s_%s_%s_%s_1st_lz_lx',analysis.inputfilename,piecetitles{piecetype},branchname,by,firstbin,secondbin,filename1,filename2,filename3,filename4,filename5,filename6);
                                    print('-djpeg',filename);
                                    
                                    
                                    figure;
                                    eval(['legendhandle1 = plot3(firstbindata,secondbindata,measuredata,' branchmarker ');']);
                                    hold on;
                                    legendhandle2 = surf(firstbindata,secondbindata,unweightedfitdata);
                                    xlabel(firstbinlabel,'FontSize',8,'FontWeight','b');
                                    ylabel(secondbinlabel,'FontSize',8,'FontWeight','b');
                                    zlabel([branchlabel ' Probability'],'FontSize',8,'FontWeight','b');
                                    title(char(' ',[piecetitles{piecetype} ' ' branchlabel ' Probability by ' bylabel ' vs ' firstbintitle ' & ' secondbintitle ' -- Unweighted Fit'],' '),'FontSize',12,'FontWeight','b');
                                    set(gca,'FontSize',6);
                                    legendhandle1 = legendhandle1(1);
                                    legendhandles = [legendhandle1 legendhandle2];
                                    legendtext1 = char(' ',sprintf('%s Data',analysis.inputfilename),' ');
                                    legendtext(1) = {legendtext1};
                                    clear legendtextprep;
                                    legendtextprep(1) = {'Unweighted Fit'};
                                    legendtextprep(2) = {sprintf('rmse: %.3e',unweightedrmse)};
                                    legendtextprep(3) = {' '};
                                    legendtextprep(4) = {sprintf('%s: %s',firstbintitle,currentoption.doublebins.firstbin.fit)};
                                    linecount = 4;
                                    for i = 1:size(unweightedparameters,1)
                                        linecount = linecount + 1;
                                        legendtextprep(linecount) = {sprintf('  P_%d: %s',i,currentoption.doublebins.parameter(i).fit)};
                                        for j = 1:size(unweightedparameters,2)
                                            linecount = linecount + 1;
                                            legendtextprep(linecount) = {sprintf('    P_{%d,%d}: %.3e',i,j,unweightedparameters(i,j))};
                                        end
                                    end
                                    legendtextprep = char(legendtextprep);
                                    legendtext(2) = {legendtextprep};
                                    legend(legendhandles,legendtext,'Location','NorthEast');
                                    filename = sprintf('%s_%s_%s_%s_vs_%s_%s_%s_%s_%s_%s_%s_%s_uw',analysis.inputfilename,piecetitles{piecetype},branchname,by,firstbin,secondbin,filename1,filename2,filename3,filename4,filename5,filename6);
                                    saveas(gcf,filename,'fig');
                                    print('-djpeg',filename);
                                    set(gca,'ZScale','log');
                                    filename = sprintf('%s_%s_%s_%s_vs_%s_%s_%s_%s_%s_%s_%s_%s_uw_lz',analysis.inputfilename,piecetitles{piecetype},branchname,by,firstbin,secondbin,filename1,filename2,filename3,filename4,filename5,filename6);
                                    print('-djpeg',filename);
                                    set(gca,'XScale','log');
                                    filename = sprintf('%s_%s_%s_%s_vs_%s_%s_%s_%s_%s_%s_%s_%s_uw_lz_lx',analysis.inputfilename,piecetitles{piecetype},branchname,by,firstbin,secondbin,filename1,filename2,filename3,filename4,filename5,filename6);
                                    print('-djpeg',filename);
                                    
                                    figure;
                                    eval(['legendhandle1 = plot3(firstbindata,secondbindata,measuredata,' branchmarker ');']);
                                    hold on;
                                    legendhandle2 = surf(firstbindata,secondbindata,weightedfitdata);
                                    xlabel(firstbinlabel,'FontSize',8,'FontWeight','b');
                                    ylabel(secondbinlabel,'FontSize',8,'FontWeight','b');
                                    zlabel([branchlabel ' Probability'],'FontSize',8,'FontWeight','b');
                                    title(char(' ',[piecetitles{piecetype} ' ' branchlabel ' Probability by ' bylabel ' vs ' firstbintitle ' & ' secondbintitle ' -- Weighted Fit'],' '),'FontSize',12,'FontWeight','b');
                                    set(gca,'FontSize',6);
                                    legendhandle1 = legendhandle1(1);
                                    legendhandles = [legendhandle1 legendhandle2];
                                    legendtext1 = char(' ',sprintf('%s Data',analysis.inputfilename),' ');
                                    legendtext(1) = {legendtext1};
                                    clear legendtextprep;
                                    legendtextprep(1) = {'Weighted Fit'};
                                    legendtextprep(2) = {sprintf('rmse: %.3e',weightedrmse)};
                                    legendtextprep(3) = {' '};
                                    legendtextprep(4) = {sprintf('%s: %s',firstbintitle,currentoption.doublebins.firstbin.fit)};
                                    linecount = 4;
                                    for i = 1:size(weightedparameters,1)
                                        linecount = linecount + 1;
                                        legendtextprep(linecount) = {sprintf('  P_%d: %s',i,currentoption.doublebins.parameter(i).fit)};
                                        for j = 1:size(weightedparameters,2)
                                            linecount = linecount + 1;
                                            legendtextprep(linecount) = {sprintf('    P_{%d,%d}: %.3e',i,j,weightedparameters(i,j))};
                                        end
                                    end
                                    legendtextprep = char(legendtextprep);
                                    legendtext(2) = {legendtextprep};
                                    legend(legendhandles,legendtext,'Location','NorthEast');
                                    filename = sprintf('%s_%s_%s_%s_vs_%s_%s_%s_%s_%s_%s_%s_%s_w',analysis.inputfilename,piecetitles{piecetype},branchname,by,firstbin,secondbin,filename1,filename2,filename3,filename4,filename5,filename6);
                                    saveas(gcf,filename,'fig');
                                    print('-djpeg',filename);
                                    set(gca,'ZScale','log');
                                    filename = sprintf('%s_%s_%s_%s_vs_%s_%s_%s_%s_%s_%s_%s_%s_w_lz',analysis.inputfilename,piecetitles{piecetype},branchname,by,firstbin,secondbin,filename1,filename2,filename3,filename4,filename5,filename6);
                                    print('-djpeg',filename);
                                    set(gca,'XScale','log');
                                    filename = sprintf('%s_%s_%s_%s_vs_%s_%s_%s_%s_%s_%s_%s_%s_w_lz_lx',analysis.inputfilename,piecetitles{piecetype},branchname,by,firstbin,secondbin,filename1,filename2,filename3,filename4,filename5,filename6);
                                    print('-djpeg',filename);
                                    if strcmp(mnfitteroption.figuresopen,'n'); close all; end;
                                    
                                    figure;
                                    eval(['legendhandle1 = plot3(firstbindata,secondbindata,measuredata,' branchmarker ');']);
                                    hold on;
                                    legendhandle2 = surf(firstbindata,secondbindata,robustunweightedfitdata);
                                    xlabel(firstbinlabel,'FontSize',8,'FontWeight','b');
                                    ylabel(secondbinlabel,'FontSize',8,'FontWeight','b');
                                    zlabel([branchlabel ' Probability'],'FontSize',8,'FontWeight','b');
                                    title(char(' ',[piecetitles{piecetype} ' ' branchlabel ' Probability by ' bylabel ' vs ' firstbintitle ' & ' secondbintitle ' -- Robust Unweighted Fit'],' '),'FontSize',12,'FontWeight','b');
                                    set(gca,'FontSize',6);
                                    legendhandle1 = legendhandle1(1);
                                    legendhandles = [legendhandle1 legendhandle2];
                                    legendtext1 = char(' ',sprintf('%s Data',analysis.inputfilename),' ');
                                    legendtext(1) = {legendtext1};
                                    clear legendtextprep;
                                    legendtextprep(1) = {'Robust Unweighted Fit'};
                                    legendtextprep(2) = {sprintf('rmse: %.3e',robustunweightedrmse)};
                                    legendtextprep(3) = {' '};
                                    legendtextprep(4) = {sprintf('%s: %s',firstbintitle,currentoption.doublebins.firstbin.fit)};
                                    linecount = 4;
                                    for i = 1:size(robustunweightedparameters,1)
                                        linecount = linecount + 1;
                                        legendtextprep(linecount) = {sprintf('  P_%d: %s',i,currentoption.doublebins.parameter(i).fit)};
                                        for j = 1:size(robustunweightedparameters,2)
                                            linecount = linecount + 1;
                                            legendtextprep(linecount) = {sprintf('    P_{%d,%d}: %.3e',i,j,robustunweightedparameters(i,j))};
                                        end
                                    end
                                    legendtextprep = char(legendtextprep);
                                    legendtext(2) = {legendtextprep};
                                    legend(legendhandles,legendtext,'Location','NorthEast');
                                    filename = sprintf('%s_%s_%s_%s_vs_%s_%s_%s_%s_%s_%s_%s_%s_uwr',analysis.inputfilename,piecetitles{piecetype},branchname,by,firstbin,secondbin,filename1,filename2,filename3,filename4,filename5,filename6);
                                    saveas(gcf,filename,'fig');
                                    print('-djpeg',filename);
                                    set(gca,'ZScale','log');
                                    filename = sprintf('%s_%s_%s_%s_vs_%s_%s_%s_%s_%s_%s_%s_%s_uwr_lz',analysis.inputfilename,piecetitles{piecetype},branchname,by,firstbin,secondbin,filename1,filename2,filename3,filename4,filename5,filename6);
                                    print('-djpeg',filename);
                                    set(gca,'XScale','log');
                                    filename = sprintf('%s_%s_%s_%s_vs_%s_%s_%s_%s_%s_%s_%s_%s_uwr_lz_lx',analysis.inputfilename,piecetitles{piecetype},branchname,by,firstbin,secondbin,filename1,filename2,filename3,filename4,filename5,filename6);
                                    print('-djpeg',filename);
                                    
                                    figure;
                                    eval(['legendhandle1 = plot3(firstbindata,secondbindata,measuredata,' branchmarker ');']);
                                    hold on;
                                    legendhandle2 = surf(firstbindata,secondbindata,robustweightedfitdata);
                                    xlabel(firstbinlabel,'FontSize',8,'FontWeight','b');
                                    ylabel(secondbinlabel,'FontSize',8,'FontWeight','b');
                                    zlabel([branchlabel ' Probability'],'FontSize',8,'FontWeight','b');
                                    title(char(' ',[piecetitles{piecetype} ' ' branchlabel ' Probability by ' bylabel ' vs ' firstbintitle ' & ' secondbintitle ' -- Robust Weighted Fit'],' '),'FontSize',12,'FontWeight','b');
                                    set(gca,'FontSize',6);
                                    legendhandle1 = legendhandle1(1);
                                    legendhandles = [legendhandle1 legendhandle2];
                                    legendtext1 = char(' ',sprintf('%s Data',analysis.inputfilename),' ');
                                    legendtext(1) = {legendtext1};
                                    clear legendtextprep;
                                    legendtextprep(1) = {'Robust Weighted Fit'};
                                    legendtextprep(2) = {sprintf('rmse: %.3e',robustweightedrmse)};
                                    legendtextprep(3) = {' '};
                                    legendtextprep(4) = {sprintf('%s: %s',firstbintitle,currentoption.doublebins.firstbin.fit)};
                                    linecount = 4;
                                    for i = 1:size(robustweightedparameters,1)
                                        linecount = linecount + 1;
                                        legendtextprep(linecount) = {sprintf('  P_%d: %s',i,currentoption.doublebins.parameter(i).fit)};
                                        for j = 1:size(robustweightedparameters,2)
                                            linecount = linecount + 1;
                                            legendtextprep(linecount) = {sprintf('    P_{%d,%d}: %.3e',i,j,robustweightedparameters(i,j))};
                                        end
                                    end
                                    legendtextprep = char(legendtextprep);
                                    legendtext(2) = {legendtextprep};
                                    legend(legendhandles,legendtext,'Location','NorthEast');
                                    filename = sprintf('%s_%s_%s_%s_vs_%s_%s_%s_%s_%s_%s_%s_%s_wr',analysis.inputfilename,piecetitles{piecetype},branchname,by,firstbin,secondbin,filename1,filename2,filename3,filename4,filename5,filename6);
                                    saveas(gcf,filename,'fig');
                                    print('-djpeg',filename);
                                    set(gca,'ZScale','log');
                                    filename = sprintf('%s_%s_%s_%s_vs_%s_%s_%s_%s_%s_%s_%s_%s_wr_lz',analysis.inputfilename,piecetitles{piecetype},branchname,by,firstbin,secondbin,filename1,filename2,filename3,filename4,filename5,filename6);
                                    print('-djpeg',filename);
                                    set(gca,'XScale','log');
                                    filename = sprintf('%s_%s_%s_%s_vs_%s_%s_%s_%s_%s_%s_%s_%s_wr_lz_lx',analysis.inputfilename,piecetitles{piecetype},branchname,by,firstbin,secondbin,filename1,filename2,filename3,filename4,filename5,filename6);
                                    print('-djpeg',filename);
                                    if strcmp(mnfitteroption.figuresopen,'n'); close all; end;
                                end
                            end
                        end
                    end
                end
            end
        end
        
    end
end
