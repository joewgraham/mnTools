function inputparameterfigures(controlanalysis,testanalysis)

titlefontsize = 14;
labelfontsize = 7;
axesfontsize  = 5;
insetfontsize = 6;


indbluemarkersize  = 7;
indgreenmarkersize = 3;
indredmarkersize   = 5;

bluemarkersize    = 10;
greenmarkersize   = 6;
redmarkersize     = 8;
cyanmarkersize    = 8;
yellowmarkersize  = 4;
magentamarkersize = 6;


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
if exist('inputparameters','dir')==7
    cd('inputparameters');
else
    mkdir('inputparameters');
    cd('inputparameters');
end

    
% Soma Diameter

    figure; hold on;
    ylabel('Number of Motoneurons','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Soma Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('1: Soma Diameter','FontSize',titlefontsize,'FontWeight','b');
    [totaldata xvalues] = hist([controlanalysis.somadiameter.values testanalysis.somadiameter.values]);
    hist(controlanalysis.somadiameter.values,xvalues);
    hist(testanalysis.somadiameter.values,xvalues);
    legendhandle = gca;
    h = findobj(gca,'Type','patch');
    set(h(2),'FaceColor','b','EdgeColor','b','FaceAlpha',0.5,'EdgeAlpha',0.5);
    set(h(1),'FaceColor','r','EdgeColor','r','FaceAlpha',0.5,'EdgeAlpha',0.5);
    set(gca,'FontSize',axesfontsize); box on; hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
      
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('Mean: %f',controlanalysis.somadiameter.mean);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('SD: %f',controlanalysis.somadiameter.std);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('Skew: %f',controlanalysis.somadiameter.skew);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
        text5=sprintf('Kurt: %f',controlanalysis.somadiameter.kurt);
        text(textxpos2,text5ypos,text5,'FontSize',insetfontsize,'Color','b');
    text6=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('Mean: %f',testanalysis.somadiameter.mean);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('SD: %f',testanalysis.somadiameter.std);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        text9=sprintf('Skew: %f',testanalysis.somadiameter.skew);
        text(textxpos2,text9ypos,text9,'FontSize',insetfontsize,'Color','r');
        text10=sprintf('Kurt: %f',testanalysis.somadiameter.kurt);
        text(textxpos2,text10ypos,text10,'FontSize',insetfontsize,'Color','r');
  
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'01_Soma_Diameter');
    print('-djpeg',filename); close all;

    
% Number Primary Dendrites

    figure; hold on;
    ylabel('Number of Motoneurons','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Number of Primary Dendrites','FontSize',labelfontsize,'FontWeight','b');
    title('2: Number of Primary Dendrites','FontSize',titlefontsize,'FontWeight','b');
    [totaldata xvalues] = hist([controlanalysis.numberprimarydendrites.values testanalysis.numberprimarydendrites.values]);
    hist(controlanalysis.numberprimarydendrites.values,xvalues);
    hist(testanalysis.numberprimarydendrites.values,xvalues);
    legendhandle = gca;
    h = findobj(gca,'Type','patch');
    set(h(2),'FaceColor','b','EdgeColor','b','FaceAlpha',0.5,'EdgeAlpha',0.5);
    set(h(1),'FaceColor','r','EdgeColor','r','FaceAlpha',0.5,'EdgeAlpha',0.5);
    set(gca,'FontSize',axesfontsize); box on; hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
       
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('Mean: %f',controlanalysis.numberprimarydendrites.mean);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('SD: %f',controlanalysis.numberprimarydendrites.std);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('Skew: %f',controlanalysis.numberprimarydendrites.skew);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
        text5=sprintf('Kurt: %f',controlanalysis.numberprimarydendrites.kurt);
        text(textxpos2,text5ypos,text5,'FontSize',insetfontsize,'Color','b');
    text6=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('Mean: %f',testanalysis.numberprimarydendrites.mean);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('SD: %f',testanalysis.numberprimarydendrites.std);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        text9=sprintf('Skew: %f',testanalysis.numberprimarydendrites.skew);
        text(textxpos2,text9ypos,text9,'FontSize',insetfontsize,'Color','r');
        text10=sprintf('Kurt: %f',testanalysis.numberprimarydendrites.kurt);
        text(textxpos2,text10ypos,text10,'FontSize',insetfontsize,'Color','r');
  
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'02_Number_PDs');
    print('-djpeg',filename); close all;

    
% Primary Dendrite Diameters

    figure; hold on;
    ylabel('Number of Primary Dendrites','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Primary Dendrite Proximal Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('3: Primary Dendrite Proximal Diameter','FontSize',titlefontsize,'FontWeight','b');
    [totaldata xvalues] = hist([controlanalysis.primarydendrite.proximaldiameter.values testanalysis.primarydendrite.proximaldiameter.values]);
    hist(controlanalysis.primarydendrite.proximaldiameter.values,xvalues);
    hist(testanalysis.primarydendrite.proximaldiameter.values,xvalues);
    legendhandle = gca;
    h = findobj(gca,'Type','patch');
    set(h(2),'FaceColor','b','EdgeColor','b','FaceAlpha',0.5,'EdgeAlpha',0.5);
    set(h(1),'FaceColor','r','EdgeColor','r','FaceAlpha',0.5,'EdgeAlpha',0.5);
    set(gca,'FontSize',axesfontsize); box on; hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('Mean: %f',controlanalysis.primarydendrite.proximaldiameter.mean);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('SD: %f',controlanalysis.primarydendrite.proximaldiameter.std);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('Skew: %f',controlanalysis.primarydendrite.proximaldiameter.skew);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
        text5=sprintf('Kurt: %f',controlanalysis.primarydendrite.proximaldiameter.kurt);
        text(textxpos2,text5ypos,text5,'FontSize',insetfontsize,'Color','b');
    text6=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('Mean: %f',testanalysis.primarydendrite.proximaldiameter.mean);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('SD: %f',testanalysis.primarydendrite.proximaldiameter.std);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        text9=sprintf('Skew: %f',testanalysis.primarydendrite.proximaldiameter.skew);
        text(textxpos2,text9ypos,text9,'FontSize',insetfontsize,'Color','r');
        text10=sprintf('Kurt: %f',testanalysis.primarydendrite.proximaldiameter.kurt);
        text(textxpos2,text10ypos,text10,'FontSize',insetfontsize,'Color','r');
  
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'03_PD_Diameter');
    print('-djpeg',filename); close all;
    

% Branch Bifurcation Probabilities

    x = [controlanalysis.diameter.diameter]';
    y1 = [controlanalysis.diameter.numberterminations.total]';
    y2 = [controlanalysis.diameter.numberbifurcations.total]';
    n = ([controlanalysis.diameter.numberbifurcations.total] + [controlanalysis.diameter.numberterminations.total])';

    [b1,r1] = glmfit(x,[y1 n],'binomial','link','logit');
    y1fit = glmval(b1,x,'logit','size',n);

    [b2,r2] = glmfit(x,[y2 n],'binomial','link','logit');
    y2fit = glmval(b2,x,'logit','size',n);
    
    x2 = [testanalysis.diameter.diameter]';
    y12 = [testanalysis.diameter.numberterminations.total]';
    y22 = [testanalysis.diameter.numberbifurcations.total]';
    n2 = ([testanalysis.diameter.numberbifurcations.total] + [testanalysis.diameter.numberterminations.total])';

    [b12,r12] = glmfit(x2,[y12 n2],'binomial','link','logit');
    y12fit = glmval(b12,x2,'logit','size',n2);

    [b22,r22] = glmfit(x2,[y22 n2],'binomial','link','logit');
    y22fit = glmval(b22,x2,'logit','size',n2);

    figure;
    
    total = y2 + y1;
    semilogx(x,y2fit./n,'-b','LineWidth',2);
    hold on;
    total2 = y22 + y12;
    semilogx(x2,y22fit./n2,'-r','LineWidth',2);
    
    semilogx(x,y2./total,'sg','MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    semilogx(x2,y22./total2,'sy','MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylabel('Bifurcation Probability','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Branch Proximal Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('4.1: Branch Bifurcation Probability','FontSize',titlefontsize,'FontWeight','b'); 
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
       
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 2*min(xlimits);
    textxpos2  = 3*min(xlimits);
%     textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
%     textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
      
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('m: %f',b2(2));
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',b2(1));
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',r2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','r');    
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',b22(1));
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',b22(2));
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',r22^2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
    
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'041_Branch_Bif_Prob');
    print('-djpeg',filename); close all;
    
        
% Piece Bifurcation Probabilities by Diameter - Exponential

    figure;
    controldatax = [controlanalysis.bifurcation.diameter.diameter];
    controldatay = [controlanalysis.bifurcation.diameter.bifurcationprobability.volume];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax = [testanalysis.bifurcation.diameter.diameter];
    testdatay = [testanalysis.bifurcation.diameter.bifurcationprobability.volume];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    ylimits = ylim; xlimits = xlim;
    [controla,controlb,controlfitx,controlfity,controlfitr2]=exponentialfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=exponentialfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r');
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Piece Bifurcation Probability / Volume','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('4b.1: Piece Bifurcation Probability by Diameter - Exponential','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.125*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.150*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
      
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testa);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
  
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'04b1_Growing_Bif_Prob_Diam_Exp');
    print('-djpeg',filename); close all;
    
       
% Piece Termination Probabilities by Diameter - Exponential

    figure;
    controldatax = [controlanalysis.termination.diameter.diameter];
    controldatay = [controlanalysis.termination.diameter.terminationprobability.volume];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax = [testanalysis.termination.diameter.diameter];
    testdatay = [testanalysis.termination.diameter.terminationprobability.volume];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim;
    [controla,controlb,controlfitx,controlfity,controlfitr2]=exponentialfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=exponentialfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r');
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Piece Termination Probability / Volume','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('4t.1: Piece Termination Probability by Diameter - Exponential','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
       
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.125*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.150*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
     
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testa);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
       
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'04t1_Growing_Term_Prob_Diam_Exp');
    print('-djpeg',filename); close all;    
    
       
% Piece Bifurcation Probabilities by Diameter - Exponential Semi-Log Y

    figure;
    controldatax = [controlanalysis.bifurcation.diameter.diameter];
    controldatay = [controlanalysis.bifurcation.diameter.bifurcationprobability.volume];
    semilogy(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax = [testanalysis.bifurcation.diameter.diameter];
    testdatay = [testanalysis.bifurcation.diameter.bifurcationprobability.volume];
    semilogy(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    ylimits = ylim; xlimits = xlim;
    [controla,controlb,controlfitx,controlfity,controlfitr2]=exponentialfit(controldatax,controldatay,xlim);
    semilogy(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=exponentialfit(testdatax,testdatay,xlim);
    semilogy(testfitx,testfity,'r');
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Piece Bifurcation Probability / Volume','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('4b.2: Piece Bifurcation Probability by Diameter - Exponential (Semi-Log Y)','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.125*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.150*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
%     text1=sprintf('%s',controlanalysis.inputfilename);
%     text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
%         text2=sprintf('a: %f',controla);
%         text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
%         text3=sprintf('b: %f',controlb);
%         text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
%         text4=sprintf('r^2: %f',controlfitr2);
%         text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
%     text5=sprintf('%s',testanalysis.inputfilename);
%     text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
%         text6=sprintf('a: %f',testa);
%         text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
%         text7=sprintf('b: %f',testb);
%         text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
%         text8=sprintf('r^2: %f',testfitr2);
%         text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');

    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'04b2_Growing_Bif_Prob_Diam_Exp_SemiLog');
    print('-djpeg',filename); close all;
    
       
% Piece Termination Probabilities by Diameter - Exponential Semi-Log Y

    figure;
    controldatax = [controlanalysis.termination.diameter.diameter];
    controldatay = [controlanalysis.termination.diameter.terminationprobability.volume];
    semilogy(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax = [testanalysis.termination.diameter.diameter];
    testdatay = [testanalysis.termination.diameter.terminationprobability.volume];
    semilogy(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim;
    [controla,controlb,controlfitx,controlfity,controlfitr2]=exponentialfit(controldatax,controldatay,xlim);
    semilogy(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=exponentialfit(testdatax,testdatay,xlim);
    semilogy(testfitx,testfity,'r');
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Piece Termination Probability / Volume','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('4t.2: Piece Termination Probability by Diameter - Exponential (Semi-Log Y)','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.125*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.150*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
        
%     text1=sprintf('%s',controlanalysis.inputfilename);
%     text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
%         text2=sprintf('a: %f',controla);
%         text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
%         text3=sprintf('b: %f',controlb);
%         text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
%         text4=sprintf('r^2: %f',controlfitr2);
%         text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
%     text5=sprintf('%s',testanalysis.inputfilename);
%     text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
%         text6=sprintf('a: %f',testa);
%         text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
%         text7=sprintf('b: %f',testb);
%         text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
%         text8=sprintf('r^2: %f',testfitr2);
%         text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');

    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'04t2_Growing_Term_Prob_Diam_Exp_SemiLog');
    print('-djpeg',filename); close all;    
    
       
% Piece Bifurcation Probabilities by Diameter - Power

    figure;
    controldatax = [controlanalysis.bifurcation.diameter.diameter];
    controldatay = [controlanalysis.bifurcation.diameter.bifurcationprobability.volume];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax = [testanalysis.bifurcation.diameter.diameter];
    testdatay = [testanalysis.bifurcation.diameter.bifurcationprobability.volume];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    ylimits = ylim; xlimits = xlim;
    [controla,controlb,controlfitx,controlfity,controlfitr2]=powerfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=powerfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r');
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Piece Bifurcation Probability / Volume','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('4b.3: Piece Bifurcation Probability by Diameter - Power','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
        
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.125*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.150*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
        
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testa);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
  
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'04b3_Growing_Bif_Prob_Diam_Pow');
    print('-djpeg',filename); close all;
    
      
% Piece Termination Probabilities by Diameter - Power

    figure;
    controldatax = [controlanalysis.termination.diameter.diameter];
    controldatay = [controlanalysis.termination.diameter.terminationprobability.volume];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax = [testanalysis.termination.diameter.diameter];
    testdatay = [testanalysis.termination.diameter.terminationprobability.volume];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim;
    [controla,controlb,controlfitx,controlfity,controlfitr2]=powerfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=powerfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r');
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Piece Termination Probability / Volume','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('4t.3: Piece Termination Probability by Diameter - Power','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
      
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.125*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.150*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
        
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testa);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
       
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'04t3_Growing_Term_Prob_Diam_Pow');
    print('-djpeg',filename); close all;
   
    
% Piece Bifurcation Probabilities by Path Length - Exponential

    figure;
    controldatax = [controlanalysis.bifurcation.pathlength.pathlength];
    controldatay = [controlanalysis.bifurcation.pathlength.bifurcationprobability.volume];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax = [testanalysis.bifurcation.pathlength.pathlength];
    testdatay = [testanalysis.bifurcation.pathlength.bifurcationprobability.volume];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    ylimits = ylim; xlimits = xlim;
    [controla,controlb,controlfitx,controlfity,controlfitr2]=exponentialfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=exponentialfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r');
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Piece Bifurcation Probability / Volume ','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('4b.5: Piece Bifurcation Probability by Path Length - Exponential','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
       
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.125*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.150*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
        
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testa);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');

    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'04b5_Growing_Bif_Prob_PathLength_Exp');
    print('-djpeg',filename); close all;
    
    
% Piece Termination Probabilities by Path Length - Exponential

    figure;
    controldatax = [controlanalysis.termination.pathlength.pathlength];
    controldatay = [controlanalysis.termination.pathlength.terminationprobability.volume];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax = [testanalysis.termination.pathlength.pathlength];
    testdatay = [testanalysis.termination.pathlength.terminationprobability.volume];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim;
    [controla,controlb,controlfitx,controlfity,controlfitr2]=exponentialfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=exponentialfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r');
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Piece Termination Probability / Volume','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('4t.5: Piece Termination Probability by Path Length - Exponential','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
       
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.125*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.150*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
      
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testa);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
       
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'04t5_Growing_Term_Prob_PathLength_Exp');
    print('-djpeg',filename); close all;    
    
       
% Piece Bifurcation Probabilities by Path Length - Power

    figure;
    controldatax = [controlanalysis.bifurcation.pathlength.pathlength];
    controldatay = [controlanalysis.bifurcation.pathlength.bifurcationprobability.volume];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax = [testanalysis.bifurcation.pathlength.pathlength];
    testdatay = [testanalysis.bifurcation.pathlength.bifurcationprobability.volume];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    ylimits = ylim; xlimits = xlim;
    [controla,controlb,controlfitx,controlfity,controlfitr2]=powerfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=powerfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r');
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Piece Bifurcation Probability / Volume','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('4b.6: Piece Bifurcation Probability by Path Length - Power','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
       
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.125*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.150*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testa);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
 
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'04b6_Growing_Bif_Prob_PathLength_Pow');
    print('-djpeg',filename); close all;
   
    
% Piece Termination Probabilities by Path Length - Power

    figure;
    controldatax = [controlanalysis.termination.pathlength.pathlength];
    controldatay = [controlanalysis.termination.pathlength.terminationprobability.volume];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax = [testanalysis.termination.pathlength.pathlength];
    testdatay = [testanalysis.termination.pathlength.terminationprobability.volume];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    ylimits = ylim; xlimits = xlim;
    [controla,controlb,controlfitx,controlfity,controlfitr2]=powerfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=powerfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r');
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Piece Termination Probability / Volume','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('4t.6: Piece Termination Probability by Path Length - Power','FontSize',titlefontsize,'FontWeight','b');    
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
       
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.125*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.150*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testa);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
     
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'04t6_Growing_Term_Prob_PathLength_Pow');
    print('-djpeg',filename); close all;    
    
       
% Piece Bifurcation Probabilities by Path Length - Sigmoidal

    figure;
    controldatax = [controlanalysis.bifurcation.pathlength.pathlength];
    controldatay = [controlanalysis.bifurcation.pathlength.bifurcationprobability.volume];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax = [testanalysis.bifurcation.pathlength.pathlength];
    testdatay = [testanalysis.bifurcation.pathlength.bifurcationprobability.volume];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    ylimits = ylim; xlimits = xlim;
    [controlminasym,controlmaxasym,controlhalfmax,controlsteepness,controlfitx,controlfity,controlfitr2]=sigmoidfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testminasym,testmaxasym,testhalfmax,teststeepness,testfitx,testfity,testfitr2]=sigmoidfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r');
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Piece Bifurcation Probability / Volume','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('4b.7: Piece Bifurcation Probability by Path Length - Sigmoid','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
       
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    text11ypos = 0.725*(max(ylimits)-min(ylimits))+min(ylimits);
    text12ypos = 0.700*(max(ylimits)-min(ylimits))+min(ylimits);
        
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('minasym: %f',controlminasym);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('maxasym: %f',controlmaxasym);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('halfmax: %f',controlhalfmax);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
        text5=sprintf('steepness: %f',controlsteepness);
        text(textxpos2,text5ypos,text5,'FontSize',insetfontsize,'Color','b');
        text6=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','b');
    text7=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('minasym: %f',testminasym);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        text9=sprintf('maxasym: %f',testmaxasym);
        text(textxpos2,text9ypos,text9,'FontSize',insetfontsize,'Color','r');
        text10=sprintf('halfmax: %f',testhalfmax);
        text(textxpos2,text10ypos,text10,'FontSize',insetfontsize,'Color','r');
        text11=sprintf('steepness: %f',teststeepness);
        text(textxpos2,text11ypos,text11,'FontSize',insetfontsize,'Color','r');     
        text12=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text12ypos,text12,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'04b7_Growing_Bif_Prob_PathLength_Sig');
    print('-djpeg',filename); close all;
    
     
% Piece Termination Probabilities by Path Length - Sigmoidal

    figure;
    controldatax = [controlanalysis.termination.pathlength.pathlength];
    controldatay = [controlanalysis.termination.pathlength.terminationprobability.volume];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax = [testanalysis.termination.pathlength.pathlength];
    testdatay = [testanalysis.termination.pathlength.terminationprobability.volume];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    ylimits = ylim; xlimits = xlim;
    [controlminasym,controlmaxasym,controlhalfmax,controlsteepness,controlfitx,controlfity,controlfitr2]=sigmoidfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testminasym,testmaxasym,testhalfmax,teststeepness,testfitx,testfity,testfitr2]=sigmoidfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r');
    ylim(ylimits); xlim(xlimits);
       
    ylabel('Piece Termination Probability / Volume','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('4t.7 Piece Termination Probability by Path Length - Sigmoid','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
       
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    text11ypos = 0.725*(max(ylimits)-min(ylimits))+min(ylimits);
    text12ypos = 0.700*(max(ylimits)-min(ylimits))+min(ylimits);
    
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('minasym: %f',controlminasym);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('maxasym: %f',controlmaxasym);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('halfmax: %f',controlhalfmax);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
        text5=sprintf('steepness: %f',controlsteepness);
        text(textxpos2,text5ypos,text5,'FontSize',insetfontsize,'Color','b');
        text6=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','b');
    text7=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('minasym: %f',testminasym);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        text9=sprintf('maxasym: %f',testmaxasym);
        text(textxpos2,text9ypos,text9,'FontSize',insetfontsize,'Color','r');
        text10=sprintf('halfmax: %f',testhalfmax);
        text(textxpos2,text10ypos,text10,'FontSize',insetfontsize,'Color','r');
        text11=sprintf('steepness: %f',teststeepness);
        text(textxpos2,text11ypos,text11,'FontSize',insetfontsize,'Color','r');     
        text12=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text12ypos,text12,'FontSize',insetfontsize,'Color','r');
   
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'04t7_Growing_Term_Prob_PathLength_Sig');
    print('-djpeg',filename); close all;       
    
      
