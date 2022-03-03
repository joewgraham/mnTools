function parameterdistributionfigures(controlanalysis,testanalysis)
% Parameter Distribution Figures

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
        %set(gcf,'visible','off');
        
        subplot(3,3,1); 
        box on; 
        hold on;
        xlabel('Soma Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
        ylabel('Number of Neurons','FontSize',labelfontsize,'FontWeight','b');
        if nargin == 1
            hist(controlanalysis.soma.diameter.values);
            h = findobj(gca,'Type','patch');
            set(h(1),'FaceColor','b','EdgeColor','b','FaceAlpha',0.5,'EdgeAlpha',0.5);
        else
            [ignore xvalues] = hist([controlanalysis.soma.diameter.values testanalysis.soma.diameter.values]);
            hist(controlanalysis.soma.diameter.values,xvalues);
            hist(testanalysis.soma.diameter.values,xvalues);
            h = findobj(gca,'Type','patch');
            set(h(2),'FaceColor','b','EdgeColor','b','FaceAlpha',0.5,'EdgeAlpha',0.5);
            set(h(1),'FaceColor','r','EdgeColor','r','FaceAlpha',0.5,'EdgeAlpha',0.5);
            legendhandle = gca;
        end
        set(gca,'FontSize',axesfontsize);
        hold off;
        
        
        subplot(3,3,4);
        box on;
        hold on;
        xlabel(['Number of ' currentpiecetitle 'Trunks'],'FontSize',labelfontsize,'FontWeight','b');
        ylabel('Number of Neurons','FontSize',labelfontsize,'FontWeight','b');
        if nargin == 1
            hist(controltype.numbertrunks.values);
            h = findobj(gca,'Type','patch');
            set(h(1),'FaceColor','b','EdgeColor','b','FaceAlpha',0.5,'EdgeAlpha',0.5);
        else
            [ignore xvalues] = hist([controltype.numbertrunks.values testtype.numbertrunks.values]);
            hist(controltype.numbertrunks.values,xvalues);
            hist(testtype.numbertrunks.values,xvalues);
            h = findobj(gca,'Type','patch');
            set(h(2),'FaceColor','b','EdgeColor','b','FaceAlpha',0.5,'EdgeAlpha',0.5);
            set(h(1),'FaceColor','r','EdgeColor','r','FaceAlpha',0.5,'EdgeAlpha',0.5);
        end
        set(gca,'FontSize',axesfontsize);
        hold off;
        
        
        subplot(3,3,7);
        box on;
        hold on;
        xlabel('Number of Segments','FontSize',labelfontsize,'FontWeight','b');
        ylabel('Number of Neurons','FontSize',labelfontsize,'FontWeight','b');
        if nargin == 1
            hist(controltype.numbersegments.values);
            h = findobj(gca,'Type','patch');
            set(h(1),'FaceColor','b','EdgeColor','b','FaceAlpha',0.5,'EdgeAlpha',0.5);
        else
            [ignore xvalues] = hist([controltype.numbersegments.values testtype.numbersegments.values]);
            hist(controltype.numbersegments.values,xvalues);
            hist(testtype.numbersegments.values,xvalues);
            h = findobj(gca,'Type','patch');
            set(h(2),'FaceColor','b','EdgeColor','b','FaceAlpha',0.5,'EdgeAlpha',0.5);
            set(h(1),'FaceColor','r','EdgeColor','r','FaceAlpha',0.5,'EdgeAlpha',0.5);
        end
        set(gca,'FontSize',axesfontsize);
        hold off;
        
        
        subplot(3,3,2); 
        box on; 
        hold on;
        xlabel('Total Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
        if nargin == 1
            hist(controltype.totallength.values);
            h = findobj(gca,'Type','patch');
            set(h(1),'FaceColor','b','EdgeColor','b','FaceAlpha',0.5,'EdgeAlpha',0.5);
        else
            [ignore xvalues] = hist([controltype.totallength.values testtype.totallength.values]);
            hist(controltype.totallength.values,xvalues);
            hist(testtype.totallength.values,xvalues);
            h = findobj(gca,'Type','patch');
            set(h(2),'FaceColor','b','EdgeColor','b','FaceAlpha',0.5,'EdgeAlpha',0.5);
            set(h(1),'FaceColor','r','EdgeColor','r','FaceAlpha',0.5,'EdgeAlpha',0.5);
        end
        set(gca,'FontSize',axesfontsize);
        hold off;
        
        
        subplot(3,3,5);
        box on;
        hold on;
        xlabel('Total Surface Area (\mum^2)','FontSize',labelfontsize,'FontWeight','b');
        if nargin == 1
            hist(controltype.totalsurfacearea.values);
            h = findobj(gca,'Type','patch');
            set(h(1),'FaceColor','b','EdgeColor','b','FaceAlpha',0.5,'EdgeAlpha',0.5);
        else
            [ignore xvalues] = hist([controltype.totalsurfacearea.values testtype.totalsurfacearea.values]);
            hist(controltype.totalsurfacearea.values,xvalues);
            hist(testtype.totalsurfacearea.values,xvalues);
            h = findobj(gca,'Type','patch');
            set(h(2),'FaceColor','b','EdgeColor','b','FaceAlpha',0.5,'EdgeAlpha',0.5);
            set(h(1),'FaceColor','r','EdgeColor','r','FaceAlpha',0.5,'EdgeAlpha',0.5);
        end
        set(gca,'FontSize',axesfontsize);
        hold off;
        
        
        subplot(3,3,8); 
        box on; 
        hold on;
        xlabel('Total Volume (\mum^3)','FontSize',labelfontsize,'FontWeight','b');
        if nargin == 1
            hist(controltype.totalvolume.values);
            h = findobj(gca,'Type','patch');
            set(h(1),'FaceColor','b','EdgeColor','b','FaceAlpha',0.5,'EdgeAlpha',0.5);
        else
            [ignore xvalues] = hist([controltype.totalvolume.values testtype.totalvolume.values]);
            hist(controltype.totalvolume.values,xvalues);
            hist(testtype.totalvolume.values,xvalues);
            h = findobj(gca,'Type','patch');
            set(h(2),'FaceColor','b','EdgeColor','b','FaceAlpha',0.5,'EdgeAlpha',0.5);
            set(h(1),'FaceColor','r','EdgeColor','r','FaceAlpha',0.5,'EdgeAlpha',0.5);
        end
        set(gca,'FontSize',axesfontsize);
        hold off;
        
        
        subplot(3,3,3); 
        box on; 
        hold on;
        xlabel('Mean Trunk Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
        if nargin == 1
            hist(controltype.trunk.meanproximaldiameter.values);
            h = findobj(gca,'Type','patch');
            set(h(1),'FaceColor','b','EdgeColor','b','FaceAlpha',0.5,'EdgeAlpha',0.5);
        else
            [ignore xvalues] = hist([controltype.trunk.meanproximaldiameter.values testtype.trunk.meanproximaldiameter.values]);
            hist(controltype.trunk.meanproximaldiameter.values,xvalues);
            hist(testtype.trunk.meanproximaldiameter.values,xvalues);
            h = findobj(gca,'Type','patch');
            set(h(2),'FaceColor','b','EdgeColor','b','FaceAlpha',0.5,'EdgeAlpha',0.5);
            set(h(1),'FaceColor','r','EdgeColor','r','FaceAlpha',0.5,'EdgeAlpha',0.5);
        end
        set(gca,'FontSize',axesfontsize);
        hold off;
        
        
        subplot(3,3,6);
        box on;
        hold on;
        xlabel('Maximum Degree','FontSize',labelfontsize,'FontWeight','b');
        if nargin == 1
            hist(controltype.maxdegree.values);
            h = findobj(gca,'Type','patch');
            set(h(1),'FaceColor','b','EdgeColor','b','FaceAlpha',0.5,'EdgeAlpha',0.5);
        else
            [ignore xvalues] = hist([controltype.maxdegree.values testtype.maxdegree.values]);
            hist(controltype.maxdegree.values,xvalues);
            hist(testtype.maxdegree.values,xvalues);
            h = findobj(gca,'Type','patch');
            set(h(2),'FaceColor','b','EdgeColor','b','FaceAlpha',0.5,'EdgeAlpha',0.5);
            set(h(1),'FaceColor','r','EdgeColor','r','FaceAlpha',0.5,'EdgeAlpha',0.5);
        end
        set(gca,'FontSize',axesfontsize);
        hold off;
        
        
        subplot(3,3,9);
        box on;
        hold on;
        xlabel('Maximum Branch Order','FontSize',labelfontsize,'FontWeight','b');
        if nargin == 1
            hist(controltype.maxbranchorder.values);
            h = findobj(gca,'Type','patch');
            set(h(1),'FaceColor','b','EdgeColor','b','FaceAlpha',0.5,'EdgeAlpha',0.5);
        else
            [ignore xvalues] = hist([controltype.maxbranchorder.values testtype.maxbranchorder.values]);
            hist(controltype.maxbranchorder.values,xvalues);
            hist(testtype.maxbranchorder.values,xvalues);
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
            [ignore,h]=suplabel([controlanalysis.inputfilename ' -- ' currentpiecetitle ' Population Measures']  ,'t');
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
            filename = sprintf('%s_%s_01_Pop_Meas',controlanalysis.inputfilename,currentpiecetype);
        else
            [ignore,h]=suplabel([controlanalysis.inputfilename ' vs ' testanalysis.inputfilename ' -- ' currentpiecetitle ' Population Measures']  ,'t');
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
            
            filename = sprintf('%s_%s_%s_01_Pop_Meas',controlanalysis.inputfilename,testanalysis.inputfilename,currentpiecetype);
        end
        
        print('-djpeg',filename);
        if strcmp(option.mnfigures.matfig,'y')
            saveas(gcf,filename,'fig');
        end
        
        cd(currentdirectory);
        
    end
end



    
  