function controlanalysis = doublefitter(controlanalysis)

disp('   Double fitting started.');


titlefontsize = 14;
labelfontsize = 7;
axesfontsize  = 5;
insetfontsize = 5;


indgreenmarkersize = 3;
indredmarkersize   = 5;

greenmarkersize   = 4;
redmarkersize     = 6;
yellowmarkersize  = 3;
magentamarkersize = 5;


styles(1,1)  = {'vb-'};
styles(1,2)  = {'xg--'};
styles(1,3)  = {'sr:'};
styles(1,4)  = {'^k-'};
styles(1,5)  = {'+b--'};
styles(1,6)  = {'og:'};
styles(1,7)  = {'<r-'};
styles(1,8)  = {'*k--'};
styles(1,9)  = {'pb:'};
styles(1,10) = {'>g-'};
styles(1,11) = {'vr--'};
styles(1,12) = {'xk:'};
styles(1,13) = {'sb-'};
styles(1,14) = {'^g--'};
styles(1,15) = {'+r:'};
styles(1,16) = {'ok-'};
styles(1,17) = {'<b--'};
styles(1,18) = {'*g:'};
styles(1,19) = {'pr-'};
styles(1,20) = {'>k--'};
styles(1,21) = {'vb:'};
styles(1,22) = {'xg-'};
styles(1,23) = {'sr--'};
styles(1,24) = {'^k:'};
styles(1,25) = {'+b-'};
styles(1,26) = {'og--'};
styles(1,27) = {'<r:'};
styles(1,28) = {'*k-'};
styles(1,29) = {'pb--'};
styles(1,30) = {'>g:'};
styles(1,31) = {'vr-'};
styles(1,32) = {'xk--'};
styles(1,33) = {'sb:'};
styles(1,34) = {'^g-'};
styles(1,35) = {'+r--'};
styles(1,36) = {'ok:'};
styles(1,37) = {'<b-'};
styles(1,38) = {'*g--'};
styles(1,39) = {'pr:'};
styles(1,40) = {'>k-'};


cd(controlanalysis.datapathname);    
if exist('figures','dir')==7
    cd('figures');
else
    mkdir('figures');
    cd('figures');
end
if exist('biftermprob','dir')==7
    cd('biftermprob');
else
    mkdir('biftermprob');
    cd('biftermprob');
end
if exist('fitting','dir')==7
    cd('fitting');
else
    mkdir('fitting');
    cd('fitting');
end


% Branch Bifurcation / Termination Probability

    x = [[controlanalysis.doublebin.array.diameter] [controlanalysis.doublebin.array.pathlength]];
    y1 = [controlanalysis.doublebin.array.numberbifurcatingbranches];
    y2 = [controlanalysis.doublebin.array.numberterminatingbranches];
    n = ([controlanalysis.doublebin.array.numberbifurcatingbranches] + [controlanalysis.doublebin.array.numberterminatingbranches]);

    b1 = glmfit(x,[y1 n],'binomial','link','logit');
    y1fit = glmval(b1,x,'logit','size',n);

    b2 = glmfit(x,[y2 n],'binomial','link','logit');
    y2fit = glmval(b2,x,'logit','size',n);
    
    controlanalysis.doublebin.branchbifurcationprobability.parameter1 = b1(1);
    controlanalysis.doublebin.branchbifurcationprobability.parameter2 = b1(2);
    controlanalysis.doublebin.branchbifurcationprobability.parameter3 = b1(3);
    
    controlanalysis.doublebin.branchterminationprobability.parameter1 = b2(1);
    controlanalysis.doublebin.branchterminationprobability.parameter2 = b2(2);
    controlanalysis.doublebin.branchterminationprobability.parameter3 = b2(3);
    
    controlanalysis.doublebin.branchbifurcationprobability.fit = 1./(1+exp(-(b1(1) + b1(2)*controlanalysis.doublebin.diameter + b1(3)*controlanalysis.doublebin.pathlength )));
    controlanalysis.doublebin.branchterminationprobability.fit = 1./(1+exp(-(b2(1) + b2(2)*controlanalysis.doublebin.diameter + b2(3)*controlanalysis.doublebin.pathlength )));
    
    figure;
    surf(controlanalysis.doublebin.diameter,controlanalysis.doublebin.pathlength,controlanalysis.doublebin.branchbifurcationprobability.fit);
    set(gca,'XScale','log');
    hold on;
    plot3([controlanalysis.doublebin.array.diameter],[controlanalysis.doublebin.array.pathlength],y1./n,'sk','MarkerFaceColor','g');    
    xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    ylabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    zlabel('Branch Bifurcation Probability','FontSize',labelfontsize,'FontWeight','b');
    set(gca,'FontSize',axesfontsize);
%     [ax,h3]=suplabel('Branch Bifurcation Probability','t');
%     set(h3,'FontSize',titlefontsize);
    title('Branch Bifurcation Probability','FontSize',titlefontsize);
    fillscreen;
    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Branch_Bif_Prob_Fitted');
    print('-djpeg',filename);
    hold off;
    %close all;    
    
    figure;
    surf(controlanalysis.doublebin.diameter,controlanalysis.doublebin.pathlength,controlanalysis.doublebin.branchterminationprobability.fit);
    set(gca,'XScale','log');
    hold on;
    plot3([controlanalysis.doublebin.array.diameter],[controlanalysis.doublebin.array.pathlength],y2./n,'dk','MarkerFaceColor','r');
    xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
    ylabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
    zlabel('Branch Termination Probability','FontSize',labelfontsize,'FontWeight','b');
    set(gca,'FontSize',axesfontsize);
%     [ax,h3]=suplabel('Branch Termination Probability','t');
%     set(h3,'FontSize',titlefontsize);
    title('Branch Termination Probability','FontSize',titlefontsize);
    fillscreen;
    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Branch_Term_Prob_Fitted');
    print('-djpeg',filename);
    hold off;
    %close all;
    


