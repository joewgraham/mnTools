function [parameters,rmse,fitdata,unweightedparameters,unweightedrmse,unweightedfitdata,weightedparameters,weightedrmse,weightedfitdata,robustunweightedparameters,robustunweightedrmse,robustunweightedfitdata,robustweightedparameters,robustweightedrmse,robustweightedfitdata] = doublefitter(doublefit)

measuredata = doublefit.measuredata;
weightdata = doublefit.weightdata;
firstbindata = doublefit.firstbin.data;
secondbindata = doublefit.secondbin.data;

clear parameters finalparameter finalparameterstring;

%Test
maxlength = 0;
for i = 1:length(doublefit.parameter)
	if length(doublefit.parameter(i).parameter) > maxlength
		maxlength = length(doublefit.parameter(i).parameter);
	end
end	
for i = 1:length(doublefit.parameter)
	for j = 1:maxlength
		if j <= length(doublefit.parameter(i).parameter)
			parameters(i,j) = doublefit.parameter(i).parameter(j);
		else
			parameters(i,j) = NaN;
		end
	end
%End Test

% for i = 1:length(doublefit.parameter)
	% for j = 1:length(doublefit.parameter(i).parameter)
		% parameters(i,j) = doublefit.parameter(i).parameter(j);
	% end
	if strcmp(doublefit.parameter(i).fit,'linear')
		finalparameter(i) = {parameters(i,1) * secondbindata + parameters(i,2)};
		finalparameterstring(i) = {['(parameters(' num2str(i) ',1) * inputdata(:,:,2) + parameters(' num2str(i) ',2))']};
	elseif strcmp(doublefit.parameter(i).fit,'exponential')
		finalparameter(i) = {parameters(i,1) * exp(parameters(i,2) * secondbindata)};
		finalparameterstring(i) = {['(parameters(' num2str(i) ',1) * exp(inputdata(:,:,2) .* parameters(' num2str(i) ',2)))']};
	elseif strcmp(doublefit.parameter(i).fit,'exponentialoffset')
		finalparameter(i) = {parameters(i,3) + parameters(i,1) * exp(parameters(i,2) * secondbindata)};
		finalparameterstring(i) = {['(parameters(' num2str(i) ',1) * exp(inputdata(:,:,2) .* parameters(' num2str(i) ',2)))']};
	elseif strcmp(doublefit.parameter(i).fit,'power')
		finalparameter(i) = {parameters(i,1) * secondbindata .^ parameters(i,2)};
		finalparameterstring(i) = {['(parameters(' num2str(i) ',1) * inputdata(:,:,2) .^ parameters(' num2str(i) ',2))']};
	elseif strcmp(doublefit.parameter(i).fit,'poweroffset')
		finalparameter(i) = {parameters(i,3) + parameters(i,1) * secondbindata .^ parameters(i,2)};
		finalparameterstring(i) = {['(parameters(' num2str(i) ',1) * inputdata(:,:,2) .^ parameters(' num2str(i) ',2))']};
	elseif strcmp(doublefit.parameter(i).fit,'sigmoid')
		finalparameter(i) = {parameters(i,1) - parameters(i,2) * (log(( parameters(i,3) ./ (secondbindata - parameters(i,4))) - 1))};
		finalparameterstring(i) = {['parameters(' num2str(i) ',1) - parameters(' num2str(i) ',2) * (log((parameters(' num2str(i) ',3) ./ (inputdata(:,:,2) - parameters(' num2str(i) ',4))) - 1))']};
	else
		disp('Error in doublefitter.m');
		keyboard;
	end
end

