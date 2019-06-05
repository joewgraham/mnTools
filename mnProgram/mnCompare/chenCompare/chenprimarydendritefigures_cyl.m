function chenprimarydendritefigures_cyl(controlanalysis,testanalysis)
% Primary Dendrite Cylindrical Diameter Figures

labelfontsize = 12;
insetfontsize = 10;

figure;

if nargin == 1

    subplot(3,3,1); box on; hold on;
    ylabel('Number PDs','FontSize',labelfontsize,'FontWeight','b');

    hist(controlanalysis.primarydendrite.cylindricaldiameter.values);
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);
    h = findobj(gca,'Type','patch');
    set(h(1),'FaceColor','b','EdgeColor','b','FaceAlpha',0.5,'EdgeAlpha',0.5);
    hold off;


    subplot(3,3,4); box on; hold on;
    ylabel('Number Segments','FontSize',labelfontsize,'FontWeight','b');
    controldatax = controlanalysis.primarydendrite.cylindricaldiameter.values;
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

    hold off;

    
    subplot(3,3,7); box on; hold on;
    ylabel('Max Branch Order','FontSize',labelfontsize,'FontWeight','b');
    controldatax = controlanalysis.primarydendrite.cylindricaldiameter.values;
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

    hold off;

    
    subplot(3,3,2); box on; hold on;
    ylabel('PD Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    controldatax = controlanalysis.primarydendrite.cylindricaldiameter.values;
    controldatay = controlanalysis.primarydendrite.length.values;
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

    hold off;

    
    subplot(3,3,5); box on; hold on;
    ylabel('PD Surface Area (\mum^2)','FontSize',labelfontsize,'FontWeight','b');
    controldatax = controlanalysis.primarydendrite.cylindricaldiameter.values;
    controldatay = controlanalysis.primarydendrite.surfacearea.values;
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

    hold off;

    
    subplot(3,3,8); box on; hold on;
    ylabel('PD Volume (\mum^3)','FontSize',labelfontsize,'FontWeight','b');
    controldatax = controlanalysis.primarydendrite.cylindricaldiameter.values;
    controldatay = controlanalysis.primarydendrite.volume.values;
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

    hold off;

    
    subplot(3,3,3); box on; hold on;
    ylabel('Total Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    controldatax = controlanalysis.primarydendrite.cylindricaldiameter.values;
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

    hold off;

    
    subplot(3,3,6); box on; hold on;
    ylabel('Total Surface Area (\mum^2)','FontSize',labelfontsize,'FontWeight','b');
    controldatax = controlanalysis.primarydendrite.cylindricaldiameter.values;
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

    hold off;

    
    subplot(3,3,9); box on; hold on;
    ylabel('Total Volume (\mum^3)','FontSize',labelfontsize,'FontWeight','b');
    controldatax = controlanalysis.primarydendrite.cylindricaldiameter.values;
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

    hold off;

    %subplotspace('horizontal',-20);
    subplotspace('vertical',-20);

    [ax,h1]=suplabel('Primary Dendrite Cylindrical Diameter (\mum)');
    [ax,h3]=suplabel('Morphometrics versus Primary Dendrite Diameter'  ,'t');
    set(h1,'FontSize',15);
    set(h3,'FontSize',20);

    currentdirectory = cd;
    cd(controlanalysis.datapathname);
 
    if exist('figures','dir')==7
        cd('figures');
    else
        mkdir('figures');
        cd('figures');
    end

    fillscreen;

    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Cyl_Primary_Dendrite_Figure');
    print('-dmeta',filename);
    saveas(gcf,filename,'fig');

end

if nargin == 2

    subplot(3,3,1); box on; hold on;
    ylabel('Number PDs','FontSize',labelfontsize,'FontWeight','b');

    [totaldata xvalues] = hist([controlanalysis.primarydendrite.cylindricaldiameter.values testanalysis.primarydendrite.cylindricaldiameter.values]);
    hist(controlanalysis.primarydendrite.cylindricaldiameter.values,xvalues);
    hist(testanalysis.primarydendrite.cylindricaldiameter.values,xvalues);
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);
    h = findobj(gca,'Type','patch');
    set(h(2),'FaceColor','b','EdgeColor','b','FaceAlpha',0.5,'EdgeAlpha',0.5);
    set(h(1),'FaceColor','r','EdgeColor','r','FaceAlpha',0.5,'EdgeAlpha',0.5);
    hold off;


    subplot(3,3,4); box on; hold on;
    ylabel('Number Segments','FontSize',labelfontsize,'FontWeight','b');
    controldatax = controlanalysis.primarydendrite.cylindricaldiameter.values;
%     controldatay = controlanalysis.primarydendrite.numbersegments.values;
%     scatter(controldatax,controldatay,'b.');
    testdatax    = testanalysis.primarydendrite.cylindricaldiameter.values;
    testdatay    = testanalysis.primarydendrite.numbersegments.values;
    scatter(testdatax,testdatay,'r.');
    controla = controlanalysis.primarydendrite.numbersegments.a;
    controlb = controlanalysis.primarydendrite.numbersegments.b;
    controlr2 = controlanalysis.primarydendrite.numbersegments.r2;
%     [controla,controlb,controlfitx,controlfity,controlr2] = powerfit(controldatax,controldatay,xlim);
    [testa,testb,testfitx,testfity,testr2]                = powerfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r');
    controlfity = controla.*(controldatax.^controlb);    
    plot(controldatax,controlfity,'b')
    
    ylimits=ylim;
    ylimits=[0 ylimits(2)];
    ylim(ylimits);

    xlimits=xlim;
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);

    text1ypos=0.9*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos=0.8*(max(ylimits)-min(ylimits))+min(ylimits);
    text1xpos=0.1*(max(xlimits)-min(xlimits))+min(xlimits);
    text2xpos=text1xpos;

    text1=sprintf('%s%.2f%s%.2f%s','y=',controla,'x^{',controlb,'}');
    text(text1xpos,text1ypos,text1,'FontSize',insetfontsize,'Color','b');

    text2=sprintf('%s%.2f%s%.2f%s','y=',testa,'x^{',testb,'}');
    text(text2xpos,text2ypos,text2,'FontSize',insetfontsize,'Color','r');

    hold off;

    subplot(3,3,7); box on; hold on;
    ylabel('Max Branch Order','FontSize',labelfontsize,'FontWeight','b');
    controldatax = controlanalysis.primarydendrite.cylindricaldiameter.values;