% Piece Bifurcaton / Termination Probability

    % Bifurcation probability
    
        [diameterlength,pathlengthlength] = size(controlanalysis.bifurcation.doublebin.bifurcationprobability.byvolume);
        diameter = controlanalysis.bifurcation.doublebin.diameter(:,1);
        pathlength = controlanalysis.bifurcation.doublebin.pathlength(1,:);
        bifprob  = controlanalysis.bifurcation.doublebin.bifurcationprobability.byvolume;
        
        figure;
        legendtextcount = 0;
        curvecount      = 0;
        
        for i=1:diameterlength
            linpathlength = pathlength(~isnan(bifprob(i,:)));
            linbifprob    = bifprob(i,~isnan(bifprob(i,:)));
            logpathlength = linpathlength(linbifprob ~= 0);
            logbifprob    = linbifprob(linbifprob ~= 0);
            semilogy(logpathlength,logbifprob,styles{1,i});
            if ~isempty(logbifprob)
                hold on;
                
                legendtextcount = legendtextcount + 1;
                legendtext(1,legendtextcount) = {['Diameter: ' num2str(diameter(i))]};
                
                if length(logbifprob) > 1
                    
                    curvecount      = curvecount + 1;
                    
                    [a,b,fitx,fity,r2]=exponentialfit(linpathlength,linbifprob,[min(logpathlength) max(logpathlength)]);

                    controlanalysis.bifurcation.doublebin.bifurcationprobability.volumefit.exppathlength.diameter(curvecount) = diameter(i);
                    controlanalysis.bifurcation.doublebin.bifurcationprobability.volumefit.exppathlength.a(curvecount) = a;
                    controlanalysis.bifurcation.doublebin.bifurcationprobability.volumefit.exppathlength.b(curvecount) = b;
                    controlanalysis.bifurcation.doublebin.bifurcationprobability.volumefit.exppathlength.r2(curvecount) = r2;
                    clear a b r2;

                    semilogy(fitx,fity,'k:');
                    clear fitx fity;
                    legendtextcount = legendtextcount + 1;
                    legendtext(1,legendtextcount) = {'Fit'};
        
                end
            end
        end
        xlabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
        ylabel('Bifurcation Probability','FontSize',labelfontsize,'FontWeight','b');
        set(gca,'FontSize',axesfontsize);
        legend(legendtext);
        clear legendtext;
        [ax,h3]=suplabel('Bifurcation Probability by Volume - Semilog(y)'  ,'t');
        set(h3,'FontSize',titlefontsize);
        fillscreen;
        filename = sprintf('%s_%s',controlanalysis.inputfilename,'Bif_Prob_101_Fitted');
        print('-djpeg',filename);
        %close all;
        
        figure;
        loglog(controlanalysis.bifurcation.doublebin.bifurcationprobability.volumefit.exppathlength.diameter, controlanalysis.bifurcation.doublebin.bifurcationprobability.volumefit.exppathlength.a,'ko','MarkerFaceColor','g');
        hold on;
        [a,b,fitx,fity,r2] = powerfit(controlanalysis.bifurcation.doublebin.bifurcationprobability.volumefit.exppathlength.diameter, controlanalysis.bifurcation.doublebin.bifurcationprobability.volumefit.exppathlength.a,xlim);
        controlanalysis.bifurcation.doublebin.bifurcationprobability.volumefit.exppathlength.powera.a = a;
        controlanalysis.bifurcation.doublebin.bifurcationprobability.volumefit.exppathlength.powera.b = b;
        controlanalysis.bifurcation.doublebin.bifurcationprobability.volumefit.exppathlength.powera.r2 = r2;
        loglog(fitx,fity,'-k');
        xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
        ylabel('A(d) from BifProb(p,d)=A(d)*exp[p*B(d)]','FontSize',labelfontsize,'FontWeight','b');
        set(gca,'FontSize',axesfontsize);
        [ax,h3]=suplabel('A(d) for Bifurcation Probability by Volume'  ,'t');
        set(h3,'FontSize',titlefontsize);
        fillscreen;
        filename = sprintf('%s_%s',controlanalysis.inputfilename,'Bif_Prob_102_AofD_Fitted');
        print('-djpeg',filename);
        %close all;
        
        figure;
        loglog(controlanalysis.bifurcation.doublebin.bifurcationprobability.volumefit.exppathlength.diameter, controlanalysis.bifurcation.doublebin.bifurcationprobability.volumefit.exppathlength.b,'ks','MarkerFaceColor','g');
        hold on;
        [a,b,fitx,fity,r2] = powerfit(controlanalysis.bifurcation.doublebin.bifurcationprobability.volumefit.exppathlength.diameter, controlanalysis.bifurcation.doublebin.bifurcationprobability.volumefit.exppathlength.b,xlim);
        controlanalysis.bifurcation.doublebin.bifurcationprobability.volumefit.exppathlength.powerb.a = a;
        controlanalysis.bifurcation.doublebin.bifurcationprobability.volumefit.exppathlength.powerb.b = b;
        controlanalysis.bifurcation.doublebin.bifurcationprobability.volumefit.exppathlength.powerb.r2 = r2;
        loglog(fitx,fity,'-k');
        xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
        ylabel('B(d) from BifProb(p,d)=A(d)*exp[p*B(d)]','FontSize',labelfontsize,'FontWeight','b');
        set(gca,'FontSize',axesfontsize);
        [ax,h3]=suplabel('B(d) for Bifurcation Probability by Volume'  ,'t');
        set(h3,'FontSize',titlefontsize);
        fillscreen;
        filename = sprintf('%s_%s',controlanalysis.inputfilename,'Bif_Prob_103_BofD_Fitted');
        print('-djpeg',filename);
        %close all;

        figure;
        diameter = controlanalysis.bifurcation.doublebin.diameter;
        pathlength = controlanalysis.bifurcation.doublebin.pathlength;
        bifprobfit = (controlanalysis.bifurcation.doublebin.bifurcationprobability.volumefit.exppathlength.powera.a * diameter .^ controlanalysis.bifurcation.doublebin.bifurcationprobability.volumefit.exppathlength.powera.b) .* exp((controlanalysis.bifurcation.doublebin.bifurcationprobability.volumefit.exppathlength.powerb.a * diameter .^ controlanalysis.bifurcation.doublebin.bifurcationprobability.volumefit.exppathlength.powerb.b) .* pathlength);
        surf(diameter,pathlength,bifprobfit)
        set(gca,'ZScale','log');
        hold on
        diameterarray = controlanalysis.bifurcation.doublebin.array.bifurcationprobability.diameter;
        pathlengtharray = controlanalysis.bifurcation.doublebin.array.bifurcationprobability.pathlength;
        bifprobarray = controlanalysis.bifurcation.doublebin.array.bifurcationprobability.byvolume;
        plot3(diameterarray,pathlengtharray,bifprobarray,'sk','MarkerFaceColor','g')
        xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
        ylabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
        zlabel('Bifurcation Probability','FontSize',labelfontsize,'FontWeight','b');
        set(gca,'FontSize',axesfontsize);
