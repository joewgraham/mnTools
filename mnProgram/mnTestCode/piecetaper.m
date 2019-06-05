function piecetaper(mnpop)

count = 0;

for mnnum = 1:length(mnpop.mn)
    
    clear apical;
    apical = mnpop.mn(mnnum).apical;
    
    for piece = 1:length(apical)
        
        if strcmp(apical(piece).branchtype,'b')
            
            count = count + 1;
            
            taper(count) = apical(piece).taperrate;
            diameter(count) = apical(piece).proximaldiameter;
            taperp(count) = apical(piece).taperrate / diameter(count);
            lengthp(count) = apical(piece).length;
            volume(count) = apical(piece).volume;
        
%             if ~strcmp(apical(piece).proximaltype,'primary    ') && ~strcmp(apical(piece).proximaltype,'daughter   ') && ~strcmp(apical(piece).proximaltype,'daughter1  ') && ~strcmp(apical(piece).proximaltype,'daughter2  ')
%             
%                 count = count + 1;
%                 
%                 taper(count) = apical(piece).taperrate;
%                 parenttaper(count) = apical(apical(piece).parent).taperrate;
%                 
%             end
            
        end
        
    end
    
end

%figure;
%scatter(parenttaper,taper);
            
figure;
scatter(diameter,taper);
figure;
scatter(diameter,taperp);
figure;
scatter(lengthp,taperp);

keyboard