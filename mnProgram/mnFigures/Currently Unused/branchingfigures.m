function branchingfigures(controlanalysis,testanalysis)
% Branching Figures

labelfontsize = 12;
insetfontsize = 10;

figure;

if nargin == 1

    subplot(3,4,1); box on; hold on;
    ylabel('Rall Ratio','FontSize',labelfontsize,'FontWeight','b');
    %xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    h=gca; set(gca,'XDir','reverse');
    
    controldatax   = [controlanalysis.diameter.diameter];
    controldatay   = [controlanalysis.diameter.rallratio.mean];
    controldatastd = [controlanalysis.diameter.rallratio.std];
    
    errorbar(controldatax,controldatay,controldatastd/2,'-ob','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);
    
%     testdatax   = [testanalysis.diameter.diameter];
%     testdatay   = [testanalysis.diameter.rallratio.mean];
%     testdatastd = [testanalysis.diameter.rallratio.std];
%     
%     errorbar(testdatax,testdatay,testdatastd/2,'-^r','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',6);
    
    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);

    xlimits=xlim;
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);
    
    
    
    subplot(3,4,5); box on; hold on;
    ylabel('Parent/Daughter Ratio','FontSize',labelfontsize,'FontWeight','b');
    %xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    h=gca; set(gca,'XDir','reverse');
    
    controldatax   = [controlanalysis.diameter.diameter];
    controldatay   = [controlanalysis.diameter.parentdaughterratio.mean];
    controldatastd = [controlanalysis.diameter.parentdaughterratio.std];
    
    errorbar(controldatax,controldatay,controldatastd/2,'-ob','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);
    
%     testdatax   = [testanalysis.diameter.diameter];
%     testdatay   = [testanalysis.diameter.parentdaughterratio.mean];
%     testdatastd = [testanalysis.diameter.parentdaughterratio.std];
%     
%     errorbar(testdatax,testdatay,testdatastd/2,'-^r','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',6);
    
    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);

    xlimits=xlim;
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);
    
    
    
    subplot(3,4,9); box on; hold on;
    ylabel('Daughter Ratio','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    h=gca; set(gca,'XDir','reverse');
    
    controldatax   = [controlanalysis.diameter.diameter];
    controldatay   = [controlanalysis.diameter.daughterratio.mean];
    controldatastd = [controlanalysis.diameter.daughterratio.std];
    
    errorbar(controldatax,controldatay,controldatastd/2,'-ob','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);
    
%     testdatax   = [testanalysis.diameter.diameter];
%     testdatay   = [testanalysis.diameter.daughterratio.mean];
%     testdatastd = [testanalysis.diameter.daughterratio.std];
%     
%     errorbar(testdatax,testdatay,testdatastd/2,'-^r','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',6);
    
    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);

%     xlimits=xlim;
%     xtick = get(gca,'xtick');
%     set(gca,'xticklabel', []);



    subplot(3,4,2); box on; hold on;
    %ylabel('Rall Ratio','FontSize',labelfontsize,'FontWeight','b');
    %xlabel('Branch Order','FontSize',labelfontsize,'FontWeight','b');
    
    controldatax   = [controlanalysis.branchorder.branchorder];
    controldatay   = [controlanalysis.branchorder.rallratio.mean];
    controldatastd = [controlanalysis.branchorder.rallratio.std];
    
    errorbar(controldatax,controldatay,controldatastd/2,'-ob','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);
    
%     testdatax   = [testanalysis.branchorder.branchorder];
%     testdatay   = [testanalysis.branchorder.meanrallratio.mean];
%     testdatastd = [testanalysis.branchorder.meanrallratio.std];
%     
%     errorbar(testdatax,testdatay,testdatastd/2,'-^r','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',6);
    
    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);

    xlimits=xlim;
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);
    
    
    
    subplot(3,4,6); box on; hold on;
    %ylabel('Parent/Daughter Ratio','FontSize',labelfontsize,'FontWeight','b');
    %xlabel('Branch Order','FontSize',labelfontsize,'FontWeight','b');
    
    controldatax   = [controlanalysis.branchorder.branchorder];
    controldatay   = [controlanalysis.branchorder.parentdaughterratio.mean];
    controldatastd = [controlanalysis.branchorder.parentdaughterratio.std];
    
    errorbar(controldatax,controldatay,controldatastd/2,'-ob','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);
    
%     testdatax   = [testanalysis.branchorder.branchorder];
%     testdatay   = [testanalysis.branchorder.meanparentdaughterratio.mean];
%     testdatastd = [testanalysis.branchorder.meanparentdaughterratio.std];
%     
%     errorbar(testdatax,testdatay,testdatastd/2,'-^r','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',6);
    
    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);

    xlimits=xlim;
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);
    
    
    
    subplot(3,4,10); box on; hold on;
    %ylabel('Daughter Ratio','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Branch Order','FontSize',labelfontsize,'FontWeight','b');
    
    controldatax   = [controlanalysis.branchorder.branchorder];
    controldatay   = [controlanalysis.branchorder.daughterratio.mean];
    controldatastd = [controlanalysis.branchorder.daughterratio.std];
    
    errorbar(controldatax,controldatay,controldatastd/2,'-ob','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);
    
%     testdatax   = [testanalysis.branchorder.branchorder];
%     testdatay   = [testanalysis.branchorder.meandaughterratio.mean];
%     testdatastd = [testanalysis.branchorder.meandaughterratio.std];
%     
%     errorbar(testdatax,testdatay,testdatastd/2,'-^r','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',6);
    
    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);

