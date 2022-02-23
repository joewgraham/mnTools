function branchbiftermprobfigure(controlanalysis,testanalysis)
% Branch type probability figures

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
versuses{3} = 'radialdistance';
versuses{4} = 'branchorder';

versusestitles{1} = 'Diameter';
versusestitles{2} = 'Path Length';
versusestitles{3} = 'Radial Distance';
versusestitles{4} = 'Branch Order';

for piecetype = 2:4
    
    if isfield(controlanalysis,piecetypes{piecetype})
        
        currentpiecetype = piecetypes{piecetype};
        currentpiecetitle = piecetitles{piecetype};
        eval(['controltype = controlanalysis.' currentpiecetype ';']);
        if nargin > 1
            eval(['testtype = testanalysis.' currentpiecetype ';']);
        end
        
        for versus = 1:3 %4
            
            currentversus = versuses{versus};
            currentversustitle = versusestitles{versus};
            
            eval(['x1 = [controltype.' currentversus '.' currentversus ']'';']);
            eval(['b1 = [controltype.' currentversus '.numberbifurcatingbranches.mean]'';']);
            eval(['t1 = [controltype.' currentversus '.numberterminatingbranches.mean]'';']);
            n1 = b1 + t1;
            b1param = glmfit(x1,[b1 n1],'binomial','link','logit');
            t1param = glmfit(x1,[t1 n1],'binomial','link','logit');
            b1fit = glmval(b1param,x1,'logit','size',n1);
            t1fit = glmval(t1param,x1,'logit','size',n1);
            if nargin == 2
                eval(['x2 = [testtype.' currentversus '.' currentversus ']'';']);
                eval(['b2 = [testtype.' currentversus '.numberbifurcatingbranches.mean]'';']);
                eval(['t2 = [testtype.' currentversus '.numberterminatingbranches.mean]'';']);
                n2 = b2 + t2;
                b2param = glmfit(x2,[b2 n2],'binomial','link','logit');
                t2param = glmfit(x2,[t2 n2],'binomial','link','logit');
                b2fit = glmval(b2param,x2,'logit','size',n2);
                t2fit = glmval(t2param,x2,'logit','size',n2);
            end
            
            figure;
            
            subplot(2,1,1);
            legendhandle1 = gca;
            hold on;
            ylabel('Number of Segments','FontSize',labelfontsize,'FontWeight','b');
            if nargin == 1
                plot(x1,n1,'b','LineWidth',2);
                plot(x1,b1,'sg','MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
                plot(x1,t1,'dr','MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
            else
                plot(x1,n1,'b','LineWidth',2);
                plot(x1,b1,'sg','MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
                plot(x1,t1,'dr','MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
                plot(x2,n2,'c','LineWidth',1.5);
                plot(x2,b2,'sy','MarkerEdgeColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
                plot(x2,t2,'dm','MarkerEdgeColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
            end
            set(gca,'FontSize',axesfontsize);
            hold off;
            
            subplot(2,1,2);
            legendhandle2 = gca;
            hold on;
            ylabel('Probability','FontSize',labelfontsize,'FontWeight','b');
            xlabel(['Proximal ' currentversustitle ' (\mum)'],'FontSize',labelfontsize,'FontWeight','b');
            if nargin == 1
                plot(x1,b1./n1,'sg','MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
                plot(x1,t1./n1,'dr','MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
                plot(x1,b1fit./n1,'-g','LineWidth',2);
                plot(x1,t1fit./n1,'-r','LineWidth',2);
                legend(legendhandle1,[controlanalysis.inputfilename ' Total'],[controlanalysis.inputfilename ' Bifs'],[controlanalysis.inputfilename ' Terms'],'Location','NorthEast');
                legend(legendhandle2,[controlanalysis.inputfilename ' Bif Prob'],[controlanalysis.inputfilename ' Term Prob'],[controlanalysis.inputfilename ' Bif Prob Fit'],[controlanalysis.inputfilename ' Term Prob Fit'],'Location','NorthEast');
            else
                plot(x1,b1./n1,'sg','MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
                plot(x1,t1./n1,'dr','MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
                plot(x1,b1fit./n1,'-g','LineWidth',2);
                plot(x1,t1fit./n1,'-r','LineWidth',2);
                plot(x2,b2./n2,'sy','MarkerEdgeColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
                plot(x2,t2./n2,'dm','MarkerEdgeColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
                plot(x2,b2fit./n2,'-y','LineWidth',2);
                plot(x2,t2fit./n2,'-m','LineWidth',2);
                legend(legendhandle1,[controlanalysis.inputfilename ' Total'],[controlanalysis.inputfilename ' Bifs'],[controlanalysis.inputfilename ' Terms'],[testanalysis.inputfilename ' Total'],[testanalysis.inputfilename ' Bifs'],[testanalysis.inputfilename ' Terms'],'Location','NorthEast');
                legend(legendhandle2,[controlanalysis.inputfilename ' Bif Prob'],[controlanalysis.inputfilename ' Term Prob'],[controlanalysis.inputfilename ' Bif Prob Fit'],[controlanalysis.inputfilename ' Term Prob Fit'],[testanalysis.inputfilename ' Bif Prob'],[testanalysis.inputfilename ' Term Prob'],[testanalysis.inputfilename ' Bif Prob Fit'],[testanalysis.inputfilename ' Term Prob Fit'],'Location','NorthEast');
            end
            set(gca,'FontSize',axesfontsize);
            hold off;

            subplotspace('vertical',-15);
            [ax,h3]=suplabel([currentpiecetitle ' Branch Bifurcation / Termination Probability vs ' currentversustitle],'t');
            set(h3,'FontSize',titlefontsize);

            currentdirectory = cd;
            cd(controlanalysis.datapathname);

            if nargin == 1
                if exist('figures','dir') ~= 7
                    mkdir('figures');
                end
                cd('figures');
                filename = sprintf('%s_%s_401_Branch_Bif_Term_Prob_%s',controlanalysis.inputfilename,currentpiecetype, currentversus);
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
            
                filename = sprintf('%s_%s_%s_401_Branch_Bif_Term_Prob_%s',controlanalysis.inputfilename,testanalysis.inputfilename,currentpiecetype,currentversus);
            end

            print('-djpeg',filename);
            if strcmp(option.mnfigures.matfig,'y')
                saveas(gcf,filename,'fig');
            end
            
            cd(currentdirectory);

            
        end
    end
end



        



% if nargin == 1

%     x = [controlanalysis.diameter.diameter]';
%     y1 = [controlanalysis.diameter.numberterminatingbranches.total]';
%     y2 = [controlanalysis.diameter.numberbifurcatingbranches.total]';
%     n = ([controlanalysis.diameter.numberbifurcatingbranches.total] + [controlanalysis.diameter.numberterminatingbranches.total])';

%     b1 = glmfit(x,[y1 n],'binomial','link','logit');
%     y1fit = glmval(b1,x,'logit','size',n);

%     b2 = glmfit(x,[y2 n],'binomial','link','logit');
%     y2fit = glmval(b2,x,'logit','size',n);

%     figure;

%         subplot(2,1,1);
%             plot(x,(y2 + y1),'LineWidth',2);
%             hold on;
%             plot(x,y2,'sg','MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
%             plot(x,y1,'dr','MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);

%             ylabel('Number of Segments','FontSize',labelfontsize,'FontWeight','b');
%             legendhandle1 = gca;
%             set(gca,'FontSize',axesfontsize);hold off;

%         subplot(2,1,2);
%             total = y2 + y1;
%             plot(x,y2./total,'sg','MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
%             hold on;
%             plot(x,y1./total,'dr','MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
%             plot(x,y2fit./n,'-g','LineWidth',2);
%             plot(x,y1fit./n,'-r','LineWidth',2);

%             ylabel('Probability','FontSize',labelfontsize,'FontWeight','b');
%             xlabel('Proximal Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
%             legendhandle2 = gca;
%             set(gca,'FontSize',axesfontsize);hold off;


%         %subplotspace('horizontal',-20);
%         subplotspace('vertical',-15);

%         [ax,h3]=suplabel('Branch Bifurcation / Termination Probability vs Diameter'  ,'t');
%         set(h3,'FontSize',titlefontsize);

%         currentdirectory = cd;
%         cd(controlanalysis.datapathname);

%         if exist('figures','dir')==7
%             cd('figures');
%         else
%             mkdir('figures');
%             cd('figures');
%         end

%         %fillscreen;

%         legend(legendhandle1,[controlanalysis.inputfilename ' Total'],[controlanalysis.inputfilename ' Bifs'],[controlanalysis.inputfilename ' Terms'],'Location','NorthEast');
%         legend(legendhandle2,[controlanalysis.inputfilename ' Bif Prob'],[controlanalysis.inputfilename ' Term Prob'],[controlanalysis.inputfilename ' Bif Prob Fit'],[controlanalysis.inputfilename ' Term Prob Fit'],'Location','NorthEast');


%         filename = sprintf('%s_%s',controlanalysis.inputfilename,'401_Branch_Bif_Term_Prob_Diam');
%         print('-djpeg',filename);
%         %saveas(gcf,filename,'fig');        





%     figure;

%         subplot(2,1,1);
%             semilogx(x,(y2 + y1),'LineWidth',2);
%             hold on;
%             semilogx(x,y2,'sg','MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
%             semilogx(x,y1,'dr','MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);

%             ylabel('Number of Segments','FontSize',labelfontsize,'FontWeight','b');
%             legendhandle1 = gca;
%             set(gca,'FontSize',axesfontsize);hold off;

%         subplot(2,1,2);
%             total = y2 + y1;
%             semilogx(x,y2./total,'sg','MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
%             hold on;
%             semilogx(x,y1./total,'dr','MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
%             semilogx(x,y2fit./n,'-g','LineWidth',2);
%             semilogx(x,y1fit./n,'-r','LineWidth',2);

%             ylabel('Probability','FontSize',labelfontsize,'FontWeight','b');
%             xlabel('Proximal Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
%             legendhandle2 = gca;
%             set(gca,'FontSize',axesfontsize);hold off;




%         %subplotspace('horizontal',-20);
%         subplotspace('vertical',-15);

%         [ax,h3]=suplabel('Branch Bifurcation / Termination Probability vs Diameter (Semi-Log)'  ,'t');
%         set(h3,'FontSize',titlefontsize);

%         currentdirectory = cd;
%         cd(controlanalysis.datapathname);

%         if exist('figures','dir')==7
%             cd('figures');
%         else
%             mkdir('figures');
%             cd('figures');
%         end

%         %fillscreen;

%         legend(legendhandle1,[controlanalysis.inputfilename ' Total'],[controlanalysis.inputfilename ' Bifs'],[controlanalysis.inputfilename ' Terms'],'Location','NorthEast');
%         legend(legendhandle2,[controlanalysis.inputfilename ' Bif Prob'],[controlanalysis.inputfilename ' Term Prob'],[controlanalysis.inputfilename ' Bif Prob Fit'],[controlanalysis.inputfilename ' Term Prob Fit'],'Location','NorthEast');


%         filename = sprintf('%s_%s',controlanalysis.inputfilename,'401_Branch_Bif_Term_Prob_Diam_SemiLog');
%         print('-djpeg',filename);
%         %saveas(gcf,filename,'fig');        
    
	
	
	
	
	
	
	
	
% 	x = [controlanalysis.pathlength.pathlength]';
%     y1 = [controlanalysis.pathlength.numberterminatingbranches.total]';
%     y2 = [controlanalysis.pathlength.numberbifurcatingbranches.total]';
%     n = ([controlanalysis.pathlength.numberbifurcatingbranches.total] + [controlanalysis.pathlength.numberterminatingbranches.total])';

%     b1 = glmfit(x,[y1 n],'binomial','link','logit');
%     y1fit = glmval(b1,x,'logit','size',n);

%     b2 = glmfit(x,[y2 n],'binomial','link','logit');
%     y2fit = glmval(b2,x,'logit','size',n);

%     figure;

%         subplot(2,1,1);
%             plot(x,(y2 + y1),'LineWidth',2);
%             hold on;
%             plot(x,y2,'sg','MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
%             plot(x,y1,'dr','MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);

%             ylabel('Number of Segments','FontSize',labelfontsize,'FontWeight','b');
%             legendhandle1 = gca;
%             set(gca,'FontSize',axesfontsize);hold off;

%         subplot(2,1,2);
%             total = y2 + y1;
%             plot(x,y2./total,'sg','MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
%             hold on;
%             plot(x,y1./total,'dr','MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
%             plot(x,y2fit./n,'-g','LineWidth',2);
%             plot(x,y1fit./n,'-r','LineWidth',2);

%             ylabel('Probability','FontSize',labelfontsize,'FontWeight','b');
%             xlabel('Proximal Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
%             legendhandle2 = gca;
%             set(gca,'FontSize',axesfontsize);hold off;


%         %subplotspace('horizontal',-20);
%         subplotspace('vertical',-15);

%         [ax,h3]=suplabel('Branch Bifurcation / Termination Probability vs Path Length'  ,'t');
%         set(h3,'FontSize',titlefontsize);

%         currentdirectory = cd;
%         cd(controlanalysis.datapathname);

%         if exist('figures','dir')==7
%             cd('figures');
%         else
%             mkdir('figures');
%             cd('figures');
%         end

%         %fillscreen;

%         legend(legendhandle1,[controlanalysis.inputfilename ' Total'],[controlanalysis.inputfilename ' Bifs'],[controlanalysis.inputfilename ' Terms'],'Location','NorthEast');
%         legend(legendhandle2,[controlanalysis.inputfilename ' Bif Prob'],[controlanalysis.inputfilename ' Term Prob'],[controlanalysis.inputfilename ' Bif Prob Fit'],[controlanalysis.inputfilename ' Term Prob Fit'],'Location','NorthEast');


%         filename = sprintf('%s_%s',controlanalysis.inputfilename,'401_Branch_Bif_Term_Prob_Path');
%         print('-djpeg',filename);
%         %saveas(gcf,filename,'fig');        





%     figure;

%         subplot(2,1,1);
%             semilogx(x,(y2 + y1),'LineWidth',2);
%             hold on;
%             semilogx(x,y2,'sg','MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
%             semilogx(x,y1,'dr','MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);

%             ylabel('Number of Segments','FontSize',labelfontsize,'FontWeight','b');
%             legendhandle1 = gca;
%             set(gca,'FontSize',axesfontsize);hold off;

%         subplot(2,1,2);
%             total = y2 + y1;
%             semilogx(x,y2./total,'sg','MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
%             hold on;
%             semilogx(x,y1./total,'dr','MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
%             semilogx(x,y2fit./n,'-g','LineWidth',2);
%             semilogx(x,y1fit./n,'-r','LineWidth',2);

%             ylabel('Probability','FontSize',labelfontsize,'FontWeight','b');
%             xlabel('Proximal Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
%             legendhandle2 = gca;
%             set(gca,'FontSize',axesfontsize);hold off;




%         %subplotspace('horizontal',-20);
%         subplotspace('vertical',-15);

%         [ax,h3]=suplabel('Branch Bifurcation / Termination Probability vs Path Length (Semi-Log)'  ,'t');
%         set(h3,'FontSize',titlefontsize);

%         currentdirectory = cd;
%         cd(controlanalysis.datapathname);

%         if exist('figures','dir')==7
%             cd('figures');
%         else
%             mkdir('figures');
%             cd('figures');
%         end

%         %fillscreen;

%         legend(legendhandle1,[controlanalysis.inputfilename ' Total'],[controlanalysis.inputfilename ' Bifs'],[controlanalysis.inputfilename ' Terms'],'Location','NorthEast');
%         legend(legendhandle2,[controlanalysis.inputfilename ' Bif Prob'],[controlanalysis.inputfilename ' Term Prob'],[controlanalysis.inputfilename ' Bif Prob Fit'],[controlanalysis.inputfilename ' Term Prob Fit'],'Location','NorthEast');


%         filename = sprintf('%s_%s',controlanalysis.inputfilename,'401_Branch_Bif_Term_Prob_Path_SemiLog');
%         print('-djpeg',filename);
%         %saveas(gcf,filename,'fig'); 
	
	
	
	
	
	
	
	
	
	
% end



% if nargin == 2

%     x = [controlanalysis.diameter.diameter]';
%     y1 = [controlanalysis.diameter.numberterminatingbranches.total]';
%     y2 = [controlanalysis.diameter.numberbifurcatingbranches.total]';
%     n = ([controlanalysis.diameter.numberbifurcatingbranches.total] + [controlanalysis.diameter.numberterminatingbranches.total])';

%     b1 = glmfit(x,[y1 n],'binomial','link','logit');
%     y1fit = glmval(b1,x,'logit','size',n);

%     b2 = glmfit(x,[y2 n],'binomial','link','logit');
%     y2fit = glmval(b2,x,'logit','size',n);
    
%     x2 = [testanalysis.diameter.diameter]';
%     y12 = [testanalysis.diameter.numberterminatingbranches.total]';
%     y22 = [testanalysis.diameter.numberbifurcatingbranches.total]';
%     n2 = ([testanalysis.diameter.numberbifurcatingbranches.total] + [testanalysis.diameter.numberterminatingbranches.total])';

%     b12 = glmfit(x2,[y12 n2],'binomial','link','logit');
%     y12fit = glmval(b12,x2,'logit','size',n2);

%     b22 = glmfit(x2,[y22 n2],'binomial','link','logit');
%     y22fit = glmval(b22,x2,'logit','size',n2);

%     figure;

%         subplot(2,1,1);
%             plot(x,(y2 + y1),'b','LineWidth',2);
%             hold on;
%             plot(x,y2,'sg','MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
%             plot(x,y1,'dr','MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
            
%             plot(x2,(y22 + y12),'c','LineWidth',2);
%             plot(x2,y22,'sy','MarkerEdgeColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
%             plot(x2,y12,'dm','MarkerEdgeColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
            
%             ylabel('Number of Segments','FontSize',labelfontsize,'FontWeight','b');
%             legendhandle1 = gca;
%             set(gca,'FontSize',axesfontsize);hold off;

%         subplot(2,1,2);
%             total = y2 + y1;
%             plot(x,y2./total,'sg','MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
%             hold on;
%             plot(x,y1./total,'dr','MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
%             plot(x,y2fit./n,'-g','LineWidth',2);
%             plot(x,y1fit./n,'-r','LineWidth',2);
            
%             total2 = y22 + y12;
%             plot(x2,y22./total2,'sy','MarkerEdgeColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
%             plot(x2,y12./total2,'dm','MarkerEdgeColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
%             plot(x2,y22fit./n2,'-y','LineWidth',2);
%             plot(x2,y12fit./n2,'-m','LineWidth',2);

%             ylabel('Probability','FontSize',labelfontsize,'FontWeight','b');
%             xlabel('Proximal Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
%             legendhandle2 = gca;
%             set(gca,'FontSize',axesfontsize);hold off;



%         %subplotspace('horizontal',-20);
%         subplotspace('vertical',-15);

%         [ax,h3]=suplabel('Branch Bifurcation / Termination Probability vs Diameter'  ,'t');
%         set(h3,'FontSize',titlefontsize);

%         currentdirectory = cd;
%         cd(controlanalysis.datapathname);
%         cd ..

%         if exist(sprintf('%s_%s_comparison',controlanalysis.inputfilename,testanalysis.inputfilename),'dir')==7;
%             cd(sprintf('%s_%s_comparison',controlanalysis.inputfilename,testanalysis.inputfilename));
%         else
%             mkdir(sprintf('%s_%s_comparison',controlanalysis.inputfilename,testanalysis.inputfilename));
%             cd(sprintf('%s_%s_comparison',controlanalysis.inputfilename,testanalysis.inputfilename));
%         end

%         if exist('comparisonfigures','dir')==7
%             cd('comparisonfigures');
%         else
%             mkdir('comparisonfigures');
%             cd('comparisonfigures');
%         end

%         %fillscreen;

%         legend(legendhandle1,[controlanalysis.inputfilename ' Total'],[controlanalysis.inputfilename ' Bifs'],[controlanalysis.inputfilename ' Terms'],[testanalysis.inputfilename ' Total'],[testanalysis.inputfilename ' Bifs'],[testanalysis.inputfilename ' Terms'],'Location','NorthEast');
%         legend(legendhandle2,[controlanalysis.inputfilename ' Bif Prob'],[controlanalysis.inputfilename ' Term Prob'],[controlanalysis.inputfilename ' Bif Prob Fit'],[controlanalysis.inputfilename ' Term Prob Fit'],[testanalysis.inputfilename ' Bif Prob'],[testanalysis.inputfilename ' Term Prob'],[testanalysis.inputfilename ' Bif Prob Fit'],[testanalysis.inputfilename ' Term Prob Fit'],'Location','NorthEast');


%         filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'401_Branch_Bif_Term_Prob_Diam');
%         print('-djpeg',filename);
%         %saveas(gcf,filename,'fig');        





%     figure;

%         subplot(2,1,1);
%             semilogx(x,(y2 + y1),'b','LineWidth',2);
%             hold on;
%             semilogx(x,y2,'sg','MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
%             semilogx(x,y1,'dr','MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
            
%             semilogx(x2,(y22 + y12),'c','LineWidth',2);
%             semilogx(x2,y22,'sy','MarkerEdgeColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
%             semilogx(x2,y12,'dm','MarkerEdgeColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
            
%             ylabel('Number of Segments','FontSize',labelfontsize,'FontWeight','b');
%             legendhandle1 = gca;
%             set(gca,'FontSize',axesfontsize);hold off;

%         subplot(2,1,2);
%             total = y2 + y1;
%             semilogx(x,y2./total,'sg','MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
%             hold on;
%             semilogx(x,y1./total,'dr','MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
%             semilogx(x,y2fit./n,'-g','LineWidth',2);
%             semilogx(x,y1fit./n,'-r','LineWidth',2);
            
%             total2 = y22 + y12;
%             semilogx(x2,y22./total2,'sy','MarkerEdgeColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
%             semilogx(x2,y12./total2,'dm','MarkerEdgeColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
%             semilogx(x2,y22fit./n2,'-y','LineWidth',2);
%             semilogx(x2,y12fit./n2,'-m','LineWidth',2);

%             ylabel('Probability','FontSize',labelfontsize,'FontWeight','b');
%             xlabel('Proximal Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
%             legendhandle2 = gca;
%             set(gca,'FontSize',axesfontsize);hold off;




%         %subplotspace('horizontal',-20);
%         subplotspace('vertical',-15);

%         [ax,h3]=suplabel('Branch Bifurcation / Termination Probability vs Diameter (Semi-Log)'  ,'t');
%         set(h3,'FontSize',titlefontsize);

%         currentdirectory = cd;
%         cd(controlanalysis.datapathname);
%         cd ..

%         if exist(sprintf('%s_%s_comparison',controlanalysis.inputfilename,testanalysis.inputfilename),'dir')==7;
%             cd(sprintf('%s_%s_comparison',controlanalysis.inputfilename,testanalysis.inputfilename));
%         else
%             mkdir(sprintf('%s_%s_comparison',controlanalysis.inputfilename,testanalysis.inputfilename));
%             cd(sprintf('%s_%s_comparison',controlanalysis.inputfilename,testanalysis.inputfilename));
%         end

%         if exist('comparisonfigures','dir')==7
%             cd('comparisonfigures');
%         else
%             mkdir('comparisonfigures');
%             cd('comparisonfigures');
%         end

%         %fillscreen;

%         legend(legendhandle1,[controlanalysis.inputfilename ' Total'],[controlanalysis.inputfilename ' Bifs'],[controlanalysis.inputfilename ' Terms'],'Location','NorthEast');
%         legend(legendhandle2,[controlanalysis.inputfilename ' Bif Prob'],[controlanalysis.inputfilename ' Term Prob'],[controlanalysis.inputfilename ' Bif Prob Fit'],[controlanalysis.inputfilename ' Term Prob Fit'],'Location','NorthEast');


%         filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'401_Branch_Bif_Term_Prob_Diam_SemiLog');
%         print('-djpeg',filename);
%         %saveas(gcf,filename,'fig');   









%     x = [controlanalysis.pathlength.pathlength]';
%     y1 = [controlanalysis.pathlength.numberterminatingbranches.total]';
%     y2 = [controlanalysis.pathlength.numberbifurcatingbranches.total]';
%     n = ([controlanalysis.pathlength.numberbifurcatingbranches.total] + [controlanalysis.pathlength.numberterminatingbranches.total])';

%     b1 = glmfit(x,[y1 n],'binomial','link','logit');
%     y1fit = glmval(b1,x,'logit','size',n);

%     b2 = glmfit(x,[y2 n],'binomial','link','logit');
%     y2fit = glmval(b2,x,'logit','size',n);
    
%     x2 = [testanalysis.pathlength.pathlength]';
%     y12 = [testanalysis.pathlength.numberterminatingbranches.total]';
%     y22 = [testanalysis.pathlength.numberbifurcatingbranches.total]';
%     n2 = ([testanalysis.pathlength.numberbifurcatingbranches.total] + [testanalysis.pathlength.numberterminatingbranches.total])';

%     b12 = glmfit(x2,[y12 n2],'binomial','link','logit');
%     y12fit = glmval(b12,x2,'logit','size',n2);

%     b22 = glmfit(x2,[y22 n2],'binomial','link','logit');
%     y22fit = glmval(b22,x2,'logit','size',n2);

%     figure;

%         subplot(2,1,1);
%             plot(x,(y2 + y1),'b','LineWidth',2);
%             hold on;
%             plot(x,y2,'sg','MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
%             plot(x,y1,'dr','MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
            
%             plot(x2,(y22 + y12),'c','LineWidth',2);
%             plot(x2,y22,'sy','MarkerEdgeColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
%             plot(x2,y12,'dm','MarkerEdgeColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
            
%             ylabel('Number of Segments','FontSize',labelfontsize,'FontWeight','b');
%             legendhandle1 = gca;
%             set(gca,'FontSize',axesfontsize);hold off;

%         subplot(2,1,2);
%             total = y2 + y1;
%             plot(x,y2./total,'sg','MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
%             hold on;
%             plot(x,y1./total,'dr','MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
%             plot(x,y2fit./n,'-g','LineWidth',2);
%             plot(x,y1fit./n,'-r','LineWidth',2);
            
%             total2 = y22 + y12;
%             plot(x2,y22./total2,'sy','MarkerEdgeColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
%             plot(x2,y12./total2,'dm','MarkerEdgeColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
%             plot(x2,y22fit./n2,'-y','LineWidth',2);
%             plot(x2,y12fit./n2,'-m','LineWidth',2);

%             ylabel('Probability','FontSize',labelfontsize,'FontWeight','b');
%             xlabel('Proximal Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
%             legendhandle2 = gca;
%             set(gca,'FontSize',axesfontsize);hold off;



%         %subplotspace('horizontal',-20);
%         subplotspace('vertical',-15);

%         [ax,h3]=suplabel('Branch Bifurcation / Termination Probability vs Path Length'  ,'t');
%         set(h3,'FontSize',titlefontsize);

%         currentdirectory = cd;
%         cd(controlanalysis.datapathname);
%         cd ..

%         if exist(sprintf('%s_%s_comparison',controlanalysis.inputfilename,testanalysis.inputfilename),'dir')==7;
%             cd(sprintf('%s_%s_comparison',controlanalysis.inputfilename,testanalysis.inputfilename));
%         else
%             mkdir(sprintf('%s_%s_comparison',controlanalysis.inputfilename,testanalysis.inputfilename));
%             cd(sprintf('%s_%s_comparison',controlanalysis.inputfilename,testanalysis.inputfilename));
%         end

%         if exist('comparisonfigures','dir')==7
%             cd('comparisonfigures');
%         else
%             mkdir('comparisonfigures');
%             cd('comparisonfigures');
%         end

%         %fillscreen;

%         legend(legendhandle1,[controlanalysis.inputfilename ' Total'],[controlanalysis.inputfilename ' Bifs'],[controlanalysis.inputfilename ' Terms'],[testanalysis.inputfilename ' Total'],[testanalysis.inputfilename ' Bifs'],[testanalysis.inputfilename ' Terms'],'Location','NorthEast');
%         legend(legendhandle2,[controlanalysis.inputfilename ' Bif Prob'],[controlanalysis.inputfilename ' Term Prob'],[controlanalysis.inputfilename ' Bif Prob Fit'],[controlanalysis.inputfilename ' Term Prob Fit'],[testanalysis.inputfilename ' Bif Prob'],[testanalysis.inputfilename ' Term Prob'],[testanalysis.inputfilename ' Bif Prob Fit'],[testanalysis.inputfilename ' Term Prob Fit'],'Location','NorthEast');


%         filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'401_Branch_Bif_Term_Prob_Path');
%         print('-djpeg',filename);
%         %saveas(gcf,filename,'fig');        





%     figure;

%         subplot(2,1,1);
%             semilogx(x,(y2 + y1),'b','LineWidth',2);
%             hold on;
%             semilogx(x,y2,'sg','MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
%             semilogx(x,y1,'dr','MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
            
%             semilogx(x2,(y22 + y12),'c','LineWidth',2);
%             semilogx(x2,y22,'sy','MarkerEdgeColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
%             semilogx(x2,y12,'dm','MarkerEdgeColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
            
%             ylabel('Number of Segments','FontSize',labelfontsize,'FontWeight','b');
%             legendhandle1 = gca;
%             set(gca,'FontSize',axesfontsize);hold off;

%         subplot(2,1,2);
%             total = y2 + y1;
%             semilogx(x,y2./total,'sg','MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
%             hold on;
%             semilogx(x,y1./total,'dr','MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
%             semilogx(x,y2fit./n,'-g','LineWidth',2);
%             semilogx(x,y1fit./n,'-r','LineWidth',2);
            
%             total2 = y22 + y12;
%             semilogx(x2,y22./total2,'sy','MarkerEdgeColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
%             semilogx(x2,y12./total2,'dm','MarkerEdgeColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
%             semilogx(x2,y22fit./n2,'-y','LineWidth',2);
%             semilogx(x2,y12fit./n2,'-m','LineWidth',2);

%             ylabel('Probability','FontSize',labelfontsize,'FontWeight','b');
%             xlabel('Proximal Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
%             legendhandle2 = gca;
%             set(gca,'FontSize',axesfontsize);hold off;




%         %subplotspace('horizontal',-20);
%         subplotspace('vertical',-15);

%         [ax,h3]=suplabel('Branch Bifurcation / Termination Probability vs Path Length (Semi-Log)'  ,'t');
%         set(h3,'FontSize',titlefontsize);

%         currentdirectory = cd;
%         cd(controlanalysis.datapathname);
%         cd ..

%         if exist(sprintf('%s_%s_comparison',controlanalysis.inputfilename,testanalysis.inputfilename),'dir')==7;
%             cd(sprintf('%s_%s_comparison',controlanalysis.inputfilename,testanalysis.inputfilename));
%         else
%             mkdir(sprintf('%s_%s_comparison',controlanalysis.inputfilename,testanalysis.inputfilename));
%             cd(sprintf('%s_%s_comparison',controlanalysis.inputfilename,testanalysis.inputfilename));
%         end

%         if exist('comparisonfigures','dir')==7
%             cd('comparisonfigures');
%         else
%             mkdir('comparisonfigures');
%             cd('comparisonfigures');
%         end

%         %fillscreen;

%         legend(legendhandle1,[controlanalysis.inputfilename ' Total'],[controlanalysis.inputfilename ' Bifs'],[controlanalysis.inputfilename ' Terms'],'Location','NorthEast');
%         legend(legendhandle2,[controlanalysis.inputfilename ' Bif Prob'],[controlanalysis.inputfilename ' Term Prob'],[controlanalysis.inputfilename ' Bif Prob Fit'],[controlanalysis.inputfilename ' Term Prob Fit'],'Location','NorthEast');


%         filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'401_Branch_Bif_Term_Prob_Path_SemiLog');
%         print('-djpeg',filename);
%         %saveas(gcf,filename,'fig');   









		
    
% end
