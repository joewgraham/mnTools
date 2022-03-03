function parameterdistributionboxplots(controlanalysis,testanalysis)
% Parameter Distribution Comparison Box Plots

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
        
        subplot(3,4,1); box on; hold on;
        
        label='Soma Diameter (\mum)';
        names=strvcat(controlanalysis.inputfilename,testanalysis.inputfilename);
        controldata = controlanalysis.soma.diameter.values;
        comparisondata = testanalysis.soma.diameter.values;
        boxplots(boxprep(controldata,comparisondata),names,label,1);
        ylabel(label,'FontSize',labelfontsize,'FontWeight','b');
        set(gca,'FontSize',axesfontsize);hold off;
        
        
        subplot(3,4,5); box on; hold on;
        
        label='Number of Trunks';
        names=strvcat(controlanalysis.inputfilename,testanalysis.inputfilename);
        controldata = controltype.numbertrunks.values;
        comparisondata = testtype.numbertrunks.values;
        boxplots(boxprep(controldata,comparisondata),names,label,1);
        ylabel(label,'FontSize',labelfontsize,'FontWeight','b');
        set(gca,'FontSize',axesfontsize);hold off;
        
        subplot(3,4,9); box on; hold on;
        
        label='Number of Segments';
        names=strvcat(controlanalysis.inputfilename,testanalysis.inputfilename);
        controldata = controltype.numbersegments.values;
        comparisondata = testtype.numbersegments.values;
        boxplots(boxprep(controldata,comparisondata),names,label,1);
        ylabel(label,'FontSize',labelfontsize,'FontWeight','b');
        set(gca,'FontSize',axesfontsize);hold off;
        
        subplot(3,4,2); box on; hold on;
        label='Total Length (\mum)';
        names=strvcat(controlanalysis.inputfilename,testanalysis.inputfilename);
        controldata = controltype.totallength.values;
        comparisondata = testtype.totallength.values;
        boxplots(boxprep(controldata,comparisondata),names,label,1);
        ylabel(label,'FontSize',labelfontsize,'FontWeight','b');
        set(gca,'FontSize',axesfontsize);hold off;
        
        subplot(3,4,6); box on; hold on;
        label='Total Surf Area (\mum^2)';
        names=strvcat(controlanalysis.inputfilename,testanalysis.inputfilename);
        controldata = controltype.totalsurfacearea.values;
        comparisondata = testtype.totalsurfacearea.values;
        boxplots(boxprep(controldata,comparisondata),names,label,1);
        ylabel(label,'FontSize',labelfontsize,'FontWeight','b');
        set(gca,'FontSize',axesfontsize);hold off;
        
        subplot(3,4,10); box on; hold on;
        label='Total Volume (\mum^3)';
        names=strvcat(controlanalysis.inputfilename,testanalysis.inputfilename);
        controldata = controltype.totalvolume.values;
        comparisondata = testtype.totalvolume.values;
        boxplots(boxprep(controldata,comparisondata),names,label,1);
        ylabel(label,'FontSize',labelfontsize,'FontWeight','b');
        set(gca,'FontSize',axesfontsize);hold off;
        
        subplot(3,4,3); box on; hold on;
        label='Trunk Diameter (\mum)';
        names=strvcat(controlanalysis.inputfilename,testanalysis.inputfilename);
        controldata = controltype.trunk.proximaldiameter.values;
        comparisondata = testtype.trunk.proximaldiameter.values;
        boxplots(boxprep(controldata,comparisondata),names,label,1);
        ylabel(label,'FontSize',labelfontsize,'FontWeight','b');
        set(gca,'FontSize',axesfontsize);hold off;
        
        subplot(3,4,7); box on; hold on;
        label='Max Degree';
        names=strvcat(controlanalysis.inputfilename,testanalysis.inputfilename);
        controldata = controltype.maxdegree.values;
        comparisondata = testtype.maxdegree.values;
        boxplots(boxprep(controldata,comparisondata),names,label,1);
        ylabel(label,'FontSize',labelfontsize,'FontWeight','b');
        set(gca,'FontSize',axesfontsize);hold off;
        
        subplot(3,4,11); box on; hold on;
        label='Max Branch Order';
        names=strvcat(controlanalysis.inputfilename,testanalysis.inputfilename);
        controldata = controltype.maxbranchorder.values;
        comparisondata = testtype.maxbranchorder.values;
        boxplots(boxprep(controldata,comparisondata),names,label,1);
        ylabel(label,'FontSize',labelfontsize,'FontWeight','b');
        set(gca,'FontSize',axesfontsize);hold off;
        
        subplot(3,4,4); box on; hold on;
        label='Rall Ratio';
        names=strvcat(controlanalysis.inputfilename,testanalysis.inputfilename);
        controldata = controltype.bifurcation.cable.rallratio.values;
        comparisondata = testtype.bifurcation.cable.rallratio.values;
        boxplots(boxprep(controldata,comparisondata),names,label,1);
        ylabel(label,'FontSize',labelfontsize,'FontWeight','b');
        set(gca,'FontSize',axesfontsize);hold off;
        
        subplot(3,4,8); box on; hold on;
        label='Daughter Ratio';
        names=strvcat(controlanalysis.inputfilename,testanalysis.inputfilename);
        controldata = controltype.bifurcation.cable.daughterratio.values;
        comparisondata = testtype.bifurcation.cable.daughterratio.values;
        boxplots(boxprep(controldata,comparisondata),names,label,1);
        ylabel(label,'FontSize',labelfontsize,'FontWeight','b');
        set(gca,'FontSize',axesfontsize);hold off;
        
        subplot(3,4,12); box on; hold on;
        label='Max Path Length';
        names=strvcat(controlanalysis.inputfilename,testanalysis.inputfilename);
        controldata = controltype.maxbranchorder.values;
        comparisondata = testtype.maxbranchorder.values;
        boxplots(boxprep(controldata,comparisondata),names,label,1);
        ylabel(label,'FontSize',labelfontsize,'FontWeight','b');
        set(gca,'FontSize',axesfontsize);hold off;
        
        
        %subplotspace('horizontal',-5);
        %subplotspace('vertical',-5);
        
        [ignore,h]=suplabel([controlanalysis.inputfilename ' vs ' testanalysis.inputfilename ' -- ' currentpiecetitle ' Population Measures']  ,'t');
        set(h,'FontSize',titlefontsize);
        
        
        currentdirectory = cd;
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
        
        filename = sprintf('%s_%s_%s_02_Pop_Box',controlanalysis.inputfilename,testanalysis.inputfilename,currentpiecetype);
        
        print('-djpeg',filename);
        if strcmp(option.mnfigures.matfig,'y')
            saveas(gcf,filename,'fig');
        end
        
        cd(currentdirectory);
        
    end
end







