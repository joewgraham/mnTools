function chendiameterfigures(controlanalysis,testanalysis)


labelfontsize = 12;
insetfontsize = 10;

figure;   

subplot(3,1,1);hold on;

controldatax   = controlanalysis.pathlength.meandiameter.mean;
testdatax      = [testanalysis.pathlength.meandiameter.mean];

ylabel('Rall Ratio','FontSize',labelfontsize,'FontWeight','b');
xlabel('Mean Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');

controldatay   = controlanalysis.pathlength.rallratio.mean;
testdatay      = [testanalysis.pathlength.rallratio.mean];

plot(controlanalysis.pathlength.meandiameter.mean,controlanalysis.pathlength.rallratio.mean,'bo',[testanalysis.pathlength.meandiameter.mean],[testanalysis.pathlength.rallratio.mean],'ro');
    
[controla,controlb,controlfitx,controlfity,controlr2] = powerfit(controldatax,controldatay,xlim);
[testa,testb,testfitx,testfity,testr2] = powerfit(testdatax,testdatay,xlim);

plot(controlfitx,controlfity,'b-',testfitx,testfity,'r-');

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


subplot(3,1,2);hold on;

controldatax = controlanalysis.branchorder.meancylindricaldiameter.mean;
testdatax    = [testanalysis.branchorder.cylindricaldiameter.mean];

ylabel('Branch Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
xlabel('Mean Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');

controldatay = controlanalysis.branchorder.meanlength.mean;
testdatay    = [testanalysis.branchorder.length.mean];

plot(controlanalysis.branchorder.meancylindricaldiameter.mean,controlanalysis.branchorder.meanlength.mean,'bo',[testanalysis.branchorder.cylindricaldiameter.mean],[testanalysis.branchorder.length.mean],'ro');

[controla,controlb,controlfitx,controlfity,controlr2] = powerfit(controldatax,controldatay,xlim);
[testa,testb,testfitx,testfity,testr2] = powerfit(testdatax,testdatay,xlim);

plot(controlfitx,controlfity,'b-',testfitx,testfity,'r-');

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
         
hold off


subplot(3,1,3);hold on;

controldatax = controlanalysis.branchorder.meancylindricaldiameter.mean;
testdatax    = [testanalysis.branchorder.cylindricaldiameter.mean];

ylabel('Taper Rate','FontSize',labelfontsize,'FontWeight','b');
xlabel('Mean Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');

controldatay = controlanalysis.branchorder.meantaperrate.mean;
testdatay    = [testanalysis.branchorder.taperrate.mean];

plot(controlanalysis.branchorder.meancylindricaldiameter.mean,controlanalysis.branchorder.meantaperrate.mean,'bo',[testanalysis.branchorder.cylindricaldiameter.mean],[testanalysis.branchorder.taperrate.mean],'ro');

[controla,controlb,controlfitx,controlfity,controlr2] = powerfit(controldatax,controldatay,xlim);
[testa,testb,testfitx,testfity,testr2] = powerfit(testdatax,testdatay,xlim);

plot(controlfitx,controlfity,'b-',testfitx,testfity,'r-');

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

    text1=sprintf('%s%.6f%s%.2f%s','y=',controla,'x^{',controlb,'}');
    text(text1xpos,text1ypos,text1,'FontSize',insetfontsize,'Color','b');

    text2=sprintf('%s%.6f%s%.2f%s','y=',testa,'x^{',testb,'}');
    text(text2xpos,text2ypos,text2,'FontSize',insetfontsize,'Color','r');
         
hold off
         
         
%subplotspace('horizontal',-20);
subplotspace('vertical',-10);

%[ax,h1]=suplabel('Branch Order');
[ax,h3]=suplabel('Comparison of Morphometrics versus Local Diameter'  ,'t');
% set(h1,'FontSize',15);
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

filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'Local_Diameter_Comparison_Figure');
print('-dmeta',filename);
saveas(gcf,filename,'fig');