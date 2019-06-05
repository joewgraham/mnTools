function [mnpop,data] = obliquefinder(mnpop,data)

disp('   Oblique finding started.');

warning('off', 'MATLAB:divideByZero');

piecetypes{1} = 'soma';
piecetypes{2} = 'axon';
piecetypes{3} = 'dendrite';
piecetypes{4} = 'apical';

for mnnum = 1:length(mnpop.mn)
    
    if isfield(mnpop.mn(mnnum),'apical')
        
        for i = 1:length(mnpop.mn(mnnum).apical)
            mnpop.mn(mnnum).apical(i).oblique = false;
        end
        
        clear indcables;
        indcables = data.individual(mnnum).apical.cablebins;
        
        for cable = 1:length(indcables)
            
            if strcmp(indcables(cable).proximaltype,'daughter   ') || strcmp(indcables(cable).proximaltype,'daughter1  ') || strcmp(indcables(cable).proximaltype,'daughter2  ')
                
                if indcables(indcables(cable).parent).surfaceasymmetry > 0.5
                    
                    otherdaughter = indcables(indcables(cable).parent).daughters(indcables(indcables(cable).parent).daughters~=indcables(cable).id);
                    if indcables(cable).treesurface < indcables(otherdaughter).treesurface
                        
                        if (indcables(cable).proximalpathlength < 0.7 * data.individual(mnnum).apical.maxpathlength) && (indcables(cable).distalpathlength < 0.7 * data.individual(mnnum).apical.maxpathlength)
                            
                            if indcables(cable).degree < 20
                                
                                
                                    
                                    indcables(cable).oblique = true;
                                    for piece = 1:length(indcables(cable).piece)
                                        mnpop.mn(mnnum).apical(indcables(cable).piece(piece).id).oblique = true;
                                    end
                                    for legacy = 1:length(indcables(cable).legacy)
                                        currentcable = indcables(cable).legacy(legacy);
                                        indcables(currentcable).oblique = true;
                                        for piece = 1:length(indcables(currentcable).piece)
                                            mnpop.mn(mnnum).apical(indcables(currentcable).piece(piece).id).oblique = true;
                                        end
                                    end
                                    
                                
                            end
                        end
                    end
                elseif strcmp(indcables(indcables(cable).parent).distaltype,'m-furcation')
                    otherdaughters = indcables(indcables(cable).parent).daughters(indcables(indcables(cable).parent).daughters~=indcables(cable).id);
                    for combo = 1:length(otherdaughters)
                        surfaceasymmetry(combo) = (indcables(cable).treesurface - indcables(otherdaughters(combo)).treesurface) / (indcables(cable).treesurface + indcables(otherdaughters(combo)).treesurface);
                    end
                    if min(surfaceasymmetry) < -0.5
                        
                        if indcables(cable).proximalpathlength < 0.7 * data.individual(mnnum).apical.maxpathlength && (indcables(cable).distalpathlength < 0.7 * data.individual(mnnum).apical.maxpathlength)
                            
                            indcables(cable).oblique = true;
                            for piece = 1:length(indcables(cable).piece)
                                mnpop.mn(mnnum).apical(indcables(cable).piece(piece).id).oblique = true;
                            end
                            for legacy = 1:length(indcables(cable).legacy)
                                currentcable = indcables(cable).legacy(legacy);
                                indcables(currentcable).oblique = true;
                                for piece = 1:length(indcables(currentcable).piece)
                                    mnpop.mn(mnnum).apical(indcables(currentcable).piece(piece).id).oblique = true;
                                end
                            end
                            
                        end
                        
                    end
                end
                
                
            end
        end
    end
    data.individual(mnnum).apical.cablebins = indcables;
end

%mnpop.mn = mnpop.mn(1:10);

exportapicalswcdata(mnpop,data);
exportapicalnonobliqueswcdata(mnpop,data);

warning('on', 'MATLAB:divideByZero');
