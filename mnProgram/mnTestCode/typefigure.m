% typefigure
% Bif/term diameter figures

titlefontsize = 14;
labelfontsize = 7;
axesfontsize  = 5;
insetfontsize = 5;


indbluemarkersize  = 7;
indgreenmarkersize = 4;
indredmarkersize   = 5;

bluemarkersize    = 10;
greenmarkersize   = 6;
redmarkersize     = 8;
cyanmarkersize    = 8;
yellowmarkersize  = 4;
magentamarkersize = 6;

h = figure;
%set(h,'PaperOrientation','landscape');

subplot(2,4,1);
plot([MotoneuronCat_analysis.diameter.diameter],[MotoneuronCat_analysis.diameter.taperrate.mean],'bo','MarkerFaceColor','b','MarkerSize',indbluemarkersize);
hold on;
plot([MotoneuronCat_analysis.bifurcation.diameter.diameter],[MotoneuronCat_analysis.bifurcation.diameter.taperrate.mean],'gs','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
plot([MotoneuronCat_analysis.termination.diameter.diameter],[MotoneuronCat_analysis.termination.diameter.taperrate.mean],'rd','MarkerFaceColor','r','MarkerSize',indredmarkersize);
set(gca,'XScale','log');
%set(gca,'YScale','log');
ylabel('Mean Taper Rate','FontSize',8,'FontWeight','b');
ylim([-3e-3 10e-3]);
set(gca,'FontSize',6);
title('Cat Motoneurons','FontSize',10,'FontWeight','b');
legendplot = gca;

subplot(2,4,2);
plot([BipolarRat_analysis.diameter.diameter],[BipolarRat_analysis.diameter.taperrate.mean],'bo','MarkerFaceColor','b','MarkerSize',indbluemarkersize);
hold on;
plot([BipolarRat_analysis.bifurcation.diameter.diameter],[BipolarRat_analysis.bifurcation.diameter.taperrate.mean],'gs','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
plot([BipolarRat_analysis.termination.diameter.diameter],[BipolarRat_analysis.termination.diameter.taperrate.mean],'rd','MarkerFaceColor','r','MarkerSize',indredmarkersize);
set(gca,'XScale','log');
%set(gca,'YScale','log');
set(gca,'FontSize',6);
title('Rat Bipolar Cells','FontSize',10,'FontWeight','b');

subplot(2,4,3);
plot([MartinottiRat_analysis.diameter.diameter],[MartinottiRat_analysis.diameter.taperrate.mean],'bo','MarkerFaceColor','b','MarkerSize',indbluemarkersize);
hold on;
plot([MartinottiRat_analysis.bifurcation.diameter.diameter],[MartinottiRat_analysis.bifurcation.diameter.taperrate.mean],'gs','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
plot([MartinottiRat_analysis.termination.diameter.diameter],[MartinottiRat_analysis.termination.diameter.taperrate.mean],'rd','MarkerFaceColor','r','MarkerSize',indredmarkersize);
set(gca,'XScale','log');
%set(gca,'YScale','log');
set(gca,'FontSize',6);
title('Rat Martinotti Cells','FontSize',10,'FontWeight','b');

subplot(2,4,4);
plot([IaIntCat_analysis.diameter.diameter],[IaIntCat_analysis.diameter.taperrate.mean],'bo','MarkerFaceColor','b','MarkerSize',indbluemarkersize);
hold on;
plot([IaIntCat_analysis.bifurcation.diameter.diameter],[IaIntCat_analysis.bifurcation.diameter.taperrate.mean],'gs','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
plot([IaIntCat_analysis.termination.diameter.diameter],[IaIntCat_analysis.termination.diameter.taperrate.mean],'rd','MarkerFaceColor','r','MarkerSize',indredmarkersize);
set(gca,'XScale','log');
%set(gca,'YScale','log');
set(gca,'FontSize',6);
title('Cat Ia Interneurons','FontSize',10,'FontWeight','b');

subplot(2,4,5);
plot([MotoneuronCat_analysis.diameter.diameter],[MotoneuronCat_analysis.diameter.rallratio.mean],'bo','MarkerFaceColor','b','MarkerSize',indbluemarkersize);
ylabel('Mean Rall Ratio','FontSize',8,'FontWeight','b');
xlabel('Diameter (\mum)','FontSize',8,'FontWeight','b');
set(gca,'FontSize',6);
set(gca,'XScale','log');
%set(gca,'YScale','log');

subplot(2,4,6);
plot([BipolarRat_analysis.diameter.diameter],[BipolarRat_analysis.diameter.rallratio.mean],'bo','MarkerFaceColor','b','MarkerSize',indbluemarkersize);
xlabel('Diameter (\mum)','FontSize',8,'FontWeight','b');
set(gca,'FontSize',6);
set(gca,'XScale','log');
%set(gca,'YScale','log');

subplot(2,4,7);
plot([MartinottiRat_analysis.diameter.diameter],[MartinottiRat_analysis.diameter.rallratio.mean],'bo','MarkerFaceColor','b','MarkerSize',indbluemarkersize);
xlabel('Diameter (\mum)','FontSize',8,'FontWeight','b');
set(gca,'FontSize',6);
set(gca,'XScale','log');
%set(gca,'YScale','log');

subplot(2,4,8);
plot([IaIntCat_analysis.diameter.diameter],[IaIntCat_analysis.diameter.rallratio.mean],'bo','MarkerFaceColor','b','MarkerSize',indbluemarkersize);
xlabel('Diameter (\mum)','FontSize',8,'FontWeight','b');
set(gca,'FontSize',6);
set(gca,'XScale','log');
%set(gca,'YScale','log');

% [ax,h1]=suplabel('Taper Rate and Rall Ratio versus Local Diameter in Dendritic Arborizations','t');
% set(h1,'FontSize',titlefontsize,'FontWeight','b');

subplotspace('horizontal',-8);
subplotspace('vertical',-20);

legend(legendplot,'Combined','Bifurcating','Terminating','Location','SouthEast');
%legend boxoff
%fillscreen;
print('-djpeg99','-r600','prelimdata');





% xlabel(versuslabel,'FontSize',8,'FontWeight','b');
% ylabel([measurelabel ' ' statisticlabel],'FontSize',8,'FontWeight','b');
% title(char(' ',[branchlabel ' ' measurelabel ' ' statisticlabel  ' vs ' versustitle],' '),'FontSize',12,'FontWeight','b');
% set(gca,'FontSize',6);
% filename = sprintf('%s_1_SingleBin_%s_%s_%s_vs_%s',analysis.inputfilename,branch,measure,statistic,versus);
% print('-djpeg',filename);
% set(gca,'YScale','log');
% filename = sprintf('%s_1_SingleBin_%s_%s_%s_vs_%s_logy',analysis.inputfilename,branch,measure,statistic,versus);
% print('-djpeg',filename);
% set(gca,'XScale','log');
% filename = sprintf('%s_1_SingleBin_%s_%s_%s_vs_%s_logy_logx',analysis.inputfilename,branch,measure,statistic,versus);
% print('-djpeg',filename);














% subplot(3,2,1); box on; 
% controldatax1   = [controlanalysis.diameter.diameter];
% controldatay1   = [controlanalysis.diameter.numbersegments.mean];
% controldatastd1 = [controlanalysis.diameter.numbersegments.std];
%%errorbar(controldatax1,controldatay1,controldatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10);
% plot(controldatax1,controldatay1,'-ob','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',indbluemarkersize);
% hold on;   
% controldatax2   = [controlanalysis.bifurcation.diameter.diameter];
% controldatay2   = [controlanalysis.bifurcation.diameter.numbersegments.mean];
% controldatastd2 = [controlanalysis.bifurcation.diameter.numbersegments.std];
% errorbar(controldatax2,controldatay2,controldatastd2/2,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);  
% controldatax3   = [controlanalysis.termination.diameter.diameter];
% controldatay3   = [controlanalysis.termination.diameter.numbersegments.mean];
% controldatastd3 = [controlanalysis.termination.diameter.numbersegments.std];
% errorbar(controldatax3,controldatay3,controldatastd3/2,'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);   
% ylabel('Number Segments','FontSize',labelfontsize,'FontWeight','b');
%%h=gca; set(gca,'XDir','reverse');    
%%% legendhandle = gca;    
 %%   ylimits=ylim;
%%    ylimits=[0 ylimits(2)];
 %%   ylim(ylimits);
% xlimits=xlim;
% xtick = get(gca,'xtick');
% set(gca,'xticklabel', []);
% set(gca,'FontSize',axesfontsize);hold off;


% subplot(3,2,3); box on; 
% controldatax1   = [controlanalysis.diameter.diameter];
% controldatay1   = [controlanalysis.diameter.meandiameter.mean];
% controldatastd1 = [controlanalysis.diameter.meandiameter.std];
%%errorbar(controldatax1,controldatay1,controldatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10);
% plot(controldatax1,controldatay1,'-ob','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',indbluemarkersize);
% hold on;
% controldatax2   = [controlanalysis.bifurcation.diameter.diameter];
% controldatay2   = [controlanalysis.bifurcation.diameter.meandiameter.mean];
% controldatastd2 = [controlanalysis.bifurcation.diameter.meandiameter.std];
% errorbar(controldatax2,controldatay2,controldatastd2/2,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
% controldatax3   = [controlanalysis.termination.diameter.diameter];
% controldatay3   = [controlanalysis.termination.diameter.meandiameter.mean];
% controldatastd3 = [controlanalysis.termination.diameter.meandiameter.std];
% errorbar(controldatax3,controldatay3,controldatastd3/2,'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
% ylabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
%%h=gca; set(gca,'XDir','reverse');
%%    ylimits=ylim;
%%    ylimits=[0 ylimits(2)];
%%    ylim(ylimits);
% xlimits=xlim;
% xtick = get(gca,'xtick');
% set(gca,'xticklabel', []);
% set(gca,'FontSize',axesfontsize);hold off;


% subplot(3,2,5); box on; 
% controldatax1   = [controlanalysis.diameter.diameter];
% controldatay1   = [controlanalysis.diameter.taperrate.mean];
% controldatastd1 = [controlanalysis.diameter.taperrate.std];
%%errorbar(controldatax1,controldatay1,controldatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10);
% plot(controldatax1,controldatay1,'-ob','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',indbluemarkersize);
% hold on;
% controldatax2   = [controlanalysis.bifurcation.diameter.diameter];
% controldatay2   = [controlanalysis.bifurcation.diameter.taperrate.mean];
% controldatastd2 = [controlanalysis.bifurcation.diameter.taperrate.std];
% errorbar(controldatax2,controldatay2,controldatastd2/2,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
% controldatax3   = [controlanalysis.termination.diameter.diameter];
% controldatay3   = [controlanalysis.termination.diameter.taperrate.mean];
% controldatastd3 = [controlanalysis.termination.diameter.taperrate.std];
% errorbar(controldatax3,controldatay3,controldatastd3/2,'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
% ylabel('Taper Rate','FontSize',labelfontsize,'FontWeight','b');
% xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
%%h=gca; set(gca,'XDir','reverse');
 %%   ylimits=ylim;
 %%   ylimits=[0 ylimits(2)];
 %%   ylim(ylimits);
 %%   xlimits=xlim;
 %%   xtick = get(gca,'xtick');
 %%   set(gca,'xticklabel', []);
% set(gca,'FontSize',axesfontsize);hold off;


% subplot(3,2,2); box on; 

% controldatax1   = [controlanalysis.diameter.diameter];
% controldatay1   = [controlanalysis.diameter.length.mean];
% controldatastd1 = [controlanalysis.diameter.length.std];
%%errorbar(controldatax1,controldatay1,controldatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10);
% plot(controldatax1,controldatay1,'-ob','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',indbluemarkersize);
% hold on;
% controldatax2   = [controlanalysis.bifurcation.diameter.diameter];
% controldatay2   = [controlanalysis.bifurcation.diameter.length.mean];
% controldatastd2 = [controlanalysis.bifurcation.diameter.length.std];
% errorbar(controldatax2,controldatay2,controldatastd2/2,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
% controldatax3   = [controlanalysis.termination.diameter.diameter];
% controldatay3   = [controlanalysis.termination.diameter.length.mean];
% controldatastd3 = [controlanalysis.termination.diameter.length.std];
% errorbar(controldatax3,controldatay3,controldatastd3/2,'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
% ylabel('Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
%%h=gca; set(gca,'XDir','reverse');
%%    ylimits=ylim;
 %%   ylimits=[0 ylimits(2)];
 %%   ylim(ylimits);
% xlimits=xlim;
% xtick = get(gca,'xtick');
% set(gca,'xticklabel', []);
% set(gca,'FontSize',axesfontsize);hold off;


% subplot(3,2,4); box on;    
% controldatax1   = [controlanalysis.diameter.diameter];
% controldatay1   = [controlanalysis.diameter.surfacearea.mean];
% controldatastd1 = [controlanalysis.diameter.surfacearea.std];
%%errorbar(controldatax1,controldatay1,controldatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10);
% plot(controldatax1,controldatay1,'-ob','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',indbluemarkersize);
% hold on;
% controldatax2   = [controlanalysis.bifurcation.diameter.diameter];
% controldatay2   = [controlanalysis.bifurcation.diameter.surfacearea.mean];
% controldatastd2 = [controlanalysis.bifurcation.diameter.surfacearea.std];
% errorbar(controldatax2,controldatay2,controldatastd2/2,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
% controldatax3   = [controlanalysis.termination.diameter.diameter];
% controldatay3   = [controlanalysis.termination.diameter.surfacearea.mean];
% controldatastd3 = [controlanalysis.termination.diameter.surfacearea.std];
% errorbar(controldatax3,controldatay3,controldatastd3/2,'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
% ylabel('Surface Area (\mum^2)','FontSize',labelfontsize,'FontWeight','b');
%%h=gca; set(gca,'XDir','reverse');
%%    ylimits=ylim;
%%    ylimits=[0 ylimits(2)];
 %%   ylim(ylimits);
% xlimits=xlim;
% xtick = get(gca,'xtick');
% set(gca,'xticklabel', []);
% set(gca,'FontSize',axesfontsize);hold off;


% subplot(3,2,6); box on; 

% controldatax1   = [controlanalysis.diameter.diameter];
% controldatay1   = [controlanalysis.diameter.volume.mean];
% controldatastd1 = [controlanalysis.diameter.volume.std];
%%errorbar(controldatax1,controldatay1,controldatastd1/2,'-ok','LineWidth',1,'MarkerEdgeColor','k','MarkerFaceColor','w','MarkerSize',10);
% plot(controldatax1,controldatay1,'-ob','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',indbluemarkersize);
% hold on;
% controldatax2   = [controlanalysis.bifurcation.diameter.diameter];
% controldatay2   = [controlanalysis.bifurcation.diameter.volume.mean];
% controldatastd2 = [controlanalysis.bifurcation.diameter.volume.std];
% errorbar(controldatax2,controldatay2,controldatastd2/2,'-sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);
% controldatax3   = [controlanalysis.termination.diameter.diameter];
% controldatay3   = [controlanalysis.termination.diameter.volume.mean];
% controldatastd3 = [controlanalysis.termination.diameter.volume.std];
% errorbar(controldatax3,controldatay3,controldatastd3/2,'-dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
% ylabel('Volume (\mum^3)','FontSize',labelfontsize,'FontWeight','b');
% xlabel('Local Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
% h=gca; set(gca,'XDir','reverse');

    % ylimits=ylim;
    % ylimits=[0 ylimits(2)];
    % ylim(ylimits);

    % xlimits=xlim;
    % xtick = get(gca,'xtick');
    % set(gca,'xticklabel', []);

% set(gca,'FontSize',axesfontsize);hold off;




% subplotspace('horizontal',-5);
% subplotspace('vertical',-15);

%[ax,h1]=suplabel('Diameter (\mum)');
% [ax,h3]=suplabel('Morphometrics versus Local Diameter'  ,'t');
%set(h1,'FontSize',15);
% set(h3,'FontSize',titlefontsize);


% currentdirectory = cd;
% cd(controlanalysis.datapathname);

% if exist('figures','dir')==7
	% cd('figures');
% else
	% mkdir('figures');
	% cd('figures');
% end

%fillscreen;

% legend(legendhandle,[controlanalysis.inputfilename ' All'],[controlanalysis.inputfilename ' Bifs'],[controlanalysis.inputfilename ' Terms'],'Location','NorthEast');
% legend('boxoff');

% filename = sprintf('%s_%s',controlanalysis.inputfilename,'103_Morph_v_Diam');
% print('-djpeg',filename);
%saveas(gcf,filename,'fig');



