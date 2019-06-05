function piecetaperratefigures(controlanalysis,testanalysis)

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




[controlbifdiameter,controlindex] = sort([controlanalysis.bifurcation.piece.proximaldiameter]);
controlbifpathlength = [controlanalysis.bifurcation.piece.proximalpathlength];
controlbifpathlength = controlbifpathlength(controlindex);
controlbiftaperrate = [controlanalysis.bifurcation.piece.taperrate];
controlbiftaperrate = controlbiftaperrate(controlindex);



[testbifdiameter,testindex] = sort([testanalysis.bifurcation.piece.proximaldiameter]);
testbifpathlength = [testanalysis.bifurcation.piece.proximalpathlength];
testbifpathlength = testbifpathlength(testindex);
testbiftaperrate = [testanalysis.bifurcation.piece.taperrate];
testbiftaperrate = testbiftaperrate(testindex);


figure;
plot(controlbifdiameter,controlbiftaperrate,'gs','MarkerSize',5);
hold on;
plot(testbifdiameter,testbiftaperrate,'y.','MarkerSize',5);
plot(controlbifdiameter,controlbiftaperrate,'gs','MarkerSize',5);

legendhandle = gca;
xlabel('Proximal Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
ylabel('Taper Rate','FontSize',labelfontsize,'FontWeight','b');
set(gca,'FontSize',axesfontsize);
[ax,h3]=suplabel('Bifurcation Piece Taper Rate versus Proximal Diameter'  ,'t');
set(h3,'FontSize',titlefontsize);
legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
legend('boxoff');

filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'Piece_Taper_Diam_Bif');
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
[ax,h3]=suplabel('Bifurcation Piece Taper Rate versus Proximal Path Length'  ,'t');
set(h3,'FontSize',titlefontsize);
legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
legend('boxoff');

filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'Piece_Taper_Path_Bif');
print('-djpeg',filename);




[controltermdiameter,controlindex] = sort([controlanalysis.termination.piece.proximaldiameter]);
controltermpathlength = [controlanalysis.termination.piece.proximalpathlength];
controltermpathlength = controltermpathlength(controlindex);
controltermtaperrate = [controlanalysis.termination.piece.taperrate];
controltermtaperrate = controltermtaperrate(controlindex);

[testtermdiameter,testindex] = sort([testanalysis.termination.piece.proximaldiameter]);
testtermpathlength = [testanalysis.termination.piece.proximalpathlength];
testtermpathlength = testtermpathlength(testindex);
testtermtaperrate = [testanalysis.termination.piece.taperrate];
testtermtaperrate = testtermtaperrate(testindex);


figure;
plot(controltermdiameter,controltermtaperrate,'rd','MarkerSize',5);
hold on;
plot(testtermdiameter,testtermtaperrate,'m.','MarkerSize',5);
plot(controltermdiameter,controltermtaperrate,'rd','MarkerSize',5);

legendhandle = gca;
xlabel('Proximal Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
ylabel('Taper Rate','FontSize',labelfontsize,'FontWeight','b');
set(gca,'FontSize',axesfontsize);
[ax,h3]=suplabel('Termination Piece Taper Rate versus Proximal Diameter'  ,'t');
set(h3,'FontSize',titlefontsize);
legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
legend('boxoff');

filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'Piece_Taper_Diam_Term');
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
[ax,h3]=suplabel('Termination Piece Taper Rate versus Proximal Path Length'  ,'t');
set(h3,'FontSize',titlefontsize);
legend(legendhandle,controlanalysis.inputfilename,testanalysis.inputfilename,'Location','NorthEast');
legend('boxoff');

filename = sprintf('%s_%s_%s',controlanalysis.inputfilename,testanalysis.inputfilename,'Piece_Taper_Path_Term');
print('-djpeg',filename);


