function branchendprobfitter(cable1,cable2)



mnoptions;

titlefontsize = option.mnfigures.titlefontsize;
labelfontsize = option.mnfigures.labelfontsize;
axesfontsize  = option.mnfigures.axesfontsize;
insetfontsize = option.mnfigures.insetfontsize;

indbluemarkersize  = option.mnfigures.indbluemarkersize;
indgreenmarkersize = option.mnfigures.indgreenmarkersize;
indredmarkersize   = option.mnfigures.indredmarkersize;
bluemarkersize     = option.mnfigures.bluemarkersize;
greenmarkersize    = option.mnfigures.greenmarkersize;
redmarkersize      = option.mnfigures.redmarkersize;
cyanmarkersize     = option.mnfigures.cyanmarkersize;
yellowmarkersize   = option.mnfigures.yellowmarkersize;
magentamarkersize  = option.mnfigures.magentamarkersize;


figure;

subplot(2,3,1)
box on;
hold on;
xlabel('Branch Proximal Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
ylabel('Branch Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
scatter(cable1.proximaldiameter.values,cable1.length.values,'bo');
if nargin == 2
    scatter(cable2.proximaldiameter.values,cable2.length.values,'rx');
end
set(gca,'FontSize',axesfontsize);
legendhandle = gca;
hold off;

subplot(2,3,2)
box on;
hold on;
xlabel('Branch Proximal Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
ylabel('Branch Surface Area (\mum^2)','FontSize',labelfontsize,'FontWeight','b');
scatter(cable1.proximaldiameter.values,cable1.surfacearea.values,'bo');
if nargin == 2
    scatter(cable2.proximaldiameter.values,cable2.surfacearea.values,'rx');
end
set(gca,'FontSize',axesfontsize);
hold off;

subplot(2,3,3)
box on;
hold on;
xlabel('Branch Proximal Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
ylabel('Branch Volume (\mum^3)','FontSize',labelfontsize,'FontWeight','b');
scatter(cable1.proximaldiameter.values,cable1.volume.values,'bo');
if nargin == 2
    scatter(cable2.proximaldiameter.values,cable2.volume.values,'rx');
end
set(gca,'FontSize',axesfontsize);
hold off;

subplot(2,3,4)
box on;
hold on;
xlabel('Branch Proximal Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
ylabel('Branch Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
scatter(cable1.proximalpathlength.values,cable1.length.values,'bo');
if nargin == 2
    scatter(cable2.proximalpathlength.values,cable2.length.values,'rx');
end
set(gca,'FontSize',axesfontsize);
hold off;

subplot(2,3,5)
box on;
hold on;
xlabel('Branch Proximal Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
ylabel('Branch Surface Area (\mum^2)','FontSize',labelfontsize,'FontWeight','b');
scatter(cable1.proximalpathlength.values,cable1.surfacearea.values,'bo');
if nargin == 2
    scatter(cable2.proximalpathlength.values,cable2.surfacearea.values,'rx');
end
set(gca,'FontSize',axesfontsize);
hold off;

subplot(2,3,6)
box on;
hold on;
xlabel('Branch Proximal Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
ylabel('Branch Volume (\mum^3)','FontSize',labelfontsize,'FontWeight','b');
scatter(cable1.proximalpathlength.values,cable1.volume.values,'bo');
if nargin == 2
    scatter(cable2.proximalpathlength.values,cable2.volume.values,'rx');
end
set(gca,'FontSize',axesfontsize);
hold off;


diameterbinedges   = [0 0.25 0.5 0.75 1.0 1.25 1.5 1.75 2.0 2.5 3.0 3.5 4.0 5.0 6.0 7.0 8.0 9.0 10.0 11.0 12.0 13.0];
diameterbinmiddles = [0.125 0.375 0.625 0.875 1.125 1.375 1.625 1.875 2.25 2.75 3.25 3.75 4.5 5.5 6.5 7.5 8.5 9.5 10.5 11.5 12.5];

pathlengthbinedges = [0:50:2150];
pathlengthbinmiddles = [25:50:2125];

cable1proxdiam = cable1.proximaldiameter.values;
cable1proxpl   = cable1.proximalpathlength.values;
cable1length   = cable1.length.values;
cable1surface  = cable1.surfacearea.values;
cable1volume   = cable1.volume.values;

if nargin == 2
    cable2proxdiam = cable2.proximaldiameter.values;
    cable2proxpl   = cable2.proximalpathlength.values;
    cable2length   = cable2.length.values;
    cable2surface  = cable2.surfacearea.values;
    cable2volume   = cable2.volume.values;
end



for diameterbin = 1:length(diameterbinmiddles)
    diamlength1{diameterbin}  = cable1length(cable1proxdiam > diameterbinedges(diameterbin) & cable1proxdiam <= diameterbinedges(diameterbin+1));
    diamsurface1{diameterbin} = cable1surface(cable1proxdiam > diameterbinedges(diameterbin) & cable1proxdiam <= diameterbinedges(diameterbin+1));
    diamvolume1{diameterbin}  = cable1volume(cable1proxdiam > diameterbinedges(diameterbin) & cable1proxdiam <= diameterbinedges(diameterbin+1));
    diamnumbers1(diameterbin) = length(diamlength1{diameterbin});
    
    diamlength1exp(diameterbin) = expfit(diamlength1{diameterbin});
    diamlength1gam(diameterbin,:) = gamfit(diamlength1{diameterbin});
    [diamlength1norm(diameterbin,1),diamlength1norm(diameterbin,2)] = normfit(diamlength1{diameterbin});
    diamsurface1exp(diameterbin) = expfit(diamsurface1{diameterbin});
    diamsurface1gam(diameterbin,:) = gamfit(diamsurface1{diameterbin});
    [diamsurface1norm(diameterbin,1),diamsurface1norm(diameterbin,2)] = normfit(diamsurface1{diameterbin});
    diamvolume1exp(diameterbin) = expfit(diamvolume1{diameterbin});
    diamvolume1gam(diameterbin,:) = gamfit(diamvolume1{diameterbin});
    [diamvolume1norm(diameterbin,1),diamvolume1norm(diameterbin,2)] = normfit(diamvolume1{diameterbin});    
    
    if nargin == 2
        diamlength2{diameterbin}  = cable2length(cable2proxdiam > diameterbinedges(diameterbin) & cable2proxdiam <= diameterbinedges(diameterbin+1));
        diamsurface2{diameterbin} = cable2surface(cable2proxdiam > diameterbinedges(diameterbin) & cable2proxdiam <= diameterbinedges(diameterbin+1));
        diamvolume2{diameterbin}  = cable2volume(cable2proxdiam > diameterbinedges(diameterbin) & cable2proxdiam <= diameterbinedges(diameterbin+1));
        diamnumbers2(diameterbin) = length(diamlength2{diameterbin});
        
        diamlength2exp(diameterbin) = expfit(diamlength2{diameterbin});
        diamlength2gam(diameterbin,:) = gamfit(diamlength2{diameterbin});
        [diamlength2norm(diameterbin,1),diamlength2norm(diameterbin,2)] = normfit(diamlength2{diameterbin});
        diamsurface2exp(diameterbin) = expfit(diamsurface2{diameterbin});
        diamsurface2gam(diameterbin,:) = gamfit(diamsurface2{diameterbin});
        [diamsurface2norm(diameterbin,1),diamsurface2norm(diameterbin,2)] = normfit(diamsurface2{diameterbin});
        diamvolume2exp(diameterbin) = expfit(diamvolume2{diameterbin});
        diamvolume2gam(diameterbin,:) = gamfit(diamvolume2{diameterbin});
        [diamvolume2norm(diameterbin,1),diamvolume2norm(diameterbin,2)] = normfit(diamvolume2{diameterbin});
    end
end
for pathlengthbin = 1:length(pathlengthbinmiddles)
    pllength1{pathlengthbin}  = cable1length(cable1proxpl > pathlengthbinedges(pathlengthbin) & cable1proxpl <= pathlengthbinedges(pathlengthbin+1));
    plsurface1{pathlengthbin} = cable1surface(cable1proxpl > pathlengthbinedges(pathlengthbin) & cable1proxpl <= pathlengthbinedges(pathlengthbin+1));
    plvolume1{pathlengthbin}  = cable1volume(cable1proxpl > pathlengthbinedges(pathlengthbin) & cable1proxpl <= pathlengthbinedges(pathlengthbin+1));
    plnumbers1(pathlengthbin) = length(pllength1{pathlengthbin});
    
    pllength1exp(pathlengthbin) = expfit(pllength1{pathlengthbin});
    pllength1gam(pathlengthbin,:) = gamfit(pllength1{pathlengthbin});
    [pllength1norm(pathlengthbin,1),pllength1norm(pathlengthbin,2)] = normfit(pllength1{pathlengthbin});
    plsurface1exp(pathlengthbin) = expfit(plsurface1{pathlengthbin});
    plsurface1gam(pathlengthbin,:) = gamfit(plsurface1{pathlengthbin});
    [plsurface1norm(pathlengthbin,1),plsurface1norm(pathlengthbin,2)] = normfit(plsurface1{pathlengthbin});
    plvolume1exp(pathlengthbin) = expfit(plvolume1{pathlengthbin});
    plvolume1gam(pathlengthbin,:) = gamfit(plvolume1{pathlengthbin});
    [plvolume1norm(pathlengthbin,1),plvolume1norm(pathlengthbin,2)] = normfit(plvolume1{pathlengthbin}); 
    
    if nargin == 2
        pllength2{pathlengthbin}  = cable2length(cable2proxpl > pathlengthbinedges(pathlengthbin) & cable2proxpl <= pathlengthbinedges(pathlengthbin+1));
        plsurface2{pathlengthbin} = cable2surface(cable2proxpl > pathlengthbinedges(pathlengthbin) & cable2proxpl <= pathlengthbinedges(pathlengthbin+1));
        plvolume2{pathlengthbin}  = cable2volume(cable2proxpl > pathlengthbinedges(pathlengthbin) & cable2proxpl <= pathlengthbinedges(pathlengthbin+1));
        plnumbers1(pathlengthbin) = length(pllength1{pathlengthbin});
        
        pllength2exp(pathlengthbin) = expfit(pllength2{pathlengthbin});
        pllength2gam(pathlengthbin,:) = gamfit(pllength2{pathlengthbin});
        [pllength2norm(pathlengthbin,1),pllength2norm(pathlengthbin,2)] = normfit(pllength2{pathlengthbin});
        plsurface2exp(pathlengthbin) = expfit(plsurface2{pathlengthbin});
        plsurface2gam(pathlengthbin,:) = gamfit(plsurface2{pathlengthbin});
        [plsurface2norm(pathlengthbin,1),plsurface2norm(pathlengthbin,2)] = normfit(plsurface2{pathlengthbin});
        plvolume2exp(pathlengthbin) = expfit(plvolume2{pathlengthbin});
        plvolume2gam(pathlengthbin,:) = gamfit(plvolume2{pathlengthbin});
        [plvolume2norm(pathlengthbin,1),plvolume2norm(pathlengthbin,2)] = normfit(plvolume2{pathlengthbin});
    end
end

keyboard