%     xlimits=xlim;
%     xtick = get(gca,'xtick');
%     set(gca,'xticklabel', []);
    
    


    subplot(3,4,3); box on; hold on;
    %ylabel('Rall Ratio','FontSize',labelfontsize,'FontWeight','b');
    %xlabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    
    controldatax   = [controlanalysis.pathlength.pathlength];
    controldatay   = [controlanalysis.pathlength.rallratio.mean];
    controldatastd = [controlanalysis.pathlength.rallratio.std];
    
    errorbar(controldatax,controldatay,controldatastd/2,'-ob','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);
    
%     testdatax   = [testanalysis.pathlength.pathlength];
%     testdatay   = [testanalysis.pathlength.rallratio.mean];
%     testdatastd = [testanalysis.pathlength.rallratio.std];
%     
%     errorbar(testdatax,testdatay,testdatastd/2,'-^r','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',6);
    
    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);

    xlimits=xlim;
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);
    
    
    
    subplot(3,4,7); box on; hold on;
    %ylabel('Parent/Daughter Ratio','FontSize',labelfontsize,'FontWeight','b');
    %xlabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    
    controldatax   = [controlanalysis.pathlength.pathlength];
    controldatay   = [controlanalysis.pathlength.parentdaughterratio.mean];
    controldatastd = [controlanalysis.pathlength.parentdaughterratio.std];
    
    errorbar(controldatax,controldatay,controldatastd/2,'-ob','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);
    
%     testdatax   = [testanalysis.pathlength.pathlength];
%     testdatay   = [testanalysis.pathlength.parentdaughterratio.mean];
%     testdatastd = [testanalysis.pathlength.parentdaughterratio.std];
%     
%     errorbar(testdatax,testdatay,testdatastd/2,'-^r','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',6);
    
    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);

    xlimits=xlim;
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);
    
    
    
    subplot(3,4,11); box on; hold on;
    %ylabel('Daughter Ratio','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    
    controldatax   = [controlanalysis.pathlength.pathlength];
    controldatay   = [controlanalysis.pathlength.daughterratio.mean];
    controldatastd = [controlanalysis.pathlength.daughterratio.std];
    
    errorbar(controldatax,controldatay,controldatastd/2,'-ob','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);
    
%     testdatax   = [testanalysis.pathlength.pathlength];
%     testdatay   = [testanalysis.pathlength.daughterratio.mean];
%     testdatastd = [testanalysis.pathlength.daughterratio.std];
%     
%     errorbar(testdatax,testdatay,testdatastd/2,'-^r','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',6);
    
    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);

%     xlimits=xlim;
%     xtick = get(gca,'xtick');
%     set(gca,'xticklabel', []);
    
    
    
    subplot(3,4,4); box on; hold on;
    %ylabel('Rall Ratio','FontSize',labelfontsize,'FontWeight','b');
    %xlabel('Radial Distance (\mum)','FontSize',labelfontsize,'FontWeight','b');
    
    controldatax   = [controlanalysis.radialdistance.radialdistance];
    controldatay   = [controlanalysis.radialdistance.rallratio.mean];
    controldatastd = [controlanalysis.radialdistance.rallratio.std];
    
    errorbar(controldatax,controldatay,controldatastd/2,'-ob','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);
    
%     testdatax   = [testanalysis.radialdistance.radialdistance];
%     testdatay   = [testanalysis.radialdistance.rallratio.mean];
%     testdatastd = [testanalysis.radialdistance.rallratio.std];
%     
%     errorbar(testdatax,testdatay,testdatastd/2,'-^r','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',6);
    
    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);

    xlimits=xlim;
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);
    
    
    
    subplot(3,4,8); box on; hold on;
    %ylabel('Parent/Daughter Ratio','FontSize',labelfontsize,'FontWeight','b');
    %xlabel('Radial Distance (\mum)','FontSize',labelfontsize,'FontWeight','b');
    
    controldatax   = [controlanalysis.radialdistance.radialdistance];
    controldatay   = [controlanalysis.radialdistance.parentdaughterratio.mean];
    controldatastd = [controlanalysis.radialdistance.parentdaughterratio.std];
    
    errorbar(controldatax,controldatay,controldatastd/2,'-ob','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);
    
%     testdatax   = [testanalysis.radialdistance.radialdistance];
%     testdatay   = [testanalysis.radialdistance.parentdaughterratio.mean];
%     testdatastd = [testanalysis.radialdistance.parentdaughterratio.std];
%     
%     errorbar(testdatax,testdatay,testdatastd/2,'-^r','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',6);
    
    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);

    xlimits=xlim;
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);
    
    
    
    subplot(3,4,12); box on; hold on;
    %ylabel('Daughter Ratio','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Radial Distance (\mum)','FontSize',labelfontsize,'FontWeight','b');
    
    controldatax   = [controlanalysis.radialdistance.radialdistance];
    controldatay   = [controlanalysis.radialdistance.daughterratio.mean];
    controldatastd = [controlanalysis.radialdistance.daughterratio.std];
    
    errorbar(controldatax,controldatay,controldatastd/2,'-ob','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);
    
%     testdatax   = [testanalysis.radialdistance.radialdistance];
%     testdatay   = [testanalysis.radialdistance.daughterratio.mean];
%     testdatastd = [testanalysis.radialdistance.daughterratio.std];
%     
%     errorbar(testdatax,testdatay,testdatastd/2,'-^r','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',6);
    
    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);

