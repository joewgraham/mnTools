function [data,analysis] = somaanalyzer(mnpop,data,analysis)

disp('   Soma analysis started.');

warning('off', 'MATLAB:divideByZero');

mnoptions;

piecetypes{1} = 'soma';
piecetypes{2} = 'axon';
piecetypes{3} = 'dendrite';
piecetypes{4} = 'apical';

theta = linspace(0,2*pi(),8);

for i = 1:length(data.individual)
    
    if isfield(mnpop.mn(i).soma,'points')
        
        if size(mnpop.mn(i).soma.points,1) > 1
            
            somapoints = mnpop.mn(i).soma.points;
            data.individual(i).soma.points = somapoints;
            
            if size(somapoints,1) > 2
                
                x = somapoints(:,1);
                y = somapoints(:,2);
                z = somapoints(:,3);
                
                
                A2 = x(1:end-1).*y(2:end)-x(2:end).*y(1:end-1);
                A2s = sum(A2)/2;
                x_bar = (sum((x(2:end)+x(1:end-1)).*A2)*1/6)/A2s;
                y_bar = (sum((y(2:end)+y(1:end-1)).*A2)*1/6)/A2s;
                data.individual(i).soma.centroid = [x_bar y_bar ((min(z)+max(z))/2)];
                data.individual(i).soma.centroidx = x_bar;
                data.individual(i).soma.centroidy = y_bar;
                data.individual(i).soma.centroidz = ((min(z)+max(z))/2);
                
                data.individual(i).soma.csa = polyarea(x,y);
                
                xc = x - x_bar;
                yc = y - y_bar;
                xc = [xc; xc(1)];
                yc = [yc; yc(1)];
                step = (max(yc)-min(yc)) / 20;
                cylindercenters = [min(yc)+step/2:step:max(yc)-step/2];
                somavolume = 0;
                for cyl = 1:length(cylindercenters)
                    linex = [-1000; 1000];
                    liney = [cylindercenters(cyl); cylindercenters(cyl)];
                    [xint,yint] = polyxpoly(linex,liney,xc,yc);
                    rad = range(xint)/2;
                    cylindervolume = pi()*rad*rad*step;
                    somavolume = somavolume + cylindervolume;
                end
                
                data.individual(i).soma.volume = somavolume;
                data.individual(i).soma.diameter = (somavolume * (6/pi()))^(1/3);
                
                axonpoints = [];
                if isfield(mnpop.mn(i),'axon')
                    axoncount = 0;
                    for axon = 1:length(mnpop.mn(i).axon)
                        if strcmp('primary    ',mnpop.mn(i).axon(axon).proximaltype)
                            axoncount = axoncount + 1;
                            axonxposition(axoncount) = mnpop.mn(i).axon(axon).proximalxposition;
                            axonyposition(axoncount) = mnpop.mn(i).axon(axon).proximalyposition;
                            axonzposition(axoncount) = mnpop.mn(i).axon(axon).proximalzposition;
                            axonxdirection(axoncount) = mnpop.mn(i).axon(axon).xdirection;
                            axonydirection(axoncount) = mnpop.mn(i).axon(axon).ydirection;
                            axonzdirection(axoncount) = mnpop.mn(i).axon(axon).zdirection;
                            axondiameter(axoncount) = mnpop.mn(i).axon(axon).proximaldiameter;
                            
                            v = null([axonxdirection(axoncount), axonydirection(axoncount), axonzdirection(axoncount)]);
                            axonpoints = [axonpoints; (repmat([axonxposition(axoncount); axonyposition(axoncount); axonzposition(axoncount)],1,size(theta,2))+(axondiameter(axoncount)/2)*(v(:,1)*cos(theta)+v(:,2)*sin(theta)))'];
                        end
                    end
                else
                    axonxposition = [];
                    axonyposition = [];
                    axonzposition = [];
                end
                
                dendritepoints = [];
                if isfield(mnpop.mn(i),'dendrite')
                    dendritecount = 0;
                    for dendrite = 1:length(mnpop.mn(i).dendrite)
                        if strcmp('primary    ',mnpop.mn(i).dendrite(dendrite).proximaltype)
                            dendritecount = dendritecount + 1;
                            dendritexposition(dendritecount) = mnpop.mn(i).dendrite(dendrite).proximalxposition;
                            dendriteyposition(dendritecount) = mnpop.mn(i).dendrite(dendrite).proximalyposition;
                            dendritezposition(dendritecount) = mnpop.mn(i).dendrite(dendrite).proximalzposition;
                            dendritexdirection(dendritecount) = mnpop.mn(i).dendrite(dendrite).xdirection;
                            dendriteydirection(dendritecount) = mnpop.mn(i).dendrite(dendrite).ydirection;
                            dendritezdirection(dendritecount) = mnpop.mn(i).dendrite(dendrite).zdirection;
                            dendritediameter(dendritecount) = mnpop.mn(i).dendrite(dendrite).proximaldiameter;
                            
                            v = null([dendritexdirection(dendritecount), dendriteydirection(dendritecount), dendritezdirection(dendritecount)]);
                            dendritepoints = [dendritepoints; (repmat([dendritexposition(dendritecount); dendriteyposition(dendritecount); dendritezposition(dendritecount)],1,size(theta,2))+(dendritediameter(dendritecount)/2)*(v(:,1)*cos(theta)+v(:,2)*sin(theta)))'];
                            
                        end
                    end
                else
                    dendritexposition = [];
                    dendriteyposition = [];
                    dendritezposition = [];
                end
                
                apicalpoints = [];
                if isfield(mnpop.mn(i),'apical')
                    apicalcount = 0;
                    for apical = 1:length(mnpop.mn(i).apical)
                        if strcmp('primary    ',mnpop.mn(i).apical(apical).proximaltype)
                            apicalcount = apicalcount + 1;
                            apicalxposition(apicalcount) = mnpop.mn(i).apical(apical).proximalxposition;
                            apicalyposition(apicalcount) = mnpop.mn(i).apical(apical).proximalyposition;
                            apicalzposition(apicalcount) = mnpop.mn(i).apical(apical).proximalzposition;
                            apicalxdirection(apicalcount) = mnpop.mn(i).apical(apical).xdirection;
                            apicalydirection(apicalcount) = mnpop.mn(i).apical(apical).ydirection;
                            apicalzdirection(apicalcount) = mnpop.mn(i).apical(apical).zdirection;
                            apicaldiameter(apicalcount) = mnpop.mn(i).apical(apical).proximaldiameter;
                            
                            v = null([apicalxdirection(apicalcount), apicalydirection(apicalcount), apicalzdirection(apicalcount)]);
                            apicalpoints = [apicalpoints; (repmat([apicalxposition(apicalcount); apicalyposition(apicalcount); apicalzposition(apicalcount)],1,size(theta,2))+(apicaldiameter(apicalcount)/2)*(v(:,1)*cos(theta)+v(:,2)*sin(theta)))'];
                            
                        end
                    end
                else
                    apicalxposition = [];
                    apicalyposition = [];
                    apicalzposition = [];
                end
                
                allpoints = [x, y, z; apicalxposition', apicalyposition', apicalzposition'; dendritexposition', dendriteyposition', dendritezposition'; axonxposition', axonyposition', axonzposition'; axonpoints; dendritepoints; apicalpoints];
                [hull, vol] = convhulln(allpoints);
                
                centroid3d = centroid(allpoints(unique(convhulln(allpoints)),:));
                data.individual(i).soma.centroid3d = centroid3d;
                data.individual(i).soma.centroid3dx = centroid3d(1);
                data.individual(i).soma.centroid3dy = centroid3d(2);
                data.individual(i).soma.centroid3dz = centroid3d(3);
                
                data.individual(i).soma.volume3d = vol;
                data.individual(i).soma.diameter3d = (vol * (6/pi()))^(1/3);
                
                data.population.soma.centroid(i,:)  = data.individual(i).soma.centroid;
                data.population.soma.centroidx(i) = data.individual(i).soma.centroidx;
                data.population.soma.centroidy(i) = data.individual(i).soma.centroidy;
                data.population.soma.centroidz(i) = data.individual(i).soma.centroidz;
                data.population.soma.centroid3dx(i) = data.individual(i).soma.centroid3dx;
                data.population.soma.centroid3dy(i) = data.individual(i).soma.centroid3dy;
                data.population.soma.centroid3dz(i) = data.individual(i).soma.centroid3dz;
                data.population.soma.csa(i)      = data.individual(i).soma.csa;
                data.population.soma.volume(i)   = data.individual(i).soma.volume;
                data.population.soma.diameter(i) = data.individual(i).soma.diameter;
                
                analysis.soma.centroid.values(i,:) = data.individual(i).soma.centroid;
                analysis.soma.centroidx.values(i) = data.individual(i).soma.centroidx;
                analysis.soma.centroidy.values(i) = data.individual(i).soma.centroidy;
                analysis.soma.centroidz.values(i) = data.individual(i).soma.centroidz;
                analysis.soma.centroid3d.values(i,:) = data.individual(i).soma.centroid3d;
                analysis.soma.centroid3dx.values(i) = data.individual(i).soma.centroid3dx;
                analysis.soma.centroid3dy.values(i) = data.individual(i).soma.centroid3dy;
                analysis.soma.centroid3dz.values(i) = data.individual(i).soma.centroid3dz;
                
                analysis.soma.centroiddist.values(i) = (sum((data.individual(i).soma.centroid - data.individual(i).soma.centroid3d).^2))^0.5;
                
                analysis.soma.csa.values(i) = data.individual(i).soma.csa;
                analysis.soma.volume.values(i) = data.individual(i).soma.volume;
                analysis.soma.diameter.values(i) = data.individual(i).soma.diameter;
                
            end
        else
            data.individual(i).soma.centroidx   = mnpop.mn(i).soma.centroidx;
            data.individual(i).soma.centroidy   = mnpop.mn(i).soma.centroidy;
            data.individual(i).soma.centroidz   = mnpop.mn(i).soma.centroidz;
            data.individual(i).soma.centroid    = [mnpop.mn(i).soma.centroidx mnpop.mn(i).soma.centroidy mnpop.mn(i).soma.centroidz];
            
            data.individual(i).soma.diameter    = mnpop.mn(i).soma.diameter;
            data.individual(i).soma.csa         = mnpop.mn(i).soma.csa;
            data.individual(i).soma.volume      = mnpop.mn(i).soma.volume;
            
            data.population.soma.centroid(i,:)  = data.individual(i).soma.centroid;
            data.population.soma.centroidx(i)   = data.individual(i).soma.centroidx;
            data.population.soma.centroidy(i)   = data.individual(i).soma.centroidy;
            data.population.soma.centroidz(i)   = data.individual(i).soma.centroidz;
            
            data.population.soma.csa(i)         = data.individual(i).soma.csa;
            data.population.soma.volume(i)      = data.individual(i).soma.volume;
            data.population.soma.diameter(i)    = data.individual(i).soma.diameter;
            
            analysis.soma.centroid.values(i,:)  = data.individual(i).soma.centroid;
            analysis.soma.centroidx.values(i)   = data.individual(i).soma.centroidx;
            analysis.soma.centroidy.values(i)   = data.individual(i).soma.centroidy;
            analysis.soma.centroidz.values(i)   = data.individual(i).soma.centroidz;
            
            analysis.soma.csa.values(i)         = data.individual(i).soma.csa;
            analysis.soma.volume.values(i)      = data.individual(i).soma.volume;
            analysis.soma.diameter.values(i)    = data.individual(i).soma.diameter;
        end
    else
        data.individual(i).soma.centroidx   = mnpop.mn(i).soma.centroidx;
        data.individual(i).soma.centroidy   = mnpop.mn(i).soma.centroidy;
        data.individual(i).soma.centroidz   = mnpop.mn(i).soma.centroidz;
        data.individual(i).soma.centroid    = [mnpop.mn(i).soma.centroidx mnpop.mn(i).soma.centroidy mnpop.mn(i).soma.centroidz];
        
        data.individual(i).soma.diameter    = mnpop.mn(i).soma.diameter;
        data.individual(i).soma.csa         = mnpop.mn(i).soma.csa;
        data.individual(i).soma.volume      = mnpop.mn(i).soma.volume;
        
        data.population.soma.centroid(i,:)  = data.individual(i).soma.centroid;
        data.population.soma.centroidx(i)   = data.individual(i).soma.centroidx;
        data.population.soma.centroidy(i)   = data.individual(i).soma.centroidy;
        data.population.soma.centroidz(i)   = data.individual(i).soma.centroidz;
        
        data.population.soma.csa(i)         = data.individual(i).soma.csa;
        data.population.soma.volume(i)      = data.individual(i).soma.volume;
        data.population.soma.diameter(i)    = data.individual(i).soma.diameter;
        
        analysis.soma.centroid.values(i,:)  = data.individual(i).soma.centroid;
        analysis.soma.centroidx.values(i)   = data.individual(i).soma.centroidx;
        analysis.soma.centroidy.values(i)   = data.individual(i).soma.centroidy;
        analysis.soma.centroidz.values(i)   = data.individual(i).soma.centroidz;
        
        analysis.soma.csa.values(i)         = data.individual(i).soma.csa;
        analysis.soma.volume.values(i)      = data.individual(i).soma.volume;
        analysis.soma.diameter.values(i)    = data.individual(i).soma.diameter;
        
    end
end




warning('on', 'MATLAB:divideByZero');
