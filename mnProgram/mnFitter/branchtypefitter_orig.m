function parameterfits = branchtypefitter(analysis,parameterfits)

disp('     Branch Type Probability.');

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
if exist('branchtypeprob','dir')==7
    cd('branchtypeprob');
else
    mkdir('branchtypeprob');
    cd('branchtypeprob');
end


% Diameter

    diameter = [analysis.diameter.diameter]';
    diameterterms = [analysis.diameter.numberterminatingbranches.total]';
    diameterbifs = [analysis.diameter.numberbifurcatingbranches.total]';
    diametertotal = ([analysis.diameter.numberbifurcatingbranches.total] + [analysis.diameter.numberterminatingbranches.total])';

    [b01,dev01] = glmfit(diameter,[diameterterms diametertotal],'binomial','link','logit');
    parameterfits.branchtermprob.diameter.logit.parameter = b01;
    parameterfits.branchtermprob.diameter.logit.deviance = dev01;
    
    [b02,dev02] = glmfit(diameter,[diameterbifs diametertotal],'binomial','link','logit');
    parameterfits.branchbifprob.diameter.logit.parameter = b02;
    parameterfits.branchbifprob.diameter.logit.deviance = dev02;
    
    [b03,dev03] = glmfit(diameter,[diameterterms diametertotal],'binomial','link','probit');
    parameterfits.branchtermprob.diameter.probit.parameter = b03;
    parameterfits.branchtermprob.diameter.probit.deviance = dev03;
    
    [b04,dev04] = glmfit(diameter,[diameterbifs diametertotal],'binomial','link','probit');
    parameterfits.branchbifprob.diameter.probit.parameter = b04;
    parameterfits.branchbifprob.diameter.probit.deviance = dev04;
    

        
        figurehandle = figure;
        %set(figurehandle,'Color','c');
        plot(diameter,diameterbifs./diametertotal,'gs','MarkerFaceColor','g');
        xlabel('Diameter (\mum)','FontSize',8,'FontWeight','b');
        ylabel('Probability','FontSize',8,'FontWeight','b');
        title(char(' ','Branch Bifurcation / Termination Probability vs Diameter -- Binomial Fits',' '),'FontSize',12,'FontWeight','b');
        set(gca,'FontSize',6);
        hold on;
        fitbiflogit = fitter('logit',b02,diameter);
        fitbifprobit = fitter('probit',b04,diameter);
        fittermlogit = fitter('logit',b01,diameter);
        fittermprobit = fitter('probit',b03,diameter);
        plot(diameter,fitbiflogit,'-c','LineWidth',5);
        plot(diameter,fitbifprobit,':k','LineWidth',4);
        plot(diameter,diameterterms./diametertotal,'rd','MarkerFaceColor','r');
        plot(diameter,fittermlogit,'-c','LineWidth',5);
        plot(diameter,fittermprobit,':k','LineWidth',4);

        plot(diameter,diameterbifs./diametertotal,'gs','MarkerFaceColor','g');
        plot(diameter,diameterterms./diametertotal,'rd','MarkerFaceColor','r');

        legendtext(1) = {sprintf('%s Bif Prob',analysis.inputfilename)};
        legendtext(2) = {char(' ','  Logit Fit',' ',sprintf('      P_1: %.3e',b02(1)),sprintf('      P_2: %.3e',b02(2)),sprintf('    dev: %.3e',dev02),' ')};
        legendtext(3) = {char(' ','  Probit Fit',' ',sprintf('      P_1: %.3e',b04(1)),sprintf('      P_2: %.3e',b04(2)),sprintf('    dev: %.3e',dev04),' ')};
        legendtext(4) = {sprintf('%s Term Prob',analysis.inputfilename)};
        legendtext(5) = {char(' ','  Logit Fit',' ',sprintf('      P_1: %.3e',b01(1)),sprintf('      P_2: %.3e',b01(2)),sprintf('    dev: %.3e',dev01),' ')};
        legendtext(6) = {char(' ','  Probit Fit',' ',sprintf('      P_1: %.3e',b03(1)),sprintf('      P_2: %.3e',b03(2)),sprintf('    dev: %.3e',dev03),' ')};
        %fillscreen;
        legend(legendtext,'Location','NorthEastOutside'); clear legendtext;
        filename = sprintf('%s_ParameterFits_01_branchtypeprob_vs_diameter',analysis.inputfilename);
        print('-djpeg',filename);

        set(gca,'XScale','log');
        filename = sprintf('%s_ParameterFits_02_branchtypeprob_vs_diameter_semilogx',analysis.inputfilename);
        print('-djpeg',filename);

        set(gca,'YScale','log');
        ylimits = ylim;
        ylim([0.01 ylimits(2)]);
        filename = sprintf('%s_ParameterFits_03_branchtypeprob_vs_diameter_loglog',analysis.inputfilename);
        print('-djpeg',filename);
        
        
