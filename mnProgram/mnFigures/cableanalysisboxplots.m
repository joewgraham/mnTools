function cableanalysisboxplots(controlanalysis,testanalysis)
% Cable analysis figures

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
                
        for branchtype = 1:3
            
            if branchtype == 1
                branchtitle = 'All Branches';
                eval(['controlcable = controlanalysis.' piecetypes{piecetype} '.cable;']);
                if nargin == 2
                    eval(['testcable = testanalysis.' piecetypes{piecetype} '.cable;']);
                end
            elseif branchtype == 2
                branchtitle = 'Bifurcating Branches';
                eval(['controlcable = controlanalysis.' piecetypes{piecetype} '.bifurcation.cable;']);
                if nargin == 2
                    eval(['testcable = testanalysis.' piecetypes{piecetype} '.bifurcation.cable;']);
                end
            elseif branchtype == 3
                branchtitle = 'Terminating Branches';
                eval(['controlcable = controlanalysis.' piecetypes{piecetype} '.termination.cable;']);
                if nargin == 2
                    eval(['testcable = testanalysis.' piecetypes{piecetype} '.termination.cable;']);
                end
            end
            
            figure;
            
            subplot(2,3,1);
            box on;
            hold on;
            ylabel('Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
            if nargin == 2
                controldata = controlcable.length.values;
                comparisondata = testcable.length.values;
                boxplot(boxprep(controldata,comparisondata));
                set(gca,'FontSize',axesfontsize);hold off;
            end
            legendhandle = gca;
            set(gca,'FontSize',axesfontsize);
            hold off;
            
            
            subplot(2,3,2);
            box on;
            hold on;
            ylabel('Surface Area (\mum^2)','FontSize',labelfontsize,'FontWeight','b');
            if nargin == 2
                controldata = controlcable.surfacearea.values;
                comparisondata = testcable.surfacearea.values;
                boxplot(boxprep(controldata,comparisondata));
                set(gca,'FontSize',axesfontsize);hold off;
            end
            set(gca,'FontSize',axesfontsize);
            hold off;
            
            
            subplot(2,3,3);
            box on;
            hold on;
            ylabel('Volume (\mum^3)','FontSize',labelfontsize,'FontWeight','b');
            if nargin == 2
                controldata = controlcable.volume.values;
                comparisondata = testcable.volume.values;
                boxplot(boxprep(controldata,comparisondata));
                set(gca,'FontSize',axesfontsize);hold off;
            end
            set(gca,'FontSize',axesfontsize);
            hold off;
            
            
            subplot(2,3,4);
            box on;
            hold on;
            ylabel('Proximal Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
            if nargin == 2
                controldata = controlcable.proximaldiameter.values;
                comparisondata = testcable.proximaldiameter.values;
                boxplot(boxprep(controldata,comparisondata));
                set(gca,'FontSize',axesfontsize);hold off;
            end
            set(gca,'FontSize',axesfontsize);
            hold off;
            
            
            subplot(2,3,5);
            box on;
            hold on;
            ylabel('Distal Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
            if nargin == 2
                controldata = controlcable.distaldiameter.values;
                comparisondata = testcable.distaldiameter.values;
                boxplot(boxprep(controldata,comparisondata));
                set(gca,'FontSize',axesfontsize);hold off;
            end
            set(gca,'FontSize',axesfontsize);
            hold off;
            
            
            subplot(2,3,6);
            box on;
            hold on;
            ylabel('Taper Rate','FontSize',labelfontsize,'FontWeight','b');
            if nargin == 2
                controldata = controlcable.taperrate.values;
                comparisondata = testcable.taperrate.values;
                boxplot(boxprep(controldata,comparisondata));
                set(gca,'FontSize',axesfontsize);hold off;
            end
            set(gca,'FontSize',axesfontsize);
            hold off;
            
                       
            currentdirectory = cd;
            %%%%subplotspace('horizontal',-5);
            %%%%subplotspace('vertical',-5);
            
            if nargin == 1
                [ignore,h]=suplabel([controlanalysis.inputfilename ' -- ' currentpiecetitle ' Cable Analysis: ' branchtitle]  ,'t');
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
                filename = sprintf('%s_%s_23_%.0f_CableBox',controlanalysis.inputfilename,currentpiecetype,branchtype);
            else
                [ignore,h]=suplabel([controlanalysis.inputfilename ' vs ' testanalysis.inputfilename ' -- ' currentpiecetitle ' Cable Analysis: ' branchtitle]  ,'t');
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
                filename = sprintf('%s_%s_%s_23_%.0f_CableBox',controlanalysis.inputfilename,testanalysis.inputfilename,currentpiecetype,branchtype);
            end
            
            print('-djpeg',filename);
            if strcmp(option.mnfigures.matfig,'y')
                saveas(gcf,filename,'fig');
            end
            
            cd(currentdirectory);
            
        end
    end
end
