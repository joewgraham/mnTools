function [fitx,fity] = rangefitter(fit,parameters,varargin)

if length(varargin) == 0


elseif length(varargin) == 1
    x = varargin{1};
    
    fitx = [min(x):(max(x)-min(x))/99:max(x)];
    
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
	elseif strcmp(fit,'identity') == 1
        fity = glmval(parameters,fitx,'identity');
	elseif strcmp(fit,'log') == 1
        fity = glmval(parameters,fitx,'log');
	elseif strcmp(fit,'comploglog') == 1
        fity = glmval(parameters,fitx,'comploglog');
	elseif strcmp(fit,'reciprocal') == 1
        fity = glmval(parameters,fitx,'reciprocal');
	elseif strcmp(fit,'loglog') == 1
        fity = glmval(parameters,fitx,'loglog');
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
        %fit = 1./(1+exp(-(parameters(1)+parameters(2).*x+parameters(3).*y)));
		fit = glmval(parameters,[x y],'logit');
		fit = reshape(fit,xr,xc);
    elseif strcmp(fit,'probit') == 1
        %fit = (parameters(1) + parameters(2).*log(x) + parameters(3).*log(y));
		fit = glmval(parameters,[x y],'probit');
		fit = reshape(fit,xr,xc);
	elseif strcmp(fit,'comploglog') == 1
        %fit = (parameters(1) + parameters(2).*log(x) + parameters(3).*log(y));
		fit = glmval(parameters,[x y],'comploglog');
		fit = reshape(fit,xr,xc);
	elseif strcmp(fit,'loglog') == 1
        %fit = (parameters(1) + parameters(2).*log(x) + parameters(3).*log(y));
		fit = glmval(parameters,[x y],'loglog');
		fit = reshape(fit,xr,xc);
    else
        disp('Error in ''yfitter'' with fit type.');
    end

else
    disp('Error in ''fitter'' with number of input arguments.');
end

% for i = 1:length(fit)
%     if isreal(fit(i)) == 0
%         fit(i) = NaN;
%     end
% end
    