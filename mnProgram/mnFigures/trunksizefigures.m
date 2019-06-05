function trunksizefigures(controlanalysis,testanalysis)
% Primary Dendrite Proximal Diameter Figures

mnoptions;

titlefontsize = option.mnfigures.titlefontsize;
labelfontsize = option.mnfigures.labelfontsize;
axesfontsize  = option.mnfigures.axesfontsize;
insetfontsize = option.mnfigures.insetfontsize;
    
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
        
        
        subplot(3,2,3)
        box on;
        hold on;
        ylabel('Number Segments','FontSize',labelfontsize,'FontWeight','b');
        if nargin == 1
            controldatax = controltype.trunk.proximaldiameter.values;
            controldatay = controltype.trunk.numbersegments.values;
            scatter(controldatax,controldatay,'bo');
            [controla,controlb,controlfitx,controlfity,controlr2] = powerfit(controldatax,controldatay,xlim);
            plot(controlfitx,controlfity,'b');
            ylimits=ylim;
            ylimits=[0 ylimits(2)];
            ylim(ylimits);
            xlimits=xlim;
            set(gca,'xticklabel', []);
            text1ypos=0.9*max(ylimits);
            text2ypos=0.8*max(ylimits);
            text1xpos=0.1*max(xlimits);
            text2xpos=text1xpos;
            text1=sprintf('%s%.2f%s%.2f%s','y=',controla,'x^{',controlb,'}');
            text(text1xpos,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
            text2=sprintf('%s%.2f','r^2=',controlr2);
            text(text2xpos,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        else
            controldatax = controltype.trunk.proximaldiameter.values;
            controldatay = controltype.trunk.numbersegments.values;
            scatter(controldatax,controldatay,'bo');
            testdatax    = testtype.trunk.proximaldiameter.values;
            testdatay    = testtype.trunk.numbersegments.values;
            scatter(testdatax,testdatay,'rx');
            [controla,controlb,controlfitx,controlfity,controlr2] = powerfit(controldatax,controldatay,xlim);
            [testa,testb,testfitx,testfity,testr2]                = powerfit(testdatax,testdatay,xlim);
            plot(controlfitx,controlfity,'b');
            plot(testfitx,testfity,'r');
            ylimits=ylim;
            ylimits=[0 ylimits(2)];
            ylim(ylimits);
            xlimits=xlim;
            set(gca,'xticklabel', []);
            text1ypos=0.9*max(ylimits);
            text2ypos=0.8*max(ylimits);
            text1xpos=0.1*max(xlimits);
            text2xpos=text1xpos;
            text1=sprintf('%s%.2f%s%.2f%s','y=',controla,'x^{',controlb,'}');
            text(text1xpos,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
            text2=sprintf('%s%.2f%s%.2f%s','y=',testa,'x^{',testb,'}');
            text(text2xpos,text2ypos,text2,'FontSize',insetfontsize,'Color','r');
        end
        set(gca,'FontSize',axesfontsize);
        hold off;
        
        
        subplot(3,2,1)
        box on;
        hold on;
        legendhandle = gca;
        ylabel('Number Trunks','FontSize',labelfontsize,'FontWeight','b');
        if nargin == 1
            hist(controltype.trunk.proximaldiameter.values);
            set(gca,'xticklabel', []);
            h = findobj(gca,'Type','patch');
            set(h,'FaceColor','b','EdgeColor','b','FaceAlpha',0.5,'EdgeAlpha',0.5);
            xlim(xlimits);
        else
            [ignore xvalues] = hist([controltype.trunk.proximaldiameter.values testtype.trunk.proximaldiameter.values]);
            hist(controltype.trunk.proximaldiameter.values,xvalues);
            hist(testtype.trunk.proximaldiameter.values,xvalues);
            xlim(xlimits);
            set(gca,'xticklabel', []);
            h = findobj(gca,'Type','patch');
            set(h(2),'FaceColor','b','EdgeColor','b','FaceAlpha',0.5,'EdgeAlpha',0.5);
            set(h(1),'FaceColor','r','EdgeColor','r','FaceAlpha',0.5,'EdgeAlpha',0.5);
        end
        set(gca,'FontSize',axesfontsize);
        hold off;
        
        
        subplot(3,2,5)
        box on;
        hold on;
        ylabel('Max Branch Order','FontSize',labelfontsize,'FontWeight','b');
        xlabel('Trunk Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
        if nargin == 1
            controldatax = controltype.trunk.proximaldiameter.values;
            controldatay = controltype.trunk.maxbranchorder.values;
            scatter(controldatax,controldatay,'bo');
            [controla,controlb,controlfitx,controlfity,controlr2] = powerfit(controldatax,controldatay,xlim);
            plot(controlfitx,controlfity,'b');
            ylimits=ylim;
            ylimits=[0 ylimits(2)];
            ylim(ylimits);
            xlimits=xlim;
            text1ypos=0.9*max(ylimits);
            text2ypos=0.8*max(ylimits);
            text1xpos=0.1*max(xlimits);
            text2xpos=text1xpos;
            text1=sprintf('%s%.2f%s%.2f%s','y=',controla,'x^{',controlb,'}');
            text(text1xpos,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
            text2=sprintf('%s%.2f','r^2=',controlr2);
            text(text2xpos,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        else
            controldatax = controltype.trunk.proximaldiameter.values;
            controldatay = controltype.trunk.maxbranchorder.values;
            scatter(controldatax,controldatay,'bo');
            testdatax    = testtype.trunk.proximaldiameter.values;
            testdatay    = testtype.trunk.maxbranchorder.values;
            scatter(testdatax,testdatay,'rx');
            [controla,controlb,controlfitx,controlfity,controlr2] = powerfit(controldatax,controldatay,xlim);
            [testa,testb,testfitx,testfity,testr2]                = powerfit(testdatax,testdatay,xlim);
            plot(controlfitx,controlfity,'b');
            plot(testfitx,testfity,'r');
            ylimits=ylim;
            ylimits=[0 ylimits(2)];
            ylim(ylimits);
            xlimits=xlim;
            text1ypos=0.9*max(ylimits);
            text2ypos=0.8*max(ylimits);
            text1xpos=0.1*max(xlimits);
            text2xpos=text1xpos;
            text1=sprintf('%s%.2f%s%.2f%s','y=',controla,'x^{',controlb,'}');
            text(text1xpos,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
            text2=sprintf('%s%.2f%s%.2f%s','y=',testa,'x^{',testb,'}');
            text(text2xpos,text2ypos,text2,'FontSize',insetfontsize,'Color','r');
        end
        set(gca,'FontSize',axesfontsize);
        hold off;
        
        
        subplot(3,2,2)
        box on;
        hold on;
        ylabel('Total Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
        if nargin == 1
            controldatax = controltype.trunk.proximaldiameter.values;
            controldatay = controltype.trunk.totallength.values;
            scatter(controldatax,controldatay,'bo');
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
        else
            controldatax = controltype.trunk.proximaldiameter.values;
            controldatay = controltype.trunk.totallength.values;
            scatter(controldatax,controldatay,'bo');
            testdatax    = testtype.trunk.proximaldiameter.values;
            testdatay    = testtype.trunk.totallength.values;
            scatter(testdatax,testdatay,'rx');
            [controla,controlb,controlfitx,controlfity,controlr2] = powerfit(controldatax,controldatay,xlim);
            [testa,testb,testfitx,testfity,testr2]                = powerfit(testdatax,testdatay,xlim);
            plot(controlfitx,controlfity,'b');
            plot(testfitx,testfity,'r');
            ylimits=ylim;
            ylimits=[0 ylimits(2)];
            ylim(ylimits);
            xlimits=xlim;
            set(gca,'xticklabel', []);
            text1ypos=0.9*max(ylimits);
            text2ypos=0.8*max(ylimits);
            text1xpos=0.1*max(xlimits);
            text2xpos=text1xpos;
            text1=sprintf('%s%.2f%s%.2f%s','y=',controla,'x^{',controlb,'}');
            text(text1xpos,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
            text2=sprintf('%s%.2f%s%.2f%s','y=',testa,'x^{',testb,'}');
            text(text2xpos,text2ypos,text2,'FontSize',insetfontsize,'Color','r');
        end
        set(gca,'FontSize',axesfontsize);
        hold off;
        
        
        subplot(3,2,4)
        box on;
        hold on;
        ylabel('Total Surface Area (\mum^2)','FontSize',labelfontsize,'FontWeight','b');
        if nargin == 1
            controldatax = controltype.trunk.proximaldiameter.values;
            controldatay = controltype.trunk.totalsurfacearea.values;
            scatter(controldatax,controldatay,'bo');
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
        else
            controldatax = controltype.trunk.proximaldiameter.values;
            controldatay = controltype.trunk.totalsurfacearea.values;
            scatter(controldatax,controldatay,'bo');
            testdatax    = testtype.trunk.proximaldiameter.values;
            testdatay    = testtype.trunk.totalsurfacearea.values;
            scatter(testdatax,testdatay,'rx');
            [controla,controlb,controlfitx,controlfity,controlr2] = powerfit(controldatax,controldatay,xlim);
            [testa,testb,testfitx,testfity,testr2]                = powerfit(testdatax,testdatay,xlim);
            plot(controlfitx,controlfity,'b');
            plot(testfitx,testfity,'r');
            ylimits=ylim;
            ylimits=[0 ylimits(2)];
            ylim(ylimits);
            xlimits=xlim;
            set(gca,'xticklabel', []);
            text1ypos=0.9*max(ylimits);
            text2ypos=0.8*max(ylimits);
            text1xpos=0.1*max(xlimits);
            text2xpos=text1xpos;
            text1=sprintf('%s%.2f%s%.2f%s','y=',controla,'x^{',controlb,'}');
            text(text1xpos,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
            text2=sprintf('%s%.2f%s%.2f%s','y=',testa,'x^{',testb,'}');
            text(text2xpos,text2ypos,text2,'FontSize',insetfontsize,'Color','r');
        end
        set(gca,'FontSize',axesfontsize);
        hold off;
        
        
        subplot(3,2,6)
        box on;
        hold on;
        ylabel('Total Volume (\mum^3)','FontSize',labelfontsize,'FontWeight','b');
        xlabel('Trunk Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
        if nargin == 1
            controldatax = controltype.trunk.proximaldiameter.values;
            controldatay = controltype.trunk.totalvolume.values;
            scatter(controldatax,controldatay,'bo');
            [controla,controlb,controlfitx,controlfity,controlr2] = powerfit(controldatax,controldatay,xlim);
            plot(controlfitx,controlfity,'b');
            ylimits=ylim;
            ylimits=[0 ylimits(2)];
            ylim(ylimits);
            xlimits=xlim;
            text1ypos=0.9*max(ylimits);
            text2ypos=0.8*max(ylimits);
            text1xpos=0.1*max(xlimits);
            text2xpos=text1xpos;
            text1=sprintf('%s%.2f%s%.2f%s','y=',controla,'x^{',controlb,'}');
            text(text1xpos,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
            text2=sprintf('%s%.2f','r^2=',controlr2);
            text(text2xpos,text2ypos,text2,'FontSize',insetfontsize,'Color','b');
        else
            controldatax = controltype.trunk.proximaldiameter.values;
            controldatay = controltype.trunk.totalvolume.values;
            scatter(controldatax,controldatay,'bo');
            testdatax    = testtype.trunk.proximaldiameter.values;
            testdatay    = testtype.trunk.totalvolume.values;
            scatter(testdatax,testdatay,'rx');
            [controla,controlb,controlfitx,controlfity,controlr2] = powerfit(controldatax,controldatay,xlim);
            [testa,testb,testfitx,testfity,testr2]                = powerfit(testdatax,testdatay,xlim);
            plot(controlfitx,controlfity,'b');
            plot(testfitx,testfity,'r');
            ylimits=ylim;
            ylimits=[0 ylimits(2)];
            ylim(ylimits);
            xlimits=xlim;
            text1ypos=0.9*max(ylimits);
            text2ypos=0.8*max(ylimits);
            text1xpos=0.1*max(xlimits);
            text2xpos=text1xpos;
            text1=sprintf('%s%.2f%s%.2f%s','y=',controla,'x^{',controlb,'}');
            text(text1xpos,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
            text2=sprintf('%s%.2f%s%.2f%s','y=',testa,'x^{',testb,'}');
            text(text2xpos,text2ypos,text2,'FontSize',insetfontsize,'Color','r');
        end
        set(gca,'FontSize',axesfontsize);
        hold off;
        
        
        currentdirectory = cd;
        %subplotspace('horizontal',-5);
        %subplotspace('vertical',-15);
        
        if nargin == 1
            [ignore,h]=suplabel([controlanalysis.inputfilename ' -- ' currentpiecetitle ' Morphometrics vs Trunk Diameter']  ,'t');
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
            filename = sprintf('%s_%s_07_1_TrunkSize',controlanalysis.inputfilename,currentpiecetype);
        else
            [ignore,h]=suplabel([controlanalysis.inputfilename ' vs ' testanalysis.inputfilename ' -- ' currentpiecetitle ' Morphometrics vs Trunk Diameter']  ,'t');
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
            filename = sprintf('%s_%s_%s_07_1_TrunkSize',controlanalysis.inputfilename,testanalysis.inputfilename,currentpiecetype);
        end
        
        print('-djpeg',filename);
        if strcmp(option.mnfigures.matfig,'y')
            saveas(gcf,filename,'fig');
        end
        
        cd(currentdirectory);
        
    end
end        
        
  