% Piece Bifurcation Probabilities by Diameter - Log-Log

    figure;
    controldatax = [controlanalysis.bifurcation.diameter.diameter];
    controldatay = [controlanalysis.bifurcation.diameter.bifurcationprobability.volume];
    loglog(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax = [testanalysis.bifurcation.diameter.diameter];
    testdatay = [testanalysis.bifurcation.diameter.bifurcationprobability.volume];
    loglog(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    ylimits = ylim; xlimits = xlim;
    [controla,controlb,controlfitx,controlfity,controlfitr2]=powerfit(controldatax,controldatay,xlim);
    loglog(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=powerfit(testdatax,testdatay,xlim);
    loglog(testfitx,testfity,'r');
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Piece Bifurcation Probability / Volume','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('4b.4: Piece Bifurcation Probability by Diameter (Log-Log)','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
       
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.125*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.150*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
       
%     text1=sprintf('%s',controlanalysis.inputfilename);
%     text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
%         text2=sprintf('a: %f',controla);
%         text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
%         text3=sprintf('b: %f',controlb);
%         text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
%         text4=sprintf('r^2: %f',controlfitr2);
%         text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
%     text5=sprintf('%s',testanalysis.inputfilename);
%     text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
%         text6=sprintf('a: %f',testa);
%         text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
%         text7=sprintf('b: %f',testb);
%         text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
%         text8=sprintf('r^2: %f',testfitr2);
%         text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');

    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'04b4_Growing_Bif_Prob_LogLog');
    print('-djpeg',filename); close all;
    
     
% Piece Termination Probabilities Log-Log

    figure;
    controldatax = [controlanalysis.termination.diameter.diameter];
    controldatay = [controlanalysis.termination.diameter.terminationprobability.volume];
    loglog(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax = [testanalysis.termination.diameter.diameter];
    testdatay = [testanalysis.termination.diameter.terminationprobability.volume];
    loglog(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim;
    [controla,controlb,controlfitx,controlfity,controlfitr2]=powerfit(controldatax,controldatay,xlim);
    loglog(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=powerfit(testdatax,testdatay,xlim);
    loglog(testfitx,testfity,'r');
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Piece Termination Probability by Volume','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('4t.4: Piece Termination Probability by Diameter (Log-Log)','FontSize',titlefontsize,'FontWeight','b');    
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
      
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.125*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.150*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
        
%     text1=sprintf('%s',controlanalysis.inputfilename);
%     text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
%         text2=sprintf('a: %f',controla);
%         text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
%         text3=sprintf('b: %f',controlb);
%         text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
%         text4=sprintf('r^2: %f',controlfitr2);
%         text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
%     text5=sprintf('%s',testanalysis.inputfilename);
%     text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
%         text6=sprintf('a: %f',testa);
%         text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
%         text7=sprintf('b: %f',testb);
%         text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
%         text8=sprintf('r^2: %f',testfitr2);
%         text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');

    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'04t4_Growing_Term_Prob_LogLog');
    print('-djpeg',filename); close all; 
    

% Bifurcation Taper Rate - Linear 

    figure;
    controldatax   = [controlanalysis.bifurcation.diameter.diameter];
    controldatay   = [controlanalysis.bifurcation.diameter.taperrate.mean];
    controldatastd = [controlanalysis.bifurcation.diameter.taperrate.std];
    errorbar(controldatax,controldatay,controldatastd/2,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.diameter.diameter];
    testdatay   = [testanalysis.bifurcation.diameter.taperrate.mean];
    testdatastd = [testanalysis.bifurcation.diameter.taperrate.std];
    errorbar(testdatax,testdatay,testdatastd/2,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim;
    [controlm,controlb,controlfitx,controlfity,controlfitr2]=linearfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testm,testb,testfitx,testfity,testfitr2]=linearfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r');
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Taper Rate (Mean)','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('5.1: Mean Bifurcating Branch Taper Rate - Linear','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
       
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('m: %f',controlm);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('m: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
 
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'051_Mean_Bif_Taper_Lin');
    print('-djpeg',filename); close all;
    
    
% Bifurcation Taper Rate - Exponential 

    figure;
    controldatax   = [controlanalysis.bifurcation.diameter.diameter];
    controldatay   = [controlanalysis.bifurcation.diameter.taperrate.mean];
    controldatastd = [controlanalysis.bifurcation.diameter.taperrate.std];
    errorbar(controldatax,controldatay,controldatastd/2,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.diameter.diameter];
    testdatay   = [testanalysis.bifurcation.diameter.taperrate.mean];
    testdatastd = [testanalysis.bifurcation.diameter.taperrate.std];
    errorbar(testdatax,testdatay,testdatastd/2,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim;
    [controla,controlb,controlfitx,controlfity,controlfitr2]=exponentialfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=exponentialfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r');
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Taper Rate (Mean)','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('5.2: Mean Bifurcating Branch Taper Rate - Exponential','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
        
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
  
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'052_Mean_Bif_Taper_Exp');
    print('-djpeg',filename); close all;
    
      
% Bifurcation Taper Rate - Power 

    figure;   
    controldatax   = [controlanalysis.bifurcation.diameter.diameter];
    controldatay   = [controlanalysis.bifurcation.diameter.taperrate.mean];
    controldatastd = [controlanalysis.bifurcation.diameter.taperrate.std];
    errorbar(controldatax,controldatay,controldatastd/2,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.diameter.diameter];
    testdatay   = [testanalysis.bifurcation.diameter.taperrate.mean];
    testdatastd = [testanalysis.bifurcation.diameter.taperrate.std];
    errorbar(testdatax,testdatay,testdatastd/2,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim;
    [controla,controlb,controlfitx,controlfity,controlfitr2]=powerfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=powerfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r');
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Taper Rate (Mean)','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('5.3: Mean Bifurcating Branch Taper Rate - Power','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
     
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'053_Mean_Bif_Taper_Pow');
    print('-djpeg',filename); close all;
    
    
% Bifurcation Taper Rate - Sigmoidal 

    figure;   
    controldatax   = [controlanalysis.bifurcation.diameter.diameter];
    controldatay   = [controlanalysis.bifurcation.diameter.taperrate.mean];
    controldatastd = [controlanalysis.bifurcation.diameter.taperrate.std];
    errorbar(controldatax,controldatay,controldatastd/2,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.diameter.diameter];
    testdatay   = [testanalysis.bifurcation.diameter.taperrate.mean];
    testdatastd = [testanalysis.bifurcation.diameter.taperrate.std];
    errorbar(testdatax,testdatay,testdatastd/2,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim;
    [controlminasym,controlmaxasym,controlhalfmax,controlsteepness,controlfitx,controlfity,controlfitr2]=sigmoidfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=powerfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r');
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Taper Rate (Mean)','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('5.4: Mean Bifurcating Branch Taper Rate - Sigmoidal','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    text11ypos = 0.725*(max(ylimits)-min(ylimits))+min(ylimits);
    text12ypos = 0.700*(max(ylimits)-min(ylimits))+min(ylimits);
       
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('minasym: %f',controlminasym);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('maxasym: %f',controlmaxasym);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('halfmax: %f',controlhalfmax);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
        text5=sprintf('steepness: %f',controlsteepness);
        text(textxpos2,text5ypos,text5,'FontSize',insetfontsize,'Color','b');
        text6=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','b');
    text7=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('halfmax: %f',testhalfmax);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        text9=sprintf('steepness: %f',teststeepness);
        text(textxpos2,text9ypos,text9,'FontSize',insetfontsize,'Color','r');
        text10=sprintf('maxasym: %f',testmaxasym);
        text(textxpos2,text10ypos,text10,'FontSize',insetfontsize,'Color','r');
        text11=sprintf('minasym: %f',testminasym);
        text(textxpos2,text11ypos,text11,'FontSize',insetfontsize,'Color','r');
        text12=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text12ypos,text12,'FontSize',insetfontsize,'Color','r');
    
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'054_Mean_Bif_Taper_Sig');
    print('-djpeg',filename); close all;    
  
    
% Termination Taper Rate - Linear 

    figure;    
    controldatax   = [controlanalysis.termination.diameter.diameter];
    controldatay   = [controlanalysis.termination.diameter.taperrate.mean];
    controldatastd = [controlanalysis.termination.diameter.taperrate.std];
    errorbar(controldatax,controldatay,controldatastd/2,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.termination.diameter.diameter];
    testdatay   = [testanalysis.termination.diameter.taperrate.mean];
    testdatastd = [testanalysis.termination.diameter.taperrate.std];
    errorbar(testdatax,testdatay,testdatastd/2,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim;
    [controlm,controlb,controlfitx,controlfity,controlfitr2]=linearfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testm,testb,testfitx,testfity,testfitr2]=linearfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r');
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Taper Rate (Mean)','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('9.1: Mean Terminating Branch Taper Rate - Linear','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
        
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('m: %f',controlm);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('m: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
      
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'091_Mean_Term_Taper_Lin');
    print('-djpeg',filename); close all;
    
    
% Termination Taper Rate - Exponential 

    figure;
    controldatax   = [controlanalysis.termination.diameter.diameter];
    controldatay   = [controlanalysis.termination.diameter.taperrate.mean];
    controldatastd = [controlanalysis.termination.diameter.taperrate.std];
    errorbar(controldatax,controldatay,controldatastd/2,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.termination.diameter.diameter];
    testdatay   = [testanalysis.termination.diameter.taperrate.mean];
    testdatastd = [testanalysis.termination.diameter.taperrate.std];
    errorbar(testdatax,testdatay,testdatastd/2,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim;
    [controla,controlb,controlfitx,controlfity,controlfitr2]=exponentialfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=exponentialfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r');
    ylim(ylimits); xlim(xlimits);
      
    ylabel('Taper Rate (Mean)','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('9.2: Mean Terminating Branch Taper Rate - Exponential','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
    
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'092_Mean_Term_Taper_Exp');
    print('-djpeg',filename); close all;
    
    
% Termination Taper Rate - Power 

    figure;        
    controldatax   = [controlanalysis.termination.diameter.diameter];
    controldatay   = [controlanalysis.termination.diameter.taperrate.mean];
    controldatastd = [controlanalysis.termination.diameter.taperrate.std];
    errorbar(controldatax,controldatay,controldatastd/2,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.termination.diameter.diameter];
    testdatay   = [testanalysis.termination.diameter.taperrate.mean];
    testdatastd = [testanalysis.termination.diameter.taperrate.std];
    errorbar(testdatax,testdatay,testdatastd/2,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim;
    [controla,controlb,controlfitx,controlfity,controlfitr2]=powerfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=powerfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r');
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Taper Rate (Mean)','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('9.3: Mean Terminating Branch Taper Rate - Power','FontSize',titlefontsize,'FontWeight','b');    
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
   
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'093_Mean_Term_Taper_Pow');
    print('-djpeg',filename); close all;
    
       
 % Termination Taper Rate - Sigmoidal 

    figure;      
    controldatax   = [controlanalysis.termination.diameter.diameter];
    controldatay   = [controlanalysis.termination.diameter.taperrate.mean];
    controldatastd = [controlanalysis.termination.diameter.taperrate.std];
    errorbar(controldatax,controldatay,controldatastd/2,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.termination.diameter.diameter];
    testdatay   = [testanalysis.termination.diameter.taperrate.mean];
    testdatastd = [testanalysis.termination.diameter.taperrate.std];
    errorbar(testdatax,testdatay,testdatastd/2,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim;
    [controlminasym,controlmaxasym,controlhalfmax,controlsteepness,controlfitx,controlfity,controlfitr2]=sigmoidfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=powerfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r');
    ylim(ylimits); xlim(xlimits);
       
    ylabel('Taper Rate (Mean)','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('9.4: Mean Terminating Branch Taper Rate - Sigmoidal','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    text11ypos = 0.725*(max(ylimits)-min(ylimits))+min(ylimits);
    text12ypos = 0.700*(max(ylimits)-min(ylimits))+min(ylimits);
       
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('minasym: %f',controlminasym);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('maxasym: %f',controlmaxasym);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('halfmax: %f',controlhalfmax);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
        text5=sprintf('steepness: %f',controlsteepness);
        text(textxpos2,text5ypos,text5,'FontSize',insetfontsize,'Color','b');
        text6=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','b');
    text7=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('halfmax: %f',testhalfmax);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        text9=sprintf('steepness: %f',teststeepness);
        text(textxpos2,text9ypos,text9,'FontSize',insetfontsize,'Color','r');
        text10=sprintf('maxasym: %f',testmaxasym);
        text(textxpos2,text10ypos,text10,'FontSize',insetfontsize,'Color','r');
        text11=sprintf('minasym: %f',testminasym);
        text(textxpos2,text11ypos,text11,'FontSize',insetfontsize,'Color','r');
        text12=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text12ypos,text12,'FontSize',insetfontsize,'Color','r');
 
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'094_Mean_Term_Taper_Sig');
    print('-djpeg',filename); close all;     
    
        
% SD Bifurcation Taper Rate - Linear 

    figure;
        
    controldatax   = [controlanalysis.bifurcation.diameter.diameter];
    controldatay   = [controlanalysis.bifurcation.diameter.taperrate.std];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.diameter.diameter];
    testdatay   = [testanalysis.bifurcation.diameter.taperrate.std];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim;
    [controlm,controlb,controlfitx,controlfity,controlfitr2]=linearfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testm,testb,testfitx,testfity,testfitr2]=linearfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r');
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Taper Rate (SD)','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('6.1: SD Bifurcating Branch Taper Rate - Linear','FontSize',titlefontsize,'FontWeight','b');  
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
       
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('m: %f',controlm);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('m: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
       
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'061_SD_Bif_Taper_Lin');
    print('-djpeg',filename); close all;
    
    
% SD Bifurcation Taper Rate - Exponential 

    figure; 
    controldatax   = [controlanalysis.bifurcation.diameter.diameter];
    controldatay   = [controlanalysis.bifurcation.diameter.taperrate.std];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.diameter.diameter];
    testdatay   = [testanalysis.bifurcation.diameter.taperrate.std];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
     
    ylimits = ylim; xlimits = xlim;
    [controla,controlb,controlfitx,controlfity,controlfitr2]=exponentialfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=exponentialfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r');
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Taper Rate (SD)','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('6.2: SD Bifurcating Branch Taper Rate - Exponential','FontSize',titlefontsize,'FontWeight','b');    
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
        
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'062_SD_Bif_Taper_Exp');
    print('-djpeg',filename); close all;
    
        
% SD Bifurcation Taper Rate - Power 

    figure;        
    controldatax   = [controlanalysis.bifurcation.diameter.diameter];
    controldatay   = [controlanalysis.bifurcation.diameter.taperrate.std];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.diameter.diameter];
    testdatay   = [testanalysis.bifurcation.diameter.taperrate.std];     
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim;
    [controla,controlb,controlfitx,controlfity,controlfitr2]=powerfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=powerfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r');
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Taper Rate (SD)','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('6.3: SD Bifurcating Branch Taper Rate - Power','FontSize',titlefontsize,'FontWeight','b');   
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
        
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');

    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'063_SD_Bif_Taper_Pow');
    print('-djpeg',filename); close all; 
    
    
% SD Termination Taper Rate - Linear 

    figure;        
    controldatax   = [controlanalysis.termination.diameter.diameter];
    controldatay   = [controlanalysis.termination.diameter.taperrate.std];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.termination.diameter.diameter];
    testdatay   = [testanalysis.termination.diameter.taperrate.std];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controlm,controlb,controlfitx,controlfity,controlfitr2]=linearfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testm,testb,testfitx,testfity,testfitr2]=linearfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); ylim(ylimits); xlim(xlimits);
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Taper Rate (SD)','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('10.1: SD Terminating Branch Taper Rate - Linear','FontSize',titlefontsize,'FontWeight','b');   
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
        
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('m: %f',controlm);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('m: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
       
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'101_SD_Term_Taper_Lin');
    print('-djpeg',filename); close all;
    
    
% SD Termination Taper Rate - Exponential 

    figure;        
    controldatax   = [controlanalysis.termination.diameter.diameter];
    controldatay   = [controlanalysis.termination.diameter.taperrate.std];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.termination.diameter.diameter];
    testdatay   = [testanalysis.termination.diameter.taperrate.std];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=exponentialfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=exponentialfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); ylim(ylimits); xlim(xlimits);
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Taper Rate (SD)','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('10.2: SD Terminating Branch Taper Rate - Exponential','FontSize',titlefontsize,'FontWeight','b');  
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
        
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
     
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'102_SD_Term_Taper_Exp');
    print('-djpeg',filename); close all;
    
       
% SD Termination Taper Rate - Power 

    figure;        
    controldatax   = [controlanalysis.termination.diameter.diameter];
    controldatay   = [controlanalysis.termination.diameter.taperrate.std];    
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.termination.diameter.diameter];
    testdatay   = [testanalysis.termination.diameter.taperrate.std];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=powerfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=powerfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); ylim(ylimits); xlim(xlimits);
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Taper Rate (SD)','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('10.3: SD Terminating Branch Taper Rate - Power','FontSize',titlefontsize,'FontWeight','b');    
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
        
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
     
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'103_SD_Term_Taper_Pow');
    print('-djpeg',filename); close all;    
    
       
% Skew Bifurcation Taper Rate - Linear 

    figure;       
    controldatax   = [controlanalysis.bifurcation.diameter.diameter];
    controldatay   = [controlanalysis.bifurcation.diameter.taperrate.skew];    
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.diameter.diameter];
    testdatay   = [testanalysis.bifurcation.diameter.taperrate.skew];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controlm,controlb,controlfitx,controlfity,controlfitr2]=linearfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testm,testb,testfitx,testfity,testfitr2]=linearfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); ylim(ylimits); xlim(xlimits);
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Taper Rate (Skewness)','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('7.1: Skew Bifurcating Branch Taper Rate - Linear','FontSize',titlefontsize,'FontWeight','b');    
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
        
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('m: %f',controlm);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('m: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
       
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'071_Skew_Bif_Taper_Lin');
    print('-djpeg',filename); close all;
    
    
% Skew Bifurcation Taper Rate - Exponential 

    figure;       
    controldatax   = [controlanalysis.bifurcation.diameter.diameter];
    controldatay   = [controlanalysis.bifurcation.diameter.taperrate.skew];    
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.diameter.diameter];
    testdatay   = [testanalysis.bifurcation.diameter.taperrate.skew];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=exponentialfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=exponentialfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); ylim(ylimits); xlim(xlimits);
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Taper Rate (Skewness)','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('7.2: Skew Bifurcating Branch Taper Rate - Exponential','FontSize',titlefontsize,'FontWeight','b');    
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
        
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
       
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'072_Skew_Bif_Taper_Exp');
    print('-djpeg',filename); close all;
    
      
% Skew Bifurcation Taper Rate - Power 

    figure;        
    controldatax   = [controlanalysis.bifurcation.diameter.diameter];
    controldatay   = [controlanalysis.bifurcation.diameter.taperrate.skew];    
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.diameter.diameter];
    testdatay   = [testanalysis.bifurcation.diameter.taperrate.skew];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=powerfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=powerfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); ylim(ylimits); xlim(xlimits);
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Taper Rate (Skewness)','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('7.3: Skew Bifurcating Branch Taper Rate - Power','FontSize',titlefontsize,'FontWeight','b');   
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
      
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'073_Skew_Bif_Taper_Pow');
    print('-djpeg',filename); close all;
    
    
% Skew Termination Taper Rate - Linear 

    figure;       
    controldatax   = [controlanalysis.termination.diameter.diameter];
    controldatay   = [controlanalysis.termination.diameter.taperrate.skew];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.termination.diameter.diameter];
    testdatay   = [testanalysis.termination.diameter.taperrate.skew];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controlm,controlb,controlfitx,controlfity,controlfitr2]=linearfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testm,testb,testfitx,testfity,testfitr2]=linearfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); ylim(ylimits); xlim(xlimits);
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Taper Rate (Skewness)','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('11.1: Skew Terminating Branch Taper Rate - Linear','FontSize',titlefontsize,'FontWeight','b');   
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
       
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('m: %f',controlm);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('m: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
   
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'111_Skew_Term_Taper_Lin');
    print('-djpeg',filename); close all;
    
    
% Skew Termination Taper Rate - Exponential 

    figure;       
    controldatax   = [controlanalysis.termination.diameter.diameter];
    controldatay   = [controlanalysis.termination.diameter.taperrate.skew];    
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.termination.diameter.diameter];
    testdatay   = [testanalysis.termination.diameter.taperrate.skew];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=exponentialfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=exponentialfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); ylim(ylimits); xlim(xlimits);
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Taper Rate (Skewness)','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('11.2: Skew Terminating Branch Taper Rate - Exponential','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
        
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'112_Skew_Term_Taper_Exp');
    print('-djpeg',filename); close all;
    
       
% Skew Termination Taper Rate - Power 

    figure;     
    controldatax   = [controlanalysis.termination.diameter.diameter];
    controldatay   = [controlanalysis.termination.diameter.taperrate.skew];   
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.termination.diameter.diameter];
    testdatay   = [testanalysis.termination.diameter.taperrate.skew];    
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=powerfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=powerfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); ylim(ylimits); xlim(xlimits);
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Taper Rate (Skewness)','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('11.3: Skew Terminating Branch Taper Rate - Power','FontSize',titlefontsize,'FontWeight','b');   
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
        
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'113_Skew_Term_Taper_Pow');
    print('-djpeg',filename); close all;
    

% Kurt Bifurcation Taper Rate - Linear 

    figure;       
    controldatax   = [controlanalysis.bifurcation.diameter.diameter];
    controldatay   = [controlanalysis.bifurcation.diameter.taperrate.kurt];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.diameter.diameter];
    testdatay   = [testanalysis.bifurcation.diameter.taperrate.kurt];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controlm,controlb,controlfitx,controlfity,controlfitr2]=linearfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testm,testb,testfitx,testfity,testfitr2]=linearfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Taper Rate (Kurtosis)','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('8.1: Kurt Bifurcating Branch Taper Rate - Linear','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
       
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('m: %f',controlm);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('m: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
  
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'081_Kurt_Bif_Taper_Lin');
    print('-djpeg',filename); close all;
    
    
% Kurt Bifurcation Taper Rate - Exponential 

    figure;
        
    controldatax   = [controlanalysis.bifurcation.diameter.diameter];
    controldatay   = [controlanalysis.bifurcation.diameter.taperrate.kurt];    
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.diameter.diameter];
    testdatay   = [testanalysis.bifurcation.diameter.taperrate.kurt];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=exponentialfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=exponentialfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Taper Rate (Kurtosis)','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('8.2: Kurt Bifurcating Branch Taper Rate - Exponential','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
      
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
   
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'082_Kurt_Bif_Taper_Exp');
    print('-djpeg',filename); close all;
    
    
