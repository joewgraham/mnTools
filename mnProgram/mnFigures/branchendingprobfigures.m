function branchendingprobfigures(controlanalysis,testanalysis)
% Branching/Terminating Probability Figures

mnoptions;

titlefontsize = option.mnfigures.titlefontsize;
labelfontsize = option.mnfigures.labelfontsize;
axesfontsize  = option.mnfigures.axesfontsize;
insetfontsize = option.mnfigures.insetfontsize;

indbluemarkersize  = option.mnfigures.indbluemarkersize;
indgreenmarkersize = option.mnfigures.indgreenmarkersize;
indredmarkersize   = option.mnfigures.indredmarkersize;
bluemarkersize     = option.mnfigures.bluemarkersize;
greenmarkersize    = option.mnfigures.greenmarkersize;
redmarkersize      = option.mnfigures.redmarkersize;
cyanmarkersize     = option.mnfigures.cyanmarkersize;
yellowmarkersize   = option.mnfigures.yellowmarkersize;
magentamarkersize  = option.mnfigures.magentamarkersize;

piecetypes{1} = 'soma';
piecetypes{2} = 'axon';
piecetypes{3} = 'dendrite';
piecetypes{4} = 'apical';

piecetitles{1} = 'Somatic';
piecetitles{2} = 'Axonal';
piecetitles{3} = 'Dendritic';
piecetitles{4} = 'Apical';