if strcmp(doublefit.firstbin.fit,'linear')
	fitdata = finalparameter{1} .* firstbindata + finalparameter{2};
	unweightedfitdatastring = ['sqrt(nanmean(reshape(((outputdata -(' finalparameterstring{1} ' .* inputdata(:,:,1) + ' finalparameterstring{2} ' )).^2),prod(size(outputdata)),1)))'];
	weightedfitdatastring = ['sqrt(nanmean(reshape(weightdata.*((outputdata -(' finalparameterstring{1} ' .* inputdata(:,:,1) + ' finalparameterstring{2} ' )).^2),prod(size(outputdata)),1)))'];
	robustunweightedfitdatastring = ['sqrt(nanmean(reshape(abs(outputdata -(' finalparameterstring{1} ' .* inputdata(:,:,1) + ' finalparameterstring{2} ' )),prod(size(outputdata)),1)))'];
	robustweightedfitdatastring = ['sqrt(nanmean(reshape(weightdata.*abs(outputdata -(' finalparameterstring{1} ' .* inputdata(:,:,1) + ' finalparameterstring{2} ' )),prod(size(outputdata)),1)))'];
elseif strcmp(doublefit.firstbin.fit,'exponential')
	fitdata = finalparameter{1} .* exp(finalparameter{2} .* firstbindata);
	unweightedfitdatastring = ['sqrt(nanmean(reshape(((outputdata -(' finalparameterstring{1} ' .* exp( ' finalparameterstring{2} ' .* inputdata(:,:,1) ))).^2),prod(size(outputdata)),1)))'];
	weightedfitdatastring = ['sqrt(nanmean(reshape(weightdata.*((outputdata -(' finalparameterstring{1} ' .* exp( ' finalparameterstring{2} ' .* inputdata(:,:,1) ))).^2),prod(size(outputdata)),1)))'];
	robustunweightedfitdatastring = ['sqrt(nanmean(reshape((abs(outputdata -(' finalparameterstring{1} ' .* exp( ' finalparameterstring{2} ' .* inputdata(:,:,1) )))),prod(size(outputdata)),1)))'];
	robustweightedfitdatastring = ['sqrt(nanmean(reshape(weightdata.*abs((outputdata -(' finalparameterstring{1} ' .* exp( ' finalparameterstring{2} ' .* inputdata(:,:,1) )))),prod(size(outputdata)),1)))'];
elseif strcmp(doublefit.firstbin.fit,'exponentialoffset')
	fitdata = finalparameter{3} + finalparameter{1} .* exp(finalparameter{2} .* firstbindata);
	unweightedfitdatastring = ['sqrt(nanmean(reshape(((outputdata -(' finalparameterstring{3} '+' finalparameterstring{1} ' .* exp( ' finalparameterstring{2} ' .* inputdata(:,:,1) ))).^2),prod(size(outputdata)),1)))'];
	weightedfitdatastring = ['sqrt(nanmean(reshape(weightdata.*((outputdata -(' finalparameterstring{3} '+' finalparameterstring{1} ' .* exp( ' finalparameterstring{2} ' .* inputdata(:,:,1) ))).^2),prod(size(outputdata)),1)))'];
	robustunweightedfitdatastring = ['sqrt(nanmean(reshape((abs(outputdata -(' finalparameterstring{3} '+' finalparameterstring{1} ' .* exp( ' finalparameterstring{2} ' .* inputdata(:,:,1) )))),prod(size(outputdata)),1)))'];
	robustweightedfitdatastring = ['sqrt(nanmean(reshape(weightdata.*(abs(outputdata -(' finalparameterstring{3} '+' finalparameterstring{1} ' .* exp( ' finalparameterstring{2} ' .* inputdata(:,:,1) )))),prod(size(outputdata)),1)))'];
