% branchgenerator

% ------------------------------------------------------------------------
% Begin generating a branch.
%
% The current piece being generated is always one more than the number of
% pieces already created.
%
% The first piece of any branch is important for several calculations,
% so its ID is remembered.
% ------------------------------------------------------------------------

%disp(sprintf('%s %.0f','       Branch Number:',max(cat(1,mnpop.mn(mnnum).piece.cable))));

if ~exist('typepiece','var')
    currentpiece = 1;
    firstpiece = 1;
    typepiece(currentpiece).cable = 1;
else
    currentpiece=length(typepiece)+1;
    firstpiece=currentpiece;
end

% branchtestvalue = rand;
% branchtestvalue2 = randn;
% 
% bifbranchtestvalue = 1000;
% while bifbranchtestvalue > 918.4
%     bifbranchtestvalue = lognrnd(4.8026,0.8287);
% end
% 
% termbranchtestvalue = 2000;
% while termbranchtestvalue > 1641
%     termbranchtestvalue = lognrnd(5.770,0.8916);
% end

bifbranchtestvalue  = lognrnd(typeinput.piecebifprob.lognormal.mean,typeinput.piecebifprob.lognormal.std);
termbranchtestvalue = lognrnd(typeinput.piecetermprob.lognormal.mean,typeinput.piecetermprob.lognormal.std);


% ------------------------------------------------------------------------
% If the first piece comes from the soma, set the piece properties
% accordingly.
% ------------------------------------------------------------------------

if strcmp(istrunk,'y')

    istrunk = 'n';
    typepiece(currentpiece).cable                   = max(cat(1,typepiece.cable))+1;
    typepiece(currentpiece).parent                  = 0;
    typepiece(currentpiece).proximaltype            = 'primary    ';
    typepiece(currentpiece).distaltype              = [];
    typepiece(currentpiece).proximalxposition       = currenttype.trunk.proximalxposition(pdnum);
    typepiece(currentpiece).proximalyposition       = currenttype.trunk.proximalyposition(pdnum);
    typepiece(currentpiece).proximalzposition       = currenttype.trunk.proximalzposition(pdnum);
    typepiece(currentpiece).proximaldiameter        = currenttype.trunk.diameters(pdnum);
    typepiece(currentpiece).proximalpathlength      = 0;
    typepiece(currentpiece).branchorder             = 1;
	typepiece(currentpiece).branchtype              = branchtypefunction(typepiece(currentpiece).proximaldiameter,typepiece(currentpiece).proximalpathlength,typepiece(currentpiece).branchorder,typeinput.probability.branch);
	typepiece(currentpiece).proximalbranchlength    = 0;
    typepiece(currentpiece).branchsurfacearea       = 0;
    typepiece(currentpiece).branchvolume            = 0;
    
	piecelength = piecelengthfunction(typeinput.piecelength,typeinput.mindiameter,typepiece(currentpiece).proximaldiameter);
    taperrate   = taperratefunction(typepiece(currentpiece).branchtype,typepiece(currentpiece).proximaldiameter,typepiece(currentpiece).proximalpathlength,typeinput,piecelength);
    
    typepiece(currentpiece).elevation               = currenttype.trunk.elevation(pdnum);
    typepiece(currentpiece).azimuth                 = currenttype.trunk.azimuth(pdnum);

    typepiece(currentpiece).earlytermination        = [];

    [xdirection, ...
     ydirection, ...
     zdirection]   = directionfunction(currenttype.trunk.elevation(pdnum),currenttype.trunk.azimuth(pdnum));
    
    clear branchproximalpathlength;
    branchproximalpathlength = typepiece(currentpiece).proximalpathlength;
    clear branchproximaldiameter;
    branchproximaldiameter = typepiece(currentpiece).proximaldiameter;
    piecegenerator;

    % ------------------------------------------------------------------------
    % If the first piece comes from a bifurcation, set the piece properties
    % accordingly.
    % ------------------------------------------------------------------------