%     controldatay = controlanalysis.primarydendrite.maxbranchorder.values;
%     scatter(controldatax,controldatay,'b.');
    testdatax    = testanalysis.primarydendrite.cylindricaldiameter.values;
    testdatay    = testanalysis.primarydendrite.maxbranchorder.values;
    scatter(testdatax,testdatay,'r.');
    controla  = controlanalysis.primarydendrite.maxbranchorder.a; 
    controlb  = controlanalysis.primarydendrite.maxbranchorder.b; 
    controlr2 = controlanalysis.primarydendrite.maxbranchorder.r2; 
%     [controla,controlb,controlfitx,controlfity,controlr2] = powerfit(controldatax,controldatay,xlim);
    [testa,testb,testfitx,testfity,testr2]                = powerfit(testdatax,testdatay,xlim);
%     plot(controlfitx,controlfity,'b');
    plot(testfitx,testfity,'r');
    controlfity = controla.*(controldatax.^controlb);
    plot(controldatax,controlfity,'b');
    
    ylimits=ylim;
    ylimits=[0 ylimits(2)];
    ylim(ylimits);

    xlimits=xlim;
    %xtick = get(gca,'xtick');
    %set(gca,'xticklabel', []);

    text1ypos=0.9*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos=0.8*(max(ylimits)-min(ylimits))+min(ylimits);
    text1xpos=0.1*(max(xlimits)-min(xlimits))+min(xlimits);
    text2xpos=text1xpos;

    text1=sprintf('%s%.2f%s%.2f%s','y=',controla,'x^{',controlb,'}');
    text(text1xpos,text1ypos,text1,'FontSize',insetfontsize,'Color','b');

    text2=sprintf('%s%.2f%s%.2f%s','y=',testa,'x^{',testb,'}');
    text(text2xpos,text2ypos,text2,'FontSize',insetfontsize,'Color','r');

    hold off;

    subplot(3,3,2); box on; hold on;
    ylabel('PD Length (10^3 \mum)','FontSize',labelfontsize,'FontWeight','b');
    controldatax = controlanalysis.primarydendrite.cylindricaldiameter.values;