elseif strcmp(doublefit.firstbin.fit,'power')
	fitdata = finalparameter{1} .* firstbindata .^ finalparameter{2};
	unweightedfitdatastring = ['sqrt(nanmean(reshape(((outputdata -(' finalparameterstring{1} ' .* inputdata(:,:,1) .^ ( ' finalparameterstring{2} ' ))).^2),prod(size(outputdata)),1)))'];
	weightedfitdatastring = ['sqrt(nanmean(reshape(weightdata.*((outputdata -(' finalparameterstring{1} ' .* inputdata(:,:,1) .^ ( ' finalparameterstring{2} ' ))).^2),prod(size(outputdata)),1)))'];
	robustunweightedfitdatastring = ['sqrt(nanmean(reshape((abs(outputdata -(' finalparameterstring{1} ' .* inputdata(:,:,1) .^ ( ' finalparameterstring{2} ' )))),prod(size(outputdata)),1)))'];
	robustweightedfitdatastring = ['sqrt(nanmean(reshape(weightdata.*(abs(outputdata -(' finalparameterstring{1} ' .* inputdata(:,:,1) .^ ( ' finalparameterstring{2} ' )))),prod(size(outputdata)),1)))'];
elseif strcmp(doublefit.firstbin.fit,'poweroffset')
	fitdata = finalparameter{3} + finalparameter{1} .* firstbindata .^ finalparameter{2};
	unweightedfitdatastring = ['sqrt(nanmean(reshape(((outputdata -(' finalparameterstring{3} '+' finalparameterstring{1} ' .* inputdata(:,:,1) .^ ( ' finalparameterstring{2} ' ))).^2),prod(size(outputdata)),1)))'];
	weightedfitdatastring = ['sqrt(nanmean(reshape(weightdata.*((outputdata -(' finalparameterstring{3} '+' finalparameterstring{1} ' .* inputdata(:,:,1) .^ ( ' finalparameterstring{2} ' ))).^2),prod(size(outputdata)),1)))'];
	robustunweightedfitdatastring = ['sqrt(nanmean(reshape((abs(outputdata -(' finalparameterstring{3} '+' finalparameterstring{1} ' .* inputdata(:,:,1) .^ ( ' finalparameterstring{2} ' )))),prod(size(outputdata)),1)))'];
	robustweightedfitdatastring = ['sqrt(nanmean(reshape(weightdata.*(abs(outputdata -(' finalparameterstring{3} '+' finalparameterstring{1} ' .* inputdata(:,:,1) .^ ( ' finalparameterstring{2} ' )))),prod(size(outputdata)),1)))'];
elseif strcmp(doublefit.firstbin.fit,'sigmoid')
	fitdata = finalparameter{1} - finalparameter{2} .* (log(( finalparameter{3}/(firstbindata - finalparameter{4}) )-1));
	unweightedfitdatastring = ['sqrt(nanmean(reshape(((outputdata -(' finalparameterstring{1} ' - ' finalparameterstring{2} ' .* (log(( ' finalparameterstring{3} ' ./ (inputdata(:,:,1) - ' finalparameterstring{4} ') )-1))  ))).^2,prod(size(outputdata)),1)))'];
	weightedfitdatastring = ['sqrt(nanmean(reshape(weightdata.*((outputdata -(' finalparameterstring{1} ' - ' finalparameterstring{2} ' .* (log(( ' finalparameterstring{3} ' ./ (inputdata(:,:,1) - ' finalparameterstring{4} ') )-1))  ))).^2,prod(size(outputdata)),1)))'];
	robustunweightedfitdatastring = ['sqrt(nanmean(reshape((abs(outputdata -(' finalparameterstring{1} ' - ' finalparameterstring{2} ' .* (log(( ' finalparameterstring{3} ' ./ (inputdata(:,:,1) - ' finalparameterstring{4} ') )-1))  ))),prod(size(outputdata)),1)))'];
	robustweightedfitdatastring = ['sqrt(nanmean(reshape(weightdata.*(abs(outputdata -(' finalparameterstring{1} ' - ' finalparameterstring{2} ' .* (log(( ' finalparameterstring{3} ' ./ (inputdata(:,:,1) - ' finalparameterstring{4} ') )-1))  ))),prod(size(outputdata)),1)))'];
else
	disp('  Error in doublefit.m');
	keyboard;
end

