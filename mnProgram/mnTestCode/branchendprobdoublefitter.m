mufunction [x,y,z,w] = branchendprobdoublefitter(cable)

mnoptions;

diameterbinedges   = [0 0.25 0.5 0.75 1.0 1.25 1.5 1.75 2.0 2.5 3.0 3.5 4.0 5.0 6.0 7.0 8.0 9.0 10.0 11.0 12.0 13.0];
diameterbinmiddles = [0.125 0.375 0.625 0.875 1.125 1.375 1.625 1.875 2.25 2.75 3.25 3.75 4.5 5.5 6.5 7.5 8.5 9.5 10.5 11.5 12.5];

pathlengthbinedges = 0:100:2200;
pathlengthbinmiddles = 50:100:2150;

cableproxdiam = cable.proximaldiameter.values;
cableproxpath = cable.proximalpathlength.values;
cablelength   = cable.length.values;
cablesurface  = cable.surfacearea.values;
cablevolume   = cable.volume.values;

arraycount = 0;
for diameterbin = 1:length(diameterbinmiddles)
    for pathlengthbin = 1:length(pathlengthbinmiddles)
        arraycount = arraycount + 1;
        
        diameter(arraycount) = diameterbinmiddles(diameterbin);
        pathlength(arraycount) = pathlengthbinmiddles(pathlengthbin);
        
        lengths{arraycount} = cablelength(cableproxdiam > diameterbinedges(diameterbin) & cableproxdiam <= diameterbinedges(diameterbin+1) & cableproxpath > pathlengthbinedges(pathlengthbin) & cableproxpath <= pathlengthbinedges(pathlengthbin+1));
        lengthsexp(arraycount) = expfit(lengths{arraycount});
        surfaces{arraycount} = cablesurface(cableproxdiam > diameterbinedges(diameterbin) & cableproxdiam <= diameterbinedges(diameterbin+1) & cableproxpath > pathlengthbinedges(pathlengthbin) & cableproxpath <= pathlengthbinedges(pathlengthbin+1));
        surfacesexp(arraycount) = expfit(surfaces{arraycount});
        volumes{arraycount} = cablevolume(cableproxdiam > diameterbinedges(diameterbin) & cableproxdiam <= diameterbinedges(diameterbin+1) & cableproxpath > pathlengthbinedges(pathlengthbin) & cableproxpath <= pathlengthbinedges(pathlengthbin+1));
        volumesexp(arraycount) = expfit(volumes{arraycount});
        
        numbercables(arraycount) = length(lengths{arraycount});
                
    end
end

x = diameter;
y = pathlength;
z = volumesexp;
w = numbercables;
        
       