%     xlimits=xlim;
%     xtick = get(gca,'xtick');
%     set(gca,'xticklabel', []);
    
    

    %subplotspace('horizontal',-20);
    subplotspace('vertical',-20);

    %[ax,h1]=suplabel('');
    [ax,h3]=suplabel('Branching Parameters'  ,'t');
    %set(h1,'FontSize',15);
    set(h3,'FontSize',20);


    currentdirectory = cd;
    cd(controlanalysis.datapathname);

    if exist('figures','dir')==7
        cd('figures');
    else
        mkdir('figures');
        cd('figures');
    end

    fillscreen;

    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Branching_Figure');
    print('-dmeta',filename);
    saveas(gcf,filename,'fig');

end


if nargin == 2
    
    subplot(3,4,1); box on; hold on;
    ylabel('Rall Ratio','FontSize',labelfontsize,'FontWeight','b');
    %xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    
    controldatax   = [controlanalysis.diameter.diameter];
    controldatay   = [controlanalysis.diameter.rallratio.mean];
    controldatastd = [controlanalysis.diameter.rallratio.std];
    
    errorbar(controldatax,controldatay,controldatastd/2,'-ob','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);
    
    testdatax   = [testanalysis.diameter.diameter];
    testdatay   = [testanalysis.diameter.rallratio.mean];
    testdatastd = [testanalysis.diameter.rallratio.std];
    
    errorbar(testdatax,testdatay,testdatastd/2,'-^r','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',6);
    
    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);

    xlimits=xlim;
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);
    
    
    
    subplot(3,4,5); box on; hold on;
    ylabel('Parent/Daughter Ratio','FontSize',labelfontsize,'FontWeight','b');
    %xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    
    controldatax   = [controlanalysis.diameter.diameter];
    controldatay   = [controlanalysis.diameter.parentdaughterratio.mean];
    controldatastd = [controlanalysis.diameter.parentdaughterratio.std];
    
    errorbar(controldatax,controldatay,controldatastd/2,'-ob','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);
    
    testdatax   = [testanalysis.diameter.diameter];
    testdatay   = [testanalysis.diameter.parentdaughterratio.mean];
    testdatastd = [testanalysis.diameter.parentdaughterratio.std];
    
    errorbar(testdatax,testdatay,testdatastd/2,'-^r','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',6);
    
    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);

    xlimits=xlim;
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);
    
    
    
    subplot(3,4,9); box on; hold on;
    ylabel('Daughter Ratio','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    
    controldatax   = [controlanalysis.diameter.diameter];
    controldatay   = [controlanalysis.diameter.daughterratio.mean];
    controldatastd = [controlanalysis.diameter.daughterratio.std];
    
    errorbar(controldatax,controldatay,controldatastd/2,'-ob','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);
    
    testdatax   = [testanalysis.diameter.diameter];
    testdatay   = [testanalysis.diameter.daughterratio.mean];
    testdatastd = [testanalysis.diameter.daughterratio.std];
    
    errorbar(testdatax,testdatay,testdatastd/2,'-^r','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',6);
    
    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);

%     xlimits=xlim;
%     xtick = get(gca,'xtick');
%     set(gca,'xticklabel', []);



    subplot(3,4,2); box on; hold on;
    %ylabel('Rall Ratio','FontSize',labelfontsize,'FontWeight','b');
    %xlabel('Branch Order','FontSize',labelfontsize,'FontWeight','b');
    
    controldatax   = [controlanalysis.branchorder.branchorder];
    controldatay   = [controlanalysis.branchorder.meanrallratio.mean];
    controldatastd = [controlanalysis.branchorder.meanrallratio.std];
    
    errorbar(controldatax,controldatay,controldatastd/2,'-ob','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);
    
    testdatax   = [testanalysis.branchorder.branchorder];
    testdatay   = [testanalysis.branchorder.meanrallratio.mean];
    testdatastd = [testanalysis.branchorder.meanrallratio.std];
    
    errorbar(testdatax,testdatay,testdatastd/2,'-^r','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',6);
    
    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);

    xlimits=xlim;
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);
    
    
    
    subplot(3,4,6); box on; hold on;
    %ylabel('Parent/Daughter Ratio','FontSize',labelfontsize,'FontWeight','b');
    %xlabel('Branch Order','FontSize',labelfontsize,'FontWeight','b');
    
    controldatax   = [controlanalysis.branchorder.branchorder];
    controldatay   = [controlanalysis.branchorder.meanparentdaughterratio.mean];
    controldatastd = [controlanalysis.branchorder.meanparentdaughterratio.std];
    
    errorbar(controldatax,controldatay,controldatastd/2,'-ob','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);
    
    testdatax   = [testanalysis.branchorder.branchorder];
    testdatay   = [testanalysis.branchorder.meanparentdaughterratio.mean];
    testdatastd = [testanalysis.branchorder.meanparentdaughterratio.std];
    
    errorbar(testdatax,testdatay,testdatastd/2,'-^r','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',6);
    
    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);

    xlimits=xlim;
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);
    
    
    
    subplot(3,4,10); box on; hold on;
    %ylabel('Daughter Ratio','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Branch Order','FontSize',labelfontsize,'FontWeight','b');
    
    controldatax   = [controlanalysis.branchorder.branchorder];
    controldatay   = [controlanalysis.branchorder.meandaughterratio.mean];
    controldatastd = [controlanalysis.branchorder.meandaughterratio.std];
    
    errorbar(controldatax,controldatay,controldatastd/2,'-ob','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);
    
    testdatax   = [testanalysis.branchorder.branchorder];
    testdatay   = [testanalysis.branchorder.meandaughterratio.mean];
    testdatastd = [testanalysis.branchorder.meandaughterratio.std];
    
    errorbar(testdatax,testdatay,testdatastd/2,'-^r','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',6);
    
    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);