% Kurt Bifurcation Taper Rate - Power 

    figure;       
    controldatax   = [controlanalysis.bifurcation.diameter.diameter];
    controldatay   = [controlanalysis.bifurcation.diameter.taperrate.kurt];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.diameter.diameter];
    testdatay   = [testanalysis.bifurcation.diameter.taperrate.kurt];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=powerfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=powerfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Taper Rate (Kurtosis)','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('8.3: Kurt Bifurcating Branch Taper Rate - Power','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
  
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'083_Kurt_Bif_Taper_Pow');
    print('-djpeg',filename); close all;
    
      
% Kurt Termination Taper Rate - Linear 

    figure;   
    controldatax   = [controlanalysis.termination.diameter.diameter];
    controldatay   = [controlanalysis.termination.diameter.taperrate.kurt];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.termination.diameter.diameter];
    testdatay   = [testanalysis.termination.diameter.taperrate.kurt];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controlm,controlb,controlfitx,controlfity,controlfitr2]=linearfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testm,testb,testfitx,testfity,testfitr2]=linearfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Taper Rate (Kurtosis)','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('12.1: Kurt Terminating Branch Taper Rate - Linear','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('m: %f',controlm);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('m: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
   
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'121_Kurt_Term_Taper_Lin');
    print('-djpeg',filename); close all;
    
    
% Kurt Termination Taper Rate - Exponential 

    figure;
    controldatax   = [controlanalysis.termination.diameter.diameter];
    controldatay   = [controlanalysis.termination.diameter.taperrate.kurt];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.termination.diameter.diameter];
    testdatay   = [testanalysis.termination.diameter.taperrate.kurt];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=exponentialfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=exponentialfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Taper Rate (Kurtosis)','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('12.2: Kurt Terminating Branch Taper Rate - Exponential','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
      
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
     
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'122_Kurt_Term_Taper_Exp');
    print('-djpeg',filename); close all;
    
     
% Kurt Termination Taper Rate - Power 

    figure;
    controldatax   = [controlanalysis.termination.diameter.diameter];
    controldatay   = [controlanalysis.termination.diameter.taperrate.kurt];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.termination.diameter.diameter];
    testdatay   = [testanalysis.termination.diameter.taperrate.kurt];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=powerfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=powerfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Taper Rate (Kurtosis)','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('12.3: Kurt Terminating Branch Taper Rate - Power','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
   
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'123_Kurt_Term_Taper_Pow');
    print('-djpeg',filename); close all;


% Bifurcation Taper Rate - Linear 

    figure;
    controldatax   = [controlanalysis.bifurcation.pathlength.pathlength];
    controldatay   = [controlanalysis.bifurcation.pathlength.taperrate.mean];
    controldatastd = [controlanalysis.bifurcation.pathlength.taperrate.std];
    errorbar(controldatax,controldatay,controldatastd/2,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.pathlength.pathlength];
    testdatay   = [testanalysis.bifurcation.pathlength.taperrate.mean];
    testdatastd = [testanalysis.bifurcation.pathlength.taperrate.std];
    errorbar(testdatax,testdatay,testdatastd/2,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim;
    [controlm,controlb,controlfitx,controlfity,controlfitr2]=linearfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testm,testb,testfitx,testfity,testfitr2]=linearfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r');
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Taper Rate (Mean)','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('5.1: Mean Bifurcating Branch Taper Rate - Linear','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
     
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('m: %f',controlm);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('m: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
  
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'051b_Mean_Bif_Taper_Lin');
    print('-djpeg',filename); close all;
    
    
% Bifurcation Taper Rate - Exponential 

    figure; 
    controldatax   = [controlanalysis.bifurcation.pathlength.pathlength];
    controldatay   = [controlanalysis.bifurcation.pathlength.taperrate.mean];
    controldatastd = [controlanalysis.bifurcation.pathlength.taperrate.std];
    errorbar(controldatax,controldatay,controldatastd/2,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.pathlength.pathlength];
    testdatay   = [testanalysis.bifurcation.pathlength.taperrate.mean];
    testdatastd = [testanalysis.bifurcation.pathlength.taperrate.std];
    errorbar(testdatax,testdatay,testdatastd/2,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim;
    [controla,controlb,controlfitx,controlfity,controlfitr2]=exponentialfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=exponentialfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r');
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Taper Rate (Mean)','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('5.2: Mean Bifurcating Branch Taper Rate - Exponential','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
   
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'052b_Mean_Bif_Taper_Exp');
    print('-djpeg',filename); close all;
    
        
% Bifurcation Taper Rate - Power 

    figure;
    controldatax   = [controlanalysis.bifurcation.pathlength.pathlength];
    controldatay   = [controlanalysis.bifurcation.pathlength.taperrate.mean];
    controldatastd = [controlanalysis.bifurcation.pathlength.taperrate.std];
    errorbar(controldatax,controldatay,controldatastd/2,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.pathlength.pathlength];
    testdatay   = [testanalysis.bifurcation.pathlength.taperrate.mean];
    testdatastd = [testanalysis.bifurcation.pathlength.taperrate.std];
    errorbar(testdatax,testdatay,testdatastd/2,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim;
    [controla,controlb,controlfitx,controlfity,controlfitr2]=powerfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=powerfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r');
    ylim(ylimits); xlim(xlimits);
      
    ylabel('Taper Rate (Mean)','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('5.3: Mean Bifurcating Branch Taper Rate - Power','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
     
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'053b_Mean_Bif_Taper_Pow');
    print('-djpeg',filename); close all;
    
   
% Bifurcation Taper Rate - Sigmoidal 

    figure;  
    controldatax   = [controlanalysis.bifurcation.pathlength.pathlength];
    controldatay   = [controlanalysis.bifurcation.pathlength.taperrate.mean];
    controldatastd = [controlanalysis.bifurcation.pathlength.taperrate.std];
    errorbar(controldatax,controldatay,controldatastd/2,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.pathlength.pathlength];
    testdatay   = [testanalysis.bifurcation.pathlength.taperrate.mean];
    testdatastd = [testanalysis.bifurcation.pathlength.taperrate.std];
    errorbar(testdatax,testdatay,testdatastd/2,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim;
    [controlminasym,controlmaxasym,controlhalfmax,controlsteepness,controlfitx,controlfity,controlfitr2]=sigmoidfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=powerfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r');
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Taper Rate (Mean)','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('5.4: Mean Bifurcating Branch Taper Rate - Sigmoidal','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    text11ypos = 0.725*(max(ylimits)-min(ylimits))+min(ylimits);
    text12ypos = 0.700*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('minasym: %f',controlminasym);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('maxasym: %f',controlmaxasym);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('halfmax: %f',controlhalfmax);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
        text5=sprintf('steepness: %f',controlsteepness);
        text(textxpos2,text5ypos,text5,'FontSize',insetfontsize,'Color','b');
        text6=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','b');
    text7=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('halfmax: %f',testhalfmax);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        text9=sprintf('steepness: %f',teststeepness);
        text(textxpos2,text9ypos,text9,'FontSize',insetfontsize,'Color','r');
        text10=sprintf('maxasym: %f',testmaxasym);
        text(textxpos2,text10ypos,text10,'FontSize',insetfontsize,'Color','r');
        text11=sprintf('minasym: %f',testminasym);
        text(textxpos2,text11ypos,text11,'FontSize',insetfontsize,'Color','r');
        text12=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text12ypos,text12,'FontSize',insetfontsize,'Color','r');
     
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'054b_Mean_Bif_Taper_Sig');
    print('-djpeg',filename); close all;    
        
    
% Termination Taper Rate - Linear 

    figure;
    controldatax   = [controlanalysis.termination.pathlength.pathlength];
    controldatay   = [controlanalysis.termination.pathlength.taperrate.mean];
    controldatastd = [controlanalysis.termination.pathlength.taperrate.std];
    errorbar(controldatax,controldatay,controldatastd/2,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.termination.pathlength.pathlength];
    testdatay   = [testanalysis.termination.pathlength.taperrate.mean];
    testdatastd = [testanalysis.termination.pathlength.taperrate.std];
    errorbar(testdatax,testdatay,testdatastd/2,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim;
    [controlm,controlb,controlfitx,controlfity,controlfitr2]=linearfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testm,testb,testfitx,testfity,testfitr2]=linearfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r');
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Taper Rate (Mean)','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('9.1: Mean Terminating Branch Taper Rate - Linear','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
     
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('m: %f',controlm);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('m: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
    
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'091b_Mean_Term_Taper_Lin');
    print('-djpeg',filename); close all;
    
    
% Termination Taper Rate - Exponential 

    figure;
    controldatax   = [controlanalysis.termination.pathlength.pathlength];
    controldatay   = [controlanalysis.termination.pathlength.taperrate.mean];
    controldatastd = [controlanalysis.termination.pathlength.taperrate.std];
    errorbar(controldatax,controldatay,controldatastd/2,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.termination.pathlength.pathlength];
    testdatay   = [testanalysis.termination.pathlength.taperrate.mean];
    testdatastd = [testanalysis.termination.pathlength.taperrate.std];
    errorbar(testdatax,testdatay,testdatastd/2,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim;
    [controla,controlb,controlfitx,controlfity,controlfitr2]=exponentialfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=exponentialfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r');
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Taper Rate (Mean)','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('9.2: Mean Terminating Branch Taper Rate - Exponential','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
  
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'092b_Mean_Term_Taper_Exp');
    print('-djpeg',filename); close all;
    
     
% Termination Taper Rate - Power 

    figure;   
    controldatax   = [controlanalysis.termination.pathlength.pathlength];
    controldatay   = [controlanalysis.termination.pathlength.taperrate.mean];
    controldatastd = [controlanalysis.termination.pathlength.taperrate.std];
    errorbar(controldatax,controldatay,controldatastd/2,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.termination.pathlength.pathlength];
    testdatay   = [testanalysis.termination.pathlength.taperrate.mean];
    testdatastd = [testanalysis.termination.pathlength.taperrate.std];
    errorbar(testdatax,testdatay,testdatastd/2,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim;
    [controla,controlb,controlfitx,controlfity,controlfitr2]=powerfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=powerfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r');
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Taper Rate (Mean)','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('9.3: Mean Terminating Branch Taper Rate - Power','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');

    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'093b_Mean_Term_Taper_Pow');
    print('-djpeg',filename); close all;
    
     
 % Termination Taper Rate - Sigmoidal 

    figure;
    controldatax   = [controlanalysis.termination.pathlength.pathlength];
    controldatay   = [controlanalysis.termination.pathlength.taperrate.mean];
    controldatastd = [controlanalysis.termination.pathlength.taperrate.std];
    errorbar(controldatax,controldatay,controldatastd/2,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.termination.pathlength.pathlength];
    testdatay   = [testanalysis.termination.pathlength.taperrate.mean];
    testdatastd = [testanalysis.termination.pathlength.taperrate.std];
    errorbar(testdatax,testdatay,testdatastd/2,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim;
    [controlminasym,controlmaxasym,controlhalfmax,controlsteepness,controlfitx,controlfity,controlfitr2]=sigmoidfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=powerfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r');
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Taper Rate (Mean)','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('9.4: Mean Terminating Branch Taper Rate - Sigmoidal','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    text11ypos = 0.725*(max(ylimits)-min(ylimits))+min(ylimits);
    text12ypos = 0.700*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('minasym: %f',controlminasym);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('maxasym: %f',controlmaxasym);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('halfmax: %f',controlhalfmax);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
        text5=sprintf('steepness: %f',controlsteepness);
        text(textxpos2,text5ypos,text5,'FontSize',insetfontsize,'Color','b');
        text6=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','b');
    text7=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('halfmax: %f',testhalfmax);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        text9=sprintf('steepness: %f',teststeepness);
        text(textxpos2,text9ypos,text9,'FontSize',insetfontsize,'Color','r');
        text10=sprintf('maxasym: %f',testmaxasym);
        text(textxpos2,text10ypos,text10,'FontSize',insetfontsize,'Color','r');
        text11=sprintf('minasym: %f',testminasym);
        text(textxpos2,text11ypos,text11,'FontSize',insetfontsize,'Color','r');
        text12=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text12ypos,text12,'FontSize',insetfontsize,'Color','r');
     
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'094b_Mean_Term_Taper_Sig');
    print('-djpeg',filename); close all;     
    
      
% SD Bifurcation Taper Rate - Linear 

    figure;  
    controldatax   = [controlanalysis.bifurcation.pathlength.pathlength];
    controldatay   = [controlanalysis.bifurcation.pathlength.taperrate.std];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.pathlength.pathlength];
    testdatay   = [testanalysis.bifurcation.pathlength.taperrate.std];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim;
    [controlm,controlb,controlfitx,controlfity,controlfitr2]=linearfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testm,testb,testfitx,testfity,testfitr2]=linearfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r');
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Taper Rate (SD)','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('6.1: SD Bifurcating Branch Taper Rate - Linear','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
      
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('m: %f',controlm);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('m: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
   
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'061b_SD_Bif_Taper_Lin');
    print('-djpeg',filename); close all;
    
    
% SD Bifurcation Taper Rate - Exponential 

    figure;
    controldatax   = [controlanalysis.bifurcation.pathlength.pathlength];
    controldatay   = [controlanalysis.bifurcation.pathlength.taperrate.std];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.pathlength.pathlength];
    testdatay   = [testanalysis.bifurcation.pathlength.taperrate.std];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim;
    [controla,controlb,controlfitx,controlfity,controlfitr2]=exponentialfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=exponentialfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r');
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Taper Rate (SD)','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('6.2: SD Bifurcating Branch Taper Rate - Exponential','FontSize',titlefontsize,'FontWeight','b');    
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
   
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'062b_SD_Bif_Taper_Exp');
    print('-djpeg',filename); close all;
    
      
% SD Bifurcation Taper Rate - Power 

    figure;        
    controldatax   = [controlanalysis.bifurcation.pathlength.pathlength];
    controldatay   = [controlanalysis.bifurcation.pathlength.taperrate.std];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.pathlength.pathlength];
    testdatay   = [testanalysis.bifurcation.pathlength.taperrate.std];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim;
    [controla,controlb,controlfitx,controlfity,controlfitr2]=powerfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=powerfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r');
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Taper Rate (SD)','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('6.3: SD Bifurcating Branch Taper Rate - Power','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
       
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
   
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'063b_SD_Bif_Taper_Pow');
    print('-djpeg',filename); close all;
    
        
% SD Termination Taper Rate - Linear 

    figure;
    controldatax   = [controlanalysis.termination.pathlength.pathlength];
    controldatay   = [controlanalysis.termination.pathlength.taperrate.std];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.termination.pathlength.pathlength];
    testdatay   = [testanalysis.termination.pathlength.taperrate.std];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controlm,controlb,controlfitx,controlfity,controlfitr2]=linearfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testm,testb,testfitx,testfity,testfitr2]=linearfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); ylim(ylimits); xlim(xlimits);
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Taper Rate (SD)','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('10.1: SD Terminating Branch Taper Rate - Linear','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
     
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('m: %f',controlm);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('m: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
  
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'101b_SD_Term_Taper_Lin');
    print('-djpeg',filename); close all;
    
    
% SD Termination Taper Rate - Exponential 

    figure; 
    controldatax   = [controlanalysis.termination.pathlength.pathlength];
    controldatay   = [controlanalysis.termination.pathlength.taperrate.std];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.termination.pathlength.pathlength];
    testdatay   = [testanalysis.termination.pathlength.taperrate.std];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=exponentialfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=exponentialfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); ylim(ylimits); xlim(xlimits);
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Taper Rate (SD)','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('10.2: SD Terminating Branch Taper Rate - Exponential','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
   
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'102b_SD_Term_Taper_Exp');
    print('-djpeg',filename); close all;
    
    
% SD Termination Taper Rate - Power 

    figure;
    controldatax   = [controlanalysis.termination.pathlength.pathlength];
    controldatay   = [controlanalysis.termination.pathlength.taperrate.std];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.termination.pathlength.pathlength];
    testdatay   = [testanalysis.termination.pathlength.taperrate.std];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=powerfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=powerfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); ylim(ylimits); xlim(xlimits);
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Taper Rate (SD)','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('10.3: SD Terminating Branch Taper Rate - Power','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
     
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
    
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'103b_SD_Term_Taper_Pow');
    print('-djpeg',filename); close all;    
        
    
% Skew Bifurcation Taper Rate - Linear 

    figure;
    controldatax   = [controlanalysis.bifurcation.pathlength.pathlength];
    controldatay   = [controlanalysis.bifurcation.pathlength.taperrate.skew];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.pathlength.pathlength];
    testdatay   = [testanalysis.bifurcation.pathlength.taperrate.skew];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controlm,controlb,controlfitx,controlfity,controlfitr2]=linearfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testm,testb,testfitx,testfity,testfitr2]=linearfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); ylim(ylimits); xlim(xlimits);
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Taper Rate (Skewness)','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('7.1: Skew Bifurcating Branch Taper Rate - Linear','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('m: %f',controlm);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('m: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
    
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'071b_Skew_Bif_Taper_Lin');
    print('-djpeg',filename); close all;
    
    
% Skew Bifurcation Taper Rate - Exponential 

    figure;    
    controldatax   = [controlanalysis.bifurcation.pathlength.pathlength];
    controldatay   = [controlanalysis.bifurcation.pathlength.taperrate.skew];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.pathlength.pathlength];
    testdatay   = [testanalysis.bifurcation.pathlength.taperrate.skew];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=exponentialfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=exponentialfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); ylim(ylimits); xlim(xlimits);
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Taper Rate (Skewness)','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('7.2: Skew Bifurcating Branch Taper Rate - Exponential','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
    
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'072b_Skew_Bif_Taper_Exp');
    print('-djpeg',filename); close all;
    
    
% Skew Bifurcation Taper Rate - Power 

    figure;
    controldatax   = [controlanalysis.bifurcation.pathlength.pathlength];
    controldatay   = [controlanalysis.bifurcation.pathlength.taperrate.skew];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.pathlength.pathlength];
    testdatay   = [testanalysis.bifurcation.pathlength.taperrate.skew];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=powerfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=powerfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); ylim(ylimits); xlim(xlimits);
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Taper Rate (Skewness)','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('7.3: Skew Bifurcating Branch Taper Rate - Power','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
   
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'073b_Skew_Bif_Taper_Pow');
    print('-djpeg',filename); close all;
        
    
% Skew Termination Taper Rate - Linear 

    figure;
    controldatax   = [controlanalysis.termination.pathlength.pathlength];
    controldatay   = [controlanalysis.termination.pathlength.taperrate.skew];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.termination.pathlength.pathlength];
    testdatay   = [testanalysis.termination.pathlength.taperrate.skew];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controlm,controlb,controlfitx,controlfity,controlfitr2]=linearfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testm,testb,testfitx,testfity,testfitr2]=linearfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); ylim(ylimits); xlim(xlimits);
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Taper Rate (Skewness)','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('11.1: Skew Terminating Branch Taper Rate - Linear','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('m: %f',controlm);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('m: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
   
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'111b_Skew_Term_Taper_Lin');
    print('-djpeg',filename); close all;
    
    
% Skew Termination Taper Rate - Exponential 

    figure;
    controldatax   = [controlanalysis.termination.pathlength.pathlength];
    controldatay   = [controlanalysis.termination.pathlength.taperrate.skew];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.termination.pathlength.pathlength];
    testdatay   = [testanalysis.termination.pathlength.taperrate.skew];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=exponentialfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=exponentialfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); ylim(ylimits); xlim(xlimits);
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Taper Rate (Skewness)','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('11.2: Skew Terminating Branch Taper Rate - Exponential','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
  
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'112b_Skew_Term_Taper_Exp');
    print('-djpeg',filename); close all;
    
    
% Skew Termination Taper Rate - Power 

    figure;
    controldatax   = [controlanalysis.termination.pathlength.pathlength];
    controldatay   = [controlanalysis.termination.pathlength.taperrate.skew];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.termination.pathlength.pathlength];
    testdatay   = [testanalysis.termination.pathlength.taperrate.skew];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=powerfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=powerfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); ylim(ylimits); xlim(xlimits);
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Taper Rate (Skewness)','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('11.3: Skew Terminating Branch Taper Rate - Power','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
    
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'113b_Skew_Term_Taper_Pow');
    print('-djpeg',filename); close all;
    

% Kurt Bifurcation Taper Rate - Linear 

    figure;
    controldatax   = [controlanalysis.bifurcation.pathlength.pathlength];
    controldatay   = [controlanalysis.bifurcation.pathlength.taperrate.kurt];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.pathlength.pathlength];
    testdatay   = [testanalysis.bifurcation.pathlength.taperrate.kurt];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controlm,controlb,controlfitx,controlfity,controlfitr2]=linearfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testm,testb,testfitx,testfity,testfitr2]=linearfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Taper Rate (Kurtosis)','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('8.1: Kurt Bifurcating Branch Taper Rate - Linear','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('m: %f',controlm);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('m: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
   
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'081b_Kurt_Bif_Taper_Lin');
    print('-djpeg',filename); close all;
    
    
