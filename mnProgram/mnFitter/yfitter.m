function fity = yfitter(fit,parameters,x)

if strcmp(fit,'linear') == 1
    fity = (parameters(1)*x) + parameters(2);
elseif strcmp(fit,'exponential') == 1
    fity = parameters(1) * exp(parameters(2)*x);
elseif strcmp(fit,'power') == 1
    fity = parameters(1).*(x.^parameters(2));
elseif strcmp(fit,'sigmoid') == 1
    fity = parameters(1) - parameters(2).*log((parameters(3)./(x-parameters(4)))-1);
elseif strcmp(fit,'logit') == 1
    fity = glmval(parameters,x,'logit');
elseif strcmp(fit,'probit') == 1
    fity = glmval(parameters,x,'probit');
else
    disp('Error with ''yfitter.m''.');
    keyboard;
end