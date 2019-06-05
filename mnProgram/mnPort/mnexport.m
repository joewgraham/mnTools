function mnexport(mnpop)

if nargin ~= 1
    disp(' ');
    disp('  You must enter the name of a ');
    disp('  neuronal population.');
    disp(' ');
    disp('  Please start over.');
    disp(' ');
    return;
end

disp(' ');
disp('  ------------------------------------');
disp('   mnExport');
disp('  ------------------------------------');
disp('    Enter export type:');
disp('      1. ''.csv'' piece data');
disp('      2. ''.csv'' cable data');
disp('      3. ''.swc'' neurons');
disp('      4. ''.h5'' neurons');
disp('      5. MorphML neurons');
disp('      6. Growth frames');
disp(' ');
disp('    Please enter the number of the');
exporttype = input('    export type to perform: ');
if isempty(exporttype) == 1
    disp(' ');
    disp('  Will export growth frames.');
    exporttype = 6;
    %disp(' ');
    %disp('  You must enter a valid number to continue.');
    %disp('  Please start over.');
    %return;
elseif sum(ismember(exporttype,[1 2 3 4 5 6])) ~= length(exporttype)
    disp(' ');
    disp('  You must enter a valid number to continue.');
    disp('  Please start over.');
    return;
end


if length(mnpop.mn) == 1
    exportpop = mnpop;
else
    disp('  ------------------------------------');
    disp('   Neurons to Export');
    disp('  ------------------------------------');
    disp('    Neurons in population:');
    
    for i = 1:length(mnpop.mn)
        if i < 10
            disp(sprintf('      %.0f. %s',i,mnpop.mn(i).filename));
        else
            disp(sprintf('     %.0f. %s',i,mnpop.mn(i).filename));
        end
    end
    
    if i < 10
        disp(sprintf('      %.0f. Export all',i+1));
    else
        disp(sprintf('     %.0f. Export all',i+1));
    end
    disp(' ');
    disp('    Please enter the numbers of the');
    exportnumbers = input('    neurons to export in square brackets: ');
    if isempty(exportnumbers) == 1
        exportnumbers = i+1;
        %disp(' ');
        %disp('  You must enter a valid number to continue.');
        %disp('  Please start over.');
        %return;
    end
    
    if ismember(i+1,exportnumbers)
        exportpop = mnpop;
    elseif ~ismember(i+1,exportnumbers)
        mns = mnpop.mn(exportnumbers);
        exportpop = rmfield(mnpop,'mn');
        exportpop.mn = mns;
    end
end

if ismember(1,exporttype)
    exportpiecedata(exportpop);
end
if ismember(2,exporttype)
    disp('Coming soon!');
end
if ismember(3,exporttype)
    exportswcdata(exportpop);
end
if ismember(4,exporttype)
    disp('Coming soon!');
end
if ismember(5,exporttype)
    disp('Coming soon!');
end
if ismember(6,exporttype)
    exportgrowthframes(exportpop);
end




% if strcmp(option.mnexport.piecedata,'n') ~= 1
%     disp('   Exporting piece data.');
%     exportpiecedata(mnpop);
% end
%
% if strcmp(option.mnexport.cabledata,'n') ~= 1
%     disp('   Exporting cable data.');
%     exportcabledata(data);
% end
%
% if strcmp(option.mnexport.swcdata,'n') ~= 1
%     disp('   Exporting swc data.');
%     exportswcdata(mnpop);
% end
%
% if strcmp(option.mnexport.xmldata,'n') ~= 1
%     disp('   Exporting xml data.');
%     exportxmldata(mnpop);
% end



disp('  ------------------------------------');
disp('   Exporting completed.');
disp('  ------------------------------------');
disp(' ');