% Kurt Bifurcation Taper Rate - Exponential 

    figure;
    controldatax   = [controlanalysis.bifurcation.pathlength.pathlength];
    controldatay   = [controlanalysis.bifurcation.pathlength.taperrate.kurt];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.pathlength.pathlength];
    testdatay   = [testanalysis.bifurcation.pathlength.taperrate.kurt];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=exponentialfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=exponentialfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Taper Rate (Kurtosis)','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('8.2: Kurt Bifurcating Branch Taper Rate - Exponential','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
       
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'082b_Kurt_Bif_Taper_Exp');
    print('-djpeg',filename); close all;
    
      
% Kurt Bifurcation Taper Rate - Power 

    figure;
    controldatax   = [controlanalysis.bifurcation.pathlength.pathlength];
    controldatay   = [controlanalysis.bifurcation.pathlength.taperrate.kurt];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.pathlength.pathlength];
    testdatay   = [testanalysis.bifurcation.pathlength.taperrate.kurt];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=powerfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=powerfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Taper Rate (Kurtosis)','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('8.3: Kurt Bifurcating Branch Taper Rate - Power','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
 
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'083b_Kurt_Bif_Taper_Pow');
    print('-djpeg',filename); close all;
    
        
% Kurt Termination Taper Rate - Linear 

    figure;
    controldatax   = [controlanalysis.termination.pathlength.pathlength];
    controldatay   = [controlanalysis.termination.pathlength.taperrate.kurt];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.termination.pathlength.pathlength];
    testdatay   = [testanalysis.termination.pathlength.taperrate.kurt];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controlm,controlb,controlfitx,controlfity,controlfitr2]=linearfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testm,testb,testfitx,testfity,testfitr2]=linearfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Taper Rate (Kurtosis)','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('12.1: Kurt Terminating Branch Taper Rate - Linear','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('m: %f',controlm);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('m: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
      
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'121b_Kurt_Term_Taper_Lin');
    print('-djpeg',filename); close all;
    
    
% Kurt Termination Taper Rate - Exponential 

    figure;
    controldatax   = [controlanalysis.termination.pathlength.pathlength];
    controldatay   = [controlanalysis.termination.pathlength.taperrate.kurt];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.termination.pathlength.pathlength];
    testdatay   = [testanalysis.termination.pathlength.taperrate.kurt];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=exponentialfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=exponentialfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Taper Rate (Kurtosis)','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('12.2: Kurt Terminating Branch Taper Rate - Exponential','FontSize',titlefontsize,'FontWeight','b');
    
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
  
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'122b_Kurt_Term_Taper_Exp');
    print('-djpeg',filename); close all;
    
    
% Kurt Termination Taper Rate - Power 

    figure;
    controldatax   = [controlanalysis.termination.pathlength.pathlength];
    controldatay   = [controlanalysis.termination.pathlength.taperrate.kurt];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.termination.pathlength.pathlength];
    testdatay   = [testanalysis.termination.pathlength.taperrate.kurt];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=powerfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=powerfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Taper Rate (Kurtosis)','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('12.3: Kurt Terminating Branch Taper Rate - Power','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
      
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'123b_Kurt_Term_Taper_Pow');
    print('-djpeg',filename); close all;
    
    
% Rall Ratio 1.0 - Linear 

    figure;
    controldatax   = [controlanalysis.bifurcation.diameter.diameter];
    controldatay   = [controlanalysis.bifurcation.diameter.rallratio1.mean];
    controldatastd = [controlanalysis.bifurcation.diameter.rallratio1.std];
    errorbar(controldatax,controldatay,controldatastd/2,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.diameter.diameter];
    testdatay   = [testanalysis.bifurcation.diameter.rallratio1.mean];
    testdatastd = [testanalysis.bifurcation.diameter.rallratio1.std];
    errorbar(testdatax,testdatay,testdatastd/2,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controlm,controlb,controlfitx,controlfity,controlfitr2]=linearfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testm,testb,testfitx,testfity,testfitr2]=linearfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Mean Rall Ratio (D^{1.0})','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('13.1: Mean Rall Ratio (D^{1.0}) - Linear','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('m: %f',controlm);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('m: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
  
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'131_Mean_Rall_Ratio_1_Lin');
    print('-djpeg',filename); close all;
    
    
% Rall Ratio 1.0 - Exponential 

    figure;
    controldatax   = [controlanalysis.bifurcation.diameter.diameter];
    controldatay   = [controlanalysis.bifurcation.diameter.rallratio1.mean];
    controldatastd = [controlanalysis.bifurcation.diameter.rallratio1.std];
    errorbar(controldatax,controldatay,controldatastd/2,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.diameter.diameter];
    testdatay   = [testanalysis.bifurcation.diameter.rallratio1.mean];
    testdatastd = [testanalysis.bifurcation.diameter.rallratio1.std];
    errorbar(testdatax,testdatay,testdatastd/2,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=exponentialfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=exponentialfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Mean Rall Ratio (D^{1.0})','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('13.2: Mean Rall Ratio (D^{1.0}) - Exponential','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
     
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'132_Mean_Rall_Ratio_1_Exp');
    print('-djpeg',filename); close all;
    
     
% Rall Ratio 1.0 - Power 

    figure;
    controldatax   = [controlanalysis.bifurcation.diameter.diameter];
    controldatay   = [controlanalysis.bifurcation.diameter.rallratio1.mean];
    controldatastd = [controlanalysis.bifurcation.diameter.rallratio1.std];
    errorbar(controldatax,controldatay,controldatastd/2,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.diameter.diameter];
    testdatay   = [testanalysis.bifurcation.diameter.rallratio1.mean];
    testdatastd = [testanalysis.bifurcation.diameter.rallratio1.std];
    errorbar(testdatax,testdatay,testdatastd/2,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=powerfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=powerfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Mean Rall Ratio (D^{1.0})','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('13.3: Mean Rall Ratio (D^{1.0}) - Power','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');

    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'133_Mean_Rall_Ratio_1_Pow');
    print('-djpeg',filename); close all;
    
     
% SD Rall Ratio 1.0 - Linear 

    figure;  
    controldatax   = [controlanalysis.bifurcation.diameter.diameter];
    controldatay   = [controlanalysis.bifurcation.diameter.rallratio1.std];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.diameter.diameter];
    testdatay   = [testanalysis.bifurcation.diameter.rallratio1.std];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controlm,controlb,controlfitx,controlfity,controlfitr2]=linearfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testm,testb,testfitx,testfity,testfitr2]=linearfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Rall Ratio (D^{1.0}) SD','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('14.1: SD Rall Ratio (D^{1.0}) - Linear','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('m: %f',controlm);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('m: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
   
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'141_SD_Rall_Ratio_1_Lin');
    print('-djpeg',filename); close all;
    
    
% SD Rall Ratio 1.0 - Exponential 

    figure;   
    controldatax   = [controlanalysis.bifurcation.diameter.diameter];
    controldatay   = [controlanalysis.bifurcation.diameter.rallratio1.std];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.diameter.diameter];
    testdatay   = [testanalysis.bifurcation.diameter.rallratio1.std];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=exponentialfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=exponentialfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Rall Ratio (D^{1.0}) SD','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('14.2: SD Rall Ratio (D^{1.0}) - Exponential','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
   
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'142_SD_Rall_Ratio_1_Exp');
    print('-djpeg',filename); close all;
    
   
% SD Rall Ratio 1.0 - Power 

    figure;
    controldatax   = [controlanalysis.bifurcation.diameter.diameter];
    controldatay   = [controlanalysis.bifurcation.diameter.rallratio1.std];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.diameter.diameter];
    testdatay   = [testanalysis.bifurcation.diameter.rallratio1.std];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=powerfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=powerfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Rall Ratio (D^{1.0}) SD','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('14.3: SD Rall Ratio (D^{1.0}) - Power','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
      
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'143_SD_Rall_Ratio_1_Pow');
    print('-djpeg',filename); close all;
    
    
% Skew Rall Ratio 1.0 - Linear 

    figure;
    controldatax   = [controlanalysis.bifurcation.diameter.diameter];
    controldatay   = [controlanalysis.bifurcation.diameter.rallratio1.skew];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.diameter.diameter];
    testdatay   = [testanalysis.bifurcation.diameter.rallratio1.skew];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controlm,controlb,controlfitx,controlfity,controlfitr2]=linearfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testm,testb,testfitx,testfity,testfitr2]=linearfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Rall Ratio (D^{1.0}) Skewness','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('15.1: Skew Rall Ratio (D^{1.0}) - Linear','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('m: %f',controlm);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('m: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
     
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'151_Skew_Rall_Ratio_1_Lin');
    print('-djpeg',filename); close all;
    
    
% Skew Rall Ratio 1.0 - Exponential 

    figure;
    controldatax   = [controlanalysis.bifurcation.diameter.diameter];
    controldatay   = [controlanalysis.bifurcation.diameter.rallratio1.skew];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.diameter.diameter];
    testdatay   = [testanalysis.bifurcation.diameter.rallratio1.skew];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=exponentialfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=exponentialfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Rall Ratio (D^{1.0}) Skewness','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('15.2: Skew Rall Ratio (D^{1.0}) - Exponential','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
     
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'152_Skew_Rall_Ratio_1_Exp');
    print('-djpeg',filename); close all;
    
    
% Skew Rall Ratio 1.0 - Power 

    figure;
    controldatax   = [controlanalysis.bifurcation.diameter.diameter];
    controldatay   = [controlanalysis.bifurcation.diameter.rallratio1.skew];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.diameter.diameter];
    testdatay   = [testanalysis.bifurcation.diameter.rallratio1.skew];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=powerfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=powerfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Rall Ratio (D^{1.0}) Skewness','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('15.3: Skew Rall Ratio (D^{1.0}) - Power','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
   
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'153_Skew_Rall_Ratio_1_Pow');
    print('-djpeg',filename); close all;
     
    
% Kurt Rall Ratio 1.0 - Linear 

    figure;
    controldatax   = [controlanalysis.bifurcation.diameter.diameter];
    controldatay   = [controlanalysis.bifurcation.diameter.rallratio1.kurt];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.diameter.diameter];
    testdatay   = [testanalysis.bifurcation.diameter.rallratio1.kurt];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controlm,controlb,controlfitx,controlfity,controlfitr2]=linearfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testm,testb,testfitx,testfity,testfitr2]=linearfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Rall Ratio (D^{1.0}) Kurtosis','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('16.1: Kurt Rall Ratio (D^{1.0}) - Linear','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('m: %f',controlm);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('m: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
     
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'161_Kurt_Rall_Ratio_1_Lin');
    print('-djpeg',filename); close all;
    
    
% Kurt Rall Ratio 1.0 - Exponential 

    figure;
    controldatax   = [controlanalysis.bifurcation.diameter.diameter];
    controldatay   = [controlanalysis.bifurcation.diameter.rallratio1.kurt];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.diameter.diameter];
    testdatay   = [testanalysis.bifurcation.diameter.rallratio1.kurt];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=exponentialfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=exponentialfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Rall Ratio (D^{1.0}) Kurtosis','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('16.2: Kurt Rall Ratio (D^{1.0}) - Exponential','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
   
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'162_Kurt_Rall_Ratio_1_Exp');
    print('-djpeg',filename); close all;
    
    
% Kurt Rall Ratio 1.0 - Power 

    figure;
    controldatax   = [controlanalysis.bifurcation.diameter.diameter];
    controldatay   = [controlanalysis.bifurcation.diameter.rallratio1.kurt];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.diameter.diameter];
    testdatay   = [testanalysis.bifurcation.diameter.rallratio1.kurt];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=powerfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=powerfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Rall Ratio (D^{1.0}) Kurtosis','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('16.3: Kurt Rall Ratio (D^{1.0}) - Power','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
       
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'163_Kurt_Rall_Ratio_1_Pow');
    print('-djpeg',filename); close all;
    
       
% Rall Ratio 1.5 - Linear 

    figure;
    controldatax   = [controlanalysis.bifurcation.diameter.diameter];
    controldatay   = [controlanalysis.bifurcation.diameter.rallratio.mean];
    controldatastd = [controlanalysis.bifurcation.diameter.rallratio.std];
    errorbar(controldatax,controldatay,controldatastd/2,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.diameter.diameter];
    testdatay   = [testanalysis.bifurcation.diameter.rallratio.mean];
    testdatastd = [testanalysis.bifurcation.diameter.rallratio.std];
    errorbar(testdatax,testdatay,testdatastd/2,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controlm,controlb,controlfitx,controlfity,controlfitr2]=linearfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testm,testb,testfitx,testfity,testfitr2]=linearfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Mean Rall Ratio (D^{1.5})','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('17.1: Mean Rall Ratio (D^{1.5}) - Linear','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('m: %f',controlm);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('m: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
    
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'171_Mean_Rall_Ratio_15_Lin');
    print('-djpeg',filename); close all;
        
    
% Rall Ratio 1.5 - Exponential 

    figure;
    controldatax   = [controlanalysis.bifurcation.diameter.diameter];
    controldatay   = [controlanalysis.bifurcation.diameter.rallratio.mean];
    controldatastd = [controlanalysis.bifurcation.diameter.rallratio.std];
    errorbar(controldatax,controldatay,controldatastd/2,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.diameter.diameter];
    testdatay   = [testanalysis.bifurcation.diameter.rallratio.mean];
    testdatastd = [testanalysis.bifurcation.diameter.rallratio.std];
    errorbar(testdatax,testdatay,testdatastd/2,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);

    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=exponentialfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=exponentialfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Mean Rall Ratio (D^{1.5})','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('17.2: Mean Rall Ratio (D^{1.5}) - Exponential','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
  
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'172_Mean_Rall_Ratio_15_Exp');
    print('-djpeg',filename); close all;
    
    
% Rall Ratio 1.5 - Power 

    figure;
    controldatax   = [controlanalysis.bifurcation.diameter.diameter];
    controldatay   = [controlanalysis.bifurcation.diameter.rallratio.mean];
    controldatastd = [controlanalysis.bifurcation.diameter.rallratio.std];
    errorbar(controldatax,controldatay,controldatastd/2,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.diameter.diameter];
    testdatay   = [testanalysis.bifurcation.diameter.rallratio.mean];
    testdatastd = [testanalysis.bifurcation.diameter.rallratio.std];
    errorbar(testdatax,testdatay,testdatastd/2,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=powerfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=powerfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Mean Rall Ratio (D^{1.5})','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('17.3: Mean Rall Ratio (D^{1.5}) - Power','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
     
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'173_Mean_Rall_Ratio_15_Pow');
    print('-djpeg',filename); close all;
    
        
% SD Rall Ratio 1.5 - Linear 

    figure;
    controldatax   = [controlanalysis.bifurcation.diameter.diameter];
    controldatay   = [controlanalysis.bifurcation.diameter.rallratio.std];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.diameter.diameter];
    testdatay   = [testanalysis.bifurcation.diameter.rallratio.std];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controlm,controlb,controlfitx,controlfity,controlfitr2]=linearfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testm,testb,testfitx,testfity,testfitr2]=linearfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Rall Ratio (D^{1.5}) SD','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('18.1: SD Rall Ratio (D^{1.5}) - Linear','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('m: %f',controlm);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('m: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
   
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'181_SD_Rall_Ratio_15_Lin');
    print('-djpeg',filename); close all;
    
    
% SD Rall Ratio 1.5 - Exponential 

    figure;
    controldatax   = [controlanalysis.bifurcation.diameter.diameter];
    controldatay   = [controlanalysis.bifurcation.diameter.rallratio.std];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.diameter.diameter];
    testdatay   = [testanalysis.bifurcation.diameter.rallratio.std];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=exponentialfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=exponentialfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Rall Ratio (D^{1.5}) SD','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('18.2: SD Rall Ratio (D^{1.5}) - Exponential','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
  
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'182_SD_Rall_Ratio_15_Exp');
    print('-djpeg',filename); close all;
    
   
% SD Rall Ratio 1.5 - Power 

    figure;
    controldatax   = [controlanalysis.bifurcation.diameter.diameter];
    controldatay   = [controlanalysis.bifurcation.diameter.rallratio.std];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.diameter.diameter];
    testdatay   = [testanalysis.bifurcation.diameter.rallratio.std];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=powerfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=powerfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Rall Ratio (D^{1.5}) SD','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('18.3: SD Rall Ratio (D^{1.5}) - Power','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
      
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'183_SD_Rall_Ratio_15_Pow');
    print('-djpeg',filename); close all;
    
    
% Skew Rall Ratio 1.5 - Linear 

    figure;
    controldatax   = [controlanalysis.bifurcation.diameter.diameter];
    controldatay   = [controlanalysis.bifurcation.diameter.rallratio.skew];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.diameter.diameter];
    testdatay   = [testanalysis.bifurcation.diameter.rallratio.skew];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controlm,controlb,controlfitx,controlfity,controlfitr2]=linearfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testm,testb,testfitx,testfity,testfitr2]=linearfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Rall Ratio (D^{1.5}) Skewness','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('19.1: Skew Rall Ratio (D^{1.5}) - Linear','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('m: %f',controlm);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('m: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
   
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'191_Skew_Rall_Ratio_15_Lin');
    print('-djpeg',filename); close all;
    
    
% Skew Rall Ratio 1.5 - Exponential 

    figure;
    controldatax   = [controlanalysis.bifurcation.diameter.diameter];
    controldatay   = [controlanalysis.bifurcation.diameter.rallratio.skew];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.diameter.diameter];
    testdatay   = [testanalysis.bifurcation.diameter.rallratio.skew];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=exponentialfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=exponentialfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Rall Ratio (D^{1.5}) Skewness','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('19.2: Skew Rall Ratio (D^{1.5}) - Exponential','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
       
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'192_Skew_Rall_Ratio_15_Exp');
    print('-djpeg',filename); close all;
    
   
% Skew Rall Ratio 1.5 - Power 

    figure;
    controldatax   = [controlanalysis.bifurcation.diameter.diameter];
    controldatay   = [controlanalysis.bifurcation.diameter.rallratio.skew];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.diameter.diameter];
    testdatay   = [testanalysis.bifurcation.diameter.rallratio.skew];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=powerfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=powerfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Rall Ratio (D^{1.5}) Skewness','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('19.3: Skew Rall Ratio (D^{1.5}) - Power','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
     
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'193_Skew_Rall_Ratio_15_Pow');
    print('-djpeg',filename); close all;
    
    
% Kurt Rall Ratio 1.5 - Linear 

    figure;
    controldatax   = [controlanalysis.bifurcation.diameter.diameter];
    controldatay   = [controlanalysis.bifurcation.diameter.rallratio.kurt];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.diameter.diameter];
    testdatay   = [testanalysis.bifurcation.diameter.rallratio.kurt];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controlm,controlb,controlfitx,controlfity,controlfitr2]=linearfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testm,testb,testfitx,testfity,testfitr2]=linearfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Rall Ratio (D^{1.5}) Kurtosis','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('20.1: Kurt Rall Ratio (D^{1.5}) - Linear','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('m: %f',controlm);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('m: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
     
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'201_Kurt_Rall_Ratio_15_Lin');
    print('-djpeg',filename); close all;
    
    
% Kurt Rall Ratio 1.5 - Exponential 

    figure;
    controldatax   = [controlanalysis.bifurcation.diameter.diameter];
    controldatay   = [controlanalysis.bifurcation.diameter.rallratio.kurt];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.diameter.diameter];
    testdatay   = [testanalysis.bifurcation.diameter.rallratio.kurt];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=exponentialfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=exponentialfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Rall Ratio (D^{1.5}) Kurtosis','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('20.2: Kurt Rall Ratio (D^{1.5}) - Exponential','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
      
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'202_Kurt_Rall_Ratio_15_Exp');
    print('-djpeg',filename); close all;
    
   
% Kurt Rall Ratio 1.5 - Power 

    figure;
    controldatax   = [controlanalysis.bifurcation.diameter.diameter];
    controldatay   = [controlanalysis.bifurcation.diameter.rallratio.kurt];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.diameter.diameter];
    testdatay   = [testanalysis.bifurcation.diameter.rallratio.kurt];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=powerfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=powerfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Rall Ratio (D^{1.5}) Kurtosis','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('20.3: Kurt Rall Ratio (D^{1.5}) - Power','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
       
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'203_Kurt_Rall_Ratio_15_Pow');
    print('-djpeg',filename); close all;
 
    
% Rall Ratio 2.0 - Linear 

    figure;
    controldatax   = [controlanalysis.bifurcation.diameter.diameter];
    controldatay   = [controlanalysis.bifurcation.diameter.rallratio2.mean];
    controldatastd = [controlanalysis.bifurcation.diameter.rallratio2.std];
    errorbar(controldatax,controldatay,controldatastd/2,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.diameter.diameter];
    testdatay   = [testanalysis.bifurcation.diameter.rallratio2.mean];
    testdatastd = [testanalysis.bifurcation.diameter.rallratio2.std];
    errorbar(testdatax,testdatay,testdatastd/2,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controlm,controlb,controlfitx,controlfity,controlfitr2]=linearfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testm,testb,testfitx,testfity,testfitr2]=linearfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Mean Rall Ratio (D^{2.0})','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('21.1: Mean Rall Ratio (D^{2.0}) - Linear','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('m: %f',controlm);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('m: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
       
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'211_Mean_Rall_Ratio_2_Lin');
    print('-djpeg',filename); close all;
    
        