rmsematrix = (fitdata - measuredata).^2;
rmse = (sum(rmsematrix(~isnan(rmsematrix)))) / (sum(sum(~isnan(rmsematrix))));


% Start Unweighted Section
initialparameters = parameters;
inputdata(:,:,1)=firstbindata(:,:);
inputdata(:,:,2)=secondbindata(:,:);
outputdata = measuredata;


disp('         Unweighted Fit.');
unweightedrmsefunction = inline(unweightedfitdatastring,'inputdata','outputdata','weightdata','parameters');
unweightedparameters = fminsearch(@(parameters) unweightedrmsefunction(inputdata,outputdata,weightdata,parameters) , initialparameters , optimset('MaxFunEvals',1000));

clear finalunweightedparameter;
for i = 1:length(doublefit.parameter)
	for j = 1:length(doublefit.parameter(i).parameter)
		unweightedparameters(i,j) = unweightedparameters(i,j);
	end
	if strcmp(doublefit.parameter(i).fit,'linear')
		finalunweightedparameter(i) = {unweightedparameters(i,1) * secondbindata + unweightedparameters(i,2)};
	elseif strcmp(doublefit.parameter(i).fit,'exponential')
		finalunweightedparameter(i) = {unweightedparameters(i,1) * exp(unweightedparameters(i,2) * secondbindata)};
	elseif strcmp(doublefit.parameter(i).fit,'exponentialoffset')
		finalunweightedparameter(i) = {unweightedparameters(i,3) + unweightedparameters(i,1) * exp(unweightedparameters(i,2) * secondbindata)};
	elseif strcmp(doublefit.parameter(i).fit,'power')
		finalunweightedparameter(i) = {unweightedparameters(i,1) * secondbindata .^ unweightedparameters(i,2)};
	elseif strcmp(doublefit.parameter(i).fit,'poweroffset')
		finalunweightedparameter(i) = {unweightedparameters(i,3) + unweightedparameters(i,1) * secondbindata .^ unweightedparameters(i,2)};
	elseif strcmp(doublefit.parameter(i).fit,'sigmoid')
		finalunweightedparameter(i) = {unweightedparameters(i,1) - unweightedparameters(i,2) * (log(( unweightedparameters(i,3) ./ (secondbindata - unweightedparameters(i,4))) - 1))};
	else
		disp('Error in doublefitter.m');
		keyboard;
	end
end

if strcmp(doublefit.firstbin.fit,'linear')
	unweightedfitdata = finalunweightedparameter{1} .* firstbindata + finalunweightedparameter{2};
elseif strcmp(doublefit.firstbin.fit,'exponential')
	unweightedfitdata = finalunweightedparameter{1} .* exp(finalunweightedparameter{2} .* firstbindata);
elseif strcmp(doublefit.firstbin.fit,'exponentialoffset')
	unweightedfitdata = finalunweightedparameter{3} + finalunweightedparameter{1} .* exp(finalunweightedparameter{2} .* firstbindata);
elseif strcmp(doublefit.firstbin.fit,'power')
	unweightedfitdata = finalunweightedparameter{1} .* firstbindata .^ finalunweightedparameter{2};
elseif strcmp(doublefit.firstbin.fit,'poweroffset')
	unweightedfitdata = finalunweightedparameter{3} + finalunweightedparameter{1} .* firstbindata .^ finalunweightedparameter{2};
elseif strcmp(doublefit.firstbin.fit,'sigmoid')
	unweightedfitdata = finalunweightedparameter{1} - finalunweightedparameter{2} .* (log(( finalunweightedparameter{3}./(firstbindata - finalunweightedparameter{4}) )-1))
else
	disp('  Error in doublefit.m');
	keyboard;
end

unweightedrmsematrix = (unweightedfitdata - measuredata).^2;
unweightedrmse = (sum(unweightedrmsematrix(~isnan(unweightedrmsematrix)))) / (sum(sum(~isnan(unweightedrmsematrix))));



