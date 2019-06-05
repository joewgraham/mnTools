function branchtypecomparefit(controlanalysis,testanalysis,mncomparefitoption)

disp('     Branch Type Probability.');

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
if exist('branchtypeprob','dir')==7
    cd('branchtypeprob');
else
    mkdir('branchtypeprob');
    cd('branchtypeprob');
end


%% Diameter

    controldiameter = [controlanalysis.diameter.diameter]';
    controldiameterterms = [controlanalysis.diameter.numberterminatingbranches.total]';
    controldiameterbifs = [controlanalysis.diameter.numberbifurcatingbranches.total]';
    controldiametertotal = ([controlanalysis.diameter.numberbifurcatingbranches.total] + [controlanalysis.diameter.numberterminatingbranches.total])';

    % [controldiam01,controldiamdev01] = glmfit(controldiameter,[controldiameterterms controldiametertotal],'binomial','link','logit');
    % [controldiam02,controldiamdev02] = glmfit(controldiameter,[controldiameterbifs controldiametertotal],'binomial','link','logit');
    % [controldiam03,controldiamdev03] = glmfit(controldiameter,[controldiameterterms controldiametertotal],'binomial','link','probit');
    % [controldiam04,controldiamdev04] = glmfit(controldiameter,[controldiameterbifs controldiametertotal],'binomial','link','probit');
	% [controldiam09,controldiamdev09] = glmfit(controldiameter,[controldiameterterms controldiametertotal],'binomial','link','comploglog');
    % [controldiam10,controldiamdev10] = glmfit(controldiameter,[controldiameterbifs controldiametertotal],'binomial','link','comploglog');
    % [controldiam13,controldiamdev13] = glmfit(controldiameter,[controldiameterterms controldiametertotal],'binomial','link','loglog');
    % [controldiam14,controldiamdev14] = glmfit(controldiameter,[controldiameterbifs controldiametertotal],'binomial','link','loglog');
    
	testdiameter = [testanalysis.diameter.diameter]';
    testdiameterterms = [testanalysis.diameter.numberterminatingbranches.total]';
    testdiameterbifs = [testanalysis.diameter.numberbifurcatingbranches.total]';
    testdiametertotal = ([testanalysis.diameter.numberbifurcatingbranches.total] + [testanalysis.diameter.numberterminatingbranches.total])';

    % [testdiam01,testdiamdev01] = glmfit(testdiameter,[testdiameterterms testdiametertotal],'binomial','link','logit');
    % [testdiam02,testdiamdev02] = glmfit(testdiameter,[testdiameterbifs testdiametertotal],'binomial','link','logit');
    % [testdiam03,testdiamdev03] = glmfit(testdiameter,[testdiameterterms testdiametertotal],'binomial','link','probit');
    % [testdiam04,testdiamdev04] = glmfit(testdiameter,[testdiameterbifs testdiametertotal],'binomial','link','probit');
    % [testdiam09,testdiamdev09] = glmfit(testdiameter,[testdiameterterms testdiametertotal],'binomial','link','comploglog');
    % [testdiam10,testdiamdev10] = glmfit(testdiameter,[testdiameterbifs testdiametertotal],'binomial','link','comploglog');
	% [testdiam13,testdiamdev13] = glmfit(testdiameter,[testdiameterterms testdiametertotal],'binomial','link','loglog');
    % [testdiam14,testdiamdev14] = glmfit(testdiameter,[testdiameterbifs testdiametertotal],'binomial','link','loglog');
    
	
	    figurehandle = figure;
        plot(controldiameter,controldiameterbifs./controldiametertotal,'gs','MarkerFaceColor','g','MarkerSize',6);
		hold on;
        plot(controldiameter,controldiameterterms./controldiametertotal,'rd','MarkerFaceColor','r','MarkerSize',8);
		plot(testdiameter,testdiameterbifs./testdiametertotal,'ks','MarkerFaceColor','y','MarkerSize',4);
        plot(testdiameter,testdiameterterms./testdiametertotal,'kd','MarkerFaceColor','m','MarkerSize',6);
        xlabel('Diameter (\mum)','FontSize',8,'FontWeight','b');
        ylabel('Probability','FontSize',8,'FontWeight','b');
        title(char(' ','Branch Bifurcation / Termination Probability vs Diameter -- Binomial Fits',' '),'FontSize',12,'FontWeight','b');
        set(gca,'FontSize',6);
		
		
		
        % controlfittermlogit      = fitter('logit',controldiam01,controldiameter);
		% controlfitbiflogit       = fitter('logit',controldiam02,controldiameter);
        % controlfittermprobit     = fitter('probit',controldiam03,controldiameter);
		% controlfitbifprobit      = fitter('probit',controldiam04,controldiameter);
		% controlfittermcomploglog = fitter('comploglog',controldiam09,controldiameter);
		% controlfitbifcomploglog  = fitter('comploglog',controldiam10,controldiameter);
		% controlfittermloglog     = fitter('loglog',controldiam13,controldiameter);
		% controlfitbifloglog      = fitter('loglog',controldiam14,controldiameter);
		
		% testfittermlogit      = fitter('logit',testdiam01,testdiameter);
		% testfitbiflogit       = fitter('logit',testdiam02,testdiameter);
        % testfittermprobit     = fitter('probit',testdiam03,testdiameter);
		% testfitbifprobit      = fitter('probit',testdiam04,testdiameter);
		% testfittermcomploglog = fitter('comploglog',testdiam09,testdiameter);
		% testfitbifcomploglog  = fitter('comploglog',testdiam10,testdiameter);
		% testfittermloglog     = fitter('loglog',testdiam13,testdiameter);
		% testfitbifloglog      = fitter('loglog',testdiam14,testdiameter);
        
		% plot(controldiameter,controlfitbiflogit,'-c','LineWidth',6);
        % plot(controldiameter,controlfitbifprobit,'--y','LineWidth',5);
		% plot(controldiameter,controlfitbifcomploglog,'-.m','LineWidth',4);
		% plot(controldiameter,controlfitbifloglog,':k','LineWidth',3);
        
		% plot(controldiameter,controlfittermlogit,'-c','LineWidth',6);
		% plot(controldiameter,controlfittermprobit,'--y','LineWidth',5);
		% plot(controldiameter,controlfittermcomploglog,'-.m','LineWidth',4);
		% plot(controldiameter,controlfittermloglog,':k','LineWidth',3);
        
		% plot(controldiameter,controldiameterbifs./controldiametertotal,'gs','MarkerFaceColor','g','MarkerSize',6);
        % plot(controldiameter,controldiameterterms./controldiametertotal,'rd','MarkerFaceColor','r','MarkerSize',8);
		% plot(testdiameter,testdiameterbifs./testdiametertotal,'ks','MarkerFaceColor','y','MarkerSize',4);
        % plot(testdiameter,testdiameterterms./testdiametertotal,'kd','MarkerFaceColor','m','MarkerSize',6);

        % legendtext(1) = {sprintf('%s Bif Prob',analysis.inputfilename)};
        % legendtext(2) = {char(' ','  Logit Fit',' ',sprintf('      P_1: %.3e',diam02(1)),sprintf('      P_2: %.3e',diam02(2)),sprintf('    dev: %.3e',diamdev02),' ')};
        % legendtext(3) = {char(' ','  Probit Fit',' ',sprintf('      P_1: %.3e',diam04(1)),sprintf('      P_2: %.3e',diam04(2)),sprintf('    dev: %.3e',diamdev04),' ')};
		% legendtext(4) = {char(' ','  CompLogLog Fit',' ',sprintf('      P_1: %.3e',diam10(1)),sprintf('      P_2: %.3e',diam10(2)),sprintf('    dev: %.3e',diamdev10),' ')};
		% legendtext(5) = {char(' ','  LogLog Fit',' ',sprintf('      P_1: %.3e',diam14(1)),sprintf('      P_2: %.3e',diam14(2)),sprintf('    dev: %.3e',diamdev14),' ')};
        
        % legend(legendtext,'Location','NorthEastOutside'); clear legendtext;
        filename = sprintf('%s_ParameterFits_01_branchtypeprob_vs_diameter',controlanalysis.inputfilename);
        print('-djpeg',filename);

        set(gca,'XScale','log');
        filename = sprintf('%s_ParameterFits_01_branchtypeprob_vs_diameter_semilogx',controlanalysis.inputfilename);
        print('-djpeg',filename);

        set(gca,'YScale','log');
        ylimits = ylim;
        ylim([0.01 ylimits(2)]);
        filename = sprintf('%s_ParameterFits_01_branchtypeprob_vs_diameter_loglog',controlanalysis.inputfilename);
        print('-djpeg',filename);
        
		
		
		
		
		
		
		
		
		
