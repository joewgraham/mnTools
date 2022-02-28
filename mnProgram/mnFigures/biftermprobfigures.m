function biftermprobfigures(controlanalysis,testanalysis)
% Branching/Terminating Probability Figures

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

versuses{1} = 'diameter';
versuses{2} = 'pathlength';
versuses{3} = 'branchlength';
versuses{4} = 'branchorder';

versusestitles{1} = 'Diameter';
versusestitles{2} = 'Path Length';
versusestitles{3} = 'Branch Length';
versusestitles{4} = 'Branch Order';

drivers{1} = 'length';
drivers{2} = 'surfacearea';
drivers{3} = 'volume';

driverstitles{1} = 'Length';
driverstitles{2} = 'Surface Area';
driverstitles{3} = 'Volume';


for piecetype = 2:4

    if isfield(controlanalysis,piecetypes{piecetype})

        currentpiecetype = piecetypes{piecetype};
        currentpiecetitle = piecetitles{piecetype};
        eval(['controltype = controlanalysis.' currentpiecetype ';']);
        if nargin > 1
            eval(['testtype = testanalysis.' currentpiecetype ';']);
        end

        for curdriver = 1:3
            
            currentdriver = drivers{curdriver};
            currentdrivertitle = driverstitles{curdriver};

            figure;
            subplotcount = 0;

            for row = 1:3

                for versus = 1:4

                    subplotcount = subplotcount + 1;

                    currentversus = versuses{versus};
                    currentversustitle = versusestitles{versus};

                    eval(['bifx = controltype.bifurcation.' currentversus '.' currentversus ';']);
                    eval(['bify1 = [controltype.bifurcation.' currentversus '.numbersegments.total];']);
                    eval(['bify2 = [controltype.bifurcation.' currentversus '.' currentdriver '.total];']);
                    eval(['termx = controltype.termination.' currentversus '.' currentversus ';']);
                    eval(['termy1 = [controltype.termination.' currentversus '.numbersegments.total];']);
                    eval(['termy2 = [controltype.termination.' currentversus '.' currentdriver '.total];']);

                    curylabel = ['# of Endings      ' currentdrivertitle];

                    if row == 1

                        if nargin == 1

                            subplot(3,4,subplotcount); box on;
                            loglog([bifx],[bify1],'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
                            hold on;
                            loglog([termx],[termy1],'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
                            loglog([bifx],[bify2],'-g','LineWidth',2);
                            loglog([termx],[termy2],'-r','LineWidth',2);
                            if ismember(subplotcount, [1,5,9])
                                ylabel(curylabel,'FontSize',labelfontsize,'FontWeight','b');
                            end

                            set(gca,'FontSize',axesfontsize); hold off;

                        else

                            eval(['testbifx = testtype.bifurcation.' currentversus '.' currentversus ';']);
                            eval(['testbify1 = [testtype.bifurcation.' currentversus '.numbersegments.total];']);
                            eval(['testbify2 = [testtype.bifurcation.' currentversus '.' currentdriver '.total];']);
                            eval(['testtermx = testtype.termination.' currentversus '.' currentversus ';']);
                            eval(['testtermy1 = [testtype.termination.' currentversus '.numbersegments.total];']);
                            eval(['testtermy2 = [testtype.termination.' currentversus '.' currentdriver '.total];']);

                            subplot(3,4,subplotcount); box on;
                            
                            loglog([bifx],[bify1],'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
                            hold on;
                            loglog([termx],[termy1],'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
                            loglog([bifx],[bify2],'-g','LineWidth',2);
                            loglog([termx],[termy2],'-r','LineWidth',2);

                            loglog([testbifx],[testbify1],'-sy','LineWidth',1.5,'MarkerEdgeColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
                            loglog([testtermx],[testtermy1],'-dm','LineWidth',1.5,'MarkerEdgeColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
                            loglog([testbifx],[testbify2],'-y','LineWidth',2);
                            loglog([testtermx],[testtermy2],'-m','LineWidth',2);
                            if ismember(subplotcount, [1,5,9])
                                ylabel(curylabel,'FontSize',labelfontsize,'FontWeight','b');
                            end
                            set(gca,'FontSize',axesfontsize); hold off;

                        end

                        if subplotcount == 4
                            if nargin == 1
                                legend([controlanalysis.inputfilename ' #Bifs'],[controlanalysis.inputfilename ' #Terms'],[controlanalysis.inputfilename ' Bif Length'],[controlanalysis.inputfilename ' Term Length']);
                            elseif nargin == 2
                                legend([controlanalysis.inputfilename ' #Bifs'],[controlanalysis.inputfilename ' #Terms'],[controlanalysis.inputfilename ' Bif Length'],[controlanalysis.inputfilename ' Term Length'],[testanalysis.inputfilename ' #Bifs'],[testanalysis.inputfilename ' #Terms'],[testanalysis.inputfilename ' Bif Length'],[testanalysis.inputfilename ' Term Length']);
                            end
                        end

                    elseif row == 2
                        eval(['bifx = controltype.bifurcation.' currentversus '.' currentversus ';']);
                        eval(['bify = [controltype.bifurcation.' currentversus '.bifurcationprobability.' currentdriver '];']);
                        eval(['termx = controltype.termination.' currentversus '.' currentversus ';']);
                        eval(['termy = [controltype.termination.' currentversus '.terminationprobability.' currentdriver '];']);
                        if nargin == 1
                            subplot(3,4,subplotcount); box on;
                            semilogy([bifx],[bify],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
                            hold on;
                            semilogy([termx],[termy],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
                            if ismember(subplotcount, [1,5,9])
                                ylabel('Probability (Semi-Log)','FontSize',labelfontsize,'FontWeight','b');
                            end
                            set(gca,'FontSize',axesfontsize); hold off;
                        else
                            eval(['testbifx = testtype.bifurcation.' currentversus '.' currentversus ';']);
                            eval(['testbify = [testtype.bifurcation.' currentversus '.bifurcationprobability.' currentdriver '];']);
                            eval(['testtermx = testtype.termination.' currentversus '.' currentversus ';']);
                            eval(['testtermy = [testtype.termination.' currentversus '.terminationprobability.' currentdriver '];']);
                            subplot(3,4,subplotcount); box on;
                            semilogy([bifx],[bify],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
                            hold on;
                            semilogy([termx],[termy],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
                            semilogy([testbifx],[testbify],'sy','MarkerFaceColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
                            semilogy([testtermx],[testtermy],'dm','MarkerFaceColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
                            if ismember(subplotcount, [1,5,9])
                                ylabel('Probability (Semi-Log)','FontSize',labelfontsize,'FontWeight','b');
                            end
                            set(gca,'FontSize',axesfontsize); hold off;
                        end

                    elseif row == 3
                        eval(['bifx = controltype.bifurcation.' currentversus '.' currentversus ';']);
                        eval(['bify = [controltype.bifurcation.' currentversus '.bifurcationprobability.' currentdriver '];']);
                        eval(['termx = controltype.termination.' currentversus '.' currentversus ';']);
                        eval(['termy = [controltype.termination.' currentversus '.terminationprobability.' currentdriver '];']);
                        if nargin == 1
                            subplot(3,4,subplotcount); box on;
                            loglog([bifx],[bify],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
                            hold on;
                            loglog([termx],[termy],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
                            if ismember(subplotcount, [1,5,9])
                                ylabel('Probability (Log-Log)','FontSize',labelfontsize,'FontWeight','b');
                            end
                            set(gca,'FontSize',axesfontsize); hold off;
                        else
                            eval(['testbifx = testtype.bifurcation.' currentversus '.' currentversus ';']);
                            eval(['testbify = [testtype.bifurcation.' currentversus '.bifurcationprobability.' currentdriver '];']);
                            eval(['testtermx = testtype.termination.' currentversus '.' currentversus ';']);
                            eval(['testtermy = [testtype.termination.' currentversus '.terminationprobability.' currentdriver '];']);
                            subplot(3,4,subplotcount); box on;
                            loglog([bifx],[bify],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
                            hold on;
                            loglog([termx],[termy],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
                            loglog([testbifx],[testbify],'sy','MarkerFaceColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
                            loglog([testtermx],[testtermy],'dm','MarkerFaceColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
                            if ismember(subplotcount, [1,5,9])
                                ylabel('Probability (Log-Log)','FontSize',labelfontsize,'FontWeight','b');
                            end
                            set(gca,'FontSize',axesfontsize); hold off;
                        end
                    end
                end
            end

            subplotspace('horizontal',-5);
            subplotspace('vertical',-15);

            [ax,h3]=suplabel([currentpiecetitle ' Bifurcation / Termination Probabilities by ' currentdrivertitle],'t');
            set(h3,'FontSize',titlefontsize);

            currentdirectory = cd;
            cd(controlanalysis.datapathname);

            if nargin == 1
                if exist('figures','dir') ~= 7
                    mkdir('figures');
                end
                cd('figures');
                filename = sprintf('%s_%s_403_Bif_Term_Prob_%s',controlanalysis.inputfilename,currentpiecetype, currentdriver);
            else
                cd ..
                if exist(sprintf('%s_%s_comparison',controlanalysis.inputfilename,testanalysis.inputfilename),'dir') ~= 7;
                    mkdir(sprintf('%s_%s_comparison',controlanalysis.inputfilename,testanalysis.inputfilename));
                end
                cd(sprintf('%s_%s_comparison',controlanalysis.inputfilename,testanalysis.inputfilename));
            
                if exist('comparisonfigures','dir')~=7
                    mkdir('comparisonfigures');
                end
                cd('comparisonfigures');
            
                filename = sprintf('%s_%s_%s_403_Bif_Term_Prob_%s',controlanalysis.inputfilename,testanalysis.inputfilename,currentpiecetype,currentdriver);
            end

            print('-djpeg',filename);
            if strcmp(option.mnfigures.matfig,'y')
                saveas(gcf,filename,'fig');
            end
        end
    end
end