%         [ax,h3]=suplabel('Piece Bifurcation Probability'  ,'t');
%         set(h3,'FontSize',titlefontsize);
        title('Piece Bifurcation Probability','FontSize',titlefontsize);
        fillscreen;
        filename = sprintf('%s_%s',controlanalysis.inputfilename,'Piece_Bif_Prob_Fitted');
        print('-djpeg',filename);
        %close all;

    % Termination probability
    
        [diameterlength,pathlengthlength] = size(controlanalysis.termination.doublebin.terminationprobability.byvolume);
        diameter = controlanalysis.termination.doublebin.diameter(:,1);
        pathlength = controlanalysis.termination.doublebin.pathlength(1,:);
        termprob  = controlanalysis.termination.doublebin.terminationprobability.byvolume;
        
        figure;
        legendtextcount = 0;
        curvecount      = 0;
        
        for i=1:diameterlength
            linpathlength = pathlength(~isnan(termprob(i,:)));
            lintermprob    = termprob(i,~isnan(termprob(i,:)));
            logpathlength = linpathlength(lintermprob ~= 0);
            logtermprob    = lintermprob(lintermprob ~= 0);
            semilogy(logpathlength,logtermprob,styles{1,i});
            if ~isempty(logtermprob)
                hold on;
                
                legendtextcount = legendtextcount + 1;
                legendtext(1,legendtextcount) = {['Diameter: ' num2str(diameter(i))]};
                
                if length(logtermprob) > 1
                    
                    curvecount      = curvecount + 1;
                    
                    [a,b,fitx,fity,r2]=exponentialfit(linpathlength,lintermprob,[min(logpathlength) max(logpathlength)]);

                    controlanalysis.termination.doublebin.terminationprobability.volumefit.exppathlength.diameter(curvecount) = diameter(i);
                    controlanalysis.termination.doublebin.terminationprobability.volumefit.exppathlength.a(curvecount) = a;
                    controlanalysis.termination.doublebin.terminationprobability.volumefit.exppathlength.b(curvecount) = b;
                    controlanalysis.termination.doublebin.terminationprobability.volumefit.exppathlength.r2(curvecount) = r2;
                    clear a b r2;

                    semilogy(fitx,fity,'k:');
                    clear fitx fity;
                    legendtextcount = legendtextcount + 1;
                    legendtext(1,legendtextcount) = {'Fit'};
        
                end
            end
        end
        xlabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
        ylabel('Termination Probability','FontSize',labelfontsize,'FontWeight','b');
        set(gca,'FontSize',axesfontsize);
        legend(legendtext);
        clear legendtext;
        [ax,h3]=suplabel('Termination Probability by Volume - Semilog(y)'  ,'t');
        set(h3,'FontSize',titlefontsize);
        fillscreen;
        filename = sprintf('%s_%s',controlanalysis.inputfilename,'Term_Prob_101_Fitted');
        print('-djpeg',filename);
        %close all;
        
        figure;
        loglog(controlanalysis.termination.doublebin.terminationprobability.volumefit.exppathlength.diameter, controlanalysis.termination.doublebin.terminationprobability.volumefit.exppathlength.a,'ko','MarkerFaceColor','g');
        hold on;
        [a,b,fitx,fity,r2] = powerfit(controlanalysis.termination.doublebin.terminationprobability.volumefit.exppathlength.diameter, controlanalysis.termination.doublebin.terminationprobability.volumefit.exppathlength.a,xlim);
        controlanalysis.termination.doublebin.terminationprobability.volumefit.exppathlength.powera.a = a;
        controlanalysis.termination.doublebin.terminationprobability.volumefit.exppathlength.powera.b = b;
        controlanalysis.termination.doublebin.terminationprobability.volumefit.exppathlength.powera.r2 = r2;
        loglog(fitx,fity,'-k');
        xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
        ylabel('A(d) from TermProb(p,d)=A(d)*exp[p*B(d)]','FontSize',labelfontsize,'FontWeight','b');
        set(gca,'FontSize',axesfontsize);
        [ax,h3]=suplabel('A(d) for Termination Probability by Volume'  ,'t');
        set(h3,'FontSize',titlefontsize);
        fillscreen;
        filename = sprintf('%s_%s',controlanalysis.inputfilename,'Term_Prob_102_AofD_Fitted');
        print('-djpeg',filename);
        %close all;
        
        figure;
        loglog(controlanalysis.termination.doublebin.terminationprobability.volumefit.exppathlength.diameter, controlanalysis.termination.doublebin.terminationprobability.volumefit.exppathlength.b,'ks','MarkerFaceColor','g');
        hold on;
        [a,b,fitx,fity,r2] = powerfit(controlanalysis.termination.doublebin.terminationprobability.volumefit.exppathlength.diameter, controlanalysis.termination.doublebin.terminationprobability.volumefit.exppathlength.b,xlim);
        controlanalysis.termination.doublebin.terminationprobability.volumefit.exppathlength.powerb.a = a;
        controlanalysis.termination.doublebin.terminationprobability.volumefit.exppathlength.powerb.b = b;
        controlanalysis.termination.doublebin.terminationprobability.volumefit.exppathlength.powerb.r2 = r2;
        loglog(fitx,fity,'-k');
        xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
        ylabel('B(d) from TermProb(p,d)=A(d)*exp[p*B(d)]','FontSize',labelfontsize,'FontWeight','b');
        set(gca,'FontSize',axesfontsize);
        [ax,h3]=suplabel('B(d) for Termination Probability by Volume'  ,'t');
        set(h3,'FontSize',titlefontsize);
        fillscreen;
        filename = sprintf('%s_%s',controlanalysis.inputfilename,'Term_Prob_103_BofD_Fitted');
        print('-djpeg',filename);
        %close all;
        
        figure;
        diameter = controlanalysis.termination.doublebin.diameter;
        pathlength = controlanalysis.termination.doublebin.pathlength;
        bifprobfit = (controlanalysis.termination.doublebin.terminationprobability.volumefit.exppathlength.powera.a * diameter .^ controlanalysis.termination.doublebin.terminationprobability.volumefit.exppathlength.powera.b) .* exp((controlanalysis.termination.doublebin.terminationprobability.volumefit.exppathlength.powerb.a * diameter .^ controlanalysis.termination.doublebin.terminationprobability.volumefit.exppathlength.powerb.b) .* pathlength);
        surf(diameter,pathlength,bifprobfit)
        set(gca,'ZScale','log');
        hold on
        diameterarray = controlanalysis.termination.doublebin.array.terminationprobability.diameter;
        pathlengtharray = controlanalysis.termination.doublebin.array.terminationprobability.pathlength;
        bifprobarray = controlanalysis.termination.doublebin.array.terminationprobability.byvolume;
        plot3(diameterarray,pathlengtharray,bifprobarray,'dk','MarkerFaceColor','r')
        xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
        ylabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
        zlabel('Termination Probability','FontSize',labelfontsize,'FontWeight','b');
        set(gca,'FontSize',axesfontsize);
%         [ax,h3]=suplabel('Piece Termination Probability'  ,'t');
%         set(h3,'FontSize',titlefontsize);
        title('Piece Termination Probability','FontSize',titlefontsize);
        fillscreen;
        filename = sprintf('%s_%s',controlanalysis.inputfilename,'Piece_Term_Prob_Fitted');
        print('-djpeg',filename);
        close all;

% Piece Bifurcation / Termination Taper Rate

cd(controlanalysis.datapathname);    
if exist('figures','dir')==7
    cd('figures');
else
    mkdir('figures');
    cd('figures');
end
if exist('doublebin','dir')==7
    cd('doublebin');
else
    mkdir('doublebin');
    cd('doublebin');
end
if exist('fitting','dir')==7
    cd('fitting');
else
    mkdir('fitting');
    cd('fitting');
