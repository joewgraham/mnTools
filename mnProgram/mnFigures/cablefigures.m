function cablefigures(controlanalysis,testanalysis)

titlefontsize = 14;
labelfontsize = 7;
axesfontsize  = 5;
insetfontsize = 5;

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


[controlbifdiameter,controlindex] = sort([controlanalysis.bifurcation.cable.proximaldiameter.values]);
controlbifpathlength = [controlanalysis.bifurcation.cable.proximalpathlength.values];
controlbifpathlength = controlbifpathlength(controlindex);
controlbifdegree = [controlanalysis.bifurcation.cable.degree.values];
controlbifdegree = controlbifdegree(controlindex);
controlbiftaperrate = [controlanalysis.bifurcation.cable.taperrate.values];
controlbiftaperrate = controlbiftaperrate(controlindex);
controlbiflength = [controlanalysis.bifurcation.cable.length.values];
controlbiflength = controlbiflength(controlindex);
controlbifsurfacearea = [controlanalysis.bifurcation.cable.surfacearea.values];
controlbifsurfacearea = controlbifsurfacearea(controlindex);
controlbifvolume = [controlanalysis.bifurcation.cable.volume.values];
controlbifvolume = controlbifvolume(controlindex);
controlbifrallratio = [controlanalysis.bifurcation.cable.rallratio.values];
controlbifrallratio = controlbifrallratio(controlindex);
controlbifdaughterratio = [controlanalysis.bifurcation.cable.daughterratio.values];
controlbifdaughterratio = controlbifdaughterratio(controlindex);
controlbifbranchorder = [controlanalysis.bifurcation.cable.branchorder.values];
controlbifbranchorder = controlbifbranchorder(controlindex);


[testbifdiameter,testindex] = sort([testanalysis.bifurcation.cable.proximaldiameter.values]);
testbifpathlength = [testanalysis.bifurcation.cable.proximalpathlength.values];
testbifpathlength = testbifpathlength(testindex);
testbifdegree = [testanalysis.bifurcation.cable.degree.values];
testbifdegree = testbifdegree(testindex);
testbiftaperrate = [testanalysis.bifurcation.cable.taperrate.values];
testbiftaperrate = testbiftaperrate(testindex);
testbiflength = [testanalysis.bifurcation.cable.length.values];
testbiflength = testbiflength(testindex);
testbifsurfacearea = [testanalysis.bifurcation.cable.surfacearea.values];
testbifsurfacearea = testbifsurfacearea(testindex);
testbifvolume = [testanalysis.bifurcation.cable.volume.values];
testbifvolume = testbifvolume(testindex);
testbifrallratio = [testanalysis.bifurcation.cable.rallratio.values];
testbifrallratio = testbifrallratio(testindex);
testbifdaughterratio = [testanalysis.bifurcation.cable.daughterratio.values];
testbifdaughterratio = testbifdaughterratio(testindex);
testbifbranchorder = [testanalysis.bifurcation.cable.branchorder.values];
testbifbranchorder = testbifbranchorder(testindex);


figure;
plot(controlbifdiameter,controlbiftaperrate,'gs','MarkerSize',5);
hold on;
plot(testbifdiameter,testbiftaperrate,'y.','MarkerSize',5);
plot(controlbifdiameter,controlbiftaperrate,'gs','MarkerSize',5);

legendhandle = gca;
xlabel('Proximal Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
ylabel('Taper Rate','FontSize',labelfontsize,'FontWeight','b');
set(gca,'FontSize',axesfontsize);
[ax,h3]=suplabel('Bifurcating Cable Taper Rate versus Proximal Diameter'  ,'t');
set(h3,'FontSize',titlefontsize);
legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
legend('boxoff');

filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'Cable_Taper_Diam_Bif');
print('-djpeg',filename);


figure;
plot(controlbifpathlength,controlbiftaperrate,'gs','MarkerSize',5);
hold on;
plot(testbifpathlength,testbiftaperrate,'y.','MarkerSize',5);
plot(controlbifpathlength,controlbiftaperrate,'gs','MarkerSize',5);