% Rall Ratio 2.0 - Exponential 

    figure;
    controldatax   = [controlanalysis.bifurcation.diameter.diameter];
    controldatay   = [controlanalysis.bifurcation.diameter.rallratio2.mean];
    controldatastd = [controlanalysis.bifurcation.diameter.rallratio2.std];
    errorbar(controldatax,controldatay,controldatastd/2,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.diameter.diameter];
    testdatay   = [testanalysis.bifurcation.diameter.rallratio2.mean];
    testdatastd = [testanalysis.bifurcation.diameter.rallratio2.std];
    errorbar(testdatax,testdatay,testdatastd/2,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=exponentialfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=exponentialfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Mean Rall Ratio (D^{2.0})','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('21.2: Mean Rall Ratio (D^{2.0}) - Exponential','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'212_Mean_Rall_Ratio_2_Exp');
    print('-djpeg',filename); close all;
    
    
% Rall Ratio 2.0 - Power 

    figure;
    controldatax   = [controlanalysis.bifurcation.diameter.diameter];
    controldatay   = [controlanalysis.bifurcation.diameter.rallratio2.mean];
    controldatastd = [controlanalysis.bifurcation.diameter.rallratio2.std];
    errorbar(controldatax,controldatay,controldatastd/2,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.diameter.diameter];
    testdatay   = [testanalysis.bifurcation.diameter.rallratio2.mean];
    testdatastd = [testanalysis.bifurcation.diameter.rallratio2.std];
    errorbar(testdatax,testdatay,testdatastd/2,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=powerfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=powerfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Mean Rall Ratio (D^{2.0})','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('21.3: Mean Rall Ratio (D^{2.0}) - Power','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
     
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'213_Mean_Rall_Ratio_2_Pow');
    print('-djpeg',filename); close all;
    
    
% SD Rall Ratio 2.0 - Linear 

    figure;
    controldatax   = [controlanalysis.bifurcation.diameter.diameter];
    controldatay   = [controlanalysis.bifurcation.diameter.rallratio2.std];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.diameter.diameter];
    testdatay   = [testanalysis.bifurcation.diameter.rallratio2.std];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controlm,controlb,controlfitx,controlfity,controlfitr2]=linearfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testm,testb,testfitx,testfity,testfitr2]=linearfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Rall Ratio (D^{2.0}) SD','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('22.1: SD Rall Ratio (D^{2.0}) - Linear','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('m: %f',controlm);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('m: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'221_SD_Rall_Ratio_2_Lin');
    print('-djpeg',filename); close all;
    
    
% SD Rall Ratio 2.0 - Exponential 

    figure;
    controldatax   = [controlanalysis.bifurcation.diameter.diameter];
    controldatay   = [controlanalysis.bifurcation.diameter.rallratio2.std];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.diameter.diameter];
    testdatay   = [testanalysis.bifurcation.diameter.rallratio2.std];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=exponentialfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=exponentialfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Rall Ratio (D^{2.0}) SD','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('22.2: SD Rall Ratio (D^{2.0}) - Exponential','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
     
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'222_SD_Rall_Ratio_2_Exp');
    print('-djpeg',filename); close all;
    
    
% SD Rall Ratio 2.0 - Power 

    figure;
    controldatax   = [controlanalysis.bifurcation.diameter.diameter];
    controldatay   = [controlanalysis.bifurcation.diameter.rallratio2.std];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.diameter.diameter];
    testdatay   = [testanalysis.bifurcation.diameter.rallratio2.std];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=powerfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=powerfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Rall Ratio (D^{2.0}) SD','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('22.3: SD Rall Ratio (D^{2.0}) - Power','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'223_SD_Rall_Ratio_2_Pow');
    print('-djpeg',filename); close all;
   
    
% Skew Rall Ratio 2.0 - Linear 

    figure;
    controldatax   = [controlanalysis.bifurcation.diameter.diameter];
    controldatay   = [controlanalysis.bifurcation.diameter.rallratio2.skew];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.diameter.diameter];
    testdatay   = [testanalysis.bifurcation.diameter.rallratio2.skew];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controlm,controlb,controlfitx,controlfity,controlfitr2]=linearfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testm,testb,testfitx,testfity,testfitr2]=linearfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Rall Ratio (D^{2.0}) Skewness','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('23.1: Skew Rall Ratio (D^{2.0}) - Linear','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('m: %f',controlm);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('m: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'231_Skew_Rall_Ratio_2_Lin');
    print('-djpeg',filename); close all;
    
    
% Skew Rall Ratio 2.0 - Exponential 

    figure;
    controldatax   = [controlanalysis.bifurcation.diameter.diameter];
    controldatay   = [controlanalysis.bifurcation.diameter.rallratio2.skew];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.diameter.diameter];
    testdatay   = [testanalysis.bifurcation.diameter.rallratio2.skew];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=exponentialfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=exponentialfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Rall Ratio (D^{2.0}) Skewness','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('23.2: Skew Rall Ratio (D^{2.0}) - Exponential','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'232_Skew_Rall_Ratio_2_Exp');
    print('-djpeg',filename); close all;
    
     
% Skew Rall Ratio 2.0 - Power 

    figure;
    controldatax   = [controlanalysis.bifurcation.diameter.diameter];
    controldatay   = [controlanalysis.bifurcation.diameter.rallratio2.skew];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.diameter.diameter];
    testdatay   = [testanalysis.bifurcation.diameter.rallratio2.skew];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=powerfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=powerfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Rall Ratio (D^{2.0}) Skewness','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('23.3: Skew Rall Ratio (D^{2.0}) - Power','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'233_Skew_Rall_Ratio_2_Pow');
    print('-djpeg',filename); close all;
    
    
% Kurt Rall Ratio 2.0 - Linear 

    figure;
    controldatax   = [controlanalysis.bifurcation.diameter.diameter];
    controldatay   = [controlanalysis.bifurcation.diameter.rallratio2.kurt];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.diameter.diameter];
    testdatay   = [testanalysis.bifurcation.diameter.rallratio2.kurt];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controlm,controlb,controlfitx,controlfity,controlfitr2]=linearfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testm,testb,testfitx,testfity,testfitr2]=linearfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Rall Ratio (D^{2.0}) Kurtosis','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('24.1: Kurt Rall Ratio (D^{2.0}) - Linear','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('m: %f',controlm);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('m: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'241_Kurt_Rall_Ratio_2_Lin');
    print('-djpeg',filename); close all;
    
    
% Kurt Rall Ratio 2.0 - Exponential 

    figure;    
    controldatax   = [controlanalysis.bifurcation.diameter.diameter];
    controldatay   = [controlanalysis.bifurcation.diameter.rallratio2.kurt];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.diameter.diameter];
    testdatay   = [testanalysis.bifurcation.diameter.rallratio2.kurt];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=exponentialfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=exponentialfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Rall Ratio (D^{2.0}) Kurtosis','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('24.2: Kurt Rall Ratio (D^{2.0}) - Exponential','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
      
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'242_Kurt_Rall_Ratio_2_Exp');
    print('-djpeg',filename); close all;
    
    
% Kurt Rall Ratio 2.0 - Power 

    figure;
    controldatax   = [controlanalysis.bifurcation.diameter.diameter];
    controldatay   = [controlanalysis.bifurcation.diameter.rallratio2.kurt];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.diameter.diameter];
    testdatay   = [testanalysis.bifurcation.diameter.rallratio2.kurt];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=powerfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=powerfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Rall Ratio (D^{2.0}) Kurtosis','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('24.3: Kurt Rall Ratio (D^{2.0}) - Power','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'243_Kurt_Rall_Ratio_2_Pow');
    print('-djpeg',filename); close all;
   
    
% Parent / Daughter1 Ratio - Linear 

    figure;
    controldatax   = [controlanalysis.bifurcation.diameter.diameter];
    controldatay   = [controlanalysis.bifurcation.diameter.parentdaughterratio.mean];
    controldatastd = [controlanalysis.bifurcation.diameter.parentdaughterratio.std];
    errorbar(controldatax,controldatay,controldatastd/2,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.diameter.diameter];
    testdatay   = [testanalysis.bifurcation.diameter.parentdaughterratio.mean];
    testdatastd = [testanalysis.bifurcation.diameter.parentdaughterratio.std];
    errorbar(testdatax,testdatay,testdatastd/2,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controlm,controlb,controlfitx,controlfity,controlfitr2]=linearfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testm,testb,testfitx,testfity,testfitr2]=linearfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Mean Parent / Daughter_1 Ratio','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('25.1: Mean Parent / Daughter_1 Ratio - Linear','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('m: %f',controlm);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('m: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
     
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'251_Mean_Parent_Daughter_1_Lin');
    print('-djpeg',filename); close all;
    
    
% Parent / Daughter1 Ratio - Exponential 

    figure;
    controldatax   = [controlanalysis.bifurcation.diameter.diameter];
    controldatay   = [controlanalysis.bifurcation.diameter.parentdaughterratio.mean];
    controldatastd = [controlanalysis.bifurcation.diameter.parentdaughterratio.std];
    errorbar(controldatax,controldatay,controldatastd/2,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.diameter.diameter];
    testdatay   = [testanalysis.bifurcation.diameter.parentdaughterratio.mean];
    testdatastd = [testanalysis.bifurcation.diameter.parentdaughterratio.std];
    errorbar(testdatax,testdatay,testdatastd/2,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=exponentialfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=exponentialfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Mean Parent / Daughter_1 Ratio','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('25.2: Mean Parent / Daughter_1 Ratio - Exponential','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'252_Mean_Parent_Daughter_1_Exp');
    print('-djpeg',filename); close all;
 
    
% Parent / Daughter1 Ratio - Power 

    figure; 
    controldatax   = [controlanalysis.bifurcation.diameter.diameter];
    controldatay   = [controlanalysis.bifurcation.diameter.parentdaughterratio.mean];
    controldatastd = [controlanalysis.bifurcation.diameter.parentdaughterratio.std];
    errorbar(controldatax,controldatay,controldatastd/2,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.diameter.diameter];
    testdatay   = [testanalysis.bifurcation.diameter.parentdaughterratio.mean];
    testdatastd = [testanalysis.bifurcation.diameter.parentdaughterratio.std];
    errorbar(testdatax,testdatay,testdatastd/2,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=powerfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=powerfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Mean Parent / Daughter_1 Ratio','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('25.3: Mean Parent / Daughter_1 Ratio - Power','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'253_Mean_Parent_Daughter_1_Pow');
    print('-djpeg',filename); close all;
    
    
% SD Parent / Daughter1 Ratio - Linear 

    figure;
    controldatax   = [controlanalysis.bifurcation.diameter.diameter];
    controldatay   = [controlanalysis.bifurcation.diameter.parentdaughterratio.std];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.diameter.diameter];
    testdatay   = [testanalysis.bifurcation.diameter.parentdaughterratio.std];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controlm,controlb,controlfitx,controlfity,controlfitr2]=linearfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testm,testb,testfitx,testfity,testfitr2]=linearfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Parent / Daughter_1 Ratio SD','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('26.1: SD Parent / Daughter_1 Ratio - Linear','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('m: %f',controlm);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('m: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'265_SD_Parent_Daughter_1_Lin');
    print('-djpeg',filename); close all;
    
    
% SD Parent / Daughter1 Ratio - Exponential 

    figure;
    controldatax   = [controlanalysis.bifurcation.diameter.diameter];
    controldatay   = [controlanalysis.bifurcation.diameter.parentdaughterratio.std];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.diameter.diameter];
    testdatay   = [testanalysis.bifurcation.diameter.parentdaughterratio.std];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=exponentialfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=exponentialfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Parent / Daughter_1 Ratio SD','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('26.2: SD Parent / Daughter_1 Ratio - Exponential','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'262_SD_Parent_Daughter_1_Exp');
    print('-djpeg',filename); close all;
    
    
% SD Parent / Daughter1 Ratio - Power 

    figure;
    controldatax   = [controlanalysis.bifurcation.diameter.diameter];
    controldatay   = [controlanalysis.bifurcation.diameter.parentdaughterratio.std];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.diameter.diameter];
    testdatay   = [testanalysis.bifurcation.diameter.parentdaughterratio.std];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=powerfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=powerfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Parent / Daughter_1 Ratio SD','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('26.3: SD Parent / Daughter_1 Ratio - Power','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'263_SD_Parent_Daughter_1_Pow');
    print('-djpeg',filename); close all;
  
    
% Skew Parent / Daughter1 Ratio - Linear 

    figure;
    controldatax   = [controlanalysis.bifurcation.diameter.diameter];
    controldatay   = [controlanalysis.bifurcation.diameter.parentdaughterratio.skew];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.diameter.diameter];
    testdatay   = [testanalysis.bifurcation.diameter.parentdaughterratio.skew];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controlm,controlb,controlfitx,controlfity,controlfitr2]=linearfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testm,testb,testfitx,testfity,testfitr2]=linearfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Parent / Daughter_1 Ratio Skewness','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('27.1: Skew Parent / Daughter_1 Ratio - Linear','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('m: %f',controlm);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('m: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'271_Skew_Parent_Daughter_1_Lin');
    print('-djpeg',filename); close all;
    
    
% Skew Parent / Daughter1 Ratio - Exponential 

    figure;
    controldatax   = [controlanalysis.bifurcation.diameter.diameter];
    controldatay   = [controlanalysis.bifurcation.diameter.parentdaughterratio.skew];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.diameter.diameter];
    testdatay   = [testanalysis.bifurcation.diameter.parentdaughterratio.skew];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=exponentialfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=exponentialfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Parent / Daughter_1 Ratio Skewness','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('27.2: Skew Parent / Daughter_1 Ratio - Exponential','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
      
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'272_Skew_Parent_Daughter_1_Exp');
    print('-djpeg',filename); close all;
    
   
% Skew Parent / Daughter1 Ratio - Power 

    figure;
    controldatax   = [controlanalysis.bifurcation.diameter.diameter];
    controldatay   = [controlanalysis.bifurcation.diameter.parentdaughterratio.skew];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.diameter.diameter];
    testdatay   = [testanalysis.bifurcation.diameter.parentdaughterratio.skew];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=powerfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=powerfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Parent / Daughter_1 Ratio Skewness','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('27.3: Skew Parent / Daughter_1 Ratio - Power','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'273_Skew_Parent_Daughter_1_Pow');
    print('-djpeg',filename); close all;
    
    
% Kurt Parent / Daughter1 Ratio - Linear 

    figure;
    controldatax   = [controlanalysis.bifurcation.diameter.diameter];
    controldatay   = [controlanalysis.bifurcation.diameter.parentdaughterratio.kurt];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.diameter.diameter];
    testdatay   = [testanalysis.bifurcation.diameter.parentdaughterratio.kurt];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controlm,controlb,controlfitx,controlfity,controlfitr2]=linearfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testm,testb,testfitx,testfity,testfitr2]=linearfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Parent / Daughter_1 Ratio Kurtosis','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('28.1: Kurt Parent / Daughter_1 Ratio - Linear','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('m: %f',controlm);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('m: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'281_Kurt_Parent_Daughter_1_Lin');
    print('-djpeg',filename); close all;
    
    
% Kurt Parent / Daughter1 Ratio - Exponential 

    figure;    
    controldatax   = [controlanalysis.bifurcation.diameter.diameter];
    controldatay   = [controlanalysis.bifurcation.diameter.parentdaughterratio.kurt];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.diameter.diameter];
    testdatay   = [testanalysis.bifurcation.diameter.parentdaughterratio.kurt];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=exponentialfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=exponentialfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Parent / Daughter_1 Ratio Kurtosis','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('28.2: Kurt Parent / Daughter_1 Ratio - Exponential','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'282_Kurt_Parent_Daughter_1_Exp');
    print('-djpeg',filename); close all;
    
   
% Kurt Parent / Daughter1 Ratio - Power 

    figure;
    controldatax   = [controlanalysis.bifurcation.diameter.diameter];
    controldatay   = [controlanalysis.bifurcation.diameter.parentdaughterratio.kurt];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.diameter.diameter];
    testdatay   = [testanalysis.bifurcation.diameter.parentdaughterratio.kurt];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=powerfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=powerfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Parent / Daughter_1 Ratio Kurtosis','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('28.3: Kurt Parent / Daughter_1 Ratio - Power','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'283_Kurt_Parent_Daughter_1_Pow');
    print('-djpeg',filename); close all;
    

% Parent / Daughter2 Ratio - Linear 

    figure;
    controldatax   = [controlanalysis.bifurcation.diameter.diameter];
    controldatay   = [controlanalysis.bifurcation.diameter.parentdaughter2ratio.mean];
    controldatastd = [controlanalysis.bifurcation.diameter.parentdaughter2ratio.std];
    errorbar(controldatax,controldatay,controldatastd/2,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.diameter.diameter];
    testdatay   = [testanalysis.bifurcation.diameter.parentdaughter2ratio.mean];
    testdatastd = [testanalysis.bifurcation.diameter.parentdaughter2ratio.std];
    errorbar(testdatax,testdatay,testdatastd/2,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controlm,controlb,controlfitx,controlfity,controlfitr2]=linearfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testm,testb,testfitx,testfity,testfitr2]=linearfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Mean Parent / Daughter_2 Ratio','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('29.1: Mean Parent / Daughter_2 Ratio - Linear','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('m: %f',controlm);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('m: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'291_Mean_Parent_Daughter_2_Lin');
    print('-djpeg',filename); close all;
  
    
% Parent / Daughter2 Ratio - Exponential 

    figure;  
    controldatax   = [controlanalysis.bifurcation.diameter.diameter];
    controldatay   = [controlanalysis.bifurcation.diameter.parentdaughter2ratio.mean];
    controldatastd = [controlanalysis.bifurcation.diameter.parentdaughter2ratio.std];
    errorbar(controldatax,controldatay,controldatastd/2,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.diameter.diameter];
    testdatay   = [testanalysis.bifurcation.diameter.parentdaughter2ratio.mean];
    testdatastd = [testanalysis.bifurcation.diameter.parentdaughter2ratio.std];
    errorbar(testdatax,testdatay,testdatastd/2,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=exponentialfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=exponentialfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Mean Parent / Daughter_2 Ratio','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('29.2: Mean Parent / Daughter_2 Ratio - Exponential','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'292_Mean_Parent_Daughter_2_Exp');
    print('-djpeg',filename); close all;
    
    
% Parent / Daughter2 Ratio - Power 

    figure;
    controldatax   = [controlanalysis.bifurcation.diameter.diameter];
    controldatay   = [controlanalysis.bifurcation.diameter.parentdaughter2ratio.mean];
    controldatastd = [controlanalysis.bifurcation.diameter.parentdaughter2ratio.std];
    errorbar(controldatax,controldatay,controldatastd/2,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.diameter.diameter];
    testdatay   = [testanalysis.bifurcation.diameter.parentdaughter2ratio.mean];
    testdatastd = [testanalysis.bifurcation.diameter.parentdaughter2ratio.std];
    errorbar(testdatax,testdatay,testdatastd/2,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=powerfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=powerfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Mean Parent / Daughter_2 Ratio','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('29.3: Mean Parent / Daughter_2 Ratio - Power','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'293_Mean_Parent_Daughter_2_Pow');
    print('-djpeg',filename); close all;
    
    
% SD Parent / Daughter2 Ratio - Linear 

    figure;  
    controldatax   = [controlanalysis.bifurcation.diameter.diameter];
    controldatay   = [controlanalysis.bifurcation.diameter.parentdaughter2ratio.std];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.diameter.diameter];
    testdatay   = [testanalysis.bifurcation.diameter.parentdaughter2ratio.std];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controlm,controlb,controlfitx,controlfity,controlfitr2]=linearfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testm,testb,testfitx,testfity,testfitr2]=linearfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Parent / Daughter_2 Ratio SD','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('30.1: SD Parent / Daughter_2 Ratio - Linear','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('m: %f',controlm);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('m: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'305_SD_Parent_Daughter_2_Lin');
    print('-djpeg',filename); close all;
    
    
% SD Parent / Daughter2 Ratio - Exponential 

    figure;
    controldatax   = [controlanalysis.bifurcation.diameter.diameter];
    controldatay   = [controlanalysis.bifurcation.diameter.parentdaughter2ratio.std];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.diameter.diameter];
    testdatay   = [testanalysis.bifurcation.diameter.parentdaughter2ratio.std];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=exponentialfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=exponentialfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Parent / Daughter_2 Ratio SD','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('30.2: SD Parent / Daughter_2 Ratio - Exponential','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'302_SD_Parent_Daughter_2_Exp');
    print('-djpeg',filename); close all;
 
    
% SD Parent / Daughter2 Ratio - Power 

    figure;
    controldatax   = [controlanalysis.bifurcation.diameter.diameter];
    controldatay   = [controlanalysis.bifurcation.diameter.parentdaughter2ratio.std];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.diameter.diameter];
    testdatay   = [testanalysis.bifurcation.diameter.parentdaughter2ratio.std];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=powerfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=powerfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Parent / Daughter_2 Ratio SD','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('30.3: SD Parent / Daughter_2 Ratio - Power','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'303_SD_Parent_Daughter_2_Pow');
    print('-djpeg',filename); close all;
    
    
% Skew Parent / Daughter2 Ratio - Linear 

    figure;
    controldatax   = [controlanalysis.bifurcation.diameter.diameter];
    controldatay   = [controlanalysis.bifurcation.diameter.parentdaughter2ratio.skew];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.diameter.diameter];
    testdatay   = [testanalysis.bifurcation.diameter.parentdaughter2ratio.skew];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controlm,controlb,controlfitx,controlfity,controlfitr2]=linearfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testm,testb,testfitx,testfity,testfitr2]=linearfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Parent / Daughter_2 Ratio Skewness','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('31.1: Skew Parent / Daughter_2 Ratio - Linear','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('m: %f',controlm);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('m: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'311_Skew_Parent_Daughter_2_Lin');
    print('-djpeg',filename); close all;
    
    