end

    % Bifurcation taper rate - mean        

        [diameterlength,pathlengthlength] = size(controlanalysis.bifurcation.doublebin.taperrate.mean);
        diameter = controlanalysis.bifurcation.doublebin.diameter(:,1);
        pathlength = controlanalysis.bifurcation.doublebin.pathlength(1,:);
        biftapermean = controlanalysis.bifurcation.doublebin.taperrate.mean;
        biftaperstd = controlanalysis.bifurcation.doublebin.taperrate.std;
        biftaperskew = controlanalysis.bifurcation.doublebin.taperrate.skew;
        biftaperkurt = controlanalysis.bifurcation.doublebin.taperrate.kurt;
        
        figure;
        legendtextcount = 0;
        curvecount      = 0;
        
        for i=1:diameterlength
            linpathlength = pathlength(~isnan(biftapermean(i,:)));
            linbiftapermean    = biftapermean(i,~isnan(biftapermean(i,:)));
            logpathlength = linpathlength(linbiftapermean ~= 0);
            logbiftapermean    = linbiftapermean(linbiftapermean ~= 0);
            plot(linpathlength,linbiftapermean,styles{1,i});
            if ~isempty(linbiftapermean)
                hold on;
                
                legendtextcount = legendtextcount + 1;
                legendtext(1,legendtextcount) = {['Diameter: ' num2str(diameter(i))]};
                
                if length(linbiftapermean) > 1
                    
                    curvecount      = curvecount + 1;
                    
                    [a,b,fitx,fity,r2]=linearfit(linpathlength,linbiftapermean,[min(linpathlength) max(linpathlength)]);

                    controlanalysis.bifurcation.doublebin.taperrate.meanfit.linpathlength.diameter(curvecount) = diameter(i);
                    controlanalysis.bifurcation.doublebin.taperrate.meanfit.linpathlength.a(curvecount) = a;
                    controlanalysis.bifurcation.doublebin.taperrate.meanfit.linpathlength.b(curvecount) = b;
                    controlanalysis.bifurcation.doublebin.taperrate.meanfit.linpathlength.r2(curvecount) = r2;
                    %disp(sprintf('a : %e',a));
                    %disp(sprintf('b : %e',b));
                    %disp(sprintf('r2: %e',r2));
                    %keyboard
                    clear a b r2;

                    plot(fitx,fity,'k:');
                    clear fitx fity;
                    legendtextcount = legendtextcount + 1;
                    legendtext(1,legendtextcount) = {'Fit'};
        
                end
            end
        end
        xlabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
        ylabel('Mean Taper Rate','FontSize',labelfontsize,'FontWeight','b');
        set(gca,'FontSize',axesfontsize);
        legend(legendtext);
        clear legendtext;
        [ax,h3]=suplabel('Bifurcation Mean Taper Rate - Linear'  ,'t');
        set(h3,'FontSize',titlefontsize);
        fillscreen;
        filename = sprintf('%s_%s',controlanalysis.inputfilename,'Bif_Mean_Taper_Rate_101_Fitted');
        print('-djpeg',filename);
        %close all;
        
        figure;
        loglog(controlanalysis.bifurcation.doublebin.taperrate.meanfit.linpathlength.diameter, controlanalysis.bifurcation.doublebin.taperrate.meanfit.linpathlength.a,'ko','MarkerFaceColor','g');
        hold on;
        [a,b,fitx,fity,r2] = linearfit(controlanalysis.bifurcation.doublebin.taperrate.meanfit.linpathlength.diameter, controlanalysis.bifurcation.doublebin.taperrate.meanfit.linpathlength.a,xlim);
        controlanalysis.bifurcation.doublebin.taperrate.meanfit.linpathlength.powera.a = a;
        controlanalysis.bifurcation.doublebin.taperrate.meanfit.linpathlength.powera.b = b;
        controlanalysis.bifurcation.doublebin.taperrate.meanfit.linpathlength.powera.r2 = r2;
        loglog(fitx,fity,'-k');
        xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
        ylabel('A(d) from TaperRate(p,d)=A(d)*exp[p*B(d)]','FontSize',labelfontsize,'FontWeight','b');
        set(gca,'FontSize',axesfontsize);
        [ax,h3]=suplabel('A(d) for Bifurcation Mean Taper Rate'  ,'t');
        set(h3,'FontSize',titlefontsize);
        fillscreen;
        filename = sprintf('%s_%s',controlanalysis.inputfilename,'Bif_Mean_Taper_Rate_102_AofD_Fitted');
        print('-djpeg',filename);
        %close all;
        
        figure;
        loglog(controlanalysis.bifurcation.doublebin.taperrate.meanfit.linpathlength.diameter, controlanalysis.bifurcation.doublebin.taperrate.meanfit.linpathlength.b,'ks','MarkerFaceColor','g');
        hold on;
        [a,b,fitx,fity,r2] = linearfit(controlanalysis.bifurcation.doublebin.taperrate.meanfit.linpathlength.diameter, controlanalysis.bifurcation.doublebin.taperrate.meanfit.linpathlength.b,xlim);
        controlanalysis.bifurcation.doublebin.taperrate.meanfit.linpathlength.powerb.a = a;
        controlanalysis.bifurcation.doublebin.taperrate.meanfit.linpathlength.powerb.b = b;
        controlanalysis.bifurcation.doublebin.taperrate.meanfit.linpathlength.powerb.r2 = r2;
        loglog(fitx,fity,'-k');
        xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
        ylabel('B(d) from TaperRate(p,d)=A(d)*exp[p*B(d)]','FontSize',labelfontsize,'FontWeight','b');
        set(gca,'FontSize',axesfontsize);
        [ax,h3]=suplabel('B(d) for Bifurcation Mean Taper Rate'  ,'t');
        set(h3,'FontSize',titlefontsize);
        fillscreen;
        filename = sprintf('%s_%s',controlanalysis.inputfilename,'Bif_Mean_Taper_Rate_103_BofD_Fitted');
        print('-djpeg',filename);
        %close all;

        figure;
        diameter = controlanalysis.bifurcation.doublebin.diameter;
        pathlength = controlanalysis.bifurcation.doublebin.pathlength;
        biftapermeanfit = (controlanalysis.bifurcation.doublebin.taperrate.meanfit.linpathlength.powera.a * diameter + controlanalysis.bifurcation.doublebin.taperrate.meanfit.linpathlength.powera.b) .* pathlength + (controlanalysis.bifurcation.doublebin.taperrate.meanfit.linpathlength.powerb.a * diameter + controlanalysis.bifurcation.doublebin.taperrate.meanfit.linpathlength.powerb.b);
        surf(diameter,pathlength,biftapermeanfit)
        set(gca,'ZScale','log');
        hold on
        diameterarray = controlanalysis.bifurcation.doublebin.array.diameter;
        pathlengtharray = controlanalysis.bifurcation.doublebin.array.pathlength;
        biftapermeanarray = controlanalysis.bifurcation.doublebin.array.taperrate.mean;
        plot3(diameterarray,pathlengtharray,biftapermeanarray,'sk','MarkerFaceColor','g')
        xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
        ylabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
        zlabel('Mean Taper Rate','FontSize',labelfontsize,'FontWeight','b');
        set(gca,'FontSize',axesfontsize);