legendhandle = gca;
xlabel('Proximal Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
ylabel('Taper Rate','FontSize',labelfontsize,'FontWeight','b');
set(gca,'FontSize',axesfontsize);
[ax,h3]=suplabel('Bifurcating Cable Taper Rate versus Proximal Path Length'  ,'t');
set(h3,'FontSize',titlefontsize);
legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
legend('boxoff');

filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'Cable_Taper_Path_Bif');
print('-djpeg',filename);





figure;
plot(controlbifdiameter,controlbiflength,'gs','MarkerSize',5);
hold on;
plot(testbifdiameter,testbiflength,'y.','MarkerSize',5);
plot(controlbifdiameter,controlbiflength,'gs','MarkerSize',5);

legendhandle = gca;
xlabel('Proximal Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
ylabel('Length','FontSize',labelfontsize,'FontWeight','b');
set(gca,'FontSize',axesfontsize);
[ax,h3]=suplabel('Bifurcating Cable Length versus Proximal Diameter'  ,'t');
set(h3,'FontSize',titlefontsize);
legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
legend('boxoff');

filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'Cable_Length_Diam_Bif');
print('-djpeg',filename);


figure;
plot(controlbifpathlength,controlbiflength,'gs','MarkerSize',5);
hold on;
plot(testbifpathlength,testbiflength,'y.','MarkerSize',5);
plot(controlbifpathlength,controlbiflength,'gs','MarkerSize',5);

legendhandle = gca;
xlabel('Proximal Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
ylabel('Length','FontSize',labelfontsize,'FontWeight','b');
set(gca,'FontSize',axesfontsize);
[ax,h3]=suplabel('Bifurcating Cable Length versus Proximal Path Length'  ,'t');
set(h3,'FontSize',titlefontsize);
legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
legend('boxoff');

filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'Cable_Length_Path_Bif');
print('-djpeg',filename);





figure;
plot(controlbifdiameter,controlbifsurfacearea,'gs','MarkerSize',5);
hold on;
plot(testbifdiameter,testbifsurfacearea,'y.','MarkerSize',5);
plot(controlbifdiameter,controlbifsurfacearea,'gs','MarkerSize',5);

legendhandle = gca;
xlabel('Proximal Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
ylabel('Surface Area (\mum^2)','FontSize',labelfontsize,'FontWeight','b');
set(gca,'FontSize',axesfontsize);
[ax,h3]=suplabel('Bifurcating Cable Surface Area versus Proximal Diameter'  ,'t');
set(h3,'FontSize',titlefontsize);
legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
legend('boxoff');

filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'Cable_surfacearea_Diam_Bif');
print('-djpeg',filename);


figure;
plot(controlbifpathlength,controlbifsurfacearea,'gs','MarkerSize',5);
hold on;
plot(testbifpathlength,testbifsurfacearea,'y.','MarkerSize',5);
plot(controlbifpathlength,controlbifsurfacearea,'gs','MarkerSize',5);

legendhandle = gca;
xlabel('Proximal Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
ylabel('Surface Area (\mum^2)','FontSize',labelfontsize,'FontWeight','b');
set(gca,'FontSize',axesfontsize);
[ax,h3]=suplabel('Bifurcating Cable Surface Area versus Proximal Path Length'  ,'t');
set(h3,'FontSize',titlefontsize);
legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
legend('boxoff');

filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'Cable_surfacearea_Path_Bif');
print('-djpeg',filename);





figure;
plot(controlbifdiameter,controlbifvolume,'gs','MarkerSize',5);
hold on;
plot(testbifdiameter,testbifvolume,'y.','MarkerSize',5);
plot(controlbifdiameter,controlbifvolume,'gs','MarkerSize',5);

legendhandle = gca;
xlabel('Proximal Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
ylabel('Volume (\mum^3)','FontSize',labelfontsize,'FontWeight','b');
set(gca,'FontSize',axesfontsize);
[ax,h3]=suplabel('Bifurcating Cable Volume versus Proximal Diameter'  ,'t');
set(h3,'FontSize',titlefontsize);
legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
legend('boxoff');

filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'Cable_volume_Diam_Bif');
print('-djpeg',filename);


