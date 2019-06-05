function primarydendritefigures(controlanalysis,testanalysis)
% Primary Dendrite Proximal Diameter Figures

titlefontsize = 14;
labelfontsize = 7;
axesfontsize  = 5;
insetfontsize = 4;


figure;

if nargin == 1


    subplot(3,2,3); box on; hold on;
    ylabel('Number Segments','FontSize',labelfontsize,'FontWeight','b');
    controldatax = controlanalysis.primarydendrite.proximaldiameter.values;
    controldatay = controlanalysis.primarydendrite.numbersegments.values;
    scatter(controldatax,controldatay,'b.');
    [controla,controlb,controlfitx,controlfity,controlr2] = powerfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    ylimits=ylim;
    ylimits=[0 ylimits(2)];
    ylim(ylimits);
    xlimits=xlim;
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);
    text1ypos=0.9*max(ylimits);
    text2ypos=0.8*max(ylimits);
    text1xpos=0.1*max(xlimits);
    text2xpos=text1xpos;
    text1=sprintf('%s%.2f%s%.2f%s','y=',controla,'x^{',controlb,'}');
    text(text1xpos,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
    text2=sprintf('%s%.2f','r^2=',controlr2);
    text(text2xpos,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
    set(gca,'FontSize',axesfontsize);hold off;

    
    subplot(3,2,1); box on; hold on;
    ylabel('Number PDs','FontSize',labelfontsize,'FontWeight','b');
    hist(controlanalysis.primarydendrite.proximaldiameter.values);
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);
    h = findobj(gca,'Type','patch');
    set(h(1),'FaceColor','b','EdgeColor','b','FaceAlpha',0.5,'EdgeAlpha',0.5);
    xlim(xlimits);
    set(gca,'FontSize',axesfontsize);hold off;
    
    
    subplot(3,2,5); box on; hold on;
    ylabel('Max Branch Order','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Primary Dendrite Proximal Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    controldatax = controlanalysis.primarydendrite.proximaldiameter.values;
    controldatay = controlanalysis.primarydendrite.maxbranchorder.values;
    scatter(controldatax,controldatay,'b.');
    [controla,controlb,controlfitx,controlfity,controlr2] = powerfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    ylimits=ylim;
    ylimits=[0 ylimits(2)];
    ylim(ylimits);
    xlimits=xlim;
    %xtick = get(gca,'xtick');
    %set(gca,'xticklabel', []);
    text1ypos=0.9*max(ylimits);
    text2ypos=0.8*max(ylimits);
    text1xpos=0.1*max(xlimits);
    text2xpos=text1xpos;
    text1=sprintf('%s%.2f%s%.2f%s','y=',controla,'x^{',controlb,'}');
    text(text1xpos,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
    text2=sprintf('%s%.2f','r^2=',controlr2);
    text(text2xpos,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
    set(gca,'FontSize',axesfontsize);hold off;

    
    
    subplot(3,2,2); box on; hold on;
    ylabel('Total Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    controldatax = controlanalysis.primarydendrite.proximaldiameter.values;
    controldatay = controlanalysis.primarydendrite.totallength.values;
    scatter(controldatax,controldatay,'b.');
    [controla,controlb,controlfitx,controlfity,controlr2] = powerfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    ylimits=ylim;
    ylimits=[0 ylimits(2)];
    ylim(ylimits);
    xlimits=xlim;
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);
    text1ypos=0.9*max(ylimits);
    text2ypos=0.8*max(ylimits);
    text1xpos=0.1*max(xlimits);
    text2xpos=text1xpos;
    text1=sprintf('%s%.2f%s%.2f%s','y=',controla,'x^{',controlb,'}');
    text(text1xpos,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
    text2=sprintf('%s%.2f','r^2=',controlr2);
    text(text2xpos,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
    set(gca,'FontSize',axesfontsize);hold off;

    
    subplot(3,2,4); box on; hold on;
    ylabel('Total Surface Area (\mum^2)','FontSize',labelfontsize,'FontWeight','b');
    controldatax = controlanalysis.primarydendrite.proximaldiameter.values;
    controldatay = controlanalysis.primarydendrite.totalsurfacearea.values;
    scatter(controldatax,controldatay,'b.');
    [controla,controlb,controlfitx,controlfity,controlr2] = powerfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    ylimits=ylim;
    ylimits=[0 ylimits(2)];
    ylim(ylimits);
    xlimits=xlim;
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);
    text1ypos=0.9*max(ylimits);
    text2ypos=0.8*max(ylimits);
    text1xpos=0.1*max(xlimits);
    text2xpos=text1xpos;
    text1=sprintf('%s%.2f%s%.2f%s','y=',controla,'x^{',controlb,'}');
    text(text1xpos,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
    text2=sprintf('%s%.2f','r^2=',controlr2);
    text(text2xpos,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
    set(gca,'FontSize',axesfontsize);hold off;

    
    subplot(3,2,6); box on; hold on;
    ylabel('Total Volume (\mum^3)','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Primary Dendrite Proximal Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    controldatax = controlanalysis.primarydendrite.proximaldiameter.values;
    controldatay = controlanalysis.primarydendrite.totalvolume.values;
    scatter(controldatax,controldatay,'b.');
    [controla,controlb,controlfitx,controlfity,controlr2] = powerfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    ylimits=ylim;
    ylimits=[0 ylimits(2)];
    ylim(ylimits);
    xlimits=xlim;
    %xtick = get(gca,'xtick');
    %set(gca,'xticklabel', []);
    text1ypos=0.9*max(ylimits);
    text2ypos=0.8*max(ylimits);
    text1xpos=0.1*max(xlimits);
    text2xpos=text1xpos;
    text1=sprintf('%s%.2f%s%.2f%s','y=',controla,'x^{',controlb,'}');
    text(text1xpos,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
    text2=sprintf('%s%.2f','r^2=',controlr2);
    text(text2xpos,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
    set(gca,'FontSize',axesfontsize);hold off;
    
    
    
    
    subplotspace('horizontal',-5);
    subplotspace('vertical',-15);

    %[ax,h1]=suplabel('Primary Dendrite Proximal Diameter (\mum)');
    [ax,h3]=suplabel('Morphometrics versus Primary Dendrite Diameter'  ,'t');
    %set(h1,'FontSize',15);
    set(h3,'FontSize',titlefontsize);

    currentdirectory = cd;
    cd(controlanalysis.datapathname);
 
    if exist('figures','dir')==7
        cd('figures');
    else
        mkdir('figures');
        cd('figures');
    end

    %fillscreen;

    filename = sprintf('%s_%s',controlanalysis.inputfilename,'108_Morph_v_PD_Prox_Diameter');
    print('-djpeg',filename);
    %saveas(gcf,filename,'fig');

end

if nargin == 2

    
    subplot(3,2,3); box on; hold on;
    ylabel('Number Segments','FontSize',labelfontsize,'FontWeight','b');
    controldatax = controlanalysis.primarydendrite.proximaldiameter.values;
    controldatay = controlanalysis.primarydendrite.numbersegments.values;
    scatter(controldatax,controldatay,'b.');
    testdatax    = testanalysis.primarydendrite.proximaldiameter.values;
    testdatay    = testanalysis.primarydendrite.numbersegments.values;
    scatter(testdatax,testdatay,'r.');
    [controla,controlb,controlfitx,controlfity,controlr2] = powerfit(controldatax,controldatay,xlim);
    [testa,testb,testfitx,testfity,testr2]                = powerfit(testdatax,testdatay,xlim);
    plot(controlfitx,controlfity,'b');
    plot(testfitx,testfity,'r');

    ylimits=ylim;
    ylimits=[0 ylimits(2)];
    ylim(ylimits);

    xlimits=xlim;
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);

    text1ypos=0.9*max(ylimits);
    text2ypos=0.8*max(ylimits);
    text1xpos=0.1*max(xlimits);
    text2xpos=text1xpos;

    text1=sprintf('%s%.2f%s%.2f%s','y=',controla,'x^{',controlb,'}');
    text(text1xpos,text1ypos,text1,'FontSize',insetfontsize,'Color','b');

    text2=sprintf('%s%.2f%s%.2f%s','y=',testa,'x^{',testb,'}');
    text(text2xpos,text2ypos,text2,'FontSize',insetfontsize,'Color','r');

    set(gca,'FontSize',axesfontsize);hold off;
    
    
    subplot(3,2,1); box on; hold on;
    ylabel('Number PDs','FontSize',labelfontsize,'FontWeight','b');
    [totaldata xvalues] = hist([controlanalysis.primarydendrite.proximaldiameter.values testanalysis.primarydendrite.proximaldiameter.values]);
    hist(controlanalysis.primarydendrite.proximaldiameter.values,xvalues);
    hist(testanalysis.primarydendrite.proximaldiameter.values,xvalues);
    legendhandle = gca; 
    xtick = get(gca,'xtick');
    xlim(xlimits);
    set(gca,'xticklabel', []);
    h = findobj(gca,'Type','patch');
    set(h(2),'FaceColor','b','EdgeColor','b','FaceAlpha',0.5,'EdgeAlpha',0.5);
    set(h(1),'FaceColor','r','EdgeColor','r','FaceAlpha',0.5,'EdgeAlpha',0.5);
    set(gca,'FontSize',axesfontsize);hold off;
    
    

    subplot(3,2,5); box on; hold on;
    ylabel('Max Branch Order','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Primary Dendrite Proximal Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    controldatax = controlanalysis.primarydendrite.proximaldiameter.values;
    controldatay = controlanalysis.primarydendrite.maxbranchorder.values;
    scatter(controldatax,controldatay,'b.');
    testdatax    = testanalysis.primarydendrite.proximaldiameter.values;
    testdatay    = testanalysis.primarydendrite.maxbranchorder.values;
    scatter(testdatax,testdatay,'r.');
    [controla,controlb,controlfitx,controlfity,controlr2] = powerfit(controldatax,controldatay,xlim);
    [testa,testb,testfitx,testfity,testr2]                = powerfit(testdatax,testdatay,xlim);
    plot(controlfitx,controlfity,'b');
    plot(testfitx,testfity,'r');

    ylimits=ylim;
    ylimits=[0 ylimits(2)];
    ylim(ylimits);

    xlimits=xlim;
    %xtick = get(gca,'xtick');
    %set(gca,'xticklabel', []);

    text1ypos=0.9*max(ylimits);
    text2ypos=0.8*max(ylimits);
    text1xpos=0.1*max(xlimits);
    text2xpos=text1xpos;

    text1=sprintf('%s%.2f%s%.2f%s','y=',controla,'x^{',controlb,'}');
    text(text1xpos,text1ypos,text1,'FontSize',insetfontsize,'Color','b');

    text2=sprintf('%s%.2f%s%.2f%s','y=',testa,'x^{',testb,'}');
    text(text2xpos,text2ypos,text2,'FontSize',insetfontsize,'Color','r');

    set(gca,'FontSize',axesfontsize);hold off;


    subplot(3,2,2); box on; hold on;
    ylabel('Total Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    controldatax = controlanalysis.primarydendrite.proximaldiameter.values;
    controldatay = controlanalysis.primarydendrite.totallength.values;
    scatter(controldatax,controldatay,'b.');
    testdatax    = testanalysis.primarydendrite.proximaldiameter.values;
    testdatay    = testanalysis.primarydendrite.totallength.values;
    scatter(testdatax,testdatay,'r.');
    [controla,controlb,controlfitx,controlfity,controlr2] = powerfit(controldatax,controldatay,xlim);
    [testa,testb,testfitx,testfity,testr2]                = powerfit(testdatax,testdatay,xlim);
    plot(controlfitx,controlfity,'b');
    plot(testfitx,testfity,'r');

    ylimits=ylim;
    ylimits=[0 ylimits(2)];
    ylim(ylimits);

    xlimits=xlim;
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);

    text1ypos=0.9*max(ylimits);
    text2ypos=0.8*max(ylimits);
    text1xpos=0.1*max(xlimits);
    text2xpos=text1xpos;

    text1=sprintf('%s%.2f%s%.2f%s','y=',controla,'x^{',controlb,'}');
    text(text1xpos,text1ypos,text1,'FontSize',insetfontsize,'Color','b');

    text2=sprintf('%s%.2f%s%.2f%s','y=',testa,'x^{',testb,'}');
    text(text2xpos,text2ypos,text2,'FontSize',insetfontsize,'Color','r');

    set(gca,'FontSize',axesfontsize);hold off;

    subplot(3,2,4); box on; hold on;
    ylabel('Total Surface Area (\mum^2)','FontSize',labelfontsize,'FontWeight','b');
    controldatax = controlanalysis.primarydendrite.proximaldiameter.values;
    controldatay = controlanalysis.primarydendrite.totalsurfacearea.values;
    scatter(controldatax,controldatay,'b.');
    testdatax    = testanalysis.primarydendrite.proximaldiameter.values;
    testdatay    = testanalysis.primarydendrite.totalsurfacearea.values;
    scatter(testdatax,testdatay,'r.');
    [controla,controlb,controlfitx,controlfity,controlr2] = powerfit(controldatax,controldatay,xlim);
    [testa,testb,testfitx,testfity,testr2]                = powerfit(testdatax,testdatay,xlim);
    plot(controlfitx,controlfity,'b');
    plot(testfitx,testfity,'r');

    ylimits=ylim;
    ylimits=[0 ylimits(2)];
    ylim(ylimits);

    xlimits=xlim;
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);

    text1ypos=0.9*max(ylimits);
    text2ypos=0.8*max(ylimits);
    text1xpos=0.1*max(xlimits);
    text2xpos=text1xpos;

    text1=sprintf('%s%.2f%s%.2f%s','y=',controla,'x^{',controlb,'}');
    text(text1xpos,text1ypos,text1,'FontSize',insetfontsize,'Color','b');

    text2=sprintf('%s%.2f%s%.2f%s','y=',testa,'x^{',testb,'}');
    text(text2xpos,text2ypos,text2,'FontSize',insetfontsize,'Color','r');

    set(gca,'FontSize',axesfontsize);hold off;

    subplot(3,2,6); box on; hold on;
    ylabel('Total Volume (\mum^3)','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Primary Dendrite Proximal Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    controldatax = controlanalysis.primarydendrite.proximaldiameter.values;
    controldatay = controlanalysis.primarydendrite.totalvolume.values;
    scatter(controldatax,controldatay,'b.');
    testdatax    = testanalysis.primarydendrite.proximaldiameter.values;
    testdatay    = testanalysis.primarydendrite.totalvolume.values;
    scatter(testdatax,testdatay,'r.');
    [controla,controlb,controlfitx,controlfity,controlr2] = powerfit(controldatax,controldatay,xlim);
    [testa,testb,testfitx,testfity,testr2]                = powerfit(testdatax,testdatay,xlim);
    plot(controlfitx,controlfity,'b');
    plot(testfitx,testfity,'r');

    ylimits=ylim;
    ylimits=[0 ylimits(2)];
    ylim(ylimits);

    xlimits=xlim;
    %xtick = get(gca,'xtick');
    %set(gca,'xticklabel', []);

    text1ypos=0.9*max(ylimits);
    text2ypos=0.8*max(ylimits);
    text1xpos=0.1*max(xlimits);
    text2xpos=text1xpos;

    text1=sprintf('%s%.2f%s%.2f%s','y=',controla,'x^{',controlb,'}');
    text(text1xpos,text1ypos,text1,'FontSize',insetfontsize,'Color','b');

    text2=sprintf('%s%.2f%s%.2f%s','y=',testa,'x^{',testb,'}');
    text(text2xpos,text2ypos,text2,'FontSize',insetfontsize,'Color','r');

    set(gca,'FontSize',axesfontsize);hold off;

    subplotspace('horizontal',-5);
    subplotspace('vertical',-15);

    %[ax,h1]=suplabel('Primary Dendrite Proximal Diameter (\mum)');
    [ax,h3]=suplabel('Morphometrics versus Primary Dendrite Diameter'  ,'t');
    %set(h1,'FontSize',15);
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


    %fillscreen;
    
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    legend('boxoff');

    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'108_Morph_v_PD_Prox_Diameter');
    print('-djpeg',filename);
    %saveas(gcf,filename,'fig');
    

end

 
 
 
 
 
 