%     controldatay = controlanalysis.primarydendrite.length.values;
%     scatter(controldatax,controldatay,'b.');
    testdatax    = testanalysis.primarydendrite.cylindricaldiameter.values;
    testdatay    = testanalysis.primarydendrite.length.values/1000;
    scatter(testdatax,testdatay,'r.');
%     [controla,controlb,controlfitx,controlfity,controlr2] = powerfit(controldatax,controldatay,xlim);
    [testa,testb,testfitx,testfity,testr2]                = powerfit(testdatax,testdatay,xlim);
%     plot(controlfitx,controlfity,'b');
    plot(testfitx,testfity,'r');

    ylimits=ylim;
    ylimits=[0 ylimits(2)];
    ylim(ylimits);

    xlimits=xlim;
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);

    text1ypos=0.9*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos=0.8*(max(ylimits)-min(ylimits))+min(ylimits);
    text1xpos=0.1*(max(xlimits)-min(xlimits))+min(xlimits);
    text2xpos=text1xpos;

%     text1=sprintf('%s%.2f%s%.2f%s','y=',controla,'x^{',controlb,'}');
%     text(text1xpos,text1ypos,text1,'FontSize',insetfontsize,'Color','b');

    text2=sprintf('%s%.2f%s%.2f%s','y=',testa,'x^{',testb,'}');
    text(text2xpos,text2ypos,text2,'FontSize',insetfontsize,'Color','r');

    hold off;

    subplot(3,3,5); box on; hold on;
    ylabel('PD Surface Area (10^3 \mum^2)','FontSize',labelfontsize,'FontWeight','b');
    controldatax = controlanalysis.primarydendrite.cylindricaldiameter.values;
%     controldatay = controlanalysis.primarydendrite.surfacearea.values;
%     scatter(controldatax,controldatay,'b.');
    testdatax    = testanalysis.primarydendrite.cylindricaldiameter.values;
    testdatay    = testanalysis.primarydendrite.surfacearea.values/1000;
    scatter(testdatax,testdatay,'r.');
%     [controla,controlb,controlfitx,controlfity,controlr2] = powerfit(controldatax,controldatay,xlim);
    [testa,testb,testfitx,testfity,testr2]                = powerfit(testdatax,testdatay,xlim);
%     plot(controlfitx,controlfity,'b');
    plot(testfitx,testfity,'r');

    ylimits=ylim;
    ylimits=[0 ylimits(2)];
    ylim(ylimits);

    xlimits=xlim;
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);

    text1ypos=0.9*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos=0.8*(max(ylimits)-min(ylimits))+min(ylimits);
    text1xpos=0.1*(max(xlimits)-min(xlimits))+min(xlimits);
    text2xpos=text1xpos;

%     text1=sprintf('%s%.2f%s%.2f%s','y=',controla,'x^{',controlb,'}');
%     text(text1xpos,text1ypos,text1,'FontSize',insetfontsize,'Color','b');

    text2=sprintf('%s%.2f%s%.2f%s','y=',testa,'x^{',testb,'}');
    text(text2xpos,text2ypos,text2,'FontSize',insetfontsize,'Color','r');

    hold off;

    subplot(3,3,8); box on; hold on;
    ylabel('PD Volume (10^3 \mum^3)','FontSize',labelfontsize,'FontWeight','b');
    controldatax = controlanalysis.primarydendrite.cylindricaldiameter.values;
%     controldatay = controlanalysis.primarydendrite.volume.values;
%     scatter(controldatax,controldatay,'b.');
    testdatax    = testanalysis.primarydendrite.cylindricaldiameter.values;
    testdatay    = testanalysis.primarydendrite.volume.values/1000;
    scatter(testdatax,testdatay,'r.');
