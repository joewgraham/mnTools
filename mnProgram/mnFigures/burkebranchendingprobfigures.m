function burkebranchendingprobfigures(controlanalysis,testanalysis)
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
            loglog([controltype.diameter.diameter],[controltype.diameter.numberbifurcations.total],'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize)
            loglog([controltype.diameter.diameter],[controltype.diameter.numberterminations.total],'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize)
            loglog([controltype.diameter.diameter],[controltype.diameter.length.total],'-b','LineWidth',1.5);
        else
            loglog([controltype.diameter.diameter],[controltype.diameter.numberbifurcations.total],'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize)
            loglog([controltype.diameter.diameter],[controltype.diameter.numberterminations.total],'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize)
            loglog([controltype.diameter.diameter],[controltype.diameter.length.total],'-b','LineWidth',1.5);
            loglog([testtype.diameter.diameter],[testtype.diameter.numberbifurcations.total],'-sy','LineWidth',1.5,'MarkerEdgeColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize)
            loglog([testtype.diameter.diameter],[testtype.diameter.numberterminations.total],'-dm','LineWidth',1.5,'MarkerEdgeColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize)
            loglog([testtype.diameter.diameter],[testtype.diameter.length.total],'-c','LineWidth',1.5);
        end
        set(gca,'FontSize',axesfontsize);
        set(gca,'YScale','log');
        set(gca,'XScale','log');
        legendhandle = gca;
        hold off;
        
        
        subplot(3,4,2);
        box on;
        hold on;
        if nargin == 1
            loglog([controltype.pathlength.pathlength],[controltype.pathlength.numberbifurcations.total],'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize)
            loglog([controltype.pathlength.pathlength],[controltype.pathlength.numberterminations.total],'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
            loglog([controltype.pathlength.pathlength],[controltype.pathlength.length.total],'-b','LineWidth',1.5);
        else
            loglog([controltype.pathlength.pathlength],[controltype.pathlength.numberbifurcations.total],'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize)
            loglog([controltype.pathlength.pathlength],[controltype.pathlength.numberterminations.total],'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
            loglog([controltype.pathlength.pathlength],[controltype.pathlength.length.total],'-b','LineWidth',1.5);
            loglog([testtype.pathlength.pathlength],[testtype.pathlength.numberbifurcations.total],'-sy','LineWidth',1.5,'MarkerEdgeColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize)
            loglog([testtype.pathlength.pathlength],[testtype.pathlength.numberterminations.total],'-dm','LineWidth',1.5,'MarkerEdgeColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
            loglog([testtype.pathlength.pathlength],[testtype.pathlength.length.total],'-c','LineWidth',1.5);
        end
        set(gca,'FontSize',axesfontsize);
        set(gca,'YScale','log');
        set(gca,'XScale','log');
        hold off;
        
        
        subplot(3,4,3);
        box on;
        hold on;
        if nargin == 1
            loglog([controltype.branchlength.branchlength],[controltype.branchlength.numberbifurcations.total],'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
            loglog([controltype.branchlength.branchlength],[controltype.branchlength.numberterminations.total],'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
            loglog([controltype.branchlength.branchlength],[controltype.branchlength.length.total],'-b','LineWidth',1.5);
        else
            loglog([controltype.branchlength.branchlength],[controltype.branchlength.numberbifurcations.total],'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
            loglog([controltype.branchlength.branchlength],[controltype.branchlength.numberterminations.total],'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
            loglog([controltype.branchlength.branchlength],[controltype.branchlength.length.total],'-b','LineWidth',1.5); 
            loglog([testtype.branchlength.branchlength],[testtype.branchlength.numberbifurcations.total],'-sy','LineWidth',1.5,'MarkerEdgeColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
            loglog([testtype.branchlength.branchlength],[testtype.branchlength.numberterminations.total],'-dm','LineWidth',1.5,'MarkerEdgeColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
            loglog([testtype.branchlength.branchlength],[testtype.branchlength.length.total],'-c','LineWidth',1.5); 
        end
        set(gca,'FontSize',axesfontsize); 
        set(gca,'YScale','log');
        set(gca,'XScale','log');
        hold off;
        
        
        subplot(3,4,4);
        box on;
        hold on;
        if nargin ==1
            loglog([controltype.branchorder.branchorder],[controltype.branchorder.numberbifurcations.total],'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
            loglog([controltype.branchorder.branchorder],[controltype.branchorder.numberterminations.total],'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
            loglog([controltype.branchorder.branchorder],[controltype.branchorder.length.total],'-b','LineWidth',1.5);
        else
            loglog([controltype.branchorder.branchorder],[controltype.branchorder.numberbifurcations.total],'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
            loglog([controltype.branchorder.branchorder],[controltype.branchorder.numberterminations.total],'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
            loglog([controltype.branchorder.branchorder],[controltype.branchorder.length.total],'-b','LineWidth',1.5);
            loglog([testtype.branchorder.branchorder],[testtype.branchorder.numberbifurcations.total],'-sy','LineWidth',1.5,'MarkerEdgeColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
            loglog([testtype.branchorder.branchorder],[testtype.branchorder.numberterminations.total],'-dm','LineWidth',1.5,'MarkerEdgeColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
            loglog([testtype.branchorder.branchorder],[testtype.branchorder.length.total],'-c','LineWidth',1.5);
        end
        set(gca,'FontSize',axesfontsize);
        set(gca,'YScale','log');
        set(gca,'XScale','log');
        hold off;
        
        
        subplot(3,4,5);
        box on;
        hold on;
        ylabel('Probability (Semi-Log)','FontSize',labelfontsize,'FontWeight','b');
        if nargin ==1
            semilogy([controltype.diameter.diameter],[controltype.diameter.bifurcationprobability.length],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
            semilogy([controltype.diameter.diameter],[controltype.diameter.terminationprobability.length],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
        else
            semilogy([controltype.diameter.diameter],[controltype.diameter.bifurcationprobability.length],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
            semilogy([controltype.diameter.diameter],[controltype.diameter.terminationprobability.length],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
            semilogy([testtype.diameter.diameter],[testtype.diameter.bifurcationprobability.length],'sy','MarkerFaceColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
            semilogy([testtype.diameter.diameter],[testtype.diameter.terminationprobability.length],'dm','MarkerFaceColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
        end
        set(gca,'FontSize',axesfontsize);
        set(gca,'YScale','log');
        hold off;
        
        
        subplot(3,4,6);
        box on;
        hold on;
        if nargin == 1
            semilogy([controltype.pathlength.pathlength],[controltype.pathlength.bifurcationprobability.length],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
            semilogy([controltype.pathlength.pathlength],[controltype.pathlength.terminationprobability.length],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
        else
            semilogy([controltype.pathlength.pathlength],[controltype.pathlength.bifurcationprobability.length],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
            semilogy([controltype.pathlength.pathlength],[controltype.pathlength.terminationprobability.length],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
            semilogy([testtype.pathlength.pathlength],[testtype.pathlength.bifurcationprobability.length],'sy','MarkerFaceColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
            semilogy([testtype.pathlength.pathlength],[testtype.pathlength.terminationprobability.length],'dm','MarkerFaceColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
        end
        set(gca,'FontSize',axesfontsize);
        set(gca,'YScale','log');
        hold off;
        
        
        subplot(3,4,7);
        box on;
        hold on;
        if nargin == 1
            semilogy([controltype.branchlength.branchlength],[controltype.branchlength.bifurcationprobability.length],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
            semilogy([controltype.branchlength.branchlength],[controltype.branchlength.terminationprobability.length],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
        else
            semilogy([controltype.branchlength.branchlength],[controltype.branchlength.bifurcationprobability.length],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
            semilogy([controltype.branchlength.branchlength],[controltype.branchlength.terminationprobability.length],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
            semilogy([testtype.branchlength.branchlength],[testtype.branchlength.bifurcationprobability.length],'sy','MarkerFaceColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
            semilogy([testtype.branchlength.branchlength],[testtype.branchlength.terminationprobability.length],'dm','MarkerFaceColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
        end
        set(gca,'FontSize',axesfontsize);
        set(gca,'YScale','log');
        hold off;
        
        
        subplot(3,4,8);
        box on;
        hold on;
        if nargin == 1
            semilogy([controltype.branchorder.branchorder],[controltype.branchorder.bifurcationprobability.length],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
            semilogy([controltype.branchorder.branchorder],[controltype.branchorder.terminationprobability.length],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
        else
            semilogy([controltype.branchorder.branchorder],[controltype.branchorder.bifurcationprobability.length],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
            semilogy([controltype.branchorder.branchorder],[controltype.branchorder.terminationprobability.length],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
            semilogy([testtype.branchorder.branchorder],[testtype.branchorder.bifurcationprobability.length],'sy','MarkerFaceColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
            semilogy([testtype.branchorder.branchorder],[testtype.branchorder.terminationprobability.length],'dm','MarkerFaceColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
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
            loglog([controltype.diameter.diameter],[controltype.diameter.bifurcationprobability.length],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
            loglog([controltype.diameter.diameter],[controltype.diameter.terminationprobability.length],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
        else
            loglog([controltype.diameter.diameter],[controltype.diameter.bifurcationprobability.length],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
            loglog([controltype.diameter.diameter],[controltype.diameter.terminationprobability.length],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
            loglog([testtype.diameter.diameter],[testtype.diameter.bifurcationprobability.length],'sy','MarkerFaceColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
            loglog([testtype.diameter.diameter],[testtype.diameter.terminationprobability.length],'dm','MarkerFaceColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
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
            loglog([controltype.pathlength.pathlength],[controltype.pathlength.bifurcationprobability.length],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
            loglog([controltype.pathlength.pathlength],[controltype.pathlength.terminationprobability.length],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
        else
            loglog([controltype.pathlength.pathlength],[controltype.pathlength.bifurcationprobability.length],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
            loglog([controltype.pathlength.pathlength],[controltype.pathlength.terminationprobability.length],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
            loglog([testtype.pathlength.pathlength],[testtype.pathlength.bifurcationprobability.length],'sy','MarkerFaceColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
            loglog([testtype.pathlength.pathlength],[testtype.pathlength.terminationprobability.length],'dm','MarkerFaceColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
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
            loglog([controltype.branchlength.branchlength],[controltype.branchlength.bifurcationprobability.length],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
            loglog([controltype.branchlength.branchlength],[controltype.branchlength.terminationprobability.length],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
        else
            loglog([controltype.branchlength.branchlength],[controltype.branchlength.bifurcationprobability.length],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
            loglog([controltype.branchlength.branchlength],[controltype.branchlength.terminationprobability.length],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
            loglog([testtype.branchlength.branchlength],[testtype.branchlength.bifurcationprobability.length],'sy','MarkerFaceColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
            loglog([testtype.branchlength.branchlength],[testtype.branchlength.terminationprobability.length],'dm','MarkerFaceColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
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
            loglog([controltype.branchorder.branchorder],[controltype.branchorder.bifurcationprobability.length],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
            loglog([controltype.branchorder.branchorder],[controltype.branchorder.terminationprobability.length],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
        else
            loglog([controltype.branchorder.branchorder],[controltype.branchorder.bifurcationprobability.length],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
            loglog([controltype.branchorder.branchorder],[controltype.branchorder.terminationprobability.length],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
            loglog([testtype.branchorder.branchorder],[testtype.branchorder.bifurcationprobability.length],'sy','MarkerFaceColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
            loglog([testtype.branchorder.branchorder],[testtype.branchorder.terminationprobability.length],'dm','MarkerFaceColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
        end
        set(gca,'FontSize',axesfontsize);
        set(gca,'YScale','log');
        set(gca,'XScale','log');
        hold off;
        
        
        currentdirectory = cd;
        %subplotspace('horizontal',-5);
        %subplotspace('vertical',-15);
        
        if nargin == 1
            [ignore,h]=suplabel([controlanalysis.inputfilename ' -- ' currentpiecetitle ' Burke Branch Ending Probability by Length']  ,'t');
            set(h,'FontSize',titlefontsize);
            legend(legendhandle,[controlanalysis.inputfilename ' #Bifs'],[controlanalysis.inputfilename ' #Terms'],[controlanalysis.inputfilename ' Length']);
            cd(controlanalysis.datapathname);
            if exist(piecetypes{piecetype},'dir') ~= 7
                mkdir(piecetypes{piecetype});
            end
            cd(piecetypes{piecetype});
            if exist('figures','dir') ~= 7
                mkdir('figures');
            end
            cd('figures');
            filename = sprintf('%s_%s_05_4_End_Prob_Length',controlanalysis.inputfilename,currentpiecetype);
        else
            [ignore,h]=suplabel([controlanalysis.inputfilename ' vs ' testanalysis.inputfilename ' -- ' currentpiecetitle ' Burke Branch Ending Probability by Length']  ,'t');
            set(h,'FontSize',titlefontsize);
            legend(legendhandle,[controlanalysis.inputfilename ' #Bifs'],[controlanalysis.inputfilename ' #Terms'],[controlanalysis.inputfilename ' Length'],[testanalysis.inputfilename ' #Bifs'],[testanalysis.inputfilename ' #Terms'],[testanalysis.inputfilename ' Length']);
            cd(controlanalysis.datapathname);
            cd ..
            if exist(sprintf('%s_%s_comparison',controlanalysis.inputfilename,testanalysis.inputfilename),'dir') ~= 7;
                mkdir(sprintf('%s_%s_comparison',controlanalysis.inputfilename,testanalysis.inputfilename));
            end
            cd(sprintf('%s_%s_comparison',controlanalysis.inputfilename,testanalysis.inputfilename));
            if exist(piecetypes{piecetype},'dir') ~= 7
                mkdir(piecetypes{piecetype});
            end
            cd(piecetypes{piecetype});
            filename = sprintf('%s_%s_%s_05_4_End_Prob_Length',controlanalysis.inputfilename,testanalysis.inputfilename,currentpiecetype);
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
            loglog([controltype.diameter.diameter],[controltype.diameter.numberbifurcations.total],'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize)
            loglog([controltype.diameter.diameter],[controltype.diameter.numberterminations.total],'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize)
            loglog([controltype.diameter.diameter],[controltype.diameter.surfacearea.total],'-b','LineWidth',1.5);
        else
            loglog([controltype.diameter.diameter],[controltype.diameter.numberbifurcations.total],'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize)
            loglog([controltype.diameter.diameter],[controltype.diameter.numberterminations.total],'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize)
            loglog([controltype.diameter.diameter],[controltype.diameter.surfacearea.total],'-b','LineWidth',1.5);
            loglog([testtype.diameter.diameter],[testtype.diameter.numberbifurcations.total],'-sy','LineWidth',1.5,'MarkerEdgeColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize)
            loglog([testtype.diameter.diameter],[testtype.diameter.numberterminations.total],'-dm','LineWidth',1.5,'MarkerEdgeColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize)
            loglog([testtype.diameter.diameter],[testtype.diameter.surfacearea.total],'-c','LineWidth',1.5);
        end
        set(gca,'FontSize',axesfontsize);
        set(gca,'YScale','log');
        set(gca,'XScale','log');
        legendhandle = gca;
        hold off;
        
        
        subplot(3,4,2);
        box on;
        hold on;
        if nargin == 1
            loglog([controltype.pathlength.pathlength],[controltype.pathlength.numberbifurcations.total],'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize)
            loglog([controltype.pathlength.pathlength],[controltype.pathlength.numberterminations.total],'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
            loglog([controltype.pathlength.pathlength],[controltype.pathlength.surfacearea.total],'-b','LineWidth',1.5);
        else
            loglog([controltype.pathlength.pathlength],[controltype.pathlength.numberbifurcations.total],'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize)
            loglog([controltype.pathlength.pathlength],[controltype.pathlength.numberterminations.total],'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
            loglog([controltype.pathlength.pathlength],[controltype.pathlength.surfacearea.total],'-b','LineWidth',1.5);
            loglog([testtype.pathlength.pathlength],[testtype.pathlength.numberbifurcations.total],'-sy','LineWidth',1.5,'MarkerEdgeColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize)
            loglog([testtype.pathlength.pathlength],[testtype.pathlength.numberterminations.total],'-dm','LineWidth',1.5,'MarkerEdgeColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
            loglog([testtype.pathlength.pathlength],[testtype.pathlength.surfacearea.total],'-c','LineWidth',1.5);
        end
        set(gca,'FontSize',axesfontsize);
        set(gca,'YScale','log');
        set(gca,'XScale','log');
        hold off;
        
        
        subplot(3,4,3);
        box on;
        hold on;
        if nargin == 1
            loglog([controltype.branchlength.branchlength],[controltype.branchlength.numberbifurcations.total],'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
            loglog([controltype.branchlength.branchlength],[controltype.branchlength.numberterminations.total],'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
            loglog([controltype.branchlength.branchlength],[controltype.branchlength.surfacearea.total],'-b','LineWidth',1.5);
        else
            loglog([controltype.branchlength.branchlength],[controltype.branchlength.numberbifurcations.total],'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
            loglog([controltype.branchlength.branchlength],[controltype.branchlength.numberterminations.total],'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
            loglog([controltype.branchlength.branchlength],[controltype.branchlength.surfacearea.total],'-b','LineWidth',1.5); 
            loglog([testtype.branchlength.branchlength],[testtype.branchlength.numberbifurcations.total],'-sy','LineWidth',1.5,'MarkerEdgeColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
            loglog([testtype.branchlength.branchlength],[testtype.branchlength.numberterminations.total],'-dm','LineWidth',1.5,'MarkerEdgeColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
            loglog([testtype.branchlength.branchlength],[testtype.branchlength.surfacearea.total],'-c','LineWidth',1.5); 
        end
        set(gca,'FontSize',axesfontsize); 
        set(gca,'YScale','log');
        set(gca,'XScale','log');
        hold off;
        
        
        subplot(3,4,4);
        box on;
        hold on;
        if nargin ==1
            loglog([controltype.branchorder.branchorder],[controltype.branchorder.numberbifurcations.total],'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
            loglog([controltype.branchorder.branchorder],[controltype.branchorder.numberterminations.total],'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
            loglog([controltype.branchorder.branchorder],[controltype.branchorder.surfacearea.total],'-b','LineWidth',1.5);
        else
            loglog([controltype.branchorder.branchorder],[controltype.branchorder.numberbifurcations.total],'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
            loglog([controltype.branchorder.branchorder],[controltype.branchorder.numberterminations.total],'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
            loglog([controltype.branchorder.branchorder],[controltype.branchorder.surfacearea.total],'-b','LineWidth',1.5);
            loglog([testtype.branchorder.branchorder],[testtype.branchorder.numberbifurcations.total],'-sy','LineWidth',1.5,'MarkerEdgeColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
            loglog([testtype.branchorder.branchorder],[testtype.branchorder.numberterminations.total],'-dm','LineWidth',1.5,'MarkerEdgeColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
            loglog([testtype.branchorder.branchorder],[testtype.branchorder.surfacearea.total],'-c','LineWidth',1.5);
        end
        set(gca,'FontSize',axesfontsize);
        set(gca,'YScale','log');
        set(gca,'XScale','log');
        hold off;
        
        
        subplot(3,4,5);
        box on;
        hold on;
        ylabel('Probability (Semi-Log)','FontSize',labelfontsize,'FontWeight','b');
        if nargin ==1
            semilogy([controltype.diameter.diameter],[controltype.diameter.bifurcationprobability.surfacearea],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
            semilogy([controltype.diameter.diameter],[controltype.diameter.terminationprobability.surfacearea],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
        else
            semilogy([controltype.diameter.diameter],[controltype.diameter.bifurcationprobability.surfacearea],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
            semilogy([controltype.diameter.diameter],[controltype.diameter.terminationprobability.surfacearea],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
            semilogy([testtype.diameter.diameter],[testtype.diameter.bifurcationprobability.surfacearea],'sy','MarkerFaceColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
            semilogy([testtype.diameter.diameter],[testtype.diameter.terminationprobability.surfacearea],'dm','MarkerFaceColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
        end
        set(gca,'FontSize',axesfontsize);
        set(gca,'YScale','log');
        hold off;
        
        
        subplot(3,4,6);
        box on;
        hold on;
        if nargin == 1
            semilogy([controltype.pathlength.pathlength],[controltype.pathlength.bifurcationprobability.surfacearea],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
            semilogy([controltype.pathlength.pathlength],[controltype.pathlength.terminationprobability.surfacearea],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
        else
            semilogy([controltype.pathlength.pathlength],[controltype.pathlength.bifurcationprobability.surfacearea],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
            semilogy([controltype.pathlength.pathlength],[controltype.pathlength.terminationprobability.surfacearea],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
            semilogy([testtype.pathlength.pathlength],[testtype.pathlength.bifurcationprobability.surfacearea],'sy','MarkerFaceColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
            semilogy([testtype.pathlength.pathlength],[testtype.pathlength.terminationprobability.surfacearea],'dm','MarkerFaceColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
        end
        set(gca,'FontSize',axesfontsize);
        set(gca,'YScale','log');
        hold off;
        
        
        subplot(3,4,7);
        box on;
        hold on;
        if nargin == 1
            semilogy([controltype.branchlength.branchlength],[controltype.branchlength.bifurcationprobability.surfacearea],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
            semilogy([controltype.branchlength.branchlength],[controltype.branchlength.terminationprobability.surfacearea],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
        else
            semilogy([controltype.branchlength.branchlength],[controltype.branchlength.bifurcationprobability.surfacearea],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
            semilogy([controltype.branchlength.branchlength],[controltype.branchlength.terminationprobability.surfacearea],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
            semilogy([testtype.branchlength.branchlength],[testtype.branchlength.bifurcationprobability.surfacearea],'sy','MarkerFaceColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
            semilogy([testtype.branchlength.branchlength],[testtype.branchlength.terminationprobability.surfacearea],'dm','MarkerFaceColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
        end
        set(gca,'FontSize',axesfontsize);
        set(gca,'YScale','log');
        hold off;
        
        
        subplot(3,4,8);
        box on;
        hold on;
        if nargin == 1
            semilogy([controltype.branchorder.branchorder],[controltype.branchorder.bifurcationprobability.surfacearea],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
            semilogy([controltype.branchorder.branchorder],[controltype.branchorder.terminationprobability.surfacearea],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
        else
            semilogy([controltype.branchorder.branchorder],[controltype.branchorder.bifurcationprobability.surfacearea],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
            semilogy([controltype.branchorder.branchorder],[controltype.branchorder.terminationprobability.surfacearea],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
            semilogy([testtype.branchorder.branchorder],[testtype.branchorder.bifurcationprobability.surfacearea],'sy','MarkerFaceColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
            semilogy([testtype.branchorder.branchorder],[testtype.branchorder.terminationprobability.surfacearea],'dm','MarkerFaceColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
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
            loglog([controltype.diameter.diameter],[controltype.diameter.bifurcationprobability.surfacearea],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
            loglog([controltype.diameter.diameter],[controltype.diameter.terminationprobability.surfacearea],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
        else
            loglog([controltype.diameter.diameter],[controltype.diameter.bifurcationprobability.surfacearea],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
            loglog([controltype.diameter.diameter],[controltype.diameter.terminationprobability.surfacearea],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
            loglog([testtype.diameter.diameter],[testtype.diameter.bifurcationprobability.surfacearea],'sy','MarkerFaceColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
            loglog([testtype.diameter.diameter],[testtype.diameter.terminationprobability.surfacearea],'dm','MarkerFaceColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
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
            loglog([controltype.pathlength.pathlength],[controltype.pathlength.bifurcationprobability.surfacearea],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
            loglog([controltype.pathlength.pathlength],[controltype.pathlength.terminationprobability.surfacearea],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
        else
            loglog([controltype.pathlength.pathlength],[controltype.pathlength.bifurcationprobability.surfacearea],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
            loglog([controltype.pathlength.pathlength],[controltype.pathlength.terminationprobability.surfacearea],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
            loglog([testtype.pathlength.pathlength],[testtype.pathlength.bifurcationprobability.surfacearea],'sy','MarkerFaceColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
            loglog([testtype.pathlength.pathlength],[testtype.pathlength.terminationprobability.surfacearea],'dm','MarkerFaceColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
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
            loglog([controltype.branchlength.branchlength],[controltype.branchlength.bifurcationprobability.surfacearea],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
            loglog([controltype.branchlength.branchlength],[controltype.branchlength.terminationprobability.surfacearea],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
        else
            loglog([controltype.branchlength.branchlength],[controltype.branchlength.bifurcationprobability.surfacearea],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
            loglog([controltype.branchlength.branchlength],[controltype.branchlength.terminationprobability.surfacearea],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
            loglog([testtype.branchlength.branchlength],[testtype.branchlength.bifurcationprobability.surfacearea],'sy','MarkerFaceColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
            loglog([testtype.branchlength.branchlength],[testtype.branchlength.terminationprobability.surfacearea],'dm','MarkerFaceColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
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
            loglog([controltype.branchorder.branchorder],[controltype.branchorder.bifurcationprobability.surfacearea],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
            loglog([controltype.branchorder.branchorder],[controltype.branchorder.terminationprobability.surfacearea],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
        else
            loglog([controltype.branchorder.branchorder],[controltype.branchorder.bifurcationprobability.surfacearea],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
            loglog([controltype.branchorder.branchorder],[controltype.branchorder.terminationprobability.surfacearea],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
            loglog([testtype.branchorder.branchorder],[testtype.branchorder.bifurcationprobability.surfacearea],'sy','MarkerFaceColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
            loglog([testtype.branchorder.branchorder],[testtype.branchorder.terminationprobability.surfacearea],'dm','MarkerFaceColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
        end
        set(gca,'FontSize',axesfontsize);
        set(gca,'YScale','log');
        set(gca,'XScale','log');
        hold off;
        
        
        currentdirectory = cd;
        %subplotspace('horizontal',-5);
        %subplotspace('vertical',-15);
        
        if nargin == 1
            [ignore,h]=suplabel([controlanalysis.inputfilename ' -- ' currentpiecetitle ' Burke Branch Ending Probability by Surface Area']  ,'t');
            set(h,'FontSize',titlefontsize);
            legend(legendhandle,[controlanalysis.inputfilename ' #Bifs'],[controlanalysis.inputfilename ' #Terms'],[controlanalysis.inputfilename ' SA']);
            cd(controlanalysis.datapathname);
            if exist(piecetypes{piecetype},'dir') ~= 7
                mkdir(piecetypes{piecetype});
            end
            cd(piecetypes{piecetype});
            if exist('figures','dir') ~= 7
                mkdir('figures');
            end
            cd('figures');
            filename = sprintf('%s_%s_05_5_End_Prob_SA',controlanalysis.inputfilename,currentpiecetype);
        else
            [ignore,h]=suplabel([controlanalysis.inputfilename ' vs ' testanalysis.inputfilename ' -- ' currentpiecetitle ' Burke Branch Ending Probability by Surface Area']  ,'t');
            set(h,'FontSize',titlefontsize);
            legend(legendhandle,[controlanalysis.inputfilename ' #Bifs'],[controlanalysis.inputfilename ' #Terms'],[controlanalysis.inputfilename ' SA'],[testanalysis.inputfilename ' #Bifs'],[testanalysis.inputfilename ' #Terms'],[testanalysis.inputfilename ' SA']);
            cd(controlanalysis.datapathname);
            cd ..
            if exist(sprintf('%s_%s_comparison',controlanalysis.inputfilename,testanalysis.inputfilename),'dir') ~= 7;
                mkdir(sprintf('%s_%s_comparison',controlanalysis.inputfilename,testanalysis.inputfilename));
            end
            cd(sprintf('%s_%s_comparison',controlanalysis.inputfilename,testanalysis.inputfilename));
            if exist(piecetypes{piecetype},'dir') ~= 7
                mkdir(piecetypes{piecetype});
            end
            cd(piecetypes{piecetype});
            filename = sprintf('%s_%s_%s_05_5_End_Prob_SA',controlanalysis.inputfilename,testanalysis.inputfilename,currentpiecetype);
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
            loglog([controltype.diameter.diameter],[controltype.diameter.numberbifurcations.total],'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize)
            loglog([controltype.diameter.diameter],[controltype.diameter.numberterminations.total],'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize)
            loglog([controltype.diameter.diameter],[controltype.diameter.volume.total],'-b','LineWidth',1.5);
        else
            loglog([controltype.diameter.diameter],[controltype.diameter.numberbifurcations.total],'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize)
            loglog([controltype.diameter.diameter],[controltype.diameter.numberterminations.total],'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize)
            loglog([controltype.diameter.diameter],[controltype.diameter.volume.total],'-b','LineWidth',1.5);
            loglog([testtype.diameter.diameter],[testtype.diameter.numberbifurcations.total],'-sy','LineWidth',1.5,'MarkerEdgeColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize)
            loglog([testtype.diameter.diameter],[testtype.diameter.numberterminations.total],'-dm','LineWidth',1.5,'MarkerEdgeColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize)
            loglog([testtype.diameter.diameter],[testtype.diameter.volume.total],'-c','LineWidth',1.5);
        end
        set(gca,'FontSize',axesfontsize);
        set(gca,'YScale','log');
        set(gca,'XScale','log');
        legendhandle = gca;
        hold off;
        
        
        subplot(3,4,2);
        box on;
        hold on;
        if nargin == 1
            loglog([controltype.pathlength.pathlength],[controltype.pathlength.numberbifurcations.total],'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize)
            loglog([controltype.pathlength.pathlength],[controltype.pathlength.numberterminations.total],'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
            loglog([controltype.pathlength.pathlength],[controltype.pathlength.volume.total],'-b','LineWidth',1.5);
        else
            loglog([controltype.pathlength.pathlength],[controltype.pathlength.numberbifurcations.total],'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize)
            loglog([controltype.pathlength.pathlength],[controltype.pathlength.numberterminations.total],'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
            loglog([controltype.pathlength.pathlength],[controltype.pathlength.volume.total],'-b','LineWidth',1.5);
            loglog([testtype.pathlength.pathlength],[testtype.pathlength.numberbifurcations.total],'-sy','LineWidth',1.5,'MarkerEdgeColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize)
            loglog([testtype.pathlength.pathlength],[testtype.pathlength.numberterminations.total],'-dm','LineWidth',1.5,'MarkerEdgeColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
            loglog([testtype.pathlength.pathlength],[testtype.pathlength.volume.total],'-c','LineWidth',1.5);
        end
        set(gca,'FontSize',axesfontsize);
        set(gca,'YScale','log');
        set(gca,'XScale','log');
        hold off;
        
        
        subplot(3,4,3);
        box on;
        hold on;
        if nargin == 1
            loglog([controltype.branchlength.branchlength],[controltype.branchlength.numberbifurcations.total],'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
            loglog([controltype.branchlength.branchlength],[controltype.branchlength.numberterminations.total],'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
            loglog([controltype.branchlength.branchlength],[controltype.branchlength.volume.total],'-b','LineWidth',1.5);
        else
            loglog([controltype.branchlength.branchlength],[controltype.branchlength.numberbifurcations.total],'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
            loglog([controltype.branchlength.branchlength],[controltype.branchlength.numberterminations.total],'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
            loglog([controltype.branchlength.branchlength],[controltype.branchlength.volume.total],'-b','LineWidth',1.5); 
            loglog([testtype.branchlength.branchlength],[testtype.branchlength.numberbifurcations.total],'-sy','LineWidth',1.5,'MarkerEdgeColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
            loglog([testtype.branchlength.branchlength],[testtype.branchlength.numberterminations.total],'-dm','LineWidth',1.5,'MarkerEdgeColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
            loglog([testtype.branchlength.branchlength],[testtype.branchlength.volume.total],'-c','LineWidth',1.5); 
        end
        set(gca,'FontSize',axesfontsize); 
        set(gca,'YScale','log');
        set(gca,'XScale','log');
        hold off;
        
        
        subplot(3,4,4);
        box on;
        hold on;
        if nargin ==1
            loglog([controltype.branchorder.branchorder],[controltype.branchorder.numberbifurcations.total],'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
            loglog([controltype.branchorder.branchorder],[controltype.branchorder.numberterminations.total],'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
            loglog([controltype.branchorder.branchorder],[controltype.branchorder.volume.total],'-b','LineWidth',1.5);
        else
            loglog([controltype.branchorder.branchorder],[controltype.branchorder.numberbifurcations.total],'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
            loglog([controltype.branchorder.branchorder],[controltype.branchorder.numberterminations.total],'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
            loglog([controltype.branchorder.branchorder],[controltype.branchorder.volume.total],'-b','LineWidth',1.5);
            loglog([testtype.branchorder.branchorder],[testtype.branchorder.numberbifurcations.total],'-sy','LineWidth',1.5,'MarkerEdgeColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
            loglog([testtype.branchorder.branchorder],[testtype.branchorder.numberterminations.total],'-dm','LineWidth',1.5,'MarkerEdgeColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
            loglog([testtype.branchorder.branchorder],[testtype.branchorder.volume.total],'-c','LineWidth',1.5);
        end
        set(gca,'FontSize',axesfontsize);
        set(gca,'YScale','log');
        set(gca,'XScale','log');
        hold off;
        
        
        subplot(3,4,5);
        box on;
        hold on;
        ylabel('Probability (Semi-Log)','FontSize',labelfontsize,'FontWeight','b');
        if nargin ==1
            semilogy([controltype.diameter.diameter],[controltype.diameter.bifurcationprobability.volume],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
            semilogy([controltype.diameter.diameter],[controltype.diameter.terminationprobability.volume],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
        else
            semilogy([controltype.diameter.diameter],[controltype.diameter.bifurcationprobability.volume],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
            semilogy([controltype.diameter.diameter],[controltype.diameter.terminationprobability.volume],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
            semilogy([testtype.diameter.diameter],[testtype.diameter.bifurcationprobability.volume],'sy','MarkerFaceColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
            semilogy([testtype.diameter.diameter],[testtype.diameter.terminationprobability.volume],'dm','MarkerFaceColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
        end
        set(gca,'FontSize',axesfontsize);
        set(gca,'YScale','log');
        hold off;
        
        
        subplot(3,4,6);
        box on;
        hold on;
        if nargin == 1
            semilogy([controltype.pathlength.pathlength],[controltype.pathlength.bifurcationprobability.volume],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
            semilogy([controltype.pathlength.pathlength],[controltype.pathlength.terminationprobability.volume],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
        else
            semilogy([controltype.pathlength.pathlength],[controltype.pathlength.bifurcationprobability.volume],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
            semilogy([controltype.pathlength.pathlength],[controltype.pathlength.terminationprobability.volume],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
            semilogy([testtype.pathlength.pathlength],[testtype.pathlength.bifurcationprobability.volume],'sy','MarkerFaceColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
            semilogy([testtype.pathlength.pathlength],[testtype.pathlength.terminationprobability.volume],'dm','MarkerFaceColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
        end
        set(gca,'FontSize',axesfontsize);
        set(gca,'YScale','log');
        hold off;
        
        
        subplot(3,4,7);
        box on;
        hold on;
        if nargin == 1
            semilogy([controltype.branchlength.branchlength],[controltype.branchlength.bifurcationprobability.volume],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
            semilogy([controltype.branchlength.branchlength],[controltype.branchlength.terminationprobability.volume],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
        else
            semilogy([controltype.branchlength.branchlength],[controltype.branchlength.bifurcationprobability.volume],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
            semilogy([controltype.branchlength.branchlength],[controltype.branchlength.terminationprobability.volume],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
            semilogy([testtype.branchlength.branchlength],[testtype.branchlength.bifurcationprobability.volume],'sy','MarkerFaceColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
            semilogy([testtype.branchlength.branchlength],[testtype.branchlength.terminationprobability.volume],'dm','MarkerFaceColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
        end
        set(gca,'FontSize',axesfontsize);
        set(gca,'YScale','log');
        hold off;
        
        
        subplot(3,4,8);
        box on;
        hold on;
        if nargin == 1
            semilogy([controltype.branchorder.branchorder],[controltype.branchorder.bifurcationprobability.volume],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
            semilogy([controltype.branchorder.branchorder],[controltype.branchorder.terminationprobability.volume],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
        else
            semilogy([controltype.branchorder.branchorder],[controltype.branchorder.bifurcationprobability.volume],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
            semilogy([controltype.branchorder.branchorder],[controltype.branchorder.terminationprobability.volume],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
            semilogy([testtype.branchorder.branchorder],[testtype.branchorder.bifurcationprobability.volume],'sy','MarkerFaceColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
            semilogy([testtype.branchorder.branchorder],[testtype.branchorder.terminationprobability.volume],'dm','MarkerFaceColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
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
            loglog([controltype.diameter.diameter],[controltype.diameter.bifurcationprobability.volume],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
            loglog([controltype.diameter.diameter],[controltype.diameter.terminationprobability.volume],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
        else
            loglog([controltype.diameter.diameter],[controltype.diameter.bifurcationprobability.volume],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
            loglog([controltype.diameter.diameter],[controltype.diameter.terminationprobability.volume],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
            loglog([testtype.diameter.diameter],[testtype.diameter.bifurcationprobability.volume],'sy','MarkerFaceColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
            loglog([testtype.diameter.diameter],[testtype.diameter.terminationprobability.volume],'dm','MarkerFaceColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
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
            loglog([controltype.pathlength.pathlength],[controltype.pathlength.bifurcationprobability.volume],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
            loglog([controltype.pathlength.pathlength],[controltype.pathlength.terminationprobability.volume],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
        else
            loglog([controltype.pathlength.pathlength],[controltype.pathlength.bifurcationprobability.volume],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
            loglog([controltype.pathlength.pathlength],[controltype.pathlength.terminationprobability.volume],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
            loglog([testtype.pathlength.pathlength],[testtype.pathlength.bifurcationprobability.volume],'sy','MarkerFaceColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
            loglog([testtype.pathlength.pathlength],[testtype.pathlength.terminationprobability.volume],'dm','MarkerFaceColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
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
            loglog([controltype.branchlength.branchlength],[controltype.branchlength.bifurcationprobability.volume],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
            loglog([controltype.branchlength.branchlength],[controltype.branchlength.terminationprobability.volume],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
        else
            loglog([controltype.branchlength.branchlength],[controltype.branchlength.bifurcationprobability.volume],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
            loglog([controltype.branchlength.branchlength],[controltype.branchlength.terminationprobability.volume],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
            loglog([testtype.branchlength.branchlength],[testtype.branchlength.bifurcationprobability.volume],'sy','MarkerFaceColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
            loglog([testtype.branchlength.branchlength],[testtype.branchlength.terminationprobability.volume],'dm','MarkerFaceColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
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
            loglog([controltype.branchorder.branchorder],[controltype.branchorder.bifurcationprobability.volume],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
            loglog([controltype.branchorder.branchorder],[controltype.branchorder.terminationprobability.volume],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
        else
            loglog([controltype.branchorder.branchorder],[controltype.branchorder.bifurcationprobability.volume],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
            loglog([controltype.branchorder.branchorder],[controltype.branchorder.terminationprobability.volume],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
            loglog([testtype.branchorder.branchorder],[testtype.branchorder.bifurcationprobability.volume],'sy','MarkerFaceColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
            loglog([testtype.branchorder.branchorder],[testtype.branchorder.terminationprobability.volume],'dm','MarkerFaceColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
        end
        set(gca,'FontSize',axesfontsize);
        set(gca,'YScale','log');
        set(gca,'XScale','log');
        hold off;
        
        
        currentdirectory = cd;
        %subplotspace('horizontal',-5);
        %subplotspace('vertical',-15);
        
        if nargin == 1
            [ignore,h]=suplabel([controlanalysis.inputfilename ' -- ' currentpiecetitle ' Burke Branch Ending Probability by Volume']  ,'t');
            set(h,'FontSize',titlefontsize);
            legend(legendhandle,[controlanalysis.inputfilename ' #Bifs'],[controlanalysis.inputfilename ' #Terms'],[controlanalysis.inputfilename ' Volume']);
            cd(controlanalysis.datapathname);
            if exist(piecetypes{piecetype},'dir') ~= 7
                mkdir(piecetypes{piecetype});
            end
            cd(piecetypes{piecetype});
            if exist('figures','dir') ~= 7
                mkdir('figures');
            end
            cd('figures');
            filename = sprintf('%s_%s_05_6_End_Prob_Volume',controlanalysis.inputfilename,currentpiecetype);
        else
            [ignore,h]=suplabel([controlanalysis.inputfilename ' vs ' testanalysis.inputfilename ' -- ' currentpiecetitle ' Burke Branch Ending Probability by Volume']  ,'t');
            set(h,'FontSize',titlefontsize);
            legend(legendhandle,[controlanalysis.inputfilename ' #Bifs'],[controlanalysis.inputfilename ' #Terms'],[controlanalysis.inputfilename ' Volume'],[testanalysis.inputfilename ' #Bifs'],[testanalysis.inputfilename ' #Terms'],[testanalysis.inputfilename ' Volume']);
            cd(controlanalysis.datapathname);
            cd ..
            if exist(sprintf('%s_%s_comparison',controlanalysis.inputfilename,testanalysis.inputfilename),'dir') ~= 7;
                mkdir(sprintf('%s_%s_comparison',controlanalysis.inputfilename,testanalysis.inputfilename));
            end
            cd(sprintf('%s_%s_comparison',controlanalysis.inputfilename,testanalysis.inputfilename));
            if exist(piecetypes{piecetype},'dir') ~= 7
                mkdir(piecetypes{piecetype});
            end
            cd(piecetypes{piecetype});
            filename = sprintf('%s_%s_%s_05_6_End_Prob_Volume',controlanalysis.inputfilename,testanalysis.inputfilename,currentpiecetype);
        end
        
        print('-djpeg',filename);
        if strcmp(option.mnfigures.matfig,'y')
                saveas(gcf,filename,'fig');
        end
        
        cd(currentdirectory);
        
    end
end
        
