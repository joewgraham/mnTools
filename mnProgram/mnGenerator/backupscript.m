% backupscript

% ------------------------------------------------------------------------
% Check to make sure that the piece to back up from is actually a
% termination.  If it isn't, display an error.
% ------------------------------------------------------------------------

backuppiece=length(typepiece);

if strcmp(typepiece(backuppiece).distaltype,'termination')==0
    disp('Error: attempting to back up (using backupscript.m) from a non-termination');
    keyboard;
end

% ------------------------------------------------------------------------
% Continue backing up as long as the current piece is not a bifurcation or
% the soma.
% ------------------------------------------------------------------------

% if strcmp(typepiece(backuppiece).distaltype,'bifurcation')==1  && typepiece(backuppiece).daughters == 2
%     backuppiece = backuppiece-1;
%     if strcmp(typepiece(backuppiece).distaltype,'bifurcation')==1  && typepiece(backuppiece).daughters == 2
%         backuppiece = backuppiece - 1;
%         if strcmp(typepiece(backuppiece).distaltype,'bifurcation')==1  && typepiece(backuppiece).daughters == 2
%             backuppiece = backuppiece - 1;
%         end
%     end
% end

while strcmp(typepiece(backuppiece).distaltype,'bifurcation')==1  && typepiece(backuppiece).daughters == 2 && strcmp(typepiece(backuppiece).proximaltype,'primary    ')==0
    backuppiece = backuppiece-1;
end

while strcmp(typepiece(backuppiece).distaltype,'bifurcation')==0 && strcmp(typepiece(backuppiece).proximaltype,'primary    ')==0 %strcmp(typepiece(backuppiece).distaltype,'soma       ')==0
    backuppiece=backuppiece-1;
    
    % --------------------------------------------------------------------
    % If a bifurcation point is reached, but it is already filled, 
    % continue backing up.
    % --------------------------------------------------------------------
    
    if strcmp(typepiece(backuppiece).distaltype,'bifurcation')==1
        if typepiece(backuppiece).daughters > 1 && strcmp(typepiece(backuppiece).proximaltype,'primary    ')==0
            backuppiece=backuppiece-1;
            %test
            while strcmp(typepiece(backuppiece).distaltype,'bifurcation')==1  && typepiece(backuppiece).daughters == 2 && strcmp(typepiece(backuppiece).proximaltype,'primary    ')==0
                backuppiece = backuppiece-1;
            end
            %             if strcmp(typepiece(backuppiece).distaltype,'bifurcation')==1  && typepiece(backuppiece).daughters == 2
            %                 backuppiece = backuppiece-1;
            %                 if strcmp(typepiece(backuppiece).distaltype,'bifurcation')==1  && typepiece(backuppiece).daughters == 2
            %                     backuppiece = backuppiece - 1;
            %                     if strcmp(typepiece(backuppiece).distaltype,'bifurcation')==1  && typepiece(backuppiece).daughters == 2
            %                         backuppiece = backuppiece - 1;
            %                     end
            %                 end
            %             end
            %end test
        end
    end
end

% ------------------------------------------------------------------------
% If the soma is reached during back-up, then the current primary
% dendritic tree is complete.
% ------------------------------------------------------------------------

if strcmp(typepiece(backuppiece).proximaltype,'primary    ')                    %if typepiece(backuppiece).distaltype == 'soma       '
    if strcmp(typepiece(backuppiece).distaltype,'bifurcation')~=1       
        treecomplete='y';
    elseif typepiece(backuppiece).daughters == 2
        treecomplete='y';
    end
end

% ------------------------------------------------------------------------
% Set the value of 'endpiece' to that of 'backuppiece'.  Branchgenerator
% uses 'endpiece' to determine how to grow the next branch.
% ------------------------------------------------------------------------

endpiece=backuppiece;