%         [ax,h3]=suplabel('Piece Bifurcation Probability'  ,'t');
%         set(h3,'FontSize',titlefontsize);
        title('Bifurcation Mean Taper Rate','FontSize',titlefontsize);
        fillscreen;
        filename = sprintf('%s_%s',controlanalysis.inputfilename,'Bif_Mean_Taper_Rate_Fitted');
        print('-djpeg',filename);
        %close all;
        
        
    % Bifurcation taper rate - standard deviation        

        [diameterlength,pathlengthlength] = size(controlanalysis.bifurcation.doublebin.taperrate.std);
        diameter = controlanalysis.bifurcation.doublebin.diameter(:,1);
        pathlength = controlanalysis.bifurcation.doublebin.pathlength(1,:);
        biftaperstd = controlanalysis.bifurcation.doublebin.taperrate.std;
        
        figure;
        legendtextcount = 0;
        curvecount      = 0;
        
        for i=1:diameterlength
            linpathlength = pathlength(~isnan(biftaperstd(i,:)));
            linbiftaperstd = biftaperstd(i,~isnan(biftaperstd(i,:)));
            logpathlength = linpathlength(linbiftaperstd ~= 0);
            logbiftaperstd = linbiftaperstd(linbiftaperstd ~= 0);
            plot(linpathlength,linbiftaperstd,styles{1,i});
            if ~isempty(linbiftaperstd)
                hold on;
                
                legendtextcount = legendtextcount + 1;
                legendtext(1,legendtextcount) = {['Diameter: ' num2str(diameter(i))]};
                
                if length(linbiftaperstd) > 1
                    
                    curvecount      = curvecount + 1;
                    
                    [a,b,fitx,fity,r2]=linearfit(linpathlength,linbiftaperstd,[min(linpathlength) max(linpathlength)]);

                    controlanalysis.bifurcation.doublebin.taperrate.stdfit.linpathlength.diameter(curvecount) = diameter(i);
                    controlanalysis.bifurcation.doublebin.taperrate.stdfit.linpathlength.a(curvecount) = a;
                    controlanalysis.bifurcation.doublebin.taperrate.stdfit.linpathlength.b(curvecount) = b;
                    controlanalysis.bifurcation.doublebin.taperrate.stdfit.linpathlength.r2(curvecount) = r2;
                    %disp(sprintf('a : %e',a));
                    %disp(sprintf('b : %e',b));
                    %disp(sprintf('r2: %e',r2));
                    %keyboard
                    clear a b r2;

                    plot(fitx,fity,'k:');
                    clear fitx fity;
                    legendtextcount = legendtextcount + 1;
                    legendtext(1,legendtextcount) = {'Fit'};
        
                end
            end
        end
        xlabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
        ylabel('std Taper Rate','FontSize',labelfontsize,'FontWeight','b');
        set(gca,'FontSize',axesfontsize);
        legend(legendtext);
        clear legendtext;
        [ax,h3]=suplabel('Bifurcation std Taper Rate - Linear'  ,'t');
        set(h3,'FontSize',titlefontsize);
        fillscreen;
        filename = sprintf('%s_%s',controlanalysis.inputfilename,'Bif_std_Taper_Rate_101_Fitted');
        print('-djpeg',filename);
        %close all;
        
        figure;
        loglog(controlanalysis.bifurcation.doublebin.taperrate.stdfit.linpathlength.diameter, controlanalysis.bifurcation.doublebin.taperrate.stdfit.linpathlength.a,'ko','MarkerFaceColor','g');
        hold on;
        [a,b,fitx,fity,r2] = linearfit(controlanalysis.bifurcation.doublebin.taperrate.stdfit.linpathlength.diameter, controlanalysis.bifurcation.doublebin.taperrate.stdfit.linpathlength.a,xlim);
        controlanalysis.bifurcation.doublebin.taperrate.stdfit.linpathlength.powera.a = a;
        controlanalysis.bifurcation.doublebin.taperrate.stdfit.linpathlength.powera.b = b;
        controlanalysis.bifurcation.doublebin.taperrate.stdfit.linpathlength.powera.r2 = r2;
        loglog(fitx,fity,'-k');
        xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
        ylabel('A(d) from TaperRate(p,d)=A(d)*exp[p*B(d)]','FontSize',labelfontsize,'FontWeight','b');
        set(gca,'FontSize',axesfontsize);
        [ax,h3]=suplabel('A(d) for Bifurcation std Taper Rate'  ,'t');
        set(h3,'FontSize',titlefontsize);
        fillscreen;
        filename = sprintf('%s_%s',controlanalysis.inputfilename,'Bif_std_Taper_Rate_102_AofD_Fitted');
        print('-djpeg',filename);
        %close all;
        
        figure;
        loglog(controlanalysis.bifurcation.doublebin.taperrate.stdfit.linpathlength.diameter, controlanalysis.bifurcation.doublebin.taperrate.stdfit.linpathlength.b,'ks','MarkerFaceColor','g');
        hold on;
        [a,b,fitx,fity,r2] = linearfit(controlanalysis.bifurcation.doublebin.taperrate.stdfit.linpathlength.diameter, controlanalysis.bifurcation.doublebin.taperrate.stdfit.linpathlength.b,xlim);
        controlanalysis.bifurcation.doublebin.taperrate.stdfit.linpathlength.powerb.a = a;
        controlanalysis.bifurcation.doublebin.taperrate.stdfit.linpathlength.powerb.b = b;
        controlanalysis.bifurcation.doublebin.taperrate.stdfit.linpathlength.powerb.r2 = r2;
        loglog(fitx,fity,'-k');
        xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
        ylabel('B(d) from TaperRate(p,d)=A(d)*exp[p*B(d)]','FontSize',labelfontsize,'FontWeight','b');
        set(gca,'FontSize',axesfontsize);
        [ax,h3]=suplabel('B(d) for Bifurcation std Taper Rate'  ,'t');
        set(h3,'FontSize',titlefontsize);
        fillscreen;
        filename = sprintf('%s_%s',controlanalysis.inputfilename,'Bif_std_Taper_Rate_103_BofD_Fitted');
        print('-djpeg',filename);
        %close all;

        figure;
        diameter = controlanalysis.bifurcation.doublebin.diameter;
        pathlength = controlanalysis.bifurcation.doublebin.pathlength;
        biftaperstdfit = (controlanalysis.bifurcation.doublebin.taperrate.stdfit.linpathlength.powera.a * diameter + controlanalysis.bifurcation.doublebin.taperrate.stdfit.linpathlength.powera.b) .* pathlength + (controlanalysis.bifurcation.doublebin.taperrate.stdfit.linpathlength.powerb.a * diameter + controlanalysis.bifurcation.doublebin.taperrate.stdfit.linpathlength.powerb.b);
        surf(diameter,pathlength,biftaperstdfit)
        set(gca,'ZScale','log');
        hold on
        diameterarray = controlanalysis.bifurcation.doublebin.array.diameter;
        pathlengtharray = controlanalysis.bifurcation.doublebin.array.pathlength;
        biftaperstdarray = controlanalysis.bifurcation.doublebin.array.taperrate.std;
        plot3(diameterarray,pathlengtharray,biftaperstdarray,'sk','MarkerFaceColor','g')
        xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
        ylabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
        zlabel('std Taper Rate','FontSize',labelfontsize,'FontWeight','b');
        set(gca,'FontSize',axesfontsize);