%% Path Length

    controlpathlength = [controlanalysis.pathlength.pathlength]';
    controlpathlengthterms = [controlanalysis.pathlength.numberterminatingbranches.total]';
    controlpathlengthbifs = [controlanalysis.pathlength.numberbifurcatingbranches.total]';
    controlpathlengthtotal = ([controlanalysis.pathlength.numberbifurcatingbranches.total] + [controlanalysis.pathlength.numberterminatingbranches.total])';

    % [controlpath01,controlpathdev01] = glmfit(controlpathlength,[controlpathlengthterms controlpathlengthtotal],'binomial','link','logit');
    % [controlpath02,controlpathdev02] = glmfit(controlpathlength,[controlpathlengthbifs controlpathlengthtotal],'binomial','link','logit');
    % [controlpath03,controlpathdev03] = glmfit(controlpathlength,[controlpathlengthterms controlpathlengthtotal],'binomial','link','probit');
    % [controlpath04,controlpathdev04] = glmfit(controlpathlength,[controlpathlengthbifs controlpathlengthtotal],'binomial','link','probit');
    % [controlpath09,controlpathdev09] = glmfit(controlpathlength,[controlpathlengthterms controlpathlengthtotal],'binomial','link','comploglog');
    % [controlpath10,controlpathdev10] = glmfit(controlpathlength,[controlpathlengthbifs controlpathlengthtotal],'binomial','link','comploglog');
    % [controlpath13,controlpathdev13] = glmfit(controlpathlength,[controlpathlengthterms controlpathlengthtotal],'binomial','link','loglog');
    % [controlpath14,controlpathdev14] = glmfit(controlpathlength,[controlpathlengthbifs controlpathlengthtotal],'binomial','link','loglog');
    
	testpathlength = [testanalysis.pathlength.pathlength]';
    testpathlengthterms = [testanalysis.pathlength.numberterminatingbranches.total]';
    testpathlengthbifs = [testanalysis.pathlength.numberbifurcatingbranches.total]';
    testpathlengthtotal = ([testanalysis.pathlength.numberbifurcatingbranches.total] + [testanalysis.pathlength.numberterminatingbranches.total])';

    % [testpath01,testpathdev01] = glmfit(testpathlength,[testpathlengthterms testpathlengthtotal],'binomial','link','logit');
    % [testpath02,testpathdev02] = glmfit(testpathlength,[testpathlengthbifs testpathlengthtotal],'binomial','link','logit');
    % [testpath03,testpathdev03] = glmfit(testpathlength,[testpathlengthterms testpathlengthtotal],'binomial','link','probit');
    % [testpath04,testpathdev04] = glmfit(testpathlength,[testpathlengthbifs testpathlengthtotal],'binomial','link','probit');
    % [testpath09,testpathdev09] = glmfit(testpathlength,[testpathlengthterms testpathlengthtotal],'binomial','link','comploglog');
    % [testpath10,testpathdev10] = glmfit(testpathlength,[testpathlengthbifs testpathlengthtotal],'binomial','link','comploglog');
    % [testpath13,testpathdev13] = glmfit(testpathlength,[testpathlengthterms testpathlengthtotal],'binomial','link','loglog');
    % [testpath14,testpathdev14] = glmfit(testpathlength,[testpathlengthbifs testpathlengthtotal],'binomial','link','loglog');
    
	
        
        figurehandle = figure;
        plot(controlpathlength,controlpathlengthbifs./controlpathlengthtotal,'gs','MarkerFaceColor','g','MarkerSize',6);
        hold on;
		plot(controlpathlength,controlpathlengthterms./controlpathlengthtotal,'rd','MarkerFaceColor','r','MarkerSize',8);
		plot(testpathlength,testpathlengthbifs./testpathlengthtotal,'ks','MarkerFaceColor','y','MarkerSize',4);
		plot(testpathlength,testpathlengthterms./testpathlengthtotal,'kd','MarkerFaceColor','m','MarkerSize',6);
		
		xlabel('Path Length (\mum)','FontSize',8,'FontWeight','b');
        ylabel('Probability','FontSize',8,'FontWeight','b');
        title(char(' ','Branch Bifurcation / Termination Probability vs Path Length -- Binomial Fits',' '),'FontSize',12,'FontWeight','b');
        set(gca,'FontSize',6);
        
		
        % fittermlogit      = fitter('logit',path01,pathlength);
		% fitbiflogit       = fitter('logit',path02,pathlength);
        % fittermprobit     = fitter('probit',path03,pathlength);
		% fitbifprobit      = fitter('probit',path04,pathlength);
		% fittermcomploglog = fitter('comploglog',path09,pathlength);
		% fitbifcomploglog  = fitter('comploglog',path10,pathlength);
		% fittermloglog     = fitter('loglog',path13,pathlength);
		% fitbifloglog      = fitter('loglog',path14,pathlength);
        
        % plot(pathlength,fitbiflogit,'-c','LineWidth',6);
        % plot(pathlength,fitbifprobit,'--y','LineWidth',5);
		% plot(pathlength,fitbifcomploglog,'-.m','LineWidth',4);
		% plot(pathlength,fitbifloglog,':k','LineWidth',3);
        
		% plot(pathlength,fittermlogit,'-c','LineWidth',6);
		% plot(pathlength,fittermprobit,'--y','LineWidth',5);
		% plot(pathlength,fittermcomploglog,'-.m','LineWidth',4);
		% plot(pathlength,fittermloglog,':k','LineWidth',3);
        
		

        % legendtext(1) = {sprintf('%s Bif Prob',analysis.inputfilename)};
        % legendtext(2) = {char(' ','  Logit Fit',' ',sprintf('      P_1: %.3e',path02(1)),sprintf('      P_2: %.3e',path02(2)),sprintf('    dev: %.3e',pathdev02),' ')};
        % legendtext(3) = {char(' ','  Probit Fit',' ',sprintf('      P_1: %.3e',path04(1)),sprintf('      P_2: %.3e',path04(2)),sprintf('    dev: %.3e',pathdev04),' ')};
		% legendtext(4) = {char(' ','  CompLogLog Fit',' ',sprintf('      P_1: %.3e',path10(1)),sprintf('      P_2: %.3e',path10(2)),sprintf('    dev: %.3e',pathdev10),' ')};
		% legendtext(5) = {char(' ','  LogLog Fit',' ',sprintf('      P_1: %.3e',path14(1)),sprintf('      P_2: %.3e',path14(2)),sprintf('    dev: %.3e',pathdev14),' ')};
        
      
        % legend(legendtext,'Location','NorthEastOutside'); clear legendtext;
        filename = sprintf('%s_ParameterFits_02_branchtypeprob_vs_pathlength',controlanalysis.inputfilename);
        print('-djpeg',filename);

        set(gca,'XScale','log');
        filename = sprintf('%s_ParameterFits_02_branchtypeprob_vs_pathlength_semilogx',controlanalysis.inputfilename);
        print('-djpeg',filename);

        set(gca,'YScale','log');
        ylimits = ylim;
        ylim([0.01 ylimits(2)]);
        filename = sprintf('%s_ParameterFits_02_branchtypeprob_vs_pathlength_loglog',controlanalysis.inputfilename);
        print('-djpeg',filename);
		
		
		
		
		
		
		
		
		
		
		
		