%     xlimits=xlim;
%     xtick = get(gca,'xtick');
%     set(gca,'xticklabel', []);
    
    


    subplot(3,4,3); box on; hold on;
    %ylabel('Rall Ratio','FontSize',labelfontsize,'FontWeight','b');
    %xlabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    
    controldatax   = [controlanalysis.pathlength.pathlength];
    controldatay   = [controlanalysis.pathlength.rallratio.mean];
    controldatastd = [controlanalysis.pathlength.rallratio.std];
    
    errorbar(controldatax,controldatay,controldatastd/2,'-ob','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);
    
    testdatax   = [testanalysis.pathlength.pathlength];
    testdatay   = [testanalysis.pathlength.rallratio.mean];
    testdatastd = [testanalysis.pathlength.rallratio.std];
    
    errorbar(testdatax,testdatay,testdatastd/2,'-^r','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',6);
    
    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);

    xlimits=xlim;
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);
    
    
    
    subplot(3,4,7); box on; hold on;
    %ylabel('Parent/Daughter Ratio','FontSize',labelfontsize,'FontWeight','b');
    %xlabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    
    controldatax   = [controlanalysis.pathlength.pathlength];
    controldatay   = [controlanalysis.pathlength.parentdaughterratio.mean];
    controldatastd = [controlanalysis.pathlength.parentdaughterratio.std];
    
    errorbar(controldatax,controldatay,controldatastd/2,'-ob','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);
    
    testdatax   = [testanalysis.pathlength.pathlength];
    testdatay   = [testanalysis.pathlength.parentdaughterratio.mean];
    testdatastd = [testanalysis.pathlength.parentdaughterratio.std];
    
    errorbar(testdatax,testdatay,testdatastd/2,'-^r','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',6);
    
    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);

    xlimits=xlim;
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);
    
    
    
    subplot(3,4,11); box on; hold on;
    %ylabel('Daughter Ratio','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    
    controldatax   = [controlanalysis.pathlength.pathlength];
    controldatay   = [controlanalysis.pathlength.daughterratio.mean];
    controldatastd = [controlanalysis.pathlength.daughterratio.std];
    
    errorbar(controldatax,controldatay,controldatastd/2,'-ob','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);
    
    testdatax   = [testanalysis.pathlength.pathlength];
    testdatay   = [testanalysis.pathlength.daughterratio.mean];
    testdatastd = [testanalysis.pathlength.daughterratio.std];
    
    errorbar(testdatax,testdatay,testdatastd/2,'-^r','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',6);
    
    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);

%     xlimits=xlim;
%     xtick = get(gca,'xtick');
%     set(gca,'xticklabel', []);
    
    
    
    subplot(3,4,4); box on; hold on;
    %ylabel('Rall Ratio','FontSize',labelfontsize,'FontWeight','b');
    %xlabel('Radial Distance (\mum)','FontSize',labelfontsize,'FontWeight','b');
    
    controldatax   = [controlanalysis.radialdistance.radialdistance];
    controldatay   = [controlanalysis.radialdistance.rallratio.mean];
    controldatastd = [controlanalysis.radialdistance.rallratio.std];
    
    errorbar(controldatax,controldatay,controldatastd/2,'-ob','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);
    
    testdatax   = [testanalysis.radialdistance.radialdistance];
    testdatay   = [testanalysis.radialdistance.rallratio.mean];
    testdatastd = [testanalysis.radialdistance.rallratio.std];
    
    errorbar(testdatax,testdatay,testdatastd/2,'-^r','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',6);
    
    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);

    xlimits=xlim;
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);
    
    
    
    subplot(3,4,8); box on; hold on;
    %ylabel('Parent/Daughter Ratio','FontSize',labelfontsize,'FontWeight','b');
    %xlabel('Radial Distance (\mum)','FontSize',labelfontsize,'FontWeight','b');
    
    controldatax   = [controlanalysis.radialdistance.radialdistance];
    controldatay   = [controlanalysis.radialdistance.parentdaughterratio.mean];
    controldatastd = [controlanalysis.radialdistance.parentdaughterratio.std];
    
    errorbar(controldatax,controldatay,controldatastd/2,'-ob','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);
    
    testdatax   = [testanalysis.radialdistance.radialdistance];
    testdatay   = [testanalysis.radialdistance.parentdaughterratio.mean];
    testdatastd = [testanalysis.radialdistance.parentdaughterratio.std];
    
    errorbar(testdatax,testdatay,testdatastd/2,'-^r','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',6);
    
    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);

    xlimits=xlim;
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);
    
    
    
    subplot(3,4,12); box on; hold on;
    %ylabel('Daughter Ratio','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Radial Distance (\mum)','FontSize',labelfontsize,'FontWeight','b');
    
    controldatax   = [controlanalysis.radialdistance.radialdistance];
    controldatay   = [controlanalysis.radialdistance.daughterratio.mean];
    controldatastd = [controlanalysis.radialdistance.daughterratio.std];
    
    errorbar(controldatax,controldatay,controldatastd/2,'-ob','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',6);
    
    testdatax   = [testanalysis.radialdistance.radialdistance];
    testdatay   = [testanalysis.radialdistance.daughterratio.mean];
    testdatastd = [testanalysis.radialdistance.daughterratio.std];
    
    errorbar(testdatax,testdatay,testdatastd/2,'-^r','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',6);
    
    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);

