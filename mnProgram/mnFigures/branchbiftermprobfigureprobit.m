function branchbiftermprobfigureprobit(controlanalysis,testanalysis)

titlefontsize = 14;
labelfontsize = 7;
axesfontsize  = 5;
insetfontsize = 5;


indbluemarkersize  = 7;
indgreenmarkersize = 3;
indredmarkersize   = 5;

bluemarkersize    = 10;
greenmarkersize   = 6;
redmarkersize     = 8;
cyanmarkersize    = 8;
yellowmarkersize  = 4;
magentamarkersize = 6;



if nargin == 1

    x = [controlanalysis.diameter.diameter]';
    y1 = [controlanalysis.diameter.numberterminations.total]';
    y2 = [controlanalysis.diameter.numberbifurcations.total]';
    n = ([controlanalysis.diameter.numberbifurcations.total] + [controlanalysis.diameter.numberterminations.total])';

    b1 = glmfit(x,[y1 n],'binomial','link','probit');
    y1fit = glmval(b1,x,'probit','size',n);

    b2 = glmfit(x,[y2 n],'binomial','link','probit');
    y2fit = glmval(b2,x,'probit','size',n);

    figure;

        subplot(2,1,1);
            plot(x,(y2 + y1),'LineWidth',2);
            hold on;
            plot(x,y2,'sg','MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
            plot(x,y1,'dr','MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);

            ylabel('Number of Segments','FontSize',labelfontsize,'FontWeight','b');
            legendhandle1 = gca;
            set(gca,'FontSize',axesfontsize);hold off;

        subplot(2,1,2);
            total = y2 + y1;
            plot(x,y2./total,'sg','MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
            hold on;
            plot(x,y1./total,'dr','MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
            plot(x,y2fit./n,'-g','LineWidth',2);
            plot(x,y1fit./n,'-r','LineWidth',2);

            ylabel('Probability','FontSize',labelfontsize,'FontWeight','b');
            xlabel('Proximal Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
            legendhandle2 = gca;
            set(gca,'FontSize',axesfontsize);hold off;



        %subplotspace('horizontal',-20);
        subplotspace('vertical',-15);

        [ax,h3]=suplabel('Branch Bifurcation / Termination Probability Figure (Probit)'  ,'t');
        set(h3,'FontSize',titlefontsize);

        currentdirectory = cd;
        cd(controlanalysis.datapathname);

        if exist('figures','dir')==7
            cd('figures');
        else
            mkdir('figures');
            cd('figures');
        end

        fillscreen;

        legend(legendhandle1,[controlanalysis.inputfilename ' Total'],[controlanalysis.inputfilename ' Bifs'],[controlanalysis.inputfilename ' Terms'],'Location','NorthEast');
        legend(legendhandle2,[controlanalysis.inputfilename ' Bif Prob'],[controlanalysis.inputfilename ' Term Prob'],[controlanalysis.inputfilename ' Bif Prob Fit'],[controlanalysis.inputfilename ' Term Prob Fit'],'Location','NorthEast');


        filename = sprintf('%s_%s',controlanalysis.inputfilename,'401b_Branch_Bif_Term_Prob_Probit');
        print('-djpeg',filename);
        %saveas(gcf,filename,'fig');        





    figure;

        subplot(2,1,1);
            semilogx(x,(y2 + y1),'LineWidth',2);
            hold on;
            semilogx(x,y2,'sg','MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
            semilogx(x,y1,'dr','MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);

            ylabel('Number of Segments','FontSize',labelfontsize,'FontWeight','b');
            legendhandle1 = gca;
            set(gca,'FontSize',axesfontsize);hold off;

        subplot(2,1,2);
            total = y2 + y1;
            semilogx(x,y2./total,'sg','MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
            hold on;
            semilogx(x,y1./total,'dr','MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
            semilogx(x,y2fit./n,'-g','LineWidth',2);
            semilogx(x,y1fit./n,'-r','LineWidth',2);

            ylabel('Probability','FontSize',labelfontsize,'FontWeight','b');
            xlabel('Proximal Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
            legendhandle2 = gca;
            set(gca,'FontSize',axesfontsize);hold off;




        %subplotspace('horizontal',-20);
        subplotspace('vertical',-15);

        [ax,h3]=suplabel('Branch Bifurcation / Termination Probability Figure (Probit; Semi-Log)'  ,'t');
        set(h3,'FontSize',titlefontsize);

        currentdirectory = cd;
        cd(controlanalysis.datapathname);

        if exist('figures','dir')==7
            cd('figures');
        else
            mkdir('figures');
            cd('figures');
        end

        fillscreen;

        legend(legendhandle1,[controlanalysis.inputfilename ' Total'],[controlanalysis.inputfilename ' Bifs'],[controlanalysis.inputfilename ' Terms'],'Location','NorthEast');
        legend(legendhandle2,[controlanalysis.inputfilename ' Bif Prob'],[controlanalysis.inputfilename ' Term Prob'],[controlanalysis.inputfilename ' Bif Prob Fit'],[controlanalysis.inputfilename ' Term Prob Fit'],'Location','NorthEast');


        filename = sprintf('%s_%s',controlanalysis.inputfilename,'401b_Branch_Bif_Term_Prob_Probit_SemiLog');
        print('-djpeg',filename);
        %saveas(gcf,filename,'fig');        
    
end



if nargin == 2

    x = [controlanalysis.diameter.diameter]';
    y1 = [controlanalysis.diameter.numberterminations.total]';
    y2 = [controlanalysis.diameter.numberbifurcations.total]';
    n = ([controlanalysis.diameter.numberbifurcations.total] + [controlanalysis.diameter.numberterminations.total])';

    b1 = glmfit(x,[y1 n],'binomial','link','probit');
    y1fit = glmval(b1,x,'probit','size',n);

    b2 = glmfit(x,[y2 n],'binomial','link','probit');
    y2fit = glmval(b2,x,'probit','size',n);
    
    x2 = [testanalysis.diameter.diameter]';
    y12 = [testanalysis.diameter.numberterminations.total]';
    y22 = [testanalysis.diameter.numberbifurcations.total]';
    n2 = ([testanalysis.diameter.numberbifurcations.total] + [testanalysis.diameter.numberterminations.total])';

    b12 = glmfit(x2,[y12 n2],'binomial','link','probit');
    y12fit = glmval(b12,x2,'probit','size',n2);

    b22 = glmfit(x2,[y22 n2],'binomial','link','probit');
    y22fit = glmval(b22,x2,'probit','size',n2);

    figure;

        subplot(2,1,1);
            plot(x,(y2 + y1),'b','LineWidth',2);
            hold on;
            plot(x,y2,'sg','MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
            plot(x,y1,'dr','MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
            
            plot(x2,(y22 + y12),'c','LineWidth',2);
            plot(x2,y22,'sy','MarkerEdgeColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
            plot(x2,y12,'dm','MarkerEdgeColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
            
            ylabel('Number of Segments','FontSize',labelfontsize,'FontWeight','b');
            legendhandle1 = gca;
            set(gca,'FontSize',axesfontsize);hold off;

        subplot(2,1,2);
            total = y2 + y1;
            plot(x,y2./total,'sg','MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
            hold on;
            plot(x,y1./total,'dr','MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
            plot(x,y2fit./n,'-g','LineWidth',2);
            plot(x,y1fit./n,'-r','LineWidth',2);
            
            total2 = y22 + y12;
            plot(x2,y22./total2,'sy','MarkerEdgeColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
            plot(x2,y12./total2,'dm','MarkerEdgeColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
            plot(x2,y22fit./n2,'-y','LineWidth',2);
            plot(x2,y12fit./n2,'-m','LineWidth',2);

            ylabel('Probability','FontSize',labelfontsize,'FontWeight','b');
            xlabel('Proximal Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
            legendhandle2 = gca;
            set(gca,'FontSize',axesfontsize);hold off;



        %subplotspace('horizontal',-20);
        subplotspace('vertical',-15);

        [ax,h3]=suplabel('Branch Bifurcation / Termination Probability Figure'  ,'t');
        set(h3,'FontSize',titlefontsize);

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

        fillscreen;

        legend(legendhandle1,[controlanalysis.inputfilename ' Total'],[controlanalysis.inputfilename ' Bifs'],[controlanalysis.inputfilename ' Terms'],[testanalysis.inputfilename ' Total'],[testanalysis.inputfilename ' Bifs'],[testanalysis.inputfilename ' Terms'],'Location','NorthEast');
        legend(legendhandle2,[controlanalysis.inputfilename ' Bif Prob'],[controlanalysis.inputfilename ' Term Prob'],[controlanalysis.inputfilename ' Bif Prob Fit'],[controlanalysis.inputfilename ' Term Prob Fit'],[testanalysis.inputfilename ' Bif Prob'],[testanalysis.inputfilename ' Term Prob'],[testanalysis.inputfilename ' Bif Prob Fit'],[testanalysis.inputfilename ' Term Prob Fit'],'Location','NorthEast');


        filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'401_Branch_Bif_Term_Prob');
        print('-djpeg',filename);
        %saveas(gcf,filename,'fig');        





    figure;

        subplot(2,1,1);
            semilogx(x,(y2 + y1),'b','LineWidth',2);
            hold on;
            semilogx(x,y2,'sg','MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
            semilogx(x,y1,'dr','MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
            
            semilogx(x2,(y22 + y12),'c','LineWidth',2);
            semilogx(x2,y22,'sy','MarkerEdgeColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
            semilogx(x2,y12,'dm','MarkerEdgeColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
            
            ylabel('Number of Segments','FontSize',labelfontsize,'FontWeight','b');
            legendhandle1 = gca;
            set(gca,'FontSize',axesfontsize);hold off;

        subplot(2,1,2);
            total = y2 + y1;
            semilogx(x,y2./total,'sg','MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',greenmarkersize);
            hold on;
            semilogx(x,y1./total,'dr','MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',redmarkersize);
            semilogx(x,y2fit./n,'-g','LineWidth',2);
            semilogx(x,y1fit./n,'-r','LineWidth',2);
            
            total2 = y22 + y12;
            semilogx(x2,y22./total2,'sy','MarkerEdgeColor','y','MarkerFaceColor','y','MarkerSize',yellowmarkersize);
            semilogx(x2,y12./total2,'dm','MarkerEdgeColor','m','MarkerFaceColor','m','MarkerSize',magentamarkersize);
            semilogx(x2,y22fit./n2,'-y','LineWidth',2);
            semilogx(x2,y12fit./n2,'-m','LineWidth',2);

            ylabel('Probability','FontSize',labelfontsize,'FontWeight','b');
            xlabel('Proximal Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
            legendhandle2 = gca;
            set(gca,'FontSize',axesfontsize);hold off;




        %subplotspace('horizontal',-20);
        subplotspace('vertical',-15);

        [ax,h3]=suplabel('Branch Bifurcation / Termination Probability Figure (Semi-Log)'  ,'t');
        set(h3,'FontSize',titlefontsize);

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

        fillscreen;

        legend(legendhandle1,[controlanalysis.inputfilename ' Total'],[controlanalysis.inputfilename ' Bifs'],[controlanalysis.inputfilename ' Terms'],'Location','NorthEast');
        legend(legendhandle2,[controlanalysis.inputfilename ' Bif Prob'],[controlanalysis.inputfilename ' Term Prob'],[controlanalysis.inputfilename ' Bif Prob Fit'],[controlanalysis.inputfilename ' Term Prob Fit'],'Location','NorthEast');


        filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'401_Branch_Bif_Term_Prob_SemiLog');
        print('-djpeg',filename);
        %saveas(gcf,filename,'fig');        
    
end