%% Radial Distance

    controlradialdistance = [controlanalysis.radialdistance.radialdistance]';
    controlradialdistanceterms = [controlanalysis.radialdistance.numberterminatingbranches.total]';
    controlradialdistancebifs = [controlanalysis.radialdistance.numberbifurcatingbranches.total]';
    controlradialdistancetotal = ([controlanalysis.radialdistance.numberbifurcatingbranches.total] + [controlanalysis.radialdistance.numberterminatingbranches.total])';

    % [controlradd01,controlradddev01] = glmfit(controlradialdistance,[controlradialdistanceterms controlradialdistancetotal],'binomial','link','logit');
	% [controlradd02,controlradddev02] = glmfit(controlradialdistance,[controlradialdistancebifs controlradialdistancetotal],'binomial','link','logit');
    % [controlradd03,controlradddev03] = glmfit(controlradialdistance,[controlradialdistanceterms controlradialdistancetotal],'binomial','link','probit');
    % [controlradd04,controlradddev04] = glmfit(controlradialdistance,[controlradialdistancebifs controlradialdistancetotal],'binomial','link','probit');
    % [controlradd09,controlradddev09] = glmfit(controlradialdistance,[controlradialdistanceterms controlradialdistancetotal],'binomial','link','comploglog');
    % [controlradd10,controlradddev10] = glmfit(controlradialdistance,[controlradialdistancebifs controlradialdistancetotal],'binomial','link','comploglog');
    % [controlradd13,controlradddev13] = glmfit(controlradialdistance,[controlradialdistanceterms controlradialdistancetotal],'binomial','link','loglog');
    % [controlradd14,controlradddev14] = glmfit(controlradialdistance,[controlradialdistancebifs controlradialdistancetotal],'binomial','link','loglog');
    
	testradialdistance = [testanalysis.radialdistance.radialdistance]';
    testradialdistanceterms = [testanalysis.radialdistance.numberterminatingbranches.total]';
    testradialdistancebifs = [testanalysis.radialdistance.numberbifurcatingbranches.total]';
    testradialdistancetotal = ([testanalysis.radialdistance.numberbifurcatingbranches.total] + [testanalysis.radialdistance.numberterminatingbranches.total])';

    % [testradd01,testradddev01] = glmfit(testradialdistance,[testradialdistanceterms testradialdistancetotal],'binomial','link','logit');
	% [testradd02,testradddev02] = glmfit(testradialdistance,[testradialdistancebifs testradialdistancetotal],'binomial','link','logit');
    % [testradd03,testradddev03] = glmfit(testradialdistance,[testradialdistanceterms testradialdistancetotal],'binomial','link','probit');
    % [testradd04,testradddev04] = glmfit(testradialdistance,[testradialdistancebifs testradialdistancetotal],'binomial','link','probit');
    % [testradd09,testradddev09] = glmfit(testradialdistance,[testradialdistanceterms testradialdistancetotal],'binomial','link','comploglog');
    % [testradd10,testradddev10] = glmfit(testradialdistance,[testradialdistancebifs testradialdistancetotal],'binomial','link','comploglog');
    % [testradd13,testradddev13] = glmfit(testradialdistance,[testradialdistanceterms testradialdistancetotal],'binomial','link','loglog');
    % [testradd14,testradddev14] = glmfit(testradialdistance,[testradialdistancebifs testradialdistancetotal],'binomial','link','loglog');
    

	
        figurehandle = figure;
        plot(controlradialdistance,controlradialdistancebifs./controlradialdistancetotal,'gs','MarkerFaceColor','g','MarkerSize',6);
        hold on;
		plot(controlradialdistance,controlradialdistanceterms./controlradialdistancetotal,'rd','MarkerFaceColor','r','MarkerSize',8);
		plot(testradialdistance,testradialdistancebifs./testradialdistancetotal,'ks','MarkerFaceColor','y','MarkerSize',4);
		plot(testradialdistance,testradialdistanceterms./testradialdistancetotal,'kd','MarkerFaceColor','m','MarkerSize',6);
		
		
		xlabel('Radial Distance (\mum)','FontSize',8,'FontWeight','b');
        ylabel('Probability','FontSize',8,'FontWeight','b');
        title(char(' ','Branch Bifurcation / Termination Probability vs Radial Distance -- Binomial Fits',' '),'FontSize',12,'FontWeight','b');
        set(gca,'FontSize',6);

		
        % fittermlogit      = fitter('logit',radd01,radialdistance);
		% fitbiflogit       = fitter('logit',radd02,radialdistance);
        % fittermprobit     = fitter('probit',radd03,radialdistance);
		% fitbifprobit      = fitter('probit',radd04,radialdistance);
		% fittermcomploglog = fitter('comploglog',radd09,radialdistance);
		% fitbifcomploglog  = fitter('comploglog',radd10,radialdistance);
		% fittermloglog     = fitter('loglog',radd13,radialdistance);
		% fitbifloglog      = fitter('loglog',radd14,radialdistance);
        
        % plot(radialdistance,fitbiflogit,'-c','LineWidth',6);
        % plot(radialdistance,fitbifprobit,'--y','LineWidth',5);
		% plot(radialdistance,fitbifcomploglog,'-.m','LineWidth',4);
		% plot(radialdistance,fitbifloglog,':k','LineWidth',3);
        
		% plot(radialdistance,fittermlogit,'-c','LineWidth',6);
		% plot(radialdistance,fittermprobit,'--y','LineWidth',5);
		% plot(radialdistance,fittermcomploglog,'-.m','LineWidth',4);
		% plot(radialdistance,fittermloglog,':k','LineWidth',3);
        
		

        % legendtext(1) = {sprintf('%s Bif Prob',analysis.inputfilename)};
        % legendtext(2) = {char(' ','  Logit Fit',' ',sprintf('      P_1: %.3e',radd02(1)),sprintf('      P_2: %.3e',radd02(2)),sprintf('    dev: %.3e',radddev02),' ')};
        % legendtext(3) = {char(' ','  Probit Fit',' ',sprintf('      P_1: %.3e',radd04(1)),sprintf('      P_2: %.3e',radd04(2)),sprintf('    dev: %.3e',radddev04),' ')};
		% legendtext(4) = {char(' ','  CompLogLog Fit',' ',sprintf('      P_1: %.3e',radd10(1)),sprintf('      P_2: %.3e',radd10(2)),sprintf('    dev: %.3e',radddev10),' ')};
		% legendtext(5) = {char(' ','  LogLog Fit',' ',sprintf('      P_1: %.3e',radd14(1)),sprintf('      P_2: %.3e',radd14(2)),sprintf('    dev: %.3e',radddev14),' ')};
        
       
        % legend(legendtext,'Location','NorthEastOutside'); clear legendtext;
        filename = sprintf('%s_ParameterFits_03_branchtypeprob_vs_radialdistance',controlanalysis.inputfilename);
        print('-djpeg',filename);

        set(gca,'XScale','log');
        filename = sprintf('%s_ParameterFits_03_branchtypeprob_vs_radialdistance_semilogx',controlanalysis.inputfilename);
        print('-djpeg',filename);

        set(gca,'YScale','log');
        ylimits = ylim;
        ylim([0.01 ylimits(2)]);
        filename = sprintf('%s_ParameterFits_03_branchtypeprob_vs_radialdistance_loglog',controlanalysis.inputfilename);
        print('-djpeg',filename);
		
		
		
		
		


