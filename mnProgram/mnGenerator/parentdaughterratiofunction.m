function [rallratio,daughterratio] = parentdaughterratiofunction(parentdiameter,distalpathlength,input)

sample1 = lognrnd(input.parentdaughterratio.mean,input.parentdaughterratio.sd,1,1);
sample2 = lognrnd(input.parentdaughterratio.mean,input.parentdaughterratio.sd,1,1);

if sample1 < sample2
    pd1ratio = sample1;
    pd2ratio = sample2;
else
    pd1ratio = sample2;
    pd2ratio = sample1;
end


% pd1ratio = lognrnd(input.parentdaughter1ratio.mean,input.parentdaughter1ratio.sd,1,1);
% pd2ratio = lognrnd(input.parentdaughter2ratio.mean,input.parentdaughter2ratio.sd,1,1);
% samplecount = 1;
% while pd2ratio < pd1ratio
%     pd1ratio = lognrnd(input.parentdaughter1ratio.mean,input.parentdaughter1ratio.sd,1,1);
%     pd2ratio = lognrnd(input.parentdaughter2ratio.mean,input.parentdaughter2ratio.sd,1,1);
%     %disp('Resampling parent/daughter2ratio to be smaller than pd1ratio.');
%     %disp(samplecount);
%     samplecount = samplecount + 1;
% end


rallratio = (1/(pd1ratio^input.rallratio.rallexponent)) + (1/(pd2ratio^input.rallratio.rallexponent));
daughterratio = pd2ratio/pd1ratio;

if isnan(pd1ratio) || ~isreal(pd1ratio) || pd1ratio <= 0 || isnan(pd2ratio) || ~isreal(pd2ratio) || pd2ratio <= 0 || isnan(rallratio) || ~isreal(rallratio) || rallratio <= 0 || isnan(daughterratio) || ~isreal(daughterratio) || daughterratio < 1
    disp('Error: problem with parentdaughterratiofunction.');
    keyboard;
end
