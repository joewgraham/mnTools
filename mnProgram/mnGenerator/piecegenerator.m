%assign standard piece values

typepiece(currentpiece).distalxposition         = typepiece(currentpiece).proximalxposition+xdirection*piecelength;
typepiece(currentpiece).distalyposition         = typepiece(currentpiece).proximalyposition+ydirection*piecelength;
typepiece(currentpiece).distalzposition         = typepiece(currentpiece).proximalzposition+zdirection*piecelength;
typepiece(currentpiece).length                  = ( (typepiece(currentpiece).distalxposition-typepiece(currentpiece).proximalxposition)^2 ...
    + (typepiece(currentpiece).distalyposition-typepiece(currentpiece).proximalyposition)^2 ...
    + (typepiece(currentpiece).distalzposition-typepiece(currentpiece).proximalzposition)^2)^0.5;

typepiece(currentpiece).distaldiameter          = typepiece(currentpiece).proximaldiameter-(taperrate*typepiece(currentpiece).length);
typepiece(currentpiece).taperrate               = (typepiece(currentpiece).proximaldiameter - typepiece(currentpiece).distaldiameter) / typepiece(currentpiece).length;
typepiece(currentpiece).xdirection              = (typepiece(currentpiece).distalxposition - typepiece(currentpiece).proximalxposition) / typepiece(currentpiece).length;
typepiece(currentpiece).ydirection              = (typepiece(currentpiece).distalyposition - typepiece(currentpiece).proximalyposition) / typepiece(currentpiece).length;
typepiece(currentpiece).zdirection              = (typepiece(currentpiece).distalzposition - typepiece(currentpiece).proximalzposition) / typepiece(currentpiece).length;
typepiece(currentpiece).surfacearea             = pi*((typepiece(currentpiece).proximaldiameter/2)+(typepiece(currentpiece).distaldiameter/2))*(((((typepiece(currentpiece).proximaldiameter/2)-(typepiece(currentpiece).distaldiameter/2))^2)+typepiece(currentpiece).length^2)^0.5);
typepiece(currentpiece).volume                  = (pi/12)*typepiece(currentpiece).length*(typepiece(currentpiece).proximaldiameter^2+typepiece(currentpiece).proximaldiameter*typepiece(currentpiece).distaldiameter+typepiece(currentpiece).distaldiameter^2);

typepiece(currentpiece).branchvolume            = typepiece(currentpiece).branchvolume + typepiece(currentpiece).volume;

typepiece(currentpiece).cylindricaldiameter     = 2*((typepiece(currentpiece).volume/(pi*typepiece(currentpiece).length))^0.5);
typepiece(currentpiece).csa                     = pi*((typepiece(currentpiece).cylindricaldiameter/2)^2);
typepiece(currentpiece).id                      = currentpiece;
typepiece(currentpiece).motoneuron              = mnnum;
typepiece(currentpiece).trunk                   = pdnum;

typepiece(currentpiece).distalpathlength        = typepiece(currentpiece).proximalpathlength+typepiece(currentpiece).length;
%typepiece(currentpiece).pathlength              = (typepiece(currentpiece).proximalpathlength+typepiece(currentpiece).distalpathlength)/2;
typepiece(currentpiece).proximalradialdistance  = ( (typepiece(currentpiece).proximalxposition-mnpop.mn(mnnum).xposition)^2 ...
    + (typepiece(currentpiece).proximalyposition-mnpop.mn(mnnum).yposition)^2 ...
    + (typepiece(currentpiece).proximalzposition-mnpop.mn(mnnum).zposition)^2 )^0.5;
typepiece(currentpiece).distalradialdistance    = ( (typepiece(currentpiece).distalxposition-mnpop.mn(mnnum).xposition)^2 ...
    + (typepiece(currentpiece).distalyposition-mnpop.mn(mnnum).yposition)^2 ...
    + (typepiece(currentpiece).distalzposition-mnpop.mn(mnnum).zposition)^2 )^0.5;
%typepiece(currentpiece).radialdistance          = (typepiece(currentpiece).proximalradialdistance+typepiece(currentpiece).distalradialdistance) / 2;
typepiece(currentpiece).distalbranchlength      = typepiece(currentpiece).proximalbranchlength + typepiece(currentpiece).length;
typepiece(currentpiece).branchlength            = typepiece(currentpiece).distalbranchlength;
typepiece(currentpiece).branchsurfacearea       = typepiece(currentpiece).branchsurfacearea + typepiece(currentpiece).surfacearea;