%% Double Bin

    controldiameter   = controlanalysis.doublebin.diameter;
    controlpathlength = controlanalysis.doublebin.pathlength;
    controldoublebin = [[controlanalysis.doublebin.array.diameter] [controlanalysis.doublebin.array.pathlength]];
    controldoublebinterms = [controlanalysis.doublebin.array.numberterminatingbranches];
    controldoublebinbifs = [controlanalysis.doublebin.array.numberbifurcatingbranches];
    controldoublebintotal = ([controlanalysis.doublebin.array.numberbifurcatingbranches] + [controlanalysis.doublebin.array.numberterminatingbranches]);

    % [controldb01,controldbdev01] = glmfit(controldoublebin,[controldoublebinterms controldoublebintotal],'binomial','link','logit');
	% [controldb02,controldbdev02] = glmfit(controldoublebin,[controldoublebinbifs controldoublebintotal],'binomial','link','logit');
    % [controldb03,controldbdev03] = glmfit(controldoublebin,[controldoublebinterms controldoublebintotal],'binomial','link','probit');
    % [controldb04,controldbdev04] = glmfit(controldoublebin,[controldoublebinbifs controldoublebintotal],'binomial','link','probit');
    % [controldb05,controldbdev05] = glmfit(controldoublebin,[controldoublebinterms controldoublebintotal],'binomial','link','comploglog');
    % [controldb06,controldbdev06] = glmfit(controldoublebin,[controldoublebinbifs controldoublebintotal],'binomial','link','comploglog');
    % [controldb07,controldbdev07] = glmfit(controldoublebin,[controldoublebinterms controldoublebintotal],'binomial','link','loglog');
    % [controldb08,controldbdev08] = glmfit(controldoublebin,[controldoublebinbifs controldoublebintotal],'binomial','link','loglog');
	
	testdiameter   = testanalysis.doublebin.diameter;
    testpathlength = testanalysis.doublebin.pathlength;
    testdoublebin = [[testanalysis.doublebin.array.diameter] [testanalysis.doublebin.array.pathlength]];
    testdoublebinterms = [testanalysis.doublebin.array.numberterminatingbranches];
    testdoublebinbifs = [testanalysis.doublebin.array.numberbifurcatingbranches];
    testdoublebintotal = ([testanalysis.doublebin.array.numberbifurcatingbranches] + [testanalysis.doublebin.array.numberterminatingbranches]);

    % [testdb01,testdbdev01] = glmfit(testdoublebin,[testdoublebinterms testdoublebintotal],'binomial','link','logit');
	% [testdb02,testdbdev02] = glmfit(testdoublebin,[testdoublebinbifs testdoublebintotal],'binomial','link','logit');
    % [testdb03,testdbdev03] = glmfit(testdoublebin,[testdoublebinterms testdoublebintotal],'binomial','link','probit');
    % [testdb04,testdbdev04] = glmfit(testdoublebin,[testdoublebinbifs testdoublebintotal],'binomial','link','probit');
    % [testdb05,testdbdev05] = glmfit(testdoublebin,[testdoublebinterms testdoublebintotal],'binomial','link','comploglog');
    % [testdb06,testdbdev06] = glmfit(testdoublebin,[testdoublebinbifs testdoublebintotal],'binomial','link','comploglog');
    % [testdb07,testdbdev07] = glmfit(testdoublebin,[testdoublebinterms testdoublebintotal],'binomial','link','loglog');
    % [testdb08,testdbdev08] = glmfit(testdoublebin,[testdoublebinbifs testdoublebintotal],'binomial','link','loglog');
    
    
        figurehandle = figure;
        plot3(controldoublebin(:,1),controldoublebin(:,2),controldoublebinbifs./controldoublebintotal,'gs','MarkerFaceColor','g','MarkerSize',6);
        hold on;
        plot3(controldoublebin(:,1),controldoublebin(:,2),controldoublebinterms./controldoublebintotal,'rd','MarkerFaceColor','r','MarkerSize',8);
		plot3(testdoublebin(:,1),testdoublebin(:,2),testdoublebinbifs./testdoublebintotal,'ks','MarkerFaceColor','y','MarkerSize',4);
		plot3(testdoublebin(:,1),testdoublebin(:,2),testdoublebinterms./testdoublebintotal,'kd','MarkerFaceColor','m','MarkerSize',6);

        xlabel('Diameter (\mum)','FontSize',8,'FontWeight','b');
        ylabel('Path Length (\mum)','FontSize',8,'FontWeight','b');
        zlabel('Probability','FontSize',8,'FontWeight','b');
        title(char(' ','Branch Bifurcation / Termination Probability vs Diameter & Path Length -- Logit Fit',' '),'FontSize',12,'FontWeight','b');
        set(gca,'FontSize',6);

        % fitbiflogit = fitter('logit',db02,diameter,pathlength);
        % fittermlogit = fitter('logit',db01,diameter,pathlength);

        % surf(diameter,pathlength,fitbiflogit);
        % surf(diameter,pathlength,fittermlogit);
        % legendtext(1) = {sprintf('%s Bif Prob',analysis.inputfilename)};
        % legendtext(2) = {sprintf('%s Term Prob',analysis.inputfilename)};
        % legendtext(3) = {char(' ','  Logit Fit (Bif Prob)',' ',sprintf('      P_1: %.3e',db02(1)),sprintf('      P_2: %.3e',db02(2)),sprintf('      P_3: %.3e',db02(3)),sprintf('    dev: %.3e',dbdev02),' ')};
        % legend(legendtext,'Location','NorthEastOutside'); clear legendtext;
        filename = sprintf('%s_ParameterFits_04_branchtypeprob_vs_doublebin_logit',controlanalysis.inputfilename);
        print('-djpeg',filename);
        saveas(gcf,filename,'fig');

        set(gca,'XScale','log');
        filename = sprintf('%s_ParameterFits_04_branchtypeprob_vs_doublebin_logit_semilogx',controlanalysis.inputfilename);
        print('-djpeg',filename);
        
        set(gca,'YScale','log');
        filename = sprintf('%s_ParameterFits_04_branchtypeprob_vs_doublebin_logit_semilogxy',controlanalysis.inputfilename);
        print('-djpeg',filename);
        


       % figurehandle = figure;
       % plot3(controldoublebin(:,1),controldoublebin(:,2),controldoublebinbifs./controldoublebintotal,'gs','MarkerFaceColor','g');
       % hold on;
       % plot3(controldoublebin(:,1),controldoublebin(:,2),controldoublebinterms./controldoublebintotal,'rd','MarkerFaceColor','r');
       % xlabel('Diameter (\mum)','FontSize',8,'FontWeight','b');
       % ylabel('Path Length (\mum)','FontSize',8,'FontWeight','b');
       % zlabel('Probability','FontSize',8,'FontWeight','b');
       % title(char(' ','Branch Bifurcation / Termination Probability vs Diameter & Path Length -- Probit Fit',' '),'FontSize',12,'FontWeight','b');
       % set(gca,'FontSize',6);

       % fitbifprobit = fitter('probit',db04,diameter,pathlength);
       % fittermprobit = fitter('probit',db03,diameter,pathlength);

       % surf(diameter,pathlength,fitbifprobit);
       % surf(diameter,pathlength,fittermprobit);
       % legendtext(1) = {sprintf('%s Bif Prob',analysis.inputfilename)};
       % legendtext(2) = {sprintf('%s Term Prob',analysis.inputfilename)};
       % legendtext(3) = {char(' ','  Probit Fit (Bif Prob)',' ',sprintf('      P_1: %.3e',db04(1)),sprintf('      P_2: %.3e',db04(2)),sprintf('      P_3: %.3e',db04(3)),sprintf('    dev: %.3e',dbdev04),' ')};
       % legend(legendtext,'Location','NorthEastOutside'); clear legendtext;
       % filename = sprintf('%s_ParameterFits_05_branchtypeprob_vs_doublebin_probit',controlanalysis.inputfilename);
       % print('-djpeg',filename);
       % saveas(gcf,filename,'fig');

       % set(gca,'XScale','log');
       % filename = sprintf('%s_ParameterFits_05_branchtypeprob_vs_doublebin_probit_semilogx',controlanalysis.inputfilename);
       % print('-djpeg',filename);

       % set(gca,'YScale','log');
       % filename = sprintf('%s_ParameterFits_05_branchtypeprob_vs_doublebin_probit_semilogxy',controlanalysis.inputfilename);
       % print('-djpeg',filename);
	   
	   
	   
	   % figurehandle = figure;
       % plot3(controldoublebin(:,1),controldoublebin(:,2),controldoublebinbifs./controldoublebintotal,'gs','MarkerFaceColor','g');
       % hold on;
       % plot3(controldoublebin(:,1),controldoublebin(:,2),controldoublebinterms./controldoublebintotal,'rd','MarkerFaceColor','r');
       % xlabel('Diameter (\mum)','FontSize',8,'FontWeight','b');
       % ylabel('Path Length (\mum)','FontSize',8,'FontWeight','b');
       % zlabel('Probability','FontSize',8,'FontWeight','b');
       % title(char(' ','Branch Bifurcation / Termination Probability vs Diameter & Path Length -- CompLogLog Fit',' '),'FontSize',12,'FontWeight','b');
       % set(gca,'FontSize',6);

       % fitbifcomploglog = fitter('comploglog',db06,diameter,pathlength);
       % fittermcomploglog = fitter('comploglog',db05,diameter,pathlength);

       % surf(diameter,pathlength,fitbifcomploglog);
       % surf(diameter,pathlength,fittermcomploglog);
       % legendtext(1) = {sprintf('%s Bif Prob',analysis.inputfilename)};
       % legendtext(2) = {sprintf('%s Term Prob',analysis.inputfilename)};
       % legendtext(3) = {char(' ','  CompLogLog Fit (Bif Prob)',' ',sprintf('      P_1: %.3e',db06(1)),sprintf('      P_2: %.3e',db06(2)),sprintf('      P_3: %.3e',db06(3)),sprintf('    dev: %.3e',dbdev06),' ')};
       % legend(legendtext,'Location','NorthEastOutside'); clear legendtext;
       % filename = sprintf('%s_ParameterFits_06_branchtypeprob_vs_doublebin_comploglog',controlanalysis.inputfilename);
       % print('-djpeg',filename);
       % saveas(gcf,filename,'fig');

       % set(gca,'XScale','log');
       % filename = sprintf('%s_ParameterFits_06_branchtypeprob_vs_doublebin_comploglog_semilogx',controlanalysis.inputfilename);
       % print('-djpeg',filename);

       % set(gca,'YScale','log');
       % filename = sprintf('%s_ParameterFits_06_branchtypeprob_vs_doublebin_comploglog_semilogxy',controlanalysis.inputfilename);
       % print('-djpeg',filename);
	   
	   
	   
	   % figurehandle = figure;
       % plot3(controldoublebin(:,1),controldoublebin(:,2),controldoublebinbifs./controldoublebintotal,'gs','MarkerFaceColor','g');
       % hold on;
       % plot3(controldoublebin(:,1),controldoublebin(:,2),controldoublebinterms./controldoublebintotal,'rd','MarkerFaceColor','r');
       % xlabel('Diameter (\mum)','FontSize',8,'FontWeight','b');
       % ylabel('Path Length (\mum)','FontSize',8,'FontWeight','b');
       % zlabel('Probability','FontSize',8,'FontWeight','b');
       % title(char(' ','Branch Bifurcation / Termination Probability vs Diameter & Path Length -- LogLog Fit',' '),'FontSize',12,'FontWeight','b');
       % set(gca,'FontSize',6);

       % fitbifloglog = fitter('loglog',db08,diameter,pathlength);
       % fittermloglog = fitter('loglog',db07,diameter,pathlength);

       % surf(diameter,pathlength,fitbifloglog);
       % surf(diameter,pathlength,fittermloglog);
       % legendtext(1) = {sprintf('%s Bif Prob',analysis.inputfilename)};
       % legendtext(2) = {sprintf('%s Term Prob',analysis.inputfilename)};
       % legendtext(3) = {char(' ','  LogLog Fit (Bif Prob)',' ',sprintf('      P_1: %.3e',db08(1)),sprintf('      P_2: %.3e',db08(2)),sprintf('      P_3: %.3e',db08(3)),sprintf('    dev: %.3e',dbdev08),' ')};
       % legend(legendtext,'Location','NorthEastOutside'); clear legendtext;
       % filename = sprintf('%s_ParameterFits_07_branchtypeprob_vs_doublebin_loglog',controlanalysis.inputfilename);
       % print('-djpeg',filename);
       % saveas(gcf,filename,'fig');

       % set(gca,'XScale','log');
       % filename = sprintf('%s_ParameterFits_07_branchtypeprob_vs_doublebin_loglog_semilogx',controlanalysis.inputfilename);
       % print('-djpeg',filename);

       % set(gca,'YScale','log');
       % filename = sprintf('%s_ParameterFits_07_branchtypeprob_vs_doublebin_loglog_semilogxy',controlanalysis.inputfilename);
       % print('-djpeg',filename);
