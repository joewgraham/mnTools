function cablepropertyfigures(controlanalysis,testanalysis)

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

        for branchtype = 1:2

            if branchtype == 1
				eval(['cable1 = controlanalysis.' currentpiecetype '.bifurcation.cable;']);
				branchtitle = 'Bifurcating Cable Analysis';
				if nargin == 2
					eval(['cable2 = testanalysis.' currentpiecetype '.bifurcation.cable;']);
				end
            else
				eval(['cable1 = controlanalysis.' currentpiecetype '.termination.cable;']);
				branchtitle = 'Terminating Cable Analysis';
				if nargin == 2
					eval(['cable2 = testanalysis.' currentpiecetype '.termination.cable;']);
				end
			end

			figure;

			subplot(3,4,1)
			box on;
			hold on;
			%xlabel('Branch Proximal Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
			ylabel('Branch Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
			scatter(cable1.proximaldiameter.values,cable1.length.values,'bo');
			if nargin == 2
				scatter(cable2.proximaldiameter.values,cable2.length.values,'rx');
			end
			set(gca,'FontSize',axesfontsize);
			hold off;

			subplot(3,4,5)
			box on;
			hold on;
			%xlabel('Branch Proximal Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
			ylabel('Branch Surface Area (\mum^2)','FontSize',labelfontsize,'FontWeight','b');
			scatter(cable1.proximaldiameter.values,cable1.surfacearea.values,'bo');
			if nargin == 2
				scatter(cable2.proximaldiameter.values,cable2.surfacearea.values,'rx');
			end
			set(gca,'FontSize',axesfontsize);
			hold off;

			subplot(3,4,9)
			box on;
			hold on;
			xlabel('Branch Proximal Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
			ylabel('Branch Volume (\mum^3)','FontSize',labelfontsize,'FontWeight','b');
			scatter(cable1.proximaldiameter.values,cable1.volume.values,'bo');
			if nargin == 2
				scatter(cable2.proximaldiameter.values,cable2.volume.values,'rx');
			end
			set(gca,'FontSize',axesfontsize);
			hold off;

			subplot(3,4,2)
			box on;
			hold on;
			%xlabel('Branch Proximal Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
			%ylabel('Branch Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
			scatter(cable1.proximalpathlength.values,cable1.length.values,'bo');
			if nargin == 2
				scatter(cable2.proximalpathlength.values,cable2.length.values,'rx');
			end
			set(gca,'FontSize',axesfontsize);
			hold off;

			subplot(3,4,6)
			box on;
			hold on;
			%xlabel('Branch Proximal Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
			%ylabel('Branch Surface Area (\mum^2)','FontSize',labelfontsize,'FontWeight','b');
			scatter(cable1.proximalpathlength.values,cable1.surfacearea.values,'bo');
			if nargin == 2
				scatter(cable2.proximalpathlength.values,cable2.surfacearea.values,'rx');
			end
			set(gca,'FontSize',axesfontsize);
			hold off;

			subplot(3,4,10)
			box on;
			hold on;
			xlabel('Branch Proximal Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
			%ylabel('Branch Volume (\mum^3)','FontSize',labelfontsize,'FontWeight','b');
			scatter(cable1.proximalpathlength.values,cable1.volume.values,'bo');
			if nargin == 2
				scatter(cable2.proximalpathlength.values,cable2.volume.values,'rx');
			end
			set(gca,'FontSize',axesfontsize);
			hold off;

			subplot(3,4,3)
			box on;
			hold on;
			%xlabel('Branch Order','FontSize',labelfontsize,'FontWeight','b');
			%ylabel('Branch Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
			scatter(cable1.branchorder.values,cable1.length.values,'bo');
			if nargin == 2
				scatter(cable2.branchorder.values,cable2.length.values,'rx');
			end
			set(gca,'FontSize',axesfontsize);
			hold off;

			subplot(3,4,7)
			box on;
			hold on;
			%xlabel('Branch Order','FontSize',labelfontsize,'FontWeight','b');
			%ylabel('Branch Surface Area (\mum^2)','FontSize',labelfontsize,'FontWeight','b');
			scatter(cable1.branchorder.values,cable1.surfacearea.values,'bo');
			if nargin == 2
				scatter(cable2.branchorder.values,cable2.surfacearea.values,'rx');
			end
			set(gca,'FontSize',axesfontsize);
			hold off;

			subplot(3,4,11)
			box on;
			hold on;
			xlabel('Branch Order','FontSize',labelfontsize,'FontWeight','b');
			%ylabel('Branch Volume (\mum^3)','FontSize',labelfontsize,'FontWeight','b');
			scatter(cable1.branchorder.values,cable1.volume.values,'bo');
			if nargin == 2
				scatter(cable2.branchorder.values,cable2.volume.values,'rx');
			end
			set(gca,'FontSize',axesfontsize);
			hold off;
            
            subplot(3,4,4)
			box on;
			hold on;
			%xlabel('Branch Length','FontSize',labelfontsize,'FontWeight','b');
			%ylabel('Branch Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
			scatter(cable1.length.values,cable1.length.values,'bo');
			if nargin == 2
				scatter(cable2.length.values,cable2.length.values,'rx');
			end
			set(gca,'FontSize',axesfontsize);
            legendhandle = gca;
			hold off;

			subplot(3,4,8)
			box on;
			hold on;
			%xlabel('Branch Length','FontSize',labelfontsize,'FontWeight','b');
			%ylabel('Branch Surface Area (\mum^2)','FontSize',labelfontsize,'FontWeight','b');
			scatter(cable1.length.values,cable1.surfacearea.values,'bo');
			if nargin == 2
				scatter(cable2.length.values,cable2.surfacearea.values,'rx');
			end
			set(gca,'FontSize',axesfontsize);
			hold off;

			subplot(3,4,12)
			box on;
			hold on;
			xlabel('Branch Length','FontSize',labelfontsize,'FontWeight','b');
			%ylabel('Branch Volume (\mum^3)','FontSize',labelfontsize,'FontWeight','b');
			scatter(cable1.length.values,cable1.volume.values,'bo');
			if nargin == 2
				scatter(cable2.length.values,cable2.volume.values,'rx');
			end
			set(gca,'FontSize',axesfontsize);
			hold off;

			currentdirectory = cd;
			%%subplotspace('horizontal',-5);
			%%subplotspace('vertical',-5);

			if nargin == 1
				[ignore,h]=suplabel([controlanalysis.inputfilename ' -- ' currentpiecetitle ' ' branchtitle]  ,'t');
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
				filename = sprintf('%s_%s_24_%d_Cable_Props',controlanalysis.inputfilename,currentpiecetype,branchtype);
			else
				[ignore,h]=suplabel([controlanalysis.inputfilename ' vs ' testanalysis.inputfilename ' -- ' currentpiecetitle ' ' branchtitle]  ,'t');
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
				filename = sprintf('%s_%s_%s_24_%d_Cable_Props',controlanalysis.inputfilename,testanalysis.inputfilename,currentpiecetype,branchtype);
			end

			print('-djpeg',filename);
			if strcmp(option.mnfigures.matfig,'y')
				saveas(gcf,filename,'fig');
			end

			cd(currentdirectory);
		end
	end
end