if strcmp(typepiece(currentpiece).proximaltype,'primary    ') || strcmp(typepiece(currentpiece).proximaltype,'daughter1  ') || strcmp(typepiece(currentpiece).proximaltype,'daughter2  ')
    typepiece(currentpiece).dparentangle = NaN;
else
    typepiece(currentpiece).dparentangle = vectoranglefunction(typepiece(currentpiece).xdirection,typepiece(currentpiece).ydirection,typepiece(currentpiece).zdirection,typepiece(typepiece(currentpiece).parent).xdirection,typepiece(typepiece(currentpiece).parent).ydirection,typepiece(typepiece(currentpiece).parent).zdirection);
end

%disp(sprintf('             Length:    %f',typepiece(currentpiece).length));
%disp(sprintf('             Prox Diam: %f',typepiece(currentpiece).proximaldiameter));
%disp(sprintf('             Dist Diam: %f',typepiece(currentpiece).distaldiameter));


testvalue = rand;
clear pieceendprob;

if strcmp(typepiece(currentpiece).branchtype,'b')
    pieceendinput = typeinput.piecebifprob;
    biforterm = 'bif';
elseif strcmp(typepiece(currentpiece).branchtype,'t')
    pieceendinput = typeinput.piecetermprob;
    biforterm = 'term';
else
    disp('Error in piecegenerator.');
    keyboard;
end

if strcmp(pieceendinput.level,'piece')
    eval(['refvalue = typepiece(currentpiece).' pieceendinput.by ';']);
elseif strcmp(pieceendinput.level,'branch')
    eval(['refvalue = typepiece(currentpiece).branch' pieceendinput.by ';']);
else
   disp('Error in piecegenerator.');
   keyboard;
end

if strcmp(pieceendinput.mode,'lognormal')
    
    if strcmp(typepiece(currentpiece).branchtype,'b')
        if refvalue >= bifbranchtestvalue %|| typepiece(currentpiece).branchvolume >= 1.594e4
            pieceendprob = 1;
        else
            pieceendprob = 0;
        end
        if isfield(typeinput.piecebifprob.lognormal,'maxlength')
            if isfinite(typeinput.piecebifprob.lognormal.maxlength)
                if typepiece(currentpiece).branchlength >= typeinput.piecebifprob.lognormal.maxlength
                    pieceendprob = 1;
                end
            end
        end
        if isfield(typeinput.piecebifprob.lognormal,'maxsurfacearea')
            if isfinite(typeinput.piecebifprob.lognormal.maxsurfacearea)
                if typepiece(currentpiece).branchsurfacearea >= typeinput.piecebifprob.lognormal.maxsurfacearea
                    pieceendprob = 1;
                end
            end
        end
        if isfield(typeinput.piecebifprob.lognormal,'maxvolume')
            if isfinite(typeinput.piecebifprob.lognormal.maxvolume)
                if typepiece(currentpiece).branchvolume >= typeinput.piecebifprob.lognormal.maxvolume
                    pieceendprob = 1;
                end
            end
        end
        
    elseif strcmp(typepiece(currentpiece).branchtype,'t')
        if refvalue >= termbranchtestvalue
            pieceendprob = 1;
        else
            pieceendprob = 0;
        end
        if isfield(typeinput.piecetermprob.lognormal,'maxlength')
            if isfinite(typeinput.piecetermprob.lognormal.maxlength)
                if typepiece(currentpiece).branchlength >= typeinput.piecetermprob.lognormal.maxlength
                    pieceendprob = 1;
                end
            end
        end
        if isfield(typeinput.piecetermprob.lognormal,'maxsurfacearea')
            if isfinite(typeinput.piecetermprob.lognormal.maxsurfacearea)
                if typepiece(currentpiece).branchsurfacearea >= typeinput.piecetermprob.lognormal.maxsurfacearea
                    pieceendprob = 1;
                end
            end
        end
        if isfield(typeinput.piecetermprob.lognormal,'maxvolume')
            if isfinite(typeinput.piecetermprob.lognormal.maxvolume)
                if typepiece(currentpiece).branchvolume >= typeinput.piecetermprob.lognormal.maxvolume
                    pieceendprob = 1;
                end
            end
        end
    else
        disp('Error in piecegenerator.');
        keyboard
    end
    