% Start Weighted Section
initialparameters = parameters;
inputdata(:,:,1)=firstbindata(:,:);
inputdata(:,:,2)=secondbindata(:,:);
outputdata = measuredata;

disp('         Weighted Fit.');
weightedrmsefunction = inline(weightedfitdatastring,'inputdata','outputdata','weightdata','parameters');
weightedparameters = fminsearch(@(parameters) weightedrmsefunction(inputdata,outputdata,weightdata,parameters) , initialparameters , optimset('MaxFunEvals',1000));

clear finalweightedparameter;
for i = 1:length(doublefit.parameter)
	for j = 1:length(doublefit.parameter(i).parameter)
		weightedparameters(i,j) = weightedparameters(i,j);
	end
	if strcmp(doublefit.parameter(i).fit,'linear')
		finalweightedparameter(i) = {weightedparameters(i,1) * secondbindata + weightedparameters(i,2)};
	elseif strcmp(doublefit.parameter(i).fit,'exponential')
		finalweightedparameter(i) = {weightedparameters(i,1) * exp(weightedparameters(i,2) * secondbindata)};
	elseif strcmp(doublefit.parameter(i).fit,'exponentialoffset')
		finalweightedparameter(i) = {weightedparameters(i,3) + weightedparameters(i,1) * exp(weightedparameters(i,2) * secondbindata)};
	elseif strcmp(doublefit.parameter(i).fit,'power')
		finalweightedparameter(i) = {weightedparameters(i,1) * secondbindata .^ weightedparameters(i,2)};
	elseif strcmp(doublefit.parameter(i).fit,'poweroffset')
		finalweightedparameter(i) = {weightedparameters(i,3) + weightedparameters(i,1) * secondbindata .^ weightedparameters(i,2)};
	elseif strcmp(doublefit.parameter(i).fit,'sigmoid')
		finalweightedparameter(i) = {weightedparameters(i,1) - weightedparameters(i,2) * (log(( weightedparameters(i,3) ./ (secondbindata - weightedparameters(i,4))) - 1))};
	else
		disp('Error in doublefitter.m');
		keyboard;
	end
end

if strcmp(doublefit.firstbin.fit,'linear')
	weightedfitdata = finalweightedparameter{1} .* firstbindata + finalweightedparameter{2};
elseif strcmp(doublefit.firstbin.fit,'exponential')
	weightedfitdata = finalweightedparameter{1} .* exp(finalweightedparameter{2} .* firstbindata);
elseif strcmp(doublefit.firstbin.fit,'exponentialoffset')
	weightedfitdata = finalweightedparameter{3} + finalweightedparameter{1} .* exp(finalweightedparameter{2} .* firstbindata);
elseif strcmp(doublefit.firstbin.fit,'power')
	weightedfitdata = finalweightedparameter{1} .* firstbindata .^ finalweightedparameter{2};
elseif strcmp(doublefit.firstbin.fit,'poweroffset')
	weightedfitdata = finalweightedparameter{3} + finalweightedparameter{1} .* firstbindata .^ finalweightedparameter{2};
elseif strcmp(doublefit.firstbin.fit,'sigmoid')
	weightedfitdata = finalweightedparameter{1} - finalweightedparameter{2} .* (log(( finalweightedparameter{3}./(firstbindata - finalweightedparameter{4}) )-1))
else
	disp('  Error in doublefit.m');
	keyboard;
end

weightedrmsematrix = (weightedfitdata - measuredata).^2;
weightedrmse = (sum(weightedrmsematrix(~isnan(weightedrmsematrix)))) / (sum(sum(~isnan(weightedrmsematrix))));



% Start Robust Unweighted Section
initialparameters = parameters;
inputdata(:,:,1)=firstbindata(:,:);
inputdata(:,:,2)=secondbindata(:,:);
outputdata = measuredata;