elseif strcmp(typepiece(endpiece).distaltype,'bifurcation') == 1

    %---------------------------------------------------------------------
    % If this piece immediately follows its parent, then it is the first
    % daughter, otherwise it is the second daughter.
    % --------------------------------------------------------------------

    if currentpiece == endpiece+1
        typepiece(currentpiece).proximaltype = 'daughter1  ';
        typepiece(endpiece).daughter1 = currentpiece;
        firstdaughterdiameter = '';
        firstdaughterxdirection = '';
        firstdaughterydirection = '';
        firstdaughterzdirection = '';
    else
        if typepiece(endpiece).daughters ~= 1
            disp('Error: adding second daughter branch to inappropriate bifurcation piece.');
            disp('See ''branchgenerator.m''.');
            keyboard;
        end
        typepiece(currentpiece).proximaltype = 'daughter2  ';
        typepiece(endpiece).daughter2 = currentpiece;
        firstdaughterdiameter   = typepiece(endpiece+1).proximaldiameter;
        firstdaughterxdirection = typepiece(endpiece+1).xdirection;
        firstdaughterydirection = typepiece(endpiece+1).ydirection;
        firstdaughterzdirection = typepiece(endpiece+1).zdirection;
    end

    typepiece(currentpiece).cable                   = max(cat(1,typepiece.cable))+1;
    typepiece(currentpiece).parent                  = endpiece;
    typepiece(currentpiece).proximaltype            = typepiece(currentpiece).proximaltype;
    typepiece(currentpiece).proximalxposition       = typepiece(endpiece).distalxposition;
    typepiece(currentpiece).proximalyposition       = typepiece(endpiece).distalyposition;
    typepiece(currentpiece).proximalzposition       = typepiece(endpiece).distalzposition;
    typepiece(currentpiece).proximaldiameter        = daughterdiameterfunction(typepiece(endpiece).daughters,typepiece(endpiece).daughterratio,typepiece(endpiece).rallratio,typeinput.rallratio.rallexponent,typepiece(endpiece).distaldiameter,firstdaughterdiameter);
    typepiece(currentpiece).proximalpathlength      = typepiece(endpiece).distalpathlength;
    typepiece(currentpiece).branchorder             = typepiece(endpiece).branchorder+1;
	typepiece(currentpiece).branchtype              = branchtypefunction(typepiece(currentpiece).proximaldiameter,typepiece(currentpiece).proximalpathlength,typepiece(currentpiece).branchorder,typeinput.probability.branch);
    typepiece(currentpiece).proximalbranchlength    = 0;
    typepiece(currentpiece).branchsurfacearea       = 0;
    typepiece(currentpiece).branchvolume            = 0;
    
	piecelength = piecelengthfunction(typeinput.piecelength,typeinput.mindiameter,typepiece(currentpiece).proximaldiameter);
    taperrate   = taperratefunction(typepiece(currentpiece).branchtype,typepiece(currentpiece).proximaldiameter,typepiece(currentpiece).proximalpathlength,typeinput,piecelength);

    [typepiece(currentpiece).elevation ...
     typepiece(currentpiece).azimuth]               = daughterdirectionfunction(typepiece(endpiece).daughters,typeinput.daughterangle,typepiece(endpiece).elevation,typepiece(endpiece).azimuth,firstdaughterxdirection,firstdaughterydirection,firstdaughterzdirection);
     typepiece(currentpiece).earlytermination        = [];

    [xdirection, ...
        ydirection, ...
        zdirection]  = directionfunction(typepiece(currentpiece).elevation,typepiece(currentpiece).azimuth);
    
    clear branchproximalpathlength;
    branchproximalpathlength = typepiece(currentpiece).proximalpathlength;
    clear branchproximaldiameter;
    branchproximaldiameter = typepiece(currentpiece).proximaldiameter;
    piecegenerator;
    typepiece(endpiece).daughters               = typepiece(endpiece).daughters+1;

    if currentpiece ~= endpiece+1
        typepiece(endpiece).daughter1diameter    = firstdaughterdiameter;
        typepiece(endpiece).daughter2diameter    = typepiece(currentpiece).proximaldiameter;
        typepiece(endpiece).daughter1xdirection  = firstdaughterxdirection;
        typepiece(endpiece).daughter1ydirection  = firstdaughterydirection;
        typepiece(endpiece).daughter1zdirection  = firstdaughterzdirection;
        typepiece(endpiece).daughter2xdirection  = typepiece(currentpiece).xdirection;
        typepiece(endpiece).daughter2ydirection  = typepiece(currentpiece).ydirection;
        typepiece(endpiece).daughter2zdirection  = typepiece(currentpiece).zdirection;
        typepiece(endpiece).daughterratio        = max(typepiece(endpiece).daughter1diameter,typepiece(endpiece).daughter2diameter) / min(typepiece(endpiece).daughter1diameter,typepiece(endpiece).daughter2diameter);
        typepiece(endpiece).rallratio            = ((typepiece(endpiece).daughter1diameter^1.5 + typepiece(endpiece).daughter2diameter^1.5)) / (typepiece(endpiece).distaldiameter^1.5);
        typepiece(endpiece).rallratio1           = ((typepiece(endpiece).daughter1diameter^1.0 + typepiece(endpiece).daughter2diameter^1.0)) / (typepiece(endpiece).distaldiameter^1.0);
        typepiece(endpiece).rallratio2           = ((typepiece(endpiece).daughter1diameter^2.0 + typepiece(endpiece).daughter2diameter^2.0)) / (typepiece(endpiece).distaldiameter^2.0);
		typepiece(endpiece).rallratio3           = ((typepiece(endpiece).daughter1diameter^3.0 + typepiece(endpiece).daughter2diameter^3.0)) / (typepiece(endpiece).distaldiameter^3.0);
        typepiece(endpiece).parentdaughterratio  = typepiece(endpiece).distaldiameter / typepiece(endpiece).daughter1diameter;
        typepiece(endpiece).parentdaughter2ratio = typepiece(endpiece).distaldiameter / typepiece(endpiece).daughter2diameter;
    end

  
    % ------------------------------------------------------------------------
    % If the first piece comes from a termination, display an error message.
    % ------------------------------------------------------------------------