elseif strcmp(pieceendinput.mode,'independent')
    
    if strcmp(pieceendinput.distribution,'exponential')
        pieceendprob = cdf('exp',refvalue,pieceendinput.exp);
    elseif strcmp(pieceendinput.distribution,'gamma')
        pieceendprob = cdf('gam',refvalue,pieceendinput.gama,pieceendinput.gamb);
    elseif strcmp(pieceendinput.distribution,'pearson') == 1
        lastwarn('');
        [blank,type] = pearsrnd(mean,sd,skew,kurt,0,0);
        [lastmsg, lastid] = lastwarn;
        if strcmp(lastid,'MATLAB:divideByZero') == 1 || isnan(type) == 1
            disp('       Sampled bif prob from normal instead of Pearson.');
            pieceendinput.distribution = 'normal';
        end
    else
        pieceendprob = samplefunction(typeinput.piecebifprob);
    end
    
elseif strcmp(pieceendinput.mode,'dependent')
    
    if strcmp(pieceendinput.dependent.type,'linearregression');
        
        linregvalue = pieceendinput.dependent.linreg.constant + ...
            pieceendinput.dependent.linreg.diameter*branchproximaldiameter + ...
            pieceendinput.dependent.linreg.pathlength*branchproximalpathlength + ...
            pieceendinput.dependent.linreg.branchorder*typepiece(currentpiece).branchorder;
        
        if linregvalue > 0
            pieceendprob = cdf('exp',refvalue,linregvalue);
        else
            pieceendprob = 1;
            disp(['       Warning: pieceendprob (' biforterm ') set to certainty due to subzero probability.']);
        end
        
    elseif strcmp(pieceendinput.dependent.type,'singlebin')
        clear singlebinvalue;
        if strcmp(pieceendinput.dependent.singlebin.dependent,'branchorder')
            singlebinvalue = typepiece(currentpiece).branchorder;
        elseif strcmp(pieceendinput.dependent.singlebin.dependent,'branchproximalpathlength')
            singlebinvalue = branchproximalpathlength;
        elseif strcmp(pieceendinput.dependent.singlebin.dependent,'branchproximaldiameter')
            singlebinvalue = branchproximaldiameter;
        else
            eval(['singlebinvalue = typepiece(currentpiece).distal' pieceendinput.dependent.singlebin.dependent ';']);
        end
        
        if ~strcmp(pieceendinput.dependent.singlebin.dependent,'branchproximalpathlength') && ~strcmp(pieceendinput.dependent.singlebin.dependent,'branchproximaldiameter')
            if strcmp(pieceendinput.dependent.singlebin.fit,'linear') == 1
                pieceendprob = refvalue * ((pieceendinput.dependent.singlebin.parameter(1) * singlebinvalue) + pieceendinput.dependent.singlebin.parameter(2));
            elseif strcmp(pieceendinput.dependent.singlebin.fit,'exponential') == 1
                if ~isnan(pieceendinput.dependent.singlebin.parameter(3))
                    pieceendprob = refvalue * (pieceendinput.dependent.singlebin.parameter(3) + pieceendinput.dependent.singlebin.parameter(1) * exp(singlebinvalue * pieceendinput.dependent.singlebin.parameter(2)));
                else
                    pieceendprob = refvalue * (pieceendinput.dependent.singlebin.parameter(1) * exp(singlebinvalue * pieceendinput.dependent.singlebin.parameter(2)));
                end
            elseif strcmp(pieceendinput.dependent.singlebin.fit,'power') == 1
                if ~isnan(pieceendinput.dependent.singlebin.parameter(3))
                    pieceendprob = refvalue * (pieceendinput.dependent.singlebin.parameter(3) + pieceendinput.dependent.singlebin.parameter(1) * (singlebinvalue ^ pieceendinput.dependent.singlebin.parameter(2)));
                else
                    pieceendprob = refvalue * (pieceendinput.dependent.singlebin.parameter(1) * (singlebinvalue ^ pieceendinput.dependent.singlebin.parameter(2)));
                end
            elseif strcmp(pieceendinput.dependent.singlebin.fit,'sigmoid') == 1
                pieceendprob = refvalue * (pieceendinput.dependent.singlebin.parameter(3) - pieceendinput.dependent.singlebin.parameter(4) * log( (pieceendinput.dependent.singlebin.parameter(2) / (singlebinvalue - pieceendinput.dependent.singlebin.parameter(1))) - 1 ));
            else
                disp('Error in piecegenerator.')
                keyboard;
            end
        else
            %new stuff
            if strcmp(pieceendinput.dependent.singlebin.fit,'linear') == 1
                mu = ((pieceendinput.dependent.singlebin.parameter(1) * singlebinvalue) + pieceendinput.dependent.singlebin.parameter(2));
            elseif strcmp(pieceendinput.dependent.singlebin.fit,'exponential') == 1
                if ~isnan(pieceendinput.dependent.singlebin.parameter(3))
                    mu = (pieceendinput.dependent.singlebin.parameter(3) + pieceendinput.dependent.singlebin.parameter(1) * exp(singlebinvalue * pieceendinput.dependent.singlebin.parameter(2)));
                else
                    mu = (pieceendinput.dependent.singlebin.parameter(1) * exp(singlebinvalue * pieceendinput.dependent.singlebin.parameter(2)));
                end
            elseif strcmp(pieceendinput.dependent.singlebin.fit,'power') == 1
                if ~isnan(pieceendinput.dependent.singlebin.parameter(3))
                    mu = (pieceendinput.dependent.singlebin.parameter(3) + pieceendinput.dependent.singlebin.parameter(1) * (singlebinvalue ^ pieceendinput.dependent.singlebin.parameter(2)));
                else
                    mu = (pieceendinput.dependent.singlebin.parameter(1) * (singlebinvalue ^ pieceendinput.dependent.singlebin.parameter(2)));
                end
            elseif strcmp(pieceendinput.dependent.singlebin.fit,'sigmoid') == 1
                mu = (pieceendinput.dependent.singlebin.parameter(3) - pieceendinput.dependent.singlebin.parameter(4) * log( (pieceendinput.dependent.singlebin.parameter(2) / (singlebinvalue - pieceendinput.dependent.singlebin.parameter(1))) - 1 ));
            else
                disp('Error in piecegenerator.')
                keyboard;
            end
            if mu > 0
                pieceendprob = cdf('exp',refvalue,mu);
            else
                pieceendprob = 1;
                disp('       Warning: pieceendprob set to certainty due to subzero probability.');
            end
            %end new stuff
        end
        
    elseif strcmp(pieceendinput.dependent.type,'doublebin')
        clear firstbinvalue;
        if strcmp(pieceendinput.dependent.doublebin.firstbin,'branchorder')
            firstbinvalue = typepiece(currentpiece).branchorder;
        else
            eval(['firstbinvalue = typepiece(currentpiece).distal' pieceendinput.dependent.doublebin.firstbin ';']);
        end
        clear secondbinvalue;
        if strcmp(pieceendinput.dependent.doublebin.secondbin,'branchorder')
            secondbinvalue = typepiece(currentpiece).branchorder;
        else
            eval(['secondbinvalue = typepiece(currentpiece).distal' pieceendinput.dependent.doublebin.secondbin ';']);
        end
        
        if strcmp(pieceendinput.dependent.doublebin.parameter(1).fit,'linear') == 1
            parameter1 = (pieceendinput.dependent.doublebin.parameter(1).parameter(1) * secondbinvalue) + pieceendinput.dependent.doublebin.parameter(1).parameter(2);
        elseif strcmp(pieceendinput.dependent.doublebin.parameter(1).fit,'exponential') == 1
            if ~isnan(pieceendinput.dependent.doublebin.parameter(1).parameter(3))
                parameter1 = pieceendinput.dependent.doublebin.parameter(1).parameter(1) * exp(secondbinvalue * pieceendinput.dependent.doublebin.parameter(1).parameter(2));
            else
                parameter1 = pieceendinput.dependent.doublebin.parameter(1).parameter(1) * exp(secondbinvalue * pieceendinput.dependent.doublebin.parameter(1).parameter(2));
            end
        elseif strcmp(pieceendinput.dependent.doublebin.parameter(1).fit,'power') == 1
            if ~isnan(pieceendinput.dependent.doublebin.parameter(1).parameter(3))
                parameter1 = pieceendinput.dependent.doublebin.parameter(1).parameter(1) * (secondbinvalue ^ pieceendinput.dependent.doublebin.parameter(1).parameter(2));
            else
                parameter1 = pieceendinput.dependent.doublebin.parameter(1).parameter(1) * (secondbinvalue ^ pieceendinput.dependent.doublebin.parameter(1).parameter(2));
            end
        elseif strcmp(pieceendinput.dependent.doublebin.parameter(1).fit,'sigmoid') == 1
            parameter1 = pieceendinput.dependent.doublebin.parameter(1).parameter(3) - pieceendinput.dependent.doublebin.parameter(1).parameter(4) * log ( (pieceendinput.dependent.doublebin.parameter(1).parameter(2) / (secondbinvalue - pieceendinput.dependent.doublebin.parameter(1).parameter(1))) - 1);
        end
        if strcmp(pieceendinput.dependent.doublebin.parameter(2).fit,'linear') == 1
            parameter2 = (pieceendinput.dependent.doublebin.parameter(2).parameter(1) * secondbinvalue) + pieceendinput.dependent.doublebin.parameter(2).parameter(2);
        elseif strcmp(pieceendinput.dependent.doublebin.parameter(2).fit,'exponential') == 1
            if ~isnan(pieceendinput.dependent.doublebin.parameter(2).parameter(3))
                parameter2 = pieceendinput.dependent.doublebin.parameter(2).parameter(1) * exp(secondbinvalue * pieceendinput.dependent.doublebin.parameter(2).parameter(2));
            else
                parameter2 = pieceendinput.dependent.doublebin.parameter(2).parameter(1) * exp(secondbinvalue * pieceendinput.dependent.doublebin.parameter(2).parameter(2));
            end
        elseif strcmp(pieceendinput.dependent.doublebin.parameter(2).fit,'power') == 1
            if ~isnan(pieceendinput.dependent.doublebin.parameter(2).parameter(3))
                parameter2 = pieceendinput.dependent.doublebin.parameter(2).parameter(1) * (secondbinvalue ^ pieceendinput.dependent.doublebin.parameter(2).parameter(2));
            else
                parameter2 = pieceendinput.dependent.doublebin.parameter(2).parameter(1) * (secondbinvalue ^ pieceendinput.dependent.doublebin.parameter(2).parameter(2));
            end
        elseif strcmp(pieceendinput.dependent.doublebin.parameter(2).fit,'sigmoid') == 1
            parameter2 = pieceendinput.dependent.doublebin.parameter(2).parameter(3) - pieceendinput.dependent.doublebin.parameter(2).parameter(4) * log ( (pieceendinput.dependent.doublebin.parameter(2).parameter(2) / (secondbinvalue - pieceendinput.dependent.doublebin.parameter(2).parameter(1))) - 1);
        end
        if strcmp(pieceendinput.dependent.doublebin.parameter(3).fit,'linear') == 1
            parameter3 = (pieceendinput.dependent.doublebin.parameter(3).parameter(1) * secondbinvalue) + pieceendinput.dependent.doublebin.parameter(3).parameter(2);
        elseif strcmp(pieceendinput.dependent.doublebin.parameter(3).fit,'exponential') == 1
            if ~isnan(pieceendinput.dependent.doublebin.parameter(3).parameter(3))
                parameter3 = pieceendinput.dependent.doublebin.parameter(3).parameter(1) * exp(secondbinvalue * pieceendinput.dependent.doublebin.parameter(3).parameter(2));
            else
                parameter3 = pieceendinput.dependent.doublebin.parameter(3).parameter(1) * exp(secondbinvalue * pieceendinput.dependent.doublebin.parameter(3).parameter(2));
            end
        elseif strcmp(pieceendinput.dependent.doublebin.parameter(3).fit,'power') == 1
            if ~isnan(pieceendinput.dependent.doublebin.parameter(3).parameter(3))
                parameter3 = pieceendinput.dependent.doublebin.parameter(3).parameter(1) * (secondbinvalue ^ pieceendinput.dependent.doublebin.parameter(3).parameter(2));
            else
                parameter3 = pieceendinput.dependent.doublebin.parameter(3).parameter(1) * (secondbinvalue ^ pieceendinput.dependent.doublebin.parameter(3).parameter(2));
            end
        elseif strcmp(pieceendinput.dependent.doublebin.parameter(3).fit,'sigmoid') == 1
            parameter3 = pieceendinput.dependent.doublebin.parameter(3).parameter(3) - pieceendinput.dependent.doublebin.parameter(3).parameter(4) * log ( (pieceendinput.dependent.doublebin.parameter(3).parameter(2) / (secondbinvalue - pieceendinput.dependent.doublebin.parameter(3).parameter(1))) - 1);
        else
            parameter3 = NaN;
        end
        if strcmp(pieceendinput.dependent.doublebin.parameter(4).fit,'linear') == 1
            parameter4 = (pieceendinput.dependent.doublebin.parameter(4).parameter(1) * secondbinvalue) + pieceendinput.dependent.doublebin.parameter(4).parameter(2);
        elseif strcmp(pieceendinput.dependent.doublebin.parameter(4).fit,'exponential') == 1
            if ~isnan(pieceendinput.dependent.doublebin.parameter(4).parameter(3))
                parameter4 = pieceendinput.dependent.doublebin.parameter(4).parameter(1) * exp(secondbinvalue * pieceendinput.dependent.doublebin.parameter(4).parameter(2));
            else
                parameter4 = pieceendinput.dependent.doublebin.parameter(4).parameter(1) * exp(secondbinvalue * pieceendinput.dependent.doublebin.parameter(4).parameter(2));
            end
        elseif strcmp(pieceendinput.dependent.doublebin.parameter(4).fit,'power') == 1
            if ~isnan(pieceendinput.dependent.doublebin.parameter(4).parameter(3))
                parameter4 = pieceendinput.dependent.doublebin.parameter(4).parameter(1) * (secondbinvalue ^ pieceendinput.dependent.doublebin.parameter(4).parameter(2));
            else
                parameter4 = pieceendinput.dependent.doublebin.parameter(4).parameter(1) * (secondbinvalue ^ pieceendinput.dependent.doublebin.parameter(4).parameter(2));
            end
        elseif strcmp(pieceendinput.dependent.doublebin.parameter(4).fit,'sigmoid') == 1
            parameter4 = pieceendinput.dependent.doublebin.parameter(4).parameter(3) - pieceendinput.dependent.doublebin.parameter(4).parameter(4) * log ( (pieceendinput.dependent.doublebin.parameter(4).parameter(2) / (secondbinvalue - pieceendinput.dependent.doublebin.parameter(4).parameter(1))) - 1);
        else
            parameter4 = NaN;
        end
        
        if strcmp(pieceendinput.dependent.doublebin.firstfit,'linear') == 1
            pieceendprob = refvalue * ((parameter1 * firstbinvalue) + parameter2);
        elseif strcmp(pieceendinput.dependent.doublebin.firstfit,'exponential') == 1
            if ~isnan(parameter3)
                pieceendprob = refvalue * (parameter3 + parameter1  * exp(firstbinvalue * parameter2));
            else
                pieceendprob = refvalue * (parameter1  * exp(firstbinvalue * parameter2));
            end
        elseif strcmp(pieceendinput.dependent.doublebin.firstfit,'power') == 1
            if ~isnan(parameter3)
                pieceendprob = refvalue * (parameter3 + parameter1 * (firstbinvalue ^ parameter2));
            else
                pieceendprob = refvalue * (parameter1 * (firstbinvalue ^ parameter2));
            end
        elseif strcmp(pieceendinput.dependent.doublebin.firstfit,'sigmoid') == 1
            pieceendprob = refvalue * (parameter3 - parameter4 * log( (parameter2 / (firstbinvalue - parameter1)) - 1));
        else
            disp('Error: first variable fit not defined.')
            keyboard;
        end
    else
        disp('Error in piecegenerator.m');
        keyboard;
    end