%     xlimits=xlim;
%     xtick = get(gca,'xtick');
%     set(gca,'xticklabel', []);




    %subplotspace('horizontal',-20);
    subplotspace('vertical',-20);

    %[ax,h1]=suplabel('');
    [ax,h3]=suplabel('Branching Parameters'  ,'t');
    %set(h1,'FontSize',15);
    set(h3,'FontSize',20);


    currentdirectory = cd;
    cd(controlanalysis.datapathname);
    cd ..

    if exist(sprintf('%s_%s_comparison',controlanalysis.inputfilename,controlanalysis.datetime),'dir')==7;
        cd(sprintf('%s_%s_comparison',controlanalysis.inputfilename,controlanalysis.datetime));
    else
        mkdir(sprintf('%s_%s_comparison',controlanalysis.inputfilename,controlanalysis.datetime));
        cd(sprintf('%s_%s_comparison',controlanalysis.inputfilename,controlanalysis.datetime));
    end

    if exist('comparisonfigures','dir')==7
        cd('comparisonfigures');
    else
        mkdir('comparisonfigures');
        cd('comparisonfigures');
    end

    fillscreen;

    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'Branching_Comparison_Figure');
    print('-dmeta',filename);
    saveas(gcf,filename,'fig');
    
    
end

 
 
 
 
 
 
 
 
 
 
 
 
 
 