% Path Length

    pathlength = [analysis.pathlength.pathlength]';
    pathlengthterms = [analysis.pathlength.numberterminatingbranches.total]';
    pathlengthbifs = [analysis.pathlength.numberbifurcatingbranches.total]';
    pathlengthtotal = ([analysis.pathlength.numberbifurcatingbranches.total] + [analysis.pathlength.numberterminatingbranches.total])';

    [b05,dev05] = glmfit(pathlength,[pathlengthterms pathlengthtotal],'binomial','link','logit');
    parameterfits.branchtermprob.pathlength.logit.parameter = b05;
    parameterfits.branchtermprob.pathlength.logit.deviance = dev05;
  
    [b06,dev06] = glmfit(pathlength,[pathlengthbifs pathlengthtotal],'binomial','link','logit');
    parameterfits.branchbifprob.pathlength.logit.parameter = b06;
    parameterfits.branchbifprob.pathlength.logit.deviance = dev06;
    
    [b07,dev07] = glmfit(pathlength,[pathlengthterms pathlengthtotal],'binomial','link','probit');
    parameterfits.branchtermprob.pathlength.probit.parameter = b07;
    parameterfits.branchtermprob.pathlength.probit.deviance = dev07;

    [b08,dev08] = glmfit(pathlength,[pathlengthbifs pathlengthtotal],'binomial','link','probit');
    parameterfits.branchbifprob.pathlength.probit.parameter = b08;
    parameterfits.branchbifprob.pathlength.probit.deviance = dev08;
    

        
        figurehandle = figure;
        %set(figurehandle,'Color','c');
        plot(pathlength,pathlengthbifs./pathlengthtotal,'gs','MarkerFaceColor','g');
        xlabel('Path Length (\mum)','FontSize',8,'FontWeight','b');
        ylabel('Probability','FontSize',8,'FontWeight','b');
        title(char(' ','Branch Bifurcation / Termination Probability vs Path Length -- Binomial Fits',' '),'FontSize',12,'FontWeight','b');
        set(gca,'FontSize',6);
        hold on;
        fitbiflogit = fitter('logit',b06,pathlength);
        fitbifprobit = fitter('probit',b08,pathlength);
        fittermlogit = fitter('logit',b05,pathlength);
        fittermprobit = fitter('probit',b07,pathlength);
        plot(pathlength,fitbiflogit,'-c','LineWidth',5);
        plot(pathlength,fitbifprobit,':k','LineWidth',4);
        plot(pathlength,pathlengthterms./pathlengthtotal,'rd','MarkerFaceColor','r');
        plot(pathlength,fittermlogit,'-c','LineWidth',5);
        plot(pathlength,fittermprobit,':k','LineWidth',4);

        plot(pathlength,pathlengthbifs./pathlengthtotal,'gs','MarkerFaceColor','g');
        plot(pathlength,pathlengthterms./pathlengthtotal,'rd','MarkerFaceColor','r');

        legendtext(1) = {sprintf('%s Bif Prob',analysis.inputfilename)};
        legendtext(2) = {char(' ','  Logit Fit',' ',sprintf('      P_1: %.3e',b06(1)),sprintf('      P_2: %.3e',b06(2)),sprintf('    dev: %.3e',dev06),' ')};
        legendtext(3) = {char(' ','  Probit Fit',' ',sprintf('      P_1: %.3e',b08(1)),sprintf('      P_2: %.3e',b08(2)),sprintf('    dev: %.3e',dev08),' ')};
        legendtext(4) = {sprintf('%s Term Prob',analysis.inputfilename)};
        legendtext(5) = {char(' ','  Logit Fit',' ',sprintf('      P_1: %.3e',b05(1)),sprintf('      P_2: %.3e',b05(2)),sprintf('    dev: %.3e',dev05),' ')};
        legendtext(6) = {char(' ','  Probit Fit',' ',sprintf('      P_1: %.3e',b07(1)),sprintf('      P_2: %.3e',b07(2)),sprintf('    dev: %.3e',dev07),' ')};
        %fillscreen;
        legend(legendtext,'Location','NorthEastOutside'); clear legendtext;
        filename = sprintf('%s_ParameterFits_04_branchtypeprob_vs_pathlength',analysis.inputfilename);
        print('-djpeg',filename);

        set(gca,'XScale','log');
        filename = sprintf('%s_ParameterFits_05_branchtypeprob_vs_pathlength_semilogx',analysis.inputfilename);
        print('-djpeg',filename);

        set(gca,'YScale','log');
        ylimits = ylim;
        ylim([0.01 ylimits(2)]);
        filename = sprintf('%s_ParameterFits_06_branchtypeprob_vs_pathlength_loglog',analysis.inputfilename);
        print('-djpeg',filename);

    
    
