function parameterscatterplots(controldata,controlanalysis,testdata,testanalysis)
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
    
    if isfield(controldata.population,piecetypes{piecetype})
        
        currentpiecetype = piecetypes{piecetype};
        currentpiecetitle = piecetitles{piecetype};
        eval(['controltypedata = controldata.population.' currentpiecetype ';']);
        eval(['controltypeanalysis = controlanalysis.' currentpiecetype ';']);
        if nargin > 2
            eval(['testtypedata = testdata.population.' currentpiecetype ';']);
            eval(['testtypeanalysis = testanalysis.' currentpiecetype ';']);
        end
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
        figure;
        
        subplot(3,2,1);
        box on;
        hold on;
        xlabel('Taper Rate','FontSize',labelfontsize,'FontWeight','b');
        ylabel('Number of Pieces','FontSize',labelfontsize,'FontWeight','b');
        if nargin == 2
            %hist([controltypedata.bifurcation.piece.taperrate],'g');
            %h = findobj(gca,'Type','patch');
            %set(h(1),'FaceColor','g','EdgeColor','g','FaceAlpha',0.5,'EdgeAlpha',0.5);
        else
            %hist([controltypedata.bifurcation.piece.taperrate],'g');
            %hist([testtypedata.bifurcation.piece.taperrate],'y');
            %h = findobj(gca,'Type','patch');
            %set(h(1),'FaceColor','g','EdgeColor','g','FaceAlpha',0.5,'EdgeAlpha',0.5);
            %set(h(2),'FaceColor','y','EdgeColor','y','FaceAlpha',0.5,'EdgeAlpha',0.5);
            %legendhandle = gca;
        end
        set(gca,'FontSize',axesfontsize);
        hold off;
        
        subplot(3,2,3);
        box on;
        hold on;
        xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
        ylabel('Bifurcation Taper Rate','FontSize',labelfontsize,'FontWeight','b');
        if nargin == 2
            scatter([controltypedata.bifurcation.piece.proximaldiameter],[controltypedata.bifurcation.piece.taperrate],'gs');            
        else
            scatter([controltypedata.bifurcation.piece.proximaldiameter],[controltypedata.bifurcation.piece.taperrate],'gs');
            scatter([testtypedata.bifurcation.piece.proximaldiameter],[testtypedata.bifurcation.piece.taperrate],'yo');
            legendhandle = gca;
        end
        set(gca,'FontSize',axesfontsize);
        hold off;
        
        
        subplot(3,2,5);
        box on;
        hold on;
        xlabel('Intrabranch Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
        ylabel('Bifurcation Taper Rate','FontSize',labelfontsize,'FontWeight','b');
        if nargin == 2
            scatter([controltypedata.bifurcation.piece.proximalbranchlength],[controltypedata.bifurcation.piece.taperrate],'gs');
        else
            scatter([controltypedata.bifurcation.piece.proximalbranchlength],[controltypedata.bifurcation.piece.taperrate],'gs');
            scatter([testtypedata.bifurcation.piece.proximalbranchlength],[testtypedata.bifurcation.piece.taperrate],'yo');
        end
        set(gca,'FontSize',axesfontsize);
        hold off;
        
        
        subplot(3,2,2);
        box on;
        hold on;
        xlabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
        if nargin == 2
            scatter([controltypedata.bifurcation.piece.proximalpathlength],[controltypedata.bifurcation.piece.taperrate],'gs');
        else
            scatter([controltypedata.bifurcation.piece.proximalpathlength],[controltypedata.bifurcation.piece.taperrate],'gs');
            scatter([testtypedata.bifurcation.piece.proximalpathlength],[testtypedata.bifurcation.piece.taperrate],'yo');
        end
        set(gca,'FontSize',axesfontsize);
        hold off;
        
        
        subplot(3,2,4);
        box on;
        hold on;
        xlabel('Radial Distance (\mum)','FontSize',labelfontsize,'FontWeight','b');
        if nargin == 2
            scatter([controltypedata.bifurcation.piece.proximalradialdistance],[controltypedata.bifurcation.piece.taperrate],'gs');
        else
            scatter([controltypedata.bifurcation.piece.proximalradialdistance],[controltypedata.bifurcation.piece.taperrate],'gs');
            scatter([testtypedata.bifurcation.piece.proximalradialdistance],[testtypedata.bifurcation.piece.taperrate],'yo');
        end
        set(gca,'FontSize',axesfontsize);
        hold off;
        
        
        subplot(3,2,6);
        box on;
        hold on;
        xlabel('Branch Order','FontSize',labelfontsize,'FontWeight','b');
        if nargin == 2
            scatter([controltypedata.bifurcation.piece.branchorder],[controltypedata.bifurcation.piece.taperrate],'gs');
        else
            scatter([controltypedata.bifurcation.piece.branchorder],[controltypedata.bifurcation.piece.taperrate],'gs');
            scatter([testtypedata.bifurcation.piece.branchorder],[testtypedata.bifurcation.piece.taperrate],'yo');
        end
        set(gca,'FontSize',axesfontsize);
        hold off;
        
        currentdirectory = cd;
        subplotspace('horizontal',-5);
        subplotspace('vertical',-5);
        
        if nargin == 2
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
            filename = sprintf('%s_%s_22_BifTaper_Scatter',controlanalysis.inputfilename,currentpiecetype);
        else
            [ignore,h]=suplabel([controlanalysis.inputfilename ' vs ' testanalysis.inputfilename ' -- ' currentpiecetitle ' Segment Numbers']  ,'t');
            set(h,'FontSize',titlefontsize);
            legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
            cd(controlanalysis.datapathname);
            cd ..
            if exist(sprintf('%s_%s_comparison',controlanalysis.inputfilename,testanalysis.inputfilename),'dir') ~= 7;
                mkdir(sprintf('%s_%s_comparison',controlanalysis.inputfilename,testanalysis.inputfilename));
            end
            cd(sprintf('%s_%s_comparison',controlanalysis.inputfilename,testanalysis.inputfilename));
            if exist(piecetypes{piecetype},'dir') ~= 7
                mkdir(piecetypes{piecetype});
            end
            cd(piecetypes{piecetype});
            filename = sprintf('%s_%s_%s_22_BifTaper_Scatter',controlanalysis.inputfilename,testanalysis.inputfilename,currentpiecetype);
        end
        
        print('-djpeg',filename);
        if strcmp(option.mnfigures.matfig,'y')
            saveas(gcf,filename,'fig');
        end
        
        cd(currentdirectory);
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
                figure;
        
        subplot(3,2,1);
        box on;
        hold on;
        xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
        ylabel('Bifurcation Taper Rate','FontSize',labelfontsize,'FontWeight','b');
        if nargin == 2
            scatter([controltypedata.bifurcation.piece.proximaldiameter],[controltypedata.bifurcation.piece.taperrate],'gs');            
        else
            scatter([controltypedata.bifurcation.piece.proximaldiameter],[controltypedata.bifurcation.piece.taperrate],'gs');
            scatter([testtypedata.bifurcation.piece.proximaldiameter],[testtypedata.bifurcation.piece.taperrate],'yo');
            legendhandle = gca;
        end
        set(gca,'FontSize',axesfontsize);
        hold off;
        
        
        subplot(3,2,3);
        box on;
        hold on;
        xlabel('Intrabranch Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
        ylabel('Bifurcation Taper Rate','FontSize',labelfontsize,'FontWeight','b');
        if nargin == 2
            scatter([controltypedata.bifurcation.piece.proximalbranchlength],[controltypedata.bifurcation.piece.taperrate],'gs');
        else
            scatter([controltypedata.bifurcation.piece.proximalbranchlength],[controltypedata.bifurcation.piece.taperrate],'gs');
            scatter([testtypedata.bifurcation.piece.proximalbranchlength],[testtypedata.bifurcation.piece.taperrate],'yo');
        end
        set(gca,'FontSize',axesfontsize);
        hold off;
        
        
        subplot(3,2,5);
        box on;
        hold on;
        xlabel('Degree','FontSize',labelfontsize,'FontWeight','b');
        ylabel('Bifurcation Taper Rate','FontSize',labelfontsize,'FontWeight','b');
        if nargin == 2
            scatter([controltypedata.bifurcation.piece.proximaldiameter],[controltypedata.bifurcation.piece.taperrate],'gs');
        else
            scatter([controltypedata.bifurcation.piece.proximaldiameter],[controltypedata.bifurcation.piece.taperrate],'gs');
            scatter([testtypedata.bifurcation.piece.proximaldiameter],[testtypedata.bifurcation.piece.taperrate],'yo');
        end
        set(gca,'FontSize',axesfontsize);
        hold off;
        
        
        subplot(3,2,2);
        box on;
        hold on;
        xlabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
        if nargin == 2
            scatter([controltypedata.bifurcation.piece.proximaldiameter],[controltypedata.bifurcation.piece.taperrate],'gs');
        else
            scatter([controltypedata.bifurcation.piece.proximaldiameter],[controltypedata.bifurcation.piece.taperrate],'gs');
            scatter([testtypedata.bifurcation.piece.proximaldiameter],[testtypedata.bifurcation.piece.taperrate],'yo');
        end
        set(gca,'FontSize',axesfontsize);
        hold off;
        
        
        subplot(3,2,4);
        box on;
        hold on;
        xlabel('Radial Distance (\mum)','FontSize',labelfontsize,'FontWeight','b');
        if nargin == 2
            scatter([controltypedata.bifurcation.piece.proximaldiameter],[controltypedata.bifurcation.piece.taperrate],'gs');
        else
            scatter([controltypedata.bifurcation.piece.proximaldiameter],[controltypedata.bifurcation.piece.taperrate],'gs');
            scatter([testtypedata.bifurcation.piece.proximaldiameter],[testtypedata.bifurcation.piece.taperrate],'yo');
        end
        set(gca,'FontSize',axesfontsize);
        hold off;
        
        
        subplot(3,2,6);
        box on;
        hold on;
        xlabel('Branch Order','FontSize',labelfontsize,'FontWeight','b');
        if nargin == 2
            scatter([controltypedata.bifurcation.piece.proximaldiameter],[controltypedata.bifurcation.piece.taperrate],'gs');
        else
            scatter([controltypedata.bifurcation.piece.proximaldiameter],[controltypedata.bifurcation.piece.taperrate],'gs');
            scatter([testtypedata.bifurcation.piece.proximaldiameter],[testtypedata.bifurcation.piece.taperrate],'yo');
        end
        set(gca,'FontSize',axesfontsize);
        hold off;
        
        currentdirectory = cd;
        subplotspace('horizontal',-5);
        subplotspace('vertical',-5);
        
        if nargin == 2
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
            cd(controlanalysis.datapathname);
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