figure;
plot(controlbifpathlength,controlbifvolume,'gs','MarkerSize',5);
hold on;
plot(testbifpathlength,testbifvolume,'y.','MarkerSize',5);
plot(controlbifpathlength,controlbifvolume,'gs','MarkerSize',5);

legendhandle = gca;
xlabel('Proximal Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
ylabel('Volume (\mum^3)','FontSize',labelfontsize,'FontWeight','b');
set(gca,'FontSize',axesfontsize);
[ax,h3]=suplabel('Bifurcating Cable Volume versus Proximal Path Length'  ,'t');
set(h3,'FontSize',titlefontsize);
legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
legend('boxoff');

filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'Cable_volume_Path_Bif');
print('-djpeg',filename);






figure;
plot(controlbifdiameter,controlbifbranchorder,'gs','MarkerSize',5);
hold on;
plot(testbifdiameter,testbifbranchorder,'y.','MarkerSize',5);
plot(controlbifdiameter,controlbifbranchorder,'gs','MarkerSize',5);

legendhandle = gca;
xlabel('Proximal Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
ylabel('Branch Order','FontSize',labelfontsize,'FontWeight','b');
set(gca,'FontSize',axesfontsize);
[ax,h3]=suplabel('Bifurcating Cable Branch Order versus Proximal Diameter'  ,'t');
set(h3,'FontSize',titlefontsize);
legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
legend('boxoff');

filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'Cable_branchorder_Diam_Bif');
print('-djpeg',filename);


figure;
plot(controlbifpathlength,controlbifbranchorder,'gs','MarkerSize',5);
hold on;
plot(testbifpathlength,testbifbranchorder,'y.','MarkerSize',5);
plot(controlbifpathlength,controlbifbranchorder,'gs','MarkerSize',5);

legendhandle = gca;
xlabel('Proximal Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
ylabel('Branch Order','FontSize',labelfontsize,'FontWeight','b');
set(gca,'FontSize',axesfontsize);
[ax,h3]=suplabel('Bifurcating Cable Branch Order versus Proximal Path Length'  ,'t');
set(h3,'FontSize',titlefontsize);
legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
legend('boxoff');

filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'Cable_branchorder_Path_Bif');
print('-djpeg',filename);





figure;
plot(controlbifvolume,controlbifrallratio,'gs','MarkerSize',5);
hold on;
plot(testbifvolume,testbifrallratio,'y.','MarkerSize',5);
plot(controlbifvolume,controlbifrallratio,'gs','MarkerSize',5);

legendhandle = gca;
xlabel('Volume (\mum^3)','FontSize',labelfontsize,'FontWeight','b');
ylabel('Rall Ratio','FontSize',labelfontsize,'FontWeight','b');
set(gca,'FontSize',axesfontsize);
[ax,h3]=suplabel('Bifurcating Cable Rall Ratio versus Volume'  ,'t');
set(h3,'FontSize',titlefontsize);
legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
legend('boxoff');

filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'Cable_rallratio_vol_Bif');
print('-djpeg',filename);










[controltermdiameter,controlindex] = sort([controlanalysis.termination.cable.proximaldiameter.values]);
controltermpathlength = [controlanalysis.termination.cable.proximalpathlength.values];
controltermpathlength = controltermpathlength(controlindex);
controltermtaperrate = [controlanalysis.termination.cable.taperrate.values];
controltermtaperrate = controltermtaperrate(controlindex);
controltermlength = [controlanalysis.termination.cable.length.values];
controltermlength = controltermlength(controlindex);
controltermsurfacearea = [controlanalysis.termination.cable.surfacearea.values];
controltermsurfacearea = controltermsurfacearea(controlindex);
controltermvolume = [controlanalysis.termination.cable.volume.values];
controltermvolume = controltermvolume(controlindex);
controltermbranchorder = [controlanalysis.termination.cable.branchorder.values];
controltermbranchorder = controltermbranchorder(controlindex);


