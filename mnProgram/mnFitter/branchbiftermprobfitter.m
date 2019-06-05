function controlanalysis = branchbiftermprobfitter(controlanalysis)

disp('   Branch bif/term prob fitting started.');

% Diameter

    diameter = [controlanalysis.diameter.diameter]';
    diameterterms = [controlanalysis.diameter.numberterminatingbranches.total]';
    diameterbifs = [controlanalysis.diameter.numberbifurcatingbranches.total]';
    diametertotal = ([controlanalysis.diameter.numberbifurcatingbranches.total] + [controlanalysis.diameter.numberterminatingbranches.total])';

    [b01,dev01] = glmfit(diameter,[diameterterms diametertotal],'binomial','link','logit');
    controlanalysis.fits.branchtermprob.diameter.logit.parameter1 = b01(1);
    controlanalysis.fits.branchtermprob.diameter.logit.parameter2 = b01(2);
    controlanalysis.fits.branchtermprob.diameter.logit.deviance = dev01;
    
    [b02,dev02] = glmfit(diameter,[diameterbifs diametertotal],'binomial','link','logit');
    controlanalysis.fits.branchbifprob.diameter.logit.parameter1 = b02(1);
    controlanalysis.fits.branchbifprob.diameter.logit.parameter2 = b02(2);
    controlanalysis.fits.branchbifprob.diameter.logit.deviance = dev02;
    
    [b03,dev03] = glmfit(diameter,[diameterterms diametertotal],'binomial','link','probit');
    controlanalysis.fits.branchtermprob.diameter.probit.parameter1 = b03(1);
    controlanalysis.fits.branchtermprob.diameter.probit.parameter2 = b03(2);
    controlanalysis.fits.branchtermprob.diameter.probit.deviance = dev03;
    
    [b04,dev04] = glmfit(diameter,[diameterbifs diametertotal],'binomial','link','probit');
    controlanalysis.fits.branchbifprob.diameter.probit.parameter1 = b04(1);
    controlanalysis.fits.branchbifprob.diameter.probit.parameter2 = b04(2);
    controlanalysis.fits.branchbifprob.diameter.probit.deviance = dev04;
    
% Path Length

    pathlength = [controlanalysis.pathlength.pathlength]';
    pathlengthterms = [controlanalysis.pathlength.numberterminatingbranches.total]';
    pathlengthbifs = [controlanalysis.pathlength.numberbifurcatingbranches.total]';
    pathlengthtotal = ([controlanalysis.pathlength.numberbifurcatingbranches.total] + [controlanalysis.pathlength.numberterminatingbranches.total])';

    [b05,dev05] = glmfit(pathlength,[pathlengthterms pathlengthtotal],'binomial','link','logit');
    controlanalysis.fits.branchtermprob.pathlength.logit.parameter1 = b05(1);
    controlanalysis.fits.branchtermprob.pathlength.logit.parameter2 = b05(2);
    controlanalysis.fits.branchtermprob.pathlength.logit.deviance = dev05;
  
    [b06,dev06] = glmfit(pathlength,[pathlengthbifs pathlengthtotal],'binomial','link','logit');
    controlanalysis.fits.branchbifprob.pathlength.logit.parameter1 = b06(1);
    controlanalysis.fits.branchbifprob.pathlength.logit.parameter2 = b06(2);
    controlanalysis.fits.branchbifprob.pathlength.logit.deviance = dev06;
    
    [b07,dev07] = glmfit(pathlength,[pathlengthterms pathlengthtotal],'binomial','link','probit');
    controlanalysis.fits.branchtermprob.pathlength.probit.parameter1 = b07(1);
    controlanalysis.fits.branchtermprob.pathlength.probit.parameter2 = b07(2);
    controlanalysis.fits.branchtermprob.pathlength.probit.deviance = dev07;

    [b08,dev08] = glmfit(pathlength,[pathlengthbifs pathlengthtotal],'binomial','link','probit');
    controlanalysis.fits.branchbifprob.pathlength.probit.parameter1 = b08(1);
    controlanalysis.fits.branchbifprob.pathlength.probit.parameter2 = b08(2);
    controlanalysis.fits.branchbifprob.pathlength.probit.deviance = dev08;
    