% Skew Parent / Daughter2 Ratio - Exponential 

    figure;
    controldatax   = [controlanalysis.bifurcation.diameter.diameter];
    controldatay   = [controlanalysis.bifurcation.diameter.parentdaughter2ratio.skew];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.diameter.diameter];
    testdatay   = [testanalysis.bifurcation.diameter.parentdaughter2ratio.skew];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=exponentialfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=exponentialfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Parent / Daughter_2 Ratio Skewness','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('31.2: Skew Parent / Daughter_2 Ratio - Exponential','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'312_Skew_Parent_Daughter_2_Exp');
    print('-djpeg',filename); close all;
    
   
% Skew Parent / Daughter2 Ratio - Power 

    figure;
    controldatax   = [controlanalysis.bifurcation.diameter.diameter];
    controldatay   = [controlanalysis.bifurcation.diameter.parentdaughter2ratio.skew];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.diameter.diameter];
    testdatay   = [testanalysis.bifurcation.diameter.parentdaughter2ratio.skew];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=powerfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=powerfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Parent / Daughter_2 Ratio Skewness','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('31.3: Skew Parent / Daughter_2 Ratio - Power','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'313_Skew_Parent_Daughter_2_Pow');
    print('-djpeg',filename); close all;
   
    
% Kurt Parent / Daughter2 Ratio - Linear 

    figure;
    controldatax   = [controlanalysis.bifurcation.diameter.diameter];
    controldatay   = [controlanalysis.bifurcation.diameter.parentdaughter2ratio.kurt];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.diameter.diameter];
    testdatay   = [testanalysis.bifurcation.diameter.parentdaughter2ratio.kurt];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controlm,controlb,controlfitx,controlfity,controlfitr2]=linearfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testm,testb,testfitx,testfity,testfitr2]=linearfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Parent / Daughter_2 Ratio Kurtosis','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('32.1: Kurt Parent / Daughter_2 Ratio - Linear','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('m: %f',controlm);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('m: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'321_Kurt_Parent_Daughter_2_Lin');
    print('-djpeg',filename); close all;
    
    
% Kurt Parent / Daughter2 Ratio - Exponential 

    figure;
    controldatax   = [controlanalysis.bifurcation.diameter.diameter];
    controldatay   = [controlanalysis.bifurcation.diameter.parentdaughter2ratio.kurt];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.diameter.diameter];
    testdatay   = [testanalysis.bifurcation.diameter.parentdaughter2ratio.kurt];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=exponentialfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=exponentialfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Parent / Daughter_2 Ratio Kurtosis','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('32.2: Kurt Parent / Daughter_2 Ratio - Exponential','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'322_Kurt_Parent_Daughter_2_Exp');
    print('-djpeg',filename); close all;
    
    
% Kurt Parent / Daughter2 Ratio - Power 

    figure;
    controldatax   = [controlanalysis.bifurcation.diameter.diameter];
    controldatay   = [controlanalysis.bifurcation.diameter.parentdaughter2ratio.kurt];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.diameter.diameter];
    testdatay   = [testanalysis.bifurcation.diameter.parentdaughter2ratio.kurt];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=powerfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=powerfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Parent / Daughter_2 Ratio Kurtosis','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('32.3: Kurt Parent / Daughter_2 Ratio - Power','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'323_Kurt_Parent_Daughter_2_Pow');
    print('-djpeg',filename); close all; close all;


% Daughter Ratio - Linear 

    figure;
    controldatax   = [controlanalysis.bifurcation.diameter.diameter];
    controldatay   = [controlanalysis.bifurcation.diameter.daughterratio.mean];
    controldatastd = [controlanalysis.bifurcation.diameter.daughterratio.std];
    errorbar(controldatax,controldatay,controldatastd/2,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.diameter.diameter];
    testdatay   = [testanalysis.bifurcation.diameter.daughterratio.mean];
    testdatastd = [testanalysis.bifurcation.diameter.daughterratio.std];
    errorbar(testdatax,testdatay,testdatastd/2,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controlm,controlb,controlfitx,controlfity,controlfitr2]=linearfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testm,testb,testfitx,testfity,testfitr2]=linearfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Mean Daughter Ratio','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('33.1: Mean Daughter Ratio - Linear','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('m: %f',controlm);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('m: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
       
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'331_Mean_Daughter_Ratio_Lin');
    print('-djpeg',filename); close all;
       
    
% Daughter Ratio - Exponential 

    figure;
    controldatax   = [controlanalysis.bifurcation.diameter.diameter];
    controldatay   = [controlanalysis.bifurcation.diameter.daughterratio.mean];
    controldatastd = [controlanalysis.bifurcation.diameter.daughterratio.std];
    errorbar(controldatax,controldatay,controldatastd/2,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.diameter.diameter];
    testdatay   = [testanalysis.bifurcation.diameter.daughterratio.mean];
    testdatastd = [testanalysis.bifurcation.diameter.daughterratio.std];
    errorbar(testdatax,testdatay,testdatastd/2,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=exponentialfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=exponentialfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Mean Daughter Ratio','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('33.2: Mean Daughter Ratio - Exponential','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'332_Mean_Daughter_Ratio_Exp');
    print('-djpeg',filename); close all;
    
    
% Daughter Ratio - Power 

    figure;
    controldatax   = [controlanalysis.bifurcation.diameter.diameter];
    controldatay   = [controlanalysis.bifurcation.diameter.daughterratio.mean];
    controldatastd = [controlanalysis.bifurcation.diameter.daughterratio.std];
    errorbar(controldatax,controldatay,controldatastd/2,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.diameter.diameter];
    testdatay   = [testanalysis.bifurcation.diameter.daughterratio.mean];
    testdatastd = [testanalysis.bifurcation.diameter.daughterratio.std];
    errorbar(testdatax,testdatay,testdatastd/2,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=powerfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=powerfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Mean Daughter Ratio','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('33.3: Mean Daughter Ratio - Power','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'333_Mean_Daughter_Ratio_Pow');
    print('-djpeg',filename); close all;
    
    
% SD Daughter Ratio - Linear 

    figure;
    controldatax   = [controlanalysis.bifurcation.diameter.diameter];
    controldatay   = [controlanalysis.bifurcation.diameter.daughterratio.std];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.diameter.diameter];
    testdatay   = [testanalysis.bifurcation.diameter.daughterratio.std];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controlm,controlb,controlfitx,controlfity,controlfitr2]=linearfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testm,testb,testfitx,testfity,testfitr2]=linearfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Daughter Ratio SD','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('34.1: SD Daughter Ratio - Linear','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('m: %f',controlm);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('m: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'341_SD_Daughter_Ratio_Lin');
    print('-djpeg',filename); close all;
    
    
% SD Daughter Ratio - Exponential 

    figure;
    controldatax   = [controlanalysis.bifurcation.diameter.diameter];
    controldatay   = [controlanalysis.bifurcation.diameter.daughterratio.std];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.diameter.diameter];
    testdatay   = [testanalysis.bifurcation.diameter.daughterratio.std];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=exponentialfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=exponentialfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Daughter Ratio SD','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('34.2: SD Daughter Ratio - Exponential','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'342_SD_Daughter_Ratio_Exp');
    print('-djpeg',filename); close all;
    
    
% SD Daughter Ratio - Power 

    figure;
    controldatax   = [controlanalysis.bifurcation.diameter.diameter];
    controldatay   = [controlanalysis.bifurcation.diameter.daughterratio.std];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.diameter.diameter];
    testdatay   = [testanalysis.bifurcation.diameter.daughterratio.std];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=powerfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=powerfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Daughter Ratio SD','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('34.3: SD Daughter Ratio - Power','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'343_SD_Daughter_Ratio_Pow');
    print('-djpeg',filename); close all;
  
    
% Skew Daughter Ratio - Linear 

    figure;
    controldatax   = [controlanalysis.bifurcation.diameter.diameter];
    controldatay   = [controlanalysis.bifurcation.diameter.daughterratio.skew];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.diameter.diameter];
    testdatay   = [testanalysis.bifurcation.diameter.daughterratio.skew];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controlm,controlb,controlfitx,controlfity,controlfitr2]=linearfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testm,testb,testfitx,testfity,testfitr2]=linearfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Daughter Ratio Skewness','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('35.1: Skew Daughter Ratio - Linear','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('m: %f',controlm);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('m: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'351_Skew_Daughter_Ratio_Lin');
    print('-djpeg',filename); close all;
    
    
% Skew Daughter Ratio - Exponential 

    figure;
    controldatax   = [controlanalysis.bifurcation.diameter.diameter];
    controldatay   = [controlanalysis.bifurcation.diameter.daughterratio.skew];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.diameter.diameter];
    testdatay   = [testanalysis.bifurcation.diameter.daughterratio.skew];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=exponentialfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=exponentialfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Daughter Ratio Skewness','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('35.2: Skew Daughter Ratio - Exponential','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'352_Skew_Daughter_Ratio_Exp');
    print('-djpeg',filename); close all;
    
      
% Skew Daughter Ratio - Power 

    figure;
    controldatax   = [controlanalysis.bifurcation.diameter.diameter];
    controldatay   = [controlanalysis.bifurcation.diameter.daughterratio.skew];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.diameter.diameter];
    testdatay   = [testanalysis.bifurcation.diameter.daughterratio.skew];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=powerfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=powerfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Daughter Ratio Skewness','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('35.3: Skew Daughter Ratio - Power','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'353_Skew_Daughter_Ratio_Pow');
    print('-djpeg',filename); close all;
    
    
% Kurt Daughter Ratio - Linear 

    figure;
    controldatax   = [controlanalysis.bifurcation.diameter.diameter];
    controldatay   = [controlanalysis.bifurcation.diameter.daughterratio.kurt];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.diameter.diameter];
    testdatay   = [testanalysis.bifurcation.diameter.daughterratio.kurt];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controlm,controlb,controlfitx,controlfity,controlfitr2]=linearfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testm,testb,testfitx,testfity,testfitr2]=linearfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Daughter Ratio Kurtosis','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('36.1: Kurt Daughter Ratio - Linear','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('m: %f',controlm);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('m: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'361_Kurt_Daughter_Ratio_Lin');
    print('-djpeg',filename); close all;
    
    
% Kurt Daughter Ratio - Exponential 

    figure;
    controldatax   = [controlanalysis.bifurcation.diameter.diameter];
    controldatay   = [controlanalysis.bifurcation.diameter.daughterratio.kurt];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.diameter.diameter];
    testdatay   = [testanalysis.bifurcation.diameter.daughterratio.kurt];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=exponentialfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=exponentialfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Daughter Ratio Kurtosis','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('36.2: Kurt Daughter Ratio - Exponential','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'362_Kurt_Daughter_Ratio_Exp');
    print('-djpeg',filename); close all;
    
   
% Kurt Daughter Ratio - Power 

    figure;
    controldatax   = [controlanalysis.bifurcation.diameter.diameter];
    controldatay   = [controlanalysis.bifurcation.diameter.daughterratio.kurt];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.diameter.diameter];
    testdatay   = [testanalysis.bifurcation.diameter.daughterratio.kurt];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=powerfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=powerfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Daughter Ratio Kurtosis','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('36.3: Kurt Daughter Ratio - Power','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'363_Kurt_Daughter_Ratio_Pow');
    print('-djpeg',filename); close all;
    

% Rall Ratio 1.0 - Linear 

    figure;
    controldatax   = [controlanalysis.bifurcation.pathlength.pathlength];
    controldatay   = [controlanalysis.bifurcation.pathlength.rallratio1.mean];
    controldatastd = [controlanalysis.bifurcation.pathlength.rallratio1.std];
    errorbar(controldatax,controldatay,controldatastd/2,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.pathlength.pathlength];
    testdatay   = [testanalysis.bifurcation.pathlength.rallratio1.mean];
    testdatastd = [testanalysis.bifurcation.pathlength.rallratio1.std];
    errorbar(testdatax,testdatay,testdatastd/2,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controlm,controlb,controlfitx,controlfity,controlfitr2]=linearfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testm,testb,testfitx,testfity,testfitr2]=linearfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Mean Rall Ratio (D^{1.0})','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('13.1: Mean Rall Ratio (D^{1.0}) - Linear','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('m: %f',controlm);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('m: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
      
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'131b_Mean_Rall_Ratio_1_Lin');
    print('-djpeg',filename); close all;
    
    
% Rall Ratio 1.0 - Exponential 

    figure;
    controldatax   = [controlanalysis.bifurcation.pathlength.pathlength];
    controldatay   = [controlanalysis.bifurcation.pathlength.rallratio1.mean];
    controldatastd = [controlanalysis.bifurcation.pathlength.rallratio1.std];
    errorbar(controldatax,controldatay,controldatastd/2,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.pathlength.pathlength];
    testdatay   = [testanalysis.bifurcation.pathlength.rallratio1.mean];
    testdatastd = [testanalysis.bifurcation.pathlength.rallratio1.std];
    errorbar(testdatax,testdatay,testdatastd/2,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=exponentialfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=exponentialfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Mean Rall Ratio (D^{1.0})','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('13.2: Mean Rall Ratio (D^{1.0}) - Exponential','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'132b_Mean_Rall_Ratio_1_Exp');
    print('-djpeg',filename); close all;
    
    
% Rall Ratio 1.0 - Power 

    figure;
    controldatax   = [controlanalysis.bifurcation.pathlength.pathlength];
    controldatay   = [controlanalysis.bifurcation.pathlength.rallratio1.mean];
    controldatastd = [controlanalysis.bifurcation.pathlength.rallratio1.std];
    errorbar(controldatax,controldatay,controldatastd/2,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.pathlength.pathlength];
    testdatay   = [testanalysis.bifurcation.pathlength.rallratio1.mean];
    testdatastd = [testanalysis.bifurcation.pathlength.rallratio1.std];
    errorbar(testdatax,testdatay,testdatastd/2,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=powerfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=powerfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Mean Rall Ratio (D^{1.0})','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('13.3: Mean Rall Ratio (D^{1.0}) - Power','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');

    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'133b_Mean_Rall_Ratio_1_Pow');
    print('-djpeg',filename); close all;
    
    
% SD Rall Ratio 1.0 - Linear 

    figure;
    controldatax   = [controlanalysis.bifurcation.pathlength.pathlength];
    controldatay   = [controlanalysis.bifurcation.pathlength.rallratio1.std];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.pathlength.pathlength];
    testdatay   = [testanalysis.bifurcation.pathlength.rallratio1.std];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controlm,controlb,controlfitx,controlfity,controlfitr2]=linearfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testm,testb,testfitx,testfity,testfitr2]=linearfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Rall Ratio (D^{1.0}) SD','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('14.1: SD Rall Ratio (D^{1.0}) - Linear','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('m: %f',controlm);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('m: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'141b_SD_Rall_Ratio_1_Lin');
    print('-djpeg',filename); close all;
    
    
% SD Rall Ratio 1.0 - Exponential 

    figure;
    controldatax   = [controlanalysis.bifurcation.pathlength.pathlength];
    controldatay   = [controlanalysis.bifurcation.pathlength.rallratio1.std];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.pathlength.pathlength];
    testdatay   = [testanalysis.bifurcation.pathlength.rallratio1.std];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=exponentialfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=exponentialfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Rall Ratio (D^{1.0}) SD','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('14.2: SD Rall Ratio (D^{1.0}) - Exponential','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'142b_SD_Rall_Ratio_1_Exp');
    print('-djpeg',filename); close all;
    
    
% SD Rall Ratio 1.0 - Power 

    figure;
    controldatax   = [controlanalysis.bifurcation.pathlength.pathlength];
    controldatay   = [controlanalysis.bifurcation.pathlength.rallratio1.std];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.pathlength.pathlength];
    testdatay   = [testanalysis.bifurcation.pathlength.rallratio1.std];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=powerfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=powerfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Rall Ratio (D^{1.0}) SD','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('14.3: SD Rall Ratio (D^{1.0}) - Power','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'143b_SD_Rall_Ratio_1_Pow');
    print('-djpeg',filename); close all;
 
    
% Skew Rall Ratio 1.0 - Linear 

    figure;
    controldatax   = [controlanalysis.bifurcation.pathlength.pathlength];
    controldatay   = [controlanalysis.bifurcation.pathlength.rallratio1.skew];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.pathlength.pathlength];
    testdatay   = [testanalysis.bifurcation.pathlength.rallratio1.skew];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controlm,controlb,controlfitx,controlfity,controlfitr2]=linearfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testm,testb,testfitx,testfity,testfitr2]=linearfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Rall Ratio (D^{1.0}) Skewness','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('15.1: Skew Rall Ratio (D^{1.0}) - Linear','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('m: %f',controlm);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('m: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'151b_Skew_Rall_Ratio_1_Lin');
    print('-djpeg',filename); close all;
    
    
% Skew Rall Ratio 1.0 - Exponential 

    figure;
    controldatax   = [controlanalysis.bifurcation.pathlength.pathlength];
    controldatay   = [controlanalysis.bifurcation.pathlength.rallratio1.skew];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.pathlength.pathlength];
    testdatay   = [testanalysis.bifurcation.pathlength.rallratio1.skew];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=exponentialfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=exponentialfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Rall Ratio (D^{1.0}) Skewness','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('15.2: Skew Rall Ratio (D^{1.0}) - Exponential','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'152b_Skew_Rall_Ratio_1_Exp');
    print('-djpeg',filename); close all;
    
       
% Skew Rall Ratio 1.0 - Power 

    figure;
    controldatax   = [controlanalysis.bifurcation.pathlength.pathlength];
    controldatay   = [controlanalysis.bifurcation.pathlength.rallratio1.skew];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.pathlength.pathlength];
    testdatay   = [testanalysis.bifurcation.pathlength.rallratio1.skew];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=powerfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=powerfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Rall Ratio (D^{1.0}) Skewness','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('15.3: Skew Rall Ratio (D^{1.0}) - Power','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'153b_Skew_Rall_Ratio_1_Pow');
    print('-djpeg',filename); close all;
   
    
% Kurt Rall Ratio 1.0 - Linear 

    figure;
    controldatax   = [controlanalysis.bifurcation.pathlength.pathlength];
    controldatay   = [controlanalysis.bifurcation.pathlength.rallratio1.kurt];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.pathlength.pathlength];
    testdatay   = [testanalysis.bifurcation.pathlength.rallratio1.kurt];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controlm,controlb,controlfitx,controlfity,controlfitr2]=linearfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testm,testb,testfitx,testfity,testfitr2]=linearfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Rall Ratio (D^{1.0}) Kurtosis','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('16.1: Kurt Rall Ratio (D^{1.0}) - Linear','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('m: %f',controlm);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('m: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'161b_Kurt_Rall_Ratio_1_Lin');
    print('-djpeg',filename); close all;
    
    
% Kurt Rall Ratio 1.0 - Exponential 

    figure;
    controldatax   = [controlanalysis.bifurcation.pathlength.pathlength];
    controldatay   = [controlanalysis.bifurcation.pathlength.rallratio1.kurt];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.pathlength.pathlength];
    testdatay   = [testanalysis.bifurcation.pathlength.rallratio1.kurt];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=exponentialfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=exponentialfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Rall Ratio (D^{1.0}) Kurtosis','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('16.2: Kurt Rall Ratio (D^{1.0}) - Exponential','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'162b_Kurt_Rall_Ratio_1_Exp');
    print('-djpeg',filename); close all;
    
    
% Kurt Rall Ratio 1.0 - Power 

    figure;
    controldatax   = [controlanalysis.bifurcation.pathlength.pathlength];
    controldatay   = [controlanalysis.bifurcation.pathlength.rallratio1.kurt];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.pathlength.pathlength];
    testdatay   = [testanalysis.bifurcation.pathlength.rallratio1.kurt];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=powerfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=powerfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Rall Ratio (D^{1.0}) Kurtosis','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('16.3: Kurt Rall Ratio (D^{1.0}) - Power','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'163b_Kurt_Rall_Ratio_1_Pow');
    print('-djpeg',filename); close all;
  
    
% Rall Ratio 1.5 - Linear 

    figure;
    controldatax   = [controlanalysis.bifurcation.pathlength.pathlength];
    controldatay   = [controlanalysis.bifurcation.pathlength.rallratio.mean];
    controldatastd = [controlanalysis.bifurcation.pathlength.rallratio.std];
    errorbar(controldatax,controldatay,controldatastd/2,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.pathlength.pathlength];
    testdatay   = [testanalysis.bifurcation.pathlength.rallratio.mean];
    testdatastd = [testanalysis.bifurcation.pathlength.rallratio.std];
    errorbar(testdatax,testdatay,testdatastd/2,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controlm,controlb,controlfitx,controlfity,controlfitr2]=linearfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testm,testb,testfitx,testfity,testfitr2]=linearfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Mean Rall Ratio (D^{1.5})','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('17.1: Mean Rall Ratio (D^{1.5}) - Linear','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('m: %f',controlm);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('m: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'171b_Mean_Rall_Ratio_15_Lin');
    print('-djpeg',filename); close all;
       
    
