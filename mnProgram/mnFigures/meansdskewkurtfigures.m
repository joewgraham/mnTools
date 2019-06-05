function meansdskewkurtfigures(controlanalysis,testanalysis)

windowsize = 250;

titlefontsize = 14;
labelfontsize = 7;
axesfontsize  = 5;
insetfontsize = 5;

bifbranchlength  = [controlanalysis.bifurcatingcable.length.values]; 
biftaperrate     = [controlanalysis.bifurcatingcable.taperrate.values];
rallratio            = [controlanalysis.bifurcatingcable.rallratio.values]; 
rallratio1           = [controlanalysis.bifurcatingcable.rallratio1.values]; 
rallratio2           = [controlanalysis.bifurcatingcable.rallratio2.values]; 
parentdaughterratio  = [controlanalysis.bifurcatingcable.parentdaughterratio.values]; 
parentdaughter2ratio = [controlanalysis.bifurcatingcable.parentdaughter2ratio.values]; 
daughterratio        = [controlanalysis.bifurcatingcable.daughterratio.values]; 
termbranchlength = [controlanalysis.terminatingcable.length.values]; 
termtaperrate    = [controlanalysis.terminatingcable.taperrate.values];


bifproximaldiameter       = [controlanalysis.bifurcatingcable.proximaldiameter.values];
[sorted_bifproximaldiameter,index_bifproximaldiameter] = sort(bifproximaldiameter);
bifbranchlength_bifproximaldiameter = bifbranchlength(index_bifproximaldiameter);
    bifbranchlength_bifproximaldiameter_mean = slidefun('mean',windowsize,bifbranchlength_bifproximaldiameter);
    bifbranchlength_bifproximaldiameter_sd   = slidefun('std',windowsize,bifbranchlength_bifproximaldiameter);
    bifbranchlength_bifproximaldiameter_skew = slidefun('skewness',windowsize,bifbranchlength_bifproximaldiameter);
    bifbranchlength_bifproximaldiameter_kurt = slidefun('kurtosis',windowsize,bifbranchlength_bifproximaldiameter);
biftaperrate_bifproximaldiameter = biftaperrate(index_bifproximaldiameter);
rallratio_bifproximaldiameter = rallratio(index_bifproximaldiameter);
rallratio1_bifproximaldiameter = rallratio1(index_bifproximaldiameter);
rallratio2_bifproximaldiameter = rallratio2(index_bifproximaldiameter);
parentdaughterratio_bifproximaldiameter = parentdaughterratio(index_bifproximaldiameter);
parentdaughter2ratio_bifproximaldiameter = parentdaughter2ratio(index_bifproximaldiameter);
daughterratio_bifproximaldiameter = daughterratio(index_bifproximaldiameter);

bifproximalpathlength     = [controlanalysis.bifurcatingcable.proximalpathlength.values];
[sorted_bifproximalpathlength,index_bifproximalpathlength] = sort(bifproximalpathlength);
bifbranchlength_bifproximalpathlength = bifbranchlength(index_bifproximalpathlength);
biftaperrate_bifproximalpathlength = biftaperrate(index_bifproximalpathlength);
rallratio_bifproximalpathlength = rallratio(index_bifproximalpathlength);
rallratio1_bifproximalpathlength = rallratio1(index_bifproximalpathlength);
rallratio2_bifproximalpathlength = rallratio2(index_bifproximalpathlength);
parentdaughterratio_bifproximalpathlength = parentdaughterratio(index_bifproximalpathlength);
parentdaughter2ratio_bifproximalpathlength = parentdaughter2ratio(index_bifproximalpathlength);
daughterratio_bifproximalpathlength = daughterratio(index_bifproximalpathlength);

bifproximalradialdistance = [controlanalysis.bifurcatingcable.proximalradialdistance.values];
[sorted_bifproximalradialdistance,index_bifproximalradialdistance] = sort(bifproximalradialdistance);
bifbranchlength_bifproximalradialdistance = bifbranchlength(index_bifproximalradialdistance);
biftaperrate_bifproximalradialdistance = biftaperrate(index_bifproximalradialdistance);
rallratio_bifproximalradialdistance = rallratio(index_bifproximalradialdistance);
rallratio1_bifproximalradialdistance = rallratio1(index_bifproximalradialdistance);
rallratio2_bifproximalradialdistance = rallratio2(index_bifproximalradialdistance);
parentdaughterratio_bifproximalradialdistance = parentdaughterratio(index_bifproximalradialdistance);
parentdaughter2ratio_bifproximalradialdistance = parentdaughter2ratio(index_bifproximalradialdistance);
daughterratio_bifproximalradialdistance = daughterratio(index_bifproximalradialdistance);