[testtermdiameter,testindex] = sort([testanalysis.termination.cable.proximaldiameter.values]);
testtermpathlength = [testanalysis.termination.cable.proximalpathlength.values];
testtermpathlength = testtermpathlength(testindex);
testtermtaperrate = [testanalysis.termination.cable.taperrate.values];
testtermtaperrate = testtermtaperrate(testindex);
testtermlength = [testanalysis.termination.cable.length.values];
testtermlength = testtermlength(testindex);
testtermsurfacearea = [testanalysis.termination.cable.surfacearea.values];
testtermsurfacearea = testtermsurfacearea(testindex);
testtermvolume = [testanalysis.termination.cable.volume.values];
testtermvolume = testtermvolume(testindex);
testtermbranchorder = [testanalysis.termination.cable.branchorder.values];
testtermbranchorder = testtermbranchorder(testindex);


figure;
plot(controltermdiameter,controltermtaperrate,'rd','MarkerSize',5);
hold on;
plot(testtermdiameter,testtermtaperrate,'m.','MarkerSize',5);
plot(controltermdiameter,controltermtaperrate,'rd','MarkerSize',5);

legendhandle = gca;
xlabel('Proximal Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
ylabel('Taper Rate','FontSize',labelfontsize,'FontWeight','b');
set(gca,'FontSize',axesfontsize);
[ax,h3]=suplabel('Terminating Cable Taper Rate versus Proximal Diameter'  ,'t');
set(h3,'FontSize',titlefontsize);
legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
legend('boxoff');

filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'Cable_Taper_Diam_term');
print('-djpeg',filename);


figure;
plot(controltermpathlength,controltermtaperrate,'rd','MarkerSize',5);
hold on;
plot(testtermpathlength,testtermtaperrate,'m.','MarkerSize',5);
plot(controltermpathlength,controltermtaperrate,'rd','MarkerSize',5);

legendhandle = gca;
xlabel('Proximal Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
ylabel('Taper Rate','FontSize',labelfontsize,'FontWeight','b');
set(gca,'FontSize',axesfontsize);
[ax,h3]=suplabel('Terminating Cable Taper Rate versus Proximal Path Length'  ,'t');
set(h3,'FontSize',titlefontsize);
legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
legend('boxoff');

filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'Cable_Taper_Path_term');
print('-djpeg',filename);





figure;
plot(controltermdiameter,controltermlength,'rd','MarkerSize',5);
hold on;
plot(testtermdiameter,testtermlength,'m.','MarkerSize',5);
plot(controltermdiameter,controltermlength,'rd','MarkerSize',5);

legendhandle = gca;
xlabel('Proximal Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
ylabel('Length','FontSize',labelfontsize,'FontWeight','b');
set(gca,'FontSize',axesfontsize);
[ax,h3]=suplabel('Terminating Cable Length versus Proximal Diameter'  ,'t');
set(h3,'FontSize',titlefontsize);
legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
legend('boxoff');

filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'Cable_Length_Diam_term');
print('-djpeg',filename);


figure;
plot(controltermpathlength,controltermlength,'rd','MarkerSize',5);
hold on;
plot(testtermpathlength,testtermlength,'m.','MarkerSize',5);
plot(controltermpathlength,controltermlength,'rd','MarkerSize',5);

legendhandle = gca;
xlabel('Proximal Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
ylabel('Length','FontSize',labelfontsize,'FontWeight','b');
set(gca,'FontSize',axesfontsize);
[ax,h3]=suplabel('Terminating Cable Length versus Proximal Path Length'  ,'t');
set(h3,'FontSize',titlefontsize);
legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
legend('boxoff');

filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'Cable_Length_Path_term');
print('-djpeg',filename);





figure;
plot(controltermdiameter,controltermsurfacearea,'rd','MarkerSize',5);
hold on;
plot(testtermdiameter,testtermsurfacearea,'m.','MarkerSize',5);
plot(controltermdiameter,controltermsurfacearea,'rd','MarkerSize',5);

