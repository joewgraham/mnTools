function radialdistancefigures1(controlanalysis,testanalysis,extent)
% Bif/term radial distance figures

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
            ylabel('Number Segments','FontSize',labelfontsize,'FontWeight','b');
            if nargin == 1
                controldatax1   = [controltype.radialdistance.radialdistance];
                controldatay1   = [controltype.radialdistance.numbersegments.mean];
                controldatax2   = [controltype.bifurcation.radialdistance.radialdistance];
                controldatay2   = [controltype.bifurcation.radialdistance.numbersegments.mean];
                controldatastd2 = [controltype.bifurcation.radialdistance.numbersegments.std];
                controldatax3   = [controltype.termination.radialdistance.radialdistance];
                controldatay3   = [controltype.termination.radialdistance.numbersegments.mean];
                controldatastd3 = [controltype.termination.radialdistance.numbersegments.std];
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
                controldatax2   = [controltype.bifurcation.radialdistance.radialdistance];
                controldatay2   = [controltype.bifurcation.radialdistance.numbersegments.mean];
                controldatastd2 = [controltype.bifurcation.radialdistance.numbersegments.std];
                controldatax3   = [controltype.termination.radialdistance.radialdistance];
                controldatay3   = [controltype.termination.radialdistance.numbersegments.mean];
                controldatastd3 = [controltype.termination.radialdistance.numbersegments.std];
                testdatax2   = [testtype.bifurcation.radialdistance.radialdistance];
                testdatay2   = [testtype.bifurcation.radialdistance.numbersegments.mean];
                testdatastd2 = [testtype.bifurcation.radialdistance.numbersegments.std];
                testdatax3   = [testtype.termination.radialdistance.radialdistance];
                testdatay3   = [testtype.termination.radialdistance.numbersegments.mean];
                testdatastd3 = [testtype.termination.radialdistance.numbersegments.std];
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
            ylabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
            if nargin == 1
                controldatax1   = [controltype.radialdistance.radialdistance];
                controldatay1   = [controltype.radialdistance.diameter.mean];
                controldatax2   = [controltype.bifurcation.radialdistance.radialdistance];
                controldatay2   = [controltype.bifurcation.radialdistance.diameter.mean];
                controldatastd2 = [controltype.bifurcation.radialdistance.diameter.std];
                controldatax3   = [controltype.termination.radialdistance.radialdistance];
                controldatay3   = [controltype.termination.radialdistance.diameter.mean];
                controldatastd3 = [controltype.termination.radialdistance.diameter.std];
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
                controldatax2   = [controltype.bifurcation.radialdistance.radialdistance];
                controldatay2   = [controltype.bifurcation.radialdistance.diameter.mean];
                controldatastd2 = [controltype.bifurcation.radialdistance.diameter.std];
                controldatax3   = [controltype.termination.radialdistance.radialdistance];
                controldatay3   = [controltype.termination.radialdistance.diameter.mean];
                controldatastd3 = [controltype.termination.radialdistance.diameter.std];
                testdatax2   = [testtype.bifurcation.radialdistance.radialdistance];
                testdatay2   = [testtype.bifurcation.radialdistance.diameter.mean];
                testdatastd2 = [testtype.bifurcation.radialdistance.diameter.std];
                testdatax3   = [testtype.termination.radialdistance.radialdistance];
                testdatay3   = [testtype.termination.radialdistance.diameter.mean];
                testdatastd3 = [testtype.termination.radialdistance.diameter.std];
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
            ylabel('Taper Rate','FontSize',labelfontsize,'FontWeight','b');
            xlabel('Radial Distance (\mum)','FontSize',labelfontsize,'FontWeight','b');
            if nargin == 1
                controldatax1   = [controltype.radialdistance.radialdistance];
                controldatay1   = [controltype.radialdistance.taperrate.mean];
                controldatax2   = [controltype.bifurcation.radialdistance.radialdistance];
                controldatay2   = [controltype.bifurcation.radialdistance.taperrate.mean];
                controldatastd2 = [controltype.bifurcation.radialdistance.taperrate.std];
                controldatax3   = [controltype.termination.radialdistance.radialdistance];
                controldatay3   = [controltype.termination.radialdistance.taperrate.mean];
                controldatastd3 = [controltype.termination.radialdistance.taperrate.std];
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
                controldatax2   = [controltype.bifurcation.radialdistance.radialdistance];
                controldatay2   = [controltype.bifurcation.radialdistance.taperrate.mean];
                controldatastd2 = [controltype.bifurcation.radialdistance.taperrate.std];
                controldatax3   = [controltype.termination.radialdistance.radialdistance];
                controldatay3   = [controltype.termination.radialdistance.taperrate.mean];
                controldatastd3 = [controltype.termination.radialdistance.taperrate.std];
                testdatax2   = [testtype.bifurcation.radialdistance.radialdistance];
                testdatay2   = [testtype.bifurcation.radialdistance.taperrate.mean];
                testdatastd2 = [testtype.bifurcation.radialdistance.taperrate.std];
                testdatax3   = [testtype.termination.radialdistance.radialdistance];
                testdatay3   = [testtype.termination.radialdistance.taperrate.mean];
                testdatastd3 = [testtype.termination.radialdistance.taperrate.std];
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
            ylabel('Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
            if nargin == 1
                controldatax1   = [controltype.radialdistance.radialdistance];
                controldatay1   = [controltype.radialdistance.length.mean];
                controldatax2   = [controltype.bifurcation.radialdistance.radialdistance];
                controldatay2   = [controltype.bifurcation.radialdistance.length.mean];
                controldatastd2 = [controltype.bifurcation.radialdistance.length.std];
                controldatax3   = [controltype.termination.radialdistance.radialdistance];
                controldatay3   = [controltype.termination.radialdistance.length.mean];
                controldatastd3 = [controltype.termination.radialdistance.length.std];
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
                controldatax2   = [controltype.bifurcation.radialdistance.radialdistance];
                controldatay2   = [controltype.bifurcation.radialdistance.length.mean];
                controldatastd2 = [controltype.bifurcation.radialdistance.length.std];
                controldatax3   = [controltype.termination.radialdistance.radialdistance];
                controldatay3   = [controltype.termination.radialdistance.length.mean];
                controldatastd3 = [controltype.termination.radialdistance.length.std];
                testdatax2   = [testtype.bifurcation.radialdistance.radialdistance];
                testdatay2   = [testtype.bifurcation.radialdistance.length.mean];
                testdatastd2 = [testtype.bifurcation.radialdistance.length.std];
                testdatax3   = [testtype.termination.radialdistance.radialdistance];
                testdatay3   = [testtype.termination.radialdistance.length.mean];
                testdatastd3 = [testtype.termination.radialdistance.length.std];
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
            ylabel('Surface Area (\mum^2)','FontSize',labelfontsize,'FontWeight','b');
            if nargin == 1
                controldatax1   = [controltype.radialdistance.radialdistance];
                controldatay1   = [controltype.radialdistance.surfacearea.mean];
                controldatax2   = [controltype.bifurcation.radialdistance.radialdistance];
                controldatay2   = [controltype.bifurcation.radialdistance.surfacearea.mean];
                controldatastd2 = [controltype.bifurcation.radialdistance.surfacearea.std];
                controldatax3   = [controltype.termination.radialdistance.radialdistance];
                controldatay3   = [controltype.termination.radialdistance.surfacearea.mean];
                controldatastd3 = [controltype.termination.radialdistance.surfacearea.std];
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
                controldatax2   = [controltype.bifurcation.radialdistance.radialdistance];
                controldatay2   = [controltype.bifurcation.radialdistance.surfacearea.mean];
                controldatastd2 = [controltype.bifurcation.radialdistance.surfacearea.std];
                controldatax3   = [controltype.termination.radialdistance.radialdistance];
                controldatay3   = [controltype.termination.radialdistance.surfacearea.mean];
                controldatastd3 = [controltype.termination.radialdistance.surfacearea.std];
                testdatax2   = [testtype.bifurcation.radialdistance.radialdistance];
                testdatay2   = [testtype.bifurcation.radialdistance.surfacearea.mean];
                testdatastd2 = [testtype.bifurcation.radialdistance.surfacearea.std];
                testdatax3   = [testtype.termination.radialdistance.radialdistance];
                testdatay3   = [testtype.termination.radialdistance.surfacearea.mean];
                testdatastd3 = [testtype.termination.radialdistance.surfacearea.std];
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
            ylabel('Volume (\mum^3)','FontSize',labelfontsize,'FontWeight','b');
            xlabel('Radial Distance (\mum)','FontSize',labelfontsize,'FontWeight','b');
            if nargin == 1
                controldatax1   = [controltype.radialdistance.radialdistance];
                controldatay1   = [controltype.radialdistance.volume.mean];
                controldatax2   = [controltype.bifurcation.radialdistance.radialdistance];
                controldatay2   = [controltype.bifurcation.radialdistance.volume.mean];
                controldatastd2 = [controltype.bifurcation.radialdistance.volume.std];
                controldatax3   = [controltype.termination.radialdistance.radialdistance];
                controldatay3   = [controltype.termination.radialdistance.volume.mean];
                controldatastd3 = [controltype.termination.radialdistance.volume.std];
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
                controldatax2   = [controltype.bifurcation.radialdistance.radialdistance];
                controldatay2   = [controltype.bifurcation.radialdistance.volume.mean];
                controldatastd2 = [controltype.bifurcation.radialdistance.volume.std];
                controldatax3   = [controltype.termination.radialdistance.radialdistance];
                controldatay3   = [controltype.termination.radialdistance.volume.mean];
                controldatastd3 = [controltype.termination.radialdistance.volume.std];
                testdatax2   = [testtype.bifurcation.radialdistance.radialdistance];
                testdatay2   = [testtype.bifurcation.radialdistance.volume.mean];
                testdatastd2 = [testtype.bifurcation.radialdistance.volume.std];
                testdatax3   = [testtype.termination.radialdistance.radialdistance];
                testdatay3   = [testtype.termination.radialdistance.volume.mean];
                testdatastd3 = [testtype.termination.radialdistance.volume.std];
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
                [ignore,h]=suplabel([controlanalysis.inputfilename ' -- ' currentpiecetitle ' Morphometrics vs Radial Distance' scales{scale}]  ,'t');
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
                filename = sprintf('%s_%s_12_%.0f_RadD1',controlanalysis.inputfilename,currentpiecetype,scale);
            else
                [ignore,h]=suplabel([controlanalysis.inputfilename ' vs ' testanalysis.inputfilename ' -- ' currentpiecetitle ' Morphometrics vs Radial Distance' scales{scale}]  ,'t');
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
                filename = sprintf('%s_%s_%s_12_%.0f_RadD1',controlanalysis.inputfilename,testanalysis.inputfilename,currentpiecetype,scale);
            end
            
            print('-djpeg',filename);
            if strcmp(option.mnfigures.matfig,'y')
                saveas(gcf,filename,'fig');
            end
            
            cd(currentdirectory);
            
        end
    end
end