for piecetype = 2:4
    
    if nargin == 1
        goahead = true;
    else
        if isfield(testanalysis,piecetypes{piecetype})
            goahead = true;
        else
            goahead = false;
        end
    end
    
    if isfield(controlanalysis,piecetypes{piecetype}) && goahead
        
        currentpiecetype = piecetypes{piecetype};
        currentpiecetitle = piecetitles{piecetype};
        eval(['controltype = controlanalysis.' currentpiecetype ';']);
        if nargin > 1
            eval(['testtype = testanalysis.' currentpiecetype ';']);
        end
        
        figure;
        
        
        subplot(3,4,1);
        box on;
        hold on;
        ylabel('# of Endings      Length','FontSize',labelfontsize,'FontWeight','b');
        if nargin == 1
            loglog([controltype.bifurcation.diameter.diameter],[controltype.bifurcation.diameter.numberbifurcations.total],'sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize)
            loglog([controltype.termination.diameter.diameter],[controltype.termination.diameter.numberterminations.total],'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize)
            loglog([controltype.bifurcation.diameter.diameter],[controltype.bifurcation.diameter.length.total],'-g','LineWidth',1.5);
            loglog([controltype.termination.diameter.diameter],[controltype.termination.diameter.length.total],'-r','LineWidth',1.5);
        else
            loglog([controltype.bifurcation.diameter.diameter],[controltype.bifurcation.diameter.numberbifurcations.total],'sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize)
            loglog([controltype.termination.diameter.diameter],[controltype.termination.diameter.numberterminations.total],'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize)
            loglog([controltype.bifurcation.diameter.diameter],[controltype.bifurcation.diameter.length.total],'-g','LineWidth',1.5);
            loglog([controltype.termination.diameter.diameter],[controltype.termination.diameter.length.total],'-r','LineWidth',1.5);
            loglog([testtype.bifurcation.diameter.diameter],[testtype.bifurcation.diameter.numberbifurcations.total],'-sy','LineWidth',1.5,'MarkerEdgeColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize)
            loglog([testtype.termination.diameter.diameter],[testtype.termination.diameter.numberterminations.total],'-dm','LineWidth',1.5,'MarkerEdgeColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize)
            loglog([testtype.bifurcation.diameter.diameter],[testtype.bifurcation.diameter.length.total],'-y','LineWidth',1.5);
            loglog([testtype.termination.diameter.diameter],[testtype.termination.diameter.length.total],'-m','LineWidth',1.5);
        end
        set(gca,'FontSize',axesfontsize);
        set(gca,'YScale','log');
        set(gca,'XScale','log');
        %legendhandle = gca;
        hold off;
        
        
        subplot(3,4,2);
        box on;
        hold on;
        if nargin == 1
            loglog([controltype.bifurcation.pathlength.pathlength],[controltype.bifurcation.pathlength.numberbifurcations.total],'sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize)
            loglog([controltype.termination.pathlength.pathlength],[controltype.termination.pathlength.numberterminations.total],'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
            loglog([controltype.bifurcation.pathlength.pathlength],[controltype.bifurcation.pathlength.length.total],'-g','LineWidth',1.5);
            loglog([controltype.termination.pathlength.pathlength],[controltype.termination.pathlength.length.total],'-r','LineWidth',1.5);
        else
            loglog([controltype.bifurcation.pathlength.pathlength],[controltype.bifurcation.pathlength.numberbifurcations.total],'sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize)
            loglog([controltype.termination.pathlength.pathlength],[controltype.termination.pathlength.numberterminations.total],'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
            loglog([controltype.bifurcation.pathlength.pathlength],[controltype.bifurcation.pathlength.length.total],'-g','LineWidth',1.5);
            loglog([controltype.termination.pathlength.pathlength],[controltype.termination.pathlength.length.total],'-r','LineWidth',1.5);
            loglog([testtype.bifurcation.pathlength.pathlength],[testtype.bifurcation.pathlength.numberbifurcations.total],'-sy','LineWidth',1.5,'MarkerEdgeColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize)
            loglog([testtype.termination.pathlength.pathlength],[testtype.termination.pathlength.numberterminations.total],'-dm','LineWidth',1.5,'MarkerEdgeColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
            loglog([testtype.bifurcation.pathlength.pathlength],[testtype.bifurcation.pathlength.length.total],'-y','LineWidth',1.5);
            loglog([testtype.termination.pathlength.pathlength],[testtype.termination.pathlength.length.total],'-m','LineWidth',1.5);
        end
        set(gca,'FontSize',axesfontsize);
        set(gca,'YScale','log');
        set(gca,'XScale','log');
        hold off;
        
        
        subplot(3,4,3);
        box on;
        hold on;
        if nargin == 1
            loglog([controltype.bifurcation.branchlength.branchlength],[controltype.bifurcation.branchlength.numberbifurcations.total],'sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
            loglog([controltype.termination.branchlength.branchlength],[controltype.termination.branchlength.numberterminations.total],'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
            loglog([controltype.bifurcation.branchlength.branchlength],[controltype.bifurcation.branchlength.length.total],'-g','LineWidth',1.5);
            loglog([controltype.termination.branchlength.branchlength],[controltype.termination.branchlength.length.total],'-r','LineWidth',1.5);
        else
            loglog([controltype.bifurcation.branchlength.branchlength],[controltype.bifurcation.branchlength.numberbifurcations.total],'sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
            loglog([controltype.termination.branchlength.branchlength],[controltype.termination.branchlength.numberterminations.total],'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
            loglog([controltype.bifurcation.branchlength.branchlength],[controltype.bifurcation.branchlength.length.total],'-g','LineWidth',1.5); 
            loglog([controltype.termination.branchlength.branchlength],[controltype.termination.branchlength.length.total],'-r','LineWidth',1.5); 
            loglog([testtype.bifurcation.branchlength.branchlength],[testtype.bifurcation.branchlength.numberbifurcations.total],'-sy','LineWidth',1.5,'MarkerEdgeColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
            loglog([testtype.termination.branchlength.branchlength],[testtype.termination.branchlength.numberterminations.total],'-dm','LineWidth',1.5,'MarkerEdgeColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
            loglog([testtype.bifurcation.branchlength.branchlength],[testtype.bifurcation.branchlength.length.total],'-y','LineWidth',1.5); 
            loglog([testtype.termination.branchlength.branchlength],[testtype.termination.branchlength.length.total],'-m','LineWidth',1.5);
        end
        set(gca,'FontSize',axesfontsize); 
        set(gca,'YScale','log');
        set(gca,'XScale','log');
        hold off;
        
        
        subplot(3,4,4);
        box on;
        hold on;
        if nargin ==1
            loglog([controltype.bifurcation.branchorder.branchorder],[controltype.bifurcation.branchorder.numbersegments.total],'sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
            loglog([controltype.termination.branchorder.branchorder],[controltype.termination.branchorder.numbersegments.total],'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
            loglog([controltype.bifurcation.branchorder.branchorder],[controltype.bifurcation.branchorder.length.total],'-g','LineWidth',1.5);
            loglog([controltype.termination.branchorder.branchorder],[controltype.termination.branchorder.length.total],'-r','LineWidth',1.5);
        else
            loglog([controltype.bifurcation.branchorder.branchorder],[controltype.bifurcation.branchorder.numbersegments.total],'sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
            loglog([controltype.termination.branchorder.branchorder],[controltype.termination.branchorder.numbersegments.total],'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
            loglog([controltype.bifurcation.branchorder.branchorder],[controltype.bifurcation.branchorder.length.total],'-g','LineWidth',1.5);
            loglog([controltype.termination.branchorder.branchorder],[controltype.termination.branchorder.length.total],'-r','LineWidth',1.5);
            loglog([testtype.bifurcation.branchorder.branchorder],[testtype.bifurcation.branchorder.numbersegments.total],'-sy','LineWidth',1.5,'MarkerEdgeColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
            loglog([testtype.termination.branchorder.branchorder],[testtype.termination.branchorder.numbersegments.total],'-dm','LineWidth',1.5,'MarkerEdgeColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
            loglog([testtype.bifurcation.branchorder.branchorder],[testtype.bifurcation.branchorder.length.total],'-y','LineWidth',1.5);
            loglog([testtype.termination.branchorder.branchorder],[testtype.termination.branchorder.length.total],'-m','LineWidth',1.5);
        end
        set(gca,'FontSize',axesfontsize);
        set(gca,'YScale','log');
        set(gca,'XScale','log');
        legendhandle = gca;
        hold off;
        
        
        subplot(3,4,5);
        box on;
        hold on;
        ylabel('Probability (Semi-Log)','FontSize',labelfontsize,'FontWeight','b');
        if nargin ==1
            semilogy([controltype.bifurcation.diameter.diameter],[controltype.bifurcation.diameter.bifurcationprobability.length],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
            semilogy([controltype.termination.diameter.diameter],[controltype.termination.diameter.terminationprobability.length],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
        else
            semilogy([controltype.bifurcation.diameter.diameter],[controltype.bifurcation.diameter.bifurcationprobability.length],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
            semilogy([controltype.termination.diameter.diameter],[controltype.termination.diameter.terminationprobability.length],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
            semilogy([testtype.bifurcation.diameter.diameter],[testtype.bifurcation.diameter.bifurcationprobability.length],'sy','MarkerFaceColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
            semilogy([testtype.termination.diameter.diameter],[testtype.termination.diameter.terminationprobability.length],'dm','MarkerFaceColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
        end
        set(gca,'FontSize',axesfontsize);
        set(gca,'YScale','log');
        hold off;
        
        
        subplot(3,4,6);
        box on;
        hold on;
        if nargin == 1
            semilogy([controltype.bifurcation.pathlength.pathlength],[controltype.bifurcation.pathlength.bifurcationprobability.length],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
            semilogy([controltype.termination.pathlength.pathlength],[controltype.termination.pathlength.terminationprobability.length],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
        else
            semilogy([controltype.bifurcation.pathlength.pathlength],[controltype.bifurcation.pathlength.bifurcationprobability.length],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
            semilogy([controltype.termination.pathlength.pathlength],[controltype.termination.pathlength.terminationprobability.length],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
            semilogy([testtype.bifurcation.pathlength.pathlength],[testtype.bifurcation.pathlength.bifurcationprobability.length],'sy','MarkerFaceColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
            semilogy([testtype.termination.pathlength.pathlength],[testtype.termination.pathlength.terminationprobability.length],'dm','MarkerFaceColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
        end
        set(gca,'FontSize',axesfontsize);
        set(gca,'YScale','log');
        hold off;
        
        
        subplot(3,4,7);
        box on;
        hold on;
        if nargin == 1
            semilogy([controltype.bifurcation.branchlength.branchlength],[controltype.bifurcation.branchlength.bifurcationprobability.length],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
            semilogy([controltype.termination.branchlength.branchlength],[controltype.termination.branchlength.terminationprobability.length],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
        else
            semilogy([controltype.bifurcation.branchlength.branchlength],[controltype.bifurcation.branchlength.bifurcationprobability.length],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
            semilogy([controltype.termination.branchlength.branchlength],[controltype.termination.branchlength.terminationprobability.length],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
            semilogy([testtype.bifurcation.branchlength.branchlength],[testtype.bifurcation.branchlength.bifurcationprobability.length],'sy','MarkerFaceColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
            semilogy([testtype.termination.branchlength.branchlength],[testtype.termination.branchlength.terminationprobability.length],'dm','MarkerFaceColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
        end
        set(gca,'FontSize',axesfontsize);
        set(gca,'YScale','log');
        hold off;
        
        
        subplot(3,4,8);
        box on;
        hold on;
        if nargin == 1
            semilogy([controltype.bifurcation.branchorder.branchorder],[controltype.bifurcation.branchorder.bifurcationprobability.length],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
            semilogy([controltype.termination.branchorder.branchorder],[controltype.termination.branchorder.terminationprobability.length],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
        else
            semilogy([controltype.bifurcation.branchorder.branchorder],[controltype.bifurcation.branchorder.bifurcationprobability.length],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
            semilogy([controltype.termination.branchorder.branchorder],[controltype.termination.branchorder.terminationprobability.length],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
            semilogy([testtype.bifurcation.branchorder.branchorder],[testtype.bifurcation.branchorder.bifurcationprobability.length],'sy','MarkerFaceColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
            semilogy([testtype.termination.branchorder.branchorder],[testtype.termination.branchorder.terminationprobability.length],'dm','MarkerFaceColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
        end
        set(gca,'FontSize',axesfontsize);
        set(gca,'YScale','log');
        hold off;
        
        
        subplot(3,4,9);
        box on;
        hold on;
        xlabel('Diameter','FontSize',labelfontsize,'FontWeight','b');
        ylabel('Probability (Log-Log)','FontSize',labelfontsize,'FontWeight','b');
        if nargin == 1
            loglog([controltype.bifurcation.diameter.diameter],[controltype.bifurcation.diameter.bifurcationprobability.length],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
            loglog([controltype.termination.diameter.diameter],[controltype.termination.diameter.terminationprobability.length],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
        else
            loglog([controltype.bifurcation.diameter.diameter],[controltype.bifurcation.diameter.bifurcationprobability.length],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
            loglog([controltype.termination.diameter.diameter],[controltype.termination.diameter.terminationprobability.length],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
            loglog([testtype.bifurcation.diameter.diameter],[testtype.bifurcation.diameter.bifurcationprobability.length],'sy','MarkerFaceColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
            loglog([testtype.termination.diameter.diameter],[testtype.termination.diameter.terminationprobability.length],'dm','MarkerFaceColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
        end
        set(gca,'FontSize',axesfontsize);
        set(gca,'YScale','log');
        set(gca,'XScale','log');
        hold off;
        
        
        subplot(3,4,10);
        box on;
        hold on;
        xlabel('Path Length','FontSize',labelfontsize,'FontWeight','b');
        if nargin == 1
            loglog([controltype.bifurcation.pathlength.pathlength],[controltype.bifurcation.pathlength.bifurcationprobability.length],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
            loglog([controltype.termination.pathlength.pathlength],[controltype.termination.pathlength.terminationprobability.length],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
        else
            loglog([controltype.bifurcation.pathlength.pathlength],[controltype.bifurcation.pathlength.bifurcationprobability.length],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
            loglog([controltype.termination.pathlength.pathlength],[controltype.termination.pathlength.terminationprobability.length],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
            loglog([testtype.bifurcation.pathlength.pathlength],[testtype.bifurcation.pathlength.bifurcationprobability.length],'sy','MarkerFaceColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
            loglog([testtype.termination.pathlength.pathlength],[testtype.termination.pathlength.terminationprobability.length],'dm','MarkerFaceColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
        end
        set(gca,'FontSize',axesfontsize); 
        set(gca,'YScale','log');
        set(gca,'XScale','log');
        hold off;
        
        
        subplot(3,4,11);
        box on;
        hold on;
        xlabel('Branch Length','FontSize',labelfontsize,'FontWeight','b');
        if nargin == 1
            loglog([controltype.bifurcation.branchlength.branchlength],[controltype.bifurcation.branchlength.bifurcationprobability.length],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
            loglog([controltype.termination.branchlength.branchlength],[controltype.termination.branchlength.terminationprobability.length],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
        else
            loglog([controltype.bifurcation.branchlength.branchlength],[controltype.bifurcation.branchlength.bifurcationprobability.length],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
            loglog([controltype.termination.branchlength.branchlength],[controltype.termination.branchlength.terminationprobability.length],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
            loglog([testtype.bifurcation.branchlength.branchlength],[testtype.bifurcation.branchlength.bifurcationprobability.length],'sy','MarkerFaceColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
            loglog([testtype.termination.branchlength.branchlength],[testtype.termination.branchlength.terminationprobability.length],'dm','MarkerFaceColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
        end
        set(gca,'FontSize',axesfontsize);
        set(gca,'YScale','log');
        set(gca,'XScale','log');
        hold off;
        
        
        subplot(3,4,12);
        box on;
        hold on;
        xlabel('Branch Order','FontSize',labelfontsize,'FontWeight','b');
        if nargin == 1
            loglog([controltype.bifurcation.branchorder.branchorder],[controltype.bifurcation.branchorder.bifurcationprobability.length],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
            loglog([controltype.termination.branchorder.branchorder],[controltype.termination.branchorder.terminationprobability.length],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
        else
            loglog([controltype.bifurcation.branchorder.branchorder],[controltype.bifurcation.branchorder.bifurcationprobability.length],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
            loglog([controltype.termination.branchorder.branchorder],[controltype.termination.branchorder.terminationprobability.length],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
            loglog([testtype.bifurcation.branchorder.branchorder],[testtype.bifurcation.branchorder.bifurcationprobability.length],'sy','MarkerFaceColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
            loglog([testtype.termination.branchorder.branchorder],[testtype.termination.branchorder.terminationprobability.length],'dm','MarkerFaceColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
        end
        set(gca,'FontSize',axesfontsize);
        set(gca,'YScale','log');
        set(gca,'XScale','log');
        hold off;
        
        
        currentdirectory = cd;
        %%subplotspace('horizontal',-5);
        %%subplotspace('vertical',-15);
        
        if nargin == 1
            [ignore,h]=suplabel([controlanalysis.inputfilename ' -- ' currentpiecetitle ' Branch Ending Probability by Length']  ,'t');
            set(h,'FontSize',titlefontsize);
            legend(legendhandle,[controlanalysis.inputfilename ' #Bifs'],[controlanalysis.inputfilename ' #Terms'],[controlanalysis.inputfilename ' Bif Length'],[controlanalysis.inputfilename ' Term Length']);
            cd(controlanalysis.datapathname);
            if exist(piecetypes{piecetype},'dir') ~= 7
                mkdir(piecetypes{piecetype});
            end
            cd(piecetypes{piecetype});
            if exist('figures','dir') ~= 7
                mkdir('figures');
            end
            cd('figures');
            filename = sprintf('%s_%s_05_1_End_Prob_Length',controlanalysis.inputfilename,currentpiecetype);
        else
            [ignore,h]=suplabel([controlanalysis.inputfilename ' vs ' testanalysis.inputfilename ' -- ' currentpiecetitle ' Branch Ending Probability by Length']  ,'t');
            set(h,'FontSize',titlefontsize);
            legend(legendhandle,[controlanalysis.inputfilename ' #Bifs'],[controlanalysis.inputfilename ' #Terms'],[controlanalysis.inputfilename ' Bif Length'],[controlanalysis.inputfilename ' Term Length'],[testanalysis.inputfilename ' #Bifs'],[testanalysis.inputfilename ' #Terms'],[testanalysis.inputfilename ' Bif Length'],[testanalysis.inputfilename ' Term Length']);
            cd(testanalysis.datapathname);
            cd ..
            if exist(sprintf('%s_%s_comparison',controlanalysis.inputfilename,testanalysis.inputfilename),'dir') ~= 7;
                mkdir(sprintf('%s_%s_comparison',controlanalysis.inputfilename,testanalysis.inputfilename));
            end
            cd(sprintf('%s_%s_comparison',controlanalysis.inputfilename,testanalysis.inputfilename));
            if exist(piecetypes{piecetype},'dir') ~= 7
                mkdir(piecetypes{piecetype});
            end
            cd(piecetypes{piecetype});
            filename = sprintf('%s_%s_%s_05_1_End_Prob_Length',controlanalysis.inputfilename,testanalysis.inputfilename,currentpiecetype);
        end
        
        print('-djpeg',filename);
        if strcmp(option.mnfigures.matfig,'y')
                saveas(gcf,filename,'fig');
        end
        
        cd(currentdirectory);
        
    end
end



% By Surface Area
for piecetype = 2:4
    
    if nargin == 1
        goahead = true;
    else
        if isfield(testanalysis,piecetypes{piecetype})
            goahead = true;
        else
            goahead = false;
        end
    end
    
    if isfield(controlanalysis,piecetypes{piecetype}) && goahead
        
        currentpiecetype = piecetypes{piecetype};
        currentpiecetitle = piecetitles{piecetype};
        eval(['controltype = controlanalysis.' currentpiecetype ';']);
        if nargin > 1
            eval(['testtype = testanalysis.' currentpiecetype ';']);
        end
        
        figure;
        
        
        subplot(3,4,1);
        box on;
        hold on;
        ylabel('# of Endings      Surface Area','FontSize',labelfontsize,'FontWeight','b');
        if nargin == 1
            loglog([controltype.bifurcation.diameter.diameter],[controltype.bifurcation.diameter.numberbifurcations.total],'sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize)
            loglog([controltype.termination.diameter.diameter],[controltype.termination.diameter.numberterminations.total],'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize)
            loglog([controltype.bifurcation.diameter.diameter],[controltype.bifurcation.diameter.surfacearea.total],'-g','LineWidth',1.5);
            loglog([controltype.termination.diameter.diameter],[controltype.termination.diameter.surfacearea.total],'-r','LineWidth',1.5);
        else
            loglog([controltype.bifurcation.diameter.diameter],[controltype.bifurcation.diameter.numberbifurcations.total],'sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize)
            loglog([controltype.termination.diameter.diameter],[controltype.termination.diameter.numberterminations.total],'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize)
            loglog([controltype.bifurcation.diameter.diameter],[controltype.bifurcation.diameter.surfacearea.total],'-g','LineWidth',1.5);
            loglog([controltype.termination.diameter.diameter],[controltype.termination.diameter.surfacearea.total],'-r','LineWidth',1.5);
            loglog([testtype.bifurcation.diameter.diameter],[testtype.bifurcation.diameter.numberbifurcations.total],'-sy','LineWidth',1.5,'MarkerEdgeColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize)
            loglog([testtype.termination.diameter.diameter],[testtype.termination.diameter.numberterminations.total],'-dm','LineWidth',1.5,'MarkerEdgeColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize)
            loglog([testtype.bifurcation.diameter.diameter],[testtype.bifurcation.diameter.surfacearea.total],'-y','LineWidth',1.5);
            loglog([testtype.termination.diameter.diameter],[testtype.termination.diameter.surfacearea.total],'-m','LineWidth',1.5);
        end
        set(gca,'FontSize',axesfontsize);
        set(gca,'YScale','log');
        set(gca,'XScale','log');
        %legendhandle = gca;
        hold off;
        
        
        subplot(3,4,2);
        box on;
        hold on;
        if nargin == 1
            loglog([controltype.bifurcation.pathlength.pathlength],[controltype.bifurcation.pathlength.numberbifurcations.total],'sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize)
            loglog([controltype.termination.pathlength.pathlength],[controltype.termination.pathlength.numberterminations.total],'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
            loglog([controltype.bifurcation.pathlength.pathlength],[controltype.bifurcation.pathlength.surfacearea.total],'-g','LineWidth',1.5);
            loglog([controltype.termination.pathlength.pathlength],[controltype.termination.pathlength.surfacearea.total],'-r','LineWidth',1.5);
        else
            loglog([controltype.bifurcation.pathlength.pathlength],[controltype.bifurcation.pathlength.numberbifurcations.total],'sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize)
            loglog([controltype.termination.pathlength.pathlength],[controltype.termination.pathlength.numberterminations.total],'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
            loglog([controltype.bifurcation.pathlength.pathlength],[controltype.bifurcation.pathlength.surfacearea.total],'-g','LineWidth',1.5);
            loglog([controltype.termination.pathlength.pathlength],[controltype.termination.pathlength.surfacearea.total],'-r','LineWidth',1.5);
            loglog([testtype.bifurcation.pathlength.pathlength],[testtype.bifurcation.pathlength.numberbifurcations.total],'-sy','LineWidth',1.5,'MarkerEdgeColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize)
            loglog([testtype.termination.pathlength.pathlength],[testtype.termination.pathlength.numberterminations.total],'-dm','LineWidth',1.5,'MarkerEdgeColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
            loglog([testtype.bifurcation.pathlength.pathlength],[testtype.bifurcation.pathlength.surfacearea.total],'-y','LineWidth',1.5);
            loglog([testtype.termination.pathlength.pathlength],[testtype.termination.pathlength.surfacearea.total],'-m','LineWidth',1.5);
        end
        set(gca,'FontSize',axesfontsize);
        set(gca,'YScale','log');
        set(gca,'XScale','log');
        hold off;
        
        
        subplot(3,4,3);
        box on;
        hold on;
        if nargin == 1
            loglog([controltype.bifurcation.branchlength.branchlength],[controltype.bifurcation.branchlength.numberbifurcations.total],'sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
            loglog([controltype.termination.branchlength.branchlength],[controltype.termination.branchlength.numberterminations.total],'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
            loglog([controltype.bifurcation.branchlength.branchlength],[controltype.bifurcation.branchlength.surfacearea.total],'-g','LineWidth',1.5);
            loglog([controltype.termination.branchlength.branchlength],[controltype.termination.branchlength.surfacearea.total],'-r','LineWidth',1.5);
        else
            loglog([controltype.bifurcation.branchlength.branchlength],[controltype.bifurcation.branchlength.numberbifurcations.total],'sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
            loglog([controltype.termination.branchlength.branchlength],[controltype.termination.branchlength.numberterminations.total],'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
            loglog([controltype.bifurcation.branchlength.branchlength],[controltype.bifurcation.branchlength.surfacearea.total],'-g','LineWidth',1.5); 
            loglog([controltype.termination.branchlength.branchlength],[controltype.termination.branchlength.surfacearea.total],'-r','LineWidth',1.5); 
            loglog([testtype.bifurcation.branchlength.branchlength],[testtype.bifurcation.branchlength.numberbifurcations.total],'-sy','LineWidth',1.5,'MarkerEdgeColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
            loglog([testtype.termination.branchlength.branchlength],[testtype.termination.branchlength.numberterminations.total],'-dm','LineWidth',1.5,'MarkerEdgeColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
            loglog([testtype.bifurcation.branchlength.branchlength],[testtype.bifurcation.branchlength.surfacearea.total],'-y','LineWidth',1.5); 
            loglog([testtype.termination.branchlength.branchlength],[testtype.termination.branchlength.surfacearea.total],'-m','LineWidth',1.5); 
        end
        set(gca,'FontSize',axesfontsize); 
        set(gca,'YScale','log');
        set(gca,'XScale','log');
        hold off;
        
        
        subplot(3,4,4);
        box on;
        hold on;
        if nargin ==1
            loglog([controltype.bifurcation.branchorder.branchorder],[controltype.bifurcation.branchorder.numbersegments.total],'sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
            loglog([controltype.termination.branchorder.branchorder],[controltype.termination.branchorder.numbersegments.total],'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
            loglog([controltype.bifurcation.branchorder.branchorder],[controltype.bifurcation.branchorder.surfacearea.total],'-g','LineWidth',1.5);
            loglog([controltype.termination.branchorder.branchorder],[controltype.termination.branchorder.surfacearea.total],'-r','LineWidth',1.5);
        else
            loglog([controltype.bifurcation.branchorder.branchorder],[controltype.bifurcation.branchorder.numbersegments.total],'sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
            loglog([controltype.termination.branchorder.branchorder],[controltype.termination.branchorder.numbersegments.total],'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
            loglog([controltype.bifurcation.branchorder.branchorder],[controltype.bifurcation.branchorder.surfacearea.total],'-g','LineWidth',1.5);
            loglog([controltype.termination.branchorder.branchorder],[controltype.termination.branchorder.surfacearea.total],'-r','LineWidth',1.5);
            loglog([testtype.bifurcation.branchorder.branchorder],[testtype.bifurcation.branchorder.numbersegments.total],'-sy','LineWidth',1.5,'MarkerEdgeColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
            loglog([testtype.termination.branchorder.branchorder],[testtype.termination.branchorder.numbersegments.total],'-dm','LineWidth',1.5,'MarkerEdgeColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
            loglog([testtype.bifurcation.branchorder.branchorder],[testtype.bifurcation.branchorder.surfacearea.total],'-y','LineWidth',1.5);
            loglog([testtype.termination.branchorder.branchorder],[testtype.termination.branchorder.surfacearea.total],'-m','LineWidth',1.5);
        end
        set(gca,'FontSize',axesfontsize);
        set(gca,'YScale','log');
        set(gca,'XScale','log');
        legendhandle = gca;
        hold off;
        
        
        subplot(3,4,5);
        box on;
        hold on;
        ylabel('Probability (Semi-Log)','FontSize',labelfontsize,'FontWeight','b');
        if nargin ==1
            semilogy([controltype.bifurcation.diameter.diameter],[controltype.bifurcation.diameter.bifurcationprobability.surfacearea],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
            semilogy([controltype.termination.diameter.diameter],[controltype.termination.diameter.terminationprobability.surfacearea],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
        else
            semilogy([controltype.bifurcation.diameter.diameter],[controltype.bifurcation.diameter.bifurcationprobability.surfacearea],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
            semilogy([controltype.termination.diameter.diameter],[controltype.termination.diameter.terminationprobability.surfacearea],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
            semilogy([testtype.bifurcation.diameter.diameter],[testtype.bifurcation.diameter.bifurcationprobability.surfacearea],'sy','MarkerFaceColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
            semilogy([testtype.termination.diameter.diameter],[testtype.termination.diameter.terminationprobability.surfacearea],'dm','MarkerFaceColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
        end
        set(gca,'FontSize',axesfontsize);
        set(gca,'YScale','log');
        hold off;
        
        
        subplot(3,4,6);
        box on;
        hold on;
        if nargin == 1
            semilogy([controltype.bifurcation.pathlength.pathlength],[controltype.bifurcation.pathlength.bifurcationprobability.surfacearea],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
            semilogy([controltype.termination.pathlength.pathlength],[controltype.termination.pathlength.terminationprobability.surfacearea],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
        else
            semilogy([controltype.bifurcation.pathlength.pathlength],[controltype.bifurcation.pathlength.bifurcationprobability.surfacearea],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
            semilogy([controltype.termination.pathlength.pathlength],[controltype.termination.pathlength.terminationprobability.surfacearea],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
            semilogy([testtype.bifurcation.pathlength.pathlength],[testtype.bifurcation.pathlength.bifurcationprobability.surfacearea],'sy','MarkerFaceColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
            semilogy([testtype.termination.pathlength.pathlength],[testtype.termination.pathlength.terminationprobability.surfacearea],'dm','MarkerFaceColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
        end
        set(gca,'FontSize',axesfontsize);
        set(gca,'YScale','log');
        hold off;
        
        
        subplot(3,4,7);
        box on;
        hold on;
        if nargin == 1
            semilogy([controltype.bifurcation.branchlength.branchlength],[controltype.bifurcation.branchlength.bifurcationprobability.surfacearea],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
            semilogy([controltype.termination.branchlength.branchlength],[controltype.termination.branchlength.terminationprobability.surfacearea],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
        else
            semilogy([controltype.bifurcation.branchlength.branchlength],[controltype.bifurcation.branchlength.bifurcationprobability.surfacearea],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
            semilogy([controltype.termination.branchlength.branchlength],[controltype.termination.branchlength.terminationprobability.surfacearea],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
            semilogy([testtype.bifurcation.branchlength.branchlength],[testtype.bifurcation.branchlength.bifurcationprobability.surfacearea],'sy','MarkerFaceColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
            semilogy([testtype.termination.branchlength.branchlength],[testtype.termination.branchlength.terminationprobability.surfacearea],'dm','MarkerFaceColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
        end
        set(gca,'FontSize',axesfontsize);
        set(gca,'YScale','log');
        hold off;
        
        
        subplot(3,4,8);
        box on;
        hold on;
        if nargin == 1
            semilogy([controltype.bifurcation.branchorder.branchorder],[controltype.bifurcation.branchorder.bifurcationprobability.surfacearea],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
            semilogy([controltype.termination.branchorder.branchorder],[controltype.termination.branchorder.terminationprobability.surfacearea],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
        else
            semilogy([controltype.bifurcation.branchorder.branchorder],[controltype.bifurcation.branchorder.bifurcationprobability.surfacearea],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
            semilogy([controltype.termination.branchorder.branchorder],[controltype.termination.branchorder.terminationprobability.surfacearea],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
            semilogy([testtype.bifurcation.branchorder.branchorder],[testtype.bifurcation.branchorder.bifurcationprobability.surfacearea],'sy','MarkerFaceColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
            semilogy([testtype.termination.branchorder.branchorder],[testtype.termination.branchorder.terminationprobability.surfacearea],'dm','MarkerFaceColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
        end
        set(gca,'FontSize',axesfontsize);
        set(gca,'YScale','log');
        hold off;
        
        
        subplot(3,4,9);
        box on;
        hold on;
        xlabel('Diameter','FontSize',labelfontsize,'FontWeight','b');
        ylabel('Probability (Log-Log)','FontSize',labelfontsize,'FontWeight','b');
        if nargin == 1
            loglog([controltype.bifurcation.diameter.diameter],[controltype.bifurcation.diameter.bifurcationprobability.surfacearea],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
            loglog([controltype.termination.diameter.diameter],[controltype.termination.diameter.terminationprobability.surfacearea],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
        else
            loglog([controltype.bifurcation.diameter.diameter],[controltype.bifurcation.diameter.bifurcationprobability.surfacearea],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
            loglog([controltype.termination.diameter.diameter],[controltype.termination.diameter.terminationprobability.surfacearea],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
            loglog([testtype.bifurcation.diameter.diameter],[testtype.bifurcation.diameter.bifurcationprobability.surfacearea],'sy','MarkerFaceColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
            loglog([testtype.termination.diameter.diameter],[testtype.termination.diameter.terminationprobability.surfacearea],'dm','MarkerFaceColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
        end
        set(gca,'FontSize',axesfontsize);
        set(gca,'YScale','log');
        set(gca,'XScale','log');
        hold off;
        
        
        subplot(3,4,10);
        box on;
        hold on;
        xlabel('Path Length','FontSize',labelfontsize,'FontWeight','b');
        if nargin == 1
            loglog([controltype.bifurcation.pathlength.pathlength],[controltype.bifurcation.pathlength.bifurcationprobability.surfacearea],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
            loglog([controltype.termination.pathlength.pathlength],[controltype.termination.pathlength.terminationprobability.surfacearea],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
        else
            loglog([controltype.bifurcation.pathlength.pathlength],[controltype.bifurcation.pathlength.bifurcationprobability.surfacearea],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
            loglog([controltype.termination.pathlength.pathlength],[controltype.termination.pathlength.terminationprobability.surfacearea],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
            loglog([testtype.bifurcation.pathlength.pathlength],[testtype.bifurcation.pathlength.bifurcationprobability.surfacearea],'sy','MarkerFaceColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
            loglog([testtype.termination.pathlength.pathlength],[testtype.termination.pathlength.terminationprobability.surfacearea],'dm','MarkerFaceColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
        end
        set(gca,'FontSize',axesfontsize); 
        set(gca,'YScale','log');
        set(gca,'XScale','log');
        hold off;
        
        
        subplot(3,4,11);
        box on;
        hold on;
        xlabel('Branch Length','FontSize',labelfontsize,'FontWeight','b');
        if nargin == 1
            loglog([controltype.bifurcation.branchlength.branchlength],[controltype.bifurcation.branchlength.bifurcationprobability.surfacearea],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
            loglog([controltype.termination.branchlength.branchlength],[controltype.termination.branchlength.terminationprobability.surfacearea],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
        else
            loglog([controltype.bifurcation.branchlength.branchlength],[controltype.bifurcation.branchlength.bifurcationprobability.surfacearea],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
            loglog([controltype.termination.branchlength.branchlength],[controltype.termination.branchlength.terminationprobability.surfacearea],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
            loglog([testtype.bifurcation.branchlength.branchlength],[testtype.bifurcation.branchlength.bifurcationprobability.surfacearea],'sy','MarkerFaceColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
            loglog([testtype.termination.branchlength.branchlength],[testtype.termination.branchlength.terminationprobability.surfacearea],'dm','MarkerFaceColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
        end
        set(gca,'FontSize',axesfontsize);
        set(gca,'YScale','log');
        set(gca,'XScale','log');
        hold off;
        
        
        subplot(3,4,12);
        box on;
        hold on;
        xlabel('Branch Order','FontSize',labelfontsize,'FontWeight','b');
        if nargin == 1
            loglog([controltype.bifurcation.branchorder.branchorder],[controltype.bifurcation.branchorder.bifurcationprobability.surfacearea],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
            loglog([controltype.termination.branchorder.branchorder],[controltype.termination.branchorder.terminationprobability.surfacearea],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
        else
            loglog([controltype.bifurcation.branchorder.branchorder],[controltype.bifurcation.branchorder.bifurcationprobability.surfacearea],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
            loglog([controltype.termination.branchorder.branchorder],[controltype.termination.branchorder.terminationprobability.surfacearea],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
            loglog([testtype.bifurcation.branchorder.branchorder],[testtype.bifurcation.branchorder.bifurcationprobability.surfacearea],'sy','MarkerFaceColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
            loglog([testtype.termination.branchorder.branchorder],[testtype.termination.branchorder.terminationprobability.surfacearea],'dm','MarkerFaceColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
        end
        set(gca,'FontSize',axesfontsize);
        set(gca,'YScale','log');
        set(gca,'XScale','log');
        hold off;
        
        
        currentdirectory = cd;
        %%subplotspace('horizontal',-5);
        %%subplotspace('vertical',-15);
        
        if nargin == 1
            [ignore,h]=suplabel([controlanalysis.inputfilename ' -- ' currentpiecetitle ' Branch Ending Probability by Surface Area']  ,'t');
            set(h,'FontSize',titlefontsize);
            legend(legendhandle,[controlanalysis.inputfilename ' #Bifs'],[controlanalysis.inputfilename ' #Terms'],[controlanalysis.inputfilename ' Bif SA'],[controlanalysis.inputfilename ' Term SA']);
            cd(controlanalysis.datapathname);
            if exist(piecetypes{piecetype},'dir') ~= 7
                mkdir(piecetypes{piecetype});
            end
            cd(piecetypes{piecetype});
            if exist('figures','dir') ~= 7
                mkdir('figures');
            end
            cd('figures');
            filename = sprintf('%s_%s_05_2_End_Prob_SA',controlanalysis.inputfilename,currentpiecetype);
        else
            [ignore,h]=suplabel([controlanalysis.inputfilename ' vs ' testanalysis.inputfilename ' -- ' currentpiecetitle ' Branch Ending Probability by Surface Area']  ,'t');
            set(h,'FontSize',titlefontsize);
            legend(legendhandle,[controlanalysis.inputfilename ' #Bifs'],[controlanalysis.inputfilename ' #Terms'],[controlanalysis.inputfilename ' Bif SA'],[controlanalysis.inputfilename ' Term SA'],[testanalysis.inputfilename ' #Bifs'],[testanalysis.inputfilename ' #Terms'],[testanalysis.inputfilename ' Bif SA'],[testanalysis.inputfilename ' Term SA']);
            cd(testanalysis.datapathname);
            cd ..
            if exist(sprintf('%s_%s_comparison',controlanalysis.inputfilename,testanalysis.inputfilename),'dir') ~= 7;
                mkdir(sprintf('%s_%s_comparison',controlanalysis.inputfilename,testanalysis.inputfilename));
            end
            cd(sprintf('%s_%s_comparison',controlanalysis.inputfilename,testanalysis.inputfilename));
            if exist(piecetypes{piecetype},'dir') ~= 7
                mkdir(piecetypes{piecetype});
            end
            cd(piecetypes{piecetype});
            filename = sprintf('%s_%s_%s_05_2_End_Prob_SA',controlanalysis.inputfilename,testanalysis.inputfilename,currentpiecetype);
        end
        
        print('-djpeg',filename);
        if strcmp(option.mnfigures.matfig,'y')
                saveas(gcf,filename,'fig');
        end
        
        cd(currentdirectory);
        
    end
end



%By Volume
for piecetype = 2:4
    
    if nargin == 1
        goahead = true;
    else
        if isfield(testanalysis,piecetypes{piecetype})
            goahead = true;
        else
            goahead = false;
        end
    end
    
    if isfield(controlanalysis,piecetypes{piecetype}) && goahead
        
        currentpiecetype = piecetypes{piecetype};
        currentpiecetitle = piecetitles{piecetype};
        eval(['controltype = controlanalysis.' currentpiecetype ';']);
        if nargin > 1
            eval(['testtype = testanalysis.' currentpiecetype ';']);
        end
        
        figure;
        
        
        subplot(3,4,1);
        box on;
        hold on;
        ylabel('# of Endings      Volume','FontSize',labelfontsize,'FontWeight','b');
        if nargin == 1
            loglog([controltype.bifurcation.diameter.diameter],[controltype.bifurcation.diameter.numberbifurcations.total],'sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize)
            loglog([controltype.termination.diameter.diameter],[controltype.termination.diameter.numberterminations.total],'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize)
            loglog([controltype.bifurcation.diameter.diameter],[controltype.bifurcation.diameter.volume.total],'-g','LineWidth',1.5);
            loglog([controltype.termination.diameter.diameter],[controltype.termination.diameter.volume.total],'-r','LineWidth',1.5);
        else
            loglog([controltype.bifurcation.diameter.diameter],[controltype.bifurcation.diameter.numberbifurcations.total],'sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize)
            loglog([controltype.termination.diameter.diameter],[controltype.termination.diameter.numberterminations.total],'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize)
            loglog([controltype.bifurcation.diameter.diameter],[controltype.bifurcation.diameter.volume.total],'-g','LineWidth',1.5);
            loglog([controltype.termination.diameter.diameter],[controltype.termination.diameter.volume.total],'-r','LineWidth',1.5);
            loglog([testtype.bifurcation.diameter.diameter],[testtype.bifurcation.diameter.numberbifurcations.total],'-sy','LineWidth',1.5,'MarkerEdgeColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize)
            loglog([testtype.termination.diameter.diameter],[testtype.termination.diameter.numberterminations.total],'-dm','LineWidth',1.5,'MarkerEdgeColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize)
            loglog([testtype.bifurcation.diameter.diameter],[testtype.bifurcation.diameter.volume.total],'-y','LineWidth',1.5);
            loglog([testtype.termination.diameter.diameter],[testtype.termination.diameter.volume.total],'-m','LineWidth',1.5);
        end
        set(gca,'FontSize',axesfontsize);
        set(gca,'YScale','log');
        set(gca,'XScale','log');
        %legendhandle = gca;
        hold off;
        
        
        subplot(3,4,2);
        box on;
        hold on;
        if nargin == 1
            loglog([controltype.bifurcation.pathlength.pathlength],[controltype.bifurcation.pathlength.numberbifurcations.total],'sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize)
            loglog([controltype.termination.pathlength.pathlength],[controltype.termination.pathlength.numberterminations.total],'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
            loglog([controltype.bifurcation.pathlength.pathlength],[controltype.bifurcation.pathlength.volume.total],'-g','LineWidth',1.5);
            loglog([controltype.termination.pathlength.pathlength],[controltype.termination.pathlength.volume.total],'-r','LineWidth',1.5);
        else
            loglog([controltype.bifurcation.pathlength.pathlength],[controltype.bifurcation.pathlength.numberbifurcations.total],'sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize)
            loglog([controltype.termination.pathlength.pathlength],[controltype.termination.pathlength.numberterminations.total],'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
            loglog([controltype.bifurcation.pathlength.pathlength],[controltype.bifurcation.pathlength.volume.total],'-g','LineWidth',1.5);
            loglog([controltype.termination.pathlength.pathlength],[controltype.termination.pathlength.volume.total],'-r','LineWidth',1.5);
            loglog([testtype.bifurcation.pathlength.pathlength],[testtype.bifurcation.pathlength.numberbifurcations.total],'-sy','LineWidth',1.5,'MarkerEdgeColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize)
            loglog([testtype.termination.pathlength.pathlength],[testtype.termination.pathlength.numberterminations.total],'-dm','LineWidth',1.5,'MarkerEdgeColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
            loglog([testtype.bifurcation.pathlength.pathlength],[testtype.bifurcation.pathlength.volume.total],'-y','LineWidth',1.5);
            loglog([testtype.termination.pathlength.pathlength],[testtype.termination.pathlength.volume.total],'-m','LineWidth',1.5);
        end
        set(gca,'FontSize',axesfontsize);
        set(gca,'YScale','log');
        set(gca,'XScale','log');
        hold off;
        
        
        subplot(3,4,3);
        box on;
        hold on;
        if nargin == 1
            loglog([controltype.bifurcation.branchlength.branchlength],[controltype.bifurcation.branchlength.numberbifurcations.total],'sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
            loglog([controltype.termination.branchlength.branchlength],[controltype.termination.branchlength.numberterminations.total],'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
            loglog([controltype.bifurcation.branchlength.branchlength],[controltype.bifurcation.branchlength.volume.total],'-g','LineWidth',1.5);
            loglog([controltype.termination.branchlength.branchlength],[controltype.termination.branchlength.volume.total],'-r','LineWidth',1.5);
        else
            loglog([controltype.bifurcation.branchlength.branchlength],[controltype.bifurcation.branchlength.numberbifurcations.total],'sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
            loglog([controltype.termination.branchlength.branchlength],[controltype.termination.branchlength.numberterminations.total],'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
            loglog([controltype.bifurcation.branchlength.branchlength],[controltype.bifurcation.branchlength.volume.total],'-g','LineWidth',1.5); 
            loglog([controltype.termination.branchlength.branchlength],[controltype.termination.branchlength.volume.total],'-r','LineWidth',1.5); 
            loglog([testtype.bifurcation.branchlength.branchlength],[testtype.bifurcation.branchlength.numberbifurcations.total],'-sy','LineWidth',1.5,'MarkerEdgeColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
            loglog([testtype.termination.branchlength.branchlength],[testtype.termination.branchlength.numberterminations.total],'-dm','LineWidth',1.5,'MarkerEdgeColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
            loglog([testtype.bifurcation.branchlength.branchlength],[testtype.bifurcation.branchlength.volume.total],'-y','LineWidth',1.5); 
            loglog([testtype.termination.branchlength.branchlength],[testtype.termination.branchlength.volume.total],'-m','LineWidth',1.5); 
        end
        set(gca,'FontSize',axesfontsize); 
        set(gca,'YScale','log');
        set(gca,'XScale','log');
        hold off;
        
        
        subplot(3,4,4);
        box on;
        hold on;
        if nargin ==1
            loglog([controltype.bifurcation.branchorder.branchorder],[controltype.bifurcation.branchorder.numbersegments.total],'sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
            loglog([controltype.termination.branchorder.branchorder],[controltype.termination.branchorder.numbersegments.total],'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
            loglog([controltype.bifurcation.branchorder.branchorder],[controltype.bifurcation.branchorder.volume.total],'-g','LineWidth',1.5);
            loglog([controltype.termination.branchorder.branchorder],[controltype.termination.branchorder.volume.total],'-r','LineWidth',1.5);
        else
            loglog([controltype.bifurcation.branchorder.branchorder],[controltype.bifurcation.branchorder.numbersegments.total],'sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
            loglog([controltype.termination.branchorder.branchorder],[controltype.termination.branchorder.numbersegments.total],'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
            loglog([controltype.bifurcation.branchorder.branchorder],[controltype.bifurcation.branchorder.volume.total],'-g','LineWidth',1.5);
            loglog([controltype.termination.branchorder.branchorder],[controltype.termination.branchorder.volume.total],'-r','LineWidth',1.5);
            loglog([testtype.bifurcation.branchorder.branchorder],[testtype.bifurcation.branchorder.numbersegments.total],'-sy','LineWidth',1.5,'MarkerEdgeColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
            loglog([testtype.termination.branchorder.branchorder],[testtype.termination.branchorder.numbersegments.total],'-dm','LineWidth',1.5,'MarkerEdgeColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
            loglog([testtype.bifurcation.branchorder.branchorder],[testtype.bifurcation.branchorder.volume.total],'-y','LineWidth',1.5);
            loglog([testtype.termination.branchorder.branchorder],[testtype.termination.branchorder.volume.total],'-m','LineWidth',1.5);
        end
        set(gca,'FontSize',axesfontsize);
        set(gca,'YScale','log');
        set(gca,'XScale','log');
        legendhandle = gca;
        hold off;
        
        
        subplot(3,4,5);
        box on;
        hold on;
        ylabel('Probability (Semi-Log)','FontSize',labelfontsize,'FontWeight','b');
        if nargin ==1
            semilogy([controltype.bifurcation.diameter.diameter],[controltype.bifurcation.diameter.bifurcationprobability.volume],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
            semilogy([controltype.termination.diameter.diameter],[controltype.termination.diameter.terminationprobability.volume],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
        else
            semilogy([controltype.bifurcation.diameter.diameter],[controltype.bifurcation.diameter.bifurcationprobability.volume],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
            semilogy([controltype.termination.diameter.diameter],[controltype.termination.diameter.terminationprobability.volume],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
            semilogy([testtype.bifurcation.diameter.diameter],[testtype.bifurcation.diameter.bifurcationprobability.volume],'sy','MarkerFaceColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
            semilogy([testtype.termination.diameter.diameter],[testtype.termination.diameter.terminationprobability.volume],'dm','MarkerFaceColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
        end
        set(gca,'FontSize',axesfontsize);
        set(gca,'YScale','log');
        hold off;
        
        
        subplot(3,4,6);
        box on;
        hold on;
        if nargin == 1
            semilogy([controltype.bifurcation.pathlength.pathlength],[controltype.bifurcation.pathlength.bifurcationprobability.volume],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
            semilogy([controltype.termination.pathlength.pathlength],[controltype.termination.pathlength.terminationprobability.volume],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
        else
            semilogy([controltype.bifurcation.pathlength.pathlength],[controltype.bifurcation.pathlength.bifurcationprobability.volume],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
            semilogy([controltype.termination.pathlength.pathlength],[controltype.termination.pathlength.terminationprobability.volume],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
            semilogy([testtype.bifurcation.pathlength.pathlength],[testtype.bifurcation.pathlength.bifurcationprobability.volume],'sy','MarkerFaceColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
            semilogy([testtype.termination.pathlength.pathlength],[testtype.termination.pathlength.terminationprobability.volume],'dm','MarkerFaceColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
        end
        set(gca,'FontSize',axesfontsize);
        set(gca,'YScale','log');
        hold off;
        
        
        subplot(3,4,7);
        box on;
        hold on;
        if nargin == 1
            semilogy([controltype.bifurcation.branchlength.branchlength],[controltype.bifurcation.branchlength.bifurcationprobability.volume],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
            semilogy([controltype.termination.branchlength.branchlength],[controltype.termination.branchlength.terminationprobability.volume],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
        else
            semilogy([controltype.bifurcation.branchlength.branchlength],[controltype.bifurcation.branchlength.bifurcationprobability.volume],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
            semilogy([controltype.termination.branchlength.branchlength],[controltype.termination.branchlength.terminationprobability.volume],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
            semilogy([testtype.bifurcation.branchlength.branchlength],[testtype.bifurcation.branchlength.bifurcationprobability.volume],'sy','MarkerFaceColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
            semilogy([testtype.termination.branchlength.branchlength],[testtype.termination.branchlength.terminationprobability.volume],'dm','MarkerFaceColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
        end
        set(gca,'FontSize',axesfontsize);
        set(gca,'YScale','log');
        hold off;
        
        
        subplot(3,4,8);
        box on;
        hold on;
        if nargin == 1
            semilogy([controltype.bifurcation.branchorder.branchorder],[controltype.bifurcation.branchorder.bifurcationprobability.volume],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
            semilogy([controltype.termination.branchorder.branchorder],[controltype.termination.branchorder.terminationprobability.volume],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
        else
            semilogy([controltype.bifurcation.branchorder.branchorder],[controltype.bifurcation.branchorder.bifurcationprobability.volume],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
            semilogy([controltype.termination.branchorder.branchorder],[controltype.termination.branchorder.terminationprobability.volume],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
            semilogy([testtype.bifurcation.branchorder.branchorder],[testtype.bifurcation.branchorder.bifurcationprobability.volume],'sy','MarkerFaceColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
            semilogy([testtype.termination.branchorder.branchorder],[testtype.termination.branchorder.terminationprobability.volume],'dm','MarkerFaceColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
        end
        set(gca,'FontSize',axesfontsize);
        set(gca,'YScale','log');
        hold off;
        
        
        subplot(3,4,9);
        box on;
        hold on;
        xlabel('Diameter','FontSize',labelfontsize,'FontWeight','b');
        ylabel('Probability (Log-Log)','FontSize',labelfontsize,'FontWeight','b');
        if nargin == 1
            loglog([controltype.bifurcation.diameter.diameter],[controltype.bifurcation.diameter.bifurcationprobability.volume],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
            loglog([controltype.termination.diameter.diameter],[controltype.termination.diameter.terminationprobability.volume],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
        else
            loglog([controltype.bifurcation.diameter.diameter],[controltype.bifurcation.diameter.bifurcationprobability.volume],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
            loglog([controltype.termination.diameter.diameter],[controltype.termination.diameter.terminationprobability.volume],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
            loglog([testtype.bifurcation.diameter.diameter],[testtype.bifurcation.diameter.bifurcationprobability.volume],'sy','MarkerFaceColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
            loglog([testtype.termination.diameter.diameter],[testtype.termination.diameter.terminationprobability.volume],'dm','MarkerFaceColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
        end
        set(gca,'FontSize',axesfontsize);
        set(gca,'YScale','log');
        set(gca,'XScale','log');
        hold off;
        
        
        subplot(3,4,10);
        box on;
        hold on;
        xlabel('Path Length','FontSize',labelfontsize,'FontWeight','b');
        if nargin == 1
            loglog([controltype.bifurcation.pathlength.pathlength],[controltype.bifurcation.pathlength.bifurcationprobability.volume],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
            loglog([controltype.termination.pathlength.pathlength],[controltype.termination.pathlength.terminationprobability.volume],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
        else
            loglog([controltype.bifurcation.pathlength.pathlength],[controltype.bifurcation.pathlength.bifurcationprobability.volume],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
            loglog([controltype.termination.pathlength.pathlength],[controltype.termination.pathlength.terminationprobability.volume],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
            loglog([testtype.bifurcation.pathlength.pathlength],[testtype.bifurcation.pathlength.bifurcationprobability.volume],'sy','MarkerFaceColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
            loglog([testtype.termination.pathlength.pathlength],[testtype.termination.pathlength.terminationprobability.volume],'dm','MarkerFaceColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
        end
        set(gca,'FontSize',axesfontsize); 
        set(gca,'YScale','log');
        set(gca,'XScale','log');
        hold off;
        
        
        subplot(3,4,11);
        box on;
        hold on;
        xlabel('Branch Length','FontSize',labelfontsize,'FontWeight','b');
        if nargin == 1
            loglog([controltype.bifurcation.branchlength.branchlength],[controltype.bifurcation.branchlength.bifurcationprobability.volume],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
            loglog([controltype.termination.branchlength.branchlength],[controltype.termination.branchlength.terminationprobability.volume],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
        else
            loglog([controltype.bifurcation.branchlength.branchlength],[controltype.bifurcation.branchlength.bifurcationprobability.volume],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
            loglog([controltype.termination.branchlength.branchlength],[controltype.termination.branchlength.terminationprobability.volume],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
            loglog([testtype.bifurcation.branchlength.branchlength],[testtype.bifurcation.branchlength.bifurcationprobability.volume],'sy','MarkerFaceColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
            loglog([testtype.termination.branchlength.branchlength],[testtype.termination.branchlength.terminationprobability.volume],'dm','MarkerFaceColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
        end
        set(gca,'FontSize',axesfontsize);
        set(gca,'YScale','log');
        set(gca,'XScale','log');
        hold off;
        
        
        subplot(3,4,12);
        box on;
        hold on;
        xlabel('Branch Order','FontSize',labelfontsize,'FontWeight','b');
        if nargin == 1
            loglog([controltype.bifurcation.branchorder.branchorder],[controltype.bifurcation.branchorder.bifurcationprobability.volume],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
            loglog([controltype.termination.branchorder.branchorder],[controltype.termination.branchorder.terminationprobability.volume],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
        else
            loglog([controltype.bifurcation.branchorder.branchorder],[controltype.bifurcation.branchorder.bifurcationprobability.volume],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
            loglog([controltype.termination.branchorder.branchorder],[controltype.termination.branchorder.terminationprobability.volume],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
            loglog([testtype.bifurcation.branchorder.branchorder],[testtype.bifurcation.branchorder.bifurcationprobability.volume],'sy','MarkerFaceColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
            loglog([testtype.termination.branchorder.branchorder],[testtype.termination.branchorder.terminationprobability.volume],'dm','MarkerFaceColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
        end
        set(gca,'FontSize',axesfontsize);
        set(gca,'YScale','log');
        set(gca,'XScale','log');
        hold off;
        
        
        currentdirectory = cd;
        %%subplotspace('horizontal',-5);
        %%subplotspace('vertical',-15);
        
        if nargin == 1
            [ignore,h]=suplabel([controlanalysis.inputfilename ' -- ' currentpiecetitle ' Branch Ending Probability by Volume']  ,'t');
            set(h,'FontSize',titlefontsize);
            legend(legendhandle,[controlanalysis.inputfilename ' #Bifs'],[controlanalysis.inputfilename ' #Terms'],[controlanalysis.inputfilename ' Bif Volume'],[controlanalysis.inputfilename ' Term Volume']);
            cd(controlanalysis.datapathname);
            if exist(piecetypes{piecetype},'dir') ~= 7
                mkdir(piecetypes{piecetype});
            end
            cd(piecetypes{piecetype});
            if exist('figures','dir') ~= 7
                mkdir('figures');
            end
            cd('figures');
            filename = sprintf('%s_%s_05_3_End_Prob_Volume',controlanalysis.inputfilename,currentpiecetype);
        else
            [ignore,h]=suplabel([controlanalysis.inputfilename ' vs ' testanalysis.inputfilename ' -- ' currentpiecetitle ' Branch Ending Probability by Volume']  ,'t');
            set(h,'FontSize',titlefontsize);
            legend(legendhandle,[controlanalysis.inputfilename ' #Bifs'],[controlanalysis.inputfilename ' #Terms'],[controlanalysis.inputfilename ' Bif Volume'],[controlanalysis.inputfilename ' Term Volume'],[testanalysis.inputfilename ' #Bifs'],[testanalysis.inputfilename ' #Terms'],[testanalysis.inputfilename ' Bif Volume'],[testanalysis.inputfilename ' Term Volume']);
            cd(testanalysis.datapathname);
            cd ..
            if exist(sprintf('%s_%s_comparison',controlanalysis.inputfilename,testanalysis.inputfilename),'dir') ~= 7;
                mkdir(sprintf('%s_%s_comparison',controlanalysis.inputfilename,testanalysis.inputfilename));
            end
            cd(sprintf('%s_%s_comparison',controlanalysis.inputfilename,testanalysis.inputfilename));
            if exist(piecetypes{piecetype},'dir') ~= 7
                mkdir(piecetypes{piecetype});
            end
            cd(piecetypes{piecetype});
            filename = sprintf('%s_%s_%s_05_3_End_Prob_Volume',controlanalysis.inputfilename,testanalysis.inputfilename,currentpiecetype);
        end
        
        print('-djpeg',filename);
        if strcmp(option.mnfigures.matfig,'y')
                saveas(gcf,filename,'fig');
        end
        
        cd(currentdirectory);
        
    end
end
        
