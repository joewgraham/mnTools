function trunkdistancefigures(controlanalysis,testanalysis)
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
        
        subplot(2,2,1);
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
        
        subplot(2,2,2)
        box on;
        hold on;
        ylabel('Mean Centroid Distance','FontSize',labelfontsize,'FontWeight','b');
        xlabel('Soma Diameter','FontSize',labelfontsize,'FontWeight','b');
        if nargin == 1
            controldatax = controlanalysis.soma.diameter.values;
            controldatay = controltype.trunk.meancentroiddistance.values;
            scatter(controldatax,controldatay,'bo');            
        else
            controldatax = controlanalysis.soma.diameter.values;
            controldatay = controltype.trunk.meancentroiddistance.values;
            scatter(controldatax,controldatay,'bo');
            testdatax = testanalysis.soma.diameter.values;
            testdatay = testtype.trunk.meancentroiddistance.values;
            scatter(testdatax,testdatay,'rx');
        end
        set(gca,'FontSize',axesfontsize);
        hold off;
        
        subplot(2,2,3)
        box on;
        hold on;
        ylabel('Mean Centroid Distance','FontSize',labelfontsize,'FontWeight','b');
        xlabel('Soma CSA','FontSize',labelfontsize,'FontWeight','b');
        if nargin == 1
            controldatax = controlanalysis.soma.csa.values;
            controldatay = controltype.trunk.meancentroiddistance.values;
            controldatastd = controltype.trunk.stdcentroiddistance.values;
            scatter(controldatax,controldatay,'bo');
            %errorbar(controldatax,controldatay,controldatastd/2,'bo');
        else
            controldatax = controlanalysis.soma.csa.values;
            controldatay = controltype.trunk.meancentroiddistance.values;
            controldatastd = controltype.trunk.stdcentroiddistance.values;
            scatter(controldatax,controldatay,'bo');
            testdatax = testanalysis.soma.csa.values;
            testdatay = testtype.trunk.meancentroiddistance.values;
            testdatastd = testtype.trunk.stdcentroiddistance.values;
            scatter(testdatax,testdatay,'rx');
        end
        set(gca,'FontSize',axesfontsize);
        hold off;
        
        subplot(2,2,4)
        box on;
        hold on;
        ylabel('Mean Centroid Distance','FontSize',labelfontsize,'FontWeight','b');
        xlabel('Soma Volume','FontSize',labelfontsize,'FontWeight','b');
        if nargin == 1
            controldatax = controlanalysis.soma.volume.values;
            controldatay = controltype.trunk.meancentroiddistance.values;
            scatter(controldatax,controldatay,'bo');            
        else
            controldatax = controlanalysis.soma.volume.values;
            controldatay = controltype.trunk.meancentroiddistance.values;
            scatter(controldatax,controldatay,'bo');
            testdatax = testanalysis.soma.volume.values;
            testdatay = testtype.trunk.meancentroiddistance.values;
            scatter(testdatax,testdatay,'rx');
        end
        set(gca,'FontSize',axesfontsize);
        hold off;
        
        
        
        
        
        currentdirectory = cd;
        %subplotspace('horizontal',-5);
        %subplotspace('vertical',-15);
        
        if nargin == 1
            [ignore,h]=suplabel([controlanalysis.inputfilename ' -- ' currentpiecetitle ' Trunk Distance from Centroid']  ,'t');
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
            filename = sprintf('%s_%s_07_2_TrunkDist',controlanalysis.inputfilename,currentpiecetype);
        else
            [ignore,h]=suplabel([controlanalysis.inputfilename ' vs ' testanalysis.inputfilename ' -- ' currentpiecetitle ' Trunk Distance from Centroid']  ,'t');
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
            filename = sprintf('%s_%s_%s_07_2_TrunkDist',controlanalysis.inputfilename,testanalysis.inputfilename,currentpiecetype);
        end
        
        print('-djpeg',filename);
        if strcmp(option.mnfigures.matfig,'y')
            saveas(gcf,filename,'fig');
        end
        
        cd(currentdirectory);
        
    end
end        
        
  