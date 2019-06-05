function trunkdirectionfigures2(controlanalysis,testanalysis)
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
        
           
        subplot(3,3,1)
        box on;
        hold on;
        ylabel('Elevation','FontSize',labelfontsize,'FontWeight','b');
        xlabel('x Distance from Centroid','FontSize',labelfontsize,'FontWeight','b');
        if nargin == 1
            controldatax = controltype.trunk.xfromcentroid.values;
            controldatay = controltype.trunk.proximalelevation.values;
            scatter(controldatax,controldatay,'bo');            
        else
            controldatax = controltype.trunk.xfromcentroid.values;
            controldatay = controltype.trunk.proximalelevation.values;
            scatter(controldatax,controldatay,'bo');
            testdatax = testtype.trunk.xfromcentroid.values;
            testdatay = testtype.trunk.proximalelevation.values;
            scatter(testdatax,testdatay,'rx');
        end
        set(gca,'FontSize',axesfontsize);
        hold off;

        subplot(3,3,2)
        box on;
        hold on;
        ylabel('Elevation','FontSize',labelfontsize,'FontWeight','b');
        xlabel('y Distance from Centroid','FontSize',labelfontsize,'FontWeight','b');
        if nargin == 1
            controldatax = controltype.trunk.yfromcentroid.values;
            controldatay = controltype.trunk.proximalelevation.values;
            scatter(controldatax,controldatay,'bo');            
        else
            controldatax = controltype.trunk.yfromcentroid.values;
            controldatay = controltype.trunk.proximalelevation.values;
            scatter(controldatax,controldatay,'bo');
            testdatax = testtype.trunk.yfromcentroid.values;
            testdatay = testtype.trunk.proximalelevation.values;
            scatter(testdatax,testdatay,'rx');
        end
        set(gca,'FontSize',axesfontsize);
        hold off;
        
        subplot(3,3,3)
        box on;
        hold on;
        ylabel('Elevation','FontSize',labelfontsize,'FontWeight','b');
        xlabel('z Distance from Centroid','FontSize',labelfontsize,'FontWeight','b');
        if nargin == 1
            controldatax = controltype.trunk.zfromcentroid.values;
            controldatay = controltype.trunk.proximalelevation.values;
            scatter(controldatax,controldatay,'bo');            
        else
            controldatax = controltype.trunk.zfromcentroid.values;
            controldatay = controltype.trunk.proximalelevation.values;
            scatter(controldatax,controldatay,'bo');
            testdatax = testtype.trunk.zfromcentroid.values;
            testdatay = testtype.trunk.proximalelevation.values;
            scatter(testdatax,testdatay,'rx');
        end
        set(gca,'FontSize',axesfontsize);
        hold off;
        
        subplot(3,3,4)
        box on;
        hold on;
        ylabel('Azimuth','FontSize',labelfontsize,'FontWeight','b');
        xlabel('x Distance from Centroid','FontSize',labelfontsize,'FontWeight','b');
        if nargin == 1
            controldatax = controltype.trunk.xfromcentroid.values;
            controldatay = controltype.trunk.proximalazimuth.values;
            scatter(controldatax,controldatay,'bo');            
        else
            controldatax = controltype.trunk.xfromcentroid.values;
            controldatay = controltype.trunk.proximalazimuth.values;
            scatter(controldatax,controldatay,'bo');
            testdatax = testtype.trunk.xfromcentroid.values;
            testdatay = testtype.trunk.proximalazimuth.values;
            scatter(testdatax,testdatay,'rx');
        end
        set(gca,'FontSize',axesfontsize);
        hold off;
        
        subplot(3,3,5)
        box on;
        hold on;
        ylabel('Azimuth','FontSize',labelfontsize,'FontWeight','b');
        xlabel('y Distance from Centroid','FontSize',labelfontsize,'FontWeight','b');
        if nargin == 1
            controldatax = controltype.trunk.yfromcentroid.values;
            controldatay = controltype.trunk.proximalazimuth.values;
            scatter(controldatax,controldatay,'bo');            
        else
            controldatax = controltype.trunk.yfromcentroid.values;
            controldatay = controltype.trunk.proximalazimuth.values;
            scatter(controldatax,controldatay,'bo');
            testdatax = testtype.trunk.yfromcentroid.values;
            testdatay = testtype.trunk.proximalazimuth.values;
            scatter(testdatax,testdatay,'rx');
        end
        set(gca,'FontSize',axesfontsize);
        hold off;
        
        subplot(3,3,6)
        box on;
        hold on;
        ylabel('Azimuth','FontSize',labelfontsize,'FontWeight','b');
        xlabel('z Distance from Centroid','FontSize',labelfontsize,'FontWeight','b');
        if nargin == 1
            controldatax = controltype.trunk.zfromcentroid.values;
            controldatay = controltype.trunk.proximalazimuth.values;
            scatter(controldatax,controldatay,'bo');            
        else
            controldatax = controltype.trunk.zfromcentroid.values;
            controldatay = controltype.trunk.proximalazimuth.values;
            scatter(controldatax,controldatay,'bo');
            testdatax = testtype.trunk.zfromcentroid.values;
            testdatay = testtype.trunk.proximalazimuth.values;
            scatter(testdatax,testdatay,'rx');
        end
        set(gca,'FontSize',axesfontsize);
        hold off;
        
        subplot(3,3,7)
        box on;
        hold on;
        ylabel('Distance from Centroid','FontSize',labelfontsize,'FontWeight','b');
        xlabel('x Distance from Centroid','FontSize',labelfontsize,'FontWeight','b');
        if nargin == 1
            controldatax = controltype.trunk.xfromcentroid.values;
            controldatay = controltype.trunk.centroiddistance.values;
            scatter(controldatax,controldatay,'bo');            
        else
            controldatax = controltype.trunk.xfromcentroid.values;
            controldatay = controltype.trunk.proximalzdirection.values;
            scatter(controldatax,controldatay,'bo');
            testdatax = testtype.trunk.xfromcentroid.values;
            testdatay = testtype.trunk.proximalzdirection.values;
            scatter(testdatax,testdatay,'rx');
        end
        set(gca,'FontSize',axesfontsize);
        hold off;
        
        subplot(3,3,8)
        box on;
        hold on;
        ylabel('Distance from Centroid','FontSize',labelfontsize,'FontWeight','b');
        xlabel('y Distance from Centroid','FontSize',labelfontsize,'FontWeight','b');
        if nargin == 1
            controldatax = controltype.trunk.yfromcentroid.values;
            controldatay = controltype.trunk.centroiddistance.values;
            scatter(controldatax,controldatay,'bo');            
        else
            controldatax = controltype.trunk.yfromcentroid.values;
            controldatay = controltype.trunk.proximalzdirection.values;
            scatter(controldatax,controldatay,'bo');
            testdatax = testtype.trunk.yfromcentroid.values;
            testdatay = testtype.trunk.proximalzdirection.values;
            scatter(testdatax,testdatay,'rx');
        end
        set(gca,'FontSize',axesfontsize);
        hold off;
        
        subplot(3,3,9)
        box on;
        hold on;
        ylabel('Distance from Centroid','FontSize',labelfontsize,'FontWeight','b');
        xlabel('z Distance from Centroid','FontSize',labelfontsize,'FontWeight','b');
        if nargin == 1
            controldatax = controltype.trunk.zfromcentroid.values;
            controldatay = controltype.trunk.centroiddistance.values;
            scatter(controldatax,controldatay,'bo');            
        else
            controldatax = controltype.trunk.zfromcentroid.values;
            controldatay = controltype.trunk.proximalzdirection.values;
            scatter(controldatax,controldatay,'bo');
            testdatax = testtype.trunk.zfromcentroid.values;
            testdatay = testtype.trunk.proximalzdirection.values;
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
            filename = sprintf('%s_%s_07_6_TrunkDir',controlanalysis.inputfilename,currentpiecetype);
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
            filename = sprintf('%s_%s_%s_07_6_TrunkDir',controlanalysis.inputfilename,testanalysis.inputfilename,currentpiecetype);
        end
        
        print('-djpeg',filename);
        if strcmp(option.mnfigures.matfig,'y')
            saveas(gcf,filename,'fig');
        end
        
        cd(currentdirectory);
        
    end
end        
        
  