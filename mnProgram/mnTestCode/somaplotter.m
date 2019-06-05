function somaplotter(mn)

figure;

somapoints = mn.soma.points;
x = somapoints(:,1);
y = somapoints(:,2);
z = somapoints(:,3);
center = [((min(x)+max(x))/2) ((min(y)+max(y))/2) ((min(z)+max(z))/2)];

A2 = x(1:end-1).*y(2:end)-x(2:end).*y(1:end-1);
A2s = sum(A2)/2;
x_bar = (sum((x(2:end)+x(1:end-1)).*A2)*1/6)/A2s;
y_bar = (sum((y(2:end)+y(1:end-1)).*A2)*1/6)/A2s;
centroid2d = [x_bar y_bar ((min(z)+max(z))/2)];

xc = x - x_bar;
yc = y - y_bar;
xc = [xc; xc(1)];
yc = [yc; yc(1)];
step = (max(yc)-min(yc)) / 20;
cylindercenters = [min(yc)+step/2:step:max(yc)-step/2];
volume2d = 0;
for cyl = 1:length(cylindercenters)
    linex = [-1000; 1000];
    liney = [cylindercenters(cyl); cylindercenters(cyl)];
    [xint,yint] = polyxpoly(linex,liney,xc,yc);
    rad = range(xint)/2;
    cylindervolume = pi()*rad*rad*step;
    volume2d = volume2d + cylindervolume;
end


somapoints = [somapoints; somapoints(1,:)];

plot3(somapoints(:,1),somapoints(:,2),somapoints(:,3),'g','LineWidth',3);
hold on;
plot3(centroid2d(1),centroid2d(2),centroid2d(3),'ko','MarkerFaceColor','g','MarkerSize',15);
plot3(center(1),center(2),center(3),'rx','MarkerSize',15);

if isfield(mn,'axon')
    axoncount = 0;
    for axon = 1:length(mn.axon)
        if strcmp('primary    ',mn.axon(axon).proximaltype)
            axoncount = axoncount + 1;
            axonxposition(axoncount) = mn.axon(axon).proximalxposition;
            axonyposition(axoncount) = mn.axon(axon).proximalyposition;
            axonzposition(axoncount) = mn.axon(axon).proximalzposition;
            axondistalxposition(axoncount) = mn.axon(axon).distalxposition;
            axondistalyposition(axoncount) = mn.axon(axon).distalyposition;
            axondistalzposition(axoncount) = mn.axon(axon).distalzposition;
            axondistalxposition2(axoncount) = mn.axon(axon+1).distalxposition;
            axondistalyposition2(axoncount) = mn.axon(axon+1).distalyposition;
            axondistalzposition2(axoncount) = mn.axon(axon+1).distalzposition;
            axonxdirection(axoncount) = mn.axon(axon).xdirection;
            axonydirection(axoncount) = mn.axon(axon).ydirection;
            axonzdirection(axoncount) = mn.axon(axon).zdirection;
            axondiameter(axoncount) = mn.axon(axon).proximaldiameter;
        end
    end
end

if isfield(mn,'dendrite')
    dendritecount = 0;
    for dendrite = 1:length(mn.dendrite)
        if strcmp('primary    ',mn.dendrite(dendrite).proximaltype)
            dendritecount = dendritecount + 1;
            dendritexposition(dendritecount) = mn.dendrite(dendrite).proximalxposition;
            dendriteyposition(dendritecount) = mn.dendrite(dendrite).proximalyposition;
            dendritezposition(dendritecount) = mn.dendrite(dendrite).proximalzposition;
            dendritedistalxposition(dendritecount) = mn.dendrite(dendrite).distalxposition;
            dendritedistalyposition(dendritecount) = mn.dendrite(dendrite).distalyposition;
            dendritedistalzposition(dendritecount) = mn.dendrite(dendrite).distalzposition;
            dendritedistalxposition2(dendritecount) = mn.dendrite(dendrite+1).distalxposition;
            dendritedistalyposition2(dendritecount) = mn.dendrite(dendrite+1).distalyposition;
            dendritedistalzposition2(dendritecount) = mn.dendrite(dendrite+1).distalzposition;
            dendritexdirection(dendritecount) = mn.dendrite(dendrite).xdirection;
            dendriteydirection(dendritecount) = mn.dendrite(dendrite).ydirection;
            dendritezdirection(dendritecount) = mn.dendrite(dendrite).zdirection;
            dendritediameter(dendritecount) = mn.dendrite(dendrite).proximaldiameter;
        end
    end
end