% Rall Ratio 1.5 - Exponential 

    figure;
    controldatax   = [controlanalysis.bifurcation.pathlength.pathlength];
    controldatay   = [controlanalysis.bifurcation.pathlength.rallratio.mean];
    controldatastd = [controlanalysis.bifurcation.pathlength.rallratio.std];
    errorbar(controldatax,controldatay,controldatastd/2,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.pathlength.pathlength];
    testdatay   = [testanalysis.bifurcation.pathlength.rallratio.mean];
    testdatastd = [testanalysis.bifurcation.pathlength.rallratio.std];
    errorbar(testdatax,testdatay,testdatastd/2,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=exponentialfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=exponentialfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Mean Rall Ratio (D^{1.5})','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('17.2: Mean Rall Ratio (D^{1.5}) - Exponential','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'172b_Mean_Rall_Ratio_15_Exp');
    print('-djpeg',filename); close all;
    
    
% Rall Ratio 1.5 - Power 

    figure; 
    controldatax   = [controlanalysis.bifurcation.pathlength.pathlength];
    controldatay   = [controlanalysis.bifurcation.pathlength.rallratio.mean];
    controldatastd = [controlanalysis.bifurcation.pathlength.rallratio.std];
    errorbar(controldatax,controldatay,controldatastd/2,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.pathlength.pathlength];
    testdatay   = [testanalysis.bifurcation.pathlength.rallratio.mean];
    testdatastd = [testanalysis.bifurcation.pathlength.rallratio.std];
    errorbar(testdatax,testdatay,testdatastd/2,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=powerfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=powerfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Mean Rall Ratio (D^{1.5})','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('17.3: Mean Rall Ratio (D^{1.5}) - Power','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'173b_Mean_Rall_Ratio_15_Pow');
    print('-djpeg',filename); close all;
    
      
% SD Rall Ratio 1.5 - Linear 

    figure;
    controldatax   = [controlanalysis.bifurcation.pathlength.pathlength];
    controldatay   = [controlanalysis.bifurcation.pathlength.rallratio.std];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.pathlength.pathlength];
    testdatay   = [testanalysis.bifurcation.pathlength.rallratio.std];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controlm,controlb,controlfitx,controlfity,controlfitr2]=linearfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testm,testb,testfitx,testfity,testfitr2]=linearfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Rall Ratio (D^{1.5}) SD','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('18.1: SD Rall Ratio (D^{1.5}) - Linear','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('m: %f',controlm);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('m: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'181b_SD_Rall_Ratio_15_Lin');
    print('-djpeg',filename); close all;
    
    
% SD Rall Ratio 1.5 - Exponential 

    figure;
    controldatax   = [controlanalysis.bifurcation.pathlength.pathlength];
    controldatay   = [controlanalysis.bifurcation.pathlength.rallratio.std];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.pathlength.pathlength];
    testdatay   = [testanalysis.bifurcation.pathlength.rallratio.std];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=exponentialfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=exponentialfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Rall Ratio (D^{1.5}) SD','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('18.2: SD Rall Ratio (D^{1.5}) - Exponential','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'182b_SD_Rall_Ratio_15_Exp');
    print('-djpeg',filename); close all;
    
        
% SD Rall Ratio 1.5 - Power 

    figure;
    controldatax   = [controlanalysis.bifurcation.pathlength.pathlength];
    controldatay   = [controlanalysis.bifurcation.pathlength.rallratio.std];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.pathlength.pathlength];
    testdatay   = [testanalysis.bifurcation.pathlength.rallratio.std];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=powerfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=powerfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Rall Ratio (D^{1.5}) SD','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('18.3: SD Rall Ratio (D^{1.5}) - Power','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'183b_SD_Rall_Ratio_15_Pow');
    print('-djpeg',filename); close all;
   
    
% Skew Rall Ratio 1.5 - Linear 

    figure;
    controldatax   = [controlanalysis.bifurcation.pathlength.pathlength];
    controldatay   = [controlanalysis.bifurcation.pathlength.rallratio.skew];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.pathlength.pathlength];
    testdatay   = [testanalysis.bifurcation.pathlength.rallratio.skew];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controlm,controlb,controlfitx,controlfity,controlfitr2]=linearfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testm,testb,testfitx,testfity,testfitr2]=linearfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Rall Ratio (D^{1.5}) Skewness','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('19.1: Skew Rall Ratio (D^{1.5}) - Linear','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('m: %f',controlm);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('m: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'191b_Skew_Rall_Ratio_15_Lin');
    print('-djpeg',filename); close all;
    
    
% Skew Rall Ratio 1.5 - Exponential 

    figure;
    controldatax   = [controlanalysis.bifurcation.pathlength.pathlength];
    controldatay   = [controlanalysis.bifurcation.pathlength.rallratio.skew];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.pathlength.pathlength];
    testdatay   = [testanalysis.bifurcation.pathlength.rallratio.skew];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=exponentialfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=exponentialfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Rall Ratio (D^{1.5}) Skewness','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('19.2: Skew Rall Ratio (D^{1.5}) - Exponential','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'192b_Skew_Rall_Ratio_15_Exp');
    print('-djpeg',filename); close all;
    
    
% Skew Rall Ratio 1.5 - Power 

    figure;
    controldatax   = [controlanalysis.bifurcation.pathlength.pathlength];
    controldatay   = [controlanalysis.bifurcation.pathlength.rallratio.skew];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.pathlength.pathlength];
    testdatay   = [testanalysis.bifurcation.pathlength.rallratio.skew];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=powerfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=powerfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Rall Ratio (D^{1.5}) Skewness','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('19.3: Skew Rall Ratio (D^{1.5}) - Power','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'193b_Skew_Rall_Ratio_15_Pow');
    print('-djpeg',filename); close all;
    
      
% Kurt Rall Ratio 1.5 - Linear 

    figure;
    controldatax   = [controlanalysis.bifurcation.pathlength.pathlength];
    controldatay   = [controlanalysis.bifurcation.pathlength.rallratio.kurt];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.pathlength.pathlength];
    testdatay   = [testanalysis.bifurcation.pathlength.rallratio.kurt];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controlm,controlb,controlfitx,controlfity,controlfitr2]=linearfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testm,testb,testfitx,testfity,testfitr2]=linearfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Rall Ratio (D^{1.5}) Kurtosis','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('20.1: Kurt Rall Ratio (D^{1.5}) - Linear','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('m: %f',controlm);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('m: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'201b_Kurt_Rall_Ratio_15_Lin');
    print('-djpeg',filename); close all;
    
    
% Kurt Rall Ratio 1.5 - Exponential 

    figure;
    controldatax   = [controlanalysis.bifurcation.pathlength.pathlength];
    controldatay   = [controlanalysis.bifurcation.pathlength.rallratio.kurt];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.pathlength.pathlength];
    testdatay   = [testanalysis.bifurcation.pathlength.rallratio.kurt];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=exponentialfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=exponentialfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Rall Ratio (D^{1.5}) Kurtosis','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('20.2: Kurt Rall Ratio (D^{1.5}) - Exponential','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'202b_Kurt_Rall_Ratio_15_Exp');
    print('-djpeg',filename); close all;
    
     
% Kurt Rall Ratio 1.5 - Power 

    figure;
    controldatax   = [controlanalysis.bifurcation.pathlength.pathlength];
    controldatay   = [controlanalysis.bifurcation.pathlength.rallratio.kurt];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.pathlength.pathlength];
    testdatay   = [testanalysis.bifurcation.pathlength.rallratio.kurt];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=powerfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=powerfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Rall Ratio (D^{1.5}) Kurtosis','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('20.3: Kurt Rall Ratio (D^{1.5}) - Power','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'203b_Kurt_Rall_Ratio_15_Pow');
    print('-djpeg',filename); close all;
    
    
% Rall Ratio 2.0 - Linear 

    figure; 
    controldatax   = [controlanalysis.bifurcation.pathlength.pathlength];
    controldatay   = [controlanalysis.bifurcation.pathlength.rallratio2.mean];
    controldatastd = [controlanalysis.bifurcation.pathlength.rallratio2.std];
    errorbar(controldatax,controldatay,controldatastd/2,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.pathlength.pathlength];
    testdatay   = [testanalysis.bifurcation.pathlength.rallratio2.mean];
    testdatastd = [testanalysis.bifurcation.pathlength.rallratio2.std];
    errorbar(testdatax,testdatay,testdatastd/2,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controlm,controlb,controlfitx,controlfity,controlfitr2]=linearfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testm,testb,testfitx,testfity,testfitr2]=linearfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Mean Rall Ratio (D^{2.0})','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('21.1: Mean Rall Ratio (D^{2.0}) - Linear','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('m: %f',controlm);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('m: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'211b_Mean_Rall_Ratio_2_Lin');
    print('-djpeg',filename); close all;
    
    
% Rall Ratio 2.0 - Exponential 

    figure;
    controldatax   = [controlanalysis.bifurcation.pathlength.pathlength];
    controldatay   = [controlanalysis.bifurcation.pathlength.rallratio2.mean];
    controldatastd = [controlanalysis.bifurcation.pathlength.rallratio2.std];
    errorbar(controldatax,controldatay,controldatastd/2,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.pathlength.pathlength];
    testdatay   = [testanalysis.bifurcation.pathlength.rallratio2.mean];
    testdatastd = [testanalysis.bifurcation.pathlength.rallratio2.std];
    errorbar(testdatax,testdatay,testdatastd/2,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=exponentialfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=exponentialfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Mean Rall Ratio (D^{2.0})','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('21.2: Mean Rall Ratio (D^{2.0}) - Exponential','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'212b_Mean_Rall_Ratio_2_Exp');
    print('-djpeg',filename); close all;
    
       
% Rall Ratio 2.0 - Power 

    figure;
    controldatax   = [controlanalysis.bifurcation.pathlength.pathlength];
    controldatay   = [controlanalysis.bifurcation.pathlength.rallratio2.mean];
    controldatastd = [controlanalysis.bifurcation.pathlength.rallratio2.std];
    errorbar(controldatax,controldatay,controldatastd/2,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.pathlength.pathlength];
    testdatay   = [testanalysis.bifurcation.pathlength.rallratio2.mean];
    testdatastd = [testanalysis.bifurcation.pathlength.rallratio2.std];
    errorbar(testdatax,testdatay,testdatastd/2,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=powerfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=powerfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Mean Rall Ratio (D^{2.0})','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('21.3: Mean Rall Ratio (D^{2.0}) - Power','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'213b_Mean_Rall_Ratio_2_Pow');
    print('-djpeg',filename); close all;
    
    
% SD Rall Ratio 2.0 - Linear 

    figure;
    controldatax   = [controlanalysis.bifurcation.pathlength.pathlength];
    controldatay   = [controlanalysis.bifurcation.pathlength.rallratio2.std];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.pathlength.pathlength];
    testdatay   = [testanalysis.bifurcation.pathlength.rallratio2.std];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controlm,controlb,controlfitx,controlfity,controlfitr2]=linearfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testm,testb,testfitx,testfity,testfitr2]=linearfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Rall Ratio (D^{2.0}) SD','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('22.1: SD Rall Ratio (D^{2.0}) - Linear','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('m: %f',controlm);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('m: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'221b_SD_Rall_Ratio_2_Lin');
    print('-djpeg',filename); close all;
    
    
% SD Rall Ratio 2.0 - Exponential 

    figure;
    controldatax   = [controlanalysis.bifurcation.pathlength.pathlength];
    controldatay   = [controlanalysis.bifurcation.pathlength.rallratio2.std];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.pathlength.pathlength];
    testdatay   = [testanalysis.bifurcation.pathlength.rallratio2.std];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=exponentialfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=exponentialfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Rall Ratio (D^{2.0}) SD','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('22.2: SD Rall Ratio (D^{2.0}) - Exponential','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'222b_SD_Rall_Ratio_2_Exp');
    print('-djpeg',filename); close all;
    
   
% SD Rall Ratio 2.0 - Power 

    figure;  
    controldatax   = [controlanalysis.bifurcation.pathlength.pathlength];
    controldatay   = [controlanalysis.bifurcation.pathlength.rallratio2.std];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.pathlength.pathlength];
    testdatay   = [testanalysis.bifurcation.pathlength.rallratio2.std];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=powerfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=powerfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Rall Ratio (D^{2.0}) SD','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('22.3: SD Rall Ratio (D^{2.0}) - Power','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'223b_SD_Rall_Ratio_2_Pow');
    print('-djpeg',filename); close all;
      
    
% Skew Rall Ratio 2.0 - Linear 

    figure;
    controldatax   = [controlanalysis.bifurcation.pathlength.pathlength];
    controldatay   = [controlanalysis.bifurcation.pathlength.rallratio2.skew];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.pathlength.pathlength];
    testdatay   = [testanalysis.bifurcation.pathlength.rallratio2.skew];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controlm,controlb,controlfitx,controlfity,controlfitr2]=linearfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testm,testb,testfitx,testfity,testfitr2]=linearfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Rall Ratio (D^{2.0}) Skewness','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('23.1: Skew Rall Ratio (D^{2.0}) - Linear','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('m: %f',controlm);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('m: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'231b_Skew_Rall_Ratio_2_Lin');
    print('-djpeg',filename); close all;
    
    
% Skew Rall Ratio 2.0 - Exponential 

    figure;
    controldatax   = [controlanalysis.bifurcation.pathlength.pathlength];
    controldatay   = [controlanalysis.bifurcation.pathlength.rallratio2.skew];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.pathlength.pathlength];
    testdatay   = [testanalysis.bifurcation.pathlength.rallratio2.skew];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=exponentialfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=exponentialfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Rall Ratio (D^{2.0}) Skewness','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('23.2: Skew Rall Ratio (D^{2.0}) - Exponential','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'232b_Skew_Rall_Ratio_2_Exp');
    print('-djpeg',filename); close all;
    
       
% Skew Rall Ratio 2.0 - Power 

    figure;
    controldatax   = [controlanalysis.bifurcation.pathlength.pathlength];
    controldatay   = [controlanalysis.bifurcation.pathlength.rallratio2.skew];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.pathlength.pathlength];
    testdatay   = [testanalysis.bifurcation.pathlength.rallratio2.skew];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=powerfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=powerfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Rall Ratio (D^{2.0}) Skewness','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('23.3: Skew Rall Ratio (D^{2.0}) - Power','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'233b_Skew_Rall_Ratio_2_Pow');
    print('-djpeg',filename); close all;
    
    
% Kurt Rall Ratio 2.0 - Linear 

    figure;
    controldatax   = [controlanalysis.bifurcation.pathlength.pathlength];
    controldatay   = [controlanalysis.bifurcation.pathlength.rallratio2.kurt];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.pathlength.pathlength];
    testdatay   = [testanalysis.bifurcation.pathlength.rallratio2.kurt];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controlm,controlb,controlfitx,controlfity,controlfitr2]=linearfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testm,testb,testfitx,testfity,testfitr2]=linearfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Rall Ratio (D^{2.0}) Kurtosis','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('24.1: Kurt Rall Ratio (D^{2.0}) - Linear','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('m: %f',controlm);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('m: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'241b_Kurt_Rall_Ratio_2_Lin');
    print('-djpeg',filename); close all;
    
    
% Kurt Rall Ratio 2.0 - Exponential 

    figure;
    controldatax   = [controlanalysis.bifurcation.pathlength.pathlength];
    controldatay   = [controlanalysis.bifurcation.pathlength.rallratio2.kurt];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.pathlength.pathlength];
    testdatay   = [testanalysis.bifurcation.pathlength.rallratio2.kurt];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=exponentialfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=exponentialfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Rall Ratio (D^{2.0}) Kurtosis','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('24.2: Kurt Rall Ratio (D^{2.0}) - Exponential','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'242b_Kurt_Rall_Ratio_2_Exp');
    print('-djpeg',filename); close all;
    
    
% Kurt Rall Ratio 2.0 - Power 

    figure; 
    controldatax   = [controlanalysis.bifurcation.pathlength.pathlength];
    controldatay   = [controlanalysis.bifurcation.pathlength.rallratio2.kurt];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.pathlength.pathlength];
    testdatay   = [testanalysis.bifurcation.pathlength.rallratio2.kurt];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=powerfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=powerfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Rall Ratio (D^{2.0}) Kurtosis','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('24.3: Kurt Rall Ratio (D^{2.0}) - Power','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'243b_Kurt_Rall_Ratio_2_Pow');
    print('-djpeg',filename); close all;
    
   
% Parent / Daughter1 Ratio - Linear 

    figure;
    controldatax   = [controlanalysis.bifurcation.pathlength.pathlength];
    controldatay   = [controlanalysis.bifurcation.pathlength.parentdaughterratio.mean];
    controldatastd = [controlanalysis.bifurcation.pathlength.parentdaughterratio.std];
    errorbar(controldatax,controldatay,controldatastd/2,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.pathlength.pathlength];
    testdatay   = [testanalysis.bifurcation.pathlength.parentdaughterratio.mean];
    testdatastd = [testanalysis.bifurcation.pathlength.parentdaughterratio.std];
    errorbar(testdatax,testdatay,testdatastd/2,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controlm,controlb,controlfitx,controlfity,controlfitr2]=linearfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testm,testb,testfitx,testfity,testfitr2]=linearfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Mean Parent / Daughter_1 Ratio','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('25.1: Mean Parent / Daughter_1 Ratio - Linear','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('m: %f',controlm);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('m: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
       
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'251b_Mean_Parent_Daughter_1_Lin');
    print('-djpeg',filename); close all;
       
    
% Parent / Daughter1 Ratio - Exponential 

    figure;
    controldatax   = [controlanalysis.bifurcation.pathlength.pathlength];
    controldatay   = [controlanalysis.bifurcation.pathlength.parentdaughterratio.mean];
    controldatastd = [controlanalysis.bifurcation.pathlength.parentdaughterratio.std];
    errorbar(controldatax,controldatay,controldatastd/2,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.pathlength.pathlength];
    testdatay   = [testanalysis.bifurcation.pathlength.parentdaughterratio.mean];
    testdatastd = [testanalysis.bifurcation.pathlength.parentdaughterratio.std];
    errorbar(testdatax,testdatay,testdatastd/2,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=exponentialfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=exponentialfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Mean Parent / Daughter_1 Ratio','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('25.2: Mean Parent / Daughter_1 Ratio - Exponential','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
       
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'252b_Mean_Parent_Daughter_1_Exp');
    print('-djpeg',filename); close all;
    
    
% Parent / Daughter1 Ratio - Power 

    figure;
    controldatax   = [controlanalysis.bifurcation.pathlength.pathlength];
    controldatay   = [controlanalysis.bifurcation.pathlength.parentdaughterratio.mean];
    controldatastd = [controlanalysis.bifurcation.pathlength.parentdaughterratio.std];
    errorbar(controldatax,controldatay,controldatastd/2,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.pathlength.pathlength];
    testdatay   = [testanalysis.bifurcation.pathlength.parentdaughterratio.mean];
    testdatastd = [testanalysis.bifurcation.pathlength.parentdaughterratio.std];
    errorbar(testdatax,testdatay,testdatastd/2,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=powerfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=powerfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Mean Parent / Daughter_1 Ratio','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('25.3: Mean Parent / Daughter_1 Ratio - Power','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'253b_Mean_Parent_Daughter_1_Pow');
    print('-djpeg',filename); close all;
    
     
% SD Parent / Daughter1 Ratio - Linear 

    figure;
    controldatax   = [controlanalysis.bifurcation.pathlength.pathlength];
    controldatay   = [controlanalysis.bifurcation.pathlength.parentdaughterratio.std];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.pathlength.pathlength];
    testdatay   = [testanalysis.bifurcation.pathlength.parentdaughterratio.std];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controlm,controlb,controlfitx,controlfity,controlfitr2]=linearfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testm,testb,testfitx,testfity,testfitr2]=linearfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Parent / Daughter_1 Ratio SD','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('26.1: SD Parent / Daughter_1 Ratio - Linear','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('m: %f',controlm);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('m: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'265b_SD_Parent_Daughter_1_Lin');
    print('-djpeg',filename); close all;
    
    
% SD Parent / Daughter1 Ratio - Exponential 

    figure;
    controldatax   = [controlanalysis.bifurcation.pathlength.pathlength];
    controldatay   = [controlanalysis.bifurcation.pathlength.parentdaughterratio.std];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.pathlength.pathlength];
    testdatay   = [testanalysis.bifurcation.pathlength.parentdaughterratio.std];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=exponentialfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=exponentialfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Parent / Daughter_1 Ratio SD','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('26.2: SD Parent / Daughter_1 Ratio - Exponential','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'262b_SD_Parent_Daughter_1_Exp');
    print('-djpeg',filename); close all;
    
    
% SD Parent / Daughter1 Ratio - Power 

    figure;
    controldatax   = [controlanalysis.bifurcation.pathlength.pathlength];
    controldatay   = [controlanalysis.bifurcation.pathlength.parentdaughterratio.std];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.pathlength.pathlength];
    testdatay   = [testanalysis.bifurcation.pathlength.parentdaughterratio.std];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=powerfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=powerfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Parent / Daughter_1 Ratio SD','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('26.3: SD Parent / Daughter_1 Ratio - Power','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'263b_SD_Parent_Daughter_1_Pow');
    print('-djpeg',filename); close all;
        
    
% Skew Parent / Daughter1 Ratio - Linear 

    figure;
    controldatax   = [controlanalysis.bifurcation.pathlength.pathlength];
    controldatay   = [controlanalysis.bifurcation.pathlength.parentdaughterratio.skew];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.pathlength.pathlength];
    testdatay   = [testanalysis.bifurcation.pathlength.parentdaughterratio.skew];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controlm,controlb,controlfitx,controlfity,controlfitr2]=linearfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testm,testb,testfitx,testfity,testfitr2]=linearfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Parent / Daughter_1 Ratio Skewness','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('27.1: Skew Parent / Daughter_1 Ratio - Linear','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('m: %f',controlm);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('m: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'271b_Skew_Parent_Daughter_1_Lin');
    print('-djpeg',filename); close all;
    
    
% Skew Parent / Daughter1 Ratio - Exponential 

    figure;
    controldatax   = [controlanalysis.bifurcation.pathlength.pathlength];
    controldatay   = [controlanalysis.bifurcation.pathlength.parentdaughterratio.skew];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.pathlength.pathlength];
    testdatay   = [testanalysis.bifurcation.pathlength.parentdaughterratio.skew];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=exponentialfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=exponentialfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Parent / Daughter_1 Ratio Skewness','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('27.2: Skew Parent / Daughter_1 Ratio - Exponential','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'272b_Skew_Parent_Daughter_1_Exp');
    print('-djpeg',filename); close all;
    
        
% Skew Parent / Daughter1 Ratio - Power 

    figure;
    controldatax   = [controlanalysis.bifurcation.pathlength.pathlength];
    controldatay   = [controlanalysis.bifurcation.pathlength.parentdaughterratio.skew];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.pathlength.pathlength];
    testdatay   = [testanalysis.bifurcation.pathlength.parentdaughterratio.skew];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=powerfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=powerfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Parent / Daughter_1 Ratio Skewness','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('27.3: Skew Parent / Daughter_1 Ratio - Power','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'273b_Skew_Parent_Daughter_1_Pow');
    print('-djpeg',filename); close all;
 
    
% Kurt Parent / Daughter1 Ratio - Linear 

    figure;
    controldatax   = [controlanalysis.bifurcation.pathlength.pathlength];
    controldatay   = [controlanalysis.bifurcation.pathlength.parentdaughterratio.kurt];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.pathlength.pathlength];
    testdatay   = [testanalysis.bifurcation.pathlength.parentdaughterratio.kurt];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controlm,controlb,controlfitx,controlfity,controlfitr2]=linearfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testm,testb,testfitx,testfity,testfitr2]=linearfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Parent / Daughter_1 Ratio Kurtosis','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('28.1: Kurt Parent / Daughter_1 Ratio - Linear','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('m: %f',controlm);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('m: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'281b_Kurt_Parent_Daughter_1_Lin');
    print('-djpeg',filename); close all;
    
    
