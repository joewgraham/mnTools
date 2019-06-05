function parameterfits = branchtypefitter(analysis,parameterfits,mnfitteroption)

disp('     Branch Type Probability.');

piecetypes{1} = 'soma';
piecetypes{2} = 'axon';
piecetypes{3} = 'dendrite';
piecetypes{4} = 'apical';

piecetitles{1} = 'Somatic';
piecetitles{2} = 'Axonal';
piecetitles{3} = 'Dendritic';
piecetitles{4} = 'Apical';

for piecetype = 2:4
    
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
    if exist('branchtypeprob','dir')==7
        cd('branchtypeprob');
    else
        mkdir('branchtypeprob');
        cd('branchtypeprob');
    end
    
    eval(['fittypeoption = mnfitteroption.' piecetypes{piecetype} ';']);
    
    if isfield(analysis,piecetypes{piecetype}) && strcmp(fittypeoption,'y')
        
        eval(['typeanalysis = analysis.' piecetypes{piecetype} ';']);
        
        % Diameter
        
        diameter = [typeanalysis.diameter.diameter]';
        diameterterms = [typeanalysis.diameter.numberterminatingbranches.total]';
        diameterbifs = [typeanalysis.diameter.numberbifurcatingbranches.total]';
        diametertotal = ([typeanalysis.diameter.numberbifurcatingbranches.total] + [typeanalysis.diameter.numberterminatingbranches.total])';
        
        [diam01,diamdev01] = glmfit(diameter,[diameterterms diametertotal],'binomial','link','logit');
        parameterfits.branchtermprob.diameter.logit.parameter = diam01;
        parameterfits.branchtermprob.diameter.logit.deviance = diamdev01;
                
        [diam02,diamdev02] = glmfit(diameter,[diameterbifs diametertotal],'binomial','link','logit');
        parameterfits.branchbifprob.diameter.logit.parameter = diam02;
        parameterfits.branchbifprob.diameter.logit.deviance = diamdev02;
        diammeandev02 = diamdev02 / length(diametertotal(diametertotal~=0));
        
        [diam03,diamdev03] = glmfit(diameter,[diameterterms diametertotal],'binomial','link','probit');
        parameterfits.branchtermprob.diameter.probit.parameter = diam03;
        parameterfits.branchtermprob.diameter.probit.deviance = diamdev03;
        
        [diam04,diamdev04] = glmfit(diameter,[diameterbifs diametertotal],'binomial','link','probit');
        parameterfits.branchbifprob.diameter.probit.parameter = diam04;
        parameterfits.branchbifprob.diameter.probit.deviance = diamdev04;
        diammeandev04 = diamdev04 / length(diametertotal(diametertotal~=0));
        
        % [diam05,diamdev05] = glmfit(diameter,[diameterterms diametertotal],'binomial','link','identity');
        % parameterfits.branchtermprob.diameter.identity.parameter = diam05;
        % parameterfits.branchtermprob.diameter.identity.deviance = diamdev05;
        
        % [diam06,diamdev06] = glmfit(diameter,[diameterbifs diametertotal],'binomial','link','identity');
        % parameterfits.branchbifprob.diameter.identity.parameter = diam06;
        % parameterfits.branchbifprob.diameter.identity.deviance = diamdev06;
        
        % [diam07,diamdev07] = glmfit(diameter,[diameterterms diametertotal],'binomial','link','log');
        % parameterfits.branchtermprob.diameter.log.parameter = diam07;
        % parameterfits.branchtermprob.diameter.log.deviance = diamdev07;
        
        % [diam08,diamdev08] = glmfit(diameter,[diameterbifs diametertotal],'binomial','link','log');
        % parameterfits.branchbifprob.diameter.log.parameter = diam08;
        % parameterfits.branchbifprob.diameter.log.deviance = diamdev08;
        
        [diam09,diamdev09] = glmfit(diameter,[diameterterms diametertotal],'binomial','link','comploglog');
        parameterfits.branchtermprob.diameter.comploglog.parameter = diam09;
        parameterfits.branchtermprob.diameter.comploglog.deviance = diamdev09;
        
        [diam10,diamdev10] = glmfit(diameter,[diameterbifs diametertotal],'binomial','link','comploglog');
        parameterfits.branchbifprob.diameter.comploglog.parameter = diam10;
        parameterfits.branchbifprob.diameter.comploglog.deviance = diamdev10;
        diammeandev10 = diamdev10 / length(diametertotal(diametertotal~=0));
        
        % [diam11,diamdev11] = glmfit(diameter,[diameterterms diametertotal],'binomial','link','reciprocal');
        % parameterfits.branchtermprob.diameter.reciprocal.parameter = diam11;
        % parameterfits.branchtermprob.diameter.reciprocal.deviance = diamdev11;
        
        % [diam12,diamdev12] = glmfit(diameter,[diameterbifs diametertotal],'binomial','link','reciprocal');
        % parameterfits.branchbifprob.diameter.reciprocal.parameter = diam12;
        % parameterfits.branchbifprob.diameter.reciprocal.deviance = diamdev12;
        
        [diam13,diamdev13] = glmfit(diameter,[diameterterms diametertotal],'binomial','link','loglog');
        parameterfits.branchtermprob.diameter.loglog.parameter = diam13;
        parameterfits.branchtermprob.diameter.loglog.deviance = diamdev13;
        
        [diam14,diamdev14] = glmfit(diameter,[diameterbifs diametertotal],'binomial','link','loglog');
        parameterfits.branchbifprob.diameter.loglog.parameter = diam14;
        parameterfits.branchbifprob.diameter.loglog.deviance = diamdev14;
        diammeandev14 = diamdev14 / length(diametertotal(diametertotal~=0));
        
        
        
        
        
        figurehandle = figure;
        plot(diameter,diameterbifs./diametertotal,'gs','MarkerFaceColor','g');
        xlabel('Diameter (\mum)','FontSize',8,'FontWeight','b');
        ylabel('Probability','FontSize',8,'FontWeight','b');
        title(char(' ',[piecetitles{piecetype} ' Branch Bifurcation / Termination Probability vs Diameter -- Binomial Fits'],' '),'FontSize',12,'FontWeight','b');
        set(gca,'FontSize',6);
        hold on;
        
        fittermlogit      = fitter('logit',diam01,diameter);
        fitbiflogit       = fitter('logit',diam02,diameter);
        fittermprobit     = fitter('probit',diam03,diameter);
        fitbifprobit      = fitter('probit',diam04,diameter);
        %fittermidentity   = fitter('identity',diam05,diameter);
        %fitbifidentity    = fitter('identity',diam06,diameter);
        %fittermlog        = fitter('log',diam07,diameter);
        %fitbiflog         = fitter('log',diam08,diameter);
        fittermcomploglog = fitter('comploglog',diam09,diameter);
        fitbifcomploglog  = fitter('comploglog',diam10,diameter);
        %fittermreciprocal = fitter('reciprocal',diam11,diameter);
        %fitbifreciprocal  = fitter('reciprocal',diam12,diameter);
        fittermloglog     = fitter('loglog',diam13,diameter);
        fitbifloglog      = fitter('loglog',diam14,diameter);
        
        plot(diameter,fitbiflogit,'-c','LineWidth',6);
        plot(diameter,fitbifprobit,'--y','LineWidth',5);
        plot(diameter,fitbifcomploglog,'-.m','LineWidth',4);
        plot(diameter,fitbifloglog,':k','LineWidth',3);
        
        plot(diameter,fittermlogit,'-c','LineWidth',6);
        plot(diameter,fittermprobit,'--y','LineWidth',5);
        plot(diameter,fittermloglog,'-.m','LineWidth',4);
        plot(diameter,fittermcomploglog,':k','LineWidth',3);
        
        
        plot(diameter,diameterbifs./diametertotal,'gs','MarkerFaceColor','g');
        plot(diameter,diameterterms./diametertotal,'rd','MarkerFaceColor','r');
        
        legendtext(1) = {sprintf('%s Bif Prob',analysis.inputfilename)};
        legendtext(2) = {char(' ','  Logit Fit',' ',sprintf('      P_1: %.3e',diam02(1)),sprintf('      P_2: %.3e',diam02(2)),sprintf('    dev: %.3e',diamdev02),sprintf('meandev: %.3e',diammeandev02),' ')};
        legendtext(3) = {char(' ','  Probit Fit',' ',sprintf('      P_1: %.3e',diam04(1)),sprintf('      P_2: %.3e',diam04(2)),sprintf('    dev: %.3e',diamdev04),sprintf('meandev: %.3e',diammeandev04),' ')};
        legendtext(4) = {char(' ','  CompLogLog Fit',' ',sprintf('      P_1: %.3e',diam10(1)),sprintf('      P_2: %.3e',diam10(2)),sprintf('    dev: %.3e',diamdev10),sprintf('meandev: %.3e',diammeandev10),' ')};
        legendtext(5) = {char(' ','  LogLog Fit',' ',sprintf('      P_1: %.3e',diam14(1)),sprintf('      P_2: %.3e',diam14(2)),sprintf('    dev: %.3e',diamdev14),sprintf('meandev: %.3e',diammeandev14),' ')};
        
        %fillscreen;
        legend(legendtext,'Location','NorthEastOutside'); clear legendtext;
        filename = sprintf('%s_%s_01_branchtypeprob_vs_diameter',analysis.inputfilename,piecetitles{piecetype});
        print('-djpeg',filename);
        
        set(gca,'XScale','log');
        filename = sprintf('%s_%s_01_branchtypeprob_vs_diameter_semilogx',analysis.inputfilename,piecetitles{piecetype});
        print('-djpeg',filename);
        
        set(gca,'YScale','log');
        ylimits = ylim;
        ylim([0.01 ylimits(2)]);
        filename = sprintf('%s_%s_01_branchtypeprob_vs_diameter_loglog',analysis.inputfilename,piecetitles{piecetype});
        print('-djpeg',filename);
        
        
        
        
        
        
        
        
        
        
        % Path Length
        
        pathlength = [typeanalysis.pathlength.pathlength]';
        pathlengthterms = [typeanalysis.pathlength.numberterminatingbranches.total]';
        pathlengthbifs = [typeanalysis.pathlength.numberbifurcatingbranches.total]';
        pathlengthtotal = ([typeanalysis.pathlength.numberbifurcatingbranches.total] + [typeanalysis.pathlength.numberterminatingbranches.total])';
        
        [path01,pathdev01] = glmfit(pathlength,[pathlengthterms pathlengthtotal],'binomial','link','logit');
        parameterfits.branchtermprob.pathlength.logit.parameter = path01;
        parameterfits.branchtermprob.pathlength.logit.deviance = pathdev01;
        
        [path02,pathdev02] = glmfit(pathlength,[pathlengthbifs pathlengthtotal],'binomial','link','logit');
        parameterfits.branchbifprob.pathlength.logit.parameter = path02;
        parameterfits.branchbifprob.pathlength.logit.deviance = pathdev02;
        pathmeandev02 = pathdev02 / length(pathlengthtotal(pathlengthtotal~=0));
        
        [path03,pathdev03] = glmfit(pathlength,[pathlengthterms pathlengthtotal],'binomial','link','probit');
        parameterfits.branchtermprob.pathlength.probit.parameter = path03;
        parameterfits.branchtermprob.pathlength.probit.deviance = pathdev03;
        
        [path04,pathdev04] = glmfit(pathlength,[pathlengthbifs pathlengthtotal],'binomial','link','probit');
        parameterfits.branchbifprob.pathlength.probit.parameter = path04;
        parameterfits.branchbifprob.pathlength.probit.deviance = pathdev04;
        pathmeandev04 = pathdev04 / length(pathlengthtotal(pathlengthtotal~=0));
        
        % [path05,pathdev05] = glmfit(pathlength,[pathlengthterms pathlengthtotal],'binomial','link','identity');
        % parameterfits.branchtermprob.pathlength.identity.parameter = path05;
        % parameterfits.branchtermprob.pathlength.identity.deviance = pathdev05;
        
        % [path06,pathdev06] = glmfit(pathlength,[pathlengthbifs pathlengthtotal],'binomial','link','identity');
        % parameterfits.branchbifprob.pathlength.identity.parameter = path06;
        % parameterfits.branchbifprob.pathlength.identity.deviance = pathdev06;
        
        % [path07,pathdev07] = glmfit(pathlength,[pathlengthterms pathlengthtotal],'binomial','link','log');
        % parameterfits.branchtermprob.pathlength.log.parameter = path07;
        % parameterfits.branchtermprob.pathlength.log.deviance = pathdev07;
        
        % [path08,pathdev08] = glmfit(pathlength,[pathlengthbifs pathlengthtotal],'binomial','link','log');
        % parameterfits.branchbifprob.pathlength.log.parameter = path08;
        % parameterfits.branchbifprob.pathlength.log.deviance = pathdev08;
        
        [path09,pathdev09] = glmfit(pathlength,[pathlengthterms pathlengthtotal],'binomial','link','comploglog');
        parameterfits.branchtermprob.pathlength.comploglog.parameter = path09;
        parameterfits.branchtermprob.pathlength.comploglog.deviance = pathdev09;
        
        [path10,pathdev10] = glmfit(pathlength,[pathlengthbifs pathlengthtotal],'binomial','link','comploglog');
        parameterfits.branchbifprob.pathlength.comploglog.parameter = path10;
        parameterfits.branchbifprob.pathlength.comploglog.deviance = pathdev10;
        pathmeandev10 = pathdev10 / length(pathlengthtotal(pathlengthtotal~=0));
        
        % [path11,pathdev11] = glmfit(pathlength,[pathlengthterms pathlengthtotal],'binomial','link','reciprocal');
        % parameterfits.branchtermprob.pathlength.reciprocal.parameter = path11;
        % parameterfits.branchtermprob.pathlength.reciprocal.deviance = pathdev11;
        
        % [path12,pathdev12] = glmfit(pathlength,[pathlengthbifs pathlengthtotal],'binomial','link','reciprocal');
        % parameterfits.branchbifprob.pathlength.reciprocal.parameter = path12;
        % parameterfits.branchbifprob.pathlength.reciprocal.deviance = pathdev12;
        
        [path13,pathdev13] = glmfit(pathlength,[pathlengthterms pathlengthtotal],'binomial','link','loglog');
        parameterfits.branchtermprob.pathlength.loglog.parameter = path13;
        parameterfits.branchtermprob.pathlength.loglog.deviance = pathdev13;
        
        [path14,pathdev14] = glmfit(pathlength,[pathlengthbifs pathlengthtotal],'binomial','link','loglog');
        parameterfits.branchbifprob.pathlength.loglog.parameter = path14;
        parameterfits.branchbifprob.pathlength.loglog.deviance = pathdev14;
        pathmeandev14 = pathdev14 / length(pathlengthtotal(pathlengthtotal~=0));
        
        
        
        
        
        figurehandle = figure;
        plot(pathlength,pathlengthbifs./pathlengthtotal,'gs','MarkerFaceColor','g');
        xlabel('Path Length (\mum)','FontSize',8,'FontWeight','b');
        ylabel('Probability','FontSize',8,'FontWeight','b');
        title(char(' ',[piecetitles{piecetype} ' Branch Bifurcation / Termination Probability vs Path Length -- Binomial Fits'],' '),'FontSize',12,'FontWeight','b');
        set(gca,'FontSize',6);
        hold on;
        
        fittermlogit      = fitter('logit',path01,pathlength);
        fitbiflogit       = fitter('logit',path02,pathlength);
        fittermprobit     = fitter('probit',path03,pathlength);
        fitbifprobit      = fitter('probit',path04,pathlength);
        %fittermidentity   = fitter('identity',path05,pathlength);
        %fitbifidentity    = fitter('identity',path06,pathlength);
        %fittermlog        = fitter('log',path07,pathlength);
        %fitbiflog         = fitter('log',path08,pathlength);
        fittermcomploglog = fitter('comploglog',path09,pathlength);
        fitbifcomploglog  = fitter('comploglog',path10,pathlength);
        %fittermreciprocal = fitter('reciprocal',path11,pathlength);
        %fitbifreciprocal  = fitter('reciprocal',path12,pathlength);
        fittermloglog     = fitter('loglog',path13,pathlength);
        fitbifloglog      = fitter('loglog',path14,pathlength);
        
        plot(pathlength,fitbiflogit,'-c','LineWidth',6);
        plot(pathlength,fitbifprobit,'--y','LineWidth',5);
        plot(pathlength,fitbifcomploglog,'-.m','LineWidth',4);
        plot(pathlength,fitbifloglog,':k','LineWidth',3);
        
        plot(pathlength,fittermlogit,'-c','LineWidth',6);
        plot(pathlength,fittermprobit,'--y','LineWidth',5);
        plot(pathlength,fittermloglog,'-.m','LineWidth',4);
        plot(pathlength,fittermcomploglog,':k','LineWidth',3);
        
        
        plot(pathlength,pathlengthbifs./pathlengthtotal,'gs','MarkerFaceColor','g');
        plot(pathlength,pathlengthterms./pathlengthtotal,'rd','MarkerFaceColor','r');
        
        legendtext(1) = {sprintf('%s Bif Prob',analysis.inputfilename)};
        legendtext(2) = {char(' ','  Logit Fit',' ',sprintf('      P_1: %.3e',path02(1)),sprintf('      P_2: %.3e',path02(2)),sprintf('    dev: %.3e',pathdev02),sprintf('meandev: %.3e',pathmeandev02),' ')};
        legendtext(3) = {char(' ','  Probit Fit',' ',sprintf('      P_1: %.3e',path04(1)),sprintf('      P_2: %.3e',path04(2)),sprintf('    dev: %.3e',pathdev04),sprintf('meandev: %.3e',pathmeandev04),' ')};
        legendtext(4) = {char(' ','  CompLogLog Fit',' ',sprintf('      P_1: %.3e',path10(1)),sprintf('      P_2: %.3e',path10(2)),sprintf('    dev: %.3e',pathdev10),sprintf('meandev: %.3e',pathmeandev10),' ')};
        legendtext(5) = {char(' ','  LogLog Fit',' ',sprintf('      P_1: %.3e',path14(1)),sprintf('      P_2: %.3e',path14(2)),sprintf('    dev: %.3e',pathdev14),sprintf('meandev: %.3e',pathmeandev14),' ')};
        
        %fillscreen;
        legend(legendtext,'Location','NorthEastOutside'); clear legendtext;
        filename = sprintf('%s_%s_02_branchtypeprob_vs_pathlength',analysis.inputfilename,piecetitles{piecetype});
        print('-djpeg',filename);
        
        set(gca,'XScale','log');
        filename = sprintf('%s_%s_02_branchtypeprob_vs_pathlength_semilogx',analysis.inputfilename,piecetitles{piecetype});
        print('-djpeg',filename);
        
        set(gca,'YScale','log');
        ylimits = ylim;
        ylim([0.01 ylimits(2)]);
        filename = sprintf('%s_%s_02_branchtypeprob_vs_pathlength_loglog',analysis.inputfilename,piecetitles{piecetype});
        print('-djpeg',filename);
        
        
        
        
        
        
        
        
        
        
        
        
        % Radial Distance
        
        radialdistance = [typeanalysis.radialdistance.radialdistance]';
        radialdistanceterms = [typeanalysis.radialdistance.numberterminatingbranches.total]';
        radialdistancebifs = [typeanalysis.radialdistance.numberbifurcatingbranches.total]';
        radialdistancetotal = ([typeanalysis.radialdistance.numberbifurcatingbranches.total] + [typeanalysis.radialdistance.numberterminatingbranches.total])';
        
        [radd01,radddev01] = glmfit(radialdistance,[radialdistanceterms radialdistancetotal],'binomial','link','logit');
        parameterfits.branchtermprob.radialdistance.logit.parameter = radd01;
        parameterfits.branchtermprob.radialdistance.logit.deviance = radddev01;
        
        [radd02,radddev02] = glmfit(radialdistance,[radialdistancebifs radialdistancetotal],'binomial','link','logit');
        parameterfits.branchbifprob.radialdistance.logit.parameter = radd02;
        parameterfits.branchbifprob.radialdistance.logit.deviance = radddev02;
        raddmeandev02 = radddev02 / length(radialdistancetotal(radialdistancetotal~=0));
        
        [radd03,radddev03] = glmfit(radialdistance,[radialdistanceterms radialdistancetotal],'binomial','link','probit');
        parameterfits.branchtermprob.radialdistance.probit.parameter = radd03;
        parameterfits.branchtermprob.radialdistance.probit.deviance = radddev03;
        
        [radd04,radddev04] = glmfit(radialdistance,[radialdistancebifs radialdistancetotal],'binomial','link','probit');
        parameterfits.branchbifprob.radialdistance.probit.parameter = radd04;
        parameterfits.branchbifprob.radialdistance.probit.deviance = radddev04;
        raddmeandev04 = radddev04 / length(radialdistancetotal(radialdistancetotal~=0));
        
        % [radd05,radddev05] = glmfit(radialdistance,[radialdistanceterms radialdistancetotal],'binomial','link','identity');
        % parameterfits.branchtermprob.radialdistance.identity.parameter = radd05;
        % parameterfits.branchtermprob.radialdistance.identity.deviance = radddev05;
        
        % [radd06,radddev06] = glmfit(radialdistance,[radialdistancebifs radialdistancetotal],'binomial','link','identity');
        % parameterfits.branchbifprob.radialdistance.identity.parameter = radd06;
        % parameterfits.branchbifprob.radialdistance.identity.deviance = radddev06;
        
        % [radd07,radddev07] = glmfit(radialdistance,[radialdistanceterms radialdistancetotal],'binomial','link','log');
        % parameterfits.branchtermprob.radialdistance.log.parameter = radd07;
        % parameterfits.branchtermprob.radialdistance.log.deviance = radddev07;
        
        % [radd08,radddev08] = glmfit(radialdistance,[radialdistancebifs radialdistancetotal],'binomial','link','log');
        % parameterfits.branchbifprob.radialdistance.log.parameter = radd08;
        % parameterfits.branchbifprob.radialdistance.log.deviance = radddev08;
        
        [radd09,radddev09] = glmfit(radialdistance,[radialdistanceterms radialdistancetotal],'binomial','link','comploglog');
        parameterfits.branchtermprob.radialdistance.comploglog.parameter = radd09;
        parameterfits.branchtermprob.radialdistance.comploglog.deviance = radddev09;
        
        [radd10,radddev10] = glmfit(radialdistance,[radialdistancebifs radialdistancetotal],'binomial','link','comploglog');
        parameterfits.branchbifprob.radialdistance.comploglog.parameter = radd10;
        parameterfits.branchbifprob.radialdistance.comploglog.deviance = radddev10;
        raddmeandev10 = radddev10 / length(radialdistancetotal(radialdistancetotal~=0));
        
        % [radd11,radddev11] = glmfit(radialdistance,[radialdistanceterms radialdistancetotal],'binomial','link','reciprocal');
        % parameterfits.branchtermprob.radialdistance.reciprocal.parameter = radd11;
        % parameterfits.branchtermprob.radialdistance.reciprocal.deviance = radddev11;
        
        % [radd12,radddev12] = glmfit(radialdistance,[radialdistancebifs radialdistancetotal],'binomial','link','reciprocal');
        % parameterfits.branchbifprob.radialdistance.reciprocal.parameter = radd12;
        % parameterfits.branchbifprob.radialdistance.reciprocal.deviance = radddev12;
        
        [radd13,radddev13] = glmfit(radialdistance,[radialdistanceterms radialdistancetotal],'binomial','link','loglog');
        parameterfits.branchtermprob.radialdistance.loglog.parameter = radd13;
        parameterfits.branchtermprob.radialdistance.loglog.deviance = radddev13;
        
        [radd14,radddev14] = glmfit(radialdistance,[radialdistancebifs radialdistancetotal],'binomial','link','loglog');
        parameterfits.branchbifprob.radialdistance.loglog.parameter = radd14;
        parameterfits.branchbifprob.radialdistance.loglog.deviance = radddev14;
        raddmeandev14 = radddev14 / length(radialdistancetotal(radialdistancetotal~=0));
        
        
        
        
        
        figurehandle = figure;
        plot(radialdistance,radialdistancebifs./radialdistancetotal,'gs','MarkerFaceColor','g');
        xlabel('Radial Distance (\mum)','FontSize',8,'FontWeight','b');
        ylabel('Probability','FontSize',8,'FontWeight','b');
        title(char(' ',[piecetitles{piecetype} ' Branch Bifurcation / Termination Probability vs Radial Distance -- Binomial Fits'],' '),'FontSize',12,'FontWeight','b');
        set(gca,'FontSize',6);
        hold on;
        
        fittermlogit      = fitter('logit',radd01,radialdistance);
        fitbiflogit       = fitter('logit',radd02,radialdistance);
        fittermprobit     = fitter('probit',radd03,radialdistance);
        fitbifprobit      = fitter('probit',radd04,radialdistance);
        %fittermidentity   = fitter('identity',radd05,radialdistance);
        %fitbifidentity    = fitter('identity',radd06,radialdistance);
        %fittermlog        = fitter('log',radd07,radialdistance);
        %fitbiflog         = fitter('log',radd08,radialdistance);
        fittermcomploglog = fitter('comploglog',radd09,radialdistance);
        fitbifcomploglog  = fitter('comploglog',radd10,radialdistance);
        %fittermreciprocal = fitter('reciprocal',radd11,radialdistance);
        %fitbifreciprocal  = fitter('reciprocal',radd12,radialdistance);
        fittermloglog     = fitter('loglog',radd13,radialdistance);
        fitbifloglog      = fitter('loglog',radd14,radialdistance);
        
        plot(radialdistance,fitbiflogit,'-c','LineWidth',6);
        plot(radialdistance,fitbifprobit,'--y','LineWidth',5);
        plot(radialdistance,fitbifcomploglog,'-.m','LineWidth',4);
        plot(radialdistance,fitbifloglog,':k','LineWidth',3);
        
        plot(radialdistance,fittermlogit,'-c','LineWidth',6);
        plot(radialdistance,fittermprobit,'--y','LineWidth',5);
        plot(radialdistance,fittermloglog,'-.m','LineWidth',4);
        plot(radialdistance,fittermcomploglog,':k','LineWidth',3);
        
        
        plot(radialdistance,radialdistancebifs./radialdistancetotal,'gs','MarkerFaceColor','g');
        plot(radialdistance,radialdistanceterms./radialdistancetotal,'rd','MarkerFaceColor','r');
        
        legendtext(1) = {sprintf('%s Bif Prob',analysis.inputfilename)};
        legendtext(2) = {char(' ','  Logit Fit',' ',sprintf('      P_1: %.3e',radd02(1)),sprintf('      P_2: %.3e',radd02(2)),sprintf('    dev: %.3e',radddev02),sprintf('meandev: %.3e',raddmeandev02),' ')};
        legendtext(3) = {char(' ','  Probit Fit',' ',sprintf('      P_1: %.3e',radd04(1)),sprintf('      P_2: %.3e',radd04(2)),sprintf('    dev: %.3e',radddev04),sprintf('meandev: %.3e',raddmeandev04),' ')};
        legendtext(4) = {char(' ','  CompLogLog Fit',' ',sprintf('      P_1: %.3e',radd10(1)),sprintf('      P_2: %.3e',radd10(2)),sprintf('    dev: %.3e',radddev10),sprintf('meandev: %.3e',raddmeandev10),' ')};
        legendtext(5) = {char(' ','  LogLog Fit',' ',sprintf('      P_1: %.3e',radd14(1)),sprintf('      P_2: %.3e',radd14(2)),sprintf('    dev: %.3e',radddev14),sprintf('meandev: %.3e',raddmeandev14),' ')};
        
        %fillscreen;
        legend(legendtext,'Location','NorthEastOutside'); clear legendtext;
        filename = sprintf('%s_%s_03_branchtypeprob_vs_radialdistance',analysis.inputfilename,piecetitles{piecetype});
        print('-djpeg',filename);
        
        set(gca,'XScale','log');
        filename = sprintf('%s_%s_03_branchtypeprob_vs_radialdistance_semilogx',analysis.inputfilename,piecetitles{piecetype});
        print('-djpeg',filename);
        
        set(gca,'YScale','log');
        ylimits = ylim;
        ylim([0.01 ylimits(2)]);
        filename = sprintf('%s_%s_03_branchtypeprob_vs_radialdistance_loglog',analysis.inputfilename,piecetitles{piecetype});
        print('-djpeg',filename);
        
        
        
        
        
        
        
        
        
        
        
        
        % Branch Order
        
        branchorder = [typeanalysis.branchorder.branchorder]';
        branchorderterms = [typeanalysis.branchorder.numberterminations.total]';
        branchorderbifs = [typeanalysis.branchorder.numberbifurcations.total]';
        branchordertotal = ([typeanalysis.branchorder.numberbifurcations.total] + [typeanalysis.branchorder.numberterminations.total])';
        
        [bo01,bodev01] = glmfit(branchorder,[branchorderterms branchordertotal],'binomial','link','logit');
        parameterfits.branchtermprob.branchorder.logit.parameter = bo01;
        parameterfits.branchtermprob.branchorder.logit.deviance = bodev01;
        
        [bo02,bodev02] = glmfit(branchorder,[branchorderbifs branchordertotal],'binomial','link','logit');
        parameterfits.branchbifprob.branchorder.logit.parameter = bo02;
        parameterfits.branchbifprob.branchorder.logit.deviance = bodev02;
        bomeandev02 = bodev02 / length(branchordertotal(branchordertotal~=0));
        
        [bo03,bodev03] = glmfit(branchorder,[branchorderterms branchordertotal],'binomial','link','probit');
        parameterfits.branchtermprob.branchorder.probit.parameter = bo03;
        parameterfits.branchtermprob.branchorder.probit.deviance = bodev03;
        
        [bo04,bodev04] = glmfit(branchorder,[branchorderbifs branchordertotal],'binomial','link','probit');
        parameterfits.branchbifprob.branchorder.probit.parameter = bo04;
        parameterfits.branchbifprob.branchorder.probit.deviance = bodev04;
        bomeandev04 = bodev04 / length(branchordertotal(branchordertotal~=0));
        
        % [bo05,bodev05] = glmfit(branchorder,[branchorderterms branchordertotal],'binomial','link','identity');
        % parameterfits.branchtermprob.branchorder.identity.parameter = bo05;
        % parameterfits.branchtermprob.branchorder.identity.deviance = bodev05;
        
        % [bo06,bodev06] = glmfit(branchorder,[branchorderbifs branchordertotal],'binomial','link','identity');
        % parameterfits.branchbifprob.branchorder.identity.parameter = bo06;
        % parameterfits.branchbifprob.branchorder.identity.deviance = bodev06;
        
        % [bo07,bodev07] = glmfit(branchorder,[branchorderterms branchordertotal],'binomial','link','log');
        % parameterfits.branchtermprob.branchorder.log.parameter = bo07;
        % parameterfits.branchtermprob.branchorder.log.deviance = bodev07;
        
        % [bo08,bodev08] = glmfit(branchorder,[branchorderbifs branchordertotal],'binomial','link','log');
        % parameterfits.branchbifprob.branchorder.log.parameter = bo08;
        % parameterfits.branchbifprob.branchorder.log.deviance = bodev08;
        
        [bo09,bodev09] = glmfit(branchorder,[branchorderterms branchordertotal],'binomial','link','comploglog');
        parameterfits.branchtermprob.branchorder.comploglog.parameter = bo09;
        parameterfits.branchtermprob.branchorder.comploglog.deviance = bodev09;
        
        [bo10,bodev10] = glmfit(branchorder,[branchorderbifs branchordertotal],'binomial','link','comploglog');
        parameterfits.branchbifprob.branchorder.comploglog.parameter = bo10;
        parameterfits.branchbifprob.branchorder.comploglog.deviance = bodev10;
        bomeandev10 = bodev10 / length(branchordertotal(branchordertotal~=0));
        
        % [bo11,bodev11] = glmfit(branchorder,[branchorderterms branchordertotal],'binomial','link','reciprocal');
        % parameterfits.branchtermprob.branchorder.reciprocal.parameter = bo11;
        % parameterfits.branchtermprob.branchorder.reciprocal.deviance = bodev11;
        
        % [bo12,bodev12] = glmfit(branchorder,[branchorderbifs branchordertotal],'binomial','link','reciprocal');
        % parameterfits.branchbifprob.branchorder.reciprocal.parameter = bo12;
        % parameterfits.branchbifprob.branchorder.reciprocal.deviance = bodev12;
        
        [bo13,bodev13] = glmfit(branchorder,[branchorderterms branchordertotal],'binomial','link','loglog');
        parameterfits.branchtermprob.branchorder.loglog.parameter = bo13;
        parameterfits.branchtermprob.branchorder.loglog.deviance = bodev13;
        
        [bo14,bodev14] = glmfit(branchorder,[branchorderbifs branchordertotal],'binomial','link','loglog');
        parameterfits.branchbifprob.branchorder.loglog.parameter = bo14;
        parameterfits.branchbifprob.branchorder.loglog.deviance = bodev14;
        bomeandev14 = bodev14 / length(branchordertotal(branchordertotal~=0));
        
        
        
        
        
        figurehandle = figure;
        plot(branchorder,branchorderbifs./branchordertotal,'gs','MarkerFaceColor','g');
        xlabel('Branch Order (\mum)','FontSize',8,'FontWeight','b');
        ylabel('Probability','FontSize',8,'FontWeight','b');
        title(char(' ',[piecetitles{piecetype} ' Branch Bifurcation / Termination Probability vs Branch Order -- Binomial Fits'],' '),'FontSize',12,'FontWeight','b');
        set(gca,'FontSize',6);
        hold on;
        
        fittermlogit      = fitter('logit',bo01,branchorder);
        fitbiflogit       = fitter('logit',bo02,branchorder);
        fittermprobit     = fitter('probit',bo03,branchorder);
        fitbifprobit      = fitter('probit',bo04,branchorder);
        %fittermidentity   = fitter('identity',bo05,branchorder);
        %fitbifidentity    = fitter('identity',bo06,branchorder);
        %fittermlog        = fitter('log',bo07,branchorder);
        %fitbiflog         = fitter('log',bo08,branchorder);
        fittermcomploglog = fitter('comploglog',bo09,branchorder);
        fitbifcomploglog  = fitter('comploglog',bo10,branchorder);
        %fittermreciprocal = fitter('reciprocal',bo11,branchorder);
        %fitbifreciprocal  = fitter('reciprocal',bo12,branchorder);
        fittermloglog     = fitter('loglog',bo13,branchorder);
        fitbifloglog      = fitter('loglog',bo14,branchorder);
        
        plot(branchorder,fitbiflogit,'-c','LineWidth',6);
        plot(branchorder,fitbifprobit,'--y','LineWidth',5);
        plot(branchorder,fitbifcomploglog,'-.m','LineWidth',4);
        plot(branchorder,fitbifloglog,':k','LineWidth',3);
        
        plot(branchorder,fittermlogit,'-c','LineWidth',6);
        plot(branchorder,fittermprobit,'--y','LineWidth',5);
        plot(branchorder,fittermloglog,'-.m','LineWidth',4);
        plot(branchorder,fittermcomploglog,':k','LineWidth',3);
        
        
        plot(branchorder,branchorderbifs./branchordertotal,'gs','MarkerFaceColor','g');
        plot(branchorder,branchorderterms./branchordertotal,'rd','MarkerFaceColor','r');
        
        legendtext(1) = {sprintf('%s Bif Prob',analysis.inputfilename)};
        legendtext(2) = {char(' ','  Logit Fit',' ',sprintf('      P_1: %.3e',bo02(1)),sprintf('      P_2: %.3e',bo02(2)),sprintf('    dev: %.3e',bodev02),sprintf('meandev: %.3e',bomeandev02),' ')};
        legendtext(3) = {char(' ','  Probit Fit',' ',sprintf('      P_1: %.3e',bo04(1)),sprintf('      P_2: %.3e',bo04(2)),sprintf('    dev: %.3e',bodev04),sprintf('meandev: %.3e',bomeandev04),' ')};
        legendtext(4) = {char(' ','  CompLogLog Fit',' ',sprintf('      P_1: %.3e',bo10(1)),sprintf('      P_2: %.3e',bo10(2)),sprintf('    dev: %.3e',bodev10),sprintf('meandev: %.3e',bomeandev10),' ')};
        legendtext(5) = {char(' ','  LogLog Fit',' ',sprintf('      P_1: %.3e',bo14(1)),sprintf('      P_2: %.3e',bo14(2)),sprintf('    dev: %.3e',bodev14),sprintf('meandev: %.3e',bomeandev14),' ')};
        
        %fillscreen;
        legend(legendtext,'Location','NorthEastOutside'); clear legendtext;
        filename = sprintf('%s_%s_04_branchtypeprob_vs_branchorder',analysis.inputfilename,piecetitles{piecetype});
        print('-djpeg',filename);
        
        set(gca,'XScale','log');
        filename = sprintf('%s_%s_04_branchtypeprob_vs_branchorder_semilogx',analysis.inputfilename,piecetitles{piecetype});
        print('-djpeg',filename);
        
        set(gca,'YScale','log');
        ylimits = ylim;
        ylim([0.01 ylimits(2)]);
        filename = sprintf('%s_%s_04_branchtypeprob_vs_branchorder_loglog',analysis.inputfilename,piecetitles{piecetype});
        print('-djpeg',filename);
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        % Double Bin
        
        diameter   = typeanalysis.doublebin.diameterpathlength.diameter;
        pathlength = typeanalysis.doublebin.diameterpathlength.pathlength;
        doublebin = [[typeanalysis.doublebin.diameterpathlength.array.diameter] [typeanalysis.doublebin.diameterpathlength.array.pathlength]];
        doublebinterms = [typeanalysis.doublebin.diameterpathlength.array.numberterminatingbranches];
        doublebinbifs = [typeanalysis.doublebin.diameterpathlength.array.numberbifurcatingbranches];
        doublebintotal = ([typeanalysis.doublebin.diameterpathlength.array.numberbifurcatingbranches] + [typeanalysis.doublebin.diameterpathlength.array.numberterminatingbranches]);
        
        [db01,dbdev01] = glmfit(doublebin,[doublebinterms doublebintotal],'binomial','link','logit');
        dbmeandev01 = dbdev01 / length(doublebintotal(doublebintotal~=0));
        parameterfits.branchtermprob.doublebin.diameterpathlength.logit.parameter = db01;
        parameterfits.branchtermprob.doublebin.diameterpathlength.logit.deviance = dbdev01;
        
        [db02,dbdev02] = glmfit(doublebin,[doublebinbifs doublebintotal],'binomial','link','logit');
        dbmeandev02 = dbdev02 / length(doublebintotal(doublebintotal~=0));
        parameterfits.branchbifprob.doublebin.diameterpathlength.logit.parameter = db02;
        parameterfits.branchbifprob.doublebin.diameterpathlength.logit.deviance = dbdev02;
        
        [db03,dbdev03] = glmfit(doublebin,[doublebinterms doublebintotal],'binomial','link','probit');
        dbmeandev03 = dbdev03 / length(doublebintotal(doublebintotal~=0));
        parameterfits.branchtermprob.doublebin.diameterpathlength.probit.parameter = db03;
        parameterfits.branchtermprob.doublebin.diameterpathlength.probit.deviance = dbdev03;
        
        [db04,dbdev04] = glmfit(doublebin,[doublebinbifs doublebintotal],'binomial','link','probit');
        dbmeandev04 = dbdev04 / length(doublebintotal(doublebintotal~=0));
        parameterfits.branchbifprob.doublebin.diameterpathlength.probit.parameter = db04;
        parameterfits.branchbifprob.doublebin.diameterpathlength.probit.deviance = dbdev04;
        
        [db05,dbdev05] = glmfit(doublebin,[doublebinterms doublebintotal],'binomial','link','comploglog');
        dbmeandev05 = dbdev05 / length(doublebintotal(doublebintotal~=0));
        parameterfits.branchtermprob.doublebin.diameterpathlength.comploglog.parameter = db05;
        parameterfits.branchtermprob.doublebin.diameterpathlength.comploglog.deviance = dbdev05;
        
        [db06,dbdev06] = glmfit(doublebin,[doublebinbifs doublebintotal],'binomial','link','comploglog');
        dbmeandev06 = dbdev06 / length(doublebintotal(doublebintotal~=0));
        parameterfits.branchbifprob.doublebin.diameterpathlength.comploglog.parameter = db06;
        parameterfits.branchbifprob.doublebin.diameterpathlength.comploglog.deviance = dbdev06;
        
        [db07,dbdev07] = glmfit(doublebin,[doublebinterms doublebintotal],'binomial','link','loglog');
        dbmeandev07 = dbdev07 / length(doublebintotal(doublebintotal~=0));
        parameterfits.branchtermprob.doublebin.diameterpathlength.loglog.parameter = db07;
        parameterfits.branchtermprob.doublebin.diameterpathlength.loglog.deviance = dbdev07;
        
        [db08,dbdev08] = glmfit(doublebin,[doublebinbifs doublebintotal],'binomial','link','loglog');
        dbmeandev08 = dbdev08 / length(doublebintotal(doublebintotal~=0));
        parameterfits.branchbifprob.doublebin.diameterpathlength.loglog.parameter = db08;
        parameterfits.branchbifprob.doublebin.diameterpathlength.loglog.deviance = dbdev08;
        
        
        
        figurehandle = figure;
        plot3(doublebin(:,1),doublebin(:,2),doublebinbifs./doublebintotal,'gs','MarkerFaceColor','g');
        hold on;
        plot3(doublebin(:,1),doublebin(:,2),doublebinterms./doublebintotal,'rd','MarkerFaceColor','r');
        
        xlabel('Diameter (\mum)','FontSize',8,'FontWeight','b');
        ylabel('Path Length (\mum)','FontSize',8,'FontWeight','b');
        zlabel('Probability','FontSize',8,'FontWeight','b');
        title(char(' ',[piecetitles{piecetype} ' Branch Bifurcation / Termination Probability vs Diameter & Path Length -- Logit Fit'],' '),'FontSize',12,'FontWeight','b');
        set(gca,'FontSize',6);
        
        fitbiflogit = fitter('logit',db02,diameter,pathlength);
        fittermlogit = fitter('logit',db01,diameter,pathlength);
        
        surf(diameter,pathlength,fitbiflogit);
        surf(diameter,pathlength,fittermlogit);
        legendtext(1) = {sprintf('%s Bif Prob',analysis.inputfilename)};
        legendtext(2) = {sprintf('%s Term Prob',analysis.inputfilename)};
        legendtext(3) = {char(' ','  Logit Fit (Bif Prob)',' ',sprintf('      P_1: %.3e',db02(1)),sprintf('      P_2: %.3e',db02(2)),sprintf('      P_3: %.3e',db02(3)),sprintf('    dev: %.3e',dbdev02),sprintf('meandev: %.3e',dbmeandev02),' ')};
        legend(legendtext,'Location','NorthEastOutside'); clear legendtext;
        filename = sprintf('%s_%s_05_branchtypeprob_vs_diameterpathlength_logit',analysis.inputfilename,piecetitles{piecetype});
        print('-djpeg',filename);
        saveas(gcf,filename,'fig');
        
        set(gca,'XScale','log');
        filename = sprintf('%s_%s_05_branchtypeprob_vs_diameterpathlength_logit_semilogx',analysis.inputfilename,piecetitles{piecetype});
        print('-djpeg',filename);
        
        set(gca,'YScale','log');
        filename = sprintf('%s_%s_05_branchtypeprob_vs_diameterpathlength_logit_semilogxy',analysis.inputfilename,piecetitles{piecetype});
        print('-djpeg',filename);
        
        
        
        figurehandle = figure;
        plot3(doublebin(:,1),doublebin(:,2),doublebinbifs./doublebintotal,'gs','MarkerFaceColor','g');
        hold on;
        plot3(doublebin(:,1),doublebin(:,2),doublebinterms./doublebintotal,'rd','MarkerFaceColor','r');
        xlabel('Diameter (\mum)','FontSize',8,'FontWeight','b');
        ylabel('Path Length (\mum)','FontSize',8,'FontWeight','b');
        zlabel('Probability','FontSize',8,'FontWeight','b');
        title(char(' ',[piecetitles{piecetype} ' Branch Bifurcation / Termination Probability vs Diameter & Path Length -- Probit Fit'],' '),'FontSize',12,'FontWeight','b');
        set(gca,'FontSize',6);
        
        fitbifprobit = fitter('probit',db04,diameter,pathlength);
        fittermprobit = fitter('probit',db03,diameter,pathlength);
        
        surf(diameter,pathlength,fitbifprobit);
        surf(diameter,pathlength,fittermprobit);
        legendtext(1) = {sprintf('%s Bif Prob',analysis.inputfilename)};
        legendtext(2) = {sprintf('%s Term Prob',analysis.inputfilename)};
        legendtext(3) = {char(' ','  Probit Fit (Bif Prob)',' ',sprintf('      P_1: %.3e',db04(1)),sprintf('      P_2: %.3e',db04(2)),sprintf('      P_3: %.3e',db04(3)),sprintf('    dev: %.3e',dbdev04),sprintf('meandev: %.3e',dbmeandev04),' ')};
        legend(legendtext,'Location','NorthEastOutside'); clear legendtext;
        filename = sprintf('%s_%s_06_branchtypeprob_vs_diameterpathlength_probit',analysis.inputfilename,piecetitles{piecetype});
        print('-djpeg',filename);
        saveas(gcf,filename,'fig');
        
        set(gca,'XScale','log');
        filename = sprintf('%s_%s_06_branchtypeprob_vs_diameterpathlength_probit_semilogx',analysis.inputfilename,piecetitles{piecetype});
        print('-djpeg',filename);
        
        set(gca,'YScale','log');
        filename = sprintf('%s_%s_06_branchtypeprob_vs_diameterpathlength_probit_semilogxy',analysis.inputfilename,piecetitles{piecetype});
        print('-djpeg',filename);
        
        
        
        figurehandle = figure;
        plot3(doublebin(:,1),doublebin(:,2),doublebinbifs./doublebintotal,'gs','MarkerFaceColor','g');
        hold on;
        plot3(doublebin(:,1),doublebin(:,2),doublebinterms./doublebintotal,'rd','MarkerFaceColor','r');
        xlabel('Diameter (\mum)','FontSize',8,'FontWeight','b');
        ylabel('Path Length (\mum)','FontSize',8,'FontWeight','b');
        zlabel('Probability','FontSize',8,'FontWeight','b');
        title(char(' ',[piecetitles{piecetype} ' Branch Bifurcation / Termination Probability vs Diameter & Path Length -- CompLogLog Fit'],' '),'FontSize',12,'FontWeight','b');
        set(gca,'FontSize',6);
        
        fitbifcomploglog = fitter('comploglog',db06,diameter,pathlength);
        fittermloglog = fitter('loglog',db07,diameter,pathlength);
        
        surf(diameter,pathlength,fitbifcomploglog);
        surf(diameter,pathlength,fittermloglog);
        legendtext(1) = {sprintf('%s Bif Prob',analysis.inputfilename)};
        legendtext(2) = {sprintf('%s Term Prob',analysis.inputfilename)};
        legendtext(3) = {char(' ','  CompLogLog Fit (Bif Prob)',' ',sprintf('      P_1: %.3e',db06(1)),sprintf('      P_2: %.3e',db06(2)),sprintf('      P_3: %.3e',db06(3)),sprintf('    dev: %.3e',dbdev06),sprintf('meandev: %.3e',dbmeandev06),' ')};
        legend(legendtext,'Location','NorthEastOutside'); clear legendtext;
        filename = sprintf('%s_%s_07_branchtypeprob_vs_diameterpathlength_comploglog',analysis.inputfilename,piecetitles{piecetype});
        print('-djpeg',filename);
        saveas(gcf,filename,'fig');
        
        set(gca,'XScale','log');
        filename = sprintf('%s_%s_07_branchtypeprob_vs_diameterpathlength_comploglog_semilogx',analysis.inputfilename,piecetitles{piecetype});
        print('-djpeg',filename);
        
        set(gca,'YScale','log');
        filename = sprintf('%s_%s_07_branchtypeprob_vs_diameterpathlength_comploglog_semilogxy',analysis.inputfilename,piecetitles{piecetype});
        print('-djpeg',filename);
        
        
        
        figurehandle = figure;
        plot3(doublebin(:,1),doublebin(:,2),doublebinbifs./doublebintotal,'gs','MarkerFaceColor','g');
        hold on;
        plot3(doublebin(:,1),doublebin(:,2),doublebinterms./doublebintotal,'rd','MarkerFaceColor','r');
        xlabel('Diameter (\mum)','FontSize',8,'FontWeight','b');
        ylabel('Path Length (\mum)','FontSize',8,'FontWeight','b');
        zlabel('Probability','FontSize',8,'FontWeight','b');
        title(char(' ',[piecetitles{piecetype} ' Branch Bifurcation / Termination Probability vs Diameter & Path Length -- LogLog Fit'],' '),'FontSize',12,'FontWeight','b');
        set(gca,'FontSize',6);
        
        fitbifloglog = fitter('loglog',db08,diameter,pathlength);
        fittermcomploglog = fitter('comploglog',db05,diameter,pathlength);
        
        surf(diameter,pathlength,fitbifloglog);
        surf(diameter,pathlength,fittermcomploglog);
        legendtext(1) = {sprintf('%s Bif Prob',analysis.inputfilename)};
        legendtext(2) = {sprintf('%s Term Prob',analysis.inputfilename)};
        legendtext(3) = {char(' ','  LogLog Fit (Bif Prob)',' ',sprintf('      P_1: %.3e',db08(1)),sprintf('      P_2: %.3e',db08(2)),sprintf('      P_3: %.3e',db08(3)),sprintf('    dev: %.3e',dbdev08),sprintf('meandev: %.3e',dbmeandev08),' ')};
        legend(legendtext,'Location','NorthEastOutside'); clear legendtext;
        filename = sprintf('%s_%s_08_branchtypeprob_vs_diameterpathlength_loglog',analysis.inputfilename,piecetitles{piecetype});
        print('-djpeg',filename);
        saveas(gcf,filename,'fig');
        
        set(gca,'XScale','log');
        filename = sprintf('%s_%s_08_branchtypeprob_vs_diameterpathlength_loglog_semilogx',analysis.inputfilename,piecetitles{piecetype});
        print('-djpeg',filename);
        
        set(gca,'YScale','log');
        filename = sprintf('%s_%s_08_branchtypeprob_vs_diameterpathlength_loglog_semilogxy',analysis.inputfilename,piecetitles{piecetype});
        print('-djpeg',filename);
        
        
        
        
        
        
        
        
        
        
        
        
        % Double Bin
        
        diameter   = typeanalysis.doublebin.diameterbranchorder.diameter;
        branchorder = typeanalysis.doublebin.diameterbranchorder.branchorder;
        doublebin = [[typeanalysis.doublebin.diameterbranchorder.array.diameter] [typeanalysis.doublebin.diameterbranchorder.array.branchorder]];
        doublebinterms = [typeanalysis.doublebin.diameterbranchorder.array.numberterminatingbranches];
        doublebinbifs = [typeanalysis.doublebin.diameterbranchorder.array.numberbifurcatingbranches];
        doublebintotal = ([typeanalysis.doublebin.diameterbranchorder.array.numberbifurcatingbranches] + [typeanalysis.doublebin.diameterbranchorder.array.numberterminatingbranches]);
        
        [db01,dbdev01] = glmfit(doublebin,[doublebinterms doublebintotal],'binomial','link','logit');
        parameterfits.branchtermprob.doublebin.diameterbranchorder.logit.parameter = db01;
        parameterfits.branchtermprob.doublebin.diameterbranchorder.logit.deviance = dbdev01;
        dbmeandev01 = dbdev01 / length(doublebintotal(doublebintotal~=0));
        
        [db02,dbdev02] = glmfit(doublebin,[doublebinbifs doublebintotal],'binomial','link','logit');
        parameterfits.branchbifprob.doublebin.diameterbranchorder.logit.parameter = db02;
        parameterfits.branchbifprob.doublebin.diameterbranchorder.logit.deviance = dbdev02;
        dbmeandev02 = dbdev02 / length(doublebintotal(doublebintotal~=0));
        
        [db03,dbdev03] = glmfit(doublebin,[doublebinterms doublebintotal],'binomial','link','probit');
        parameterfits.branchtermprob.doublebin.diameterbranchorder.probit.parameter = db03;
        parameterfits.branchtermprob.doublebin.diameterbranchorder.probit.deviance = dbdev03;
        dbmeandev03 = dbdev03 / length(doublebintotal(doublebintotal~=0));
        
        [db04,dbdev04] = glmfit(doublebin,[doublebinbifs doublebintotal],'binomial','link','probit');
        parameterfits.branchbifprob.doublebin.diameterbranchorder.probit.parameter = db04;
        parameterfits.branchbifprob.doublebin.diameterbranchorder.probit.deviance = dbdev04;
        dbmeandev04 = dbdev04 / length(doublebintotal(doublebintotal~=0));
        
        [db05,dbdev05] = glmfit(doublebin,[doublebinterms doublebintotal],'binomial','link','comploglog');
        parameterfits.branchtermprob.doublebin.diameterbranchorder.comploglog.parameter = db05;
        parameterfits.branchtermprob.doublebin.diameterbranchorder.comploglog.deviance = dbdev05;
        dbmeandev05 = dbdev05 / length(doublebintotal(doublebintotal~=0));
        
        [db06,dbdev06] = glmfit(doublebin,[doublebinbifs doublebintotal],'binomial','link','comploglog');
        parameterfits.branchbifprob.doublebin.diameterbranchorder.comploglog.parameter = db06;
        parameterfits.branchbifprob.doublebin.diameterbranchorder.comploglog.deviance = dbdev06;
        dbmeandev06 = dbdev06 / length(doublebintotal(doublebintotal~=0));
        
        [db07,dbdev07] = glmfit(doublebin,[doublebinterms doublebintotal],'binomial','link','loglog');
        parameterfits.branchtermprob.doublebin.diameterbranchorder.loglog.parameter = db07;
        parameterfits.branchtermprob.doublebin.diameterbranchorder.loglog.deviance = dbdev07;
        dbmeandev07 = dbdev07 / length(doublebintotal(doublebintotal~=0));
        
        [db08,dbdev08] = glmfit(doublebin,[doublebinbifs doublebintotal],'binomial','link','loglog');
        parameterfits.branchbifprob.doublebin.diameterbranchorder.loglog.parameter = db08;
        parameterfits.branchbifprob.doublebin.diameterbranchorder.loglog.deviance = dbdev08;
        dbmeandev08 = dbdev08 / length(doublebintotal(doublebintotal~=0));
        
        
        
        figurehandle = figure;
        plot3(doublebin(:,1),doublebin(:,2),doublebinbifs./doublebintotal,'gs','MarkerFaceColor','g');
        hold on;
        plot3(doublebin(:,1),doublebin(:,2),doublebinterms./doublebintotal,'rd','MarkerFaceColor','r');
        
        xlabel('Diameter (\mum)','FontSize',8,'FontWeight','b');
        ylabel('Branch Order','FontSize',8,'FontWeight','b');
        zlabel('Probability','FontSize',8,'FontWeight','b');
        title(char(' ',[piecetitles{piecetype} ' Branch Bifurcation / Termination Probability vs Diameter & Branch Order -- Logit Fit'],' '),'FontSize',12,'FontWeight','b');
        set(gca,'FontSize',6);
        
        fitbiflogit = fitter('logit',db02,diameter,branchorder);
        fittermlogit = fitter('logit',db01,diameter,branchorder);
        
        surf(diameter,branchorder,fitbiflogit);
        surf(diameter,branchorder,fittermlogit);
        legendtext(1) = {sprintf('%s Bif Prob',analysis.inputfilename)};
        legendtext(2) = {sprintf('%s Term Prob',analysis.inputfilename)};
        legendtext(3) = {char(' ','  Logit Fit (Bif Prob)',' ',sprintf('      P_1: %.3e',db02(1)),sprintf('      P_2: %.3e',db02(2)),sprintf('      P_3: %.3e',db02(3)),sprintf('    dev: %.3e',dbdev02),sprintf('meandev: %.3e',dbmeandev02),' ')};
        legend(legendtext,'Location','NorthEastOutside'); clear legendtext;
        filename = sprintf('%s_%s_09_branchtypeprob_vs_diameterbranchorder_logit',analysis.inputfilename,piecetitles{piecetype});
        print('-djpeg',filename);
        saveas(gcf,filename,'fig');
        
        set(gca,'XScale','log');
        filename = sprintf('%s_%s_09_branchtypeprob_vs_diameterbranchorder_logit_semilogx',analysis.inputfilename,piecetitles{piecetype});
        print('-djpeg',filename);
        
        set(gca,'YScale','log');
        filename = sprintf('%s_%s_09_branchtypeprob_vs_diameterbranchorder_logit_semilogxy',analysis.inputfilename,piecetitles{piecetype});
        print('-djpeg',filename);
        
        
        
        figurehandle = figure;
        plot3(doublebin(:,1),doublebin(:,2),doublebinbifs./doublebintotal,'gs','MarkerFaceColor','g');
        hold on;
        plot3(doublebin(:,1),doublebin(:,2),doublebinterms./doublebintotal,'rd','MarkerFaceColor','r');
        xlabel('Diameter (\mum)','FontSize',8,'FontWeight','b');
        ylabel('Branch Order','FontSize',8,'FontWeight','b');
        zlabel('Probability','FontSize',8,'FontWeight','b');
        title(char(' ',[piecetitles{piecetype} ' Branch Bifurcation / Termination Probability vs Diameter & Branch Order -- Probit Fit'],' '),'FontSize',12,'FontWeight','b');
        set(gca,'FontSize',6);
        
        fitbifprobit = fitter('probit',db04,diameter,branchorder);
        fittermprobit = fitter('probit',db03,diameter,branchorder);
        
        surf(diameter,branchorder,fitbifprobit);
        surf(diameter,branchorder,fittermprobit);
        legendtext(1) = {sprintf('%s Bif Prob',analysis.inputfilename)};
        legendtext(2) = {sprintf('%s Term Prob',analysis.inputfilename)};
        legendtext(3) = {char(' ','  Probit Fit (Bif Prob)',' ',sprintf('      P_1: %.3e',db04(1)),sprintf('      P_2: %.3e',db04(2)),sprintf('      P_3: %.3e',db04(3)),sprintf('    dev: %.3e',dbdev04),sprintf('meandev: %.3e',dbmeandev04),' ')};
        legend(legendtext,'Location','NorthEastOutside'); clear legendtext;
        filename = sprintf('%s_%s_10_branchtypeprob_vs_diameterbranchorder_probit',analysis.inputfilename,piecetitles{piecetype});
        print('-djpeg',filename);
        saveas(gcf,filename,'fig');
        
        set(gca,'XScale','log');
        filename = sprintf('%s_%s_10_branchtypeprob_vs_diameterbranchorder_probit_semilogx',analysis.inputfilename,piecetitles{piecetype});
        print('-djpeg',filename);
        
        set(gca,'YScale','log');
        filename = sprintf('%s_%s_10_branchtypeprob_vs_diameterbranchorder_probit_semilogxy',analysis.inputfilename,piecetitles{piecetype});
        print('-djpeg',filename);
        
        
        
        figurehandle = figure;
        plot3(doublebin(:,1),doublebin(:,2),doublebinbifs./doublebintotal,'gs','MarkerFaceColor','g');
        hold on;
        plot3(doublebin(:,1),doublebin(:,2),doublebinterms./doublebintotal,'rd','MarkerFaceColor','r');
        xlabel('Diameter (\mum)','FontSize',8,'FontWeight','b');
        ylabel('Branch Order','FontSize',8,'FontWeight','b');
        zlabel('Probability','FontSize',8,'FontWeight','b');
        title(char(' ',[piecetitles{piecetype} ' Branch Bifurcation / Termination Probability vs Diameter & Branch Order -- CompLogLog Fit'],' '),'FontSize',12,'FontWeight','b');
        set(gca,'FontSize',6);
        
        fitbifcomploglog = fitter('comploglog',db06,diameter,branchorder);
        fittermloglog = fitter('loglog',db07,diameter,branchorder);
        
        surf(diameter,branchorder,fitbifcomploglog);
        surf(diameter,branchorder,fittermloglog);
        legendtext(1) = {sprintf('%s Bif Prob',analysis.inputfilename)};
        legendtext(2) = {sprintf('%s Term Prob',analysis.inputfilename)};
        legendtext(3) = {char(' ','  CompLogLog Fit (Bif Prob)',' ',sprintf('      P_1: %.3e',db06(1)),sprintf('      P_2: %.3e',db06(2)),sprintf('      P_3: %.3e',db06(3)),sprintf('    dev: %.3e',dbdev06),sprintf('meandev: %.3e',dbmeandev06),' ')};
        legend(legendtext,'Location','NorthEastOutside'); clear legendtext;
        filename = sprintf('%s_%s_11_branchtypeprob_vs_diameterbranchorder_comploglog',analysis.inputfilename,piecetitles{piecetype});
        print('-djpeg',filename);
        saveas(gcf,filename,'fig');
        
        set(gca,'XScale','log');
        filename = sprintf('%s_%s_11_branchtypeprob_vs_diameterbranchorder_comploglog_semilogx',analysis.inputfilename,piecetitles{piecetype});
        print('-djpeg',filename);
        
        set(gca,'YScale','log');
        filename = sprintf('%s_%s_11_branchtypeprob_vs_diameterbranchorder_comploglog_semilogxy',analysis.inputfilename,piecetitles{piecetype});
        print('-djpeg',filename);
        
        
        
        figurehandle = figure;
        plot3(doublebin(:,1),doublebin(:,2),doublebinbifs./doublebintotal,'gs','MarkerFaceColor','g');
        hold on;
        plot3(doublebin(:,1),doublebin(:,2),doublebinterms./doublebintotal,'rd','MarkerFaceColor','r');
        xlabel('Diameter (\mum)','FontSize',8,'FontWeight','b');
        ylabel('Branch Order','FontSize',8,'FontWeight','b');
        zlabel('Probability','FontSize',8,'FontWeight','b');
        title(char(' ',[piecetitles{piecetype} ' Branch Bifurcation / Termination Probability vs Diameter & Branch Order -- LogLog Fit'],' '),'FontSize',12,'FontWeight','b');
        set(gca,'FontSize',6);
        
        fitbifloglog = fitter('loglog',db08,diameter,branchorder);
        fittermcomploglog = fitter('comploglog',db05,diameter,branchorder);
        
        surf(diameter,branchorder,fitbifloglog);
        surf(diameter,branchorder,fittermcomploglog);
        legendtext(1) = {sprintf('%s Bif Prob',analysis.inputfilename)};
        legendtext(2) = {sprintf('%s Term Prob',analysis.inputfilename)};
        legendtext(3) = {char(' ','  LogLog Fit (Bif Prob)',' ',sprintf('      P_1: %.3e',db08(1)),sprintf('      P_2: %.3e',db08(2)),sprintf('      P_3: %.3e',db08(3)),sprintf('    dev: %.3e',dbdev08),sprintf('meandev: %.3e',dbmeandev08),' ')};
        legend(legendtext,'Location','NorthEastOutside'); clear legendtext;
        filename = sprintf('%s_%s_12_branchtypeprob_vs_diameterbranchorder_loglog',analysis.inputfilename,piecetitles{piecetype});
        print('-djpeg',filename);
        saveas(gcf,filename,'fig');
        
        set(gca,'XScale','log');
        filename = sprintf('%s_%s_12_branchtypeprob_vs_diameterbranchorder_loglog_semilogx',analysis.inputfilename,piecetitles{piecetype});
        print('-djpeg',filename);
        
        set(gca,'YScale','log');
        filename = sprintf('%s_%s_12_branchtypeprob_vs_diameterbranchorder_loglog_semilogxy',analysis.inputfilename,piecetitles{piecetype});
        print('-djpeg',filename);
       
    end
end



