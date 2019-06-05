function degreefigures2(controlanalysis,testanalysis,extent)
% Bif/term Degree figures

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
            ylabel('Mean Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
            if nargin == 1
                controldatax1   = [controltype.degree.degree];
                controldatay1   = [controltype.degree.length.mean];
                controldatax2   = [controltype.bifurcation.degree.degree];
                controldatay2   = [controltype.bifurcation.degree.length.mean];
                controldatastd2 = [controltype.bifurcation.degree.length.std];
                controldatax3   = [controltype.termination.degree.degree];
                controldatay3   = [controltype.termination.degree.length.mean];
                controldatastd3 = [controltype.termination.degree.length.std];
                if scale == 1
                    plot(controldatax1,controldatay1,'-ob','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',indbluemarkersize);
                    errorbar(controldatax2,controldatay2,controldatastd2/2,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
                    errorbar(controldatax3,controldatay3,controldatastd3/2,'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
                else
                    plot(controldatax1,controldatay1,'-ob','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',indbluemarkersize);
                    plot(controldatax2,controldatay2,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
                    plot(controldatax3,controldatay3,'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
                end
            else
                controldatax2   = [controltype.bifurcation.degree.degree];
                controldatay2   = [controltype.bifurcation.degree.length.mean];
                controldatastd2 = [controltype.bifurcation.degree.length.std];
                controldatax3   = [controltype.termination.degree.degree];
                controldatay3   = [controltype.termination.degree.length.mean];
                controldatastd3 = [controltype.termination.degree.length.std];
                testdatax2   = [testtype.bifurcation.degree.degree];
                testdatay2   = [testtype.bifurcation.degree.length.mean];
                testdatastd2 = [testtype.bifurcation.degree.length.std];
                testdatax3   = [testtype.termination.degree.degree];
                testdatay3   = [testtype.termination.degree.length.mean];
                testdatastd3 = [testtype.termination.degree.length.std];
                if scale == 1
                    errorbar(controldatax2,controldatay2,controldatastd2/2,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
                    errorbar(controldatax3,controldatay3,controldatastd3/2,'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
                    errorbar(testdatax2,testdatay2,testdatastd2/2,'-sk','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
                    errorbar(testdatax3,testdatay3,testdatastd3/2,'-dk','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','m','MarkerSize',magentamarkersize);
                else
                    plot(controldatax2,controldatay2,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
                    plot(controldatax3,controldatay3,'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
                    plot(testdatax2,testdatay2,'-sk','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
                    plot(testdatax3,testdatay3,'-dk','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','m','MarkerSize',magentamarkersize);
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
            ylabel('Mean Surface Area (\mum^2)','FontSize',labelfontsize,'FontWeight','b');
            if nargin == 1
                controldatax1   = [controltype.degree.degree];
                controldatay1   = [controltype.degree.surfacearea.mean];
                controldatax2   = [controltype.bifurcation.degree.degree];
                controldatay2   = [controltype.bifurcation.degree.surfacearea.mean];
                controldatastd2 = [controltype.bifurcation.degree.surfacearea.std];
                controldatax3   = [controltype.termination.degree.degree];
                controldatay3   = [controltype.termination.degree.surfacearea.mean];
                controldatastd3 = [controltype.termination.degree.surfacearea.std];
                if scale == 1
                    plot(controldatax1,controldatay1,'-ob','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',indbluemarkersize);
                    errorbar(controldatax2,controldatay2,controldatastd2/2,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
                    errorbar(controldatax3,controldatay3,controldatastd3/2,'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
                else
                    plot(controldatax1,controldatay1,'-ob','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',indbluemarkersize);
                    plot(controldatax2,controldatay2,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
                    plot(controldatax3,controldatay3,'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
                end
            else
                controldatax2   = [controltype.bifurcation.degree.degree];
                controldatay2   = [controltype.bifurcation.degree.surfacearea.mean];
                controldatastd2 = [controltype.bifurcation.degree.surfacearea.std];
                controldatax3   = [controltype.termination.degree.degree];
                controldatay3   = [controltype.termination.degree.surfacearea.mean];
                controldatastd3 = [controltype.termination.degree.surfacearea.std];
                testdatax2   = [testtype.bifurcation.degree.degree];
                testdatay2   = [testtype.bifurcation.degree.surfacearea.mean];
                testdatastd2 = [testtype.bifurcation.degree.surfacearea.std];
                testdatax3   = [testtype.termination.degree.degree];
                testdatay3   = [testtype.termination.degree.surfacearea.mean];
                testdatastd3 = [testtype.termination.degree.surfacearea.std];
                if scale == 1
                    errorbar(controldatax2,controldatay2,controldatastd2/2,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
                    errorbar(controldatax3,controldatay3,controldatastd3/2,'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
                    errorbar(testdatax2,testdatay2,testdatastd2/2,'-sk','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
                    errorbar(testdatax3,testdatay3,testdatastd3/2,'-dk','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','m','MarkerSize',magentamarkersize);
                else
                    plot(controldatax2,controldatay2,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
                    plot(controldatax3,controldatay3,'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
                    plot(testdatax2,testdatay2,'-sk','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
                    plot(testdatax3,testdatay3,'-dk','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','m','MarkerSize',magentamarkersize);
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
            ylabel('Mean Volume (\mum^3)','FontSize',labelfontsize,'FontWeight','b');
            xlabel('Degree','FontSize',labelfontsize,'FontWeight','b');
            if nargin == 1
                controldatax1   = [controltype.degree.degree];
                controldatay1   = [controltype.degree.volume.mean];
                controldatax2   = [controltype.bifurcation.degree.degree];
                controldatay2   = [controltype.bifurcation.degree.volume.mean];
                controldatastd2 = [controltype.bifurcation.degree.volume.std];
                controldatax3   = [controltype.termination.degree.degree];
                controldatay3   = [controltype.termination.degree.volume.mean];
                controldatastd3 = [controltype.termination.degree.volume.std];
                if scale == 1
                    plot(controldatax1,controldatay1,'-ob','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',indbluemarkersize);
                    errorbar(controldatax2,controldatay2,controldatastd2/2,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
                    errorbar(controldatax3,controldatay3,controldatastd3/2,'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
                else
                    plot(controldatax1,controldatay1,'-ob','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',indbluemarkersize);
                    plot(controldatax2,controldatay2,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
                    plot(controldatax3,controldatay3,'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
                end
            else
                controldatax2   = [controltype.bifurcation.degree.degree];
                controldatay2   = [controltype.bifurcation.degree.volume.mean];
                controldatastd2 = [controltype.bifurcation.degree.volume.std];
                controldatax3   = [controltype.termination.degree.degree];
                controldatay3   = [controltype.termination.degree.volume.mean];
                controldatastd3 = [controltype.termination.degree.volume.std];
                testdatax2   = [testtype.bifurcation.degree.degree];
                testdatay2   = [testtype.bifurcation.degree.volume.mean];
                testdatastd2 = [testtype.bifurcation.degree.volume.std];
                testdatax3   = [testtype.termination.degree.degree];
                testdatay3   = [testtype.termination.degree.volume.mean];
                testdatastd3 = [testtype.termination.degree.volume.std];
                if scale == 1
                    errorbar(controldatax2,controldatay2,controldatastd2/2,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
                    errorbar(controldatax3,controldatay3,controldatastd3/2,'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
                    errorbar(testdatax2,testdatay2,testdatastd2/2,'-sk','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
                    errorbar(testdatax3,testdatay3,testdatastd3/2,'-dk','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','m','MarkerSize',magentamarkersize);
                else
                    plot(controldatax2,controldatay2,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
                    plot(controldatax3,controldatay3,'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
                    plot(testdatax2,testdatay2,'-sk','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
                    plot(testdatax3,testdatay3,'-dk','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','m','MarkerSize',magentamarkersize);
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
            ylabel('Total Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
            if nargin == 1
                controldatax1   = [controltype.degree.degree];
                controldatay1   = [controltype.degree.totallength.mean];
                controldatax2   = [controltype.bifurcation.degree.degree];
                controldatay2   = [controltype.bifurcation.degree.totallength.mean];
                controldatastd2 = [controltype.bifurcation.degree.totallength.std];
                controldatax3   = [controltype.termination.degree.degree];
                controldatay3   = [controltype.termination.degree.totallength.mean];
                controldatastd3 = [controltype.termination.degree.totallength.std];
                if scale == 1
                    plot(controldatax1,controldatay1,'-ob','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',indbluemarkersize);
                    errorbar(controldatax2,controldatay2,controldatastd2/2,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
                    errorbar(controldatax3,controldatay3,controldatastd3/2,'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
                else
                    plot(controldatax1,controldatay1,'-ob','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',indbluemarkersize);
                    plot(controldatax2,controldatay2,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
                    plot(controldatax3,controldatay3,'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
                end
            else
                controldatax2   = [controltype.bifurcation.degree.degree];
                controldatay2   = [controltype.bifurcation.degree.totallength.mean];
                controldatastd2 = [controltype.bifurcation.degree.totallength.std];
                controldatax3   = [controltype.termination.degree.degree];
                controldatay3   = [controltype.termination.degree.totallength.mean];
                controldatastd3 = [controltype.termination.degree.totallength.std];
                testdatax2   = [testtype.bifurcation.degree.degree];
                testdatay2   = [testtype.bifurcation.degree.totallength.mean];
                testdatastd2 = [testtype.bifurcation.degree.totallength.std];
                testdatax3   = [testtype.termination.degree.degree];
                testdatay3   = [testtype.termination.degree.totallength.mean];
                testdatastd3 = [testtype.termination.degree.totallength.std];
                if scale == 1
                    errorbar(controldatax2,controldatay2,controldatastd2/2,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
                    errorbar(controldatax3,controldatay3,controldatastd3/2,'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
                    errorbar(testdatax2,testdatay2,testdatastd2/2,'-sk','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
                    errorbar(testdatax3,testdatay3,testdatastd3/2,'-dk','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','m','MarkerSize',magentamarkersize);
                else
                    plot(controldatax2,controldatay2,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
                    plot(controldatax3,controldatay3,'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
                    plot(testdatax2,testdatay2,'-sk','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
                    plot(testdatax3,testdatay3,'-dk','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','m','MarkerSize',magentamarkersize);
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
            ylabel('Total Surface Area (\mum^2)','FontSize',labelfontsize,'FontWeight','b');
            if nargin == 1
                controldatax1   = [controltype.degree.degree];
                controldatay1   = [controltype.degree.totalsurfacearea.mean];
                controldatax2   = [controltype.bifurcation.degree.degree];
                controldatay2   = [controltype.bifurcation.degree.totalsurfacearea.mean];
                controldatastd2 = [controltype.bifurcation.degree.totalsurfacearea.std];
                controldatax3   = [controltype.termination.degree.degree];
                controldatay3   = [controltype.termination.degree.totalsurfacearea.mean];
                controldatastd3 = [controltype.termination.degree.totalsurfacearea.std];
                if scale == 1
                    plot(controldatax1,controldatay1,'-ob','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',indbluemarkersize);
                    errorbar(controldatax2,controldatay2,controldatastd2/2,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
                    errorbar(controldatax3,controldatay3,controldatastd3/2,'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
                else
                    plot(controldatax1,controldatay1,'-ob','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',indbluemarkersize);
                    plot(controldatax2,controldatay2,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
                    plot(controldatax3,controldatay3,'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
                end
            else
                controldatax2   = [controltype.bifurcation.degree.degree];
                controldatay2   = [controltype.bifurcation.degree.totalsurfacearea.mean];
                controldatastd2 = [controltype.bifurcation.degree.totalsurfacearea.std];
                controldatax3   = [controltype.termination.degree.degree];
                controldatay3   = [controltype.termination.degree.totalsurfacearea.mean];
                controldatastd3 = [controltype.termination.degree.totalsurfacearea.std];
                testdatax2   = [testtype.bifurcation.degree.degree];
                testdatay2   = [testtype.bifurcation.degree.totalsurfacearea.mean];
                testdatastd2 = [testtype.bifurcation.degree.totalsurfacearea.std];
                testdatax3   = [testtype.termination.degree.degree];
                testdatay3   = [testtype.termination.degree.totalsurfacearea.mean];
                testdatastd3 = [testtype.termination.degree.totalsurfacearea.std];
                if scale == 1
                    errorbar(controldatax2,controldatay2,controldatastd2/2,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
                    errorbar(controldatax3,controldatay3,controldatastd3/2,'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
                    errorbar(testdatax2,testdatay2,testdatastd2/2,'-sk','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
                    errorbar(testdatax3,testdatay3,testdatastd3/2,'-dk','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','m','MarkerSize',magentamarkersize);
                else
                    plot(controldatax2,controldatay2,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
                    plot(controldatax3,controldatay3,'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
                    plot(testdatax2,testdatay2,'-sk','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
                    plot(testdatax3,testdatay3,'-dk','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','m','MarkerSize',magentamarkersize);
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
            ylabel('Total Volume (\mum^3)','FontSize',labelfontsize,'FontWeight','b');
            xlabel('Degree','FontSize',labelfontsize,'FontWeight','b');
            if nargin == 1
                controldatax1   = [controltype.degree.degree];
                controldatay1   = [controltype.degree.totalvolume.mean];
                controldatax2   = [controltype.bifurcation.degree.degree];
                controldatay2   = [controltype.bifurcation.degree.totalvolume.mean];
                controldatastd2 = [controltype.bifurcation.degree.totalvolume.std];
                controldatax3   = [controltype.termination.degree.degree];
                controldatay3   = [controltype.termination.degree.totalvolume.mean];
                controldatastd3 = [controltype.termination.degree.totalvolume.std];
                if scale == 1
                    plot(controldatax1,controldatay1,'-ob','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',indbluemarkersize);
                    errorbar(controldatax2,controldatay2,controldatastd2/2,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
                    errorbar(controldatax3,controldatay3,controldatastd3/2,'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
                else
                    plot(controldatax1,controldatay1,'-ob','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',indbluemarkersize);
                    plot(controldatax2,controldatay2,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
                    plot(controldatax3,controldatay3,'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
                end
            else
                controldatax2   = [controltype.bifurcation.degree.degree];
                controldatay2   = [controltype.bifurcation.degree.totalvolume.mean];
                controldatastd2 = [controltype.bifurcation.degree.totalvolume.std];
                controldatax3   = [controltype.termination.degree.degree];
                controldatay3   = [controltype.termination.degree.totalvolume.mean];
                controldatastd3 = [controltype.termination.degree.totalvolume.std];
                testdatax2   = [testtype.bifurcation.degree.degree];
                testdatay2   = [testtype.bifurcation.degree.totalvolume.mean];
                testdatastd2 = [testtype.bifurcation.degree.totalvolume.std];
                testdatax3   = [testtype.termination.degree.degree];
                testdatay3   = [testtype.termination.degree.totalvolume.mean];
                testdatastd3 = [testtype.termination.degree.totalvolume.std];
                if scale == 1
                    errorbar(controldatax2,controldatay2,controldatastd2/2,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
                    errorbar(controldatax3,controldatay3,controldatastd3/2,'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
                    errorbar(testdatax2,testdatay2,testdatastd2/2,'-sk','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
                    errorbar(testdatax3,testdatay3,testdatastd3/2,'-dk','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','m','MarkerSize',magentamarkersize);
                else
                    plot(controldatax2,controldatay2,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
                    plot(controldatax3,controldatay3,'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
                    plot(testdatax2,testdatay2,'-sk','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
                    plot(testdatax3,testdatay3,'-dk','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','m','MarkerSize',magentamarkersize);
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
            %subplotspace('horizontal',-5);
            %subplotspace('vertical',-15);
            
            if nargin == 1
                [ignore,h]=suplabel([controlanalysis.inputfilename ' -- ' currentpiecetitle ' Morphometrics vs Degree' scales{scale}]  ,'t');
                set(h,'FontSize',titlefontsize);
                legend(legendhandle,[controlanalysis.inputfilename ' All'],[controlanalysis.inputfilename ' Bifs'],[controlanalysis.inputfilename ' Terms'],'Location','NorthEast');
                cd(controlanalysis.datapathname);
                if exist(piecetypes{piecetype},'dir') ~= 7
                    mkdir(piecetypes{piecetype});
                end
                cd(piecetypes{piecetype});
                if exist('figures','dir') ~= 7
                    mkdir('figures');
                end
                cd('figures');
                filename = sprintf('%s_%s_20_%.0f_Deg2',controlanalysis.inputfilename,currentpiecetype,scale);
            else
                [ignore,h]=suplabel([controlanalysis.inputfilename ' vs ' testanalysis.inputfilename ' -- ' currentpiecetitle ' Morphometrics vs Degree' scales{scale}]  ,'t');
                set(h,'FontSize',titlefontsize);
                legend(legendhandle,[controlanalysis.inputfilename ' Bifs'],[controlanalysis.inputfilename ' Terms'],[testanalysis.inputfilename ' Bifs'],[testanalysis.inputfilename ' Terms'],'Location','NorthEast');
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
                filename = sprintf('%s_%s_%s_20_%.0f_Deg2',controlanalysis.inputfilename,testanalysis.inputfilename,currentpiecetype,scale);
            end
                        
            print('-djpeg',filename);
            if strcmp(option.mnfigures.matfig,'y')
                saveas(gcf,filename,'fig');
            end
            
            cd(currentdirectory);
            
        end
    end
end