%         [ax,h3]=suplabel('Piece Bifurcation Probability'  ,'t');
%         set(h3,'FontSize',titlefontsize);
        title('Bifurcation std Taper Rate','FontSize',titlefontsize);
        fillscreen;
        filename = sprintf('%s_%s',controlanalysis.inputfilename,'Bif_std_Taper_Rate_Fitted');
        print('-djpeg',filename);
        %close all;
        
        
        
    % Bifurcation taper rate - skewness        

        [diameterlength,pathlengthlength] = size(controlanalysis.bifurcation.doublebin.taperrate.skew);
        diameter = controlanalysis.bifurcation.doublebin.diameter(:,1);
        pathlength = controlanalysis.bifurcation.doublebin.pathlength(1,:);
        biftaperskew = controlanalysis.bifurcation.doublebin.taperrate.skew;
        
        figure;
        legendtextcount = 0;
        curvecount      = 0;
        
        for i=1:diameterlength
            linpathlength = pathlength(~isnan(biftaperskew(i,:)));
            linbiftaperskew = biftaperskew(i,~isnan(biftaperskew(i,:)));
            logpathlength = linpathlength(linbiftaperskew ~= 0);
            logbiftaperskew = linbiftaperskew(linbiftaperskew ~= 0);
            plot(linpathlength,linbiftaperskew,styles{1,i});
            if ~isempty(linbiftaperskew)
                hold on;
                
                legendtextcount = legendtextcount + 1;
                legendtext(1,legendtextcount) = {['Diameter: ' num2str(diameter(i))]};
                
                if length(linbiftaperskew) > 1
                    
                    curvecount      = curvecount + 1;
                    
                    [a,b,fitx,fity,r2]=linearfit(linpathlength,linbiftaperskew,[min(linpathlength) max(linpathlength)]);

                    controlanalysis.bifurcation.doublebin.taperrate.skewfit.linpathlength.diameter(curvecount) = diameter(i);
                    controlanalysis.bifurcation.doublebin.taperrate.skewfit.linpathlength.a(curvecount) = a;
                    controlanalysis.bifurcation.doublebin.taperrate.skewfit.linpathlength.b(curvecount) = b;
                    controlanalysis.bifurcation.doublebin.taperrate.skewfit.linpathlength.r2(curvecount) = r2;
                    %disp(sprintf('a : %e',a));
                    %disp(sprintf('b : %e',b));
                    %disp(sprintf('r2: %e',r2));
                    %keyboard
                    clear a b r2;

                    plot(fitx,fity,'k:');
                    clear fitx fity;
                    legendtextcount = legendtextcount + 1;
                    legendtext(1,legendtextcount) = {'Fit'};
        
                end
            end
        end
        xlabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
        ylabel('skew Taper Rate','FontSize',labelfontsize,'FontWeight','b');
        set(gca,'FontSize',axesfontsize);
        legend(legendtext);
        clear legendtext;
        [ax,h3]=suplabel('Bifurcation skew Taper Rate - Linear'  ,'t');
        set(h3,'FontSize',titlefontsize);
        fillscreen;
        filename = sprintf('%s_%s',controlanalysis.inputfilename,'Bif_skew_Taper_Rate_101_Fitted');
        print('-djpeg',filename);
        %close all;
        
        figure;
        loglog(controlanalysis.bifurcation.doublebin.taperrate.skewfit.linpathlength.diameter, controlanalysis.bifurcation.doublebin.taperrate.skewfit.linpathlength.a,'ko','MarkerFaceColor','g');
        hold on;
        [a,b,fitx,fity,r2] = linearfit(controlanalysis.bifurcation.doublebin.taperrate.skewfit.linpathlength.diameter, controlanalysis.bifurcation.doublebin.taperrate.skewfit.linpathlength.a,xlim);
        controlanalysis.bifurcation.doublebin.taperrate.skewfit.linpathlength.powera.a = a;
        controlanalysis.bifurcation.doublebin.taperrate.skewfit.linpathlength.powera.b = b;
        controlanalysis.bifurcation.doublebin.taperrate.skewfit.linpathlength.powera.r2 = r2;
        loglog(fitx,fity,'-k');
        xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
        ylabel('A(d) from TaperRate(p,d)=A(d)*exp[p*B(d)]','FontSize',labelfontsize,'FontWeight','b');
        set(gca,'FontSize',axesfontsize);
        [ax,h3]=suplabel('A(d) for Bifurcation skew Taper Rate'  ,'t');
        set(h3,'FontSize',titlefontsize);
        fillscreen;
        filename = sprintf('%s_%s',controlanalysis.inputfilename,'Bif_skew_Taper_Rate_102_AofD_Fitted');
        print('-djpeg',filename);
        %close all;
        
        figure;
        loglog(controlanalysis.bifurcation.doublebin.taperrate.skewfit.linpathlength.diameter, controlanalysis.bifurcation.doublebin.taperrate.skewfit.linpathlength.b,'ks','MarkerFaceColor','g');
        hold on;
        [a,b,fitx,fity,r2] = linearfit(controlanalysis.bifurcation.doublebin.taperrate.skewfit.linpathlength.diameter, controlanalysis.bifurcation.doublebin.taperrate.skewfit.linpathlength.b,xlim);
        controlanalysis.bifurcation.doublebin.taperrate.skewfit.linpathlength.powerb.a = a;
        controlanalysis.bifurcation.doublebin.taperrate.skewfit.linpathlength.powerb.b = b;
        controlanalysis.bifurcation.doublebin.taperrate.skewfit.linpathlength.powerb.r2 = r2;
        loglog(fitx,fity,'-k');
        xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
        ylabel('B(d) from TaperRate(p,d)=A(d)*exp[p*B(d)]','FontSize',labelfontsize,'FontWeight','b');
        set(gca,'FontSize',axesfontsize);
        [ax,h3]=suplabel('B(d) for Bifurcation skew Taper Rate'  ,'t');
        set(h3,'FontSize',titlefontsize);
        fillscreen;
        filename = sprintf('%s_%s',controlanalysis.inputfilename,'Bif_skew_Taper_Rate_103_BofD_Fitted');
        print('-djpeg',filename);
        %close all;

        figure;
        diameter = controlanalysis.bifurcation.doublebin.diameter;
        pathlength = controlanalysis.bifurcation.doublebin.pathlength;
        biftaperskewfit = (controlanalysis.bifurcation.doublebin.taperrate.skewfit.linpathlength.powera.a * diameter + controlanalysis.bifurcation.doublebin.taperrate.skewfit.linpathlength.powera.b) .* pathlength + (controlanalysis.bifurcation.doublebin.taperrate.skewfit.linpathlength.powerb.a * diameter + controlanalysis.bifurcation.doublebin.taperrate.skewfit.linpathlength.powerb.b);
        surf(diameter,pathlength,biftaperskewfit)
        set(gca,'ZScale','log');
        hold on
        diameterarray = controlanalysis.bifurcation.doublebin.array.diameter;
        pathlengtharray = controlanalysis.bifurcation.doublebin.array.pathlength;
        biftaperskewarray = controlanalysis.bifurcation.doublebin.array.taperrate.skew;
        plot3(diameterarray,pathlengtharray,biftaperskewarray,'sk','MarkerFaceColor','g')
        xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
        ylabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
        zlabel('skew Taper Rate','FontSize',labelfontsize,'FontWeight','b');
        set(gca,'FontSize',axesfontsize);
