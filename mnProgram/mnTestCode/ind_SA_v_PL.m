
for i = 1:length(L5TTPCtA_data.individual)
    for j = 1:length(L5TTPCtA_data.individual(i).apical.bifurcation.pathlengthbins)
        pathlengthA(i,j)  = L5TTPCtA_analysis.apical.pathlength.pathlength(j);
        lengthA(i,j)      = L5TTPCtA_data.individual(i).apical.bifurcation.pathlengthbins(j).length;
        surfaceareaA(i,j) = L5TTPCtA_data.individual(i).apical.bifurcation.pathlengthbins(j).surfacearea;
        volumeA(i,j)      = L5TTPCtA_data.individual(i).apical.bifurcation.pathlengthbins(j).volume;
    end
end

for i = 1:length(L5TTPCtB_data.individual)
    for j = 1:length(L5TTPCtB_data.individual(i).apical.bifurcation.pathlengthbins)
        pathlengthB(i,j)  = L5TTPCtB_analysis.apical.pathlength.pathlength(j);
        lengthB(i,j)      = L5TTPCtB_data.individual(i).apical.bifurcation.pathlengthbins(j).length;
        surfaceareaB(i,j) = L5TTPCtB_data.individual(i).apical.bifurcation.pathlengthbins(j).surfacearea;
        volumeB(i,j)      = L5TTPCtB_data.individual(i).apical.bifurcation.pathlengthbins(j).volume;
    end
end

%------------------------

lengthA(lengthA == 0) = NaN;
lengthB(lengthB == 0) = NaN;

figure;
hold on;

hA = plot(pathlengthA',lengthA','-b','LineWidth',1.0);
hB = plot(pathlengthB',lengthB','-r','LineWidth',1.0);

errorbar([L5TTPCtA_analysis.apical.bifurcation.pathlength.pathlength],[L5TTPCtA_analysis.apical.bifurcation.pathlength.length.mean],[L5TTPCtA_analysis.apical.bifurcation.pathlength.length.std],zeros(size([L5TTPCtA_analysis.apical.bifurcation.pathlength.length.std])),'ko','MarkerFaceColor','b','MarkerSize',10,'LineWidth',1.5);
errorbar([L5TTPCtB_analysis.apical.bifurcation.pathlength.pathlength],[L5TTPCtB_analysis.apical.bifurcation.pathlength.length.mean],zeros(size([L5TTPCtB_analysis.apical.bifurcation.pathlength.length.std])),[L5TTPCtB_analysis.apical.bifurcation.pathlength.length.std],'ko','MarkerFaceColor','r','MarkerSize',10,'LineWidth',1.5);

legend([hA(1) hB(1)],'Type A','Type B');
xlabel('Path Length from the Soma (\mum)','FontSize',14);
ylabel('Length (\mum)','FontSize',14);
title('L5TTPC Apical Dendrites: Length vs Path Length','FontSize',18);
set(gca,'FontSize',10);

print('-djpeg','L5TTPC AvB LvPL');


%------------------------


surfaceareaA(surfaceareaA == 0) = NaN;
surfaceareaB(surfaceareaB == 0) = NaN;

figure;
hold on;

hA = plot(pathlengthA',surfaceareaA','-b','LineWidth',1.0);
hB = plot(pathlengthB',surfaceareaB','-r','LineWidth',1.0);

errorbar([L5TTPCtA_analysis.apical.bifurcation.pathlength.pathlength],[L5TTPCtA_analysis.apical.bifurcation.pathlength.surfacearea.mean],[L5TTPCtA_analysis.apical.bifurcation.pathlength.surfacearea.std],zeros(size([L5TTPCtA_analysis.apical.bifurcation.pathlength.surfacearea.std])),'ko','MarkerFaceColor','b','MarkerSize',10,'LineWidth',1.5);
errorbar([L5TTPCtB_analysis.apical.bifurcation.pathlength.pathlength],[L5TTPCtB_analysis.apical.bifurcation.pathlength.surfacearea.mean],zeros(size([L5TTPCtB_analysis.apical.bifurcation.pathlength.surfacearea.std])),[L5TTPCtB_analysis.apical.bifurcation.pathlength.surfacearea.std],'ko','MarkerFaceColor','r','MarkerSize',10,'LineWidth',1.5);

legend([hA(1) hB(1)],'Type A','Type B');
xlabel('Path Length from the Soma (\mum)','FontSize',14);
ylabel('Surface Area (\mum^2)','FontSize',14);
title('L5TTPC Apical Dendrites: Surface Area vs Path Length','FontSize',18);
set(gca,'FontSize',10);

print('-djpeg','L5TTPC AvB SAvPL');

%--------------------------

volumeA(volumeA == 0) = NaN;
volumeB(volumeB == 0) = NaN;

figure;
hold on;

hA = plot(pathlengthA',volumeA','-b','LineWidth',1.0);
hB = plot(pathlengthB',volumeB','-r','LineWidth',1.0);

errorbar([L5TTPCtA_analysis.apical.bifurcation.pathlength.pathlength],[L5TTPCtA_analysis.apical.bifurcation.pathlength.volume.mean],[L5TTPCtA_analysis.apical.bifurcation.pathlength.volume.std],zeros(size([L5TTPCtA_analysis.apical.bifurcation.pathlength.volume.std])),'ko','MarkerFaceColor','b','MarkerSize',10,'LineWidth',1.5);
errorbar([L5TTPCtB_analysis.apical.bifurcation.pathlength.pathlength],[L5TTPCtB_analysis.apical.bifurcation.pathlength.volume.mean],zeros(size([L5TTPCtB_analysis.apical.bifurcation.pathlength.volume.std])),[L5TTPCtB_analysis.apical.bifurcation.pathlength.volume.std],'ko','MarkerFaceColor','r','MarkerSize',10,'LineWidth',1.5);

legend([hA(1) hB(1)],'Type A','Type B');
xlabel('Path Length from the Soma (\mum)','FontSize',14);
ylabel('Volume (\mum^3)','FontSize',14);
title('L5TTPC Apical Dendrites: Volume vs Path Length','FontSize',18);
set(gca,'FontSize',10);

print('-djpeg','L5TTPC AvB VvPL');