end


if isnan(pieceendprob) || ~isreal(pieceendprob)
    disp('      Error in piecegenerator end prob.');
    keyboard;
end

if ~strcmp(pieceendinput.mode,'linearregression') % && ~strcmp(pieceendinput.dependent.singlebin.dependent,'branchproximalpathlength') && ~strcmp(pieceendinput.dependent.singlebin.dependent,'branchproximaldiameter')
    if testvalue < pieceendprob
        if strcmp(typepiece(currentpiece).branchtype,'b')
            typepiece(currentpiece).distaltype = 'bifurcation';
        elseif strcmp(typepiece(currentpiece).branchtype,'t')
            typepiece(currentpiece).distaltype = 'termination';
        else
            disp('Error in piecegenerator.');
            keyboard;
        end
    end
else
    if branchtestvalue < pieceendprob
        if strcmp(typepiece(currentpiece).branchtype,'b')
            typepiece(currentpiece).distaltype = 'bifurcation';
        elseif strcmp(typepiece(currentpiece).branchtype,'t')
            typepiece(currentpiece).distaltype = 'termination';
        else
            disp('Error in piecegenerator.');
            keyboard;
        end
    end
end




if strcmp(typepiece(currentpiece).branchtype,'b')
    if typepiece(currentpiece).distaldiameter < typeinput.minbifurcationdiameter && typepiece(currentpiece).distaldiameter > typeinput.mindiameter
        typepiece(currentpiece).distaltype = 'bifurcation';
        disp(sprintf('       Warning: early bifurcation due to minimum diameter. Neuron: %.0f  Piece: %.0f',mnnum,currentpiece));
    end
