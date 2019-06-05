function [fitx,fity] = fitter_new(fit,parameters,varargin)

if length(varargin) == 0


elseif length(varargin) == 1
    x = varargin{1};
	fitx = (0.9*min(x)):(range(x)/50):(1.1*max(x));
	
    
    if strcmp(fit,'linear') == 1
        fity = (parameters(1)*fitx) + parameters(2);
    elseif strcmp(fit,'exponential') == 1
		if length(parameters) == 3
			fity = parameters(3) + parameters(1) * exp(parameters(2)*fitx);
		else
			fity = parameters(1) * exp(parameters(2)*fitx);
		end
    elseif strcmp(fit,'exponentialoffset') == 1
		if length(parameters) == 3
			fity = parameters(3) + parameters(1) * exp(parameters(2)*fitx);
		else
			fity = parameters(1) * exp(parameters(2)*fitx);
		end
	elseif strcmp(fit,'power') == 1
		if length(parameters) == 3
			fity = parameters(3) + parameters(1).*(fitx.^parameters(2));
		else
			fity = parameters(1).*(fitx.^parameters(2));
		end
	elseif strcmp(fit,'poweroffset') == 1
		if length(parameters) == 3
			fity = parameters(3) + parameters(1).*(fitx.^parameters(2));
		else
			fity = parameters(1).*(fitx.^parameters(2));
		end
    elseif strcmp(fit,'sigmoid') == 1
        fity = parameters(1) - parameters(2).*log((parameters(3)./(fitx-parameters(4)))-1);
    elseif strcmp(fit,'logit') == 1
        fity = glmval(parameters,fitx,'logit');
    elseif strcmp(fit,'probit') == 1
        fity = glmval(parameters,fitx,'probit');
    else
        disp('Error in ''fitter'' with fit type.');
        keyboard;
    end

elseif length(varargin) == 2
    x = varargin{1};
	[xr,xc] = size(x);
	x = reshape(x,numel(x),1);
    y = varargin{2};
	[yr,yc] = size(y);
	y = reshape(y,numel(y),1);
    
    if strcmp(fit,'logit') == 1
        %fity = 1./(1+exp(-(parameters(1)+parameters(2).*x+parameters(3).*y)));
		fity = glmval(parameters,[x y],'logit');
		fity = reshape(fity,xr,xc);
    elseif strcmp(fit,'probit') == 1
        %fity = (parameters(1) + parameters(2).*log(x) + parameters(3).*log(y));
		fity = glmval(parameters,[x y],'probit');
		fity = reshape(fity,xr,xc);
    else
        disp('Error in ''yfitter'' with fit type.');
    end

else
    disp('Error in ''fitter'' with number of input arguments.');
end

for i = 1:length(fity)
    if isreal(fity(i)) == 0
        fity(i) = NaN;
    end
end
    