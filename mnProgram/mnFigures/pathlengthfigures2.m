function pathlengthfigures2(controlanalysis,testanalysis,extent)
% Bif path length figures

mnoptions;

titlefontsize = option.mnfigures.titlefontsize;
labelfontsize = option.mnfigures.labelfontsize;
axesfontsize  = option.mnfigures.axesfontsize;
insetfontsize = option.mnfigures.insetfontsize;

indbluemarkersize  = option.mnfigures.indbluemarkersize;
indgreenmarkersize = option.mnfigures.indgreenmarkersize;
indredmarkersize   = option.mnfigures.indredmarkersize;
bluemarkersize     = option.mnfigures.bluemarkersize;
greenmarkersize    = option.mnfigures.greenmarkersize;
redmarkersize      = option.mnfigures.redmarkersize;
cyanmarkersize     = option.mnfigures.cyanmarkersize;
yellowmarkersize   = option.mnfigures.yellowmarkersize;
magentamarkersize  = option.mnfigures.magentamarkersize;

piecetypes{1} = 'soma';
piecetypes{2} = 'axon';
piecetypes{3} = 'dendrite';
piecetypes{4} = 'apical';

piecetitles{1} = 'Somatic';
piecetitles{2} = 'Axonal';
piecetitles{3} = 'Dendritic';
piecetitles{4} = 'Apical';

scales{1} = '';
scales{2} = ' (semi-log y)';
scales{3} = ' (semi-log x)';
scales{4} = ' (log-log)';

if nargin == 3
	numscale = 1;
else
	numscale = 4;
