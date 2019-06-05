function trunkdirectionhistograms(controlanalysis,testanalysis)
% Primary Dendrite Proximal Diameter Figures

mnoptions;

titlefontsize = option.mnfigures.titlefontsize;
labelfontsize = option.mnfigures.labelfontsize;
axesfontsize  = option.mnfigures.axesfontsize;
insetfontsize = option.mnfigures.insetfontsize;
    
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
        
        subplot(2,3,1);
        box on;
        hold on;
        legendhandle = gca;
        ylabel('Number Trunks','FontSize',labelfontsize,'FontWeight','b');
        xlabel('x Direction','FontSize',labelfontsize,'FontWeight','b');
        if nargin == 1
            hist(controltype.trunk.proximalxdirection.values);
            h = findobj(gca,'Type','patch');
            set(h,'FaceColor','b','EdgeColor','b','FaceAlpha',0.5,'EdgeAlpha',0.5);
        else
            [ignore xvalues] = hist([controltype.trunk.proximalxdirection.values' testtype.trunk.proximalxdirection.values']);
            hist(controltype.trunk.proximalxdirection.values,xvalues);
            hist(testtype.trunk.proximalxdirection.values,xvalues);
            h = findobj(gca,'Type','patch');
            set(h(2),'FaceColor','b','EdgeColor','b','FaceAlpha',0.5,'EdgeAlpha',0.5);
            set(h(1),'FaceColor','r','EdgeColor','r','FaceAlpha',0.5,'EdgeAlpha',0.5);
        end
        set(gca,'FontSize',axesfontsize);
        hold off;
        
        subplot(2,3,2);
        box on;
        hold on;
        legendhandle = gca;
        ylabel('Number Trunks','FontSize',labelfontsize,'FontWeight','b');
        xlabel('y Direction','FontSize',labelfontsize,'FontWeight','b');
        if nargin == 1
            hist(controltype.trunk.proximalydirection.values);
            h = findobj(gca,'Type','patch');
            set(h,'FaceColor','b','EdgeColor','b','FaceAlpha',0.5,'EdgeAlpha',0.5);
        else
            [ignore xvalues] = hist([controltype.trunk.proximalydirection.values' testtype.trunk.proximalydirection.values']);
            hist(controltype.trunk.proximalydirection.values,xvalues);
            hist(testtype.trunk.proximalydirection.values,xvalues);
            h = findobj(gca,'Type','patch');
            set(h(2),'FaceColor','b','EdgeColor','b','FaceAlpha',0.5,'EdgeAlpha',0.5);
            set(h(1),'FaceColor','r','EdgeColor','r','FaceAlpha',0.5,'EdgeAlpha',0.5);
        end
        set(gca,'FontSize',axesfontsize);
        hold off;
        
        subplot(2,3,3);
        box on;
        hold on;
        legendhandle = gca;
        ylabel('Number Trunks','FontSize',labelfontsize,'FontWeight','b');
        xlabel('z Direction','FontSize',labelfontsize,'FontWeight','b');
        if nargin == 1
            hist(controltype.trunk.proximalzdirection.values);
            h = findobj(gca,'Type','patch');
            set(h,'FaceColor','b','EdgeColor','b','FaceAlpha',0.5,'EdgeAlpha',0.5);
        else
            [ignore xvalues] = hist([controltype.trunk.proximalzdirection.values' testtype.trunk.proximalzdirection.values']);
            hist(controltype.trunk.proximalzdirection.values,xvalues);
            hist(testtype.trunk.proximalzdirection.values,xvalues);
            h = findobj(gca,'Type','patch');
            set(h(2),'FaceColor','b','EdgeColor','b','FaceAlpha',0.5,'EdgeAlpha',0.5);
            set(h(1),'FaceColor','r','EdgeColor','r','FaceAlpha',0.5,'EdgeAlpha',0.5);
        end
        set(gca,'FontSize',axesfontsize);
        hold off;
        
        subplot(2,3,4);
        box on;
        hold on;
        legendhandle = gca;
        ylabel('Number Trunks','FontSize',labelfontsize,'FontWeight','b');
        xlabel('Elevation','FontSize',labelfontsize,'FontWeight','b');
        if nargin == 1
            hist(controltype.trunk.proximalelevation.values);
            h = findobj(gca,'Type','patch');
            set(h,'FaceColor','b','EdgeColor','b','FaceAlpha',0.5,'EdgeAlpha',0.5);
        else
            [ignore xvalues] = hist([controltype.trunk.proximalelevation.values testtype.trunk.proximalelevation.values]);
            hist(controltype.trunk.proximalelevation.values,xvalues);
            hist(testtype.trunk.proximalelevation.values,xvalues);
            h = findobj(gca,'Type','patch');
            set(h(2),'FaceColor','b','EdgeColor','b','FaceAlpha',0.5,'EdgeAlpha',0.5);
            set(h(1),'FaceColor','r','EdgeColor','r','FaceAlpha',0.5,'EdgeAlpha',0.5);
        end
        set(gca,'FontSize',axesfontsize);
        hold off;
        
        subplot(2,3,5);
        box on;
        hold on;
        legendhandle = gca;
        ylabel('Number Trunks','FontSize',labelfontsize,'FontWeight','b');
        xlabel('Azimuth','FontSize',labelfontsize,'FontWeight','b');
        if nargin == 1
            hist(controltype.trunk.proximalazimuth.values);
            h = findobj(gca,'Type','patch');
            set(h,'FaceColor','b','EdgeColor','b','FaceAlpha',0.5,'EdgeAlpha',0.5);
        else
            [ignore xvalues] = hist([controltype.trunk.proximalazimuth.values testtype.trunk.proximalazimuth.values]);
            hist(controltype.trunk.proximalazimuth.values,xvalues);
            hist(testtype.trunk.proximalazimuth.values,xvalues);
            h = findobj(gca,'Type','patch');
            set(h(2),'FaceColor','b','EdgeColor','b','FaceAlpha',0.5,'EdgeAlpha',0.5);
            set(h(1),'FaceColor','r','EdgeColor','r','FaceAlpha',0.5,'EdgeAlpha',0.5);
        end
        set(gca,'FontSize',axesfontsize);
        hold off;
        
        subplot(2,3,6);
        box on;
        hold on;
        legendhandle = gca;
        ylabel('Number Trunks','FontSize',labelfontsize,'FontWeight','b');
        xlabel('Distance from Centroid','FontSize',labelfontsize,'FontWeight','b');
        if nargin == 1
            hist(controltype.trunk.centroiddistance.values);
            h = findobj(gca,'Type','patch');
            set(h,'FaceColor','b','EdgeColor','b','FaceAlpha',0.5,'EdgeAlpha',0.5);
        else
            [ignore xvalues] = hist([controltype.trunk.centroiddistance.values testtype.trunk.centroiddistance.values]);
            hist(controltype.trunk.centroiddistance.values,xvalues);
            hist(testtype.trunk.centroiddistance.values,xvalues);
            h = findobj(gca,'Type','patch');
            set(h(2),'FaceColor','b','EdgeColor','b','FaceAlpha',0.5,'EdgeAlpha',0.5);
            set(h(1),'FaceColor','r','EdgeColor','r','FaceAlpha',0.5,'EdgeAlpha',0.5);
        end
        set(gca,'FontSize',axesfontsize);
        hold off;
           
        
        
        
        currentdirectory = cd;
        %subplotspace('horizontal',-5);
        %subplotspace('vertical',-15);
        
        if nargin == 1
            [ignore,h]=suplabel([controlanalysis.inputfilename ' -- ' currentpiecetitle ' Trunk Direction']  ,'t');
            set(h,'FontSize',titlefontsize);
            cd(controlanalysis.datapathname);
            if exist(piecetypes{piecetype},'dir') ~= 7
                mkdir(piecetypes{piecetype});
            end
            cd(piecetypes{piecetype});
            if exist('figures','dir') ~= 7
                mkdir('figures');
            end
            cd('figures');
            filename = sprintf('%s_%s_07_5_TrunkDir',controlanalysis.inputfilename,currentpiecetype);
        else
            [ignore,h]=suplabel([controlanalysis.inputfilename ' vs ' testanalysis.inputfilename ' -- ' currentpiecetitle ' Trunk Direction']  ,'t');
            set(h,'FontSize',titlefontsize);
            legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
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
            filename = sprintf('%s_%s_%s_07_5_TrunkDir',controlanalysis.inputfilename,testanalysis.inputfilename,currentpiecetype);
        end
        
        print('-djpeg',filename);
        if strcmp(option.mnfigures.matfig,'y')
            saveas(gcf,filename,'fig');
        end
        
        cd(currentdirectory);
        
    end
end        
        
  