% Radial Distance

    radialdistance = [analysis.radialdistance.radialdistance]';
    radialdistanceterms = [analysis.radialdistance.numberterminatingbranches.total]';
    radialdistancebifs = [analysis.radialdistance.numberbifurcatingbranches.total]';
    radialdistancetotal = ([analysis.radialdistance.numberbifurcatingbranches.total] + [analysis.radialdistance.numberterminatingbranches.total])';

    [b09,dev09] = glmfit(radialdistance,[radialdistanceterms radialdistancetotal],'binomial','link','logit');
    parameterfits.branchtermprob.radialdistance.logit.parameter = b09;
    parameterfits.branchtermprob.radialdistance.logit.deviance = dev09;
  
    [b10,dev10] = glmfit(radialdistance,[radialdistancebifs radialdistancetotal],'binomial','link','logit');
    parameterfits.branchbifprob.radialdistance.logit.parameter = b10;
    parameterfits.branchbifprob.radialdistance.logit.deviance = dev10;
    
    [b11,dev11] = glmfit(radialdistance,[radialdistanceterms radialdistancetotal],'binomial','link','probit');
    parameterfits.branchtermprob.radialdistance.probit.parameter = b11;
    parameterfits.branchtermprob.radialdistance.probit.deviance = dev11;

    [b12,dev12] = glmfit(radialdistance,[radialdistancebifs radialdistancetotal],'binomial','link','probit');
    parameterfits.branchbifprob.radialdistance.probit.parameter = b12;
    parameterfits.branchbifprob.radialdistance.probit.deviance = dev12;
    


        figurehandle = figure;
        %set(figurehandle,'Color','c');
        plot(radialdistance,radialdistancebifs./radialdistancetotal,'gs','MarkerFaceColor','g');
        xlabel('Radial Distance (\mum)','FontSize',8,'FontWeight','b');
        ylabel('Probability','FontSize',8,'FontWeight','b');
        title(char(' ','Branch Bifurcation / Termination Probability vs Radial Distance -- Binomial Fits',' '),'FontSize',12,'FontWeight','b');
        set(gca,'FontSize',6);
        hold on;
        fitbiflogit = fitter('logit',b10,radialdistance);
        fitbifprobit = fitter('probit',b12,radialdistance);
        fittermlogit = fitter('logit',b09,radialdistance);
        fittermprobit = fitter('probit',b11,radialdistance);
        plot(radialdistance,fitbiflogit,'-c','LineWidth',5);
        plot(radialdistance,fitbifprobit,':k','LineWidth',4);
        plot(radialdistance,radialdistanceterms./radialdistancetotal,'rd','MarkerFaceColor','r');
        plot(radialdistance,fittermlogit,'-c','LineWidth',5);
        plot(radialdistance,fittermprobit,':k','LineWidth',4);

        plot(radialdistance,radialdistancebifs./radialdistancetotal,'gs','MarkerFaceColor','g');
        plot(radialdistance,radialdistanceterms./radialdistancetotal,'rd','MarkerFaceColor','r');

        legendtext(1) = {sprintf('%s Bif Prob',analysis.inputfilename)};
        legendtext(2) = {char(' ','  Logit Fit',' ',sprintf('      P_1: %.3e',b10(1)),sprintf('      P_2: %.3e',b10(2)),sprintf('    dev: %.3e',dev10),' ')};
        legendtext(3) = {char(' ','  Probit Fit',' ',sprintf('      P_1: %.3e',b12(1)),sprintf('      P_2: %.3e',b12(2)),sprintf('    dev: %.3e',dev12),' ')};
        legendtext(4) = {sprintf('%s Term Prob',analysis.inputfilename)};
        legendtext(5) = {char(' ','  Logit Fit',' ',sprintf('      P_1: %.3e',b09(1)),sprintf('      P_2: %.3e',b09(2)),sprintf('    dev: %.3e',dev09),' ')};
        legendtext(6) = {char(' ','  Probit Fit',' ',sprintf('      P_1: %.3e',b11(1)),sprintf('      P_2: %.3e',b11(2)),sprintf('    dev: %.3e',dev11),' ')};
        %fillscreen;
        legend(legendtext,'Location','NorthEastOutside'); clear legendtext;
        filename = sprintf('%s_ParameterFits_07_branchtypeprob_vs_radialdistance',analysis.inputfilename);
        print('-djpeg',filename);

        set(gca,'XScale','log');
        filename = sprintf('%s_ParameterFits_08_branchtypeprob_vs_radialdistance_semilogx',analysis.inputfilename);
        print('-djpeg',filename);

        set(gca,'YScale','log');
        ylimits = ylim;
        ylim([0.01 ylimits(2)]);
        filename = sprintf('%s_ParameterFits_09_branchtypeprob_vs_radialdistance_loglog',analysis.inputfilename);
        print('-djpeg',filename);

    
    
