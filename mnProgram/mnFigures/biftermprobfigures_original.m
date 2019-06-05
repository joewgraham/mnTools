function biftermprobfigures(controlanalysis,testanalysis)
% Branching/Terminating Probability Figures

titlefontsize = 14;
labelfontsize = 7;
axesfontsize  = 5;
insetfontsize = 5;


indgreenmarkersize = 3;
indredmarkersize   = 5;

greenmarkersize   = 4;
redmarkersize     = 6;
yellowmarkersize  = 3;
magentamarkersize = 5;



if nargin == 1

    figure;
    
    subplot(3,3,1); box on;
    loglog([controlanalysis.bifurcation.diameter.diameter],[controlanalysis.bifurcation.diameter.numbersegments.total],'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
    hold on;
    loglog([controlanalysis.termination.diameter.diameter],[controlanalysis.termination.diameter.numbersegments.total],'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
    loglog([controlanalysis.bifurcation.diameter.diameter],[controlanalysis.bifurcation.diameter.length.total],'-g','LineWidth',2);
    loglog([controlanalysis.termination.diameter.diameter],[controlanalysis.termination.diameter.length.total],'-r','LineWidth',2);
    ylabel('# of Endings      Length','FontSize',labelfontsize,'FontWeight','b');
    set(gca,'FontSize',axesfontsize); hold off;
    
    subplot(3,3,2); box on; 
    loglog([controlanalysis.bifurcation.pathlength.pathlength],[controlanalysis.bifurcation.pathlength.numbersegments.total],'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
    hold on;
    loglog([controlanalysis.termination.pathlength.pathlength],[controlanalysis.termination.pathlength.numbersegments.total],'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
    loglog([controlanalysis.bifurcation.pathlength.pathlength],[controlanalysis.bifurcation.pathlength.length.total],'-g','LineWidth',2); 
    loglog([controlanalysis.termination.pathlength.pathlength],[controlanalysis.termination.pathlength.length.total],'-r','LineWidth',2);
    set(gca,'FontSize',axesfontsize); hold off;
    
    subplot(3,3,3); box on; 
    loglog([controlanalysis.bifurcation.radialdistance.radialdistance],[controlanalysis.bifurcation.radialdistance.numbersegments.total],'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
    hold on;
    loglog([controlanalysis.termination.radialdistance.radialdistance],[controlanalysis.termination.radialdistance.numbersegments.total],'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
    loglog([controlanalysis.bifurcation.radialdistance.radialdistance],[controlanalysis.bifurcation.radialdistance.length.total],'-g','LineWidth',2); 
    loglog([controlanalysis.termination.radialdistance.radialdistance],[controlanalysis.termination.radialdistance.length.total],'-r','LineWidth',2); 
    set(gca,'FontSize',axesfontsize); hold off;

    subplot(3,3,4); box on;
    semilogy([controlanalysis.bifurcation.diameter.diameter],[controlanalysis.bifurcation.diameter.bifurcationprobability.length],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
    hold on;
    semilogy([controlanalysis.termination.diameter.diameter],[controlanalysis.termination.diameter.terminationprobability.length],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
    ylabel('Probability (Semi-Log)','FontSize',labelfontsize,'FontWeight','b');
    set(gca,'FontSize',axesfontsize); hold off;
    
    subplot(3,3,5); box on; 
    semilogy([controlanalysis.bifurcation.pathlength.pathlength],[controlanalysis.bifurcation.pathlength.bifurcationprobability.length],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
    hold on;
    semilogy([controlanalysis.termination.pathlength.pathlength],[controlanalysis.termination.pathlength.terminationprobability.length],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);    
    set(gca,'FontSize',axesfontsize); hold off;
    
    subplot(3,3,6); box on; 
    semilogy([controlanalysis.bifurcation.radialdistance.radialdistance],[controlanalysis.bifurcation.radialdistance.bifurcationprobability.length],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
    hold on;
    semilogy([controlanalysis.termination.radialdistance.radialdistance],[controlanalysis.termination.radialdistance.terminationprobability.length],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);    
    set(gca,'FontSize',axesfontsize); hold off;
    
    subplot(3,3,7); box on;
    loglog([controlanalysis.bifurcation.diameter.diameter],[controlanalysis.bifurcation.diameter.bifurcationprobability.length],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
    hold on;
    loglog([controlanalysis.termination.diameter.diameter],[controlanalysis.termination.diameter.terminationprobability.length],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
    xlabel('Diameter','FontSize',labelfontsize,'FontWeight','b');
    ylabel('Probability (Log-Log)','FontSize',labelfontsize,'FontWeight','b'); 
    set(gca,'FontSize',axesfontsize); hold off;
    
    subplot(3,3,8); box on; 
    loglog([controlanalysis.bifurcation.pathlength.pathlength],[controlanalysis.bifurcation.pathlength.bifurcationprobability.length],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
    hold on;
    loglog([controlanalysis.termination.pathlength.pathlength],[controlanalysis.termination.pathlength.terminationprobability.length],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);    
    xlabel('Path Length','FontSize',labelfontsize,'FontWeight','b');
    set(gca,'FontSize',axesfontsize); hold off;
    
    subplot(3,3,9); box on; 
    loglog([controlanalysis.bifurcation.radialdistance.radialdistance],[controlanalysis.bifurcation.radialdistance.bifurcationprobability.length],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
    hold on;
    loglog([controlanalysis.termination.radialdistance.radialdistance],[controlanalysis.termination.radialdistance.terminationprobability.length],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);    
    xlabel('Radial Distance','FontSize',labelfontsize,'FontWeight','b');
    set(gca,'FontSize',axesfontsize); hold off;
    
    

    subplotspace('horizontal',-5);
    subplotspace('vertical',-15);

    [ax,h3]=suplabel('Bifurcation / Termination Probabilities by Length'  ,'t');
    set(h3,'FontSize',titlefontsize);


    currentdirectory = cd;
    cd(controlanalysis.datapathname);

    if exist('figures','dir')==7
        cd('figures');
    else
        mkdir('figures');
        cd('figures');
    end

    %%fillscreen;

    filename = sprintf('%s_%s',controlanalysis.inputfilename,'403_Bif_Term_Prob_Length');
    print('-djpeg',filename);
    %saveas(gcf,filename,'fig');
    
    
    
    figure;
    
    subplot(3,3,1); box on;
    loglog([controlanalysis.bifurcation.diameter.diameter],[controlanalysis.bifurcation.diameter.numbersegments.total],'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
    hold on;
    loglog([controlanalysis.termination.diameter.diameter],[controlanalysis.termination.diameter.numbersegments.total],'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
    loglog([controlanalysis.bifurcation.diameter.diameter],[controlanalysis.bifurcation.diameter.surfacearea.total],'-g','LineWidth',2);   
    loglog([controlanalysis.termination.diameter.diameter],[controlanalysis.termination.diameter.surfacearea.total],'-r','LineWidth',2);   
    ylabel('# of Endings      Surface Area','FontSize',labelfontsize,'FontWeight','b'); 
    set(gca,'FontSize',axesfontsize); hold off;
    
    subplot(3,3,2); box on; 
    loglog([controlanalysis.bifurcation.pathlength.pathlength],[controlanalysis.bifurcation.pathlength.numbersegments.total],'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
    hold on;
    loglog([controlanalysis.termination.pathlength.pathlength],[controlanalysis.termination.pathlength.numbersegments.total],'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
    loglog([controlanalysis.bifurcation.pathlength.pathlength],[controlanalysis.bifurcation.pathlength.surfacearea.total],'-g','LineWidth',2); 
    loglog([controlanalysis.termination.pathlength.pathlength],[controlanalysis.termination.pathlength.surfacearea.total],'-r','LineWidth',2); 
    set(gca,'FontSize',axesfontsize); hold off;
    
    subplot(3,3,3); box on; 
    loglog([controlanalysis.bifurcation.radialdistance.radialdistance],[controlanalysis.bifurcation.radialdistance.numbersegments.total],'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
    hold on;
    loglog([controlanalysis.termination.radialdistance.radialdistance],[controlanalysis.termination.radialdistance.numbersegments.total],'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
    loglog([controlanalysis.bifurcation.radialdistance.radialdistance],[controlanalysis.bifurcation.radialdistance.surfacearea.total],'-g','LineWidth',2);    
    loglog([controlanalysis.termination.radialdistance.radialdistance],[controlanalysis.termination.radialdistance.surfacearea.total],'-r','LineWidth',2);    
    set(gca,'FontSize',axesfontsize); hold off;

    subplot(3,3,4); box on;
    semilogy([controlanalysis.bifurcation.diameter.diameter],[controlanalysis.bifurcation.diameter.bifurcationprobability.surfacearea],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
    hold on;
    semilogy([controlanalysis.termination.diameter.diameter],[controlanalysis.termination.diameter.terminationprobability.surfacearea],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
    ylabel('Probability (Semi-Log)','FontSize',labelfontsize,'FontWeight','b');    
    set(gca,'FontSize',axesfontsize); hold off;
   
    subplot(3,3,5); box on; 
    semilogy([controlanalysis.bifurcation.pathlength.pathlength],[controlanalysis.bifurcation.pathlength.bifurcationprobability.surfacearea],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
    hold on;
    semilogy([controlanalysis.termination.pathlength.pathlength],[controlanalysis.termination.pathlength.terminationprobability.surfacearea],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);    
    set(gca,'FontSize',axesfontsize); hold off;
    
    subplot(3,3,6); box on; 
    semilogy([controlanalysis.bifurcation.radialdistance.radialdistance],[controlanalysis.bifurcation.radialdistance.bifurcationprobability.surfacearea],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
    hold on;
    semilogy([controlanalysis.termination.radialdistance.radialdistance],[controlanalysis.termination.radialdistance.terminationprobability.surfacearea],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);    
    set(gca,'FontSize',axesfontsize); hold off;
    
    subplot(3,3,7); box on;
    loglog([controlanalysis.bifurcation.diameter.diameter],[controlanalysis.bifurcation.diameter.bifurcationprobability.surfacearea],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
    hold on;
    loglog([controlanalysis.termination.diameter.diameter],[controlanalysis.termination.diameter.terminationprobability.surfacearea],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
    xlabel('Diameter','FontSize',labelfontsize,'FontWeight','b');
    ylabel('Probability (Log-Log)','FontSize',labelfontsize,'FontWeight','b');    
    set(gca,'FontSize',axesfontsize); hold off;
  
    subplot(3,3,8); box on; 
    loglog([controlanalysis.bifurcation.pathlength.pathlength],[controlanalysis.bifurcation.pathlength.bifurcationprobability.surfacearea],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
    hold on;
    loglog([controlanalysis.termination.pathlength.pathlength],[controlanalysis.termination.pathlength.terminationprobability.surfacearea],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);    
    xlabel('Path Length','FontSize',labelfontsize,'FontWeight','b');
    set(gca,'FontSize',axesfontsize); hold off;
    
    subplot(3,3,9); box on; 
    loglog([controlanalysis.bifurcation.radialdistance.radialdistance],[controlanalysis.bifurcation.radialdistance.bifurcationprobability.surfacearea],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
    hold on;
    loglog([controlanalysis.termination.radialdistance.radialdistance],[controlanalysis.termination.radialdistance.terminationprobability.surfacearea],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);    
    xlabel('Radial Distance','FontSize',labelfontsize,'FontWeight','b');
    set(gca,'FontSize',axesfontsize); hold off;
    
    

    subplotspace('horizontal',-5);
    subplotspace('vertical',-15);

    [ax,h3]=suplabel('Bifurcation / Termination Probabilities by Surface Area'  ,'t');
    set(h3,'FontSize',titlefontsize);


    currentdirectory = cd;
    cd(controlanalysis.datapathname);

    if exist('figures','dir')==7
        cd('figures');
    else
        mkdir('figures');
        cd('figures');
    end

    %%fillscreen;

    filename = sprintf('%s_%s',controlanalysis.inputfilename,'403_Bif_Term_Prob_SurfaceArea');
    print('-djpeg',filename);
    %saveas(gcf,filename,'fig');
    

    
    
    
    figure;
    
    subplot(3,3,1); box on;
    loglog([controlanalysis.bifurcation.diameter.diameter],[controlanalysis.bifurcation.diameter.numbersegments.total],'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
    hold on;
    loglog([controlanalysis.termination.diameter.diameter],[controlanalysis.termination.diameter.numbersegments.total],'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
    loglog([controlanalysis.bifurcation.diameter.diameter],[controlanalysis.bifurcation.diameter.volume.total],'-g','LineWidth',2);  
    loglog([controlanalysis.termination.diameter.diameter],[controlanalysis.termination.diameter.volume.total],'-r','LineWidth',2); 
    ylabel('# of Endings      Volume','FontSize',labelfontsize,'FontWeight','b');    
    set(gca,'FontSize',axesfontsize); hold off;
   
    subplot(3,3,2); box on; 
    loglog([controlanalysis.bifurcation.pathlength.pathlength],[controlanalysis.bifurcation.pathlength.numbersegments.total],'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
    hold on;
    loglog([controlanalysis.termination.pathlength.pathlength],[controlanalysis.termination.pathlength.numbersegments.total],'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
    loglog([controlanalysis.bifurcation.pathlength.pathlength],[controlanalysis.bifurcation.pathlength.volume.total],'-g','LineWidth',2);  
    loglog([controlanalysis.termination.pathlength.pathlength],[controlanalysis.termination.pathlength.volume.total],'-r','LineWidth',2);  
    set(gca,'FontSize',axesfontsize); hold off;
    
    subplot(3,3,3); box on; 
    loglog([controlanalysis.bifurcation.radialdistance.radialdistance],[controlanalysis.bifurcation.radialdistance.numbersegments.total],'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
    hold on;
    loglog([controlanalysis.termination.radialdistance.radialdistance],[controlanalysis.termination.radialdistance.numbersegments.total],'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
    loglog([controlanalysis.bifurcation.radialdistance.radialdistance],[controlanalysis.bifurcation.radialdistance.volume.total],'-g','LineWidth',2); 
    loglog([controlanalysis.termination.radialdistance.radialdistance],[controlanalysis.termination.radialdistance.volume.total],'-r','LineWidth',2);
    set(gca,'FontSize',axesfontsize); hold off;

    subplot(3,3,4); box on;
    semilogy([controlanalysis.bifurcation.diameter.diameter],[controlanalysis.bifurcation.diameter.bifurcationprobability.volume],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
    hold on;
    semilogy([controlanalysis.termination.diameter.diameter],[controlanalysis.termination.diameter.terminationprobability.volume],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
    ylabel('Probability (Semi-Log)','FontSize',labelfontsize,'FontWeight','b');   
    set(gca,'FontSize',axesfontsize); hold off;
 
    subplot(3,3,5); box on; 
    semilogy([controlanalysis.bifurcation.pathlength.pathlength],[controlanalysis.bifurcation.pathlength.bifurcationprobability.volume],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
    hold on;
    semilogy([controlanalysis.termination.pathlength.pathlength],[controlanalysis.termination.pathlength.terminationprobability.volume],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);    
    set(gca,'FontSize',axesfontsize); hold off;
    
    subplot(3,3,6); box on; 
    semilogy([controlanalysis.bifurcation.radialdistance.radialdistance],[controlanalysis.bifurcation.radialdistance.bifurcationprobability.volume],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
    hold on;
    semilogy([controlanalysis.termination.radialdistance.radialdistance],[controlanalysis.termination.radialdistance.terminationprobability.volume],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);    
    set(gca,'FontSize',axesfontsize); hold off;
    
    subplot(3,3,7); box on;
    loglog([controlanalysis.bifurcation.diameter.diameter],[controlanalysis.bifurcation.diameter.bifurcationprobability.volume],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
    hold on;
    loglog([controlanalysis.termination.diameter.diameter],[controlanalysis.termination.diameter.terminationprobability.volume],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
    xlabel('Diameter','FontSize',labelfontsize,'FontWeight','b');
    ylabel('Probability (Log-Log)','FontSize',labelfontsize,'FontWeight','b');    
    set(gca,'FontSize',axesfontsize); hold off;
  
    subplot(3,3,8); box on; 
    loglog([controlanalysis.bifurcation.pathlength.pathlength],[controlanalysis.bifurcation.pathlength.bifurcationprobability.volume],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
    hold on;
    loglog([controlanalysis.termination.pathlength.pathlength],[controlanalysis.termination.pathlength.terminationprobability.volume],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);    
    xlabel('Path Length','FontSize',labelfontsize,'FontWeight','b');
    set(gca,'FontSize',axesfontsize); hold off;
    
    subplot(3,3,9); box on; 
    loglog([controlanalysis.bifurcation.radialdistance.radialdistance],[controlanalysis.bifurcation.radialdistance.bifurcationprobability.volume],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
    hold on;
    loglog([controlanalysis.termination.radialdistance.radialdistance],[controlanalysis.termination.radialdistance.terminationprobability.volume],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);    
    xlabel('Radial Distance','FontSize',labelfontsize,'FontWeight','b');
    set(gca,'FontSize',axesfontsize); hold off;
    
    

    subplotspace('horizontal',-5);
    subplotspace('vertical',-15);

    [ax,h3]=suplabel('Bifurcation / Termination Probabilities by Volume'  ,'t');
    set(h3,'FontSize',titlefontsize);


    currentdirectory = cd;
    cd(controlanalysis.datapathname);

    if exist('figures','dir')==7
        cd('figures');
    else
        mkdir('figures');
        cd('figures');
    end

    %%fillscreen;

    filename = sprintf('%s_%s',controlanalysis.inputfilename,'403_Bif_Term_Prob_Volume');
    print('-djpeg',filename);
    %saveas(gcf,filename,'fig');

end






if nargin == 2

    figure;
    
    subplot(3,3,1); box on;
    loglog([controlanalysis.bifurcation.diameter.diameter],[controlanalysis.bifurcation.diameter.numbersegments.total],'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
    hold on;
    loglog([controlanalysis.termination.diameter.diameter],[controlanalysis.termination.diameter.numbersegments.total],'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
    loglog([controlanalysis.bifurcation.diameter.diameter],[controlanalysis.bifurcation.diameter.length.total],'-g','LineWidth',2);
    loglog([controlanalysis.termination.diameter.diameter],[controlanalysis.termination.diameter.length.total],'-r','LineWidth',2);
    loglog([testanalysis.bifurcation.diameter.diameter],[testanalysis.bifurcation.diameter.numbersegments.total],'-sy','LineWidth',1.5,'MarkerEdgeColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
    loglog([testanalysis.termination.diameter.diameter],[testanalysis.termination.diameter.numbersegments.total],'-dm','LineWidth',1.5,'MarkerEdgeColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
    loglog([testanalysis.bifurcation.diameter.diameter],[testanalysis.bifurcation.diameter.length.total],'-y','LineWidth',2);
    loglog([testanalysis.termination.diameter.diameter],[testanalysis.termination.diameter.length.total],'-m','LineWidth',2);
    ylabel('# of Endings      Length','FontSize',labelfontsize,'FontWeight','b');
    %legendhandle = gca;
    set(gca,'FontSize',axesfontsize); hold off;
    
    subplot(3,3,2); box on; 
    loglog([controlanalysis.bifurcation.pathlength.pathlength],[controlanalysis.bifurcation.pathlength.numbersegments.total],'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
    hold on;
    loglog([controlanalysis.termination.pathlength.pathlength],[controlanalysis.termination.pathlength.numbersegments.total],'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
    loglog([controlanalysis.bifurcation.pathlength.pathlength],[controlanalysis.bifurcation.pathlength.length.total],'-g','LineWidth',2); 
    loglog([controlanalysis.termination.pathlength.pathlength],[controlanalysis.termination.pathlength.length.total],'-r','LineWidth',2);
    loglog([testanalysis.bifurcation.pathlength.pathlength],[testanalysis.bifurcation.pathlength.numbersegments.total],'-sy','LineWidth',1.5,'MarkerEdgeColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
    loglog([testanalysis.termination.pathlength.pathlength],[testanalysis.termination.pathlength.numbersegments.total],'-dm','LineWidth',1.5,'MarkerEdgeColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
    loglog([testanalysis.bifurcation.pathlength.pathlength],[testanalysis.bifurcation.pathlength.length.total],'-y','LineWidth',2); 
    loglog([testanalysis.termination.pathlength.pathlength],[testanalysis.termination.pathlength.length.total],'-m','LineWidth',2);
    set(gca,'FontSize',axesfontsize); hold off;
    
    subplot(3,3,3); box on; 
    loglog([controlanalysis.bifurcation.radialdistance.radialdistance],[controlanalysis.bifurcation.radialdistance.numbersegments.total],'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
    hold on;
    loglog([controlanalysis.termination.radialdistance.radialdistance],[controlanalysis.termination.radialdistance.numbersegments.total],'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
    loglog([controlanalysis.bifurcation.radialdistance.radialdistance],[controlanalysis.bifurcation.radialdistance.length.total],'-g','LineWidth',2); 
    loglog([controlanalysis.termination.radialdistance.radialdistance],[controlanalysis.termination.radialdistance.length.total],'-r','LineWidth',2); 
    loglog([testanalysis.bifurcation.radialdistance.radialdistance],[testanalysis.bifurcation.radialdistance.numbersegments.total],'-sy','LineWidth',1.5,'MarkerEdgeColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
    loglog([testanalysis.termination.radialdistance.radialdistance],[testanalysis.termination.radialdistance.numbersegments.total],'-dm','LineWidth',1.5,'MarkerEdgeColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
    loglog([testanalysis.bifurcation.radialdistance.radialdistance],[testanalysis.bifurcation.radialdistance.length.total],'-y','LineWidth',2); 
    loglog([testanalysis.termination.radialdistance.radialdistance],[testanalysis.termination.radialdistance.length.total],'-m','LineWidth',2); 
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize); hold off;

    subplot(3,3,4); box on;
    semilogy([controlanalysis.bifurcation.diameter.diameter],[controlanalysis.bifurcation.diameter.bifurcationprobability.length],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
    hold on;
    semilogy([controlanalysis.termination.diameter.diameter],[controlanalysis.termination.diameter.terminationprobability.length],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
    semilogy([testanalysis.bifurcation.diameter.diameter],[testanalysis.bifurcation.diameter.bifurcationprobability.length],'sy','MarkerFaceColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
    semilogy([testanalysis.termination.diameter.diameter],[testanalysis.termination.diameter.terminationprobability.length],'dm','MarkerFaceColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
    ylabel('Probability (Semi-Log)','FontSize',labelfontsize,'FontWeight','b');
    set(gca,'FontSize',axesfontsize); hold off;
    
    subplot(3,3,5); box on; 
    semilogy([controlanalysis.bifurcation.pathlength.pathlength],[controlanalysis.bifurcation.pathlength.bifurcationprobability.length],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
    hold on;
    semilogy([controlanalysis.termination.pathlength.pathlength],[controlanalysis.termination.pathlength.terminationprobability.length],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);    
    semilogy([testanalysis.bifurcation.pathlength.pathlength],[testanalysis.bifurcation.pathlength.bifurcationprobability.length],'sy','MarkerFaceColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
    semilogy([testanalysis.termination.pathlength.pathlength],[testanalysis.termination.pathlength.terminationprobability.length],'dm','MarkerFaceColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);    
    set(gca,'FontSize',axesfontsize); hold off;
    
    subplot(3,3,6); box on; 
    semilogy([controlanalysis.bifurcation.radialdistance.radialdistance],[controlanalysis.bifurcation.radialdistance.bifurcationprobability.length],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
    hold on;
    semilogy([controlanalysis.termination.radialdistance.radialdistance],[controlanalysis.termination.radialdistance.terminationprobability.length],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);    
    semilogy([testanalysis.bifurcation.radialdistance.radialdistance],[testanalysis.bifurcation.radialdistance.bifurcationprobability.length],'sy','MarkerFaceColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
    semilogy([testanalysis.termination.radialdistance.radialdistance],[testanalysis.termination.radialdistance.terminationprobability.length],'dm','MarkerFaceColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);    
    set(gca,'FontSize',axesfontsize); hold off;
    
    subplot(3,3,7); box on;
    loglog([controlanalysis.bifurcation.diameter.diameter],[controlanalysis.bifurcation.diameter.bifurcationprobability.length],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
    hold on;
    loglog([controlanalysis.termination.diameter.diameter],[controlanalysis.termination.diameter.terminationprobability.length],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
    loglog([testanalysis.bifurcation.diameter.diameter],[testanalysis.bifurcation.diameter.bifurcationprobability.length],'sy','MarkerFaceColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
    loglog([testanalysis.termination.diameter.diameter],[testanalysis.termination.diameter.terminationprobability.length],'dm','MarkerFaceColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
    xlabel('Diameter','FontSize',labelfontsize,'FontWeight','b');
    ylabel('Probability (Log-Log)','FontSize',labelfontsize,'FontWeight','b'); 
    set(gca,'FontSize',axesfontsize); hold off;
    
    subplot(3,3,8); box on; 
    loglog([controlanalysis.bifurcation.pathlength.pathlength],[controlanalysis.bifurcation.pathlength.bifurcationprobability.length],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
    hold on;
    loglog([controlanalysis.termination.pathlength.pathlength],[controlanalysis.termination.pathlength.terminationprobability.length],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);    
    loglog([testanalysis.bifurcation.pathlength.pathlength],[testanalysis.bifurcation.pathlength.bifurcationprobability.length],'sy','MarkerFaceColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
    loglog([testanalysis.termination.pathlength.pathlength],[testanalysis.termination.pathlength.terminationprobability.length],'dm','MarkerFaceColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);    
    xlabel('Path Length','FontSize',labelfontsize,'FontWeight','b');
    set(gca,'FontSize',axesfontsize); hold off;
    
    subplot(3,3,9); box on; 
    loglog([controlanalysis.bifurcation.radialdistance.radialdistance],[controlanalysis.bifurcation.radialdistance.bifurcationprobability.length],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
    hold on;
    loglog([controlanalysis.termination.radialdistance.radialdistance],[controlanalysis.termination.radialdistance.terminationprobability.length],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);    
    loglog([testanalysis.bifurcation.radialdistance.radialdistance],[testanalysis.bifurcation.radialdistance.bifurcationprobability.length],'sy','MarkerFaceColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
    loglog([testanalysis.termination.radialdistance.radialdistance],[testanalysis.termination.radialdistance.terminationprobability.length],'dm','MarkerFaceColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);    
    xlabel('Radial Distance','FontSize',labelfontsize,'FontWeight','b');
    set(gca,'FontSize',axesfontsize); hold off;
    
    

    subplotspace('horizontal',-5);
    subplotspace('vertical',-15);

    [ax,h3]=suplabel('Bifurcation / Termination Probabilities by Length'  ,'t');
    set(h3,'FontSize',titlefontsize);


    currentdirectory = cd;
    cd(controlanalysis.datapathname);
    cd ..

    if exist(sprintf('%s_%s_comparison',controlanalysis.inputfilename,testanalysis.inputfilename),'dir')==7;
        cd(sprintf('%s_%s_comparison',controlanalysis.inputfilename,testanalysis.inputfilename));
    else
        mkdir(sprintf('%s_%s_comparison',controlanalysis.inputfilename,testanalysis.inputfilename));
        cd(sprintf('%s_%s_comparison',controlanalysis.inputfilename,testanalysis.inputfilename));
    end

    if exist('comparisonfigures','dir')==7
        cd('comparisonfigures');
    else
        mkdir('comparisonfigures');
        cd('comparisonfigures');
    end

    %%fillscreen;
    
    legend(legendhandle,[controlanalysis.inputfilename ' #Bifs'],[controlanalysis.inputfilename ' #Terms'],[controlanalysis.inputfilename ' Bif Length'],[controlanalysis.inputfilename ' Term Length'],[testanalysis.inputfilename ' #Bifs'],[testanalysis.inputfilename ' #Terms'],[testanalysis.inputfilename ' Bif Length'],[testanalysis.inputfilename ' Term Length']);

    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'403_Bif_Term_Prob_Length');
    print('-djpeg',filename);
    %saveas(gcf,filename,'fig');
    
    
    
    figure;
    
    subplot(3,3,1); box on;
    loglog([controlanalysis.bifurcation.diameter.diameter],[controlanalysis.bifurcation.diameter.numbersegments.total],'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
    hold on;
    loglog([controlanalysis.termination.diameter.diameter],[controlanalysis.termination.diameter.numbersegments.total],'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
    loglog([controlanalysis.bifurcation.diameter.diameter],[controlanalysis.bifurcation.diameter.surfacearea.total],'-g','LineWidth',2);   
    loglog([controlanalysis.termination.diameter.diameter],[controlanalysis.termination.diameter.surfacearea.total],'-r','LineWidth',2);   
    loglog([testanalysis.bifurcation.diameter.diameter],[testanalysis.bifurcation.diameter.numbersegments.total],'-sy','LineWidth',1.5,'MarkerEdgeColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
    loglog([testanalysis.termination.diameter.diameter],[testanalysis.termination.diameter.numbersegments.total],'-dm','LineWidth',1.5,'MarkerEdgeColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
    loglog([testanalysis.bifurcation.diameter.diameter],[testanalysis.bifurcation.diameter.surfacearea.total],'-y','LineWidth',2);   
    loglog([testanalysis.termination.diameter.diameter],[testanalysis.termination.diameter.surfacearea.total],'-m','LineWidth',2);   
    ylabel('# of Endings      Surface Area','FontSize',labelfontsize,'FontWeight','b'); 
    %legendhandle = gca;
    set(gca,'FontSize',axesfontsize); hold off;
    
    subplot(3,3,2); box on; 
    loglog([controlanalysis.bifurcation.pathlength.pathlength],[controlanalysis.bifurcation.pathlength.numbersegments.total],'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
    hold on;
    loglog([controlanalysis.termination.pathlength.pathlength],[controlanalysis.termination.pathlength.numbersegments.total],'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
    loglog([controlanalysis.bifurcation.pathlength.pathlength],[controlanalysis.bifurcation.pathlength.surfacearea.total],'-g','LineWidth',2); 
    loglog([controlanalysis.termination.pathlength.pathlength],[controlanalysis.termination.pathlength.surfacearea.total],'-r','LineWidth',2); 
    loglog([testanalysis.bifurcation.pathlength.pathlength],[testanalysis.bifurcation.pathlength.numbersegments.total],'-sy','LineWidth',1.5,'MarkerEdgeColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
    loglog([testanalysis.termination.pathlength.pathlength],[testanalysis.termination.pathlength.numbersegments.total],'-dm','LineWidth',1.5,'MarkerEdgeColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
    loglog([testanalysis.bifurcation.pathlength.pathlength],[testanalysis.bifurcation.pathlength.surfacearea.total],'-y','LineWidth',2); 
    loglog([testanalysis.termination.pathlength.pathlength],[testanalysis.termination.pathlength.surfacearea.total],'-m','LineWidth',2); 
    set(gca,'FontSize',axesfontsize); hold off;
    
    subplot(3,3,3); box on; 
    loglog([controlanalysis.bifurcation.radialdistance.radialdistance],[controlanalysis.bifurcation.radialdistance.numbersegments.total],'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
    hold on;
    loglog([controlanalysis.termination.radialdistance.radialdistance],[controlanalysis.termination.radialdistance.numbersegments.total],'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
    loglog([controlanalysis.bifurcation.radialdistance.radialdistance],[controlanalysis.bifurcation.radialdistance.surfacearea.total],'-g','LineWidth',2);    
    loglog([controlanalysis.termination.radialdistance.radialdistance],[controlanalysis.termination.radialdistance.surfacearea.total],'-r','LineWidth',2);    
    loglog([testanalysis.bifurcation.radialdistance.radialdistance],[testanalysis.bifurcation.radialdistance.numbersegments.total],'-sy','LineWidth',1.5,'MarkerEdgeColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
    loglog([testanalysis.termination.radialdistance.radialdistance],[testanalysis.termination.radialdistance.numbersegments.total],'-dm','LineWidth',1.5,'MarkerEdgeColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
    loglog([testanalysis.bifurcation.radialdistance.radialdistance],[testanalysis.bifurcation.radialdistance.surfacearea.total],'-y','LineWidth',2);    
    loglog([testanalysis.termination.radialdistance.radialdistance],[testanalysis.termination.radialdistance.surfacearea.total],'-m','LineWidth',2);    
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize); hold off;

    subplot(3,3,4); box on;
    semilogy([controlanalysis.bifurcation.diameter.diameter],[controlanalysis.bifurcation.diameter.bifurcationprobability.surfacearea],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
    hold on;
    semilogy([controlanalysis.termination.diameter.diameter],[controlanalysis.termination.diameter.terminationprobability.surfacearea],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
    semilogy([testanalysis.bifurcation.diameter.diameter],[testanalysis.bifurcation.diameter.bifurcationprobability.surfacearea],'sy','MarkerFaceColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
    semilogy([testanalysis.termination.diameter.diameter],[testanalysis.termination.diameter.terminationprobability.surfacearea],'dm','MarkerFaceColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
    ylabel('Probability (Semi-Log)','FontSize',labelfontsize,'FontWeight','b');    
    set(gca,'FontSize',axesfontsize); hold off;
   
    subplot(3,3,5); box on; 
    semilogy([controlanalysis.bifurcation.pathlength.pathlength],[controlanalysis.bifurcation.pathlength.bifurcationprobability.surfacearea],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
    hold on;
    semilogy([controlanalysis.termination.pathlength.pathlength],[controlanalysis.termination.pathlength.terminationprobability.surfacearea],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);    
    semilogy([testanalysis.bifurcation.pathlength.pathlength],[testanalysis.bifurcation.pathlength.bifurcationprobability.surfacearea],'sy','MarkerFaceColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
    semilogy([testanalysis.termination.pathlength.pathlength],[testanalysis.termination.pathlength.terminationprobability.surfacearea],'dm','MarkerFaceColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);    
    set(gca,'FontSize',axesfontsize); hold off;
    
    subplot(3,3,6); box on; 
    semilogy([controlanalysis.bifurcation.radialdistance.radialdistance],[controlanalysis.bifurcation.radialdistance.bifurcationprobability.surfacearea],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
    hold on;
    semilogy([controlanalysis.termination.radialdistance.radialdistance],[controlanalysis.termination.radialdistance.terminationprobability.surfacearea],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);    
    semilogy([testanalysis.bifurcation.radialdistance.radialdistance],[testanalysis.bifurcation.radialdistance.bifurcationprobability.surfacearea],'sy','MarkerFaceColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
    semilogy([testanalysis.termination.radialdistance.radialdistance],[testanalysis.termination.radialdistance.terminationprobability.surfacearea],'dm','MarkerFaceColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);    
    set(gca,'FontSize',axesfontsize); hold off;
    
    subplot(3,3,7); box on;
    loglog([controlanalysis.bifurcation.diameter.diameter],[controlanalysis.bifurcation.diameter.bifurcationprobability.surfacearea],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
    hold on;
    loglog([controlanalysis.termination.diameter.diameter],[controlanalysis.termination.diameter.terminationprobability.surfacearea],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
    loglog([testanalysis.bifurcation.diameter.diameter],[testanalysis.bifurcation.diameter.bifurcationprobability.surfacearea],'sy','MarkerFaceColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
    loglog([testanalysis.termination.diameter.diameter],[testanalysis.termination.diameter.terminationprobability.surfacearea],'dm','MarkerFaceColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
    xlabel('Diameter','FontSize',labelfontsize,'FontWeight','b');
    ylabel('Probability (Log-Log)','FontSize',labelfontsize,'FontWeight','b');    
    set(gca,'FontSize',axesfontsize); hold off;
  
    subplot(3,3,8); box on; 
    loglog([controlanalysis.bifurcation.pathlength.pathlength],[controlanalysis.bifurcation.pathlength.bifurcationprobability.surfacearea],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
    hold on;
    loglog([controlanalysis.termination.pathlength.pathlength],[controlanalysis.termination.pathlength.terminationprobability.surfacearea],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);    
    loglog([testanalysis.bifurcation.pathlength.pathlength],[testanalysis.bifurcation.pathlength.bifurcationprobability.surfacearea],'sy','MarkerFaceColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
    loglog([testanalysis.termination.pathlength.pathlength],[testanalysis.termination.pathlength.terminationprobability.surfacearea],'dm','MarkerFaceColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);    
    xlabel('Path Length','FontSize',labelfontsize,'FontWeight','b');
    set(gca,'FontSize',axesfontsize); hold off;
    
    subplot(3,3,9); box on; 
    loglog([controlanalysis.bifurcation.radialdistance.radialdistance],[controlanalysis.bifurcation.radialdistance.bifurcationprobability.surfacearea],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
    hold on;
    loglog([controlanalysis.termination.radialdistance.radialdistance],[controlanalysis.termination.radialdistance.terminationprobability.surfacearea],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);    
    loglog([testanalysis.bifurcation.radialdistance.radialdistance],[testanalysis.bifurcation.radialdistance.bifurcationprobability.surfacearea],'sy','MarkerFaceColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
    loglog([testanalysis.termination.radialdistance.radialdistance],[testanalysis.termination.radialdistance.terminationprobability.surfacearea],'dm','MarkerFaceColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);    
    xlabel('Radial Distance','FontSize',labelfontsize,'FontWeight','b');
    set(gca,'FontSize',axesfontsize); hold off;
    
    

    subplotspace('horizontal',-5);
    subplotspace('vertical',-15);

    [ax,h3]=suplabel('Bifurcation / Termination Probabilities by Surface Area'  ,'t');
    set(h3,'FontSize',titlefontsize);


    currentdirectory = cd;
    cd(controlanalysis.datapathname);
    cd ..

    if exist(sprintf('%s_%s_comparison',controlanalysis.inputfilename,testanalysis.inputfilename),'dir')==7;
        cd(sprintf('%s_%s_comparison',controlanalysis.inputfilename,testanalysis.inputfilename));
    else
        mkdir(sprintf('%s_%s_comparison',controlanalysis.inputfilename,testanalysis.inputfilename));
        cd(sprintf('%s_%s_comparison',controlanalysis.inputfilename,testanalysis.inputfilename));
    end

    if exist('comparisonfigures','dir')==7
        cd('comparisonfigures');
    else
        mkdir('comparisonfigures');
        cd('comparisonfigures');
    end

    %%fillscreen;
    
    legend(legendhandle,[controlanalysis.inputfilename ' #Bifs'],[controlanalysis.inputfilename ' #Terms'],[controlanalysis.inputfilename ' Bif Length'],[controlanalysis.inputfilename ' Term Length'],[testanalysis.inputfilename ' #Bifs'],[testanalysis.inputfilename ' #Terms'],[testanalysis.inputfilename ' Bif Length'],[testanalysis.inputfilename ' Term Length']);

    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'403_Bif_Term_Prob_SurfaceArea');
    print('-djpeg',filename);
    %saveas(gcf,filename,'fig');
    

    
    
    
    figure;
    
    subplot(3,3,1); box on;
    loglog([controlanalysis.bifurcation.diameter.diameter],[controlanalysis.bifurcation.diameter.numbersegments.total],'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
    hold on;
    loglog([controlanalysis.termination.diameter.diameter],[controlanalysis.termination.diameter.numbersegments.total],'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
    loglog([controlanalysis.bifurcation.diameter.diameter],[controlanalysis.bifurcation.diameter.volume.total],'-g','LineWidth',2);  
    loglog([controlanalysis.termination.diameter.diameter],[controlanalysis.termination.diameter.volume.total],'-r','LineWidth',2); 
    loglog([testanalysis.bifurcation.diameter.diameter],[testanalysis.bifurcation.diameter.numbersegments.total],'-sy','LineWidth',1.5,'MarkerEdgeColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
    loglog([testanalysis.termination.diameter.diameter],[testanalysis.termination.diameter.numbersegments.total],'-dm','LineWidth',1.5,'MarkerEdgeColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
    loglog([testanalysis.bifurcation.diameter.diameter],[testanalysis.bifurcation.diameter.volume.total],'-y','LineWidth',2);  
    loglog([testanalysis.termination.diameter.diameter],[testanalysis.termination.diameter.volume.total],'-m','LineWidth',2); 
    ylabel('# of Endings      Volume','FontSize',labelfontsize,'FontWeight','b');    
    %legendhandle = gca;
    set(gca,'FontSize',axesfontsize); hold off;
   
    subplot(3,3,2); box on; 
    loglog([controlanalysis.bifurcation.pathlength.pathlength],[controlanalysis.bifurcation.pathlength.numbersegments.total],'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
    hold on;
    loglog([controlanalysis.termination.pathlength.pathlength],[controlanalysis.termination.pathlength.numbersegments.total],'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
    loglog([controlanalysis.bifurcation.pathlength.pathlength],[controlanalysis.bifurcation.pathlength.volume.total],'-g','LineWidth',2);  
    loglog([controlanalysis.termination.pathlength.pathlength],[controlanalysis.termination.pathlength.volume.total],'-r','LineWidth',2);  
    loglog([testanalysis.bifurcation.pathlength.pathlength],[testanalysis.bifurcation.pathlength.numbersegments.total],'-sy','LineWidth',1.5,'MarkerEdgeColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
    loglog([testanalysis.termination.pathlength.pathlength],[testanalysis.termination.pathlength.numbersegments.total],'-dm','LineWidth',1.5,'MarkerEdgeColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
    loglog([testanalysis.bifurcation.pathlength.pathlength],[testanalysis.bifurcation.pathlength.volume.total],'-y','LineWidth',2);  
    loglog([testanalysis.termination.pathlength.pathlength],[testanalysis.termination.pathlength.volume.total],'-m','LineWidth',2);  
    set(gca,'FontSize',axesfontsize); hold off;
    
    subplot(3,3,3); box on; 
    loglog([controlanalysis.bifurcation.radialdistance.radialdistance],[controlanalysis.bifurcation.radialdistance.numbersegments.total],'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
    hold on;
    loglog([controlanalysis.termination.radialdistance.radialdistance],[controlanalysis.termination.radialdistance.numbersegments.total],'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
    loglog([controlanalysis.bifurcation.radialdistance.radialdistance],[controlanalysis.bifurcation.radialdistance.volume.total],'-g','LineWidth',2); 
    loglog([controlanalysis.termination.radialdistance.radialdistance],[controlanalysis.termination.radialdistance.volume.total],'-r','LineWidth',2);
    loglog([testanalysis.bifurcation.radialdistance.radialdistance],[testanalysis.bifurcation.radialdistance.numbersegments.total],'-sy','LineWidth',1.5,'MarkerEdgeColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
    loglog([testanalysis.termination.radialdistance.radialdistance],[testanalysis.termination.radialdistance.numbersegments.total],'-dm','LineWidth',1.5,'MarkerEdgeColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
    loglog([testanalysis.bifurcation.radialdistance.radialdistance],[testanalysis.bifurcation.radialdistance.volume.total],'-y','LineWidth',2); 
    loglog([testanalysis.termination.radialdistance.radialdistance],[testanalysis.termination.radialdistance.volume.total],'-m','LineWidth',2);
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize); hold off;

    subplot(3,3,4); box on;
    semilogy([controlanalysis.bifurcation.diameter.diameter],[controlanalysis.bifurcation.diameter.bifurcationprobability.volume],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
    hold on;
    semilogy([controlanalysis.termination.diameter.diameter],[controlanalysis.termination.diameter.terminationprobability.volume],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
    semilogy([testanalysis.bifurcation.diameter.diameter],[testanalysis.bifurcation.diameter.bifurcationprobability.volume],'sy','MarkerFaceColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
    semilogy([testanalysis.termination.diameter.diameter],[testanalysis.termination.diameter.terminationprobability.volume],'dm','MarkerFaceColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
    ylabel('Probability (Semi-Log)','FontSize',labelfontsize,'FontWeight','b');   
    set(gca,'FontSize',axesfontsize); hold off;
 
    subplot(3,3,5); box on; 
    semilogy([controlanalysis.bifurcation.pathlength.pathlength],[controlanalysis.bifurcation.pathlength.bifurcationprobability.volume],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
    hold on;
    semilogy([controlanalysis.termination.pathlength.pathlength],[controlanalysis.termination.pathlength.terminationprobability.volume],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);    
    semilogy([testanalysis.bifurcation.pathlength.pathlength],[testanalysis.bifurcation.pathlength.bifurcationprobability.volume],'sy','MarkerFaceColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
    semilogy([testanalysis.termination.pathlength.pathlength],[testanalysis.termination.pathlength.terminationprobability.volume],'dm','MarkerFaceColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);    
    set(gca,'FontSize',axesfontsize); hold off;
    
    subplot(3,3,6); box on; 
    semilogy([controlanalysis.bifurcation.radialdistance.radialdistance],[controlanalysis.bifurcation.radialdistance.bifurcationprobability.volume],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
    hold on;
    semilogy([controlanalysis.termination.radialdistance.radialdistance],[controlanalysis.termination.radialdistance.terminationprobability.volume],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);    
    semilogy([testanalysis.bifurcation.radialdistance.radialdistance],[testanalysis.bifurcation.radialdistance.bifurcationprobability.volume],'sy','MarkerFaceColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
    semilogy([testanalysis.termination.radialdistance.radialdistance],[testanalysis.termination.radialdistance.terminationprobability.volume],'dm','MarkerFaceColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);    
    set(gca,'FontSize',axesfontsize); hold off;
    
    subplot(3,3,7); box on;
    loglog([controlanalysis.bifurcation.diameter.diameter],[controlanalysis.bifurcation.diameter.bifurcationprobability.volume],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
    hold on;
    loglog([controlanalysis.termination.diameter.diameter],[controlanalysis.termination.diameter.terminationprobability.volume],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
    loglog([testanalysis.bifurcation.diameter.diameter],[testanalysis.bifurcation.diameter.bifurcationprobability.volume],'sy','MarkerFaceColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
    loglog([testanalysis.termination.diameter.diameter],[testanalysis.termination.diameter.terminationprobability.volume],'dm','MarkerFaceColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
    xlabel('Diameter','FontSize',labelfontsize,'FontWeight','b');
    ylabel('Probability (Log-Log)','FontSize',labelfontsize,'FontWeight','b');    
    set(gca,'FontSize',axesfontsize); hold off;
  
    subplot(3,3,8); box on; 
    loglog([controlanalysis.bifurcation.pathlength.pathlength],[controlanalysis.bifurcation.pathlength.bifurcationprobability.volume],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
    hold on;
    loglog([controlanalysis.termination.pathlength.pathlength],[controlanalysis.termination.pathlength.terminationprobability.volume],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);    
    loglog([testanalysis.bifurcation.pathlength.pathlength],[testanalysis.bifurcation.pathlength.bifurcationprobability.volume],'sy','MarkerFaceColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
    loglog([testanalysis.termination.pathlength.pathlength],[testanalysis.termination.pathlength.terminationprobability.volume],'dm','MarkerFaceColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);    
    xlabel('Path Length','FontSize',labelfontsize,'FontWeight','b');
    set(gca,'FontSize',axesfontsize); hold off;
    
    subplot(3,3,9); box on; 
    loglog([controlanalysis.bifurcation.radialdistance.radialdistance],[controlanalysis.bifurcation.radialdistance.bifurcationprobability.volume],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
    hold on;
    loglog([controlanalysis.termination.radialdistance.radialdistance],[controlanalysis.termination.radialdistance.terminationprobability.volume],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);    
    loglog([testanalysis.bifurcation.radialdistance.radialdistance],[testanalysis.bifurcation.radialdistance.bifurcationprobability.volume],'sy','MarkerFaceColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
    loglog([testanalysis.termination.radialdistance.radialdistance],[testanalysis.termination.radialdistance.terminationprobability.volume],'dm','MarkerFaceColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);    
    xlabel('Radial Distance','FontSize',labelfontsize,'FontWeight','b');
    set(gca,'FontSize',axesfontsize); hold off;
    
    

    subplotspace('horizontal',-5);
    subplotspace('vertical',-15);

    [ax,h3]=suplabel('Bifurcation / Termination Probabilities by Volume'  ,'t');
    set(h3,'FontSize',titlefontsize);


    currentdirectory = cd;
    cd(controlanalysis.datapathname);
    cd ..

    if exist(sprintf('%s_%s_comparison',controlanalysis.inputfilename,testanalysis.inputfilename),'dir')==7;
        cd(sprintf('%s_%s_comparison',controlanalysis.inputfilename,testanalysis.inputfilename));
    else
        mkdir(sprintf('%s_%s_comparison',controlanalysis.inputfilename,testanalysis.inputfilename));
        cd(sprintf('%s_%s_comparison',controlanalysis.inputfilename,testanalysis.inputfilename));
    end

    if exist('comparisonfigures','dir')==7
        cd('comparisonfigures');
    else
        mkdir('comparisonfigures');
        cd('comparisonfigures');
    end

    %%fillscreen;
    
    legend(legendhandle,[controlanalysis.inputfilename ' #Bifs'],[controlanalysis.inputfilename ' #Terms'],[controlanalysis.inputfilename ' Bif Length'],[controlanalysis.inputfilename ' Term Length'],[testanalysis.inputfilename ' #Bifs'],[testanalysis.inputfilename ' #Terms'],[testanalysis.inputfilename ' Bif Length'],[testanalysis.inputfilename ' Term Length']);

    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'403_Bif_Term_Prob_Volume');
    print('-djpeg',filename);
    %saveas(gcf,filename,'fig');

end
 
 
 
 
 
 
 
 
 
 