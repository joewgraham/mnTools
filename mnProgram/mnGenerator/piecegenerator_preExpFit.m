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
%typepiece(currentpiece).branchlength            = (typepiece(currentpiece).proximalbranchlength + typepiece(currentpiece).distalbranchlength) /2;

if strcmp(typepiece(currentpiece).proximaltype,'primary    ') || strcmp(typepiece(currentpiece).proximaltype,'daughter1  ') || strcmp(typepiece(currentpiece).proximaltype,'daughter2  ')
    typepiece(currentpiece).dparentangle = NaN;
else
    typepiece(currentpiece).dparentangle = vectoranglefunction(typepiece(currentpiece).xdirection,typepiece(currentpiece).ydirection,typepiece(currentpiece).zdirection,typepiece(typepiece(currentpiece).parent).xdirection,typepiece(typepiece(currentpiece).parent).ydirection,typepiece(typepiece(currentpiece).parent).zdirection);
end

%disp(sprintf('             Length:    %f',typepiece(currentpiece).length));
%disp(sprintf('             Prox Diam: %f',typepiece(currentpiece).proximaldiameter));
%disp(sprintf('             Dist Diam: %f',typepiece(currentpiece).distaldiameter));


testvalue = rand;
clear piecebifprob piecetermprob;

if strcmp(typepiece(currentpiece).branchtype,'b') == 1
    
    if strcmp(typeinput.piecebifprob.mode,'independent')
        
        if strcmp(typeinput.piecebifprob.distribution,'exponential')
            if strcmp(typeinput.piecebifprob.by,'length')
                refvalue = typepiece(currentpiece).distalbranchlength;
            elseif strcmp(typeinput.piecebifprob.by,'volume')
                refvalue = typepiece(currentpiece).branchvolume;
            else
               disp('Problem with piecebifprob.by.'); 
            end
                
            piecebifprob = cdf('exp',refvalue,typeinput.piecebifprob.mu);
            
            
        else
            if strcmp(typeinput.piecebifprob.distribution,'pearson') == 1
                lastwarn('');
                [blank,type] = pearsrnd(mean,sd,skew,kurt,0,0);
                [lastmsg, lastid] = lastwarn;
                if strcmp(lastid,'MATLAB:divideByZero') == 1 || isnan(type) == 1
                    disp('       Sampled bif prob from normal instead of Pearson.');
                    typeinput.piecebifprob.distribution = 'normal';
                end
            end
            piecebifprob = samplefunction(typeinput.piecebifprob);
        end
    elseif strcmp(input.dendrite.piecebifprob.mode,'linearregress');
        
        if strcmp('branchlength',typeinput.piecebifprob.by)
            eval(['byvalue = typepiece(currentpiece).distal' typeinput.piecebifprob.by ';']);
        else
            eval(['byvalue = typepiece(currentpiece).' typeinput.piecebifprob.by ';']);
        end
        
        mu = input.dendrite.piecebifprob.linreg.constant + ...
            input.dendrite.piecebifprob.linreg.diameter*branchproximaldiameter + ...
            input.dendrite.piecebifprob.linreg.pathlength*branchproximalpathlength + ...
            input.dendrite.piecebifprob.linreg.branchorder*typepiece(currentpiece).branchorder + ...
            input.dendrite.piecebifprob.linreg.diampathinter*(branchproximaldiameter*branchproximalpathlength);
        
        if mu > 0
            piecebifprob = cdf('exp',byvalue,mu);
        else
            piecebifprob = 1;
            disp('       Warning: piecebifprob set to certainty due to subzero probability.');
        end
        
    else
        clear byvalue;
        eval(['byvalue = typepiece(currentpiece).' typeinput.piecebifprob.dependent.mean.by ';']);
        if strcmp(typeinput.piecebifprob.dependent.mean.type,'singlebin')
            clear singlebinvalue;
            if strcmp(typeinput.piecebifprob.dependent.singlebin.dependent,'branchorder')
                singlebinvalue = typepiece(currentpiece).branchorder;
            %new stuff
            elseif strcmp(typeinput.piecebifprob.dependent.singlebin.dependent,'branchproximalpathlength')
                singlebinvalue = branchproximalpathlength;
                %singlebinvalue = typepiece(currentpiece).proximalpathlength;                
            elseif strcmp(typeinput.piecebifprob.dependent.singlebin.dependent,'branchproximaldiameter')
                singlebinvalue = branchproximaldiameter;
                %singlebinvalue = typepiece(currentpiece).proximaldiameter;
            %end new stuff    
            else
                eval(['singlebinvalue = typepiece(currentpiece).distal' typeinput.piecebifprob.dependent.singlebin.dependent ';']);
            end
            
            if ~strcmp(typeinput.piecebifprob.dependent.singlebin.dependent,'branchproximalpathlength') && ~strcmp(typeinput.piecebifprob.dependent.singlebin.dependent,'branchproximaldiameter')
                if strcmp(typeinput.piecebifprob.dependent.singlebin.fit,'linear') == 1
                    piecebifprob = byvalue * ((typeinput.piecebifprob.dependent.singlebin.parameter(1) * singlebinvalue) + typeinput.piecebifprob.dependent.singlebin.parameter(2));
                elseif strcmp(typeinput.piecebifprob.dependent.singlebin.fit,'exponential') == 1
                    if ~isnan(typeinput.piecebifprob.dependent.singlebin.parameter(3))
                        piecebifprob = byvalue * (typeinput.piecebifprob.dependent.singlebin.parameter(3) + typeinput.piecebifprob.dependent.singlebin.parameter(1) * exp(singlebinvalue * typeinput.piecebifprob.dependent.singlebin.parameter(2)));
                    else
                        piecebifprob = byvalue * (typeinput.piecebifprob.dependent.singlebin.parameter(1) * exp(singlebinvalue * typeinput.piecebifprob.dependent.singlebin.parameter(2)));
                    end
                elseif strcmp(typeinput.piecebifprob.dependent.singlebin.fit,'power') == 1
                    if ~isnan(typeinput.piecebifprob.dependent.singlebin.parameter(3))
                        piecebifprob = byvalue * (typeinput.piecebifprob.dependent.singlebin.parameter(3) + typeinput.piecebifprob.dependent.singlebin.parameter(1) * (singlebinvalue ^ typeinput.piecebifprob.dependent.singlebin.parameter(2)));
                    else
                        piecebifprob = byvalue * (typeinput.piecebifprob.dependent.singlebin.parameter(1) * (singlebinvalue ^ typeinput.piecebifprob.dependent.singlebin.parameter(2)));
                    end
                elseif strcmp(typeinput.piecebifprob.dependent.singlebin.fit,'sigmoid') == 1
                    piecebifprob = byvalue * (typeinput.piecebifprob.dependent.singlebin.parameter(3) - typeinput.piecebifprob.dependent.singlebin.parameter(4) * log( (typeinput.piecebifprob.dependent.singlebin.parameter(2) / (singlebinvalue - typeinput.piecebifprob.dependent.singlebin.parameter(1))) - 1 ));
                else
                    disp('Error in piecegenerator.')
                    keyboard;
                end
            else
                %new stuff
                if strcmp(typeinput.piecebifprob.dependent.singlebin.fit,'linear') == 1
                    mu = ((typeinput.piecebifprob.dependent.singlebin.parameter(1) * singlebinvalue) + typeinput.piecebifprob.dependent.singlebin.parameter(2));
                elseif strcmp(typeinput.piecebifprob.dependent.singlebin.fit,'exponential') == 1
                    if ~isnan(typeinput.piecebifprob.dependent.singlebin.parameter(3))
                        mu = (typeinput.piecebifprob.dependent.singlebin.parameter(3) + typeinput.piecebifprob.dependent.singlebin.parameter(1) * exp(singlebinvalue * typeinput.piecebifprob.dependent.singlebin.parameter(2)));
                    else
                        mu = (typeinput.piecebifprob.dependent.singlebin.parameter(1) * exp(singlebinvalue * typeinput.piecebifprob.dependent.singlebin.parameter(2)));
                    end
                elseif strcmp(typeinput.piecebifprob.dependent.singlebin.fit,'power') == 1
                    if ~isnan(typeinput.piecebifprob.dependent.singlebin.parameter(3))
                        mu = (typeinput.piecebifprob.dependent.singlebin.parameter(3) + typeinput.piecebifprob.dependent.singlebin.parameter(1) * (singlebinvalue ^ typeinput.piecebifprob.dependent.singlebin.parameter(2)));
                    else
                        mu = (typeinput.piecebifprob.dependent.singlebin.parameter(1) * (singlebinvalue ^ typeinput.piecebifprob.dependent.singlebin.parameter(2)));
                    end
                elseif strcmp(typeinput.piecebifprob.dependent.singlebin.fit,'sigmoid') == 1
                    mu = (typeinput.piecebifprob.dependent.singlebin.parameter(3) - typeinput.piecebifprob.dependent.singlebin.parameter(4) * log( (typeinput.piecebifprob.dependent.singlebin.parameter(2) / (singlebinvalue - typeinput.piecebifprob.dependent.singlebin.parameter(1))) - 1 ));
                else
                    disp('Error in piecegenerator.')
                    keyboard;
                end
                if mu > 0
                    piecebifprob = cdf('exp',byvalue,mu);
                else
                    piecebifprob = 1;
                    disp('       Warning: piecebifprob set to certainty due to subzero probability.');
                end
                %end new stuff
            end
            
        elseif strcmp(typeinput.piecebifprob.dependent.mean.type,'doublebin')
            clear firstbinvalue;
            if strcmp(typeinput.piecebifprob.dependent.doublebin.firstbin,'branchorder')
                firstbinvalue = typepiece(currentpiece).branchorder;
            else
                eval(['firstbinvalue = typepiece(currentpiece).distal' typeinput.piecebifprob.dependent.doublebin.firstbin ';']);
            end
            clear secondbinvalue;
            if strcmp(typeinput.piecebifprob.dependent.doublebin.secondbin,'branchorder')
                secondbinvalue = typepiece(currentpiece).branchorder;
            else
                eval(['secondbinvalue = typepiece(currentpiece).distal' typeinput.piecebifprob.dependent.doublebin.secondbin ';']);
            end
            
            if strcmp(typeinput.piecebifprob.dependent.doublebin.parameter(1).fit,'linear') == 1
                parameter1 = (typeinput.piecebifprob.dependent.doublebin.parameter(1).parameter(1) * secondbinvalue) + typeinput.piecebifprob.dependent.doublebin.parameter(1).parameter(2);
            elseif strcmp(typeinput.piecebifprob.dependent.doublebin.parameter(1).fit,'exponential') == 1
                if ~isnan(typeinput.piecebifprob.dependent.doublebin.parameter(1).parameter(3))
                    parameter1 = typeinput.piecebifprob.dependent.doublebin.parameter(1).parameter(1) * exp(secondbinvalue * typeinput.piecebifprob.dependent.doublebin.parameter(1).parameter(2));
                else
                    parameter1 = typeinput.piecebifprob.dependent.doublebin.parameter(1).parameter(1) * exp(secondbinvalue * typeinput.piecebifprob.dependent.doublebin.parameter(1).parameter(2));
                end
            elseif strcmp(typeinput.piecebifprob.dependent.doublebin.parameter(1).fit,'power') == 1
                if ~isnan(typeinput.piecebifprob.dependent.doublebin.parameter(1).parameter(3))
                    parameter1 = typeinput.piecebifprob.dependent.doublebin.parameter(1).parameter(1) * (secondbinvalue ^ typeinput.piecebifprob.dependent.doublebin.parameter(1).parameter(2));
                else
                    parameter1 = typeinput.piecebifprob.dependent.doublebin.parameter(1).parameter(1) * (secondbinvalue ^ typeinput.piecebifprob.dependent.doublebin.parameter(1).parameter(2));
                end
            elseif strcmp(typeinput.piecebifprob.dependent.doublebin.parameter(1).fit,'sigmoid') == 1
                parameter1 = typeinput.piecebifprob.dependent.doublebin.parameter(1).parameter(3) - typeinput.piecebifprob.dependent.doublebin.parameter(1).parameter(4) * log ( (typeinput.piecebifprob.dependent.doublebin.parameter(1).parameter(2) / (secondbinvalue - typeinput.piecebifprob.dependent.doublebin.parameter(1).parameter(1))) - 1);
            end
            if strcmp(typeinput.piecebifprob.dependent.doublebin.parameter(2).fit,'linear') == 1
                parameter2 = (typeinput.piecebifprob.dependent.doublebin.parameter(2).parameter(1) * secondbinvalue) + typeinput.piecebifprob.dependent.doublebin.parameter(2).parameter(2);
            elseif strcmp(typeinput.piecebifprob.dependent.doublebin.parameter(2).fit,'exponential') == 1
                if ~isnan(typeinput.piecebifprob.dependent.doublebin.parameter(2).parameter(3))
                    parameter2 = typeinput.piecebifprob.dependent.doublebin.parameter(2).parameter(1) * exp(secondbinvalue * typeinput.piecebifprob.dependent.doublebin.parameter(2).parameter(2));
                else
                    parameter2 = typeinput.piecebifprob.dependent.doublebin.parameter(2).parameter(1) * exp(secondbinvalue * typeinput.piecebifprob.dependent.doublebin.parameter(2).parameter(2));
                end
            elseif strcmp(typeinput.piecebifprob.dependent.doublebin.parameter(2).fit,'power') == 1
                if ~isnan(typeinput.piecebifprob.dependent.doublebin.parameter(2).parameter(3))
                    parameter2 = typeinput.piecebifprob.dependent.doublebin.parameter(2).parameter(1) * (secondbinvalue ^ typeinput.piecebifprob.dependent.doublebin.parameter(2).parameter(2));
                else
                    parameter2 = typeinput.piecebifprob.dependent.doublebin.parameter(2).parameter(1) * (secondbinvalue ^ typeinput.piecebifprob.dependent.doublebin.parameter(2).parameter(2));
                end
            elseif strcmp(typeinput.piecebifprob.dependent.doublebin.parameter(2).fit,'sigmoid') == 1
                parameter2 = typeinput.piecebifprob.dependent.doublebin.parameter(2).parameter(3) - typeinput.piecebifprob.dependent.doublebin.parameter(2).parameter(4) * log ( (typeinput.piecebifprob.dependent.doublebin.parameter(2).parameter(2) / (secondbinvalue - typeinput.piecebifprob.dependent.doublebin.parameter(2).parameter(1))) - 1);
            end
            if strcmp(typeinput.piecebifprob.dependent.doublebin.parameter(3).fit,'linear') == 1
                parameter3 = (typeinput.piecebifprob.dependent.doublebin.parameter(3).parameter(1) * secondbinvalue) + typeinput.piecebifprob.dependent.doublebin.parameter(3).parameter(2);
            elseif strcmp(typeinput.piecebifprob.dependent.doublebin.parameter(3).fit,'exponential') == 1
                if ~isnan(typeinput.piecebifprob.dependent.doublebin.parameter(3).parameter(3))
                    parameter3 = typeinput.piecebifprob.dependent.doublebin.parameter(3).parameter(1) * exp(secondbinvalue * typeinput.piecebifprob.dependent.doublebin.parameter(3).parameter(2));
                else
                    parameter3 = typeinput.piecebifprob.dependent.doublebin.parameter(3).parameter(1) * exp(secondbinvalue * typeinput.piecebifprob.dependent.doublebin.parameter(3).parameter(2));
                end
            elseif strcmp(typeinput.piecebifprob.dependent.doublebin.parameter(3).fit,'power') == 1
                if ~isnan(typeinput.piecebifprob.dependent.doublebin.parameter(3).parameter(3))
                    parameter3 = typeinput.piecebifprob.dependent.doublebin.parameter(3).parameter(1) * (secondbinvalue ^ typeinput.piecebifprob.dependent.doublebin.parameter(3).parameter(2));
                else
                    parameter3 = typeinput.piecebifprob.dependent.doublebin.parameter(3).parameter(1) * (secondbinvalue ^ typeinput.piecebifprob.dependent.doublebin.parameter(3).parameter(2));
                end
            elseif strcmp(typeinput.piecebifprob.dependent.doublebin.parameter(3).fit,'sigmoid') == 1
                parameter3 = typeinput.piecebifprob.dependent.doublebin.parameter(3).parameter(3) - typeinput.piecebifprob.dependent.doublebin.parameter(3).parameter(4) * log ( (typeinput.piecebifprob.dependent.doublebin.parameter(3).parameter(2) / (secondbinvalue - typeinput.piecebifprob.dependent.doublebin.parameter(3).parameter(1))) - 1);
            else
                parameter3 = NaN;
            end
            if strcmp(typeinput.piecebifprob.dependent.doublebin.parameter(4).fit,'linear') == 1
                parameter4 = (typeinput.piecebifprob.dependent.doublebin.parameter(4).parameter(1) * secondbinvalue) + typeinput.piecebifprob.dependent.doublebin.parameter(4).parameter(2);
            elseif strcmp(typeinput.piecebifprob.dependent.doublebin.parameter(4).fit,'exponential') == 1
                if ~isnan(typeinput.piecebifprob.dependent.doublebin.parameter(4).parameter(3))
                    parameter4 = typeinput.piecebifprob.dependent.doublebin.parameter(4).parameter(1) * exp(secondbinvalue * typeinput.piecebifprob.dependent.doublebin.parameter(4).parameter(2));
                else
                    parameter4 = typeinput.piecebifprob.dependent.doublebin.parameter(4).parameter(1) * exp(secondbinvalue * typeinput.piecebifprob.dependent.doublebin.parameter(4).parameter(2));
                end
            elseif strcmp(typeinput.piecebifprob.dependent.doublebin.parameter(4).fit,'power') == 1
                if ~isnan(typeinput.piecebifprob.dependent.doublebin.parameter(4).parameter(3))
                    parameter4 = typeinput.piecebifprob.dependent.doublebin.parameter(4).parameter(1) * (secondbinvalue ^ typeinput.piecebifprob.dependent.doublebin.parameter(4).parameter(2));
                else
                    parameter4 = typeinput.piecebifprob.dependent.doublebin.parameter(4).parameter(1) * (secondbinvalue ^ typeinput.piecebifprob.dependent.doublebin.parameter(4).parameter(2));
                end
            elseif strcmp(typeinput.piecebifprob.dependent.doublebin.parameter(4).fit,'sigmoid') == 1
                parameter4 = typeinput.piecebifprob.dependent.doublebin.parameter(4).parameter(3) - typeinput.piecebifprob.dependent.doublebin.parameter(4).parameter(4) * log ( (typeinput.piecebifprob.dependent.doublebin.parameter(4).parameter(2) / (secondbinvalue - typeinput.piecebifprob.dependent.doublebin.parameter(4).parameter(1))) - 1);
            else
                parameter4 = NaN;
            end
            
            if strcmp(typeinput.piecebifprob.dependent.doublebin.firstfit,'linear') == 1
                piecebifprob = byvalue * ((parameter1 * firstbinvalue) + parameter2);
            elseif strcmp(typeinput.piecebifprob.dependent.doublebin.firstfit,'exponential') == 1
                if ~isnan(parameter3)
                    piecebifprob = byvalue * (parameter3 + parameter1  * exp(firstbinvalue * parameter2));
                else
                    piecebifprob = byvalue * (parameter1  * exp(firstbinvalue * parameter2));
                end
            elseif strcmp(typeinput.piecebifprob.dependent.doublebin.firstfit,'power') == 1
                if ~isnan(parameter3)
                    piecebifprob = byvalue * (parameter3 + parameter1 * (firstbinvalue ^ parameter2));
                else
                    piecebifprob = byvalue * (parameter1 * (firstbinvalue ^ parameter2));
                end
            elseif strcmp(typeinput.piecebifprob.dependent.doublebin.firstfit,'sigmoid') == 1
                piecebifprob = byvalue * (parameter3 - parameter4 * log( (parameter2 / (firstbinvalue - parameter1)) - 1));
            else
                disp('Error: first variable fit not defined.')
                keyboard;
            end
        else
            disp('Error in piecegenerator.m');
            keyboard;
        end
    end
    
    %disp(sprintf('Bif Prob: %f',piecebifprob));
    
    if isnan(piecebifprob) || ~isreal(piecebifprob)
        disp('      Error in piecegenerator bif prob.');
        keyboard;
    end
    
    if ~strcmp(input.dendrite.piecebifprob.mode,'linearregress') && ~strcmp(typeinput.piecebifprob.dependent.singlebin.dependent,'branchproximalpathlength') && ~strcmp(typeinput.piecebifprob.dependent.singlebin.dependent,'branchproximaldiameter')
        if testvalue < piecebifprob
            typepiece(currentpiece).distaltype = 'bifurcation';
        end
    else
        if branchtestvalue < piecebifprob
        %if testvalue < piecebifprob
            typepiece(currentpiece).distaltype = 'bifurcation';
        end
    end
    
