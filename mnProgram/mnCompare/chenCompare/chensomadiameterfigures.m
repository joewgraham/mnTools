function chensomadiameterfigures(controlanalysis,testanalysis)
% Soma diameter figures

labelfontsize = 12;
insetfontsize = 10;

figure;

if nargin == 1

    subplot(3,3,1); box on; hold on;
    ylabel('Number MNs','FontSize',labelfontsize,'FontWeight','b');

    hist(controlanalysis.somadiameter.values);
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);
    h = findobj(gca,'Type','patch');
    set(h(1),'FaceColor','b','EdgeColor','b','FaceAlpha',0.5,'EdgeAlpha',0.5);
    hold off;


    subplot(3,3,4); box on; hold on;
    ylabel('Number Segments','FontSize',labelfontsize,'FontWeight','b');
    controldatax = controlanalysis.somadiameter.values;
    controldatay = controlanalysis.numbersegments.values;
    scatter(controldatax,controldatay,'b.');
    [controlm,controlb,controlfitx,controlfity,controlr2] = linearfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');

    ylimits=ylim;
    %ylimits=[0 ylimits(2)];
    ylim(ylimits);

    xlimits=xlim;
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);

    text1ypos=0.9*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos=0.8*(max(ylimits)-min(ylimits))+min(ylimits);
    text1xpos=0.1*(max(xlimits)-min(xlimits))+min(xlimits);
    text2xpos=text1xpos;

    text1=sprintf('%s%.2f%s%.2f','y=',controlm,'x+',controlb);
    text(text1xpos,text1ypos,text1,'FontSize',insetfontsize,'Color','b');

    text2=sprintf('%s%.2f','r^2=',controlr2);
    text(text2xpos,text2ypos,text2,'FontSize',insetfontsize,'Color','b');

    hold off;

    
    subplot(3,3,7); box on; hold on;
    ylabel('Max Branch Order','FontSize',labelfontsize,'FontWeight','b');
    controldatax = controlanalysis.somadiameter.values;
    controldatay = controlanalysis.maxbranchorder.values;
    scatter(controldatax,controldatay,'b.');
    [controlm,controlb,controlfitx,controlfity,controlr2] = linearfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');

    ylimits=ylim;
    %ylimits=[0 ylimits(2)];
    ylim(ylimits);

    xlimits=xlim;
    %xtick = get(gca,'xtick');
    %set(gca,'xticklabel', []);

    text1ypos=0.9*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos=0.8*(max(ylimits)-min(ylimits))+min(ylimits);
    text1xpos=0.1*(max(xlimits)-min(xlimits))+min(xlimits);
    text2xpos=text1xpos;

    text1=sprintf('%s%.2f%s%.2f','y=',controlm,'x+',controlb);
    text(text1xpos,text1ypos,text1,'FontSize',insetfontsize,'Color','b');

    text2=sprintf('%s%.2f','r^2=',controlr2);
    text(text2xpos,text2ypos,text2,'FontSize',insetfontsize,'Color','b');

    hold off;

    
    subplot(3,3,2); box on; hold on;
    ylabel('Number PDs','FontSize',labelfontsize,'FontWeight','b');
    controldatax = controlanalysis.somadiameter.values;
    controldatay = controlanalysis.numberprimarydendrites.values;
    scatter(controldatax,controldatay,'b.');
    [controlm,controlb,controlfitx,controlfity,controlr2] = linearfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');

    ylimits=ylim;
    %ylimits=[0 ylimits(2)];
    ylim(ylimits);

    xlimits=xlim;
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);

    text1ypos=0.9*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos=0.8*(max(ylimits)-min(ylimits))+min(ylimits);
    text1xpos=0.1*(max(xlimits)-min(xlimits))+min(xlimits);
    text2xpos=text1xpos;

    text1=sprintf('%s%.2f%s%.2f','y=',controlm,'x+',controlb);
    text(text1xpos,text1ypos,text1,'FontSize',insetfontsize,'Color','b');

    text2=sprintf('%s%.2f','r^2=',controlr2);
    text(text2xpos,text2ypos,text2,'FontSize',insetfontsize,'Color','b');

    hold off;

    
    subplot(3,3,5); box on; hold on;
    ylabel('Mean PD Prox Diam (\mum)','FontSize',labelfontsize,'FontWeight','b');
