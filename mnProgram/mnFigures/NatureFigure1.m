function biftermdiameterfigures(analysis1,analysis2,analysis3)
% Bif/term diameter figures

titlefontsize = 14;
labelfontsize = 7;
axesfontsize  = 5;
insetfontsize = 5;


indbluemarkersize  = 7;
indgreenmarkersize = 3;
indredmarkersize   = 5;

bluemarkersize    = 10;
greenmarkersize   = 6;
redmarkersize     = 8;
cyanmarkersize    = 8;
yellowmarkersize  = 4;
magentamarkersize = 6;

figure;

subplot(4,3,1); box on;
x1 = [analysis1.diameter.diameter];
y1 = [analysis1.bifurcation.diameter.taperrate.mean];
std1 = [analysis1.bifurcation.diameter.taperrate.std];
errorbar(x1,y1,std1/2,'sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);  
hold on;
x2 = [analysis1.diameter.diameter];
y2 = [analysis1.termination.diameter.taperrate.mean];
std2 = [analysis1.termination.diameter.taperrate.std];
errorbar(x2,y2,std2/2,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
ylabel('Taper Rate (\mum/\mum)','FontSize',labelfontsize,'FontWeight','b');
title('Motoneurons','FontSize',titlefontsize);


subplot(4,3,4); box on;
x3 = [analysis1.diameter.diameter];
y3 = [analysis1.bifurcation.diameter.bifurcationprobability.volume];
semilogy(x3,y3,'sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);  
hold on;
x4 = [analysis1.diameter.diameter];
y4 = [analysis1.termination.diameter.taperrate.mean];
semilogy(x4,y4,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
ylabel('Branch Ending Prob','FontSize',labelfontsize,'FontWeight','b');


subplot(4,3,7); box on;
x5 = [analysis1.diameter.diameter];
y5 = [analysis1.bifurcation.diameter.rallratio.mean];
std5 = [analysis1.bifurcation.diameter.rallratio.std];
errorbar(x5,y5,std5/2,'ob','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',indbluemarkersize);  
ylabel('Rall Ratio','FontSize',labelfontsize,'FontWeight','b');


subplot(4,3,10); box on;
x6 = [analysis1.diameter.diameter];
y6 = [analysis1.bifurcation.diameter.daughterratio.mean];
std6 = [analysis1.bifurcation.diameter.daughterratio.std];
errorbar(x6,y6,std6/2,'ob','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',indbluemarkersize);  
ylabel('Daughter Ratio','FontSize',labelfontsize,'FontWeight','b');
xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');





subplot(4,3,2); box on;
x1 = [analysis2.diameter.diameter];
y1 = [analysis2.bifurcation.diameter.taperrate.mean];
std1 = [analysis2.bifurcation.diameter.taperrate.std];
errorbar(x1,y1,std1/2,'sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);  
hold on;
x2 = [analysis2.diameter.diameter];
y2 = [analysis2.termination.diameter.taperrate.mean];
std2 = [analysis2.termination.diameter.taperrate.std];
errorbar(x2,y2,std2/2,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
%ylabel('Mean Taper Rate (\mum/\mum)','FontSize',labelfontsize,'FontWeight','b');
title('Purkinje Cells','FontSize',titlefontsize);


subplot(4,3,5); box on;
x3 = [analysis2.diameter.diameter];
y3 = [analysis2.bifurcation.diameter.bifurcationprobability.volume];
semilogy(x3,y3,'sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);  
hold on;
x4 = [analysis2.diameter.diameter];
y4 = [analysis2.termination.diameter.taperrate.mean];
semilogy(x4,y4,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
%ylabel('Branch End Prob by Volume','FontSize',labelfontsize,'FontWeight','b');


subplot(4,3,8); box on;
x5 = [analysis2.diameter.diameter];
y5 = [analysis2.bifurcation.diameter.rallratio.mean];
std5 = [analysis2.bifurcation.diameter.rallratio.std];
errorbar(x5,y5,std5/2,'ob','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',indbluemarkersize);  
%ylabel('Mean Rall Ratio','FontSize',labelfontsize,'FontWeight','b');


subplot(4,3,11); box on;
x6 = [analysis2.diameter.diameter];
y6 = [analysis2.bifurcation.diameter.daughterratio.mean];
std6 = [analysis2.bifurcation.diameter.daughterratio.std];
errorbar(x6,y6,std6/2,'ob','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',indbluemarkersize);  
%ylabel('Mean Daughter Ratio','FontSize',labelfontsize,'FontWeight','b');
xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');





subplot(4,3,3); box on;
x1 = [analysis3.diameter.diameter];
y1 = [analysis3.bifurcation.diameter.taperrate.mean];
std1 = [analysis3.bifurcation.diameter.taperrate.std];
errorbar(x1,y1,std1/2,'sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);  
hold on;
x2 = [analysis3.diameter.diameter];
y2 = [analysis3.termination.diameter.taperrate.mean];
std2 = [analysis3.termination.diameter.taperrate.std];
errorbar(x2,y2,std2/2,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
%ylabel('Mean Taper Rate (\mum/\mum)','FontSize',labelfontsize,'FontWeight','b');
title('Martinotti Cells','FontSize',titlefontsize);


subplot(4,3,6); box on;
x3 = [analysis3.diameter.diameter];
y3 = [analysis3.bifurcation.diameter.bifurcationprobability.volume];
semilogy(x3,y3,'sg','LineWidth',1.5,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',indgreenmarkersize);  
hold on;
x4 = [analysis3.diameter.diameter];
y4 = [analysis3.termination.diameter.taperrate.mean];
semilogy(x4,y4,'dr','LineWidth',1.5,'MarkerEdgeColor','r','MarkerFaceColor','r','MarkerSize',indredmarkersize);
%ylabel('Branch End Prob by Volume','FontSize',labelfontsize,'FontWeight','b');


subplot(4,3,9); box on;
x5 = [analysis3.diameter.diameter];
y5 = [analysis3.bifurcation.diameter.rallratio.mean];
std5 = [analysis3.bifurcation.diameter.rallratio.std];
errorbar(x5,y5,std5/2,'ob','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',indbluemarkersize);  
%ylabel('Mean Rall Ratio','FontSize',labelfontsize,'FontWeight','b');


subplot(4,3,12); box on;
x6 = [analysis3.diameter.diameter];
y6 = [analysis3.bifurcation.diameter.daughterratio.mean];
std6 = [analysis3.bifurcation.diameter.daughterratio.std];
errorbar(x6,y6,std6/2,'ob','LineWidth',1.5,'MarkerEdgeColor','b','MarkerFaceColor','b','MarkerSize',indbluemarkersize);  
%ylabel('Mean Daughter Ratio','FontSize',labelfontsize,'FontWeight','b');
xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');






    


 