disp('         Robust Unweighted Fit.');
robustunweightedrmsefunction = inline(robustunweightedfitdatastring,'inputdata','outputdata','weightdata','parameters');
robustunweightedparameters = fminsearch(@(parameters) robustunweightedrmsefunction(inputdata,outputdata,weightdata,parameters) , initialparameters , optimset('MaxFunEvals',1000));

clear finalrobustunweightedparameter;
for i = 1:length(doublefit.parameter)
	for j = 1:length(doublefit.parameter(i).parameter)
		robustunweightedparameters(i,j) = robustunweightedparameters(i,j);
	end
	if strcmp(doublefit.parameter(i).fit,'linear')
		finalrobustunweightedparameter(i) = {robustunweightedparameters(i,1) * secondbindata + robustunweightedparameters(i,2)};
	elseif strcmp(doublefit.parameter(i).fit,'exponential')
		finalrobustunweightedparameter(i) = {robustunweightedparameters(i,1) * exp(robustunweightedparameters(i,2) * secondbindata)};
	elseif strcmp(doublefit.parameter(i).fit,'exponentialoffset')
		finalrobustunweightedparameter(i) = {robustunweightedparameters(i,3) + robustunweightedparameters(i,1) * exp(robustunweightedparameters(i,2) * secondbindata)};
	elseif strcmp(doublefit.parameter(i).fit,'power')
		finalrobustunweightedparameter(i) = {robustunweightedparameters(i,1) * secondbindata .^ robustunweightedparameters(i,2)};
	elseif strcmp(doublefit.parameter(i).fit,'poweroffset')
		finalrobustunweightedparameter(i) = {robustunweightedparameters(i,3) + robustunweightedparameters(i,1) * secondbindata .^ robustunweightedparameters(i,2)};
	elseif strcmp(doublefit.parameter(i).fit,'sigmoid')
		finalrobustunweightedparameter(i) = {robustunweightedparameters(i,1) - robustunweightedparameters(i,2) * (log(( robustunweightedparameters(i,3) ./ (secondbindata - robustunweightedparameters(i,4))) - 1))};
	else
		disp('Error in doublefitter.m');
		keyboard;
	end
end

if strcmp(doublefit.firstbin.fit,'linear')
	robustunweightedfitdata = finalrobustunweightedparameter{1} .* firstbindata + finalrobustunweightedparameter{2};
elseif strcmp(doublefit.firstbin.fit,'exponential')
	robustunweightedfitdata = finalrobustunweightedparameter{1} .* exp(finalrobustunweightedparameter{2} .* firstbindata);
elseif strcmp(doublefit.firstbin.fit,'exponentialoffset')
	robustunweightedfitdata = finalrobustunweightedparameter{3} + finalrobustunweightedparameter{1} .* exp(finalrobustunweightedparameter{2} .* firstbindata);
elseif strcmp(doublefit.firstbin.fit,'power')
	robustunweightedfitdata = finalrobustunweightedparameter{1} .* firstbindata .^ finalrobustunweightedparameter{2};
elseif strcmp(doublefit.firstbin.fit,'poweroffset')
	robustunweightedfitdata = finalrobustunweightedparameter{3} + finalrobustunweightedparameter{1} .* firstbindata .^ finalrobustunweightedparameter{2};
elseif strcmp(doublefit.firstbin.fit,'sigmoid')
	robustunweightedfitdata = finalrobustunweightedparameter{1} - finalrobustunweightedparameter{2} .* (log(( finalrobustunweightedparameter{3}./(firstbindata - finalrobustunweightedparameter{4}) )-1))
else
	disp('  Error in doublefit.m');
	keyboard;
end

robustunweightedrmsematrix = (robustunweightedfitdata - measuredata).^2;
robustunweightedrmse = (sum(robustunweightedrmsematrix(~isnan(robustunweightedrmsematrix)))) / (sum(sum(~isnan(robustunweightedrmsematrix))));



