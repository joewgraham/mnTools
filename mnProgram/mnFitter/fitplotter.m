function fitstructure = fitplotter(x,y,weight)

warning('off', 'MATLAB:divideByZero');
warning('off', 'MATLAB:Axes:NegativeDataInLogAxis');

if nargin == 2
	weight = ones(size(x));
end

fitplotteroption.linear = 'n';
fitplotteroption.exponential = 'n';
fitplotteroption.exponentialoffset = 'n';
fitplotteroption.power = 'n';
fitplotteroption.poweroffset = 'n';
fitplotteroption.sigmoid = 'n';



disp(' ');
disp('  ------------------------------------');
disp('   Fit Plotter Started');
disp('  ------------------------------------');
disp('    Fit Types:');
disp('      1. Linear');
disp('      2. Exponential');
disp('      3. Exponential w/ Offset');
disp('      4. Power');
disp('      5. Power w/ Offset');
disp('      6. Sigmoid');
disp('      7. All');
disp(' ');
disp('    Please enter the number of the');
fit = input('    fit type to be performed: ');
if isempty(fit) == 1
   disp(' ');
   disp('    You must enter a valid number to continue.');
   disp('    Please start over.');
   return;
elseif sum(ismember(fit,[1 2 3 4 5 6 7])) ~= length(fit)
   disp(' ');
   disp('    You must enter a valid number to continue.');
   disp('    Please start over.');
   return;
end
if fit == 7
   fit = [1 2 3 4 5 6];
end
if ismember(1,fit)
	fitplotteroption.linear = 'y';
end
if ismember(2,fit)
	fitplotteroption.exponential = 'y';
end
if ismember(3,fit)
	fitplotteroption.exponentialoffset = 'y';
end
if ismember(4,fit)
	fitplotteroption.power = 'y';
end
if ismember(5,fit)
	fitplotteroption.poweroffset = 'y';
end
if ismember(6,fit)
	fitplotteroption.sigmoid = 'y';
end


% disp('    Fit Types:');
% disp('      1. Unweighted');
% disp('      2. Weighted');
% disp('      3. Robust');
% disp('      4. Robust Weighted');
% disp('      5. All');
% disp(' ');
% disp('    Please enter the number of the');
% fittype = input('    fit method to be performed: ');
% if isempty(fittype) == 1
%    disp(' ');
%    disp('    You must enter a valid number to continue.');
%    disp('    Please start over.');
%    return;
% elseif sum(ismember(fittype,[1 2 3 4 5])) ~= length(fittype)
%    disp(' ');
%    disp('    You must enter a valid number to continue.');
%    disp('    Please start over.');
%    return;
% end
% if fittype == 5
%    fittype = [1 2 3 4];
% end
% if ismember(1,fittype)
% 	fitplotteroption.unweighted = 'y';
% end
% if ismember(2,fittype)
% 	fitplotteroption.weighted = 'y';
% end
% if ismember(3,fittype)
% 	fitplotteroption.robust = 'y';
% end
% if ismember(4,fittype)
% 	fitplotteroption.robustweighted = 'y';
% end

fitplotteroption.unweighted = 'y';
fitplotteroption.weighted = 'y';
fitplotteroption.robust = 'y';
fitplotteroption.robustweighted = 'y';


fits = {'linear','exponential','exponentialoffset','power','poweroffset','sigmoid'};
fitslabels = {'Linear','Exponential','Offset Exponential','Power','Offset Power','Sigmoid'};
fitsfilenames = {'1lin','2exp','3expoffset','4pow','5powoffset','6sig'};
fitstokeep = [false false false false false false];
if strcmp(fitplotteroption.linear,'y')
	fitstokeep(1) = true;
end
if strcmp(fitplotteroption.exponential,'y')
	fitstokeep(2) = true;
end
if strcmp(fitplotteroption.exponentialoffset,'y')
	fitstokeep(3) = true;
end
if strcmp(fitplotteroption.power,'y')
	fitstokeep(4) = true;
end
if strcmp(fitplotteroption.poweroffset,'y')
	fitstokeep(5) = true;