elseif strcmp(typepiece(endpiece).distaltype,'termination') == 1
    disp('Error: termination found in branchgenerator.');
    disp('See ''branchgenerator.m''');
    keyboard;

    % ------------------------------------------------------------------------
    % If the first piece comes from anything other than the soma, an empty
    % bifurcation, or a branch-to-terminate, display an error message.
    % ------------------------------------------------------------------------

else
    disp('Error: last piece not identified.');
    disp('See ''branchgenerator.m''.');
    keyboard;
end

while strcmp(typepiece(currentpiece).distaltype,'bifurcation')==0 && strcmp(typepiece(currentpiece).distaltype,'termination')==0

    % --------------------------------------------------------------------
    % If the diameter of the current piece is below the minimum value,
    % the current piece becomes a termination.
    % --------------------------------------------------------------------

    if typepiece(currentpiece).proximaldiameter < typeinput.mindiameter || typepiece(currentpiece).distaldiameter < typeinput.mindiameter

        currentpiece = length(typepiece) + 1;

        typepiece(currentpiece).cable                   = typepiece(currentpiece-1).cable;
        typepiece(currentpiece).parent                  = currentpiece-1;
        typepiece(currentpiece).distaltype              = 'termination';
        typepiece(currentpiece).proximalxposition       = typepiece(currentpiece-1).distalxposition;
        typepiece(currentpiece).proximalyposition       = typepiece(currentpiece-1).distalyposition;
        typepiece(currentpiece).proximalzposition       = typepiece(currentpiece-1).distalzposition;
        typepiece(currentpiece).proximaldiameter        = typepiece(currentpiece-1).distaldiameter;
        typepiece(currentpiece).branchorder             = typepiece(currentpiece-1).branchorder;
		typepiece(currentpiece).branchtype              = typepiece(currentpiece-1).branchtype;
        typepiece(currentpiece).proximalpathlength      = typepiece(currentpiece-1).distalpathlength;
		typepiece(currentpiece).proximalbranchlength    = typepiece(currentpiece-1).distalbranchlength;
        typepiece(currentpiece).branchsurfacearea       = typepiece(currentpiece-1).branchsurfacearea;
        typepiece(currentpiece).branchvolume            = typepiece(currentpiece-1).branchvolume;

		piecelength = piecelengthfunction(typeinput.piecelength,typeinput.mindiameter,typepiece(currentpiece).proximaldiameter);
        taperrate   = taperratefunction(typepiece(currentpiece).branchtype,typepiece(currentpiece).proximaldiameter,typepiece(currentpiece).proximalpathlength,typeinput,piecelength);
        
        [typepiece(currentpiece).elevation, ...
            typepiece(currentpiece).azimuth]                = meanderfunction(typeinput.meanderangle,typepiece(currentpiece-1).elevation,typepiece(currentpiece-1).azimuth,piecelength);
        
        typepiece(currentpiece).earlytermination        = 1;
        keyboard;

        [xdirection, ...
            ydirection, ...
            zdirection]  = directionfunction(typepiece(currentpiece).elevation,typepiece(currentpiece).azimuth);

        piecegenerator;

        % --------------------------------------------------------------------
        % If the diameter of the current piece is above the minimum value,
        % the current piece is added as a normal piece.
        % --------------------------------------------------------------------

    else

        %disp(sprintf('%s %.0f','         Piece Number:',length(typepiece)+1));
        currentpiece = length(typepiece)+1;

        typepiece(currentpiece).cable                   = typepiece(currentpiece-1).cable;
        typepiece(currentpiece).parent                  = currentpiece-1;
        typepiece(currentpiece).proximalxposition       = typepiece(currentpiece-1).distalxposition;
        typepiece(currentpiece).proximalyposition       = typepiece(currentpiece-1).distalyposition;
        typepiece(currentpiece).proximalzposition       = typepiece(currentpiece-1).distalzposition;
        typepiece(currentpiece).proximaldiameter        = typepiece(currentpiece-1).distaldiameter;
        typepiece(currentpiece).branchorder             = typepiece(currentpiece-1).branchorder;
		typepiece(currentpiece).branchtype              = typepiece(currentpiece-1).branchtype;
        typepiece(currentpiece).proximalpathlength      = typepiece(currentpiece-1).distalpathlength;
		typepiece(currentpiece).proximalbranchlength    = typepiece(currentpiece-1).distalbranchlength;
        typepiece(currentpiece).branchsurfacearea       = typepiece(currentpiece-1).branchsurfacearea;
        typepiece(currentpiece).branchvolume            = typepiece(currentpiece-1).branchvolume;

        piecelength = piecelengthfunction(typeinput.piecelength,typeinput.mindiameter,typepiece(currentpiece).proximaldiameter);
		taperrate   = taperratefunction(typepiece(currentpiece).branchtype,typepiece(currentpiece).proximaldiameter,typepiece(currentpiece).proximalpathlength,typeinput,piecelength);	
		
        [typepiece(currentpiece).elevation, ...
            typepiece(currentpiece).azimuth]                = meanderfunction(typeinput.meanderangle,typepiece(currentpiece-1).elevation,typepiece(currentpiece-1).azimuth,piecelength);

        [xdirection, ...
            ydirection, ...
            zdirection]  = directionfunction(typepiece(currentpiece).elevation,typepiece(currentpiece).azimuth);

        piecegenerator;

        % --------------------------------------------------------------------
        % End of the addition of a piece.  Go back to while loop until sampled
        % bifurcation or termination.
        % --------------------------------------------------------------------

    end
    
    
    % -----------------------------------------------------------------
    % End of the branch.
    % -----------------------------------------------------------------