%         [ax,h3]=suplabel('Piece Bifurcation Probability'  ,'t');
%         set(h3,'FontSize',titlefontsize);
        title('Bifurcation skew Taper Rate','FontSize',titlefontsize);
        fillscreen;
        filename = sprintf('%s_%s',controlanalysis.inputfilename,'Bif_skew_Taper_Rate_Fitted');
        print('-djpeg',filename);
        %close all;



    % Bifurcation taper rate - kurtosis        

        [diameterlength,pathlengthlength] = size(controlanalysis.bifurcation.doublebin.taperrate.kurt);
        diameter = controlanalysis.bifurcation.doublebin.diameter(:,1);
        pathlength = controlanalysis.bifurcation.doublebin.pathlength(1,:);
        biftaperkurt = controlanalysis.bifurcation.doublebin.taperrate.kurt;
        
        figure;
        legendtextcount = 0;
        curvecount      = 0;
        
        for i=1:diameterlength
            linpathlength = pathlength(~isnan(biftaperkurt(i,:)));
            linbiftaperkurt = biftaperkurt(i,~isnan(biftaperkurt(i,:)));
            logpathlength = linpathlength(linbiftaperkurt ~= 0);
            logbiftaperkurt = linbiftaperkurt(linbiftaperkurt ~= 0);
            plot(linpathlength,linbiftaperkurt,styles{1,i});
            if ~isempty(linbiftaperkurt)
                hold on;
                
                legendtextcount = legendtextcount + 1;
                legendtext(1,legendtextcount) = {['Diameter: ' num2str(diameter(i))]};
                
                if length(linbiftaperkurt) > 1
                    
                    curvecount      = curvecount + 1;
                    
                    [a,b,fitx,fity,r2]=linearfit(linpathlength,linbiftaperkurt,[min(linpathlength) max(linpathlength)]);

                    controlanalysis.bifurcation.doublebin.taperrate.kurtfit.linpathlength.diameter(curvecount) = diameter(i);
                    controlanalysis.bifurcation.doublebin.taperrate.kurtfit.linpathlength.a(curvecount) = a;
                    controlanalysis.bifurcation.doublebin.taperrate.kurtfit.linpathlength.b(curvecount) = b;
                    controlanalysis.bifurcation.doublebin.taperrate.kurtfit.linpathlength.r2(curvecount) = r2;
                    %disp(sprintf('a : %e',a));
                    %disp(sprintf('b : %e',b));
                    %disp(sprintf('r2: %e',r2));
                    %keyboard
                    clear a b r2;

                    plot(fitx,fity,'k:');
                    clear fitx fity;
                    legendtextcount = legendtextcount + 1;
                    legendtext(1,legendtextcount) = {'Fit'};
        
                end
            end
        end
        xlabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
        ylabel('kurt Taper Rate','FontSize',labelfontsize,'FontWeight','b');
        set(gca,'FontSize',axesfontsize);
        legend(legendtext);
        clear legendtext;
        [ax,h3]=suplabel('Bifurcation kurt Taper Rate - Linear'  ,'t');
        set(h3,'FontSize',titlefontsize);
        fillscreen;
        filename = sprintf('%s_%s',controlanalysis.inputfilename,'Bif_kurt_Taper_Rate_101_Fitted');
        print('-djpeg',filename);
        %close all;
        
        figure;
        loglog(controlanalysis.bifurcation.doublebin.taperrate.kurtfit.linpathlength.diameter, controlanalysis.bifurcation.doublebin.taperrate.kurtfit.linpathlength.a,'ko','MarkerFaceColor','g');
        hold on;
        [a,b,fitx,fity,r2] = linearfit(controlanalysis.bifurcation.doublebin.taperrate.kurtfit.linpathlength.diameter, controlanalysis.bifurcation.doublebin.taperrate.kurtfit.linpathlength.a,xlim);
        controlanalysis.bifurcation.doublebin.taperrate.kurtfit.linpathlength.powera.a = a;
        controlanalysis.bifurcation.doublebin.taperrate.kurtfit.linpathlength.powera.b = b;
        controlanalysis.bifurcation.doublebin.taperrate.kurtfit.linpathlength.powera.r2 = r2;
        loglog(fitx,fity,'-k');
        xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
        ylabel('A(d) from TaperRate(p,d)=A(d)*exp[p*B(d)]','FontSize',labelfontsize,'FontWeight','b');
        set(gca,'FontSize',axesfontsize);
        [ax,h3]=suplabel('A(d) for Bifurcation kurt Taper Rate'  ,'t');
        set(h3,'FontSize',titlefontsize);
        fillscreen;
        filename = sprintf('%s_%s',controlanalysis.inputfilename,'Bif_kurt_Taper_Rate_102_AofD_Fitted');
        print('-djpeg',filename);
        %close all;
        
        figure;
        loglog(controlanalysis.bifurcation.doublebin.taperrate.kurtfit.linpathlength.diameter, controlanalysis.bifurcation.doublebin.taperrate.kurtfit.linpathlength.b,'ks','MarkerFaceColor','g');
        hold on;
        [a,b,fitx,fity,r2] = linearfit(controlanalysis.bifurcation.doublebin.taperrate.kurtfit.linpathlength.diameter, controlanalysis.bifurcation.doublebin.taperrate.kurtfit.linpathlength.b,xlim);
        controlanalysis.bifurcation.doublebin.taperrate.kurtfit.linpathlength.powerb.a = a;
        controlanalysis.bifurcation.doublebin.taperrate.kurtfit.linpathlength.powerb.b = b;
        controlanalysis.bifurcation.doublebin.taperrate.kurtfit.linpathlength.powerb.r2 = r2;
        loglog(fitx,fity,'-k');
        xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
        ylabel('B(d) from TaperRate(p,d)=A(d)*exp[p*B(d)]','FontSize',labelfontsize,'FontWeight','b');
        set(gca,'FontSize',axesfontsize);
        [ax,h3]=suplabel('B(d) for Bifurcation kurt Taper Rate'  ,'t');
        set(h3,'FontSize',titlefontsize);
        fillscreen;
        filename = sprintf('%s_%s',controlanalysis.inputfilename,'Bif_kurt_Taper_Rate_103_BofD_Fitted');
        print('-djpeg',filename);
        %close all;

        figure;
        diameter = controlanalysis.bifurcation.doublebin.diameter;
        pathlength = controlanalysis.bifurcation.doublebin.pathlength;
        biftaperkurtfit = (controlanalysis.bifurcation.doublebin.taperrate.kurtfit.linpathlength.powera.a * diameter + controlanalysis.bifurcation.doublebin.taperrate.kurtfit.linpathlength.powera.b) .* pathlength + (controlanalysis.bifurcation.doublebin.taperrate.kurtfit.linpathlength.powerb.a * diameter + controlanalysis.bifurcation.doublebin.taperrate.kurtfit.linpathlength.powerb.b);
        surf(diameter,pathlength,biftaperkurtfit)
        set(gca,'ZScale','log');
        hold on
        diameterarray = controlanalysis.bifurcation.doublebin.array.diameter;
        pathlengtharray = controlanalysis.bifurcation.doublebin.array.pathlength;
        biftaperkurtarray = controlanalysis.bifurcation.doublebin.array.taperrate.kurt;
        plot3(diameterarray,pathlengtharray,biftaperkurtarray,'sk','MarkerFaceColor','g')
        xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
        ylabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
        zlabel('kurt Taper Rate','FontSize',labelfontsize,'FontWeight','b');
        set(gca,'FontSize',axesfontsize);