% Start Robust Weighted Section
initialparameters = parameters;
inputdata(:,:,1)=firstbindata(:,:);
inputdata(:,:,2)=secondbindata(:,:);
outputdata = measuredata;

disp('         Robust Weighted Fit.');
robustweightedrmsefunction = inline(robustweightedfitdatastring,'inputdata','outputdata','weightdata','parameters');
robustweightedparameters = fminsearch(@(parameters) robustweightedrmsefunction(inputdata,outputdata,weightdata,parameters) , initialparameters , optimset('MaxFunEvals',1000));

clear finalrobustweightedparameter;
for i = 1:length(doublefit.parameter)
	for j = 1:length(doublefit.parameter(i).parameter)
		robustweightedparameters(i,j) = robustweightedparameters(i,j);
	end
	if strcmp(doublefit.parameter(i).fit,'linear')
		finalrobustweightedparameter(i) = {robustweightedparameters(i,1) * secondbindata + robustweightedparameters(i,2)};
	elseif strcmp(doublefit.parameter(i).fit,'exponential')
		finalrobustweightedparameter(i) = {robustweightedparameters(i,1) * exp(robustweightedparameters(i,2) * secondbindata)};
	elseif strcmp(doublefit.parameter(i).fit,'exponentialoffset')
		finalrobustweightedparameter(i) = {robustweightedparameters(i,3) + robustweightedparameters(i,1) * exp(robustweightedparameters(i,2) * secondbindata)};
	elseif strcmp(doublefit.parameter(i).fit,'power')
		finalrobustweightedparameter(i) = {robustweightedparameters(i,1) * secondbindata .^ robustweightedparameters(i,2)};
	elseif strcmp(doublefit.parameter(i).fit,'poweroffset')
		finalrobustweightedparameter(i) = {robustweightedparameters(i,3) + robustweightedparameters(i,1) * secondbindata .^ robustweightedparameters(i,2)};
	elseif strcmp(doublefit.parameter(i).fit,'sigmoid')
		finalrobustweightedparameter(i) = {robustweightedparameters(i,1) - robustweightedparameters(i,2) * (log(( robustweightedparameters(i,3) ./ (secondbindata - robustweightedparameters(i,4))) - 1))};
	else
		disp('Error in doublefitter.m');
		keyboard;
	end
end

if strcmp(doublefit.firstbin.fit,'linear')
	robustweightedfitdata = finalrobustweightedparameter{1} .* firstbindata + finalrobustweightedparameter{2};
elseif strcmp(doublefit.firstbin.fit,'exponential')
	robustweightedfitdata = finalrobustweightedparameter{1} .* exp(finalrobustweightedparameter{2} .* firstbindata);
elseif strcmp(doublefit.firstbin.fit,'exponentialoffset')
	robustweightedfitdata = finalrobustweightedparameter{3} + finalrobustweightedparameter{1} .* exp(finalrobustweightedparameter{2} .* firstbindata);
elseif strcmp(doublefit.firstbin.fit,'power')
	robustweightedfitdata = finalrobustweightedparameter{1} .* firstbindata .^ finalrobustweightedparameter{2};
elseif strcmp(doublefit.firstbin.fit,'poweroffset')
	robustweightedfitdata = finalrobustweightedparameter{3} + finalrobustweightedparameter{1} .* firstbindata .^ finalrobustweightedparameter{2};
elseif strcmp(doublefit.firstbin.fit,'sigmoid')
	robustweightedfitdata = finalrobustweightedparameter{1} - finalrobustweightedparameter{2} .* (log(( finalrobustweightedparameter{3}./(firstbindata - finalrobustweightedparameter{4}) )-1))
else
	disp('  Error in doublefit.m');
	keyboard;
end

robustweightedrmsematrix = (robustweightedfitdata - measuredata).^2;
robustweightedrmse = (sum(robustweightedrmsematrix(~isnan(robustweightedrmsematrix)))) / (sum(sum(~isnan(robustweightedrmsematrix))));