bifdistaldiameter         = [controlanalysis.bifurcatingcable.distaldiameter.values];
[sorted_bifdistaldiameter,index_bifdistaldiameter] = sort(bifdistaldiameter);
bifbranchlength_bifdistaldiameter = bifbranchlength(index_bifdistaldiameter);
biftaperrate_bifdistaldiameter = biftaperrate(index_bifdistaldiameter);
rallratio_bifdistaldiameter = rallratio(index_bifdistaldiameter);
rallratio1_bifdistaldiameter = rallratio1(index_bifdistaldiameter);
rallratio2_bifdistaldiameter = rallratio2(index_bifdistaldiameter);
parentdaughterratio_bifdistaldiameter = parentdaughterratio(index_bifdistaldiameter);
parentdaughter2ratio_bifdistaldiameter = parentdaughter2ratio(index_bifdistaldiameter);
daughterratio_bifdistaldiameter = daughterratio(index_bifdistaldiameter);

bifdistalpathlength       = [controlanalysis.bifurcatingcable.distalpathlength.values];
[sorted_bifdistalpathlength,index_bifdistalpathlength] = sort(bifdistalpathlength);
bifbranchlength_bifdistalpathlength = bifbranchlength(index_bifdistalpathlength);
biftaperrate_bifdistalpathlength = biftaperrate(index_bifdistalpathlength);
rallratio_bifdistalpathlength = rallratio(index_bifdistalpathlength);
rallratio1_bifdistalpathlength = rallratio1(index_bifdistalpathlength);
rallratio2_bifdistalpathlength = rallratio2(index_bifdistalpathlength);
parentdaughterratio_bifdistalpathlength = parentdaughterratio(index_bifdistalpathlength);
parentdaughter2ratio_bifdistalpathlength = parentdaughter2ratio(index_bifdistalpathlength);
daughterratio_bifdistalpathlength = daughterratio(index_bifdistalpathlength);

bifdistalradialdistance   = [controlanalysis.bifurcatingcable.distalradialdistance.values];
[sorted_bifdistalradialdistance,index_bifdistalradialdistance] = sort(bifdistalradialdistance);
bifbranchlength_bifdistalradialdistance = bifbranchlength(index_bifdistalradialdistance);
biftaperrate_bifdistalradialdistance = biftaperrate(index_bifdistalradialdistance);
rallratio_bifdistalradialdistance = rallratio(index_bifdistalradialdistance);
rallratio1_bifdistalradialdistance = rallratio1(index_bifdistalradialdistance);
rallratio2_bifdistalradialdistance = rallratio2(index_bifdistalradialdistance);
parentdaughterratio_bifdistalradialdistance = parentdaughterratio(index_bifdistalradialdistance);
parentdaughter2ratio_bifdistalradialdistance = parentdaughter2ratio(index_bifdistalradialdistance);
daughterratio_bifdistalradialdistance = daughterratio(index_bifdistalradialdistance);


termproximaldiameter       = [controlanalysis.terminatingcable.proximaldiameter.values];
[sorted_termproximaldiameter,index_termproximaldiameter] = sort(termproximaldiameter);
termbranchlength_termproximaldiameter = termbranchlength(index_termproximaldiameter);
termtaperrate_termproximaldiameter = termtaperrate(index_termproximaldiameter);

termproximalpathlength     = [controlanalysis.terminatingcable.proximalpathlength.values];
[sorted_termproximalpathlength,index_termproximalpathlength] = sort(termproximalpathlength);
termbranchlength_termproximalpathlength = termbranchlength(index_termproximalpathlength);
termtaperrate_termproximalpathlength = termtaperrate(index_termproximalpathlength);

