function branchingparametersscatterplots(controlanalysis,testanalysis)
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
        
        for branchparameters = 1:2
            
            if branchparameters == 1
                prmlabel = 'Rall Ratio';
                controly = [controltype.bifurcation.cable.rallratio.values];
                if nargin == 2, testy = [testtype.bifurcation.cable.rallratio.values]; end;
            elseif branchparameters == 2
                prmlabel = 'Daughter Ratio';
                controly = [controltype.bifurcation.cable.daughterratio.values];
                if nargin == 2, testy = [testtype.bifurcation.cable.daughterratio.values]; end;
            end
                       
            
            figure;
            
            subplot(3,2,1);
            box on;
            hold on;
            xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
            ylabel(prmlabel,'FontSize',labelfontsize,'FontWeight','b');
            if nargin == 1
                controlx = [controltype.bifurcation.cable.distaldiameter.values];
                scatter(controlx,controly,'bo');
            else
                controlx = [controltype.bifurcation.cable.distaldiameter.values];
                scatter(controlx,controly,'bo');
                testx = [testtype.bifurcation.cable.distaldiameter.values];
                scatter(testx,testy,'rx');
                legendhandle = gca;
            end
            set(gca,'FontSize',axesfontsize);
            hold off;
            
            
            subplot(3,2,3);
            box on;
            hold on;
            xlabel('Intrabranch Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
            ylabel(prmlabel,'FontSize',labelfontsize,'FontWeight','b');
            if nargin == 1
                controlx = [controltype.bifurcation.cable.length.values];
                scatter(controlx,controly,'bo');
            else
                controlx = [controltype.bifurcation.cable.length.values];
                scatter(controlx,controly,'bo');
                testx = [testtype.bifurcation.cable.length.values];
                scatter(testx,testy,'rx');
            end
            set(gca,'FontSize',axesfontsize);
            hold off;
            
            
            subplot(3,2,5);
            box on;
            hold on;
            xlabel('Degree','FontSize',labelfontsize,'FontWeight','b');
            ylabel(prmlabel,'FontSize',labelfontsize,'FontWeight','b');
            if nargin == 1
                controlx = [controltype.bifurcation.cable.degree.values];
                scatter(controlx,controly,'bo');
            else
                controlx = [controltype.bifurcation.cable.degree.values];
                scatter(controlx,controly,'bo');
                testx = [testtype.bifurcation.cable.degree.values];
                scatter(testx,testy,'rx');
            end
            set(gca,'FontSize',axesfontsize);
            hold off;
            
            
            subplot(3,2,2);
            box on;
            hold on;
            xlabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
            if nargin == 1
                controlx = [controltype.bifurcation.cable.distalpathlength.values];
                scatter(controlx,controly,'bo');
            else
                controlx = [controltype.bifurcation.cable.distalpathlength.values];
                scatter(controlx,controly,'bo');
                testx = [testtype.bifurcation.cable.distalpathlength.values];
                scatter(testx,testy,'rx');
            end
            set(gca,'FontSize',axesfontsize);
            hold off;
            
            
            subplot(3,2,4);
            box on;
            hold on;
            xlabel('Radial Distance (\mum)','FontSize',labelfontsize,'FontWeight','b');
            if nargin == 1
                controlx = [controltype.bifurcation.cable.distalradialdistance.values];
                scatter(controlx,controly,'bo');
            else
                controlx = [controltype.bifurcation.cable.distalradialdistance.values];
                scatter(controlx,controly,'bo');
                testx = [testtype.bifurcation.cable.distalradialdistance.values];
                scatter(testx,testy,'rx');
            end
            set(gca,'FontSize',axesfontsize);
            hold off;
            
            
            subplot(3,2,6);
            box on;
            hold on;
            xlabel('Branch Order','FontSize',labelfontsize,'FontWeight','b');
            if nargin == 1
                controlx = [controltype.bifurcation.cable.branchorder.values];
                scatter(controlx,controly,'bo');
            else
                controlx = [controltype.bifurcation.cable.branchorder.values];
                scatter(controlx,controly,'bo');
                testx = [testtype.bifurcation.cable.branchorder.values];
                scatter(testx,testy,'rx');
            end
            set(gca,'FontSize',axesfontsize);
            hold off;
            
            currentdirectory = cd;
            %%subplotspace('horizontal',-5);
            %%subplotspace('vertical',-5);
            
            if nargin == 1
                [ignore,h]=suplabel([controlanalysis.inputfilename ' -- ' currentpiecetitle ' ' prmlabel]  ,'t');
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
                filename = sprintf('%s_%s_22_%d_Scatter',controlanalysis.inputfilename,currentpiecetype,branchparameters);
            else
                [ignore,h]=suplabel([controlanalysis.inputfilename ' vs ' testanalysis.inputfilename ' -- ' currentpiecetitle ' ' prmlabel]  ,'t');
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
                filename = sprintf('%s_%s_%s_22_%d_Scatter',controlanalysis.inputfilename,testanalysis.inputfilename,currentpiecetype,branchparameters);
            end
            
            print('-djpeg',filename);
            if strcmp(option.mnfigures.matfig,'y')
                saveas(gcf,filename,'fig');
            end
            
            cd(currentdirectory);
            
        end
    end
end