end


if strcmp(typepiece(currentpiece).distaltype,'bifurcation')==1
    typepiece(currentpiece).daughters     = 0;
    if isfield(typeinput,'daughterdiameter')
        if strcmp(typeinput.daughterdiameter.mode,'parentdaughter')
            [typepiece(currentpiece).rallratio, ...
             typepiece(currentpiece).daughterratio] = parentdaughterratiofunction(typepiece(currentpiece).distaldiameter,typepiece(currentpiece).distalpathlength,typeinput);   
        else
            typepiece(currentpiece).rallratio     = rallratiofunction(typepiece(currentpiece).distaldiameter,typepiece(currentpiece).distalpathlength,typeinput.rallratio);
            typepiece(currentpiece).daughterratio = daughterratiofunction(typepiece(currentpiece).distaldiameter,typepiece(currentpiece).distalpathlength,typepiece(currentpiece).rallratio,typeinput);
        end
    else
        typepiece(currentpiece).rallratio     = rallratiofunction(typepiece(currentpiece).distaldiameter,typepiece(currentpiece).distalpathlength,typeinput.rallratio);
        typepiece(currentpiece).daughterratio = daughterratiofunction(typepiece(currentpiece).distaldiameter,typepiece(currentpiece).distalpathlength,typepiece(currentpiece).rallratio,typeinput);
    end
end

% ------------------------------------------------------------------------
% Set the endpiece for 'backupscript' (if this is a termination) or for
% 'branchgenerator' (if this is a bifurcation).

% Clear the variables used in 'branchgenerator'.
% ------------------------------------------------------------------------

endpiece = currentpiece;
clear currentpiece firstpiece cumbranchlength branchlength threshold;