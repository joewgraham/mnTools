function cableanalysisfigures(controlanalysis)
% Primary Dendrite Figures


figure;

%subplot(3,3,1);
box on; hold on;


[totaldata xvalues] = hist([controlanalysis.bifurcatingcable.taperrate.values controlanalysis.bifurcatingcable.taperrate.values]);
hist(-controlanalysis.bifurcatingcable.taperrate.values,xvalues);
hist(-controlanalysis.terminatingcable.taperrate.values,xvalues);
hist(-controlanalysis.cable.taperrate.values,xvalues);
%     xtick = get(gca,'xtick');
%     set(gca,'xticklabel', []);
h = findobj(gca,'Type','patch');
set(h(3),'FaceColor','g','EdgeColor','g','FaceAlpha',0.5,'EdgeAlpha',0.5);
set(h(2),'FaceColor','b','EdgeColor','b','FaceAlpha',0.5,'EdgeAlpha',0.5);
set(h(1),'FaceColor','r','EdgeColor','r','FaceAlpha',0.5,'EdgeAlpha',0.5);
hold off;




figure;

%subplot(3,3,1);
box on; hold on;


%centers = [-0.004 -0.0035 -0.003 -0.0025 -0.002 -0.0015 -0.001 -0.0005 0 0.0005 0.001 0.0015 0.002 0.0025 0.003 0.0035];
centers = -0.01:0.0005:0.04;
hist(-controlanalysis.bifurcatingcable.taperrate.values,centers);
hist(-controlanalysis.terminatingcable.taperrate.values,centers);
%     xtick = get(gca,'xtick');
%     set(gca,'xticklabel', []);
h = findobj(gca,'Type','patch');
set(h(2),'FaceColor','b','EdgeColor','b','FaceAlpha',0.5,'EdgeAlpha',0.5);
set(h(1),'FaceColor','r','EdgeColor','r','FaceAlpha',0.5,'EdgeAlpha',0.5);
hold off;