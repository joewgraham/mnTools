function somadiameterfigures(controlanalysis,testanalysis)
% Soma diameter figures

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

for piecetype = 2:4
    
    if nargin == 1
        goahead = true;
    else
        if isfield(testanalysis,piecetypes{piecetype})
            goahead = true;
        else
            goahead = false;
        end
    end
    
    if isfield(controlanalysis,piecetypes{piecetype}) && goahead
        
        currentpiecetype = piecetypes{piecetype};
        currentpiecetitle = piecetitles{piecetype};
        eval(['controltype = controlanalysis.' currentpiecetype ';']);
        if nargin > 1
            eval(['testtype = testanalysis.' currentpiecetype ';']);
        end
        
        figure;
        
        
        subplot(3,3,4)
        %box on;
        hold on;
        ylabel('Number Segments','FontSize',labelfontsize,'FontWeight','b');
        if nargin == 1
            controldatax = controlanalysis.soma.diameter.values;
            controldatay = controltype.numbersegments.values;
            plot(controldatax,controldatay,'bo');
            [controlm,controlb,controlfitx,controlfity,controlr2] = linearfit(controldatax,controldatay,xlim);
            plot(controlfitx,controlfity,'b');
            xlimits = xlim;
            %set(gca,'xticklabel', []);
            %text1ypos = 0.9*(max(ylim)-min(ylim))+min(ylim);
            %text2ypos = 0.8*(max(ylim)-min(ylim))+min(ylim);
            %text1xpos = 0.1*(max(xlim)-min(xlim))+min(xlim);
            %text2xpos = text1xpos;
            %text1 = sprintf('%s%.2f%s%.2f','y=',controlm,'x+',controlb);
            %text(text1xpos,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
            %text2 = sprintf('%s%.2f','r^2=',controlr2);
            %text(text2xpos,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        else
            controldatax = controlanalysis.soma.diameter.values;
            controldatay = controltype.numbersegments.values;
            plot(controldatax,controldatay,'bo');
            testdatax    = testanalysis.soma.diameter.values;
            testdatay    = testtype.numbersegments.values;
            plot(testdatax,testdatay,'rx');
            [controlm,controlb,controlfitx,controlfity,controlr2] = linearfit(controldatax,controldatay,xlim);
            [testm,testb,testfitx,testfity,testr2]                = linearfit(testdatax,testdatay,xlim);
            plot(controlfitx,controlfity,'b');
            plot(testfitx,testfity,'r');
            xlimits = xlim;
            %set(gca,'xticklabel', []);
            %text1ypos = 0.9*(max(ylim)-min(ylim))+min(ylim);
            %text2ypos = 0.8*(max(ylim)-min(ylim))+min(ylim);
            %text1xpos = 0.1*(max(xlim)-min(xlim))+min(xlim);
            %text2xpos = text1xpos;
            %text1 = sprintf('%s%.2f%s%.2f','y=',controlm,'x+',controlb);
            %text(text1xpos,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
            %text2 = sprintf('%s%.2f%s%.2f','y=',testm,'x+',testb);
            %text(text2xpos,text2ypos,text2,'FontSize',insetfontsize,'Color','r');
        end
        set(gca,'FontSize',axesfontsize);
        box on; hold off;
        
               
        subplot(3,3,1);
        %box on;
        hold on;
        legendhandle = gca;
        ylabel('Number MNs','FontSize',labelfontsize,'FontWeight','b');
        if nargin == 1
            hist(controlanalysis.soma.diameter.values);
            xlim(xlimits);
            %set(gca,'xticklabel', []);
            h = findobj(gca,'Type','patch');
            set(h,'FaceColor','b','EdgeColor','b','FaceAlpha',0.5,'EdgeAlpha',0.5);
        else
            [ignore xvalues] = hist([controlanalysis.soma.diameter.values testanalysis.soma.diameter.values]);
            hist(controlanalysis.soma.diameter.values,xvalues);
            hist(testanalysis.soma.diameter.values,xvalues);
            xlim(xlimits);
            %set(gca,'xticklabel', []);
            h = findobj(gca,'Type','patch');
            set(h(2),'FaceColor','b','EdgeColor','b','FaceAlpha',0.5,'EdgeAlpha',0.5);
            set(h(1),'FaceColor','r','EdgeColor','r','FaceAlpha',0.5,'EdgeAlpha',0.5);
        end
        set(gca,'FontSize',axesfontsize);
        box on; hold off;
        
        
        subplot(3,3,2);
        %box on;
        hold on;
        ylabel('Number Trunks','FontSize',labelfontsize,'FontWeight','b');
        if nargin == 1
            controldatax = controlanalysis.soma.diameter.values;
            controldatay = controltype.numbertrunks.values;
            plot(controldatax,controldatay,'bo');
            [controlm,controlb,controlfitx,controlfity,controlr2] = linearfit(controldatax,controldatay,xlim);
            plot(controlfitx,controlfity,'b');
            xlimits=xlim;
            %set(gca,'xticklabel', []);
            %text1ypos=0.9*(max(ylim)-min(ylim))+min(ylim);
            %text2ypos=0.8*(max(ylim)-min(ylim))+min(ylim);
            %text1xpos=0.1*(max(xlim)-min(xlim))+min(xlim);
            %text2xpos=text1xpos;
            %text1=sprintf('%s%.2f%s%.2f','y=',controlm,'x+',controlb);
            %text(text1xpos,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
            %text2=sprintf('%s%.2f','r^2=',controlr2);
            %text(text2xpos,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        else
            controldatax = controlanalysis.soma.diameter.values;
            controldatay = controltype.numbertrunks.values;
            plot(controldatax,controldatay,'bo');
            testdatax    = testanalysis.soma.diameter.values;
            testdatay    = testtype.numbertrunks.values;
            plot(testdatax,testdatay,'rx');
            [controlm,controlb,controlfitx,controlfity,controlr2] = linearfit(controldatax,controldatay,xlim);
            [testm,testb,testfitx,testfity,testr2]                = linearfit(testdatax,testdatay,xlim);
            plot(controlfitx,controlfity,'b');
            plot(testfitx,testfity,'r');
            xlimits=xlim;
            %set(gca,'xticklabel', []);
            %text1ypos=0.9*(max(ylim)-min(ylim))+min(ylim);
            %text2ypos=0.8*(max(ylim)-min(ylim))+min(ylim);
            %text1xpos=0.1*(max(xlim)-min(xlim))+min(xlim);
            %text2xpos=text1xpos;
            %text1=sprintf('%s%.2f%s%.2f','y=',controlm,'x+',controlb);
            %text(text1xpos,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
            %text2=sprintf('%s%.2f%s%.2f','y=',testm,'x+',testb);
            %text(text2xpos,text2ypos,text2,'FontSize',insetfontsize,'Color','r');
        end
        set(gca,'FontSize',axesfontsize);
        box on; hold off;
        
        
        subplot(3,3,5);
        %box on;
        hold on;
        ylabel('Mean Trunk CSA (\mum^2)','FontSize',labelfontsize,'FontWeight','b');
        if nargin == 1
            controldatax = controlanalysis.soma.diameter.values;
            controldatay = controltype.trunk.meancsa.values;
            plot(controldatax,controldatay,'bo');
            [controlm,controlb,controlfitx,controlfity,controlr2] = linearfit(controldatax,controldatay,xlim);
            plot(controlfitx,controlfity,'b');
            xlimits = xlim;
            %set(gca,'xticklabel', []);
            %text1ypos=0.9*(max(ylim)-min(ylim))+min(ylim);
            %text2ypos=0.8*(max(ylim)-min(ylim))+min(ylim);
            %text1xpos=0.1*(max(xlim)-min(xlim))+min(xlim);
            %text2xpos=text1xpos;
            %text1=sprintf('%s%.2f%s%.2f','y=',controlm,'x+',controlb);
            %text(text1xpos,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
            %text2=sprintf('%s%.2f','r^2=',controlr2);
            %text(text2xpos,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        else
            controldatax = controlanalysis.soma.diameter.values;
            controldatay = controltype.trunk.meancsa.values;
            plot(controldatax,controldatay,'bo');
            testdatax    = testanalysis.soma.diameter.values;
            testdatay    = testtype.trunk.meancsa.values;
            plot(testdatax,testdatay,'rx');
            [controlm,controlb,controlfitx,controlfity,controlr2] = linearfit(controldatax,controldatay,xlim);
            [testm,testb,testfitx,testfity,testr2]                = linearfit(testdatax,testdatay,xlim);
            plot(controlfitx,controlfity,'b');
            plot(testfitx,testfity,'r');
            xlimits=xlim;
            %set(gca,'xticklabel', []);
            %text1ypos=0.9*(max(ylim)-min(ylim))+min(ylim);
            %text2ypos=0.8*(max(ylim)-min(ylim))+min(ylim);
            %text1xpos=0.1*(max(xlim)-min(xlim))+min(xlim);
            %text2xpos=text1xpos;
            %text1=sprintf('%s%.2f%s%.2f','y=',controlm,'x+',controlb);
            %text(text1xpos,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
            %text2=sprintf('%s%.2f%s%.2f','y=',testm,'x+',testb);
            %text(text2xpos,text2ypos,text2,'FontSize',insetfontsize,'Color','r');
        end
        set(gca,'FontSize',axesfontsize);
        box on; hold off;
        
        
        subplot(3,3,8);
        %box on;
        hold on;
        ylabel('Total Trunk CSA (\mum^2)','FontSize',labelfontsize,'FontWeight','b');
        xlabel('Soma Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
        if nargin == 1
            controldatax = controlanalysis.soma.diameter.values;
            controldatay = controltype.trunk.totalcsa.values;
            plot(controldatax,controldatay,'bo');
            [controlm,controlb,controlfitx,controlfity,controlr2] = linearfit(controldatax,controldatay,xlim);
            plot(controlfitx,controlfity,'b');
            xlimits = xlim;
            %set(gca,'xticklabel', []);
            %text1ypos=0.9*(max(ylim)-min(ylim))+min(ylim);
            %text2ypos=0.8*(max(ylim)-min(ylim))+min(ylim);
            %text1xpos=0.1*(max(xlim)-min(xlim))+min(xlim);
            %text2xpos=text1xpos;
            %text1=sprintf('%s%.2f%s%.2f','y=',controlm,'x+',controlb);
            %text(text1xpos,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
            %text2=sprintf('%s%.2f','r^2=',controlr2);
            %text(text2xpos,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        else
            controldatax = controlanalysis.soma.diameter.values;
            controldatay = controltype.trunk.totalcsa.values;
            plot(controldatax,controldatay,'bo');
            testdatax    = testanalysis.soma.diameter.values;
            testdatay    = testtype.trunk.totalcsa.values;
            plot(testdatax,testdatay,'rx');
            [controlm,controlb,controlfitx,controlfity,controlr2] = linearfit(controldatax,controldatay,xlim);
            [testm,testb,testfitx,testfity,testr2]                = linearfit(testdatax,testdatay,xlim);
            plot(controlfitx,controlfity,'b');
            plot(testfitx,testfity,'r');
            xlimits=xlim;
            %set(gca,'xticklabel', []);
            %text1ypos=0.9*(max(ylim)-min(ylim))+min(ylim);
            %text2ypos=0.8*(max(ylim)-min(ylim))+min(ylim);
            %text1xpos=0.1*(max(xlim)-min(xlim))+min(xlim);
            %text2xpos=text1xpos;
            %text1=sprintf('%s%.2f%s%.2f','y=',controlm,'x+',controlb);
            %text(text1xpos,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
            %text2=sprintf('%s%.2f%s%.2f','y=',testm,'x+',testb);
            %text(text2xpos,text2ypos,text2,'FontSize',insetfontsize,'Color','r'); 
        end
        set(gca,'FontSize',axesfontsize);
        box on; hold off;
        
        
        subplot(3,3,7);
        %box on;
        hold on;
        ylabel('Maximum Degree','FontSize',labelfontsize,'FontWeight','b');
        xlabel('Soma Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
            if nargin == 1
            controldatax = controlanalysis.soma.diameter.values;
            controldatay = controltype.maxdegree.values;
            plot(controldatax,controldatay,'bo');
            [controlm,controlb,controlfitx,controlfity,controlr2] = linearfit(controldatax,controldatay,xlim);
            plot(controlfitx,controlfity,'b');
            xlimits = xlim;
            %set(gca,'xticklabel', []);
            %text1ypos=0.9*(max(ylim)-min(ylim))+min(ylim);
            %text2ypos=0.8*(max(ylim)-min(ylim))+min(ylim);
            %text1xpos=0.1*(max(xlim)-min(xlim))+min(xlim);
            %text2xpos=text1xpos;
            %text1=sprintf('%s%.2f%s%.2f','y=',controlm,'x+',controlb);
            %text(text1xpos,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
            %text2=sprintf('%s%.2f','r^2=',controlr2);
            %text(text2xpos,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        else
            controldatax = controlanalysis.soma.diameter.values;
            controldatay = controltype.maxdegree.values;
            plot(controldatax,controldatay,'bo');
            testdatax    = testanalysis.soma.diameter.values;
            testdatay    = testtype.maxdegree.values;
            plot(testdatax,testdatay,'rx');
            [controlm,controlb,controlfitx,controlfity,controlr2] = linearfit(controldatax,controldatay,xlim);
            [testm,testb,testfitx,testfity,testr2]                = linearfit(testdatax,testdatay,xlim);
            plot(controlfitx,controlfity,'b');
            plot(testfitx,testfity,'r');
            xlimits=xlim;
            %set(gca,'xticklabel', []);
            %text1ypos=0.9*(max(ylim)-min(ylim))+min(ylim);
            %text2ypos=0.8*(max(ylim)-min(ylim))+min(ylim);
            %text1xpos=0.1*(max(xlim)-min(xlim))+min(xlim);
            %text2xpos=text1xpos;
            %text1=sprintf('%s%.2f%s%.2f','y=',controlm,'x+',controlb);
            %text(text1xpos,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
            %text2=sprintf('%s%.2f%s%.2f','y=',testm,'x+',testb);
            %text(text2xpos,text2ypos,text2,'FontSize',insetfontsize,'Color
            %','r');
        end
        set(gca,'FontSize',axesfontsize);
        box on; hold off;
    

        subplot(3,3,3);
        %box on;
        hold on;
        ylabel('Total Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
        if nargin == 1
            controldatax = controlanalysis.soma.diameter.values;
            controldatay = controltype.totallength.values;
            plot(controldatax,controldatay,'bo');
            [controlm,controlb,controlfitx,controlfity,controlr2] = linearfit(controldatax,controldatay,xlim);
            plot(controlfitx,controlfity,'b');
            xlimits=xlim;
            %set(gca,'xticklabel', []);
            %text1ypos=0.9*(max(ylim)-min(ylim))+min(ylim);
            %text2ypos=0.8*(max(ylim)-min(ylim))+min(ylim);
            %text1xpos=0.1*(max(xlim)-min(xlim))+min(xlim);
            %text2xpos=text1xpos;
            %text1=sprintf('%s%.2f%s%.2f','y=',controlm,'x+',controlb);
            %text(text1xpos,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
            %text2=sprintf('%s%.2f','r^2=',controlr2);
            %text(text2xpos,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        else
            controldatax = controlanalysis.soma.diameter.values;
            controldatay = controltype.totallength.values;
            plot(controldatax,controldatay,'bo');
            testdatax    = testanalysis.soma.diameter.values;
            testdatay    = testtype.totallength.values;
            plot(testdatax,testdatay,'rx');
            [controlm,controlb,controlfitx,controlfity,controlr2] = linearfit(controldatax,controldatay,xlim);
            [testm,testb,testfitx,testfity,testr2]                = linearfit(testdatax,testdatay,xlim);
            plot(controlfitx,controlfity,'b');
            plot(testfitx,testfity,'r');
            xlimits=xlim;
            %set(gca,'xticklabel', []);
            %text1ypos=0.9*(max(ylim)-min(ylim))+min(ylim);
            %text2ypos=0.8*(max(ylim)-min(ylim))+min(ylim);
            %text1xpos=0.1*(max(xlim)-min(xlim))+min(xlim);
            %text2xpos=text1xpos;
            %text1=sprintf('%s%.2f%s%.2f','y=',controlm,'x+',controlb);
            %text(text1xpos,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
            %text2=sprintf('%s%.2f%s%.2f','y=',testm,'x+',testb);
            %text(text2xpos,text2ypos,text2,'FontSize',insetfontsize,'Color','r');
        end
        set(gca,'FontSize',axesfontsize);
        box on; hold off;
        
        
        subplot(3,3,6);
        %box on;
        hold on;
        ylabel('Total Surface Area (\mum^2)','FontSize',labelfontsize,'FontWeight','b');
        if nargin == 1
            controldatax = controlanalysis.soma.diameter.values;
            controldatay = controltype.totalsurfacearea.values;
            plot(controldatax,controldatay,'bo');
            [controlm,controlb,controlfitx,controlfity,controlr2] = linearfit(controldatax,controldatay,xlim);
            plot(controlfitx,controlfity,'b');
            xlimits=xlim;
            %set(gca,'xticklabel', []);
            %text1ypos=0.9*(max(ylim)-min(ylim))+min(ylim);
            %text2ypos=0.8*(max(ylim)-min(ylim))+min(ylim);
            %text1xpos=0.1*(max(xlim)-min(xlim))+min(xlim);
            %text2xpos=text1xpos;
            %text1=sprintf('%s%.2f%s%.2f','y=',controlm,'x+',controlb);
            %text(text1xpos,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
            %text2=sprintf('%s%.2f','r^2=',controlr2);
            %text(text2xpos,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        else
            controldatax = controlanalysis.soma.diameter.values;
            controldatay = controltype.totalsurfacearea.values;
            plot(controldatax,controldatay,'bo');
            testdatax    = testanalysis.soma.diameter.values;
            testdatay    = testtype.totalsurfacearea.values;
            plot(testdatax,testdatay,'rx');
            [controlm,controlb,controlfitx,controlfity,controlr2] = linearfit(controldatax,controldatay,xlim);
            [testm,testb,testfitx,testfity,testr2]                = linearfit(testdatax,testdatay,xlim);
            plot(controlfitx,controlfity,'b');
            plot(testfitx,testfity,'r');
            xlimits=xlim;
            %set(gca,'xticklabel', []);
            %text1ypos=0.9*(max(ylim)-min(ylim))+min(ylim);
            %text2ypos=0.8*(max(ylim)-min(ylim))+min(ylim);
            %text1xpos=0.1*(max(xlim)-min(xlim))+min(xlim);
            %text2xpos=text1xpos;
            %text1=sprintf('%s%.2f%s%.2f','y=',controlm,'x+',controlb);
            %text(text1xpos,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
            %text2=sprintf('%s%.2f%s%.2f','y=',testm,'x+',testb);
            %text(text2xpos,text2ypos,text2,'FontSize',insetfontsize,'Color','r');
        end
        set(gca,'FontSize',axesfontsize);
        box on; hold off;
        
        
        subplot(3,3,9);
        %box on;
        hold on;
        ylabel('Total Volume (\mum^3)','FontSize',labelfontsize,'FontWeight','b');
        xlabel('Soma Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
        if nargin == 1
            controldatax = controlanalysis.soma.diameter.values;
            controldatay = controltype.totalvolume.values;
            plot(controldatax,controldatay,'bo');
            [controlm,controlb,controlfitx,controlfity,controlr2] = linearfit(controldatax,controldatay,xlim);
            plot(controlfitx,controlfity,'b');
            xlimits=xlim;
            %set(gca,'xticklabel', []);
            %text1ypos=0.9*(max(ylim)-min(ylim))+min(ylim);
            %text2ypos=0.8*(max(ylim)-min(ylim))+min(ylim);
            %text1xpos=0.1*(max(xlim)-min(xlim))+min(xlim);
            %text2xpos=text1xpos;
            %text1=sprintf('%s%.2f%s%.2f','y=',controlm,'x+',controlb);
            %text(text1xpos,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
            %text2=sprintf('%s%.2f','r^2=',controlr2);
            %text(text2xpos,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        else
            controldatax = controlanalysis.soma.diameter.values;
            controldatay = controltype.totalvolume.values;
            plot(controldatax,controldatay,'bo');
            testdatax    = testanalysis.soma.diameter.values;
            testdatay    = testtype.totalvolume.values;
            plot(testdatax,testdatay,'rx');
            [controlm,controlb,controlfitx,controlfity,controlr2] = linearfit(controldatax,controldatay,xlim);
            [testm,testb,testfitx,testfity,testr2]                = linearfit(testdatax,testdatay,xlim);
            plot(controlfitx,controlfity,'b');
            plot(testfitx,testfity,'r');
            xlimits=xlim;
            %set(gca,'xticklabel', []);
            %text1ypos=0.9*(max(ylim)-min(ylim))+min(ylim);
            %text2ypos=0.8*(max(ylim)-min(ylim))+min(ylim);
            %text1xpos=0.1*(max(xlim)-min(xlim))+min(xlim);
            %text2xpos=text1xpos;
            %text1=sprintf('%s%.2f%s%.2f','y=',controlm,'x+',controlb);
            %text(text1xpos,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
            %text2=sprintf('%s%.2f%s%.2f','y=',testm,'x+',testb);
            %text(text2xpos,text2ypos,text2,'FontSize',insetfontsize,'Color','r');
        end
        set(gca,'FontSize',axesfontsize);
        box on; hold off;
        
        
        currentdirectory = cd;
        %subplotspace('horizontal',-5);
        %subplotspace('vertical',-15);
        
        if nargin == 1
            [ignore,h]=suplabel([controlanalysis.inputfilename ' -- ' currentpiecetitle ' Morphometrics vs Soma Diameter']  ,'t');
            set(h,'FontSize',titlefontsize);
            cd(controlanalysis.datapathname);
            if exist(piecetypes{piecetype},'dir') ~= 7
                mkdir(piecetypes{piecetype});
            end
            cd(piecetypes{piecetype});
            if exist('figures','dir') ~= 7
                mkdir('figures');
            end
            cd('figures');
            filename = sprintf('%s_%s_06_1_vs_SomaDiam',controlanalysis.inputfilename,currentpiecetype);
        else
            [ignore,h]=suplabel([controlanalysis.inputfilename ' & ' testanalysis.inputfilename ' -- ' currentpiecetitle ' Morphometrics vs Soma Diameter']  ,'t');
            set(h,'FontSize',titlefontsize);
            legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
            cd(testanalysis.datapathname);
            cd ..
            if exist(sprintf('%s_%s_comparison',controlanalysis.inputfilename,testanalysis.inputfilename),'dir') ~= 7;
                mkdir(sprintf('%s_%s_comparison',controlanalysis.inputfilename,testanalysis.inputfilename));
            end
            cd(sprintf('%s_%s_comparison',controlanalysis.inputfilename,testanalysis.inputfilename));
            if exist(piecetypes{piecetype},'dir') ~= 7
                mkdir(piecetypes{piecetype});
            end
            cd(piecetypes{piecetype});
            filename = sprintf('%s_%s_%s_06_1_vs_SomaDiam',controlanalysis.inputfilename,testanalysis.inputfilename,currentpiecetype);
        end
        
        print('-djpeg',filename);
        if strcmp(option.mnfigures.matfig,'y')
            saveas(gcf,filename,'fig');
        end
        
        cd(currentdirectory);
        
    end
end        
        