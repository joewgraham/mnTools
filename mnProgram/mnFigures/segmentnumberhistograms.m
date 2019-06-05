function segmentnumberhistograms(controlanalysis,testanalysis)
% Segment number histograms

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
        
        subplot(3,2,1);
        box on;
        hold on;
        xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
        ylabel('Number of Segments','FontSize',labelfontsize,'FontWeight','b');
        if nargin == 1
            bar([controltype.diameter.diameter],[controltype.diameter.numbersegments.mean],'b');
            h = findobj(gca,'Type','patch');
            set(h(1),'FaceColor','b','EdgeColor','b','FaceAlpha',0.5,'EdgeAlpha',0.5);
        else
            bar([controltype.diameter.diameter],[controltype.diameter.numbersegments.mean],'b');
            bar([testtype.diameter.diameter],[testtype.diameter.numbersegments.mean],'r');
            h = findobj(gca,'Type','patch');
            set(h(2),'FaceColor','b','EdgeColor','b','FaceAlpha',0.5,'EdgeAlpha',0.5);
            set(h(1),'FaceColor','r','EdgeColor','r','FaceAlpha',0.5,'EdgeAlpha',0.5);
            legendhandle = gca;
        end
        set(gca,'FontSize',axesfontsize);
        hold off;
        
        
        subplot(3,2,3);
        box on;
        hold on;
        xlabel('Intrabranch Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
        ylabel('Number of Segments','FontSize',labelfontsize,'FontWeight','b');
        if nargin == 1
            bar([controltype.branchlength.branchlength],[controltype.branchlength.numbersegments.mean],'b');
            h = findobj(gca,'Type','patch');
            set(h(1),'FaceColor','b','EdgeColor','b','FaceAlpha',0.5,'EdgeAlpha',0.5);
        else
            bar([controltype.branchlength.branchlength],[controltype.branchlength.numbersegments.mean],'b');
            bar([testtype.branchlength.branchlength],[testtype.branchlength.numbersegments.mean],'r');
            h = findobj(gca,'Type','patch');
            set(h(2),'FaceColor','b','EdgeColor','b','FaceAlpha',0.5,'EdgeAlpha',0.5);
            set(h(1),'FaceColor','r','EdgeColor','r','FaceAlpha',0.5,'EdgeAlpha',0.5);
        end
        set(gca,'FontSize',axesfontsize);
        hold off;
        
        
        subplot(3,2,5);
        box on;
        hold on;
        xlabel('Degree','FontSize',labelfontsize,'FontWeight','b');
        ylabel('Number of Segments','FontSize',labelfontsize,'FontWeight','b');
        if nargin == 1
            bar([controltype.degree.degree],[controltype.degree.numbersegments.mean],'b');
            h = findobj(gca,'Type','patch');
            set(h(1),'FaceColor','b','EdgeColor','b','FaceAlpha',0.5,'EdgeAlpha',0.5);
        else
            bar([controltype.degree.degree],[controltype.degree.numbersegments.mean],'b');
            bar([testtype.degree.degree],[testtype.degree.numbersegments.mean],'r');
            h = findobj(gca,'Type','patch');
            set(h(2),'FaceColor','b','EdgeColor','b','FaceAlpha',0.5,'EdgeAlpha',0.5);
            set(h(1),'FaceColor','r','EdgeColor','r','FaceAlpha',0.5,'EdgeAlpha',0.5);
        end
        set(gca,'FontSize',axesfontsize);
        hold off;
        
        
        subplot(3,2,2);
        box on;
        hold on;
        xlabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
        if nargin == 1
            bar([controltype.pathlength.pathlength],[controltype.pathlength.numbersegments.mean],'b');
            h = findobj(gca,'Type','patch');
            set(h(1),'FaceColor','b','EdgeColor','b','FaceAlpha',0.5,'EdgeAlpha',0.5);
        else
            bar([controltype.pathlength.pathlength],[controltype.pathlength.numbersegments.mean],'b');
            bar([testtype.pathlength.pathlength],[testtype.pathlength.numbersegments.mean],'r');
            h = findobj(gca,'Type','patch');
            set(h(2),'FaceColor','b','EdgeColor','b','FaceAlpha',0.5,'EdgeAlpha',0.5);
            set(h(1),'FaceColor','r','EdgeColor','r','FaceAlpha',0.5,'EdgeAlpha',0.5);
        end
        set(gca,'FontSize',axesfontsize);
        hold off;
        
        
        subplot(3,2,4);
        box on;
        hold on;
        xlabel('Radial Distance (\mum)','FontSize',labelfontsize,'FontWeight','b');
        if nargin == 1
            bar([controltype.radialdistance.radialdistance],[controltype.radialdistance.numbersegments.mean],'b');
            h = findobj(gca,'Type','patch');
            set(h(1),'FaceColor','b','EdgeColor','b','FaceAlpha',0.5,'EdgeAlpha',0.5);
        else
            bar([controltype.radialdistance.radialdistance],[controltype.radialdistance.numbersegments.mean],'b');
            bar([testtype.radialdistance.radialdistance],[testtype.radialdistance.numbersegments.mean],'r');
            h = findobj(gca,'Type','patch');
            set(h(2),'FaceColor','b','EdgeColor','b','FaceAlpha',0.5,'EdgeAlpha',0.5);
            set(h(1),'FaceColor','r','EdgeColor','r','FaceAlpha',0.5,'EdgeAlpha',0.5);
        end
        set(gca,'FontSize',axesfontsize);
        hold off;
        
        
        subplot(3,2,6);
        box on;
        hold on;
        xlabel('Branch Order','FontSize',labelfontsize,'FontWeight','b');
        if nargin == 1
            bar([controltype.branchorder.branchorder],[controltype.branchorder.numbersegments.mean],'b');
            h = findobj(gca,'Type','patch');
            set(h(1),'FaceColor','b','EdgeColor','b','FaceAlpha',0.5,'EdgeAlpha',0.5);
        else
            bar([controltype.branchorder.branchorder],[controltype.branchorder.numbersegments.mean],'b');
            bar([testtype.branchorder.branchorder],[testtype.branchorder.numbersegments.mean],'r');
            h = findobj(gca,'Type','patch');
            set(h(2),'FaceColor','b','EdgeColor','b','FaceAlpha',0.5,'EdgeAlpha',0.5);
            set(h(1),'FaceColor','r','EdgeColor','r','FaceAlpha',0.5,'EdgeAlpha',0.5);
        end
        set(gca,'FontSize',axesfontsize);
        hold off;
        
        currentdirectory = cd;
        %subplotspace('horizontal',-5);
        %subplotspace('vertical',-5);
        
        if nargin == 1
            [ignore,h]=suplabel([controlanalysis.inputfilename ' -- ' currentpiecetitle ' Segment Numbers']  ,'t');
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
            filename = sprintf('%s_%s_03_Seg_Nums',controlanalysis.inputfilename,currentpiecetype);
        else
            [ignore,h]=suplabel([controlanalysis.inputfilename ' vs ' testanalysis.inputfilename ' -- ' currentpiecetitle ' Segment Numbers']  ,'t');
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
            filename = sprintf('%s_%s_%s_03_Seg_Nums',controlanalysis.inputfilename,testanalysis.inputfilename,currentpiecetype);
        end
        
        print('-djpeg',filename);
        if strcmp(option.mnfigures.matfig,'y')
            saveas(gcf,filename,'fig');
        end
        
        cd(currentdirectory);
        
    end
end