% Kurt Parent / Daughter1 Ratio - Exponential 

    figure;
    controldatax   = [controlanalysis.bifurcation.pathlength.pathlength];
    controldatay   = [controlanalysis.bifurcation.pathlength.parentdaughterratio.kurt];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.pathlength.pathlength];
    testdatay   = [testanalysis.bifurcation.pathlength.parentdaughterratio.kurt];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=exponentialfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=exponentialfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    
    ylabel('Parent / Daughter_1 Ratio Kurtosis','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('28.2: Kurt Parent / Daughter_1 Ratio - Exponential','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'282b_Kurt_Parent_Daughter_1_Exp');
    print('-djpeg',filename); close all;
    
      
% Kurt Parent / Daughter1 Ratio - Power 

    figure;
    controldatax   = [controlanalysis.bifurcation.pathlength.pathlength];
    controldatay   = [controlanalysis.bifurcation.pathlength.parentdaughterratio.kurt];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.pathlength.pathlength];
    testdatay   = [testanalysis.bifurcation.pathlength.parentdaughterratio.kurt];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=powerfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=powerfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Parent / Daughter_1 Ratio Kurtosis','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('28.3: Kurt Parent / Daughter_1 Ratio - Power','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'283b_Kurt_Parent_Daughter_1_Pow');
    print('-djpeg',filename); close all;
  

% Parent / Daughter2 Ratio - Linear 

    figure;
    controldatax   = [controlanalysis.bifurcation.pathlength.pathlength];
    controldatay   = [controlanalysis.bifurcation.pathlength.parentdaughter2ratio.mean];
    controldatastd = [controlanalysis.bifurcation.pathlength.parentdaughter2ratio.std];
    errorbar(controldatax,controldatay,controldatastd/2,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.pathlength.pathlength];
    testdatay   = [testanalysis.bifurcation.pathlength.parentdaughter2ratio.mean];
    testdatastd = [testanalysis.bifurcation.pathlength.parentdaughter2ratio.std];
    errorbar(testdatax,testdatay,testdatastd/2,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controlm,controlb,controlfitx,controlfity,controlfitr2]=linearfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testm,testb,testfitx,testfity,testfitr2]=linearfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    
    ylabel('Mean Parent / Daughter_2 Ratio','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('29.1: Mean Parent / Daughter_2 Ratio - Linear','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('m: %f',controlm);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('m: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'291b_Mean_Parent_Daughter_2_Lin');
    print('-djpeg',filename); close all;   
    
    
% Parent / Daughter2 Ratio - Exponential 

    figure;
    controldatax   = [controlanalysis.bifurcation.pathlength.pathlength];
    controldatay   = [controlanalysis.bifurcation.pathlength.parentdaughter2ratio.mean];
    controldatastd = [controlanalysis.bifurcation.pathlength.parentdaughter2ratio.std];
    errorbar(controldatax,controldatay,controldatastd/2,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.pathlength.pathlength];
    testdatay   = [testanalysis.bifurcation.pathlength.parentdaughter2ratio.mean];
    testdatastd = [testanalysis.bifurcation.pathlength.parentdaughter2ratio.std];
    errorbar(testdatax,testdatay,testdatastd/2,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=exponentialfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=exponentialfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Mean Parent / Daughter_2 Ratio','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('29.2: Mean Parent / Daughter_2 Ratio - Exponential','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
       
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'292b_Mean_Parent_Daughter_2_Exp');
    print('-djpeg',filename); close all;
    
   
% Parent / Daughter2 Ratio - Power 

    figure;
    controldatax   = [controlanalysis.bifurcation.pathlength.pathlength];
    controldatay   = [controlanalysis.bifurcation.pathlength.parentdaughter2ratio.mean];
    controldatastd = [controlanalysis.bifurcation.pathlength.parentdaughter2ratio.std];
    errorbar(controldatax,controldatay,controldatastd/2,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.pathlength.pathlength];
    testdatay   = [testanalysis.bifurcation.pathlength.parentdaughter2ratio.mean];
    testdatastd = [testanalysis.bifurcation.pathlength.parentdaughter2ratio.std];
    errorbar(testdatax,testdatay,testdatastd/2,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=powerfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=powerfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Mean Parent / Daughter_2 Ratio','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('29.3: Mean Parent / Daughter_2 Ratio - Power','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'293b_Mean_Parent_Daughter_2_Pow');
    print('-djpeg',filename); close all;
       
    
% SD Parent / Daughter2 Ratio - Linear 

    figure;
    controldatax   = [controlanalysis.bifurcation.pathlength.pathlength];
    controldatay   = [controlanalysis.bifurcation.pathlength.parentdaughter2ratio.std];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.pathlength.pathlength];
    testdatay   = [testanalysis.bifurcation.pathlength.parentdaughter2ratio.std];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controlm,controlb,controlfitx,controlfity,controlfitr2]=linearfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testm,testb,testfitx,testfity,testfitr2]=linearfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Parent / Daughter_2 Ratio SD','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('30.1: SD Parent / Daughter_2 Ratio - Linear','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('m: %f',controlm);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('m: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'305b_SD_Parent_Daughter_2_Lin');
    print('-djpeg',filename); close all;
    
    
% SD Parent / Daughter2 Ratio - Exponential 

    figure;
    controldatax   = [controlanalysis.bifurcation.pathlength.pathlength];
    controldatay   = [controlanalysis.bifurcation.pathlength.parentdaughter2ratio.std];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.pathlength.pathlength];
    testdatay   = [testanalysis.bifurcation.pathlength.parentdaughter2ratio.std];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=exponentialfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=exponentialfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Parent / Daughter_2 Ratio SD','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('30.2: SD Parent / Daughter_2 Ratio - Exponential','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'302b_SD_Parent_Daughter_2_Exp');
    print('-djpeg',filename); close all;
    
    
% SD Parent / Daughter2 Ratio - Power 

    figure;
    controldatax   = [controlanalysis.bifurcation.pathlength.pathlength];
    controldatay   = [controlanalysis.bifurcation.pathlength.parentdaughter2ratio.std];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.pathlength.pathlength];
    testdatay   = [testanalysis.bifurcation.pathlength.parentdaughter2ratio.std];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=powerfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=powerfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Parent / Daughter_2 Ratio SD','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('30.3: SD Parent / Daughter_2 Ratio - Power','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
       
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'303b_SD_Parent_Daughter_2_Pow');
    print('-djpeg',filename); close all;
       
    
% Skew Parent / Daughter2 Ratio - Linear 

    figure;
    controldatax   = [controlanalysis.bifurcation.pathlength.pathlength];
    controldatay   = [controlanalysis.bifurcation.pathlength.parentdaughter2ratio.skew];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.pathlength.pathlength];
    testdatay   = [testanalysis.bifurcation.pathlength.parentdaughter2ratio.skew];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controlm,controlb,controlfitx,controlfity,controlfitr2]=linearfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testm,testb,testfitx,testfity,testfitr2]=linearfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Parent / Daughter_2 Ratio Skewness','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('31.1: Skew Parent / Daughter_2 Ratio - Linear','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('m: %f',controlm);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('m: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'311b_Skew_Parent_Daughter_2_Lin');
    print('-djpeg',filename); close all;
    
    
% Skew Parent / Daughter2 Ratio - Exponential 

    figure;
    controldatax   = [controlanalysis.bifurcation.pathlength.pathlength];
    controldatay   = [controlanalysis.bifurcation.pathlength.parentdaughter2ratio.skew];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.pathlength.pathlength];
    testdatay   = [testanalysis.bifurcation.pathlength.parentdaughter2ratio.skew];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=exponentialfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=exponentialfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Parent / Daughter_2 Ratio Skewness','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('31.2: Skew Parent / Daughter_2 Ratio - Exponential','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'312b_Skew_Parent_Daughter_2_Exp');
    print('-djpeg',filename); close all;
    
    
% Skew Parent / Daughter2 Ratio - Power 

    figure;
    controldatax   = [controlanalysis.bifurcation.pathlength.pathlength];
    controldatay   = [controlanalysis.bifurcation.pathlength.parentdaughter2ratio.skew];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.pathlength.pathlength];
    testdatay   = [testanalysis.bifurcation.pathlength.parentdaughter2ratio.skew];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=powerfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=powerfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Parent / Daughter_2 Ratio Skewness','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('31.3: Skew Parent / Daughter_2 Ratio - Power','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'313b_Skew_Parent_Daughter_2_Pow');
    print('-djpeg',filename); close all;
    
    
% Kurt Parent / Daughter2 Ratio - Linear 

    figure;
    controldatax   = [controlanalysis.bifurcation.pathlength.pathlength];
    controldatay   = [controlanalysis.bifurcation.pathlength.parentdaughter2ratio.kurt];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.pathlength.pathlength];
    testdatay   = [testanalysis.bifurcation.pathlength.parentdaughter2ratio.kurt];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controlm,controlb,controlfitx,controlfity,controlfitr2]=linearfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testm,testb,testfitx,testfity,testfitr2]=linearfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Parent / Daughter_2 Ratio Kurtosis','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('32.1: Kurt Parent / Daughter_2 Ratio - Linear','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('m: %f',controlm);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('m: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'321b_Kurt_Parent_Daughter_2_Lin');
    print('-djpeg',filename); close all;
    
    
% Kurt Parent / Daughter2 Ratio - Exponential 

    figure;
    controldatax   = [controlanalysis.bifurcation.pathlength.pathlength];
    controldatay   = [controlanalysis.bifurcation.pathlength.parentdaughter2ratio.kurt];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.pathlength.pathlength];
    testdatay   = [testanalysis.bifurcation.pathlength.parentdaughter2ratio.kurt];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=exponentialfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=exponentialfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Parent / Daughter_2 Ratio Kurtosis','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('32.2: Kurt Parent / Daughter_2 Ratio - Exponential','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'322b_Kurt_Parent_Daughter_2_Exp');
    print('-djpeg',filename); close all;
    
    
% Kurt Parent / Daughter2 Ratio - Power 

    figure;
    controldatax   = [controlanalysis.bifurcation.pathlength.pathlength];
    controldatay   = [controlanalysis.bifurcation.pathlength.parentdaughter2ratio.kurt];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.pathlength.pathlength];
    testdatay   = [testanalysis.bifurcation.pathlength.parentdaughter2ratio.kurt];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=powerfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=powerfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Parent / Daughter_2 Ratio Kurtosis','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('32.3: Kurt Parent / Daughter_2 Ratio - Power','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'323b_Kurt_Parent_Daughter_2_Pow');
    print('-djpeg',filename); close all;


% Daughter Ratio - Linear 

    figure;    
    controldatax   = [controlanalysis.bifurcation.pathlength.pathlength];
    controldatay   = [controlanalysis.bifurcation.pathlength.daughterratio.mean];
    controldatastd = [controlanalysis.bifurcation.pathlength.daughterratio.std];
    errorbar(controldatax,controldatay,controldatastd/2,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.pathlength.pathlength];
    testdatay   = [testanalysis.bifurcation.pathlength.daughterratio.mean];
    testdatastd = [testanalysis.bifurcation.pathlength.daughterratio.std];
    errorbar(testdatax,testdatay,testdatastd/2,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controlm,controlb,controlfitx,controlfity,controlfitr2]=linearfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testm,testb,testfitx,testfity,testfitr2]=linearfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Mean Daughter Ratio','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('33.1: Mean Daughter Ratio - Linear','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('m: %f',controlm);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('m: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'331b_Mean_Daughter_Ratio_Lin');
    print('-djpeg',filename); close all;
  
    
% Daughter Ratio - Exponential 

    figure;  
    controldatax   = [controlanalysis.bifurcation.pathlength.pathlength];
    controldatay   = [controlanalysis.bifurcation.pathlength.daughterratio.mean];
    controldatastd = [controlanalysis.bifurcation.pathlength.daughterratio.std];
    errorbar(controldatax,controldatay,controldatastd/2,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.pathlength.pathlength];
    testdatay   = [testanalysis.bifurcation.pathlength.daughterratio.mean];
    testdatastd = [testanalysis.bifurcation.pathlength.daughterratio.std];
    errorbar(testdatax,testdatay,testdatastd/2,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=exponentialfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=exponentialfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Mean Daughter Ratio','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('33.2: Mean Daughter Ratio - Exponential','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'332b_Mean_Daughter_Ratio_Exp');
    print('-djpeg',filename); close all;
    
    
% Daughter Ratio - Power 

    figure;
    controldatax   = [controlanalysis.bifurcation.pathlength.pathlength];
    controldatay   = [controlanalysis.bifurcation.pathlength.daughterratio.mean];
    controldatastd = [controlanalysis.bifurcation.pathlength.daughterratio.std];
    errorbar(controldatax,controldatay,controldatastd/2,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.pathlength.pathlength];
    testdatay   = [testanalysis.bifurcation.pathlength.daughterratio.mean];
    testdatastd = [testanalysis.bifurcation.pathlength.daughterratio.std];
    errorbar(testdatax,testdatay,testdatastd/2,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=powerfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=powerfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Mean Daughter Ratio','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('33.3: Mean Daughter Ratio - Power','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'333b_Mean_Daughter_Ratio_Pow');
    print('-djpeg',filename); close all;
 
    
% SD Daughter Ratio - Linear 

    figure;
    controldatax   = [controlanalysis.bifurcation.pathlength.pathlength];
    controldatay   = [controlanalysis.bifurcation.pathlength.daughterratio.std];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.pathlength.pathlength];
    testdatay   = [testanalysis.bifurcation.pathlength.daughterratio.std];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controlm,controlb,controlfitx,controlfity,controlfitr2]=linearfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testm,testb,testfitx,testfity,testfitr2]=linearfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Daughter Ratio SD','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('34.1: SD Daughter Ratio - Linear','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('m: %f',controlm);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('m: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'341b_SD_Daughter_Ratio_Lin');
    print('-djpeg',filename); close all;
    
    
% SD Daughter Ratio - Exponential 

    figure;
    controldatax   = [controlanalysis.bifurcation.pathlength.pathlength];
    controldatay   = [controlanalysis.bifurcation.pathlength.daughterratio.std];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.pathlength.pathlength];
    testdatay   = [testanalysis.bifurcation.pathlength.daughterratio.std];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=exponentialfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=exponentialfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Daughter Ratio SD','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('34.2: SD Daughter Ratio - Exponential','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'342b_SD_Daughter_Ratio_Exp');
    print('-djpeg',filename); close all;
    
    
% SD Daughter Ratio - Power 

    figure;
    controldatax   = [controlanalysis.bifurcation.pathlength.pathlength];
    controldatay   = [controlanalysis.bifurcation.pathlength.daughterratio.std];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.pathlength.pathlength];
    testdatay   = [testanalysis.bifurcation.pathlength.daughterratio.std];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=powerfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=powerfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Daughter Ratio SD','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('34.3: SD Daughter Ratio - Power','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'343b_SD_Daughter_Ratio_Pow');
    print('-djpeg',filename); close all;
    
    
% Skew Daughter Ratio - Linear 

    figure;
    controldatax   = [controlanalysis.bifurcation.pathlength.pathlength];
    controldatay   = [controlanalysis.bifurcation.pathlength.daughterratio.skew];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.pathlength.pathlength];
    testdatay   = [testanalysis.bifurcation.pathlength.daughterratio.skew];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controlm,controlb,controlfitx,controlfity,controlfitr2]=linearfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testm,testb,testfitx,testfity,testfitr2]=linearfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Daughter Ratio Skewness','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('35.1: Skew Daughter Ratio - Linear','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('m: %f',controlm);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('m: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'351b_Skew_Daughter_Ratio_Lin');
    print('-djpeg',filename); close all;
    
    
% Skew Daughter Ratio - Exponential 

    figure;
    controldatax   = [controlanalysis.bifurcation.pathlength.pathlength];
    controldatay   = [controlanalysis.bifurcation.pathlength.daughterratio.skew];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.pathlength.pathlength];
    testdatay   = [testanalysis.bifurcation.pathlength.daughterratio.skew];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=exponentialfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=exponentialfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Daughter Ratio Skewness','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('35.2: Skew Daughter Ratio - Exponential','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);

    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'352b_Skew_Daughter_Ratio_Exp');
    print('-djpeg',filename); close all;
    
    
% Skew Daughter Ratio - Power 

    figure;
    controldatax   = [controlanalysis.bifurcation.pathlength.pathlength];
    controldatay   = [controlanalysis.bifurcation.pathlength.daughterratio.skew];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.pathlength.pathlength];
    testdatay   = [testanalysis.bifurcation.pathlength.daughterratio.skew];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=powerfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=powerfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Daughter Ratio Skewness','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('35.3: Skew Daughter Ratio - Power','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'353b_Skew_Daughter_Ratio_Pow');
    print('-djpeg',filename); close all;
   
    
% Kurt Daughter Ratio - Linear 

    figure;
    controldatax   = [controlanalysis.bifurcation.pathlength.pathlength];
    controldatay   = [controlanalysis.bifurcation.pathlength.daughterratio.kurt];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.pathlength.pathlength];
    testdatay   = [testanalysis.bifurcation.pathlength.daughterratio.kurt];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controlm,controlb,controlfitx,controlfity,controlfitr2]=linearfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testm,testb,testfitx,testfity,testfitr2]=linearfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Daughter Ratio Kurtosis','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('36.1: Kurt Daughter Ratio - Linear','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('m: %f',controlm);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('m: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'361b_Kurt_Daughter_Ratio_Lin');
    print('-djpeg',filename); close all;
    
    
% Kurt Daughter Ratio - Exponential 

    figure;
    controldatax   = [controlanalysis.bifurcation.pathlength.pathlength];
    controldatay   = [controlanalysis.bifurcation.pathlength.daughterratio.kurt];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.pathlength.pathlength];
    testdatay   = [testanalysis.bifurcation.pathlength.daughterratio.kurt];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=exponentialfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=exponentialfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
 
    ylabel('Daughter Ratio Kurtosis','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('36.2: Kurt Daughter Ratio - Exponential','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'362b_Kurt_Daughter_Ratio_Exp');
    print('-djpeg',filename); close all;
    
    
% Kurt Daughter Ratio - Power 

    figure;
    controldatax   = [controlanalysis.bifurcation.pathlength.pathlength];
    controldatay   = [controlanalysis.bifurcation.pathlength.daughterratio.kurt];
    plot(controldatax,controldatay,'sb','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',greenmarkersize);
    hold on;
    testdatax   = [testanalysis.bifurcation.pathlength.pathlength];
    testdatay   = [testanalysis.bifurcation.pathlength.daughterratio.kurt];
    plot(testdatax,testdatay,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',greenmarkersize);
    
    ylimits = ylim; xlimits = xlim; 
    [controla,controlb,controlfitx,controlfity,controlfitr2]=powerfit(controldatax,controldatay,xlim);
    plot(controlfitx,controlfity,'b');
    [testa,testb,testfitx,testfity,testfitr2]=powerfit(testdatax,testdatay,xlim);
    plot(testfitx,testfity,'r'); 
    ylim(ylimits); xlim(xlimits);
    
    ylabel('Daughter Ratio Kurtosis','FontSize',labelfontsize,'FontWeight','b');
    xlabel('Local Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    title('36.3: Kurt Daughter Ratio - Power','FontSize',titlefontsize,'FontWeight','b');
    legendhandle = gca;
    set(gca,'FontSize',axesfontsize);hold off;
    fillscreen;
    legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
    
    xlimits    = xlim;
    ylimits    = ylim;
    textxpos1  = 0.025*(max(xlimits)-min(xlimits))+min(xlimits);
    textxpos2  = 0.050*(max(xlimits)-min(xlimits))+min(xlimits);
    text1ypos  = 0.975*(max(ylimits)-min(ylimits))+min(ylimits);
    text2ypos  = 0.950*(max(ylimits)-min(ylimits))+min(ylimits);
    text3ypos  = 0.925*(max(ylimits)-min(ylimits))+min(ylimits);
    text4ypos  = 0.900*(max(ylimits)-min(ylimits))+min(ylimits);
    text5ypos  = 0.875*(max(ylimits)-min(ylimits))+min(ylimits);
    text6ypos  = 0.850*(max(ylimits)-min(ylimits))+min(ylimits);
    text7ypos  = 0.825*(max(ylimits)-min(ylimits))+min(ylimits);
    text8ypos  = 0.800*(max(ylimits)-min(ylimits))+min(ylimits);
    text9ypos  = 0.775*(max(ylimits)-min(ylimits))+min(ylimits);
    text10ypos = 0.750*(max(ylimits)-min(ylimits))+min(ylimits);
    
    text1=sprintf('%s',controlanalysis.inputfilename);
    text(textxpos1,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
        text2=sprintf('a: %f',controla);
        text(textxpos2,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        text3=sprintf('b: %f',controlb);
        text(textxpos2,text3ypos,text3,'FontSize',insetfontsize,'Color','b');
        text4=sprintf('r^2: %f',controlfitr2);
        text(textxpos2,text4ypos,text4,'FontSize',insetfontsize,'Color','b');
    text5=sprintf('%s',testanalysis.inputfilename);
    text(textxpos1,text5ypos,text5,'FontSize',insetfontsize,'Color','r');
        text6=sprintf('a: %f',testm);
        text(textxpos2,text6ypos,text6,'FontSize',insetfontsize,'Color','r');
        text7=sprintf('b: %f',testb);
        text(textxpos2,text7ypos,text7,'FontSize',insetfontsize,'Color','r');
        text8=sprintf('r^2: %f',testfitr2);
        text(textxpos2,text8ypos,text8,'FontSize',insetfontsize,'Color','r');
        
    filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'363b_Kurt_Daughter_Ratio_Pow');
    print('-djpeg',filename); close all;