%     [controla,controlb,controlfitx,controlfity,controlr2] = powerfit(controldatax,controldatay,xlim);
    [testa,testb,testfitx,testfity,testr2]                = powerfit(testdatax,testdatay,xlim);
%     plot(controlfitx,controlfity,'b');
    plot(testfitx,testfity,'r');

    ylimits=ylim;
    ylimits=[0 ylimits(2)];
    ylim(ylimits);

    xlimits=xlim;
    %xtick = get(gca,'xtick');
    %set(gca,'xticklabel', []);

    text1ypos=0.9*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos=0.8*(max(ylimits)-min(ylimits))+min(ylimits);
    text1xpos=0.1*(max(xlimits)-min(xlimits))+min(xlimits);
    text2xpos=text1xpos;

%     text1=sprintf('%s%.2f%s%.2f%s','y=',controla,'x^{',controlb,'}');
%     text(text1xpos,text1ypos,text1,'FontSize',insetfontsize,'Color','b');

    text2=sprintf('%s%.2f%s%.2f%s','y=',testa,'x^{',testb,'}');
    text(text2xpos,text2ypos,text2,'FontSize',insetfontsize,'Color','r');

    hold off;

    subplot(3,3,3); box on; hold on;
    ylabel('Total Length (10^3 \mum)','FontSize',labelfontsize,'FontWeight','b');
    controldatax = controlanalysis.primarydendrite.cylindricaldiameter.values;
%     controldatay = controlanalysis.primarydendrite.totallength.values;
%     scatter(controldatax,controldatay,'b.');
    testdatax    = testanalysis.primarydendrite.cylindricaldiameter.values;
    testdatay    = testanalysis.primarydendrite.totallength.values/1000;
    controla  = controlanalysis.primarydendrite.totallength.a;
    controlb  = controlanalysis.primarydendrite.totallength.b;
    controlr2 = controlanalysis.primarydendrite.totallength.r2;
    scatter(testdatax,testdatay,'r.');
%     [controla,controlb,controlfitx,controlfity,controlr2] = powerfit(controldatax,controldatay,xlim);
    [testa,testb,testfitx,testfity,testr2]                = powerfit(testdatax,testdatay,xlim);
%     plot(controlfitx,controlfity,'b');
    plot(testfitx,testfity,'r');
    controlfity = controla.*(controldatax.^controlb);
    plot(controldatax,controlfity,'b');

    ylimits=ylim;
    ylimits=[0 ylimits(2)];
    ylim(ylimits);

    xlimits=xlim;
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);

    text1ypos=0.9*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos=0.8*(max(ylimits)-min(ylimits))+min(ylimits);
    text1xpos=0.1*(max(xlimits)-min(xlimits))+min(xlimits);
    text2xpos=text1xpos;

    text1=sprintf('%s%.2f%s%.2f%s','y=',controla,'x^{',controlb,'}');
    text(text1xpos,text1ypos,text1,'FontSize',insetfontsize,'Color','b');

    text2=sprintf('%s%.2f%s%.2f%s','y=',testa,'x^{',testb,'}');
    text(text2xpos,text2ypos,text2,'FontSize',insetfontsize,'Color','r');

    hold off;

    
    subplot(3,3,6); box on; hold on;
    ylabel('Total Surface Area (10^3 \mum^2)','FontSize',labelfontsize,'FontWeight','b');
    controldatax = controlanalysis.primarydendrite.cylindricaldiameter.values;
%     controldatay = controlanalysis.primarydendrite.totalsurfacearea.values;
%     scatter(controldatax,controldatay,'b.');
    testdatax    = testanalysis.primarydendrite.cylindricaldiameter.values;
    testdatay    = testanalysis.primarydendrite.totalsurfacearea.values/1000;
    scatter(testdatax,testdatay,'r.');
    controla  = controlanalysis.primarydendrite.totalsurfacearea.a;
    controlb  = controlanalysis.primarydendrite.totalsurfacearea.b;
    controlr2 = controlanalysis.primarydendrite.totalsurfacearea.r2;