end
if strcmp(fitplotteroption.sigmoid,'y')
	fitstokeep(6) = true;
end
fits = fits(fitstokeep);
fitslabels = fitslabels(fitstokeep);
fitsfilenames = fitsfilenames(fitstokeep);
    
fittypes = {'unweighted','weighted','robust','robustweighted'};
fittypeslabels = {'Unweighted Fits','Weighted Fits','Robust Fits','Robust Weighted Fits'};
fitstyles = {'''-c'',''LineWidth'',6','''--y'',''LineWidth'',5','''-.m'',''LineWidth'',4',''':k'',''LineWidth'',3'};
fittypesfilenames = {'1uw','2wt','3rb','4rw'};
fittypestokeep = [false false false false];

if strcmp(fitplotteroption.unweighted,'y')
	fittypestokeep(1) = true;
end
if strcmp(fitplotteroption.weighted,'y')
	fittypestokeep(2) = true;
end
if strcmp(fitplotteroption.robust,'y')
	fittypestokeep(3) = true;
end
if strcmp(fitplotteroption.robustweighted,'y')
	fittypestokeep(4) = true;
end
fittypes = fittypes(fittypestokeep);
fittypeslabels = fittypeslabels(fittypestokeep);
fitstyles = fitstyles(fittypestokeep);
fittypesfilenames = fittypesfilenames(fittypestokeep);

legendtext(1) = {'Data'};
parameterlabels = char('         P_1: ','         P_2: ','         P_3: ','         P_4: ');  

currentdirectory = cd;
%cd ..
%cd('V:\fitplotter');
if exist(['fits ' datestr(now, 'yyyy-mm-dd_HH-MM')],'dir')==7
	cd(['fits ' datestr(now, 'yyyy-mm-dd_HH-MM')]);
else
	mkdir(datestr(now, 'yyyy-mm-dd_HH-MM'));
	cd(datestr(now, 'yyyy-mm-dd_HH-MM'));
end

for j = 1:length(fits)
	fit = fits{j};
	fitlabel = fitslabels{j};
				 
	figure; 
	plot(x,y,'bo','MarkerFaceColor','b');
	ylimits = ylim;
	title(char(' ',fitlabel,' '),'FontSize',12,'FontWeight','b');
	set(gca,'FontSize',6);
	hold on;

	for k = 1:length(fittypes)
		fittype = fittypes{k};
		fitstyle = fitstyles{k};
		fittypelabel = fittypeslabels{k};

		eval(['[parameter rmse] = ' fit 'fitter' fittype '(x,y,weight);']);
		eval(['fitstructure.' fit '.' fittype '.parameter = parameter;']);
		eval(['fitstructure.' fit '.' fittype '.rmse = rmse;']);
		
		[fitx,fity] = fitter_new(fit,parameter,x);
		eval(['plot(fitx,fity,' fitstyle ');']);
		
		ylim(ylimits);
		parameterlabel = parameterlabels(1:length(parameter),:);
		parametervalues = num2str(parameter','%.3e');
		parameterlegend = [parameterlabel parametervalues];
		rmselegend = sprintf('    rmse: %.3e',rmse(1));
		totallegend = char(' ',fittypelabel,' ',parameterlegend,rmselegend);
		legendtext(k+1) = {totallegend};
	end
		
	%plot(x,y,'bo','MarkerFaceColor','b');
	legend(legendtext,'Location','NorthEastOutside');
	
	filename = sprintf('Data_%s',fit);
	print('-djpeg',filename);
	set(gca,'YScale','log');
	filename = sprintf('Data_%s_logy',fit);
	print('-djpeg',filename);
	set(gca,'XScale','log');
	filename = sprintf('Data_%s_logy_logx',fit);
	print('-djpeg',filename);
    set(gca,'XScale','linear');
    set(gca,'YScale','linear');
end

cd(currentdirectory);

warning('on', 'MATLAB:divideByZero');
warning('on', 'MATLAB:Axes:NegativeDataInLogAxis');