%     controldatax = controlanalysis.somadiameter.values;
%     controldatay = controlanalysis.primarydendrite.meanproximaldiameter.values;
%     scatter(controldatax,controldatay,'b.');
%     [controlm,controlb,controlfitx,controlfity,controlr2] = linearfit(controldatax,controldatay,xlim);
%     plot(controlfitx,controlfity,'b');

    ylimits=ylim;
    %ylimits=[0 ylimits(2)];
    ylim(ylimits);

    xlimits=xlim;
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);

%     text1ypos=0.9*(max(ylimits)-min(ylimits))+min(ylimits);
%     text2ypos=0.8*(max(ylimits)-min(ylimits))+min(ylimits);
%     text1xpos=0.1*(max(xlimits)-min(xlimits))+min(xlimits);
%     text2xpos=text1xpos;
% 
%     text1=sprintf('%s%.2f%s%.2f','y=',controlm,'x+',controlb);
%     text(text1xpos,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
% 
%     text2=sprintf('%s%.2f','r^2=',controlr2);
%     text(text2xpos,text2ypos,text2,'FontSize',insetfontsize,'Color','b');

    hold off;

    
    subplot(3,3,8); box on; hold on;
    ylabel('Mean PD Cyl Diam (\mum)','FontSize',labelfontsize,'FontWeight','b');
    controldatax = controlanalysis.somadiameter.values;
    controldatay = controlanalysis.primarydendrite.meancylindricaldiameter.values;
    scatter(controldatax,controldatay,'b.');
    [controlm,controlb,controlfitx,controlfity,controlr2] = linearfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');

    ylimits=ylim;
    %ylimits=[0 ylimits(2)];
    ylim(ylimits);

    xlimits=xlim;
    %xtick = get(gca,'xtick');
    %set(gca,'xticklabel', []);

    text1ypos=0.9*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos=0.8*(max(ylimits)-min(ylimits))+min(ylimits);
    text1xpos=0.1*(max(xlimits)-min(xlimits))+min(xlimits);
    text2xpos=text1xpos;

    text1=sprintf('%s%.2f%s%.2f','y=',controlm,'x+',controlb);
    text(text1xpos,text1ypos,text1,'FontSize',insetfontsize,'Color','b');

    text2=sprintf('%s%.2f','r^2=',controlr2);
    text(text2xpos,text2ypos,text2,'FontSize',insetfontsize,'Color','b');

    hold off;

    
    subplot(3,3,3); box on; hold on;
    ylabel('Total Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    controldatax = controlanalysis.somadiameter.values;
    controldatay = controlanalysis.totallength.values;
    scatter(controldatax,controldatay,'b.');
    [controlm,controlb,controlfitx,controlfity,controlr2] = linearfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');

    ylimits=ylim;
    %ylimits=[0 ylimits(2)];
    ylim(ylimits);

    xlimits=xlim;
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);

    text1ypos=0.9*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos=0.8*(max(ylimits)-min(ylimits))+min(ylimits);
    text1xpos=0.1*(max(xlimits)-min(xlimits))+min(xlimits);
    text2xpos=text1xpos;

    text1=sprintf('%s%.2f%s%.2f','y=',controlm,'x+',controlb);
    text(text1xpos,text1ypos,text1,'FontSize',insetfontsize,'Color','b');

    text2=sprintf('%s%.2f','r^2=',controlr2);
    text(text2xpos,text2ypos,text2,'FontSize',insetfontsize,'Color','b');

    hold off;

    
    subplot(3,3,6); box on; hold on;
    ylabel('Total Surface Area (\mum^2)','FontSize',labelfontsize,'FontWeight','b');
    controldatax = controlanalysis.somadiameter.values;
    controldatay = controlanalysis.totalsurfacearea.values;
    scatter(controldatax,controldatay,'b.');
    [controlm,controlb,controlfitx,controlfity,controlr2] = linearfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');

    ylimits=ylim;
    %ylimits=[0 ylimits(2)];
    ylim(ylimits);

    xlimits=xlim;
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);

    text1ypos=0.9*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos=0.8*(max(ylimits)-min(ylimits))+min(ylimits);
    text1xpos=0.1*(max(xlimits)-min(xlimits))+min(xlimits);
    text2xpos=text1xpos;

    text1=sprintf('%s%.2f%s%.2f','y=',controlm,'x+',controlb);
    text(text1xpos,text1ypos,text1,'FontSize',insetfontsize,'Color','b');

    text2=sprintf('%s%.2f','r^2=',controlr2);
    text(text2xpos,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
    
    hold off;

    
    subplot(3,3,9); box on; hold on;
    ylabel('Total Volume (\mum^3)','FontSize',labelfontsize,'FontWeight','b');
    controldatax = controlanalysis.somadiameter.values;
    controldatay = controlanalysis.totalvolume.values;
    scatter(controldatax,controldatay,'b.');
    [controlm,controlb,controlfitx,controlfity,controlr2] = linearfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');

    ylimits=ylim;
    %ylimits=[0 ylimits(2)];
    ylim(ylimits);

    xlimits=xlim;
    %xtick = get(gca,'xtick');
    %set(gca,'xticklabel', []);

    text1ypos=0.9*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos=0.8*(max(ylimits)-min(ylimits))+min(ylimits);
    text1xpos=0.1*(max(xlimits)-min(xlimits))+min(xlimits);
    text2xpos=text1xpos;

    text1=sprintf('%s%.2f%s%.2f','y=',controlm,'x+',controlb);
    text(text1xpos,text1ypos,text1,'FontSize',insetfontsize,'Color','b');

    text2=sprintf('%s%.2f','r^2=',controlr2);
    text(text2xpos,text2ypos,text2,'FontSize',insetfontsize,'Color','b');

    hold off;

    
    %subplotspace('horizontal',-20);
    %subplotspace('vertical',-20);

    [ax,h1]=suplabel('Soma Diameter (\mum)');
    [ax,h3]=suplabel('Morphometrics versus Soma Diameter'  ,'t');
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

    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Soma_Diameter_Figure');
    print('-dmeta',filename);
    saveas(gcf,filename,'fig');

end

if nargin == 2

    subplot(3,3,1); box on; hold on;
    ylabel('Number MNs','FontSize',labelfontsize,'FontWeight','b');

    [totaldata xvalues] = hist([controlanalysis.somadiameter.values testanalysis.somadiameter.values]);
    hist(controlanalysis.somadiameter.values,xvalues);
    hist(testanalysis.somadiameter.values,xvalues);
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);
    h = findobj(gca,'Type','patch');
    set(h(2),'FaceColor','b','EdgeColor','b','FaceAlpha',0.5,'EdgeAlpha',0.5);
    set(h(1),'FaceColor','r','EdgeColor','r','FaceAlpha',0.5,'EdgeAlpha',0.5);
    hold off;


    subplot(3,3,4); box on; hold on;
    ylabel('Number Segments','FontSize',labelfontsize,'FontWeight','b');
    controldatax = controlanalysis.somadiameter.values;
    controldatay = controlanalysis.numbersegments.values;
    scatter(controldatax,controldatay,'b.');
    testdatax    = testanalysis.somadiameter.values;
    testdatay    = testanalysis.numbersegments.values;
    scatter(testdatax,testdatay,'r.');
    [controlm,controlb,controlfitx,controlfity,controlr2] = linearfit(controldatax,controldatay,xlim);
    [testm,testb,testfitx,testfity,testr2]                = linearfit(testdatax,testdatay,xlim);
    plot(controlfitx,controlfity,'b');
    plot(testfitx,testfity,'r');

    ylimits=ylim;
    %ylimits=[0 ylimits(2)];
    ylim(ylimits);

    xlimits=xlim;
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);

    text1ypos=0.9*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos=0.8*(max(ylimits)-min(ylimits))+min(ylimits);
    text1xpos=0.1*(max(xlimits)-min(xlimits))+min(xlimits);
    text2xpos=text1xpos;

    text1=sprintf('%s%.2f%s%.2f','y=',controlm,'x+',controlb);
    text(text1xpos,text1ypos,text1,'FontSize',insetfontsize,'Color','b');

    text2=sprintf('%s%.2f%s%.2f','y=',testm,'x+',testb);
    text(text2xpos,text2ypos,text2,'FontSize',insetfontsize,'Color','r');

    hold off;

    subplot(3,3,7); box on; hold on;
    ylabel('Max Branch Order','FontSize',labelfontsize,'FontWeight','b');
    controldatax = controlanalysis.somadiameter.values;
    controldatay = controlanalysis.maxbranchorder.values;
    scatter(controldatax,controldatay,'b.');
    testdatax    = testanalysis.somadiameter.values;
    testdatay    = testanalysis.maxbranchorder.values;
    scatter(testdatax,testdatay,'r.');
    [controlm,controlb,controlfitx,controlfity,controlr2] = linearfit(controldatax,controldatay,xlim);
    [testm,testb,testfitx,testfity,testr2]                = linearfit(testdatax,testdatay,xlim);
    plot(controlfitx,controlfity,'b');
    plot(testfitx,testfity,'r');

    ylimits=ylim;
    %ylimits=[0 ylimits(2)];
    ylim(ylimits);

    xlimits=xlim;
    %xtick = get(gca,'xtick');
    %set(gca,'xticklabel', []);

    text1ypos=0.9*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos=0.8*(max(ylimits)-min(ylimits))+min(ylimits);
    text1xpos=0.1*(max(xlimits)-min(xlimits))+min(xlimits);
    text2xpos=text1xpos;

    text1=sprintf('%s%.2f%s%.2f','y=',controlm,'x+',controlb);
    text(text1xpos,text1ypos,text1,'FontSize',insetfontsize,'Color','b');

    text2=sprintf('%s%.2f%s%.2f','y=',testm,'x+',testb);
    text(text2xpos,text2ypos,text2,'FontSize',insetfontsize,'Color','r');

    hold off;

    subplot(3,3,2); box on; hold on;
    ylabel('Number PDs','FontSize',labelfontsize,'FontWeight','b');
    controldatax = controlanalysis.somadiameter.values;
    controldatay = controlanalysis.numberprimarydendrites.values;
    scatter(controldatax,controldatay,'b.');
    testdatax    = testanalysis.somadiameter.values;
    testdatay    = testanalysis.numberprimarydendrites.values;
    scatter(testdatax,testdatay,'r.');
    [controlm,controlb,controlfitx,controlfity,controlr2] = linearfit(controldatax,controldatay,xlim);
    [testm,testb,testfitx,testfity,testr2]                = linearfit(testdatax,testdatay,xlim);
    plot(controlfitx,controlfity,'b');
    plot(testfitx,testfity,'r');

    ylimits=ylim;
    %ylimits=[0 ylimits(2)];
    ylim(ylimits);

    xlimits=xlim;
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);

    text1ypos=0.9*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos=0.8*(max(ylimits)-min(ylimits))+min(ylimits);
    text1xpos=0.1*(max(xlimits)-min(xlimits))+min(xlimits);
    text2xpos=text1xpos;

    text1=sprintf('%s%.2f%s%.2f','y=',controlm,'x+',controlb);
    text(text1xpos,text1ypos,text1,'FontSize',insetfontsize,'Color','b');

    text2=sprintf('%s%.2f%s%.2f','y=',testm,'x+',testb);
    text(text2xpos,text2ypos,text2,'FontSize',insetfontsize,'Color','r');

    hold off;

    subplot(3,3,5); box on; hold on;
    ylabel('Total PD Cyl Diam (\mum)','FontSize',labelfontsize,'FontWeight','b');
    controldatax = controlanalysis.somadiameter.values;
    controldatay = [controlanalysis.numberprimarydendrites.values].*[controlanalysis.primarydendrite.meancylindricaldiameter.values];
    scatter(controldatax,controldatay,'b.');
    testdatax    = testanalysis.somadiameter.values;
    testdatay    = [testanalysis.numberprimarydendrites.values].*[testanalysis.primarydendrite.meancylindricaldiameter.values];
    scatter(testdatax,testdatay,'r.');
    [controlm,controlb,controlfitx,controlfity,controlr2] = linearfit(controldatax,controldatay,xlim);
    [testm,testb,testfitx,testfity,testr2]                = linearfit(testdatax,testdatay,xlim);
    plot(controlfitx,controlfity,'b');
    plot(testfitx,testfity,'r');

    ylimits=ylim;
    %ylimits=[0 ylimits(2)];
    ylim(ylimits);

    xlimits=xlim;
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);

    text1ypos=0.9*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos=0.8*(max(ylimits)-min(ylimits))+min(ylimits);
    text1xpos=0.1*(max(xlimits)-min(xlimits))+min(xlimits);
    text2xpos=text1xpos;

    text1=sprintf('%s%.2f%s%.2f','y=',controlm,'x+',controlb);
    text(text1xpos,text1ypos,text1,'FontSize',insetfontsize,'Color','b');

    text2=sprintf('%s%.2f%s%.2f','y=',testm,'x+',testb);
    text(text2xpos,text2ypos,text2,'FontSize',insetfontsize,'Color','r');

    hold off;

    subplot(3,3,8); box on; hold on;
    ylabel('Mean PD Cyl Diam (\mum)','FontSize',labelfontsize,'FontWeight','b');
    controldatax = controlanalysis.somadiameter.values;
    controldatay = controlanalysis.primarydendrite.meancylindricaldiameter.values;
    scatter(controldatax,controldatay,'b.');
    testdatax    = testanalysis.somadiameter.values;
    testdatay    = testanalysis.primarydendrite.meancylindricaldiameter.values;
    scatter(testdatax,testdatay,'r.');
    [controlm,controlb,controlfitx,controlfity,controlr2] = linearfit(controldatax,controldatay,xlim);
    [testm,testb,testfitx,testfity,testr2]                = linearfit(testdatax,testdatay,xlim);
    plot(controlfitx,controlfity,'b');
    plot(testfitx,testfity,'r');

    ylimits=ylim;
    %ylimits=[0 ylimits(2)];
    ylim(ylimits);

    xlimits=xlim;
    %xtick = get(gca,'xtick');
    %set(gca,'xticklabel', []);

    text1ypos=0.9*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos=0.8*(max(ylimits)-min(ylimits))+min(ylimits);
    text1xpos=0.1*(max(xlimits)-min(xlimits))+min(xlimits);
    text2xpos=text1xpos;

    text1=sprintf('%s%.2f%s%.2f','y=',controlm,'x+',controlb);
    text(text1xpos,text1ypos,text1,'FontSize',insetfontsize,'Color','b');

    text2=sprintf('%s%.2f%s%.2f','y=',testm,'x+',testb);
    text(text2xpos,text2ypos,text2,'FontSize',insetfontsize,'Color','r');

    hold off;

    subplot(3,3,3); box on; hold on;
    ylabel('Total Length (10^3 \mum)','FontSize',labelfontsize,'FontWeight','b');
    controldatax = controlanalysis.somadiameter.values;
    controldatay = controlanalysis.totallength.values;
    scatter(controldatax,controldatay,'b.');
    testdatax    = testanalysis.somadiameter.values;
    testdatay    = testanalysis.totallength.values/1000;
    scatter(testdatax,testdatay,'r.');
    [controlm,controlb,controlfitx,controlfity,controlr2] = linearfit(controldatax,controldatay,xlim);
    [testm,testb,testfitx,testfity,testr2]                = linearfit(testdatax,testdatay,xlim);
    plot(controlfitx,controlfity,'b');
    plot(testfitx,testfity,'r');

    ylimits=ylim;
    %ylimits=[0 ylimits(2)];
    ylim(ylimits);

    xlimits=xlim;
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);

    text1ypos=0.9*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos=0.8*(max(ylimits)-min(ylimits))+min(ylimits);
    text1xpos=0.1*(max(xlimits)-min(xlimits))+min(xlimits);
    text2xpos=text1xpos;

    text1=sprintf('%s%.2f%s%.2f','y=',controlm,'x+',controlb);
    text(text1xpos,text1ypos,text1,'FontSize',insetfontsize,'Color','b');

    text2=sprintf('%s%.2f%s%.2f','y=',testm,'x+',testb);
    text(text2xpos,text2ypos,text2,'FontSize',insetfontsize,'Color','r');

    hold off;

    subplot(3,3,6); box on; hold on;
    ylabel('Total Surf Area (10^3 \mum^2)','FontSize',labelfontsize,'FontWeight','b');
    controldatax = controlanalysis.somadiameter.values;
    controldatay = controlanalysis.totalsurfacearea.values;
    scatter(controldatax,controldatay,'b.');
    testdatax    = testanalysis.somadiameter.values;
    testdatay    = testanalysis.totalsurfacearea.values/1000;
    scatter(testdatax,testdatay,'r.');
    [controlm,controlb,controlfitx,controlfity,controlr2] = linearfit(controldatax,controldatay,xlim);
    [testm,testb,testfitx,testfity,testr2]                = linearfit(testdatax,testdatay,xlim);
    plot(controlfitx,controlfity,'b');
    plot(testfitx,testfity,'r');

    ylimits=ylim;
    %ylimits=[0 ylimits(2)];
    ylim(ylimits);

    xlimits=xlim;
    xtick = get(gca,'xtick');
    set(gca,'xticklabel', []);

    text1ypos=0.9*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos=0.8*(max(ylimits)-min(ylimits))+min(ylimits);
    text1xpos=0.1*(max(xlimits)-min(xlimits))+min(xlimits);
    text2xpos=text1xpos;

    text1=sprintf('%s%.2f%s%.2f','y=',controlm,'x+',controlb);
    text(text1xpos,text1ypos,text1,'FontSize',insetfontsize,'Color','b');

    text2=sprintf('%s%.2f%s%.2f','y=',testm,'x+',testb);
    text(text2xpos,text2ypos,text2,'FontSize',insetfontsize,'Color','r');

    hold off;

    subplot(3,3,9); box on; hold on;
    ylabel('Total Vol (10^3 \mum^3)','FontSize',labelfontsize,'FontWeight','b');
    controldatax = controlanalysis.somadiameter.values;
    controldatay = controlanalysis.totalvolume.values;
    scatter(controldatax,controldatay,'b.');
    testdatax    = testanalysis.somadiameter.values;
    testdatay    = testanalysis.totalvolume.values/1000;
    scatter(testdatax,testdatay,'r.');
    [controlm,controlb,controlfitx,controlfity,controlr2] = linearfit(controldatax,controldatay,xlim);
    [testm,testb,testfitx,testfity,testr2]                = linearfit(testdatax,testdatay,xlim);
    plot(controlfitx,controlfity,'b');
    plot(testfitx,testfity,'r');

    ylimits=ylim;
    %ylimits=[0 ylimits(2)];
    ylim(ylimits);

    xlimits=xlim;
    %xtick = get(gca,'xtick');
    %set(gca,'xticklabel', []);

    text1ypos=0.9*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos=0.8*(max(ylimits)-min(ylimits))+min(ylimits);
    text1xpos=0.1*(max(xlimits)-min(xlimits))+min(xlimits);
    text2xpos=text1xpos;

    text1=sprintf('%s%.2f%s%.2f','y=',controlm,'x+',controlb);
    text(text1xpos,text1ypos,text1,'FontSize',insetfontsize,'Color','b');

    text2=sprintf('%s%.2f%s%.2f','y=',testm,'x+',testb);
    text(text2xpos,text2ypos,text2,'FontSize',insetfontsize,'Color','r');

    hold off;

    %subplotspace('horizontal',-20);
    %subplotspace('vertical',-20);

    [ax,h1]=suplabel('Soma Diameter (\mum)');
    [ax,h3]=suplabel('Comparison of Morphometrics versus Soma Diameter'  ,'t');
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

    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'Soma_Diameter_Comparison_Figure');
    print('-dmeta',filename);
    saveas(gcf,filename,'fig');

end
 
 
 
 
 
 