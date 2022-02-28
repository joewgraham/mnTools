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
                            ylabel(curylabel,'FontSize',labelfontsize,'FontWeight','b');
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
                            
                            ylabel(curylabel,'FontSize',labelfontsize,'FontWeight','b');
                            set(gca,'FontSize',axesfontsize); hold off;

                        end

                    elseif row == 2
                        if nargin == 1
                            subplot(3,4,subplotcount); box on;
                            semilogy([controltype.bifurcation.diameter.diameter],[controltype.bifurcation.diameter.bifurcationprobability.length],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
                            hold on;
                            semilogy([controltype.termination.diameter.diameter],[controltype.termination.diameter.terminationprobability.length],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
                            ylabel('Probability (Semi-Log)','FontSize',labelfontsize,'FontWeight','b');
                            set(gca,'FontSize',axesfontsize); hold off;
                            
                        else

                            subplot(3,4,subplotcount); box on;
                            semilogy([controltype.bifurcation.diameter.diameter],[controltype.bifurcation.diameter.bifurcationprobability.length],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
                            hold on;
                            semilogy([controltype.termination.diameter.diameter],[controltype.termination.diameter.terminationprobability.length],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
                            semilogy([testtype.bifurcation.diameter.diameter],[testtype.bifurcation.diameter.bifurcationprobability.length],'sy','MarkerFaceColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
                            semilogy([testtype.termination.diameter.diameter],[testtype.termination.diameter.terminationprobability.length],'dm','MarkerFaceColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
                            ylabel('Probability (Semi-Log)','FontSize',labelfontsize,'FontWeight','b');
                            set(gca,'FontSize',axesfontsize); hold off;
                        end


                    elseif row == 3
                        disp('row 3')

                    end
                end
            end

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











% if nargin == 1

%     figure;
    
%     subplot(3,4,1); box on;
%     loglog([controlanalysis.bifurcation.diameter.diameter],[controlanalysis.bifurcation.diameter.numbersegments.total],'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
%     hold on;
%     loglog([controlanalysis.termination.diameter.diameter],[controlanalysis.termination.diameter.numbersegments.total],'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
%     loglog([controlanalysis.bifurcation.diameter.diameter],[controlanalysis.bifurcation.diameter.length.total],'-g','LineWidth',2);
%     loglog([controlanalysis.termination.diameter.diameter],[controlanalysis.termination.diameter.length.total],'-r','LineWidth',2);
%     ylabel('# of Endings      Length','FontSize',labelfontsize,'FontWeight','b');
%     set(gca,'FontSize',axesfontsize); hold off;
    
%     subplot(3,4,2); box on; 
%     loglog([controlanalysis.bifurcation.pathlength.pathlength],[controlanalysis.bifurcation.pathlength.numbersegments.total],'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
%     hold on;
%     loglog([controlanalysis.termination.pathlength.pathlength],[controlanalysis.termination.pathlength.numbersegments.total],'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
%     loglog([controlanalysis.bifurcation.pathlength.pathlength],[controlanalysis.bifurcation.pathlength.length.total],'-g','LineWidth',2); 
%     loglog([controlanalysis.termination.pathlength.pathlength],[controlanalysis.termination.pathlength.length.total],'-r','LineWidth',2);
%     set(gca,'FontSize',axesfontsize); hold off;
    
%     subplot(3,4,3); box on; 
%     loglog([controlanalysis.bifurcation.branchlength.branchlength],[controlanalysis.bifurcation.branchlength.numbersegments.total],'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
%     hold on;
%     loglog([controlanalysis.termination.branchlength.branchlength],[controlanalysis.termination.branchlength.numbersegments.total],'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
%     loglog([controlanalysis.bifurcation.branchlength.branchlength],[controlanalysis.bifurcation.branchlength.length.total],'-g','LineWidth',2); 
%     loglog([controlanalysis.termination.branchlength.branchlength],[controlanalysis.termination.branchlength.length.total],'-r','LineWidth',2); 
%     set(gca,'FontSize',axesfontsize); hold off;
	
% 	subplot(3,4,4); box on; 
%     loglog([controlanalysis.bifurcation.branchorder.branchorder],[controlanalysis.bifurcation.branchorder.numbersegments.total],'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
%     hold on;
%     loglog([controlanalysis.termination.branchorder.branchorder],[controlanalysis.termination.branchorder.numbersegments.total],'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
%     loglog([controlanalysis.bifurcation.branchorder.branchorder],[controlanalysis.bifurcation.branchorder.length.total],'-g','LineWidth',2); 
%     loglog([controlanalysis.termination.branchorder.branchorder],[controlanalysis.termination.branchorder.length.total],'-r','LineWidth',2); 
%     set(gca,'FontSize',axesfontsize); hold off;

%     subplot(3,4,5); box on;
%     semilogy([controlanalysis.bifurcation.diameter.diameter],[controlanalysis.bifurcation.diameter.bifurcationprobability.length],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
%     hold on;
%     semilogy([controlanalysis.termination.diameter.diameter],[controlanalysis.termination.diameter.terminationprobability.length],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
%     ylabel('Probability (Semi-Log)','FontSize',labelfontsize,'FontWeight','b');
%     set(gca,'FontSize',axesfontsize); hold off;
    
%     subplot(3,4,6); box on; 
%     semilogy([controlanalysis.bifurcation.pathlength.pathlength],[controlanalysis.bifurcation.pathlength.bifurcationprobability.length],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
%     hold on;
%     semilogy([controlanalysis.termination.pathlength.pathlength],[controlanalysis.termination.pathlength.terminationprobability.length],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);    
%     set(gca,'FontSize',axesfontsize); hold off;
    
%     subplot(3,4,7); box on; 
%     semilogy([controlanalysis.bifurcation.branchlength.branchlength],[controlanalysis.bifurcation.branchlength.bifurcationprobability.length],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
%     hold on;
%     semilogy([controlanalysis.termination.branchlength.branchlength],[controlanalysis.termination.branchlength.terminationprobability.length],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);    
%     set(gca,'FontSize',axesfontsize); hold off;
	
% 	subplot(3,4,8); box on; 
%     semilogy([controlanalysis.bifurcation.branchorder.branchorder],[controlanalysis.bifurcation.branchorder.bifurcationprobability.length],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
%     hold on;
%     semilogy([controlanalysis.termination.branchorder.branchorder],[controlanalysis.termination.branchorder.terminationprobability.length],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);    
%     set(gca,'FontSize',axesfontsize); hold off;
    
%     subplot(3,4,9); box on;
%     loglog([controlanalysis.bifurcation.diameter.diameter],[controlanalysis.bifurcation.diameter.bifurcationprobability.length],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
%     hold on;
%     loglog([controlanalysis.termination.diameter.diameter],[controlanalysis.termination.diameter.terminationprobability.length],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
%     xlabel('Diameter','FontSize',labelfontsize,'FontWeight','b');
%     ylabel('Probability (Log-Log)','FontSize',labelfontsize,'FontWeight','b'); 
%     set(gca,'FontSize',axesfontsize); hold off;
    
%     subplot(3,4,10); box on; 
%     loglog([controlanalysis.bifurcation.pathlength.pathlength],[controlanalysis.bifurcation.pathlength.bifurcationprobability.length],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
%     hold on;
%     loglog([controlanalysis.termination.pathlength.pathlength],[controlanalysis.termination.pathlength.terminationprobability.length],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);    
%     xlabel('Path Length','FontSize',labelfontsize,'FontWeight','b');
%     set(gca,'FontSize',axesfontsize); hold off;
    
%     subplot(3,4,11); box on; 
%     loglog([controlanalysis.bifurcation.branchlength.branchlength],[controlanalysis.bifurcation.branchlength.bifurcationprobability.length],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
%     hold on;
%     loglog([controlanalysis.termination.branchlength.branchlength],[controlanalysis.termination.branchlength.terminationprobability.length],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);    
%     xlabel('Branch Length','FontSize',labelfontsize,'FontWeight','b');
%     set(gca,'FontSize',axesfontsize); hold off;
	
% 	subplot(3,4,12); box on; 
%     loglog([controlanalysis.bifurcation.branchorder.branchorder],[controlanalysis.bifurcation.branchorder.bifurcationprobability.length],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
%     hold on;
%     loglog([controlanalysis.termination.branchorder.branchorder],[controlanalysis.termination.branchorder.terminationprobability.length],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);    
%     xlabel('Branch Order','FontSize',labelfontsize,'FontWeight','b');
%     set(gca,'FontSize',axesfontsize); hold off;
    
    

%     subplotspace('horizontal',-5);
%     subplotspace('vertical',-15);

%     [ax,h3]=suplabel('Bifurcation / Termination Probabilities by Length'  ,'t');
%     set(h3,'FontSize',titlefontsize);


%     currentdirectory = cd;
%     cd(controlanalysis.datapathname);

%     if exist('figures','dir')==7
%         cd('figures');
%     else
%         mkdir('figures');
%         cd('figures');
%     end

%     %%fillscreen;

%     filename = sprintf('%s_%s',controlanalysis.inputfilename,'403_Bif_Term_Prob_Length');
%     print('-djpeg',filename);
%     %saveas(gcf,filename,'fig');
    
    
    
%     figure;
    
%     subplot(3,4,1); box on;
%     loglog([controlanalysis.bifurcation.diameter.diameter],[controlanalysis.bifurcation.diameter.numbersegments.total],'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
%     hold on;
%     loglog([controlanalysis.termination.diameter.diameter],[controlanalysis.termination.diameter.numbersegments.total],'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
%     loglog([controlanalysis.bifurcation.diameter.diameter],[controlanalysis.bifurcation.diameter.surfacearea.total],'-g','LineWidth',2);
%     loglog([controlanalysis.termination.diameter.diameter],[controlanalysis.termination.diameter.surfacearea.total],'-r','LineWidth',2);
%     ylabel('# of Endings      Length','FontSize',labelfontsize,'FontWeight','b');
%     set(gca,'FontSize',axesfontsize); hold off;
    
%     subplot(3,4,2); box on; 
%     loglog([controlanalysis.bifurcation.pathlength.pathlength],[controlanalysis.bifurcation.pathlength.numbersegments.total],'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
%     hold on;
%     loglog([controlanalysis.termination.pathlength.pathlength],[controlanalysis.termination.pathlength.numbersegments.total],'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
%     loglog([controlanalysis.bifurcation.pathlength.pathlength],[controlanalysis.bifurcation.pathlength.surfacearea.total],'-g','LineWidth',2); 
%     loglog([controlanalysis.termination.pathlength.pathlength],[controlanalysis.termination.pathlength.surfacearea.total],'-r','LineWidth',2);
%     set(gca,'FontSize',axesfontsize); hold off;
    
%     subplot(3,4,3); box on; 
%     loglog([controlanalysis.bifurcation.branchlength.branchlength],[controlanalysis.bifurcation.branchlength.numbersegments.total],'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
%     hold on;
%     loglog([controlanalysis.termination.branchlength.branchlength],[controlanalysis.termination.branchlength.numbersegments.total],'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
%     loglog([controlanalysis.bifurcation.branchlength.branchlength],[controlanalysis.bifurcation.branchlength.surfacearea.total],'-g','LineWidth',2); 
%     loglog([controlanalysis.termination.branchlength.branchlength],[controlanalysis.termination.branchlength.surfacearea.total],'-r','LineWidth',2); 
%     set(gca,'FontSize',axesfontsize); hold off;
	
% 	subplot(3,4,4); box on; 
%     loglog([controlanalysis.bifurcation.branchorder.branchorder],[controlanalysis.bifurcation.branchorder.numbersegments.total],'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
%     hold on;
%     loglog([controlanalysis.termination.branchorder.branchorder],[controlanalysis.termination.branchorder.numbersegments.total],'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
%     loglog([controlanalysis.bifurcation.branchorder.branchorder],[controlanalysis.bifurcation.branchorder.surfacearea.total],'-g','LineWidth',2); 
%     loglog([controlanalysis.termination.branchorder.branchorder],[controlanalysis.termination.branchorder.surfacearea.total],'-r','LineWidth',2); 
%     set(gca,'FontSize',axesfontsize); hold off;

%     subplot(3,4,5); box on;
%     semilogy([controlanalysis.bifurcation.diameter.diameter],[controlanalysis.bifurcation.diameter.bifurcationprobability.surfacearea],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
%     hold on;
%     semilogy([controlanalysis.termination.diameter.diameter],[controlanalysis.termination.diameter.terminationprobability.surfacearea],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
%     ylabel('Probability (Semi-Log)','FontSize',labelfontsize,'FontWeight','b');
%     set(gca,'FontSize',axesfontsize); hold off;
    
%     subplot(3,4,6); box on; 
%     semilogy([controlanalysis.bifurcation.pathlength.pathlength],[controlanalysis.bifurcation.pathlength.bifurcationprobability.surfacearea],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
%     hold on;
%     semilogy([controlanalysis.termination.pathlength.pathlength],[controlanalysis.termination.pathlength.terminationprobability.surfacearea],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);    
%     set(gca,'FontSize',axesfontsize); hold off;
    
%     subplot(3,4,7); box on; 
%     semilogy([controlanalysis.bifurcation.branchlength.branchlength],[controlanalysis.bifurcation.branchlength.bifurcationprobability.surfacearea],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
%     hold on;
%     semilogy([controlanalysis.termination.branchlength.branchlength],[controlanalysis.termination.branchlength.terminationprobability.surfacearea],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);    
%     set(gca,'FontSize',axesfontsize); hold off;
	
% 	subplot(3,4,8); box on; 
%     semilogy([controlanalysis.bifurcation.branchorder.branchorder],[controlanalysis.bifurcation.branchorder.bifurcationprobability.surfacearea],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
%     hold on;
%     semilogy([controlanalysis.termination.branchorder.branchorder],[controlanalysis.termination.branchorder.terminationprobability.surfacearea],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);    
%     set(gca,'FontSize',axesfontsize); hold off;
    
%     subplot(3,4,9); box on;
%     loglog([controlanalysis.bifurcation.diameter.diameter],[controlanalysis.bifurcation.diameter.bifurcationprobability.surfacearea],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
%     hold on;
%     loglog([controlanalysis.termination.diameter.diameter],[controlanalysis.termination.diameter.terminationprobability.surfacearea],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
%     xlabel('Diameter','FontSize',labelfontsize,'FontWeight','b');
%     ylabel('Probability (Log-Log)','FontSize',labelfontsize,'FontWeight','b'); 
%     set(gca,'FontSize',axesfontsize); hold off;
    
%     subplot(3,4,10); box on; 
%     loglog([controlanalysis.bifurcation.pathlength.pathlength],[controlanalysis.bifurcation.pathlength.bifurcationprobability.surfacearea],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
%     hold on;
%     loglog([controlanalysis.termination.pathlength.pathlength],[controlanalysis.termination.pathlength.terminationprobability.surfacearea],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);    
%     xlabel('Path Length','FontSize',labelfontsize,'FontWeight','b');
%     set(gca,'FontSize',axesfontsize); hold off;
    
%     subplot(3,4,11); box on; 
%     loglog([controlanalysis.bifurcation.branchlength.branchlength],[controlanalysis.bifurcation.branchlength.bifurcationprobability.surfacearea],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
%     hold on;
%     loglog([controlanalysis.termination.branchlength.branchlength],[controlanalysis.termination.branchlength.terminationprobability.surfacearea],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);    
%     xlabel('Branch Length','FontSize',labelfontsize,'FontWeight','b');
%     set(gca,'FontSize',axesfontsize); hold off;
	
% 	subplot(3,4,12); box on; 
%     loglog([controlanalysis.bifurcation.branchorder.branchorder],[controlanalysis.bifurcation.branchorder.bifurcationprobability.surfacearea],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
%     hold on;
%     loglog([controlanalysis.termination.branchorder.branchorder],[controlanalysis.termination.branchorder.terminationprobability.surfacearea],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);    
%     xlabel('Branch Order','FontSize',labelfontsize,'FontWeight','b');
%     set(gca,'FontSize',axesfontsize); hold off;
    
    

%     subplotspace('horizontal',-5);
%     subplotspace('vertical',-15);

%     [ax,h3]=suplabel('Bifurcation / Termination Probabilities by Surface Area'  ,'t');
%     set(h3,'FontSize',titlefontsize);


%     currentdirectory = cd;
%     cd(controlanalysis.datapathname);

%     if exist('figures','dir')==7
%         cd('figures');
%     else
%         mkdir('figures');
%         cd('figures');
%     end

%     %%fillscreen;

%     filename = sprintf('%s_%s',controlanalysis.inputfilename,'403_Bif_Term_Prob_SurfaceArea');
%     print('-djpeg',filename);
%     %saveas(gcf,filename,'fig');
    

    
    
    
%     figure;
    
%     subplot(3,4,1); box on;
%     loglog([controlanalysis.bifurcation.diameter.diameter],[controlanalysis.bifurcation.diameter.numbersegments.total],'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
%     hold on;
%     loglog([controlanalysis.termination.diameter.diameter],[controlanalysis.termination.diameter.numbersegments.total],'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
%     loglog([controlanalysis.bifurcation.diameter.diameter],[controlanalysis.bifurcation.diameter.volume.total],'-g','LineWidth',2);
%     loglog([controlanalysis.termination.diameter.diameter],[controlanalysis.termination.diameter.volume.total],'-r','LineWidth',2);
%     ylabel('# of Endings      Length','FontSize',labelfontsize,'FontWeight','b');
%     set(gca,'FontSize',axesfontsize); hold off;
    
%     subplot(3,4,2); box on; 
%     loglog([controlanalysis.bifurcation.pathlength.pathlength],[controlanalysis.bifurcation.pathlength.numbersegments.total],'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
%     hold on;
%     loglog([controlanalysis.termination.pathlength.pathlength],[controlanalysis.termination.pathlength.numbersegments.total],'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
%     loglog([controlanalysis.bifurcation.pathlength.pathlength],[controlanalysis.bifurcation.pathlength.volume.total],'-g','LineWidth',2); 
%     loglog([controlanalysis.termination.pathlength.pathlength],[controlanalysis.termination.pathlength.volume.total],'-r','LineWidth',2);
%     set(gca,'FontSize',axesfontsize); hold off;
    
%     subplot(3,4,3); box on; 
%     loglog([controlanalysis.bifurcation.branchlength.branchlength],[controlanalysis.bifurcation.branchlength.numbersegments.total],'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
%     hold on;
%     loglog([controlanalysis.termination.branchlength.branchlength],[controlanalysis.termination.branchlength.numbersegments.total],'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
%     loglog([controlanalysis.bifurcation.branchlength.branchlength],[controlanalysis.bifurcation.branchlength.volume.total],'-g','LineWidth',2); 
%     loglog([controlanalysis.termination.branchlength.branchlength],[controlanalysis.termination.branchlength.volume.total],'-r','LineWidth',2); 
%     set(gca,'FontSize',axesfontsize); hold off;
	
% 	subplot(3,4,4); box on; 
%     loglog([controlanalysis.bifurcation.branchorder.branchorder],[controlanalysis.bifurcation.branchorder.numbersegments.total],'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
%     hold on;
%     loglog([controlanalysis.termination.branchorder.branchorder],[controlanalysis.termination.branchorder.numbersegments.total],'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
%     loglog([controlanalysis.bifurcation.branchorder.branchorder],[controlanalysis.bifurcation.branchorder.volume.total],'-g','LineWidth',2); 
%     loglog([controlanalysis.termination.branchorder.branchorder],[controlanalysis.termination.branchorder.volume.total],'-r','LineWidth',2); 
%     set(gca,'FontSize',axesfontsize); hold off;

%     subplot(3,4,5); box on;
%     semilogy([controlanalysis.bifurcation.diameter.diameter],[controlanalysis.bifurcation.diameter.bifurcationprobability.volume],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
%     hold on;
%     semilogy([controlanalysis.termination.diameter.diameter],[controlanalysis.termination.diameter.terminationprobability.volume],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
%     ylabel('Probability (Semi-Log)','FontSize',labelfontsize,'FontWeight','b');
%     set(gca,'FontSize',axesfontsize); hold off;
    
%     subplot(3,4,6); box on; 
%     semilogy([controlanalysis.bifurcation.pathlength.pathlength],[controlanalysis.bifurcation.pathlength.bifurcationprobability.volume],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
%     hold on;
%     semilogy([controlanalysis.termination.pathlength.pathlength],[controlanalysis.termination.pathlength.terminationprobability.volume],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);    
%     set(gca,'FontSize',axesfontsize); hold off;
    
%     subplot(3,4,7); box on; 
%     semilogy([controlanalysis.bifurcation.branchlength.branchlength],[controlanalysis.bifurcation.branchlength.bifurcationprobability.volume],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
%     hold on;
%     semilogy([controlanalysis.termination.branchlength.branchlength],[controlanalysis.termination.branchlength.terminationprobability.volume],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);    
%     set(gca,'FontSize',axesfontsize); hold off;
	
% 	subplot(3,4,8); box on; 
%     semilogy([controlanalysis.bifurcation.branchorder.branchorder],[controlanalysis.bifurcation.branchorder.bifurcationprobability.volume],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
%     hold on;
%     semilogy([controlanalysis.termination.branchorder.branchorder],[controlanalysis.termination.branchorder.terminationprobability.volume],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);    
%     set(gca,'FontSize',axesfontsize); hold off;
    
%     subplot(3,4,9); box on;
%     loglog([controlanalysis.bifurcation.diameter.diameter],[controlanalysis.bifurcation.diameter.bifurcationprobability.volume],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
%     hold on;
%     loglog([controlanalysis.termination.diameter.diameter],[controlanalysis.termination.diameter.terminationprobability.volume],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
%     xlabel('Diameter','FontSize',labelfontsize,'FontWeight','b');
%     ylabel('Probability (Log-Log)','FontSize',labelfontsize,'FontWeight','b'); 
%     set(gca,'FontSize',axesfontsize); hold off;
    
%     subplot(3,4,10); box on; 
%     loglog([controlanalysis.bifurcation.pathlength.pathlength],[controlanalysis.bifurcation.pathlength.bifurcationprobability.volume],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
%     hold on;
%     loglog([controlanalysis.termination.pathlength.pathlength],[controlanalysis.termination.pathlength.terminationprobability.volume],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);    
%     xlabel('Path Length','FontSize',labelfontsize,'FontWeight','b');
%     set(gca,'FontSize',axesfontsize); hold off;
    
%     subplot(3,4,11); box on; 
%     loglog([controlanalysis.bifurcation.branchlength.branchlength],[controlanalysis.bifurcation.branchlength.bifurcationprobability.volume],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
%     hold on;
%     loglog([controlanalysis.termination.branchlength.branchlength],[controlanalysis.termination.branchlength.terminationprobability.volume],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);    
%     xlabel('Branch Length','FontSize',labelfontsize,'FontWeight','b');
%     set(gca,'FontSize',axesfontsize); hold off;
	
% 	subplot(3,4,12); box on; 
%     loglog([controlanalysis.bifurcation.branchorder.branchorder],[controlanalysis.bifurcation.branchorder.bifurcationprobability.volume],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
%     hold on;
%     loglog([controlanalysis.termination.branchorder.branchorder],[controlanalysis.termination.branchorder.terminationprobability.volume],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);    
%     xlabel('Branch Order','FontSize',labelfontsize,'FontWeight','b');
%     set(gca,'FontSize',axesfontsize); hold off;
    
    

%     subplotspace('horizontal',-5);
%     subplotspace('vertical',-15);

%     [ax,h3]=suplabel('Bifurcation / Termination Probabilities by Volume'  ,'t');
%     set(h3,'FontSize',titlefontsize);


%     currentdirectory = cd;
%     cd(controlanalysis.datapathname);

%     if exist('figures','dir')==7
%         cd('figures');
%     else
%         mkdir('figures');
%         cd('figures');
%     end

%     %%fillscreen;

%     filename = sprintf('%s_%s',controlanalysis.inputfilename,'403_Bif_Term_Prob_Volume');
%     print('-djpeg',filename);
%     %saveas(gcf,filename,'fig');

% end






% if nargin == 2

%     figure;
    
%     subplot(3,4,1); box on;
%     loglog([controlanalysis.bifurcation.diameter.diameter],[controlanalysis.bifurcation.diameter.numbersegments.total],'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
%     hold on;
%     loglog([controlanalysis.termination.diameter.diameter],[controlanalysis.termination.diameter.numbersegments.total],'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
%     loglog([controlanalysis.bifurcation.diameter.diameter],[controlanalysis.bifurcation.diameter.length.total],'-g','LineWidth',2);
%     loglog([controlanalysis.termination.diameter.diameter],[controlanalysis.termination.diameter.length.total],'-r','LineWidth',2);
%     loglog([testanalysis.bifurcation.diameter.diameter],[testanalysis.bifurcation.diameter.numbersegments.total],'-sy','LineWidth',1.5,'MarkerEdgeColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
%     loglog([testanalysis.termination.diameter.diameter],[testanalysis.termination.diameter.numbersegments.total],'-dm','LineWidth',1.5,'MarkerEdgeColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
%     loglog([testanalysis.bifurcation.diameter.diameter],[testanalysis.bifurcation.diameter.length.total],'-y','LineWidth',2);
%     loglog([testanalysis.termination.diameter.diameter],[testanalysis.termination.diameter.length.total],'-m','LineWidth',2);
%     ylabel('# of Endings      Length','FontSize',labelfontsize,'FontWeight','b');
%     %legendhandle = gca;
%     set(gca,'FontSize',axesfontsize); hold off;
    
%     subplot(3,4,2); box on; 
%     loglog([controlanalysis.bifurcation.pathlength.pathlength],[controlanalysis.bifurcation.pathlength.numbersegments.total],'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
%     hold on;
%     loglog([controlanalysis.termination.pathlength.pathlength],[controlanalysis.termination.pathlength.numbersegments.total],'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
%     loglog([controlanalysis.bifurcation.pathlength.pathlength],[controlanalysis.bifurcation.pathlength.length.total],'-g','LineWidth',2); 
%     loglog([controlanalysis.termination.pathlength.pathlength],[controlanalysis.termination.pathlength.length.total],'-r','LineWidth',2);
%     loglog([testanalysis.bifurcation.pathlength.pathlength],[testanalysis.bifurcation.pathlength.numbersegments.total],'-sy','LineWidth',1.5,'MarkerEdgeColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
%     loglog([testanalysis.termination.pathlength.pathlength],[testanalysis.termination.pathlength.numbersegments.total],'-dm','LineWidth',1.5,'MarkerEdgeColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
%     loglog([testanalysis.bifurcation.pathlength.pathlength],[testanalysis.bifurcation.pathlength.length.total],'-y','LineWidth',2); 
%     loglog([testanalysis.termination.pathlength.pathlength],[testanalysis.termination.pathlength.length.total],'-m','LineWidth',2);
%     set(gca,'FontSize',axesfontsize); hold off;
    
%     subplot(3,4,3); box on; 
%     loglog([controlanalysis.bifurcation.branchlength.branchlength],[controlanalysis.bifurcation.branchlength.numbersegments.total],'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
%     hold on;
%     loglog([controlanalysis.termination.branchlength.branchlength],[controlanalysis.termination.branchlength.numbersegments.total],'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
%     loglog([controlanalysis.bifurcation.branchlength.branchlength],[controlanalysis.bifurcation.branchlength.length.total],'-g','LineWidth',2); 
%     loglog([controlanalysis.termination.branchlength.branchlength],[controlanalysis.termination.branchlength.length.total],'-r','LineWidth',2); 
%     loglog([testanalysis.bifurcation.branchlength.branchlength],[testanalysis.bifurcation.branchlength.numbersegments.total],'-sy','LineWidth',1.5,'MarkerEdgeColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
%     loglog([testanalysis.termination.branchlength.branchlength],[testanalysis.termination.branchlength.numbersegments.total],'-dm','LineWidth',1.5,'MarkerEdgeColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
%     loglog([testanalysis.bifurcation.branchlength.branchlength],[testanalysis.bifurcation.branchlength.length.total],'-y','LineWidth',2); 
%     loglog([testanalysis.termination.branchlength.branchlength],[testanalysis.termination.branchlength.length.total],'-m','LineWidth',2); 
%     legendhandle = gca;
%     set(gca,'FontSize',axesfontsize); hold off;
	
% 	subplot(3,4,4); box on; 
%     loglog([controlanalysis.bifurcation.branchorder.branchorder],[controlanalysis.bifurcation.branchorder.numbersegments.total],'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
%     hold on;
%     loglog([controlanalysis.termination.branchorder.branchorder],[controlanalysis.termination.branchorder.numbersegments.total],'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
%     loglog([controlanalysis.bifurcation.branchorder.branchorder],[controlanalysis.bifurcation.branchorder.length.total],'-g','LineWidth',2); 
%     loglog([controlanalysis.termination.branchorder.branchorder],[controlanalysis.termination.branchorder.length.total],'-r','LineWidth',2); 
%     loglog([testanalysis.bifurcation.branchorder.branchorder],[testanalysis.bifurcation.branchorder.numbersegments.total],'-sy','LineWidth',1.5,'MarkerEdgeColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
%     loglog([testanalysis.termination.branchorder.branchorder],[testanalysis.termination.branchorder.numbersegments.total],'-dm','LineWidth',1.5,'MarkerEdgeColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
%     loglog([testanalysis.bifurcation.branchorder.branchorder],[testanalysis.bifurcation.branchorder.length.total],'-y','LineWidth',2); 
%     loglog([testanalysis.termination.branchorder.branchorder],[testanalysis.termination.branchorder.length.total],'-m','LineWidth',2); 
%     legendhandle = gca;
%     set(gca,'FontSize',axesfontsize); hold off;

    % subplot(3,4,5); box on;
    % semilogy([controlanalysis.bifurcation.diameter.diameter],[controlanalysis.bifurcation.diameter.bifurcationprobability.length],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
    % hold on;
    % semilogy([controlanalysis.termination.diameter.diameter],[controlanalysis.termination.diameter.terminationprobability.length],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
    % semilogy([testanalysis.bifurcation.diameter.diameter],[testanalysis.bifurcation.diameter.bifurcationprobability.length],'sy','MarkerFaceColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
    % semilogy([testanalysis.termination.diameter.diameter],[testanalysis.termination.diameter.terminationprobability.length],'dm','MarkerFaceColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
    % ylabel('Probability (Semi-Log)','FontSize',labelfontsize,'FontWeight','b');
    % set(gca,'FontSize',axesfontsize); hold off;
    
%     subplot(3,4,6); box on; 
%     semilogy([controlanalysis.bifurcation.pathlength.pathlength],[controlanalysis.bifurcation.pathlength.bifurcationprobability.length],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
%     hold on;
%     semilogy([controlanalysis.termination.pathlength.pathlength],[controlanalysis.termination.pathlength.terminationprobability.length],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);    
%     semilogy([testanalysis.bifurcation.pathlength.pathlength],[testanalysis.bifurcation.pathlength.bifurcationprobability.length],'sy','MarkerFaceColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
%     semilogy([testanalysis.termination.pathlength.pathlength],[testanalysis.termination.pathlength.terminationprobability.length],'dm','MarkerFaceColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);    
%     set(gca,'FontSize',axesfontsize); hold off;
    
%     subplot(3,4,7); box on; 
%     semilogy([controlanalysis.bifurcation.branchlength.branchlength],[controlanalysis.bifurcation.branchlength.bifurcationprobability.length],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
%     hold on;
%     semilogy([controlanalysis.termination.branchlength.branchlength],[controlanalysis.termination.branchlength.terminationprobability.length],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);    
%     semilogy([testanalysis.bifurcation.branchlength.branchlength],[testanalysis.bifurcation.branchlength.bifurcationprobability.length],'sy','MarkerFaceColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
%     semilogy([testanalysis.termination.branchlength.branchlength],[testanalysis.termination.branchlength.terminationprobability.length],'dm','MarkerFaceColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);    
%     set(gca,'FontSize',axesfontsize); hold off;
	
% 	subplot(3,4,8); box on; 
%     semilogy([controlanalysis.bifurcation.branchorder.branchorder],[controlanalysis.bifurcation.branchorder.bifurcationprobability.length],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
%     hold on;
%     semilogy([controlanalysis.termination.branchorder.branchorder],[controlanalysis.termination.branchorder.terminationprobability.length],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);    
%     semilogy([testanalysis.bifurcation.branchorder.branchorder],[testanalysis.bifurcation.branchorder.bifurcationprobability.length],'sy','MarkerFaceColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
%     semilogy([testanalysis.termination.branchorder.branchorder],[testanalysis.termination.branchorder.terminationprobability.length],'dm','MarkerFaceColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);    
%     set(gca,'FontSize',axesfontsize); hold off;
    
%     subplot(3,4,9); box on;
%     loglog([controlanalysis.bifurcation.diameter.diameter],[controlanalysis.bifurcation.diameter.bifurcationprobability.length],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
%     hold on;
%     loglog([controlanalysis.termination.diameter.diameter],[controlanalysis.termination.diameter.terminationprobability.length],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
%     loglog([testanalysis.bifurcation.diameter.diameter],[testanalysis.bifurcation.diameter.bifurcationprobability.length],'sy','MarkerFaceColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
%     loglog([testanalysis.termination.diameter.diameter],[testanalysis.termination.diameter.terminationprobability.length],'dm','MarkerFaceColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
%     xlabel('Diameter','FontSize',labelfontsize,'FontWeight','b');
%     ylabel('Probability (Log-Log)','FontSize',labelfontsize,'FontWeight','b'); 
%     set(gca,'FontSize',axesfontsize); hold off;
    
%     subplot(3,4,10); box on; 
%     loglog([controlanalysis.bifurcation.pathlength.pathlength],[controlanalysis.bifurcation.pathlength.bifurcationprobability.length],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
%     hold on;
%     loglog([controlanalysis.termination.pathlength.pathlength],[controlanalysis.termination.pathlength.terminationprobability.length],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);    
%     loglog([testanalysis.bifurcation.pathlength.pathlength],[testanalysis.bifurcation.pathlength.bifurcationprobability.length],'sy','MarkerFaceColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
%     loglog([testanalysis.termination.pathlength.pathlength],[testanalysis.termination.pathlength.terminationprobability.length],'dm','MarkerFaceColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);    
%     xlabel('Path Length','FontSize',labelfontsize,'FontWeight','b');
%     set(gca,'FontSize',axesfontsize); hold off;
    
%     subplot(3,4,11); box on; 
%     loglog([controlanalysis.bifurcation.branchlength.branchlength],[controlanalysis.bifurcation.branchlength.bifurcationprobability.length],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
%     hold on;
%     loglog([controlanalysis.termination.branchlength.branchlength],[controlanalysis.termination.branchlength.terminationprobability.length],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);    
%     loglog([testanalysis.bifurcation.branchlength.branchlength],[testanalysis.bifurcation.branchlength.bifurcationprobability.length],'sy','MarkerFaceColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
%     loglog([testanalysis.termination.branchlength.branchlength],[testanalysis.termination.branchlength.terminationprobability.length],'dm','MarkerFaceColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);    
%     xlabel('Branch Length','FontSize',labelfontsize,'FontWeight','b');
%     set(gca,'FontSize',axesfontsize); hold off;
	
% 	subplot(3,4,12); box on; 
%     loglog([controlanalysis.bifurcation.branchorder.branchorder],[controlanalysis.bifurcation.branchorder.bifurcationprobability.length],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
%     hold on;
%     loglog([controlanalysis.termination.branchorder.branchorder],[controlanalysis.termination.branchorder.terminationprobability.length],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);    
%     loglog([testanalysis.bifurcation.branchorder.branchorder],[testanalysis.bifurcation.branchorder.bifurcationprobability.length],'sy','MarkerFaceColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
%     loglog([testanalysis.termination.branchorder.branchorder],[testanalysis.termination.branchorder.terminationprobability.length],'dm','MarkerFaceColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);    
%     xlabel('Branch Order','FontSize',labelfontsize,'FontWeight','b');
%     set(gca,'FontSize',axesfontsize); hold off;
    
    

%     subplotspace('horizontal',-5);
%     subplotspace('vertical',-15);

%     [ax,h3]=suplabel('Bifurcation / Termination Probabilities by Length'  ,'t');
%     set(h3,'FontSize',titlefontsize);


%     currentdirectory = cd;
%     cd(controlanalysis.datapathname);
%     cd ..

%     if exist(sprintf('%s_%s_comparison',controlanalysis.inputfilename,testanalysis.inputfilename),'dir')==7;
%         cd(sprintf('%s_%s_comparison',controlanalysis.inputfilename,testanalysis.inputfilename));
%     else
%         mkdir(sprintf('%s_%s_comparison',controlanalysis.inputfilename,testanalysis.inputfilename));
%         cd(sprintf('%s_%s_comparison',controlanalysis.inputfilename,testanalysis.inputfilename));
%     end

%     if exist('comparisonfigures','dir')==7
%         cd('comparisonfigures');
%     else
%         mkdir('comparisonfigures');
%         cd('comparisonfigures');
%     end

%     %%fillscreen;
    
%     legend(legendhandle,[controlanalysis.inputfilename ' #Bifs'],[controlanalysis.inputfilename ' #Terms'],[controlanalysis.inputfilename ' Bif Length'],[controlanalysis.inputfilename ' Term Length'],[testanalysis.inputfilename ' #Bifs'],[testanalysis.inputfilename ' #Terms'],[testanalysis.inputfilename ' Bif Length'],[testanalysis.inputfilename ' Term Length']);

%     filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'403_Bif_Term_Prob_Length');
%     print('-djpeg',filename);
%     %saveas(gcf,filename,'fig');
    
    
    
%     figure;
    
%     subplot(3,4,1); box on;
%     loglog([controlanalysis.bifurcation.diameter.diameter],[controlanalysis.bifurcation.diameter.numbersegments.total],'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
%     hold on;
%     loglog([controlanalysis.termination.diameter.diameter],[controlanalysis.termination.diameter.numbersegments.total],'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
%     loglog([controlanalysis.bifurcation.diameter.diameter],[controlanalysis.bifurcation.diameter.surfacearea.total],'-g','LineWidth',2);
%     loglog([controlanalysis.termination.diameter.diameter],[controlanalysis.termination.diameter.surfacearea.total],'-r','LineWidth',2);
%     loglog([testanalysis.bifurcation.diameter.diameter],[testanalysis.bifurcation.diameter.numbersegments.total],'-sy','LineWidth',1.5,'MarkerEdgeColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
%     loglog([testanalysis.termination.diameter.diameter],[testanalysis.termination.diameter.numbersegments.total],'-dm','LineWidth',1.5,'MarkerEdgeColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
%     loglog([testanalysis.bifurcation.diameter.diameter],[testanalysis.bifurcation.diameter.surfacearea.total],'-y','LineWidth',2);
%     loglog([testanalysis.termination.diameter.diameter],[testanalysis.termination.diameter.surfacearea.total],'-m','LineWidth',2);
%     ylabel('# of Endings      Length','FontSize',labelfontsize,'FontWeight','b');
%     %legendhandle = gca;
%     set(gca,'FontSize',axesfontsize); hold off;
    
%     subplot(3,4,2); box on; 
%     loglog([controlanalysis.bifurcation.pathlength.pathlength],[controlanalysis.bifurcation.pathlength.numbersegments.total],'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
%     hold on;
%     loglog([controlanalysis.termination.pathlength.pathlength],[controlanalysis.termination.pathlength.numbersegments.total],'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
%     loglog([controlanalysis.bifurcation.pathlength.pathlength],[controlanalysis.bifurcation.pathlength.surfacearea.total],'-g','LineWidth',2); 
%     loglog([controlanalysis.termination.pathlength.pathlength],[controlanalysis.termination.pathlength.surfacearea.total],'-r','LineWidth',2);
%     loglog([testanalysis.bifurcation.pathlength.pathlength],[testanalysis.bifurcation.pathlength.numbersegments.total],'-sy','LineWidth',1.5,'MarkerEdgeColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
%     loglog([testanalysis.termination.pathlength.pathlength],[testanalysis.termination.pathlength.numbersegments.total],'-dm','LineWidth',1.5,'MarkerEdgeColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
%     loglog([testanalysis.bifurcation.pathlength.pathlength],[testanalysis.bifurcation.pathlength.surfacearea.total],'-y','LineWidth',2); 
%     loglog([testanalysis.termination.pathlength.pathlength],[testanalysis.termination.pathlength.surfacearea.total],'-m','LineWidth',2);
%     set(gca,'FontSize',axesfontsize); hold off;
    
%     subplot(3,4,3); box on; 
%     loglog([controlanalysis.bifurcation.branchlength.branchlength],[controlanalysis.bifurcation.branchlength.numbersegments.total],'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
%     hold on;
%     loglog([controlanalysis.termination.branchlength.branchlength],[controlanalysis.termination.branchlength.numbersegments.total],'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
%     loglog([controlanalysis.bifurcation.branchlength.branchlength],[controlanalysis.bifurcation.branchlength.surfacearea.total],'-g','LineWidth',2); 
%     loglog([controlanalysis.termination.branchlength.branchlength],[controlanalysis.termination.branchlength.surfacearea.total],'-r','LineWidth',2); 
%     loglog([testanalysis.bifurcation.branchlength.branchlength],[testanalysis.bifurcation.branchlength.numbersegments.total],'-sy','LineWidth',1.5,'MarkerEdgeColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
%     loglog([testanalysis.termination.branchlength.branchlength],[testanalysis.termination.branchlength.numbersegments.total],'-dm','LineWidth',1.5,'MarkerEdgeColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
%     loglog([testanalysis.bifurcation.branchlength.branchlength],[testanalysis.bifurcation.branchlength.surfacearea.total],'-y','LineWidth',2); 
%     loglog([testanalysis.termination.branchlength.branchlength],[testanalysis.termination.branchlength.surfacearea.total],'-m','LineWidth',2); 
%     legendhandle = gca;
%     set(gca,'FontSize',axesfontsize); hold off;
	
% 	subplot(3,4,4); box on; 
%     loglog([controlanalysis.bifurcation.branchorder.branchorder],[controlanalysis.bifurcation.branchorder.numbersegments.total],'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
%     hold on;
%     loglog([controlanalysis.termination.branchorder.branchorder],[controlanalysis.termination.branchorder.numbersegments.total],'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
%     loglog([controlanalysis.bifurcation.branchorder.branchorder],[controlanalysis.bifurcation.branchorder.surfacearea.total],'-g','LineWidth',2); 
%     loglog([controlanalysis.termination.branchorder.branchorder],[controlanalysis.termination.branchorder.surfacearea.total],'-r','LineWidth',2); 
%     loglog([testanalysis.bifurcation.branchorder.branchorder],[testanalysis.bifurcation.branchorder.numbersegments.total],'-sy','LineWidth',1.5,'MarkerEdgeColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
%     loglog([testanalysis.termination.branchorder.branchorder],[testanalysis.termination.branchorder.numbersegments.total],'-dm','LineWidth',1.5,'MarkerEdgeColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
%     loglog([testanalysis.bifurcation.branchorder.branchorder],[testanalysis.bifurcation.branchorder.surfacearea.total],'-y','LineWidth',2); 
%     loglog([testanalysis.termination.branchorder.branchorder],[testanalysis.termination.branchorder.surfacearea.total],'-m','LineWidth',2); 
%     legendhandle = gca;
%     set(gca,'FontSize',axesfontsize); hold off;

%     subplot(3,4,5); box on;
%     semilogy([controlanalysis.bifurcation.diameter.diameter],[controlanalysis.bifurcation.diameter.bifurcationprobability.surfacearea],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
%     hold on;
%     semilogy([controlanalysis.termination.diameter.diameter],[controlanalysis.termination.diameter.terminationprobability.surfacearea],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
%     semilogy([testanalysis.bifurcation.diameter.diameter],[testanalysis.bifurcation.diameter.bifurcationprobability.surfacearea],'sy','MarkerFaceColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
%     semilogy([testanalysis.termination.diameter.diameter],[testanalysis.termination.diameter.terminationprobability.surfacearea],'dm','MarkerFaceColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
%     ylabel('Probability (Semi-Log)','FontSize',labelfontsize,'FontWeight','b');
%     set(gca,'FontSize',axesfontsize); hold off;
    
%     subplot(3,4,6); box on; 
%     semilogy([controlanalysis.bifurcation.pathlength.pathlength],[controlanalysis.bifurcation.pathlength.bifurcationprobability.surfacearea],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
%     hold on;
%     semilogy([controlanalysis.termination.pathlength.pathlength],[controlanalysis.termination.pathlength.terminationprobability.surfacearea],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);    
%     semilogy([testanalysis.bifurcation.pathlength.pathlength],[testanalysis.bifurcation.pathlength.bifurcationprobability.surfacearea],'sy','MarkerFaceColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
%     semilogy([testanalysis.termination.pathlength.pathlength],[testanalysis.termination.pathlength.terminationprobability.surfacearea],'dm','MarkerFaceColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);    
%     set(gca,'FontSize',axesfontsize); hold off;
    
%     subplot(3,4,7); box on; 
%     semilogy([controlanalysis.bifurcation.branchlength.branchlength],[controlanalysis.bifurcation.branchlength.bifurcationprobability.surfacearea],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
%     hold on;
%     semilogy([controlanalysis.termination.branchlength.branchlength],[controlanalysis.termination.branchlength.terminationprobability.surfacearea],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);    
%     semilogy([testanalysis.bifurcation.branchlength.branchlength],[testanalysis.bifurcation.branchlength.bifurcationprobability.surfacearea],'sy','MarkerFaceColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
%     semilogy([testanalysis.termination.branchlength.branchlength],[testanalysis.termination.branchlength.terminationprobability.surfacearea],'dm','MarkerFaceColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);    
%     set(gca,'FontSize',axesfontsize); hold off;
	
% 	subplot(3,4,8); box on; 
%     semilogy([controlanalysis.bifurcation.branchorder.branchorder],[controlanalysis.bifurcation.branchorder.bifurcationprobability.surfacearea],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
%     hold on;
%     semilogy([controlanalysis.termination.branchorder.branchorder],[controlanalysis.termination.branchorder.terminationprobability.surfacearea],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);    
%     semilogy([testanalysis.bifurcation.branchorder.branchorder],[testanalysis.bifurcation.branchorder.bifurcationprobability.surfacearea],'sy','MarkerFaceColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
%     semilogy([testanalysis.termination.branchorder.branchorder],[testanalysis.termination.branchorder.terminationprobability.surfacearea],'dm','MarkerFaceColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);    
%     set(gca,'FontSize',axesfontsize); hold off;
    
%     subplot(3,4,9); box on;
%     loglog([controlanalysis.bifurcation.diameter.diameter],[controlanalysis.bifurcation.diameter.bifurcationprobability.surfacearea],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
%     hold on;
%     loglog([controlanalysis.termination.diameter.diameter],[controlanalysis.termination.diameter.terminationprobability.surfacearea],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
%     loglog([testanalysis.bifurcation.diameter.diameter],[testanalysis.bifurcation.diameter.bifurcationprobability.surfacearea],'sy','MarkerFaceColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
%     loglog([testanalysis.termination.diameter.diameter],[testanalysis.termination.diameter.terminationprobability.surfacearea],'dm','MarkerFaceColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
%     xlabel('Diameter','FontSize',labelfontsize,'FontWeight','b');
%     ylabel('Probability (Log-Log)','FontSize',labelfontsize,'FontWeight','b'); 
%     set(gca,'FontSize',axesfontsize); hold off;
    
%     subplot(3,4,10); box on; 
%     loglog([controlanalysis.bifurcation.pathlength.pathlength],[controlanalysis.bifurcation.pathlength.bifurcationprobability.surfacearea],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
%     hold on;
%     loglog([controlanalysis.termination.pathlength.pathlength],[controlanalysis.termination.pathlength.terminationprobability.surfacearea],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);    
%     loglog([testanalysis.bifurcation.pathlength.pathlength],[testanalysis.bifurcation.pathlength.bifurcationprobability.surfacearea],'sy','MarkerFaceColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
%     loglog([testanalysis.termination.pathlength.pathlength],[testanalysis.termination.pathlength.terminationprobability.surfacearea],'dm','MarkerFaceColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);    
%     xlabel('Path Length','FontSize',labelfontsize,'FontWeight','b');
%     set(gca,'FontSize',axesfontsize); hold off;
    
%     subplot(3,4,11); box on; 
%     loglog([controlanalysis.bifurcation.branchlength.branchlength],[controlanalysis.bifurcation.branchlength.bifurcationprobability.surfacearea],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
%     hold on;
%     loglog([controlanalysis.termination.branchlength.branchlength],[controlanalysis.termination.branchlength.terminationprobability.surfacearea],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);    
%     loglog([testanalysis.bifurcation.branchlength.branchlength],[testanalysis.bifurcation.branchlength.bifurcationprobability.surfacearea],'sy','MarkerFaceColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
%     loglog([testanalysis.termination.branchlength.branchlength],[testanalysis.termination.branchlength.terminationprobability.surfacearea],'dm','MarkerFaceColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);    
%     xlabel('Branch Length','FontSize',labelfontsize,'FontWeight','b');
%     set(gca,'FontSize',axesfontsize); hold off;
	
% 	subplot(3,4,12); box on; 
%     loglog([controlanalysis.bifurcation.branchorder.branchorder],[controlanalysis.bifurcation.branchorder.bifurcationprobability.surfacearea],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
%     hold on;
%     loglog([controlanalysis.termination.branchorder.branchorder],[controlanalysis.termination.branchorder.terminationprobability.surfacearea],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);    
%     loglog([testanalysis.bifurcation.branchorder.branchorder],[testanalysis.bifurcation.branchorder.bifurcationprobability.surfacearea],'sy','MarkerFaceColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
%     loglog([testanalysis.termination.branchorder.branchorder],[testanalysis.termination.branchorder.terminationprobability.surfacearea],'dm','MarkerFaceColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);    
%     xlabel('Branch Order','FontSize',labelfontsize,'FontWeight','b');
%     set(gca,'FontSize',axesfontsize); hold off;
    
    

%     subplotspace('horizontal',-5);
%     subplotspace('vertical',-15);

%     [ax,h3]=suplabel('Bifurcation / Termination Probabilities by Surface Area'  ,'t');
%     set(h3,'FontSize',titlefontsize);


%     currentdirectory = cd;
%     cd(controlanalysis.datapathname);
%     cd ..

%     if exist(sprintf('%s_%s_comparison',controlanalysis.inputfilename,testanalysis.inputfilename),'dir')==7;
%         cd(sprintf('%s_%s_comparison',controlanalysis.inputfilename,testanalysis.inputfilename));
%     else
%         mkdir(sprintf('%s_%s_comparison',controlanalysis.inputfilename,testanalysis.inputfilename));
%         cd(sprintf('%s_%s_comparison',controlanalysis.inputfilename,testanalysis.inputfilename));
%     end

%     if exist('comparisonfigures','dir')==7
%         cd('comparisonfigures');
%     else
%         mkdir('comparisonfigures');
%         cd('comparisonfigures');
%     end

%     %%fillscreen;
    
%     legend(legendhandle,[controlanalysis.inputfilename ' #Bifs'],[controlanalysis.inputfilename ' #Terms'],[controlanalysis.inputfilename ' Bif Length'],[controlanalysis.inputfilename ' Term Length'],[testanalysis.inputfilename ' #Bifs'],[testanalysis.inputfilename ' #Terms'],[testanalysis.inputfilename ' Bif Length'],[testanalysis.inputfilename ' Term Length']);

%     filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'403_Bif_Term_Prob_SurfaceArea');
%     print('-djpeg',filename);
%     %saveas(gcf,filename,'fig');
    

    
    
    
%     figure;
    
%     subplot(3,4,1); box on;
%     loglog([controlanalysis.bifurcation.diameter.diameter],[controlanalysis.bifurcation.diameter.numbersegments.total],'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
%     hold on;
%     loglog([controlanalysis.termination.diameter.diameter],[controlanalysis.termination.diameter.numbersegments.total],'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
%     loglog([controlanalysis.bifurcation.diameter.diameter],[controlanalysis.bifurcation.diameter.volume.total],'-g','LineWidth',2);
%     loglog([controlanalysis.termination.diameter.diameter],[controlanalysis.termination.diameter.volume.total],'-r','LineWidth',2);
%     loglog([testanalysis.bifurcation.diameter.diameter],[testanalysis.bifurcation.diameter.numbersegments.total],'-sy','LineWidth',1.5,'MarkerEdgeColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
%     loglog([testanalysis.termination.diameter.diameter],[testanalysis.termination.diameter.numbersegments.total],'-dm','LineWidth',1.5,'MarkerEdgeColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
%     loglog([testanalysis.bifurcation.diameter.diameter],[testanalysis.bifurcation.diameter.volume.total],'-y','LineWidth',2);
%     loglog([testanalysis.termination.diameter.diameter],[testanalysis.termination.diameter.volume.total],'-m','LineWidth',2);
%     ylabel('# of Endings      Length','FontSize',labelfontsize,'FontWeight','b');
%     %legendhandle = gca;
%     set(gca,'FontSize',axesfontsize); hold off;
    
%     subplot(3,4,2); box on; 
%     loglog([controlanalysis.bifurcation.pathlength.pathlength],[controlanalysis.bifurcation.pathlength.numbersegments.total],'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
%     hold on;
%     loglog([controlanalysis.termination.pathlength.pathlength],[controlanalysis.termination.pathlength.numbersegments.total],'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
%     loglog([controlanalysis.bifurcation.pathlength.pathlength],[controlanalysis.bifurcation.pathlength.volume.total],'-g','LineWidth',2); 
%     loglog([controlanalysis.termination.pathlength.pathlength],[controlanalysis.termination.pathlength.volume.total],'-r','LineWidth',2);
%     loglog([testanalysis.bifurcation.pathlength.pathlength],[testanalysis.bifurcation.pathlength.numbersegments.total],'-sy','LineWidth',1.5,'MarkerEdgeColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
%     loglog([testanalysis.termination.pathlength.pathlength],[testanalysis.termination.pathlength.numbersegments.total],'-dm','LineWidth',1.5,'MarkerEdgeColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
%     loglog([testanalysis.bifurcation.pathlength.pathlength],[testanalysis.bifurcation.pathlength.volume.total],'-y','LineWidth',2); 
%     loglog([testanalysis.termination.pathlength.pathlength],[testanalysis.termination.pathlength.volume.total],'-m','LineWidth',2);
%     set(gca,'FontSize',axesfontsize); hold off;
    
%     subplot(3,4,3); box on; 
%     loglog([controlanalysis.bifurcation.branchlength.branchlength],[controlanalysis.bifurcation.branchlength.numbersegments.total],'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
%     hold on;
%     loglog([controlanalysis.termination.branchlength.branchlength],[controlanalysis.termination.branchlength.numbersegments.total],'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
%     loglog([controlanalysis.bifurcation.branchlength.branchlength],[controlanalysis.bifurcation.branchlength.volume.total],'-g','LineWidth',2); 
%     loglog([controlanalysis.termination.branchlength.branchlength],[controlanalysis.termination.branchlength.volume.total],'-r','LineWidth',2); 
%     loglog([testanalysis.bifurcation.branchlength.branchlength],[testanalysis.bifurcation.branchlength.numbersegments.total],'-sy','LineWidth',1.5,'MarkerEdgeColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
%     loglog([testanalysis.termination.branchlength.branchlength],[testanalysis.termination.branchlength.numbersegments.total],'-dm','LineWidth',1.5,'MarkerEdgeColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
%     loglog([testanalysis.bifurcation.branchlength.branchlength],[testanalysis.bifurcation.branchlength.volume.total],'-y','LineWidth',2); 
%     loglog([testanalysis.termination.branchlength.branchlength],[testanalysis.termination.branchlength.volume.total],'-m','LineWidth',2); 
%     legendhandle = gca;
%     set(gca,'FontSize',axesfontsize); hold off;
	
% 	subplot(3,4,4); box on; 
%     loglog([controlanalysis.bifurcation.branchorder.branchorder],[controlanalysis.bifurcation.branchorder.numbersegments.total],'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
%     hold on;
%     loglog([controlanalysis.termination.branchorder.branchorder],[controlanalysis.termination.branchorder.numbersegments.total],'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
%     loglog([controlanalysis.bifurcation.branchorder.branchorder],[controlanalysis.bifurcation.branchorder.volume.total],'-g','LineWidth',2); 
%     loglog([controlanalysis.termination.branchorder.branchorder],[controlanalysis.termination.branchorder.volume.total],'-r','LineWidth',2); 
%     loglog([testanalysis.bifurcation.branchorder.branchorder],[testanalysis.bifurcation.branchorder.numbersegments.total],'-sy','LineWidth',1.5,'MarkerEdgeColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
%     loglog([testanalysis.termination.branchorder.branchorder],[testanalysis.termination.branchorder.numbersegments.total],'-dm','LineWidth',1.5,'MarkerEdgeColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
%     loglog([testanalysis.bifurcation.branchorder.branchorder],[testanalysis.bifurcation.branchorder.volume.total],'-y','LineWidth',2); 
%     loglog([testanalysis.termination.branchorder.branchorder],[testanalysis.termination.branchorder.volume.total],'-m','LineWidth',2); 
%     legendhandle = gca;
%     set(gca,'FontSize',axesfontsize); hold off;

%     subplot(3,4,5); box on;
%     semilogy([controlanalysis.bifurcation.diameter.diameter],[controlanalysis.bifurcation.diameter.bifurcationprobability.volume],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
%     hold on;
%     semilogy([controlanalysis.termination.diameter.diameter],[controlanalysis.termination.diameter.terminationprobability.volume],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
%     semilogy([testanalysis.bifurcation.diameter.diameter],[testanalysis.bifurcation.diameter.bifurcationprobability.volume],'sy','MarkerFaceColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
%     semilogy([testanalysis.termination.diameter.diameter],[testanalysis.termination.diameter.terminationprobability.volume],'dm','MarkerFaceColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
%     ylabel('Probability (Semi-Log)','FontSize',labelfontsize,'FontWeight','b');
%     set(gca,'FontSize',axesfontsize); hold off;
    
%     subplot(3,4,6); box on; 
%     semilogy([controlanalysis.bifurcation.pathlength.pathlength],[controlanalysis.bifurcation.pathlength.bifurcationprobability.volume],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
%     hold on;
%     semilogy([controlanalysis.termination.pathlength.pathlength],[controlanalysis.termination.pathlength.terminationprobability.volume],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);    
%     semilogy([testanalysis.bifurcation.pathlength.pathlength],[testanalysis.bifurcation.pathlength.bifurcationprobability.volume],'sy','MarkerFaceColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
%     semilogy([testanalysis.termination.pathlength.pathlength],[testanalysis.termination.pathlength.terminationprobability.volume],'dm','MarkerFaceColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);    
%     set(gca,'FontSize',axesfontsize); hold off;
    
%     subplot(3,4,7); box on; 
%     semilogy([controlanalysis.bifurcation.branchlength.branchlength],[controlanalysis.bifurcation.branchlength.bifurcationprobability.volume],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
%     hold on;
%     semilogy([controlanalysis.termination.branchlength.branchlength],[controlanalysis.termination.branchlength.terminationprobability.volume],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);    
%     semilogy([testanalysis.bifurcation.branchlength.branchlength],[testanalysis.bifurcation.branchlength.bifurcationprobability.volume],'sy','MarkerFaceColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
%     semilogy([testanalysis.termination.branchlength.branchlength],[testanalysis.termination.branchlength.terminationprobability.volume],'dm','MarkerFaceColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);    
%     set(gca,'FontSize',axesfontsize); hold off;
	
% 	subplot(3,4,8); box on; 
%     semilogy([controlanalysis.bifurcation.branchorder.branchorder],[controlanalysis.bifurcation.branchorder.bifurcationprobability.volume],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
%     hold on;
%     semilogy([controlanalysis.termination.branchorder.branchorder],[controlanalysis.termination.branchorder.terminationprobability.volume],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);    
%     semilogy([testanalysis.bifurcation.branchorder.branchorder],[testanalysis.bifurcation.branchorder.bifurcationprobability.volume],'sy','MarkerFaceColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
%     semilogy([testanalysis.termination.branchorder.branchorder],[testanalysis.termination.branchorder.terminationprobability.volume],'dm','MarkerFaceColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);    
%     set(gca,'FontSize',axesfontsize); hold off;
    
%     subplot(3,4,9); box on;
%     loglog([controlanalysis.bifurcation.diameter.diameter],[controlanalysis.bifurcation.diameter.bifurcationprobability.volume],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
%     hold on;
%     loglog([controlanalysis.termination.diameter.diameter],[controlanalysis.termination.diameter.terminationprobability.volume],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
%     loglog([testanalysis.bifurcation.diameter.diameter],[testanalysis.bifurcation.diameter.bifurcationprobability.volume],'sy','MarkerFaceColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
%     loglog([testanalysis.termination.diameter.diameter],[testanalysis.termination.diameter.terminationprobability.volume],'dm','MarkerFaceColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
%     xlabel('Diameter','FontSize',labelfontsize,'FontWeight','b');
%     ylabel('Probability (Log-Log)','FontSize',labelfontsize,'FontWeight','b'); 
%     set(gca,'FontSize',axesfontsize); hold off;
    
%     subplot(3,4,10); box on; 
%     loglog([controlanalysis.bifurcation.pathlength.pathlength],[controlanalysis.bifurcation.pathlength.bifurcationprobability.volume],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
%     hold on;
%     loglog([controlanalysis.termination.pathlength.pathlength],[controlanalysis.termination.pathlength.terminationprobability.volume],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);    
%     loglog([testanalysis.bifurcation.pathlength.pathlength],[testanalysis.bifurcation.pathlength.bifurcationprobability.volume],'sy','MarkerFaceColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
%     loglog([testanalysis.termination.pathlength.pathlength],[testanalysis.termination.pathlength.terminationprobability.volume],'dm','MarkerFaceColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);    
%     xlabel('Path Length','FontSize',labelfontsize,'FontWeight','b');
%     set(gca,'FontSize',axesfontsize); hold off;
    
%     subplot(3,4,11); box on; 
%     loglog([controlanalysis.bifurcation.branchlength.branchlength],[controlanalysis.bifurcation.branchlength.bifurcationprobability.volume],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
%     hold on;
%     loglog([controlanalysis.termination.branchlength.branchlength],[controlanalysis.termination.branchlength.terminationprobability.volume],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);    
%     loglog([testanalysis.bifurcation.branchlength.branchlength],[testanalysis.bifurcation.branchlength.bifurcationprobability.volume],'sy','MarkerFaceColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
%     loglog([testanalysis.termination.branchlength.branchlength],[testanalysis.termination.branchlength.terminationprobability.volume],'dm','MarkerFaceColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);    
%     xlabel('Branch Length','FontSize',labelfontsize,'FontWeight','b');
%     set(gca,'FontSize',axesfontsize); hold off;
	
% 	subplot(3,4,12); box on; 
%     loglog([controlanalysis.bifurcation.branchorder.branchorder],[controlanalysis.bifurcation.branchorder.bifurcationprobability.volume],'sg','MarkerFaceColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
%     hold on;
%     loglog([controlanalysis.termination.branchorder.branchorder],[controlanalysis.termination.branchorder.terminationprobability.volume],'dr','MarkerFaceColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);    
%     loglog([testanalysis.bifurcation.branchorder.branchorder],[testanalysis.bifurcation.branchorder.bifurcationprobability.volume],'sy','MarkerFaceColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
%     loglog([testanalysis.termination.branchorder.branchorder],[testanalysis.termination.branchorder.terminationprobability.volume],'dm','MarkerFaceColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);    
%     xlabel('Branch Order','FontSize',labelfontsize,'FontWeight','b');
%     set(gca,'FontSize',axesfontsize); hold off;
    
    

%     subplotspace('horizontal',-5);
%     subplotspace('vertical',-15);

%     [ax,h3]=suplabel('Bifurcation / Termination Probabilities by Volume'  ,'t');
%     set(h3,'FontSize',titlefontsize);


%     currentdirectory = cd;
%     cd(controlanalysis.datapathname);
%     cd ..

%     if exist(sprintf('%s_%s_comparison',controlanalysis.inputfilename,testanalysis.inputfilename),'dir')==7;
%         cd(sprintf('%s_%s_comparison',controlanalysis.inputfilename,testanalysis.inputfilename));
%     else
%         mkdir(sprintf('%s_%s_comparison',controlanalysis.inputfilename,testanalysis.inputfilename));
%         cd(sprintf('%s_%s_comparison',controlanalysis.inputfilename,testanalysis.inputfilename));
%     end

%     if exist('comparisonfigures','dir')==7
%         cd('comparisonfigures');
%     else
%         mkdir('comparisonfigures');
%         cd('comparisonfigures');
%     end

%     %%fillscreen;
    
%     legend(legendhandle,[controlanalysis.inputfilename ' #Bifs'],[controlanalysis.inputfilename ' #Terms'],[controlanalysis.inputfilename ' Bif Length'],[controlanalysis.inputfilename ' Term Length'],[testanalysis.inputfilename ' #Bifs'],[testanalysis.inputfilename ' #Terms'],[testanalysis.inputfilename ' Bif Length'],[testanalysis.inputfilename ' Term Length']);

%     filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'403_Bif_Term_Prob_Volume');
%     print('-djpeg',filename);
%     %saveas(gcf,filename,'fig');

% end
 
 
 
 
 
 
 
 
 
 