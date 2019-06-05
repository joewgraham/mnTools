function cableanalysisfigures_lognormal(controlanalysis,testanalysis)
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
            xlabel('log Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
            ylabel('Number of Branches','FontSize',labelfontsize,'FontWeight','b');
            if nargin == 1
                hist(log(controlcable.length.values),50);
                h = findobj(gca,'Type','patch');
                set(h(1),'FaceColor','b','EdgeColor','b','FaceAlpha',0.5,'EdgeAlpha',0.5);
            else
                [totaldata xvalues] = hist(log([controlcable.length.values testcable.length.values]),50);
                hist(log(controlcable.length.values),xvalues);
                hist(log(testcable.length.values),xvalues);
                h = findobj(gca,'Type','patch');
                set(h(2),'FaceColor','b','EdgeColor','b','FaceAlpha',0.5,'EdgeAlpha',0.5);
                set(h(1),'FaceColor','r','EdgeColor','r','FaceAlpha',0.5,'EdgeAlpha',0.5);
            end
            legendhandle = gca;
            set(gca,'FontSize',axesfontsize);
            hold off;
            
            
            subplot(2,3,2);
            box on;
            hold on;
            xlabel('log Surface Area (\mum^2)','FontSize',labelfontsize,'FontWeight','b');
            ylabel('Number of Branches','FontSize',labelfontsize,'FontWeight','b');
            if nargin == 1
                hist(log(controlcable.surfacearea.values),50);
                h = findobj(gca,'Type','patch');
                set(h(1),'FaceColor','b','EdgeColor','b','FaceAlpha',0.5,'EdgeAlpha',0.5);
            else
                [totaldata xvalues] = hist(log([controlcable.surfacearea.values testcable.surfacearea.values]),50);
                hist(log(controlcable.surfacearea.values),xvalues);
                hist(log(testcable.surfacearea.values),xvalues);
                h = findobj(gca,'Type','patch');
                set(h(2),'FaceColor','b','EdgeColor','b','FaceAlpha',0.5,'EdgeAlpha',0.5);
                set(h(1),'FaceColor','r','EdgeColor','r','FaceAlpha',0.5,'EdgeAlpha',0.5);
            end
            set(gca,'FontSize',axesfontsize);
            hold off;
            
            
            subplot(2,3,3);
            box on;
            hold on;
            xlabel('log Volume (\mum^3)','FontSize',labelfontsize,'FontWeight','b');
            ylabel('Number of Branches','FontSize',labelfontsize,'FontWeight','b');
            if nargin == 1
                hist(log(controlcable.volume.values),50);
                h = findobj(gca,'Type','patch');
                set(h(1),'FaceColor','b','EdgeColor','b','FaceAlpha',0.5,'EdgeAlpha',0.5);
            else
                [totaldata xvalues] = hist(log([controlcable.volume.values testcable.volume.values]),50);
                hist(log(controlcable.volume.values),xvalues);
                hist(log(testcable.volume.values),xvalues);
                h = findobj(gca,'Type','patch');
                set(h(2),'FaceColor','b','EdgeColor','b','FaceAlpha',0.5,'EdgeAlpha',0.5);
                set(h(1),'FaceColor','r','EdgeColor','r','FaceAlpha',0.5,'EdgeAlpha',0.5);
            end
            set(gca,'FontSize',axesfontsize);
            hold off;
            
            
            subplot(2,3,4);
            box on;
            hold on;
            xlabel('log Proximal Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
            ylabel('Number of Branches','FontSize',labelfontsize,'FontWeight','b');
            if nargin == 1
                hist(log(controlcable.proximaldiameter.values),50);
                h = findobj(gca,'Type','patch');
                set(h(1),'FaceColor','b','EdgeColor','b','FaceAlpha',0.5,'EdgeAlpha',0.5);
            else
                [totaldata xvalues] = hist(log([controlcable.proximaldiameter.values testcable.proximaldiameter.values]),50);
                hist(log(controlcable.proximaldiameter.values),xvalues);
                hist(log(testcable.proximaldiameter.values),xvalues);
                h = findobj(gca,'Type','patch');
                set(h(2),'FaceColor','b','EdgeColor','b','FaceAlpha',0.5,'EdgeAlpha',0.5);
                set(h(1),'FaceColor','r','EdgeColor','r','FaceAlpha',0.5,'EdgeAlpha',0.5);
            end
            set(gca,'FontSize',axesfontsize);
            hold off;
            
            
            subplot(2,3,5);
            box on;
            hold on;
            xlabel('log Distal Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
            ylabel('Number of Branches','FontSize',labelfontsize,'FontWeight','b');
            if nargin == 1
                hist(log(controlcable.distaldiameter.values),50);
                h = findobj(gca,'Type','patch');
                set(h(1),'FaceColor','b','EdgeColor','b','FaceAlpha',0.5,'EdgeAlpha',0.5);
            else
                [totaldata xvalues] = hist(log([controlcable.distaldiameter.values testcable.distaldiameter.values]),50);
                hist(log(controlcable.distaldiameter.values),xvalues);
                hist(log(testcable.distaldiameter.values),xvalues);
                h = findobj(gca,'Type','patch');
                set(h(2),'FaceColor','b','EdgeColor','b','FaceAlpha',0.5,'EdgeAlpha',0.5);
                set(h(1),'FaceColor','r','EdgeColor','r','FaceAlpha',0.5,'EdgeAlpha',0.5);
            end
            set(gca,'FontSize',axesfontsize);
            hold off;
            
            
            subplot(2,3,6);
            box on;
            hold on;
            xlabel('Taper Rate','FontSize',labelfontsize,'FontWeight','b');
            ylabel('Number of Branches','FontSize',labelfontsize,'FontWeight','b');
            if nargin == 1
                hist((controlcable.taperrate.values),50);
                h = findobj(gca,'Type','patch');
                set(h(1),'FaceColor','b','EdgeColor','b','FaceAlpha',0.5,'EdgeAlpha',0.5);
            else
                [totaldata xvalues] = hist([controlcable.taperrate.values testcable.taperrate.values],50);
                hist(controlcable.taperrate.values,xvalues);
                hist(testcable.taperrate.values,xvalues);
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
                filename = sprintf('%s_%s_23_%.0f_CableLog',controlanalysis.inputfilename,currentpiecetype,branchtype);
            else
                [ignore,h]=suplabel([controlanalysis.inputfilename ' vs ' testanalysis.inputfilename ' -- ' currentpiecetitle ' Cable Analysis (log): ' branchtitle]  ,'t');
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
                filename = sprintf('%s_%s_%s_23_%.0f_CableLog',controlanalysis.inputfilename,testanalysis.inputfilename,currentpiecetype,branchtype);
            end
            
            print('-djpeg',filename);
            if strcmp(option.mnfigures.matfig,'y')
                saveas(gcf,filename,'fig');
            end
            
            cd(currentdirectory);
            
        end
    end
end
