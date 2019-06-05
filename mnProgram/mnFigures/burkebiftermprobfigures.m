function burkebiftermprobfigures(controlanalysis,testanalysis)
% Branching/Terminating Probability Figures

titlefontsize = 14;
labelfontsize = 7;
axesfontsize  = 5;
insetfontsize = 5;


indgreenmarkersize = 3;
indredmarkersize   = 5;

yellowmarkersize  = 4;
magentamarkersize = 6;



if nargin == 1

    figure;
    
    subplot(3,4,1); box on;
    loglog([controlanalysis.diameter.diameter],[controlanalysis.diameter.numberbifurcations.total],'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
    hold on;
    loglog([controlanalysis.diameter.diameter],[controlanalysis.diameter.numberterminations.total],'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize)
    loglog([controlanalysis.diameter.diameter],[controlanalysis.diameter.length.total],'-b','LineWidth',1.5);   
    ylabel('# of Endings      Length','FontSize',labelfontsize,'FontWeight','b');
    set(gca,'FontSize',axesfontsize); hold off;
    
    subplot(3,4,2); box on; 
    loglog([controlanalysis.pathlength.pathlength],[controlanalysis.pathlength.numberbifurcations.total],'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize)
    hold on;
    loglog([controlanalysis.pathlength.pathlength],[controlanalysis.pathlength.numberterminations.total],'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
    loglog([controlanalysis.pathlength.pathlength],[controlanalysis.pathlength.length.total],'-b','LineWidth',1.5);    
    set(gca,'FontSize',axesfontsize); hold off;
    
    subplot(3,4,3); box on; 
    loglog([controlanalysis.branchlength.branchlength],[controlanalysis.branchlength.numberbifurcations.total],'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
    hold on;
    loglog([controlanalysis.branchlength.branchlength],[controlanalysis.branchlength.numberterminations.total],'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
    loglog([controlanalysis.branchlength.branchlength],[controlanalysis.branchlength.length.total],'-b','LineWidth',1.5);    
    set(gca,'FontSize',axesfontsize); hold off;

	subplot(3,4,4); box on; 
    loglog([controlanalysis.branchorder.branchorder],[controlanalysis.branchorder.numberbifurcations.total],'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
    hold on;
    loglog([controlanalysis.branchorder.branchorder],[controlanalysis.branchorder.numberterminations.total],'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
    loglog([controlanalysis.branchorder.branchorder],[controlanalysis.branchorder.length.total],'-b','LineWidth',1.5);    
    set(gca,'FontSize',axesfontsize); hold off;
		
    subplot(3,4,5); box on;
    semilogy([controlanalysis.diameter.diameter],[controlanalysis.diameter.bifurcationprobability.length],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
    hold on;
    semilogy([controlanalysis.diameter.diameter],[controlanalysis.diameter.terminationprobability.length],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
    ylabel('Probability (Semi-Log)','FontSize',labelfontsize,'FontWeight','b');
    set(gca,'FontSize',axesfontsize); hold off;
    
    subplot(3,4,6); box on; 
    semilogy([controlanalysis.pathlength.pathlength],[controlanalysis.pathlength.bifurcationprobability.length],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
    hold on;
    semilogy([controlanalysis.pathlength.pathlength],[controlanalysis.pathlength.terminationprobability.length],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);    
    set(gca,'FontSize',axesfontsize); hold off;
    
    subplot(3,4,7); box on; 
    semilogy([controlanalysis.branchlength.branchlength],[controlanalysis.branchlength.bifurcationprobability.length],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
    hold on;
    semilogy([controlanalysis.branchlength.branchlength],[controlanalysis.branchlength.terminationprobability.length],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);    
    set(gca,'FontSize',axesfontsize); hold off;
	
	subplot(3,4,8); box on; 
    semilogy([controlanalysis.branchorder.branchorder],[controlanalysis.branchorder.bifurcationprobability.length],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
    hold on;
    semilogy([controlanalysis.branchorder.branchorder],[controlanalysis.branchorder.terminationprobability.length],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);    
    set(gca,'FontSize',axesfontsize); hold off;
	
	subplot(3,4,9); box on;
    loglog([controlanalysis.diameter.diameter],[controlanalysis.diameter.bifurcationprobability.length],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
    hold on;
    loglog([controlanalysis.diameter.diameter],[controlanalysis.diameter.terminationprobability.length],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
    xlabel('Diameter','FontSize',labelfontsize,'FontWeight','b');
    ylabel('Probability (Log-Log)','FontSize',labelfontsize,'FontWeight','b'); 
    set(gca,'FontSize',axesfontsize); hold off;
    
    subplot(3,4,10); box on; 
    loglog([controlanalysis.pathlength.pathlength],[controlanalysis.pathlength.bifurcationprobability.length],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
    hold on;
    loglog([controlanalysis.pathlength.pathlength],[controlanalysis.pathlength.terminationprobability.length],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);    
    xlabel('Path Length','FontSize',labelfontsize,'FontWeight','b');
    set(gca,'FontSize',axesfontsize); hold off;
    
    subplot(3,4,11); box on; 
    loglog([controlanalysis.branchlength.branchlength],[controlanalysis.branchlength.bifurcationprobability.length],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
    hold on;
    loglog([controlanalysis.branchlength.branchlength],[controlanalysis.branchlength.terminationprobability.length],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);    
    xlabel('Branch Length','FontSize',labelfontsize,'FontWeight','b');
    set(gca,'FontSize',axesfontsize); hold off;
	
	subplot(3,4,12); box on; 
    loglog([controlanalysis.branchorder.branchorder],[controlanalysis.branchorder.bifurcationprobability.length],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
    hold on;
    loglog([controlanalysis.branchorder.branchorder],[controlanalysis.branchorder.terminationprobability.length],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);    
    xlabel('Branch Order','FontSize',labelfontsize,'FontWeight','b');
    set(gca,'FontSize',axesfontsize); hold off;
    
    

    subplotspace('horizontal',-5);
    subplotspace('vertical',-15);

    [ax,h3]=suplabel('Burke Bifurcation / Termination Probabilities by Length'  ,'t');
    set(h3,'FontSize',titlefontsize);


    currentdirectory = cd;
    cd(controlanalysis.datapathname);

    if exist('figures','dir')==7
        cd('figures');
    else
        mkdir('figures');
        cd('figures');
    end

    %fillscreen;

    filename = sprintf('%s_%s',controlanalysis.inputfilename,'402_Burke_Bif_Term_Prob_Length');
    print('-djpeg',filename);
    %saveas(gcf,filename,'fig');
    
    
    
    figure;
    
    subplot(3,4,1); box on;
    loglog([controlanalysis.diameter.diameter],[controlanalysis.diameter.numberbifurcations.total],'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
    hold on;
    loglog([controlanalysis.diameter.diameter],[controlanalysis.diameter.numberterminations.total],'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize)
    loglog([controlanalysis.diameter.diameter],[controlanalysis.diameter.surfacearea.total],'-b','LineWidth',1.5);   
    ylabel('# of Endings      Length','FontSize',labelfontsize,'FontWeight','b');
    set(gca,'FontSize',axesfontsize); hold off;
    
    subplot(3,4,2); box on; 
    loglog([controlanalysis.pathlength.pathlength],[controlanalysis.pathlength.numberbifurcations.total],'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize)
    hold on;
    loglog([controlanalysis.pathlength.pathlength],[controlanalysis.pathlength.numberterminations.total],'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
    loglog([controlanalysis.pathlength.pathlength],[controlanalysis.pathlength.surfacearea.total],'-b','LineWidth',1.5);    
    set(gca,'FontSize',axesfontsize); hold off;
    
    subplot(3,4,3); box on; 
    loglog([controlanalysis.branchlength.branchlength],[controlanalysis.branchlength.numberbifurcations.total],'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
    hold on;
    loglog([controlanalysis.branchlength.branchlength],[controlanalysis.branchlength.numberterminations.total],'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
    loglog([controlanalysis.branchlength.branchlength],[controlanalysis.branchlength.surfacearea.total],'-b','LineWidth',1.5);    
    set(gca,'FontSize',axesfontsize); hold off;

	subplot(3,4,4); box on; 
    loglog([controlanalysis.branchorder.branchorder],[controlanalysis.branchorder.numberbifurcations.total],'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
    hold on;
    loglog([controlanalysis.branchorder.branchorder],[controlanalysis.branchorder.numberterminations.total],'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
    loglog([controlanalysis.branchorder.branchorder],[controlanalysis.branchorder.surfacearea.total],'-b','LineWidth',1.5);    
    set(gca,'FontSize',axesfontsize); hold off;
		
    subplot(3,4,5); box on;
    semilogy([controlanalysis.diameter.diameter],[controlanalysis.diameter.bifurcationprobability.surfacearea],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
    hold on;
    semilogy([controlanalysis.diameter.diameter],[controlanalysis.diameter.terminationprobability.surfacearea],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
    ylabel('Probability (Semi-Log)','FontSize',labelfontsize,'FontWeight','b');
    set(gca,'FontSize',axesfontsize); hold off;
    
    subplot(3,4,6); box on; 
    semilogy([controlanalysis.pathlength.pathlength],[controlanalysis.pathlength.bifurcationprobability.surfacearea],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
    hold on;
    semilogy([controlanalysis.pathlength.pathlength],[controlanalysis.pathlength.terminationprobability.surfacearea],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);    
    set(gca,'FontSize',axesfontsize); hold off;
    
    subplot(3,4,7); box on; 
    semilogy([controlanalysis.branchlength.branchlength],[controlanalysis.branchlength.bifurcationprobability.surfacearea],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
    hold on;
    semilogy([controlanalysis.branchlength.branchlength],[controlanalysis.branchlength.terminationprobability.surfacearea],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);    
    set(gca,'FontSize',axesfontsize); hold off;
	
	subplot(3,4,8); box on; 
    semilogy([controlanalysis.branchorder.branchorder],[controlanalysis.branchorder.bifurcationprobability.surfacearea],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
    hold on;
    semilogy([controlanalysis.branchorder.branchorder],[controlanalysis.branchorder.terminationprobability.surfacearea],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);    
    set(gca,'FontSize',axesfontsize); hold off;
	
	subplot(3,4,9); box on;
    loglog([controlanalysis.diameter.diameter],[controlanalysis.diameter.bifurcationprobability.surfacearea],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
    hold on;
    loglog([controlanalysis.diameter.diameter],[controlanalysis.diameter.terminationprobability.surfacearea],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
    xlabel('Diameter','FontSize',labelfontsize,'FontWeight','b');
    ylabel('Probability (Log-Log)','FontSize',labelfontsize,'FontWeight','b'); 
    set(gca,'FontSize',axesfontsize); hold off;
    
    subplot(3,4,10); box on; 
    loglog([controlanalysis.pathlength.pathlength],[controlanalysis.pathlength.bifurcationprobability.surfacearea],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
    hold on;
    loglog([controlanalysis.pathlength.pathlength],[controlanalysis.pathlength.terminationprobability.surfacearea],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);    
    xlabel('Path Length','FontSize',labelfontsize,'FontWeight','b');
    set(gca,'FontSize',axesfontsize); hold off;
    
    subplot(3,4,11); box on; 
    loglog([controlanalysis.branchlength.branchlength],[controlanalysis.branchlength.bifurcationprobability.surfacearea],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
    hold on;
    loglog([controlanalysis.branchlength.branchlength],[controlanalysis.branchlength.terminationprobability.surfacearea],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);    
    xlabel('Branch Length','FontSize',labelfontsize,'FontWeight','b');
    set(gca,'FontSize',axesfontsize); hold off;
	
	subplot(3,4,12); box on; 
    loglog([controlanalysis.branchorder.branchorder],[controlanalysis.branchorder.bifurcationprobability.surfacearea],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
    hold on;
    loglog([controlanalysis.branchorder.branchorder],[controlanalysis.branchorder.terminationprobability.surfacearea],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);    
    xlabel('Branch Order','FontSize',labelfontsize,'FontWeight','b');
    set(gca,'FontSize',axesfontsize); hold off;
    
    

    subplotspace('horizontal',-5);
    subplotspace('vertical',-15);

    [ax,h3]=suplabel('Burke Bifurcation / Termination Probabilities by Surface Area'  ,'t');
    set(h3,'FontSize',titlefontsize);


    currentdirectory = cd;
    cd(controlanalysis.datapathname);

    if exist('figures','dir')==7
        cd('figures');
    else
        mkdir('figures');
        cd('figures');
    end

    %fillscreen;

    filename = sprintf('%s_%s',controlanalysis.inputfilename,'402_Burke_Bif_Term_Prob_SurfaceArea');
    print('-djpeg',filename);
    %saveas(gcf,filename,'fig');
    

    
    
    
    figure;
    
    subplot(3,4,1); box on;
    loglog([controlanalysis.diameter.diameter],[controlanalysis.diameter.numberbifurcations.total],'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
    hold on;
    loglog([controlanalysis.diameter.diameter],[controlanalysis.diameter.numberterminations.total],'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize)
    loglog([controlanalysis.diameter.diameter],[controlanalysis.diameter.volume.total],'-b','LineWidth',1.5);   
    ylabel('# of Endings      Length','FontSize',labelfontsize,'FontWeight','b');
    set(gca,'FontSize',axesfontsize); hold off;
    
    subplot(3,4,2); box on; 
    loglog([controlanalysis.pathlength.pathlength],[controlanalysis.pathlength.numberbifurcations.total],'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize)
    hold on;
    loglog([controlanalysis.pathlength.pathlength],[controlanalysis.pathlength.numberterminations.total],'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
    loglog([controlanalysis.pathlength.pathlength],[controlanalysis.pathlength.volume.total],'-b','LineWidth',1.5);    
    set(gca,'FontSize',axesfontsize); hold off;
    
    subplot(3,4,3); box on; 
    loglog([controlanalysis.branchlength.branchlength],[controlanalysis.branchlength.numberbifurcations.total],'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
    hold on;
    loglog([controlanalysis.branchlength.branchlength],[controlanalysis.branchlength.numberterminations.total],'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
    loglog([controlanalysis.branchlength.branchlength],[controlanalysis.branchlength.volume.total],'-b','LineWidth',1.5);    
    set(gca,'FontSize',axesfontsize); hold off;

	subplot(3,4,4); box on; 
    loglog([controlanalysis.branchorder.branchorder],[controlanalysis.branchorder.numberbifurcations.total],'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
    hold on;
    loglog([controlanalysis.branchorder.branchorder],[controlanalysis.branchorder.numberterminations.total],'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
    loglog([controlanalysis.branchorder.branchorder],[controlanalysis.branchorder.volume.total],'-b','LineWidth',1.5);    
    set(gca,'FontSize',axesfontsize); hold off;
		
    subplot(3,4,5); box on;
    semilogy([controlanalysis.diameter.diameter],[controlanalysis.diameter.bifurcationprobability.volume],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
    hold on;
    semilogy([controlanalysis.diameter.diameter],[controlanalysis.diameter.terminationprobability.volume],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
    ylabel('Probability (Semi-Log)','FontSize',labelfontsize,'FontWeight','b');
    set(gca,'FontSize',axesfontsize); hold off;
    
    subplot(3,4,6); box on; 
    semilogy([controlanalysis.pathlength.pathlength],[controlanalysis.pathlength.bifurcationprobability.volume],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
    hold on;
    semilogy([controlanalysis.pathlength.pathlength],[controlanalysis.pathlength.terminationprobability.volume],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);    
    set(gca,'FontSize',axesfontsize); hold off;
    
    subplot(3,4,7); box on; 
    semilogy([controlanalysis.branchlength.branchlength],[controlanalysis.branchlength.bifurcationprobability.volume],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
    hold on;
    semilogy([controlanalysis.branchlength.branchlength],[controlanalysis.branchlength.terminationprobability.volume],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);    
    set(gca,'FontSize',axesfontsize); hold off;
	
	subplot(3,4,8); box on; 
    semilogy([controlanalysis.branchorder.branchorder],[controlanalysis.branchorder.bifurcationprobability.volume],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
    hold on;
    semilogy([controlanalysis.branchorder.branchorder],[controlanalysis.branchorder.terminationprobability.volume],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);    
    set(gca,'FontSize',axesfontsize); hold off;
	
	subplot(3,4,9); box on;
    loglog([controlanalysis.diameter.diameter],[controlanalysis.diameter.bifurcationprobability.volume],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
    hold on;
    loglog([controlanalysis.diameter.diameter],[controlanalysis.diameter.terminationprobability.volume],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
    xlabel('Diameter','FontSize',labelfontsize,'FontWeight','b');
    ylabel('Probability (Log-Log)','FontSize',labelfontsize,'FontWeight','b'); 
    set(gca,'FontSize',axesfontsize); hold off;
    
    subplot(3,4,10); box on; 
    loglog([controlanalysis.pathlength.pathlength],[controlanalysis.pathlength.bifurcationprobability.volume],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
    hold on;
    loglog([controlanalysis.pathlength.pathlength],[controlanalysis.pathlength.terminationprobability.volume],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);    
    xlabel('Path Length','FontSize',labelfontsize,'FontWeight','b');
    set(gca,'FontSize',axesfontsize); hold off;
    
    subplot(3,4,11); box on; 
    loglog([controlanalysis.branchlength.branchlength],[controlanalysis.branchlength.bifurcationprobability.volume],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
    hold on;
    loglog([controlanalysis.branchlength.branchlength],[controlanalysis.branchlength.terminationprobability.volume],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);    
    xlabel('Branch Length','FontSize',labelfontsize,'FontWeight','b');
    set(gca,'FontSize',axesfontsize); hold off;
	
	subplot(3,4,12); box on; 
    loglog([controlanalysis.branchorder.branchorder],[controlanalysis.branchorder.bifurcationprobability.volume],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
    hold on;
    loglog([controlanalysis.branchorder.branchorder],[controlanalysis.branchorder.terminationprobability.volume],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);    
    xlabel('Branch Order','FontSize',labelfontsize,'FontWeight','b');
    set(gca,'FontSize',axesfontsize); hold off;
    
    

    subplotspace('horizontal',-5);
    subplotspace('vertical',-15);

    [ax,h3]=suplabel('Burke Bifurcation / Termination Probabilities by Volume'  ,'t');
    set(h3,'FontSize',titlefontsize);


    currentdirectory = cd;
    cd(controlanalysis.datapathname);

    if exist('figures','dir')==7
        cd('figures');
    else
        mkdir('figures');
        cd('figures');
    end

    %fillscreen;

    filename = sprintf('%s_%s',controlanalysis.inputfilename,'402_Burke_Bif_Term_Prob_Volume');
    print('-djpeg',filename);
    %saveas(gcf,filename,'fig');

end
 
 
 
 
 
 
 
 
 
 