% Radial Distance

    radialdistance = [controlanalysis.radialdistance.radialdistance]';
    radialdistanceterms = [controlanalysis.radialdistance.numberterminatingbranches.total]';
    radialdistancebifs = [controlanalysis.radialdistance.numberbifurcatingbranches.total]';
    radialdistancetotal = ([controlanalysis.radialdistance.numberbifurcatingbranches.total] + [controlanalysis.radialdistance.numberterminatingbranches.total])';

    [b09,dev09] = glmfit(radialdistance,[radialdistanceterms radialdistancetotal],'binomial','link','logit');
    controlanalysis.fits.branchtermprob.radialdistance.logit.parameter1 = b09(1);
    controlanalysis.fits.branchtermprob.radialdistance.logit.parameter2 = b09(2);
    controlanalysis.fits.branchtermprob.radialdistance.logit.deviance = dev09;
  
    [b10,dev10] = glmfit(radialdistance,[radialdistancebifs radialdistancetotal],'binomial','link','logit');
    controlanalysis.fits.branchbifprob.radialdistance.logit.parameter1 = b10(1);
    controlanalysis.fits.branchbifprob.radialdistance.logit.parameter2 = b10(2);
    controlanalysis.fits.branchbifprob.radialdistance.logit.deviance = dev10;
    
    [b11,dev11] = glmfit(radialdistance,[radialdistanceterms radialdistancetotal],'binomial','link','probit');
    controlanalysis.fits.branchtermprob.radialdistance.probit.parameter1 = b11(1);
    controlanalysis.fits.branchtermprob.radialdistance.probit.parameter2 = b11(2);
    controlanalysis.fits.branchtermprob.radialdistance.probit.deviance = dev11;

    [b12,dev12] = glmfit(radialdistance,[radialdistancebifs radialdistancetotal],'binomial','link','probit');
    controlanalysis.fits.branchbifprob.radialdistance.probit.parameter1 = b12(1);
    controlanalysis.fits.branchbifprob.radialdistance.probit.parameter2 = b12(2);
    controlanalysis.fits.branchbifprob.radialdistance.probit.deviance = dev12;
    
% Double Bin

    doublebin = [[controlanalysis.doublebin.array.diameter] [controlanalysis.doublebin.array.pathlength]];
    doublebinterms = [controlanalysis.doublebin.array.numberterminations];
    doublebinbifs = [controlanalysis.doublebin.array.numberbifurcations];
    doublebintotal = ([controlanalysis.doublebin.array.numberbifurcations] + [controlanalysis.doublebin.array.numberterminations]);

    [b13,dev13] = glmfit(doublebin,[doublebinterms doublebintotal],'binomial','link','logit');
    controlanalysis.fits.branchtermprob.doublebin.logit.parameter1 = b13(1);
    controlanalysis.fits.branchtermprob.doublebin.logit.parameter2 = b13(2);
    controlanalysis.fits.branchtermprob.doublebin.logit.parameter3 = b13(3);
    controlanalysis.fits.branchtermprob.doublebin.logit.deviance = dev13;

    [b14,dev14] = glmfit(doublebin,[doublebinbifs doublebintotal],'binomial','link','logit');
    controlanalysis.fits.branchbifprob.doublebin.logit.parameter1 = b14(1);
    controlanalysis.fits.branchbifprob.doublebin.logit.parameter2 = b14(2);
    controlanalysis.fits.branchbifprob.doublebin.logit.parameter3 = b14(3);
    controlanalysis.fits.branchbifprob.doublebin.logit.deviance = dev14;
    
    [b15,dev15] = glmfit(doublebin,[doublebinterms doublebintotal],'binomial','link','probit');
    controlanalysis.fits.branchtermprob.doublebin.probit.parameter1 = b15(1);
    controlanalysis.fits.branchtermprob.doublebin.probit.parameter2 = b15(2);
    controlanalysis.fits.branchtermprob.doublebin.probit.parameter3 = b15(3);
    controlanalysis.fits.branchtermprob.doublebin.probit.deviance = dev15;
    
    [b16,dev16] = glmfit(doublebin,[doublebinbifs doublebintotal],'binomial','link','probit');
    controlanalysis.fits.branchbifprob.doublebin.probit.parameter1 = b16(1);
    controlanalysis.fits.branchbifprob.doublebin.probit.parameter2 = b16(2);
    controlanalysis.fits.branchbifprob.doublebin.probit.parameter3 = b16(3);
    controlanalysis.fits.branchbifprob.doublebin.probit.deviance = dev16;
    
   
    