% Double Bin

    diameter   = analysis.doublebin.diameter;
    pathlength = analysis.doublebin.pathlength;
    doublebin = [[analysis.doublebin.array.diameter] [analysis.doublebin.array.pathlength]];
    doublebinterms = [analysis.doublebin.array.numberterminations];
    doublebinbifs = [analysis.doublebin.array.numberbifurcations];
    doublebintotal = ([analysis.doublebin.array.numberbifurcations] + [analysis.doublebin.array.numberterminations]);

    [b13,dev13] = glmfit(doublebin,[doublebinterms doublebintotal],'binomial','link','logit');
    parameterfits.branchtermprob.doublebin.logit.parameter = b13;
    parameterfits.branchtermprob.doublebin.logit.deviance = dev13;

    [b14,dev14] = glmfit(doublebin,[doublebinbifs doublebintotal],'binomial','link','logit');
    parameterfits.branchbifprob.doublebin.logit.parameter = b14;
    parameterfits.branchbifprob.doublebin.logit.deviance = dev14;
    
    [b15,dev15] = glmfit(doublebin,[doublebinterms doublebintotal],'binomial','link','probit');
    parameterfits.branchtermprob.doublebin.probit.parameter = b15;
    parameterfits.branchtermprob.doublebin.probit.deviance = dev15;
    
    [b16,dev16] = glmfit(doublebin,[doublebinbifs doublebintotal],'binomial','link','probit');
    parameterfits.branchbifprob.doublebin.probit.parameter = b16;
    parameterfits.branchbifprob.doublebin.probit.deviance = dev16;
    

    
        figurehandle = figure;
        %set(figurehandle,'Color','c');
        %set(figurehandle,'InvertHardcopy','off');
        plot3(doublebin(:,1),doublebin(:,2),doublebinbifs./doublebintotal,'gs','MarkerFaceColor','g');
        hold on;
        plot3(doublebin(:,1),doublebin(:,2),doublebinterms./doublebintotal,'rd','MarkerFaceColor','r');

        xlabel('Diameter (\mum)','FontSize',8,'FontWeight','b');
        ylabel('Path Length (\mum)','FontSize',8,'FontWeight','b');
        zlabel('Probability','FontSize',8,'FontWeight','b');
        title(char(' ','Branch Bifurcation / Termination Probability vs Diameter & Path Length -- Logit Fit',' '),'FontSize',12,'FontWeight','b');
        set(gca,'FontSize',6);

        fitbiflogit = fitter('logit',b14,diameter,pathlength);
        fittermlogit = fitter('logit',b13,diameter,pathlength);

        surf(diameter,pathlength,fitbiflogit);
        surf(diameter,pathlength,fittermlogit);
        legendtext(1) = {sprintf('%s Bif Prob',analysis.inputfilename)};
        legendtext(2) = {sprintf('%s Term Prob',analysis.inputfilename)};
        legendtext(3) = {char(' ','  Logit Fit (Bif Prob)',' ',sprintf('      P_1: %.3e',b14(1)),sprintf('      P_2: %.3e',b14(2)),sprintf('      P_3: %.3e',b14(3)),sprintf('    dev: %.3e',dev14),' ')};
        %fillscreen;
        legend(legendtext,'Location','NorthEastOutside'); clear legendtext;
        filename = sprintf('%s_ParameterFits_10_branchtypeprob_vs_doublebin_logit',analysis.inputfilename);
        print('-djpeg',filename);
        %print('-dill',filename);
        saveas(gcf,filename,'fig');

        set(gca,'XScale','log');
        filename = sprintf('%s_ParameterFits_11_branchtypeprob_vs_doublebin_logit_semilogx',analysis.inputfilename);
        print('-djpeg',filename);
        %print('-dill',filename);
        %saveas(gcf,filename,'fig');

        set(gca,'YScale','log');
        %     ylimits = ylim;
        %     ylim([0.01 ylimits(2)]);
        filename = sprintf('%s_ParameterFits_12_branchtypeprob_vs_doublebin_logit_semilogxy',analysis.inputfilename);
        print('-djpeg',filename);
        %print('-dill',filename);
        %saveas(gcf,filename,'fig');


       figurehandle = figure;
       %set(figurehandle,'Color','c');
       %set(figurehandle,'InvertHardcopy','off');
       plot3(doublebin(:,1),doublebin(:,2),doublebinbifs./doublebintotal,'gs','MarkerFaceColor','g');
       hold on;
       plot3(doublebin(:,1),doublebin(:,2),doublebinterms./doublebintotal,'rd','MarkerFaceColor','r');
       xlabel('Diameter (\mum)','FontSize',8,'FontWeight','b');
       ylabel('Path Length (\mum)','FontSize',8,'FontWeight','b');
       zlabel('Probability','FontSize',8,'FontWeight','b');
       title(char(' ','Branch Bifurcation / Termination Probability vs Diameter & Path Length -- Probit Fit',' '),'FontSize',12,'FontWeight','b');
       set(gca,'FontSize',6);

       fitbifprobit = fitter('probit',b16,diameter,pathlength);
       fittermprobit = fitter('probit',b15,diameter,pathlength);

       surf(diameter,pathlength,fitbifprobit);
       surf(diameter,pathlength,fittermprobit);
       legendtext(1) = {sprintf('%s Bif Prob',analysis.inputfilename)};
       legendtext(2) = {sprintf('%s Term Prob',analysis.inputfilename)};
       legendtext(3) = {char(' ','  Probit Fit (Bif Prob)',' ',sprintf('      P_1: %.3e',b16(1)),sprintf('      P_2: %.3e',b16(2)),sprintf('      P_3: %.3e',b16(3)),sprintf('    dev: %.3e',dev16),' ')};
       %fillscreen;
       legend(legendtext,'Location','NorthEastOutside'); clear legendtext;
       filename = sprintf('%s_ParameterFits_13_branchtypeprob_vs_doublebin_probit',analysis.inputfilename);
       print('-djpeg',filename);
       saveas(gcf,filename,'fig');

       set(gca,'XScale','log');
       filename = sprintf('%s_ParameterFits_14_branchtypeprob_vs_doublebin_probit_semilogx',analysis.inputfilename);
       print('-djpeg',filename);

       set(gca,'YScale','log');
            % ylimits = ylim;
            % ylim([0.01 ylimits(2)]);
       filename = sprintf('%s_ParameterFits_15_branchtypeprob_vs_doublebin_probit_semilogxy',analysis.inputfilename);
       print('-djpeg',filename);

    
    