legendhandle = gca;
xlabel('Proximal Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
ylabel('Surface Area (\mum^2)','FontSize',labelfontsize,'FontWeight','b');
set(gca,'FontSize',axesfontsize);
[ax,h3]=suplabel('Terminating Cable Surface Area versus Proximal Diameter'  ,'t');
set(h3,'FontSize',titlefontsize);
legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
legend('boxoff');

filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'Cable_surfacearea_Diam_term');
print('-djpeg',filename);


figure;
plot(controltermpathlength,controltermsurfacearea,'rd','MarkerSize',5);
hold on;
plot(testtermpathlength,testtermsurfacearea,'m.','MarkerSize',5);
plot(controltermpathlength,controltermsurfacearea,'rd','MarkerSize',5);

legendhandle = gca;
xlabel('Proximal Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
ylabel('Surface Area (\mum)','FontSize',labelfontsize,'FontWeight','b');
set(gca,'FontSize',axesfontsize);
[ax,h3]=suplabel('Terminating Cable Surface Area versus Proximal Path Length'  ,'t');
set(h3,'FontSize',titlefontsize);
legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
legend('boxoff');

filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'Cable_surfacearea_Path_term');
print('-djpeg',filename);





figure;
plot(controltermdiameter,controltermvolume,'rd','MarkerSize',5);
hold on;
plot(testtermdiameter,testtermvolume,'m.','MarkerSize',5);
plot(controltermdiameter,controltermvolume,'rd','MarkerSize',5);

legendhandle = gca;
xlabel('Proximal Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
ylabel('Volume (\mum^3)','FontSize',labelfontsize,'FontWeight','b');
set(gca,'FontSize',axesfontsize);
[ax,h3]=suplabel('Terminating Cable Volume versus Proximal Diameter'  ,'t');
set(h3,'FontSize',titlefontsize);
legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
legend('boxoff');

filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'Cable_volume_Diam_term');
print('-djpeg',filename);


figure;
plot(controltermpathlength,controltermvolume,'rd','MarkerSize',5);
hold on;
plot(testtermpathlength,testtermvolume,'m.','MarkerSize',5);
plot(controltermpathlength,controltermvolume,'rd','MarkerSize',5);

legendhandle = gca;
xlabel('Proximal Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
ylabel('Volume (\mum^3)','FontSize',labelfontsize,'FontWeight','b');
set(gca,'FontSize',axesfontsize);
[ax,h3]=suplabel('Terminating Cable volume versus Proximal Path Length'  ,'t');
set(h3,'FontSize',titlefontsize);
legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
legend('boxoff');

filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'Cable_volume_Path_term');
print('-djpeg',filename);






figure;
plot(controltermdiameter,controltermbranchorder,'rd','MarkerSize',5);
hold on;
plot(testtermdiameter,testtermbranchorder,'m.','MarkerSize',5);
plot(controltermdiameter,controltermbranchorder,'rd','MarkerSize',5);

legendhandle = gca;
xlabel('Proximal Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
ylabel('Branch Order','FontSize',labelfontsize,'FontWeight','b');
set(gca,'FontSize',axesfontsize);
[ax,h3]=suplabel('Terminating Cable Branch Order versus Proximal Diameter'  ,'t');
set(h3,'FontSize',titlefontsize);
legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
legend('boxoff');

filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'Cable_branchorder_Diam_term');
print('-djpeg',filename);


figure;
plot(controltermpathlength,controltermbranchorder,'rd','MarkerSize',5);
hold on;
plot(testtermpathlength,testtermbranchorder,'m.','MarkerSize',5);
plot(controltermpathlength,controltermbranchorder,'rd','MarkerSize',5);

legendhandle = gca;
xlabel('Proximal Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
ylabel('Branch Order','FontSize',labelfontsize,'FontWeight','b');
set(gca,'FontSize',axesfontsize);
[ax,h3]=suplabel('Terminating Cable Branch Order versus Proximal Path Length'  ,'t');
set(h3,'FontSize',titlefontsize);
legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
legend('boxoff');

filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'Cable_branchorder_Path_term');
print('-djpeg',filename);


