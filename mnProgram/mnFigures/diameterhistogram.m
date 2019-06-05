function diameterhistogram(controlanalysis,testanalysis)
% Diameter Figures

labelfontsize = 12;
insetfontsize = 10;

figure; box on; 

if nargin == 1

    controldatax   = [controlanalysis.diameter.diameter];
    controldatay   = [controlanalysis.diameter.numbersegments.total];
    

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
    title('Total Number of Segments in Diameter Bins','FontSize',20,'FontWeight','b');
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

    filename = sprintf('%s_%s',controlanalysis.inputfilename,'302_Diameter_Dist');
    print('-djpeg',filename);
    %saveas(gcf,filename,'fig');

end

if nargin == 2
    
    controldatax   = [controlanalysis.diameter.diameter];
    controldatay   = [controlanalysis.diameter.numbersegments.total];
    testdatax   = [testanalysis.diameter.diameter];
    testdatay   = [testanalysis.diameter.numbersegments.total];
    
    bar(controldatax,controldatay,'b');
    hold on;
    bar(testdatax,testdatay,'r');
    ylabel('Number of Segments','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Diameter Bins (\mum)','FontSize',labelfontsize,'FontWeight','b');
    legendhandle = gca; 
    %h=gca; set(gca,'XDir','reverse');
    h = findobj(gca,'Type','patch');
    set(h(2),'FaceColor','b','EdgeColor','b','FaceAlpha',0.5,'EdgeAlpha',0.5);
    set(h(1),'FaceColor','r','EdgeColor','r','FaceAlpha',0.5,'EdgeAlpha',0.5);
    %     ylimits=ylim;
    %     ylimits=[0 ylimits(2)];
    %     ylim(ylimits);
    %     xlimits=xlim;
    %     xtick = get(gca,'xtick');
    %     set(gca,'xticklabel', []);
    title('Total Number of Segments in Diameter Bins','FontSize',20,'FontWeight','b');
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

    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'302_Diameter_Dist');
    print('-djpeg',filename);
    %saveas(gcf,filename,'fig');

end
