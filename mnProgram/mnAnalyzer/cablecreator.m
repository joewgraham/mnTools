function [data,analysis] = cablecreator(mnpop,data,analysis)

disp('   Cable creation started.');

piecetypes{1} = 'soma';
piecetypes{2} = 'axon';
piecetypes{3} = 'dendrite';
piecetypes{4} = 'apical';

for i = 1:length(data.individual)
    
    for piecetype = 2:4
    
        if isfield(data.individual(i),piecetypes{piecetype})
        
            currentpiecetype = piecetypes{piecetype};
            clear inddata;
            clear piecedata;
            eval(['inddata = data.individual(i).' currentpiecetype ';']);
            eval(['piecedata = mnpop.mn(i).' currentpiecetype ';']);
            
            inddata.numbertrunks = 0;
                        
            for j = 1:length(inddata.cablebins)

                lastpiece = length(inddata.cablebins(j).piece);
                
                inddata.cablebins(j).motoneuron             = inddata.cablebins(j).piece(1).motoneuron;
                inddata.cablebins(j).id                     = j;
                inddata.cablebins(j).originalid             = inddata.cablebins(j).piece(1).cable;
                if inddata.cablebins(j).piece(1).parent == 0
                    inddata.cablebins(j).originalparent = 0;
                    inddata.cablebins(j).parent         = 0;
                    inddata.numbertrunks = inddata.numbertrunks + 1;
                else
                    inddata.cablebins(j).originalparent = piecedata(inddata.cablebins(j).piece(1).parent).cable;
                    for cable = 1:j-1
                        if inddata.cablebins(j).originalparent == inddata.cablebins(cable).originalid
                            inddata.cablebins(j).parent = inddata.cablebins(cable).id;
                        end
                    end
                end
                inddata.cablebins(j).trunk                  = inddata.cablebins(j).piece(1).trunk;
                inddata.cablebins(j).branchorder            = inddata.cablebins(j).piece(1).branchorder;
                inddata.cablebins(j).proximalxdirection     = inddata.cablebins(j).piece(1).xdirection;
                inddata.cablebins(j).proximalydirection     = inddata.cablebins(j).piece(1).ydirection;
                inddata.cablebins(j).proximalzdirection     = inddata.cablebins(j).piece(1).zdirection;
                inddata.cablebins(j).distalxdirection       = inddata.cablebins(j).piece(lastpiece).xdirection;
                inddata.cablebins(j).distalydirection       = inddata.cablebins(j).piece(lastpiece).ydirection;
                inddata.cablebins(j).distalzdirection       = inddata.cablebins(j).piece(lastpiece).zdirection;
                inddata.cablebins(j).proximaltype           = inddata.cablebins(j).piece(1).proximaltype;
                inddata.cablebins(j).distaltype             = inddata.cablebins(j).piece(lastpiece).distaltype;
                inddata.cablebins(j).proximaldiameter       = inddata.cablebins(j).piece(1).proximaldiameter;
                inddata.cablebins(j).distaldiameter         = inddata.cablebins(j).piece(lastpiece).distaldiameter;
                inddata.cablebins(j).proximalpathlength     = inddata.cablebins(j).piece(1).proximalpathlength;
                inddata.cablebins(j).distalpathlength       = inddata.cablebins(j).piece(lastpiece).distalpathlength;
                inddata.cablebins(j).proximalradialdistance = inddata.cablebins(j).piece(1).proximalradialdistance;
                inddata.cablebins(j).distalradialdistance   = inddata.cablebins(j).piece(lastpiece).distalradialdistance;
                inddata.cablebins(j).proximaltaperrate      = inddata.cablebins(j).piece(1).taperrate;
                inddata.cablebins(j).distaltaperrate        = inddata.cablebins(j).piece(lastpiece).taperrate;

                inddata.cablebins(j).length      = 0;
                inddata.cablebins(j).surfacearea = 0;
                inddata.cablebins(j).volume      = 0;

                if inddata.cablebins(j).piece(1).parent == 0
                    inddata.cablebins(j).ancestry = [];
                else
                    inddata.cablebins(j).ancestry = [inddata.cablebins(inddata.cablebins(j).parent).ancestry inddata.cablebins(j).parent];
                end


                for k = 1:length(inddata.cablebins(j).piece)

                    inddata.cablebins(j).length      = inddata.cablebins(j).length      + inddata.cablebins(j).piece(k).length;
                    inddata.cablebins(j).surfacearea = inddata.cablebins(j).surfacearea + inddata.cablebins(j).piece(k).surfacearea;
                    inddata.cablebins(j).volume      = inddata.cablebins(j).volume      + inddata.cablebins(j).piece(k).volume;

                    if k == length(inddata.cablebins(j).piece)

                        inddata.cablebins(j).cylindricaldiameter  = ((4*inddata.cablebins(j).volume)/(pi()*inddata.cablebins(j).length))^0.5;
                        inddata.cablebins(j).taperrate            = (inddata.cablebins(j).proximaldiameter - inddata.cablebins(j).distaldiameter)/inddata.cablebins(j).length;
                        inddata.cablebins(j).taperratio           = (inddata.cablebins(j).proximaldiameter - inddata.cablebins(j).distaldiameter)/inddata.cablebins(j).proximaldiameter;

                        if strcmp(inddata.cablebins(j).distaltype,'bifurcation') == 1
                            inddata.cablebins(j).rallratio            = inddata.cablebins(j).piece(k).rallratio;
                            inddata.cablebins(j).rallratio1           = inddata.cablebins(j).piece(k).rallratio1;
                            inddata.cablebins(j).rallratio2           = inddata.cablebins(j).piece(k).rallratio2;
                            inddata.cablebins(j).rallratio3           = inddata.cablebins(j).piece(k).rallratio3;
                            inddata.cablebins(j).originaldaughters    = [piecedata(inddata.cablebins(j).piece(k).daughter1).cable piecedata(inddata.cablebins(j).piece(k).daughter2).cable];
                            inddata.cablebins(j).originaldaughter1    = piecedata(inddata.cablebins(j).piece(k).daughter1).cable;
                            inddata.cablebins(j).originaldaughter2    = piecedata(inddata.cablebins(j).piece(k).daughter2).cable;
                            inddata.cablebins(j).daughters            = [];
                            inddata.cablebins(j).daughter1            = [];
                            inddata.cablebins(j).daughter2            = [];
                            inddata.cablebins(j).daughter1diameter    = inddata.cablebins(j).piece(k).daughter1diameter;
                            inddata.cablebins(j).daughter2diameter    = inddata.cablebins(j).piece(k).daughter2diameter;
                            inddata.cablebins(j).daughterratio        = inddata.cablebins(j).piece(k).daughterratio;
                            inddata.cablebins(j).parentdaughterratio  = inddata.cablebins(j).piece(k).parentdaughterratio;
                            inddata.cablebins(j).parentdaughter2ratio = inddata.cablebins(j).piece(k).parentdaughter2ratio;
                        elseif strcmp(inddata.cablebins(j).distaltype,'termination') == 1
                            inddata.cablebins(j).rallratio            = [];
                            inddata.cablebins(j).rallratio1           = [];
                            inddata.cablebins(j).rallratio2           = [];
                            inddata.cablebins(j).rallratio3           = [];
                            inddata.cablebins(j).originaldaughters    = [];
                            inddata.cablebins(j).originaldaughter1    = [];
                            inddata.cablebins(j).originaldaughter2    = [];
                            inddata.cablebins(j).daughters            = [];
                            inddata.cablebins(j).daughter1            = [];
                            inddata.cablebins(j).daughter2            = [];
                            inddata.cablebins(j).daughter1diameter    = [];
                            inddata.cablebins(j).daughter2diameter    = [];
                            inddata.cablebins(j).daughterratio        = [];
                            inddata.cablebins(j).parentdaughterratio  = [];
                            inddata.cablebins(j).parentdaughter2ratio = [];
                            inddata.cablebins(j).partitionasymmetry   = [];
                            inddata.cablebins(j).surfaceasymmetry     = [];
                        elseif strcmp(inddata.cablebins(j).distaltype,'m-furcation') == 1
                            % If Rall ratio is calculated for
                            % multifurcations in 'piecebinner.m' then it
                            % should be included here.
                            inddata.cablebins(j).rallratio            = [];
                            inddata.cablebins(j).rallratio1           = [];
                            inddata.cablebins(j).rallratio2           = [];
                            inddata.cablebins(j).rallratio3           = [];
                            inddata.cablebins(j).originaldaughters    = [];
                            inddata.cablebins(j).originaldaughter1    = [];
                            inddata.cablebins(j).originaldaughter2    = [];
                            inddata.cablebins(j).daughters            = [];
                            inddata.cablebins(j).daughter1            = [];
                            inddata.cablebins(j).daughter2            = [];
                            inddata.cablebins(j).daughter1diameter    = [];
                            inddata.cablebins(j).daughter2diameter    = [];
                            inddata.cablebins(j).daughterratio        = [];
                            inddata.cablebins(j).parentdaughterratio  = [];
                            inddata.cablebins(j).parentdaughter2ratio = [];
                            inddata.cablebins(j).partitionasymmetry   = [];
                            inddata.cablebins(j).surfaceasymmetry     = [];
                            for d = 1:length(inddata.cablebins(j).piece(k).daughters)
                                inddata.cablebins(j).originaldaughters(d) = piecedata(inddata.cablebins(j).piece(k).daughters(d)).cable;
                            end
                        else
                            disp('     Error in ''cablecreator.m'' branch type.');
                            keyboard
                        end

                    end
                end
                if inddata.cablebins(j).parent ~= 0
                    if inddata.cablebins(inddata.cablebins(j).parent).originaldaughter1 == inddata.cablebins(j).originalid
                        inddata.cablebins(inddata.cablebins(j).parent).daughter1 = inddata.cablebins(j).id;
                    end
                    if inddata.cablebins(inddata.cablebins(j).parent).originaldaughter2 == inddata.cablebins(j).originalid
                        inddata.cablebins(inddata.cablebins(j).parent).daughter2 = inddata.cablebins(j).id;
                    end
                    if strcmp(inddata.cablebins(inddata.cablebins(j).parent).distaltype,'bifurcation') || strcmp(inddata.cablebins(inddata.cablebins(j).parent).distaltype,'m-furcation')
                        if ismember(inddata.cablebins(j).originalid,inddata.cablebins(inddata.cablebins(j).parent).originaldaughters)
                            inddata.cablebins(inddata.cablebins(j).parent).daughters = [inddata.cablebins(inddata.cablebins(j).parent).daughters inddata.cablebins(j).id];
                        end
                    end
                end
            end

            for m = length(inddata.cablebins):-1:1

                if strcmp(inddata.cablebins(m).distaltype,'termination')
                    inddata.cablebins(m).degree = 1;
                    inddata.cablebins(m).legacy = inddata.cablebins(m).id;
                    inddata.cablebins(m).treesurface = inddata.cablebins(m).surfacearea;
                elseif strcmp(inddata.cablebins(m).distaltype,'bifurcation')
                    inddata.cablebins(m).degree = inddata.cablebins(inddata.cablebins(m).daughter1).degree + inddata.cablebins(inddata.cablebins(m).daughter2).degree;
                    inddata.cablebins(m).legacy = [inddata.cablebins(m).id inddata.cablebins(inddata.cablebins(m).daughter1).legacy inddata.cablebins(inddata.cablebins(m).daughter2).legacy];
                    treesurface = 0;
                    for t=1:length(inddata.cablebins(m).legacy)
                        treesurface = treesurface + inddata.cablebins(inddata.cablebins(m).legacy(t)).surfacearea;
                    end
                    inddata.cablebins(m).treesurface = treesurface;
                    clear treesurface;
                    degree1 = inddata.cablebins(inddata.cablebins(m).daughter1).degree;
                    degree2 = inddata.cablebins(inddata.cablebins(m).daughter2).degree;
                    if degree1 == 1 && degree2 == 1	
                        inddata.cablebins(m).partitionasymmetry = 0;
                    else
                        inddata.cablebins(m).partitionasymmetry = abs(degree1 - degree2) / (degree1 + degree2 - 2); 
                    end
                    clear degree1 degree2;
                    treesa1 = inddata.cablebins(inddata.cablebins(m).daughter1).treesurface;
                    treesa2 = inddata.cablebins(inddata.cablebins(m).daughter2).treesurface;
                    inddata.cablebins(m).surfaceasymmetry = abs(treesa1 - treesa2) / (treesa1 + treesa2); 
                elseif strcmp(inddata.cablebins(m).distaltype,'m-furcation')
                    inddata.cablebins(m).degree = 0;
                    inddata.cablebins(m).legacy = [inddata.cablebins(m).id];
                    for d=1:length(inddata.cablebins(m).daughters)
                       inddata.cablebins(m).degree = inddata.cablebins(m).degree + inddata.cablebins(inddata.cablebins(m).daughters(d)).degree;
                       inddata.cablebins(m).legacy = [inddata.cablebins(m).legacy inddata.cablebins(inddata.cablebins(m).daughters(d)).legacy];
                    end
                    treesurface = 0;
                    for t=1:length(inddata.cablebins(m).legacy)
                        treesurface = treesurface + inddata.cablebins(inddata.cablebins(m).legacy(t)).surfacearea;
                    end
                    inddata.cablebins(m).treesurface = treesurface;
                    clear treesurface;
                    inddata.cablebins(m).partitionasymmetry = NaN;
                    inddata.cablebins(m).surfaceasymmetry = NaN;
                else
                    disp('Error in cable creator.');
                    keyboard;
                end
            end
            inddata.maxdegree = max([inddata.cablebins.degree]);
            inddata.numbersegments = length(inddata.cablebins);
            eval(['data.individual(i).' currentpiecetype ' = inddata;']);
        end
        %eval(['data.individual(i).' currentpiecetype ' = inddata;']);
    end
end


% popbifurcationasymmetry = 0;
% popsurfaceasymmetry     = 0;
% popbifurcations         = 0;
% for i = 1:length(data.individual)
	% indbifurcationasymmetry = 0;
	% indsurfaceasymmetry     = 0;
	% indbifurcations         = 0;
	% for j = 2:length(inddata.cablebins)
		% if strcmp(inddata.cablebins(j).distaltype,'bifurcation')
			% indbifurcations = indbifurcations + 1;
			% popbifurcations = popbifurcations + 1;			
			% indbifurcationasymmetry = indbifurcationasymmetry + inddata.cablebins(j).partitionasymmetry;
			% indsurfaceasymmetry     = indsurfaceasymmetry + inddata.cablebins(j).surfacepartitionasymmetry;
			% popbifurcationasymmetry = popbifurcationasymmetry + inddata.cablebins(j).partitionasymmetry;
			% popsurfaceasymmetry     = popsurfaceasymmetry + inddata.cablebins(j).surfacepartitionasymmetry;
		% end
	% end
	% analysis.




