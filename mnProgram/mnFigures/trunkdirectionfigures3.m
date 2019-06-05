function trunkdirectionfigures3(controlanalysis,testanalysis)
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
        
           
        subplot(2,2,1)
        box on;
        hold on;
        ylabel('Trunk Elevation','FontSize',labelfontsize,'FontWeight','b');
        xlabel('Centroid-to-Trunk Elevation','FontSize',labelfontsize,'FontWeight','b');
        if nargin == 1
            controldatax = controltype.trunk.elevationfromcentroid.values;
            controldatay = controltype.trunk.proximalelevation.values;
            scatter(controldatax,controldatay,'bo');            
        else
            controldatax = controltype.trunk.elevationfromcentroid.values;
            controldatay = controltype.trunk.proximalelevation.values;
            scatter(controldatax,controldatay,'bo');
            testdatax = testtype.trunk.elevationfromcentroid.values;
            testdatay = testtype.trunk.proximalelevation.values;
            scatter(testdatax,testdatay,'rx');
        end
        set(gca,'FontSize',axesfontsize);
        hold off;

        subplot(2,2,2)
        box on;
        hold on;
        ylabel('Trunk Elevation','FontSize',labelfontsize,'FontWeight','b');
        xlabel('Centroid-to-Trunk Azimuth','FontSize',labelfontsize,'FontWeight','b');
        if nargin == 1
            controldatax = controltype.trunk.azimuthfromcentroid.values;
            controldatay = controltype.trunk.proximalelevation.values;
            scatter(controldatax,controldatay,'bo');            
        else
            controldatax = controltype.trunk.azimuthfromcentroid.values;
            controldatay = controltype.trunk.proximalelevation.values;
            scatter(controldatax,controldatay,'bo');
            testdatax = testtype.trunk.azimuthfromcentroid.values;
            testdatay = testtype.trunk.proximalelevation.values;
            scatter(testdatax,testdatay,'rx');
        end
        set(gca,'FontSize',axesfontsize);
        hold off;
        
        subplot(2,2,3)
        box on;
        hold on;
        ylabel('Trunk Azimuth','FontSize',labelfontsize,'FontWeight','b');
        xlabel('Centroid-to-Trunk Elevation','FontSize',labelfontsize,'FontWeight','b');
        if nargin == 1
            controldatax = controltype.trunk.elevationfromcentroid.values;
            controldatay = controltype.trunk.proximalazimuth.values;
            scatter(controldatax,controldatay,'bo');            
        else
            controldatax = controltype.trunk.elevationfromcentroid.values;
            controldatay = controltype.trunk.proximalazimuth.values;
            scatter(controldatax,controldatay,'bo');
            testdatax = testtype.trunk.elevationfromcentroid.values;
            testdatay = testtype.trunk.proximalazimuth.values;
            scatter(testdatax,testdatay,'rx');
        end
        set(gca,'FontSize',axesfontsize);
        hold off;
        
        subplot(2,2,4)
        box on;
        hold on;
        ylabel('Trunk Azimuth','FontSize',labelfontsize,'FontWeight','b');
        xlabel('Centroid-to-Trunk Azimuth','FontSize',labelfontsize,'FontWeight','b');
        if nargin == 1
            controldatax = controltype.trunk.azimuthfromcentroid.values;
            controldatay = controltype.trunk.proximalazimuth.values;
            scatter(controldatax,controldatay,'bo');            
        else
            controldatax = controltype.trunk.azimuthfromcentroid.values;
            controldatay = controltype.trunk.proximalazimuth.values;
            scatter(controldatax,controldatay,'bo');
            testdatax = testtype.trunk.azimuthfromcentroid.values;
            testdatay = testtype.trunk.proximalazimuth.values;
            scatter(testdatax,testdatay,'rx');
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
            filename = sprintf('%s_%s_07_7_TrunkDir',controlanalysis.inputfilename,currentpiecetype);
        else
            [ignore,h]=suplabel([controlanalysis.inputfilename ' vs ' testanalysis.inputfilename ' -- ' currentpiecetitle ' Trunk Direction']  ,'t');
            set(h,'FontSize',titlefontsize);
            %legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
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
            filename = sprintf('%s_%s_%s_07_7_TrunkDir',controlanalysis.inputfilename,testanalysis.inputfilename,currentpiecetype);
        end
        
        print('-djpeg',filename);
        if strcmp(option.mnfigures.matfig,'y')
            saveas(gcf,filename,'fig');
        end
        
        cd(currentdirectory);
        
    end
end        
        
  