end

if typepiece(currentpiece).proximaldiameter <= typeinput.mindiameter || typepiece(currentpiece).distaldiameter <= typeinput.mindiameter
    if typepiece(currentpiece).proximaldiameter <= typeinput.mindiameter
        if strcmp(typepiece(currentpiece).proximaltype,'primary    ') == 1 || strcmp(typepiece(currentpiece).proximaltype,'daughter1  ') == 1 || strcmp(typepiece(currentpiece).proximaltype,'daughter2  ') == 1
            %disp(' ');
            disp('       Warning: proximal diameter of daughter is less than minimum.')
            disp(sprintf('%s %.0f','         Motoneuron number:',mnnum));
            disp(sprintf('%s %.0f','         Piece number     :',currentpiece));
            disp(sprintf('%s %.2f','         Proximal diameter:',typepiece(currentpiece).proximaldiameter));
            if typepiece(currentpiece).parent > 0
                disp(sprintf('%s %.2f','         Parent Diameter  :',typepiece(typepiece(currentpiece).parent).distaldiameter));
                disp(sprintf('%s %.2f','         Rall Ratio       :',typepiece(typepiece(currentpiece).parent).rallratio));
                disp(sprintf('%s %.2f','         Daughter Ratio   :',typepiece(typepiece(currentpiece).parent).daughterratio));
            else
                disp('         Parent is the soma.');
            end
            
            %disp(' ');
        end
    end
    typepiece(currentpiece).distaltype       = 'termination';
    typepiece(currentpiece).earlytermination = 1;
    if strcmp(typepiece(currentpiece).branchtype,'b') == 1
        disp('       Error: bifurcating branch terminated.');
        disp(sprintf('         Branch Initial Diameter: %f',typepiece(firstpiece).proximaldiameter));
        disp(sprintf('         Branch Final Diameter  : %f',typepiece(currentpiece).distaldiameter));
        disp(sprintf('         Branch Length: %f',typepiece(currentpiece).distalbranchlength));
        %keyboard;
    else
        disp(sprintf('       Warning: early termination due to minimum diameter. Neuron: %.0f  Piece: %.0f',mnnum,currentpiece));
        %disp(sprintf('         Neuron number: %.0f',mnnum));
        %disp(sprintf('         Piece Number : %.0f',currentpiece));
    end
end

if typepiece(currentpiece).distaldiameter <= 0
    %disp(' ');
    disp('       Warning: piece distal diameter is less than zero.')
    if strcmp(typepiece(currentpiece).branchtype,'b') == 1
        disp('       Error: bifurcating branch terminated.');
    end
    disp(sprintf('         %s %.0f','         Motoneuron number:',mnnum));
    disp(sprintf('         %s %.0f','         Piece number     :',currentpiece));
    disp(sprintf('         %s %.2f','         Proximal diameter:',typepiece(currentpiece).proximaldiameter));
    disp(sprintf('         %s %.2f','         Distal diameter  :',typepiece(currentpiece).distaldiameter));
    disp(sprintf('         %s %.2f','         Taper Rate       :',typepiece(currentpiece).taperrate));
    %disp(' ');
    typepiece(currentpiece).distaltype       = 'termination';
    typepiece(currentpiece).earlytermination = 1;
    keyboard
end

