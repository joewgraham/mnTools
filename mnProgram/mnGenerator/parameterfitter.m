function parametervalue = parameterfitter(parameterfit)

firstbindata = parameterfit.firstbin.data;
secondbindata = parameterfit.secondbin.data;

clear finalparameter;
for i = 1:length(parameterfit.parameter)
	for j = 1:length(parameterfit.parameter(i).parameter)
		parameters(i,j) = parameterfit.parameter(i).parameter(j);
	end
	if strcmp(parameterfit.parameter(i).fit,'linear')
		finalparameter(i) = {parameters(i,1) * secondbindata + parameters(i,2)};
	elseif strcmp(parameterfit.parameter(i).fit,'exponential')
		finalparameter(i) = {parameters(i,1) * exp(parameters(i,2) * secondbindata)};
	elseif strcmp(parameterfit.parameter(i).fit,'power')
		finalparameter(i) = {parameters(i,1) * secondbindata .^ parameters(i,2)};
	elseif strcmp(parameterfit.parameter(i).fit,'sigmoid')
		finalparameter(i) = {parameters(i,1) - parameters(i,2) * (log(( parameters(i,3) ./ (secondbindata - parameters(i,4))) - 1))};
	else
		disp('Error in parameterfitter.m');
		keyboard;
	end
end

if strcmp(parameterfit.firstbin.fit,'linear')
	parametervalue = finalparameter{1} .* firstbindata + finalparameter{2};
elseif strcmp(parameterfit.firstbin.fit,'exponential')
	parametervalue = finalparameter{1} .* exp(finalparameter{2} .* firstbindata);
elseif strcmp(parameterfit.firstbin.fit,'power')
	parametervalue = finalparameter{1} .* firstbindata .^ finalparameter{2};
elseif strcmp(parameterfit.firstbin.fit,'sigmoid')
	parametervalue = finalparameter{1} - finalparameter{2} .* (log(( finalparameter{3}/(firstbindata - finalparameter{4}) )-1))
else
	disp('  Error in parameterfit.m');
	keyboard;
end