elseif strcmp(typepiece(currentpiece).branchtype,'t') == 1
    
    if strcmp(typeinput.piecetermprob.mode,'independent')
        
        if strcmp(typeinput.piecetermprob.distribution,'pearson') == 1
            lastwarn('');
            [blank,type] = pearsrnd(mean,sd,skew,kurt,0,0);
            [lastmsg, lastid] = lastwarn;
            if strcmp(lastid,'MATLAB:divideByZero') == 1 || isnan(type) == 1
                disp('       Sampled term prob from normal instead of Pearson.');
                typeinput.piecetermprob.distribution = 'normal';
            end
        end
        piecetermprob = samplefunction(typeinput.piecetermprob);
        
    else
        clear byvalue;
        eval(['byvalue = typepiece(currentpiece).' typeinput.piecetermprob.dependent.mean.by ';']);
        if strcmp(typeinput.piecetermprob.dependent.mean.type,'singlebin')
            clear singlebinvalue;
            if strcmp(typeinput.piecetermprob.dependent.singlebin.dependent,'branchorder')
                singlebinvalue = typepiece(currentpiece).branchorder;
            else
                eval(['singlebinvalue = typepiece(currentpiece).distal' typeinput.piecetermprob.dependent.singlebin.dependent ';']);
            end
            
            if strcmp(typeinput.piecetermprob.dependent.singlebin.fit,'linear') == 1
                piecetermprob = byvalue * ((typeinput.piecetermprob.dependent.singlebin.parameter(1) * singlebinvalue) + typeinput.piecetermprob.dependent.singlebin.parameter(2));
            elseif strcmp(typeinput.piecetermprob.dependent.singlebin.fit,'exponential') == 1
                if ~isnan(typeinput.piecetermprob.dependent.singlebin.parameter(3))
                    piecetermprob = byvalue * (typeinput.piecetermprob.dependent.singlebin.parameter(3) + typeinput.piecetermprob.dependent.singlebin.parameter(1) * exp(singlebinvalue * typeinput.piecetermprob.dependent.singlebin.parameter(2)));
                else
                    piecetermprob = byvalue * (typeinput.piecetermprob.dependent.singlebin.parameter(1) * exp(singlebinvalue * typeinput.piecetermprob.dependent.singlebin.parameter(2)));
                end
            elseif strcmp(typeinput.piecetermprob.dependent.singlebin.fit,'power') == 1
                if ~isnan(typeinput.piecetermprob.dependent.singlebin.parameter(3))
                    piecetermprob = byvalue * (typeinput.piecetermprob.dependent.singlebin.parameter(3) + typeinput.piecetermprob.dependent.singlebin.parameter(1) * (singlebinvalue ^ typeinput.piecetermprob.dependent.singlebin.parameter(2)));
                else
                    piecetermprob = byvalue * (typeinput.piecetermprob.dependent.singlebin.parameter(1) * (singlebinvalue ^ typeinput.piecetermprob.dependent.singlebin.parameter(2)));
                end
            elseif strcmp(typeinput.piecetermprob.dependent.singlebin.fit,'sigmoid') == 1
                piecetermprob = byvalue * (typeinput.piecetermprob.dependent.singlebin.parameter(3) - typeinput.piecetermprob.dependent.singlebin.parameter(4) * log( (typeinput.piecetermprob.dependent.singlebin.parameter(2) / (singlebinvalue - typeinput.piecetermprob.dependent.singlebin.parameter(1))) - 1 ));
            else
                disp('Error in piecegenerator.')
                keyboard;
            end
            
        elseif strcmp(typeinput.piecetermprob.dependent.mean.type,'doublebin')
            clear firstbinvalue;
            eval(['firstbinvalue = typepiece(currentpiece).distal' typeinput.piecetermprob.dependent.doublebin.firstbin ';']);
            clear secondbinvalue;
            eval(['secondbinvalue = typepiece(currentpiece).distal' typeinput.piecetermprob.dependent.doublebin.secondbin ';']);
            
            if strcmp(typeinput.piecetermprob.dependent.doublebin.parameter(1).fit,'linear') == 1
                parameter1 = (typeinput.piecetermprob.dependent.doublebin.parameter(1).parameter(1) * secondbinvalue) + typeinput.piecetermprob.dependent.doublebin.parameter(1).parameter(2);
            elseif strcmp(typeinput.piecetermprob.dependent.doublebin.parameter(1).fit,'exponential') == 1
                if ~isnan(typeinput.piecetermprob.dependent.doublebin.parameter(1).parameter(3))
                    parameter1 = typeinput.piecetermprob.dependent.doublebin.parameter(1).parameter(1) * exp(secondbinvalue * typeinput.piecetermprob.dependent.doublebin.parameter(1).parameter(2));
                else
                    parameter1 = typeinput.piecetermprob.dependent.doublebin.parameter(1).parameter(1) * exp(secondbinvalue * typeinput.piecetermprob.dependent.doublebin.parameter(1).parameter(2));
                end
            elseif strcmp(typeinput.piecetermprob.dependent.doublebin.parameter(1).fit,'power') == 1
                if ~isnan(typeinput.piecetermprob.dependent.doublebin.parameter(1).parameter(3))
                    parameter1 = typeinput.piecetermprob.dependent.doublebin.parameter(1).parameter(1) * (secondbinvalue ^ typeinput.piecetermprob.dependent.doublebin.parameter(1).parameter(2));
                else
                    parameter1 = typeinput.piecetermprob.dependent.doublebin.parameter(1).parameter(1) * (secondbinvalue ^ typeinput.piecetermprob.dependent.doublebin.parameter(1).parameter(2));
                end
            elseif strcmp(typeinput.piecetermprob.dependent.doublebin.parameter(1).fit,'sigmoid') == 1
                parameter1 = typeinput.piecetermprob.dependent.doublebin.parameter(1).parameter(3) - typeinput.piecetermprob.dependent.doublebin.parameter(1).parameter(4) * log ( (typeinput.piecetermprob.dependent.doublebin.parameter(1).parameter(2) / (secondbinvalue - typeinput.piecetermprob.dependent.doublebin.parameter(1).parameter(1))) - 1);
            end
            if strcmp(typeinput.piecetermprob.dependent.doublebin.parameter(2).fit,'linear') == 1
                parameter2 = (typeinput.piecetermprob.dependent.doublebin.parameter(2).parameter(1) * secondbinvalue) + typeinput.piecetermprob.dependent.doublebin.parameter(2).parameter(2);
            elseif strcmp(typeinput.piecetermprob.dependent.doublebin.parameter(2).fit,'exponential') == 1
                if ~isnan(typeinput.piecetermprob.dependent.doublebin.parameter(2).parameter(3))
                    parameter2 = typeinput.piecetermprob.dependent.doublebin.parameter(2).parameter(1) * exp(secondbinvalue * typeinput.piecetermprob.dependent.doublebin.parameter(2).parameter(2));
                else
                    parameter2 = typeinput.piecetermprob.dependent.doublebin.parameter(2).parameter(1) * exp(secondbinvalue * typeinput.piecetermprob.dependent.doublebin.parameter(2).parameter(2));
                end
            elseif strcmp(typeinput.piecetermprob.dependent.doublebin.parameter(2).fit,'power') == 1
                if ~isnan(typeinput.piecetermprob.dependent.doublebin.parameter(2).parameter(3))
                    parameter2 = typeinput.piecetermprob.dependent.doublebin.parameter(2).parameter(1) * (secondbinvalue ^ typeinput.piecetermprob.dependent.doublebin.parameter(2).parameter(2));
                else
                    parameter2 = typeinput.piecetermprob.dependent.doublebin.parameter(2).parameter(1) * (secondbinvalue ^ typeinput.piecetermprob.dependent.doublebin.parameter(2).parameter(2));
                end
            elseif strcmp(typeinput.piecetermprob.dependent.doublebin.parameter(2).fit,'sigmoid') == 1
                parameter2 = typeinput.piecetermprob.dependent.doublebin.parameter(2).parameter(3) - typeinput.piecetermprob.dependent.doublebin.parameter(2).parameter(4) * log ( (typeinput.piecetermprob.dependent.doublebin.parameter(2).parameter(2) / (secondbinvalue - typeinput.piecetermprob.dependent.doublebin.parameter(2).parameter(1))) - 1);
            end
            if strcmp(typeinput.piecetermprob.dependent.doublebin.parameter(3).fit,'linear') == 1
                parameter3 = (typeinput.piecetermprob.dependent.doublebin.parameter(3).parameter(1) * secondbinvalue) + typeinput.piecetermprob.dependent.doublebin.parameter(3).parameter(2);
            elseif strcmp(typeinput.piecetermprob.dependent.doublebin.parameter(3).fit,'exponential') == 1
                if ~isnan(typeinput.piecetermprob.dependent.doublebin.parameter(3).parameter(3))
                    parameter3 = typeinput.piecetermprob.dependent.doublebin.parameter(3).parameter(1) * exp(secondbinvalue * typeinput.piecetermprob.dependent.doublebin.parameter(3).parameter(2));
                else
                    parameter3 = typeinput.piecetermprob.dependent.doublebin.parameter(3).parameter(1) * exp(secondbinvalue * typeinput.piecetermprob.dependent.doublebin.parameter(3).parameter(2));
                end
            elseif strcmp(typeinput.piecetermprob.dependent.doublebin.parameter(3).fit,'power') == 1
                if ~isnan(typeinput.piecetermprob.dependent.doublebin.parameter(3).parameter(3))
                    parameter3 = typeinput.piecetermprob.dependent.doublebin.parameter(3).parameter(1) * (secondbinvalue ^ typeinput.piecetermprob.dependent.doublebin.parameter(3).parameter(2));
                else
                    parameter3 = typeinput.piecetermprob.dependent.doublebin.parameter(3).parameter(1) * (secondbinvalue ^ typeinput.piecetermprob.dependent.doublebin.parameter(3).parameter(2));
                end
            elseif strcmp(typeinput.piecetermprob.dependent.doublebin.parameter(3).fit,'sigmoid') == 1
                parameter3 = typeinput.piecetermprob.dependent.doublebin.parameter(3).parameter(3) - typeinput.piecetermprob.dependent.doublebin.parameter(3).parameter(4) * log ( (typeinput.piecetermprob.dependent.doublebin.parameter(3).parameter(2) / (secondbinvalue - typeinput.piecetermprob.dependent.doublebin.parameter(3).parameter(1))) - 1);
            else
                parameter3 = NaN;
            end
            if strcmp(typeinput.piecetermprob.dependent.doublebin.parameter(4).fit,'linear') == 1
                parameter4 = (typeinput.piecetermprob.dependent.doublebin.parameter(4).parameter(1) * secondbinvalue) + typeinput.piecetermprob.dependent.doublebin.parameter(4).parameter(2);
            elseif strcmp(typeinput.piecetermprob.dependent.doublebin.parameter(4).fit,'exponential') == 1
                if ~isnan(typeinput.piecetermprob.dependent.doublebin.parameter(4).parameter(3))
                    parameter4 = typeinput.piecetermprob.dependent.doublebin.parameter(4).parameter(1) * exp(secondbinvalue * typeinput.piecetermprob.dependent.doublebin.parameter(4).parameter(2));
                else
                    parameter4 = typeinput.piecetermprob.dependent.doublebin.parameter(4).parameter(1) * exp(secondbinvalue * typeinput.piecetermprob.dependent.doublebin.parameter(4).parameter(2));
                end
            elseif strcmp(typeinput.piecetermprob.dependent.doublebin.parameter(4).fit,'power') == 1
                if ~isnan(typeinput.piecetermprob.dependent.doublebin.parameter(4).parameter(3))
                    parameter4 = typeinput.piecetermprob.dependent.doublebin.parameter(4).parameter(1) * (secondbinvalue ^ typeinput.piecetermprob.dependent.doublebin.parameter(4).parameter(2));
                else
                    parameter4 = typeinput.piecetermprob.dependent.doublebin.parameter(4).parameter(1) * (secondbinvalue ^ typeinput.piecetermprob.dependent.doublebin.parameter(4).parameter(2));
                end
            elseif strcmp(typeinput.piecetermprob.dependent.doublebin.parameter(4).fit,'sigmoid') == 1
                parameter4 = typeinput.piecetermprob.dependent.doublebin.parameter(4).parameter(3) - typeinput.piecetermprob.dependent.doublebin.parameter(4).parameter(4) * log ( (typeinput.piecetermprob.dependent.doublebin.parameter(4).parameter(2) / (secondbinvalue - typeinput.piecetermprob.dependent.doublebin.parameter(4).parameter(1))) - 1);
            else
                parameter4 = NaN;
            end
            
            if strcmp(typeinput.piecetermprob.dependent.doublebin.firstfit,'linear') == 1
                piecetermprob = byvalue * ((parameter1 * firstbinvalue) + parameter2);
            elseif strcmp(typeinput.piecetermprob.dependent.doublebin.firstfit,'exponential') == 1
                if ~isnan(parameter3)
                    piecetermprob = byvalue * (parameter3 + parameter1  * exp(firstbinvalue * parameter2));
                else
                    piecetermprob = byvalue * (parameter1  * exp(firstbinvalue * parameter2));
                end
            elseif strcmp(typeinput.piecetermprob.dependent.doublebin.firstfit,'power') == 1
                if ~isnan(parameter3)
                    piecetermprob = byvalue * (parameter3 + parameter1 * (firstbinvalue ^ parameter2));
                else
                    piecetermprob = byvalue * (parameter1 * (firstbinvalue ^ parameter2));
                end
            elseif strcmp(typeinput.piecetermprob.dependent.doublebin.firstfit,'sigmoid') == 1
                piecetermprob = byvalue * (parameter3 - parameter4 * log( (parameter2 / (firstbinvalue - parameter1)) - 1));
            else
                disp('Error: first variable fit not defined.')
                keyboard;
            end
        else
            disp('Error in piecegenerator.m');
            keyboard;
        end
    end
    
    if isnan(piecetermprob) || ~isreal(piecetermprob)
        disp('      Error in piecegenerator term prob.');
        keyboard;
    end
    
    if testvalue < piecetermprob
        typepiece(currentpiece).distaltype = 'termination';
    end
    
else
    disp('Error in piecegenerator.m');
    keyboard;
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
            disp(sprintf('%s %.2f','         Parent Diameter  :',typepiece(typepiece(currentpiece).parent).distaldiameter));
            disp(sprintf('%s %.2f','         Rall Ratio       :',typepiece(typepiece(currentpiece).parent).rallratio));
            disp(sprintf('%s %.2f','         Daughter Ratio   :',typepiece(typepiece(currentpiece).parent).daughterratio));
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
        keyboard;
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

