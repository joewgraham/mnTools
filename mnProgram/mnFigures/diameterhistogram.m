function diameterhistogram(controlanalysis,testanalysis)
% Diameter Figures

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

        figure; box on; 

        if nargin == 1

            controldatax   = [controltype.diameter.diameter];
            controldatay   = [controltype.diameter.numbersegments.total];
            

            bar(controldatax,controldatay,'b');
            ylabel('Number of Segments','FontSize',labelfontsize,'FontWeight','b');
            xlabel('Diameter Bins (\mum)','FontSize',labelfontsize,'FontWeight','b');
            %h=gca; set(gca,'XDir','reverse');
            hold on;
            %     ylimits=ylim;
            %     ylimits=[0 ylimits(2)];
            %     ylim(ylimits);
            %     xlimits=xlim;
            %     xtick = get(gca,'xtick');
            %     set(gca,'xticklabel', []);
            title(['Total Number of ' currentpiecetitle ' Segments in Diameter Bins'],'FontSize',20,'FontWeight','b');
            hold off;

            

            %subplotspace('horizontal',-20);
            %subplotspace('vertical',-20);

            %[ax,h1]=suplabel('Local Diameter (\mum)');
            %[ax,h2]=suplabel('Diameter (\mum)','y');
            %[ax,h3]=suplabel('Total Number of Segments in Diameter Bins'  ,'t');
            %set(h1,'FontSize',15);
            %set(h3,'FontSize',20);

            currentdirectory = cd;
            cd(controlanalysis.datapathname);

            if exist('figures','dir')==7
                cd('figures');
            else
                mkdir('figures');
                cd('figures');
            end

            %fillscreen;

            filename = sprintf('%s_%s_%s',controlanalysis.inputfilename, currentpiecetype, '302_Diameter_Dist');
            print('-djpeg',filename);
            %saveas(gcf,filename,'fig');

        end

        if nargin == 2
            
            controldatax   = [controltype.diameter.diameter];
            controldatay   = [controltype.diameter.numbersegments.total];
            testdatax   = [testtype.diameter.diameter];
            testdatay   = [testtype.diameter.numbersegments.total];
            
            h1 = bar(controldatax,controldatay,'b');
            hold on;
            h2 = bar(testdatax,testdatay,'r');
            ylabel('Number of Segments','FontSize',labelfontsize,'FontWeight','b');
            xlabel('Diameter Bins (\mum)','FontSize',labelfontsize,'FontWeight','b');
            legendhandle = gca; 
            %h=gca; set(gca,'XDir','reverse');
            h = findobj(gca,'Type','patch');
            set(h2,'FaceColor','b','EdgeColor','b','FaceAlpha',0.5,'EdgeAlpha',0.5);
            set(h1,'FaceColor','r','EdgeColor','r','FaceAlpha',0.5,'EdgeAlpha',0.5);
            %     ylimits=ylim;
            %     ylimits=[0 ylimits(2)];
            %     ylim(ylimits);
            %     xlimits=xlim;
            %     xtick = get(gca,'xtick');
            %     set(gca,'xticklabel', []);
            title(['Total Number of ' currentpiecetitle ' Segments in Diameter Bins'],'FontSize',20,'FontWeight','b');
            hold off;

            


            %subplotspace('horizontal',-20);
            %subplotspace('vertical',-20);

            %[ax,h1]=suplabel('Soma Diameter (\mum)');
            %[ax,h2]=suplabel('Diameter (\mm)','y');
            %[ax,h3]=suplabel('Total Number of Segments in Diameter Bins'  ,'t');
            %set(h2,'FontSize',15);
            %set(h3,'FontSize',20);

            currentdirectory = cd;
            cd(controlanalysis.datapathname);
            cd ..

            if exist(sprintf('%s_%s_comparison',controlanalysis.inputfilename,testanalysis.inputfilename),'dir')==7;
                cd(sprintf('%s_%s_comparison',controlanalysis.inputfilename,testanalysis.inputfilename));
            else
                mkdir(sprintf('%s_%s_comparison',controlanalysis.inputfilename,testanalysis.inputfilename));
                cd(sprintf('%s_%s_comparison',controlanalysis.inputfilename,testanalysis.inputfilename));
            end

            if exist('comparisonfigures','dir')==7
                cd('comparisonfigures');
            else
                mkdir('comparisonfigures');
                cd('comparisonfigures');
            end

        

            %fillscreen;
            
            legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
            legend('boxoff');

            filename = sprintf('%s_%s_%s_%s',controlanalysis.inputfilename, testanalysis.inputfilename, currentpiecetype, '302_Diameter_Dist');
            print('-djpeg',filename);
            %saveas(gcf,filename,'fig');

        end
    end
end