if isfield(mn,'apical')
    apicalcount = 0;
    for apical = 1:length(mn.apical)
        if strcmp('primary    ',mn.apical(apical).proximaltype)
            apicalcount = apicalcount + 1;
            apicalxposition(apicalcount) = mn.apical(apical).proximalxposition;
            apicalyposition(apicalcount) = mn.apical(apical).proximalyposition;
            apicalzposition(apicalcount) = mn.apical(apical).proximalzposition;
            apicaldistalxposition(apicalcount) = mn.apical(apical).distalxposition;
            apicaldistalyposition(apicalcount) = mn.apical(apical).distalyposition;
            apicaldistalzposition(apicalcount) = mn.apical(apical).distalzposition;
            apicaldistalxposition2(apicalcount) = mn.apical(apical+1).distalxposition;
            apicaldistalyposition2(apicalcount) = mn.apical(apical+1).distalyposition;
            apicaldistalzposition2(apicalcount) = mn.apical(apical+1).distalzposition;
            apicalxdirection(apicalcount) = mn.apical(apical).xdirection;
            apicalydirection(apicalcount) = mn.apical(apical).ydirection;
            apicalzdirection(apicalcount) = mn.apical(apical).zdirection;
            apicaldiameter(apicalcount) = mn.apical(apical).proximaldiameter;
        end
    end
end

vectorlength = 5;

for axon = 1:axoncount
    plot3(axonxposition(axon),axonyposition(axon),axonzposition(axon),'bo','MarkerFaceColor','b','MarkerSize',10);
    plot3(axondistalxposition(axon),axondistalyposition(axon),axondistalzposition(axon),'bs','MarkerFaceColor','b','MarkerSize',10);
    plot3(axondistalxposition2(axon),axondistalyposition2(axon),axondistalzposition2(axon),'bs','MarkerFaceColor','b','MarkerSize',5);
    plot3([axonxposition(axon); axonxposition(axon)+vectorlength*axonxdirection(axon)],[axonyposition(axon); axonyposition(axon)+vectorlength*axonydirection(axon)],[axonzposition(axon); axonzposition(axon)+vectorlength*axonzdirection(axon)],'b','LineWidth',3);
end

for dendrite = 1:dendritecount
    plot3(dendritexposition(dendrite),dendriteyposition(dendrite),dendritezposition(dendrite),'ro','MarkerFaceColor','r','MarkerSize',10);
    plot3(dendritedistalxposition(dendrite),dendritedistalyposition(dendrite),dendritedistalzposition(dendrite),'rs','MarkerFaceColor','r','MarkerSize',10);
    plot3(dendritedistalxposition2(dendrite),dendritedistalyposition2(dendrite),dendritedistalzposition2(dendrite),'rs','MarkerFaceColor','r','MarkerSize',5);
    plot3([dendritexposition(dendrite); dendritexposition(dendrite)+vectorlength*dendritexdirection(dendrite)],[dendriteyposition(dendrite); dendriteyposition(dendrite)+vectorlength*dendriteydirection(dendrite)],[dendritezposition(dendrite); dendritezposition(dendrite)+vectorlength*dendritezdirection(dendrite)],'r','LineWidth',3);
end

dendritedistance = ((dendritexposition - centroid2d(1)).^2+(dendriteyposition - centroid2d(2)).^2+(dendritezposition - centroid2d(3)).^2).^0.5;


for apical = 1:apicalcount
    plot3(apicalxposition(apical),apicalyposition(apical),apicalzposition(apical),'mo','MarkerFaceColor','m','MarkerSize',10);
    plot3(apicaldistalxposition(apical),apicaldistalyposition(apical),apicaldistalzposition(apical),'ms','MarkerFaceColor','m','MarkerSize',10);
    plot3(apicaldistalxposition2(apical),apicaldistalyposition2(apical),apicaldistalzposition2(apical),'ms','MarkerFaceColor','m','MarkerSize',5);
    plot3([apicalxposition(apical); apicalxposition(apical)+vectorlength*apicalxdirection(apical)],[apicalyposition(apical); apicalyposition(apical)+vectorlength*apicalydirection(apical)],[apicalzposition(apical); apicalzposition(apical)+vectorlength*apicalzdirection(apical)],'m','LineWidth',3);
end

allpoints = [x, y, z; apicalxposition, apicalyposition, apicalzposition; dendritexposition', dendriteyposition', dendritezposition'; axonxposition, axonyposition, axonzposition];
[hull, volume3d] = convhulln(allpoints);
trisurf(hull,allpoints(:,1),allpoints(:,2),allpoints(:,3),'FaceColor','g','FaceAlpha',0.5);

centroid3d = centroid(allpoints(unique(convhulln(allpoints)),:));
plot3(centroid3d(1),centroid3d(2),centroid3d(3),'kd','MarkerFaceColor','g','MarkerSize',15);

xlabel('x');
ylabel('y');
zlabel('z');

axis square;
axis vis3d;

hold off;

disp(' ');
disp(['Centroid 2D: ' num2str(centroid2d)]);
disp(['Centroid 3D: ' num2str(centroid3d)]);
disp(['Distance   : ' num2str((sum((centroid2d-centroid3d).^2)).^0.5)]);
disp(' ');
disp(['X range: ' num2str(max(xc)-min(xc))]);
disp(['Y range: ' num2str(max(yc)-min(yc))]);
disp(' ')
disp(['CSA      : ' num2str(polyarea(x,y))]);
disp(['Volume 2D: ' num2str(volume2d)]);
disp(['Volume 3D: ' num2str(volume3d)]);
disp(' ')


%keyboard