%     [controla,controlb,controlfitx,controlfity,controlr2] = powerfit(controldatax,controldatay,xlim);
    contolfity = controla.*(controldatax.^controlb);
    [testa,testb,testfitx,testfity,testr2]                = powerfit(testdatax,testdatay,xlim);
    plot(controldatax,controlfity,'b');
    plot(testfitx,testfity,'r');

    ylimits=ylim;
    ylimits=[0 ylimits(2)];
    ylim(ylimits);

    xlimits=xlim;
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);

    text1ypos=0.9*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos=0.8*(max(ylimits)-min(ylimits))+min(ylimits);
    text1xpos=0.1*(max(xlimits)-min(xlimits))+min(xlimits);
    text2xpos=text1xpos;

    text1=sprintf('%s%.2f%s%.2f%s','y=',controla,'x^{',controlb,'}');
    text(text1xpos,text1ypos,text1,'FontSize',insetfontsize,'Color','b');

    text2=sprintf('%s%.2f%s%.2f%s','y=',testa,'x^{',testb,'}');
    text(text2xpos,text2ypos,text2,'FontSize',insetfontsize,'Color','r');

    hold off;

    
    subplot(3,3,9); box on; hold on;
    ylabel('Total Volume (10^3 \mum^3)','FontSize',labelfontsize,'FontWeight','b');
    controldatax = controlanalysis.primarydendrite.cylindricaldiameter.values;
%     controldatay = controlanalysis.primarydendrite.totalvolume.values;
%     scatter(controldatax,controldatay,'b.');
    testdatax    = testanalysis.primarydendrite.cylindricaldiameter.values;
    testdatay    = testanalysis.primarydendrite.totalvolume.values/1000;
    scatter(testdatax,testdatay,'r.');
    controla  = controlanalysis.primarydendrite.totalvolume.a;
    controlb  = controlanalysis.primarydendrite.totalvolume.b;
    controlr2 = controlanalysis.primarydendrite.totalvolume.r2;
%     [controla,controlb,controlfitx,controlfity,controlr2] = powerfit(controldatax,controldatay,xlim);
    [testa,testb,testfitx,testfity,testr2]                = powerfit(testdatax,testdatay,xlim);
%     plot(controlfitx,controlfity,'b');
    plot(controldatax,controlfity,'b');
    plot(testfitx,testfity,'r');

    ylimits=ylim;
    ylimits=[0 ylimits(2)];
    ylim(ylimits);

    xlimits=xlim;
    %xtick = get(gca,'xtick');
    %set(gca,'xticklabel', []);

    text1ypos=0.9*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos=0.8*(max(ylimits)-min(ylimits))+min(ylimits);
    text1xpos=0.1*(max(xlimits)-min(xlimits))+min(xlimits);
    text2xpos=text1xpos;

    text1=sprintf('%s%.2f%s%.2f%s','y=',controla,'x^{',controlb,'}');
    text(text1xpos,text1ypos,text1,'FontSize',insetfontsize,'Color','b');

    text2=sprintf('%s%.2f%s%.2f%s','y=',testa,'x^{',testb,'}');
    text(text2xpos,text2ypos,text2,'FontSize',insetfontsize,'Color','r');

    hold off;

    %subplotspace('horizontal',-20);
    subplotspace('vertical',-20);

    [ax,h1]=suplabel('Primary Dendrite Cylindrical Diameter (\mum)');
    [ax,h3]=suplabel('Comparison of Morphometrics versus Primary Dendrite Diameter'  ,'t');
    set(h1,'FontSize',15);
    set(h3,'FontSize',20);

    currentdirectory = cd;
    cd(testanalysis.datapathname);
    %cd ..

    if exist(sprintf('%s_comparison',controlanalysis.inputfilename),'dir')==7;
        cd(sprintf('%s_comparison',controlanalysis.inputfilename));
    else
        mkdir(sprintf('%s_comparison',controlanalysis.inputfilename));
        cd(sprintf('%s_comparison',controlanalysis.inputfilename));
    end

    if exist('figures','dir')==7
        cd('figures');
    else
        mkdir('figures');
        cd('figures');
    end


    fillscreen;

    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'Cyl_Primary_Dendrite_Comparison_Figure');
    print('-dmeta',filename);
    saveas(gcf,filename,'fig');
    

end

 
 
 
 
 
 