end

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
        
        for scale = 1:numscale
            
            currentpiecetype = piecetypes{piecetype};
            currentpiecetitle = piecetitles{piecetype};
            eval(['controltype = controlanalysis.' currentpiecetype ';']);
            if nargin > 1
                eval(['testtype = testanalysis.' currentpiecetype ';']);
            end
            
            figure;
            
            
            subplot(3,2,1); 
            box on;
            hold on;
            legendhandle = gca;
            ylabel('Rall Ratio (D^{1.0})','FontSize',labelfontsize,'FontWeight','b');
            if nargin == 1
                controldatax1   = [controltype.pathlength.pathlength];
                controldatay1   = [controltype.pathlength.rallratio1.mean];
                controldatastd1 = [controltype.pathlength.rallratio1.std];
                if scale == 1
                    errorbar(controldatax1,controldatay1,controldatastd1/2,'-ob','LineWidth',2,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',indbluemarkersize);
                else
                    plot(controldatax1,controldatay1,'-ob','LineWidth',2,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',indbluemarkersize);
                end
            else
                controldatax1   = [controltype.pathlength.pathlength];
                controldatay1   = [controltype.pathlength.rallratio1.mean];
                controldatastd1 = [controltype.pathlength.rallratio1.std];
                testdatax1   = [testtype.pathlength.pathlength];
                testdatay1   = [testtype.pathlength.rallratio1.mean];
                testdatastd1 = [testtype.pathlength.rallratio1.std];
                if scale == 1
                    errorbar(controldatax1,controldatay1,controldatastd1/2,'-ob','LineWidth',2,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',bluemarkersize);
                    errorbar(testdatax1,testdatay1,testdatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','c','MarkerSize',cyanmarkersize);
                else
                    plot(controldatax1,controldatay1,'-ob','LineWidth',2,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',bluemarkersize);
                    plot(testdatax1,testdatay1,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','c','MarkerSize',cyanmarkersize);
                end
            end
            if scale == 2
                set(gca,'YScale','log');
            elseif scale == 3
                set(gca,'XScale','log');
            elseif scale == 4
                set(gca,'YScale','log');
                set(gca,'XScale','log');
            end
            set(gca,'xticklabel', []);
            set(gca,'FontSize',axesfontsize);
            hold off;
            
            
            subplot(3,2,3);
            box on;
            hold on;
            ylabel('Rall Ratio (D^{1.5})','FontSize',labelfontsize,'FontWeight','b');
            if nargin == 1
                controldatax1   = [controltype.pathlength.pathlength];
                controldatay1   = [controltype.pathlength.rallratio.mean];
                controldatastd1 = [controltype.pathlength.rallratio.std];
                if scale == 1
                    errorbar(controldatax1,controldatay1,controldatastd1/2,'-ob','LineWidth',2,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',indbluemarkersize);
                else
                    plot(controldatax1,controldatay1,'-ob','LineWidth',2,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',indbluemarkersize);
                end
            else
                controldatax1   = [controltype.pathlength.pathlength];
                controldatay1   = [controltype.pathlength.rallratio.mean];
                controldatastd1 = [controltype.pathlength.rallratio.std];
                testdatax1   = [testtype.pathlength.pathlength];
                testdatay1   = [testtype.pathlength.rallratio.mean];
                testdatastd1 = [testtype.pathlength.rallratio.std];
                if scale == 1
                    errorbar(controldatax1,controldatay1,controldatastd1/2,'-ob','LineWidth',2,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',bluemarkersize);
                    errorbar(testdatax1,testdatay1,testdatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','c','MarkerSize',cyanmarkersize);
                else
                    plot(controldatax1,controldatay1,'-ob','LineWidth',2,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',bluemarkersize);
                    plot(testdatax1,testdatay1,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','c','MarkerSize',cyanmarkersize);
                end
            end
            if scale == 2
                set(gca,'YScale','log');
            elseif scale == 3
                set(gca,'XScale','log');
            elseif scale == 4
                set(gca,'YScale','log');
                set(gca,'XScale','log');
            end
            set(gca,'xticklabel', []);
            set(gca,'FontSize',axesfontsize);
            hold off;
            
            
            subplot(3,2,5);
            box on;
            hold on;
            ylabel('Rall Ratio (D^{2.0})','FontSize',labelfontsize,'FontWeight','b');
            xlabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
            if nargin == 1
                controldatax1   = [controltype.pathlength.pathlength];
                controldatay1   = [controltype.pathlength.rallratio2.mean];
                controldatastd1 = [controltype.pathlength.rallratio2.std];
                if scale == 1
                    errorbar(controldatax1,controldatay1,controldatastd1/2,'-ob','LineWidth',2,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',indbluemarkersize);
                else
                    plot(controldatax1,controldatay1,'-ob','LineWidth',2,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',indbluemarkersize);
                end
            else
                controldatax1   = [controltype.pathlength.pathlength];
                controldatay1   = [controltype.pathlength.rallratio2.mean];
                controldatastd1 = [controltype.pathlength.rallratio2.std];
                testdatax1   = [testtype.pathlength.pathlength];
                testdatay1   = [testtype.pathlength.rallratio2.mean];
                testdatastd1 = [testtype.pathlength.rallratio2.std];
                if scale == 1
                    errorbar(controldatax1,controldatay1,controldatastd1/2,'-ob','LineWidth',2,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',bluemarkersize);
                    errorbar(testdatax1,testdatay1,testdatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','c','MarkerSize',cyanmarkersize);
                else
                    plot(controldatax1,controldatay1,'-ob','LineWidth',2,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',bluemarkersize);
                    plot(testdatax1,testdatay1,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','c','MarkerSize',cyanmarkersize);
                end
            end
            if scale == 2
                set(gca,'YScale','log');
            elseif scale == 3
                set(gca,'XScale','log');
            elseif scale == 4
                set(gca,'YScale','log');
                set(gca,'XScale','log');
            end
            set(gca,'FontSize',axesfontsize);
            hold off;
            
            
            subplot(3,2,2);
            box on;
            hold on;
            ylabel('Parent / Daughter_1 Ratio','FontSize',labelfontsize,'FontWeight','b');
            if nargin == 1
                controldatax1   = [controltype.pathlength.pathlength];
                controldatay1   = [controltype.pathlength.parentdaughterratio.mean];
                controldatastd1 = [controltype.pathlength.parentdaughterratio.std];
                if scale == 1
                    errorbar(controldatax1,controldatay1,controldatastd1/2,'-ob','LineWidth',2,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',indbluemarkersize);
                else
                    plot(controldatax1,controldatay1,'-ob','LineWidth',2,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',indbluemarkersize);
                end
            else
                controldatax1   = [controltype.pathlength.pathlength];
                controldatay1   = [controltype.pathlength.parentdaughterratio.mean];
                controldatastd1 = [controltype.pathlength.parentdaughterratio.std];
                testdatax1   = [testtype.pathlength.pathlength];
                testdatay1   = [testtype.pathlength.parentdaughterratio.mean];
                testdatastd1 = [testtype.pathlength.parentdaughterratio.std];
                if scale == 1
                    errorbar(controldatax1,controldatay1,controldatastd1/2,'-ob','LineWidth',2,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',bluemarkersize);
                    errorbar(testdatax1,testdatay1,testdatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','c','MarkerSize',cyanmarkersize);
                else
                    plot(controldatax1,controldatay1,'-ob','LineWidth',2,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',bluemarkersize);
                    plot(testdatax1,testdatay1,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','c','MarkerSize',cyanmarkersize);
                end
            end
            if scale == 2
                set(gca,'YScale','log');
            elseif scale == 3
                set(gca,'XScale','log');
            elseif scale == 4
                set(gca,'YScale','log');
                set(gca,'XScale','log');
            end
            set(gca,'xticklabel', []);
            set(gca,'FontSize',axesfontsize);
            hold off;
            
            
            subplot(3,2,4);
            box on;
            hold on;
            ylabel('Parent / Daughter_2 Ratio','FontSize',labelfontsize,'FontWeight','b');
            if nargin == 1
                controldatax1   = [controltype.pathlength.pathlength];
                controldatay1   = [controltype.pathlength.parentdaughter2ratio.mean];
                controldatastd1 = [controltype.pathlength.parentdaughter2ratio.std];
                if scale == 1
                    errorbar(controldatax1,controldatay1,controldatastd1/2,'-ob','LineWidth',2,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',indbluemarkersize);
                else
                    plot(controldatax1,controldatay1,'-ob','LineWidth',2,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',indbluemarkersize);
                end
            else
                controldatax1   = [controltype.pathlength.pathlength];
                controldatay1   = [controltype.pathlength.parentdaughter2ratio.mean];
                controldatastd1 = [controltype.pathlength.parentdaughter2ratio.std];
                testdatax1   = [testtype.pathlength.pathlength];
                testdatay1   = [testtype.pathlength.parentdaughter2ratio.mean];
                testdatastd1 = [testtype.pathlength.parentdaughter2ratio.std];
                if scale == 1
                    errorbar(controldatax1,controldatay1,controldatastd1/2,'-ob','LineWidth',2,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',bluemarkersize);
                    errorbar(testdatax1,testdatay1,testdatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','c','MarkerSize',cyanmarkersize);
                else
                    plot(controldatax1,controldatay1,'-ob','LineWidth',2,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',bluemarkersize);
                    plot(testdatax1,testdatay1,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','c','MarkerSize',cyanmarkersize);
                end
            end
            if scale == 2
                set(gca,'YScale','log');
            elseif scale == 3
                set(gca,'XScale','log');
            elseif scale == 4
                set(gca,'YScale','log');
                set(gca,'XScale','log');
            end
            set(gca,'xticklabel', []);
            set(gca,'FontSize',axesfontsize);
            hold off;
            
            
            subplot(3,2,6);
            box on;
            hold on;
            ylabel('Daughter Ratio','FontSize',labelfontsize,'FontWeight','b');
            xlabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
            if nargin == 1
                controldatax1   = [controltype.pathlength.pathlength];
                controldatay1   = [controltype.pathlength.daughterratio.mean];
                controldatastd1 = [controltype.pathlength.daughterratio.std];
                if scale == 1
                    errorbar(controldatax1,controldatay1,controldatastd1/2,'-ob','LineWidth',2,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',indbluemarkersize);
                else
                    plot(controldatax1,controldatay1,'-ob','LineWidth',2,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',indbluemarkersize);
                end
            else
                controldatax1   = [controltype.pathlength.pathlength];
                controldatay1   = [controltype.pathlength.daughterratio.mean];
                controldatastd1 = [controltype.pathlength.daughterratio.std];
                testdatax1   = [testtype.pathlength.pathlength];
                testdatay1   = [testtype.pathlength.daughterratio.mean];
                testdatastd1 = [testtype.pathlength.daughterratio.std];
                if scale == 1
                    errorbar(controldatax1,controldatay1,controldatastd1/2,'-ob','LineWidth',2,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',bluemarkersize);
                    errorbar(testdatax1,testdatay1,testdatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','c','MarkerSize',cyanmarkersize);
                else
                    plot(controldatax1,controldatay1,'-ob','LineWidth',2,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',bluemarkersize);
                    plot(testdatax1,testdatay1,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','c','MarkerSize',cyanmarkersize);
                end
            end
            if scale == 2
                set(gca,'YScale','log');
            elseif scale == 3
                set(gca,'XScale','log');
            elseif scale == 4
                set(gca,'YScale','log');
                set(gca,'XScale','log');
            end
            set(gca,'FontSize',axesfontsize);
            hold off;
            
            
            currentdirectory = cd;
            %%%subplotspace('horizontal',-5);
            %%%subplotspace('vertical',-15);
            
            if nargin == 1
                [ignore,h]=suplabel([controlanalysis.inputfilename ' -- ' currentpiecetitle ' Branching vs Path Length' scales{scale}]  ,'t');
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
                filename = sprintf('%s_%s_11_%.0f_Path2',controlanalysis.inputfilename,currentpiecetype,scale);
            else
                [ignore,h]=suplabel([controlanalysis.inputfilename ' vs ' testanalysis.inputfilename ' -- ' currentpiecetitle ' Branching vs Path Length' scales{scale}]  ,'t');
                set(h,'FontSize',titlefontsize);
                legend(legendhandle,[controlanalysis.inputfilename],[testanalysis.inputfilename],'Location','NorthEast');
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
                filename = sprintf('%s_%s_%s_11_%.0f_Path2',controlanalysis.inputfilename,testanalysis.inputfilename,currentpiecetype,scale);
            end
            
            print('-djpeg',filename);
            if strcmp(option.mnfigures.matfig,'y')
                saveas(gcf,filename,'fig');
            end
            
            cd(currentdirectory);
            
        end
    end
end