termproximalradialdistance = [controlanalysis.terminatingcable.proximalradialdistance.values];
[sorted_termproximalradialdistance,index_termproximalradialdistance] = sort(termproximalradialdistance);
termbranchlength_termproximalradialdistance = termbranchlength(index_termproximalradialdistance);
termtaperrate_termproximalradialdistance = termtaperrate(index_termproximalradialdistance);

termdistaldiameter         = [controlanalysis.terminatingcable.distaldiameter.values];
[sorted_termdistaldiameter,index_termdistaldiameter] = sort(termdistaldiameter);
termbranchlength_termdistaldiameter = termbranchlength(index_termdistaldiameter);
termtaperrate_termdistaldiameter = termtaperrate(index_termdistaldiameter);

termdistalpathlength       = [controlanalysis.terminatingcable.distalpathlength.values];
[sorted_termdistalpathlength,index_termdistalpathlength] = sort(termdistalpathlength);
termbranchlength_termdistalpathlength = termbranchlength(index_termdistalpathlength);
termtaperrate_termdistalpathlength = termtaperrate(index_termdistalpathlength);

termdistalradialdistance   = [controlanalysis.terminatingcable.distalradialdistance.values];
[sorted_termdistalradialdistance,index_termdistalradialdistance] = sort(termdistalradialdistance);
termbranchlength_termdistalradialdistance = termbranchlength(index_termdistalradialdistance);
termtaperrate_termdistalradialdistance = termtaperrate(index_termdistalradialdistance);


controldatax1 = sorted_bifproximaldiameter;
controldatay1 = bifbranchlength_bifproximaldiameter;
controldatax2 = sorted_bifproximaldiameter;
controldatay2 = bifbranchlength_bifproximaldiameter_mean;
controldatax3 = sorted_bifproximaldiameter;
controldatay3 = bifbranchlength_bifproximaldiameter_sd;
controldatax4 = sorted_bifproximaldiameter;
controldatay4 = bifbranchlength_bifproximaldiameter_skew;
controldatax5 = sorted_bifproximaldiameter;
controldatay5 = bifbranchlength_bifproximaldiameter_kurt;





xlabeltext  = 'Proximal Diameter (\mum)';
ylabel1text = 'Bif Branch Length (\mum)';
ylabel2text = 'Mean';
ylabel3text = 'SD';
ylabel4text = 'Skewness';
ylabel5text = 'Kurtosis';




figure;
subplot(5,1,1);

    scatter(controldatax1,controldatay1);
    hold on;           
    ylabel(ylabel1text,'FontSize',labelfontsize,'FontWeight','b');
    set(gca,'xticklabel', []);
    legendhandle1 = gca;
    xlimits = xlim;
    ylimits1 = ylim;
    set(gca,'FontSize',axesfontsize);hold off;
    
subplot(5,1,2);

    plot(controldatax2,controldatay2);
    hold on;           
    ylabel(ylabel2text,'FontSize',labelfontsize,'FontWeight','b');
    set(gca,'xticklabel', []);
    legendhandle2 = gca;
    xlim(xlimits);
    ylimits2 = ylim;
    set(gca,'FontSize',axesfontsize);hold off;
    
subplot(5,1,3);

    plot(controldatax3,controldatay3);
    hold on;           
    ylabel(ylabel3text,'FontSize',labelfontsize,'FontWeight','b');
    set(gca,'xticklabel', []);
    legendhandle3 = gca;
    xlim(xlimits);
    ylimits3 = ylim;
    set(gca,'FontSize',axesfontsize);hold off;
    
subplot(5,1,4);

    plot(controldatax4,controldatay4);
    hold on;           
    ylabel(ylabel4text,'FontSize',labelfontsize,'FontWeight','b');
    set(gca,'xticklabel', []);
    legendhandle4 = gca;
    xlim(xlimits);
    ylimits4 = ylim;
    set(gca,'FontSize',axesfontsize);hold off;
    
subplot(5,1,5);

    plot(controldatax5,controldatay5);
    hold on;           
    ylabel(ylabel5text,'FontSize',labelfontsize,'FontWeight','b');
    xlabel(xlabeltext,'FontSize',labelfontsize,'FontWeight','b');
    legendhandle5 = gca;
    xlim(xlimits);
    ylimits5 = ylim;
    set(gca,'FontSize',axesfontsize);hold off;





    
    