%         [ax,h3]=suplabel('Piece Bifurcation Probability'  ,'t');
%         set(h3,'FontSize',titlefontsize);
        title('Bifurcation kurt Taper Rate','FontSize',titlefontsize);
        fillscreen;
        filename = sprintf('%s_%s',controlanalysis.inputfilename,'Bif_kurt_Taper_Rate_Fitted');
        print('-djpeg',filename);
        %close all;
        
        
        
        
    % Termination taper rate        

        [diameterlength,pathlengthlength] = size(controlanalysis.termination.doublebin.taperrate.mean);
        diameter = controlanalysis.termination.doublebin.diameter(:,1);
        pathlength = controlanalysis.termination.doublebin.pathlength(1,:);
        termtapermean = controlanalysis.termination.doublebin.taperrate.mean;
        termtaperstd = controlanalysis.termination.doublebin.taperrate.std;
        termtaperskew = controlanalysis.termination.doublebin.taperrate.skew;
        termtaperkurt = controlanalysis.termination.doublebin.taperrate.kurt;
        
        figure;
        legendtextcount = 0;
        curvecount      = 0;
        
        for i=1:diameterlength
            linpathlength = pathlength(~isnan(termtapermean(i,:)));
            lintermtapermean    = termtapermean(i,~isnan(termtapermean(i,:)));
            logpathlength = linpathlength(lintermtapermean ~= 0);
            logtermtapermean    = lintermtapermean(lintermtapermean ~= 0);
            plot(linpathlength,lintermtapermean,styles{1,i});
            if ~isempty(lintermtapermean)
                hold on;
                
                legendtextcount = legendtextcount + 1;
                legendtext(1,legendtextcount) = {['Diameter: ' num2str(diameter(i))]};
                
                if length(lintermtapermean) > 1
                    
                    curvecount      = curvecount + 1;
                    
                    [a,b,fitx,fity,r2]=linearfit(linpathlength,lintermtapermean,[min(linpathlength) max(linpathlength)]);

                    controlanalysis.termination.doublebin.taperrate.meanfit.linpathlength.diameter(curvecount) = diameter(i);
                    controlanalysis.termination.doublebin.taperrate.meanfit.linpathlength.a(curvecount) = a;
                    controlanalysis.termination.doublebin.taperrate.meanfit.linpathlength.b(curvecount) = b;
                    controlanalysis.termination.doublebin.taperrate.meanfit.linpathlength.r2(curvecount) = r2;
                    %disp(sprintf('a : %e',a));
                    %disp(sprintf('b : %e',b));
                    %disp(sprintf('r2: %e',r2));
                    %keyboard
                    clear a b r2;

                    plot(fitx,fity,'k:');
                    clear fitx fity;
                    legendtextcount = legendtextcount + 1;
                    legendtext(1,legendtextcount) = {'Fit'};
        
                end
            end
        end
        xlabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
        ylabel('Mean Taper Rate','FontSize',labelfontsize,'FontWeight','b');
        set(gca,'FontSize',axesfontsize);
        legend(legendtext);
        clear legendtext;
        [ax,h3]=suplabel('Termination Mean Taper Rate - Linear'  ,'t');
        set(h3,'FontSize',titlefontsize);
        fillscreen;
        filename = sprintf('%s_%s',controlanalysis.inputfilename,'Term_Mean_Taper_Rate_101_Fitted');
        print('-djpeg',filename);
        %close all;
        
        figure;
        loglog(controlanalysis.termination.doublebin.taperrate.meanfit.linpathlength.diameter, controlanalysis.termination.doublebin.taperrate.meanfit.linpathlength.a,'ko','MarkerFaceColor','g');
        hold on;
        [a,b,fitx,fity,r2] = linearfit(controlanalysis.termination.doublebin.taperrate.meanfit.linpathlength.diameter, controlanalysis.termination.doublebin.taperrate.meanfit.linpathlength.a,xlim);
        controlanalysis.termination.doublebin.taperrate.meanfit.linpathlength.powera.a = a;
        controlanalysis.termination.doublebin.taperrate.meanfit.linpathlength.powera.b = b;
        controlanalysis.termination.doublebin.taperrate.meanfit.linpathlength.powera.r2 = r2;
        loglog(fitx,fity,'-k');
        xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
        ylabel('A(d) from TaperRate(p,d)=A(d)*exp[p*B(d)]','FontSize',labelfontsize,'FontWeight','b');
        set(gca,'FontSize',axesfontsize);
        [ax,h3]=suplabel('A(d) for Termination Mean Taper Rate'  ,'t');
        set(h3,'FontSize',titlefontsize);
        fillscreen;
        filename = sprintf('%s_%s',controlanalysis.inputfilename,'Term_Mean_Taper_Rate_102_AofD_Fitted');
        print('-djpeg',filename);
        %close all;
        
        figure;
        loglog(controlanalysis.termination.doublebin.taperrate.meanfit.linpathlength.diameter, controlanalysis.termination.doublebin.taperrate.meanfit.linpathlength.b,'ks','MarkerFaceColor','g');
        hold on;
        [a,b,fitx,fity,r2] = linearfit(controlanalysis.termination.doublebin.taperrate.meanfit.linpathlength.diameter, controlanalysis.termination.doublebin.taperrate.meanfit.linpathlength.b,xlim);
        controlanalysis.termination.doublebin.taperrate.meanfit.linpathlength.powerb.a = a;
        controlanalysis.termination.doublebin.taperrate.meanfit.linpathlength.powerb.b = b;
        controlanalysis.termination.doublebin.taperrate.meanfit.linpathlength.powerb.r2 = r2;
        loglog(fitx,fity,'-k');
        xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
        ylabel('B(d) from TaperRate(p,d)=A(d)*exp[p*B(d)]','FontSize',labelfontsize,'FontWeight','b');
        set(gca,'FontSize',axesfontsize);
        [ax,h3]=suplabel('B(d) for Termination Mean Taper Rate'  ,'t');
        set(h3,'FontSize',titlefontsize);
        fillscreen;
        filename = sprintf('%s_%s',controlanalysis.inputfilename,'Term_Mean_Taper_Rate_103_BofD_Fitted');
        print('-djpeg',filename);
        %close all;

        figure;
        diameter = controlanalysis.termination.doublebin.diameter;
        pathlength = controlanalysis.termination.doublebin.pathlength;
        termtapermeanfit = (controlanalysis.termination.doublebin.taperrate.meanfit.linpathlength.powera.a * diameter + controlanalysis.termination.doublebin.taperrate.meanfit.linpathlength.powera.b) .* pathlength + (controlanalysis.termination.doublebin.taperrate.meanfit.linpathlength.powerb.a * diameter + controlanalysis.termination.doublebin.taperrate.meanfit.linpathlength.powerb.b);
        surf(diameter,pathlength,termtapermeanfit)
        set(gca,'ZScale','log');
        hold on
        diameterarray = controlanalysis.termination.doublebin.array.diameter;
        pathlengtharray = controlanalysis.termination.doublebin.array.pathlength;
        termtapermeanarray = controlanalysis.termination.doublebin.array.taperrate.mean;
        plot3(diameterarray,pathlengtharray,termtapermeanarray,'sk','MarkerFaceColor','g')
        xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
        ylabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
        zlabel('Mean Taper Rate','FontSize',labelfontsize,'FontWeight','b');
        set(gca,'FontSize',axesfontsize);
%         [ax,h3]=suplabel('Piece termination Probability'  ,'t');
%         set(h3,'FontSize',titlefontsize);
        title('Termination Mean Taper Rate','FontSize',titlefontsize);
        fillscreen;
        filename = sprintf('%s_%s',controlanalysis.inputfilename,'Term_Mean_Taper_Rate_Fitted');
        print('-djpeg',filename);
        %close all;
        