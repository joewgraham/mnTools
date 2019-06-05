function doublebinbiftermprobfigures(controlanalysis)
% Branching/Terminating Probability Figures

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
styles(1,41)  = {'vb-'};
styles(1,42)  = {'xg--'};
styles(1,43)  = {'sr:'};
styles(1,44)  = {'^k-'};
styles(1,45)  = {'+b--'};
styles(1,46)  = {'og:'};
styles(1,47)  = {'<r-'};
styles(1,48)  = {'*k--'};
styles(1,49)  = {'pb:'};
styles(1,50) = {'>g-'};
styles(1,51) = {'vr--'};
styles(1,52) = {'xk:'};
styles(1,53) = {'sb-'};
styles(1,54) = {'^g--'};
styles(1,55) = {'+r:'};
styles(1,56) = {'ok-'};
styles(1,57) = {'<b--'};
styles(1,58) = {'*g:'};
styles(1,59) = {'pr-'};
styles(1,60) = {'>k--'};
styles(1,61) = {'vb:'};
styles(1,62) = {'xg-'};
styles(1,63) = {'sr--'};
styles(1,64) = {'^k:'};
styles(1,65) = {'+b-'};
styles(1,66) = {'og--'};
styles(1,67) = {'<r:'};
styles(1,68) = {'*k-'};
styles(1,69) = {'pb--'};
styles(1,70) = {'>g:'};
styles(1,71) = {'vr-'};
styles(1,72) = {'xk--'};
styles(1,73) = {'sb:'};
styles(1,74) = {'^g-'};
styles(1,75) = {'+r--'};
styles(1,76) = {'ok:'};
styles(1,77) = {'<b-'};
styles(1,78) = {'*g--'};
styles(1,79) = {'pr:'};
styles(1,80) = {'>k-'};


% Pooled (Burke Style) Probabilities
    
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
    if exist('pooled','dir')==7
        cd('pooled');
    else
        mkdir('pooled');
        cd('pooled');
    end

    % By Length

        [diameterlength,pathlengthlength] = size(controlanalysis.doublebin.bifurcationprobability.bylength);
        diameter = controlanalysis.doublebin.diameter(:,1);
        pathlength = controlanalysis.doublebin.pathlength(1,:);
        bifprob  = controlanalysis.doublebin.bifurcationprobability.bylength;
        termprob = controlanalysis.doublebin.terminationprobability.bylength;

        % Diameter on x-axis
        
            % Linear
            
                % Bifurcation probability
            
                    figure;
                    legendtextcount = 0;
                    
                    for i=1:pathlengthlength
                        lindiameter = diameter(~isnan(bifprob(:,i)));
                        linbifprob  = bifprob(~isnan(bifprob(:,i)),i);
                        logdiameter = lindiameter(linbifprob ~= 0);
                        logbifprob  = linbifprob(linbifprob ~= 0);
                        plot(lindiameter,linbifprob,styles{1,i});
                        if ~isempty(linbifprob)
                            hold on;
                            legendtextcount = legendtextcount + 1;
                            legendtext(1,legendtextcount) = {['Path Length: ' num2str(pathlength(i))]};
                        end
                    end
                    xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Bifurcation Probability','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    legend(legendtext);
                    clear legendtext;
                    [ax,h3]=suplabel('Pooled Bifurcation Probability by Length - Linear'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Bif_Prob_101_Length_Linear');
                    print('-djpeg',filename);
                    close all;
                    
                % Termination Probability
                
                    figure;
                    legendtextcount = 0;
                    
                    for i=1:pathlengthlength
                        lindiameter = diameter(~isnan(termprob(:,i)));
                        lintermprob = termprob(~isnan(termprob(:,i)),i);
                        logdiameter = lindiameter(lintermprob ~= 0);
                        logtermprob = lintermprob(lintermprob ~= 0);
                        plot(lindiameter,lintermprob,styles{1,i});
                        if ~isempty(lintermprob)
                            hold on;
                            legendtextcount = legendtextcount + 1;
                            legendtext(1,legendtextcount) = {['Path Length: ' num2str(pathlength(i))]};
                        end
                    end
                    xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Termination Probability','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    legend(legendtext);
                    clear legendtext;
                    [ax,h3]=suplabel('Pooled Termination Probability by Length - Linear'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Term_Prob_101_Length_Linear');
                    print('-djpeg',filename);
                    close all;
                    
            % Semilog - x
            
                % Bifurcation probability
            
                    figure;
                    legendtextcount = 0;
                    
                    for i=1:pathlengthlength
                        lindiameter = diameter(~isnan(bifprob(:,i)));
                        linbifprob  = bifprob(~isnan(bifprob(:,i)),i);
                        logdiameter = lindiameter(linbifprob ~= 0);
                        logbifprob  = linbifprob(linbifprob ~= 0);
                        semilogx(lindiameter,linbifprob,styles{1,i});
                        if ~isempty(linbifprob)
                            hold on;
                            legendtextcount = legendtextcount + 1;
                            legendtext(1,legendtextcount) = {['Path Length: ' num2str(pathlength(i))]};
                        end
                    end
                    xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Bifurcation Probability','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    legend(legendtext);
                    clear legendtext;
                    [ax,h3]=suplabel('Pooled Bifurcation Probability by Length - Semilog(x)'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Bif_Prob_102_Length_Semilog_x');
                    print('-djpeg',filename);
                    close all;
                    
                % Termination Probability
                
                    figure;
                    legendtextcount = 0;
                    
                    for i=1:pathlengthlength
                        lindiameter = diameter(~isnan(termprob(:,i)));
                        lintermprob = termprob(~isnan(termprob(:,i)),i);
                        logdiameter = lindiameter(lintermprob ~= 0);
                        logtermprob = lintermprob(lintermprob ~= 0);
                        semilogx(lindiameter,lintermprob,styles{1,i});
                        if ~isempty(lintermprob)
                            hold on;
                            legendtextcount = legendtextcount + 1;
                            legendtext(1,legendtextcount) = {['Path Length: ' num2str(pathlength(i))]};
                        end
                    end
                    xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Termination Probability','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    legend(legendtext);
                    clear legendtext;
                    [ax,h3]=suplabel('Pooled Termination Probability by Length - Semilog(x)'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Term_Prob_102_Length_Semilog_x');
                    print('-djpeg',filename);
                    close all;
                    
                    
            % Semilog - y
            
                % Bifurcation probability
            
                    figure;
                    legendtextcount = 0;
                    
                    for i=1:pathlengthlength
                        lindiameter = diameter(~isnan(bifprob(:,i)));
                        linbifprob  = bifprob(~isnan(bifprob(:,i)),i);
                        logdiameter = lindiameter(linbifprob ~= 0);
                        logbifprob  = linbifprob(linbifprob ~= 0);
                        semilogy(logdiameter,logbifprob,styles{1,i});
                        if ~isempty(logbifprob)
                            hold on;
                            legendtextcount = legendtextcount + 1;
                            legendtext(1,legendtextcount) = {['Path Length: ' num2str(pathlength(i))]};
                        end
                    end
                    xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Bifurcation Probability','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    legend(legendtext);
                    clear legendtext;
                    [ax,h3]=suplabel('Pooled Bifurcation Probability by Length - Semilog(y)'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Bif_Prob_103_Length_Semilog_y');
                    print('-djpeg',filename);
                    close all;
                    
                % Termination Probability
                
                    figure;
                    legendtextcount = 0;
                    
                    for i=1:pathlengthlength
                        lindiameter = diameter(~isnan(termprob(:,i)));
                        lintermprob = termprob(~isnan(termprob(:,i)),i);
                        logdiameter = lindiameter(lintermprob ~= 0);
                        logtermprob = lintermprob(lintermprob ~= 0);
                        semilogy(logdiameter,logtermprob,styles{1,i});
                        if ~isempty(logtermprob)
                            hold on;
                            legendtextcount = legendtextcount + 1;
                            legendtext(1,legendtextcount) = {['Path Length: ' num2str(pathlength(i))]};
                        end
                    end
                    xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Termination Probability','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    legend(legendtext);
                    clear legendtext;
                    [ax,h3]=suplabel('Pooled Termination Probability by Length - Semilog(y)'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Term_Prob_103_Length_Semilog_y');
                    print('-djpeg',filename);
                    close all;
                    
                    
            % Log-Log
            
                % Bifurcation probability
            
                    figure;
                    legendtextcount = 0;
                    
                    for i=1:pathlengthlength
                        lindiameter = diameter(~isnan(bifprob(:,i)));
                        linbifprob  = bifprob(~isnan(bifprob(:,i)),i);
                        logdiameter = lindiameter(linbifprob ~= 0);
                        logbifprob  = linbifprob(linbifprob ~= 0);
                        loglog(logdiameter,logbifprob,styles{1,i});
                        if ~isempty(logbifprob)
                            hold on;
                            legendtextcount = legendtextcount + 1;
                            legendtext(1,legendtextcount) = {['Path Length: ' num2str(pathlength(i))]};
                        end
                    end
                    xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Bifurcation Probability','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    legend(legendtext);
                    clear legendtext;
                    [ax,h3]=suplabel('Pooled Bifurcation Probability by Length - LogLog'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Bif_Prob_104_Length_LogLog');
                    print('-djpeg',filename);
                    close all;
                    
                % Termination Probability
                
                    figure;
                    legendtextcount = 0;
                    
                    for i=1:pathlengthlength
                        lindiameter = diameter(~isnan(termprob(:,i)));
                        lintermprob = termprob(~isnan(termprob(:,i)),i);
                        logdiameter = lindiameter(lintermprob ~= 0);
                        logtermprob = lintermprob(lintermprob ~= 0);
                        loglog(logdiameter,logtermprob,styles{1,i});
                        if ~isempty(logtermprob)
                            hold on;
                            legendtextcount = legendtextcount + 1;
                            legendtext(1,legendtextcount) = {['Path Length: ' num2str(pathlength(i))]};
                        end
                    end
                    xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Termination Probability','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    legend(legendtext);
                    clear legendtext;
                    [ax,h3]=suplabel('Pooled Termination Probability by Length - LogLog'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Term_Prob_104_Length_LogLog');
                    print('-djpeg',filename);
                    close all;

                    
        % Path Length on x-axis
        
            % Linear
            
                % Bifurcation probability
            
                    figure;
                    legendtextcount = 0;
                    
                    for i=1:diameterlength
                        linpathlength = pathlength(~isnan(bifprob(i,:)));
                        linbifprob    = bifprob(i,~isnan(bifprob(i,:)));
                        logpathlength = linpathlength(linbifprob ~= 0);
                        logbifprob    = linbifprob(linbifprob ~= 0);
                        plot(linpathlength,linbifprob,styles{1,i});
                        if ~isempty(linbifprob)
                            hold on;
                            legendtextcount = legendtextcount + 1;
                            legendtext(1,legendtextcount) = {['Diameter: ' num2str(diameter(i))]};
                        end
                    end
                    xlabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Bifurcation Probability','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    legend(legendtext);
                    clear legendtext;
                    [ax,h3]=suplabel('Pooled Bifurcation Probability by Length - Linear'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Bif_Prob_105_Length_Linear');
                    print('-djpeg',filename);
                    close all;
                    
                % Termination Probability
                
                    figure;
                    legendtextcount = 0;
                    
                    for i=1:diameterlength
                        linpathlength = pathlength(~isnan(termprob(i,:)));
                        lintermprob   = termprob(i,~isnan(termprob(i,:)));
                        logpathlength = linpathlength(lintermprob ~= 0);
                        logtermprob   = lintermprob(lintermprob ~= 0);
                        plot(linpathlength,lintermprob,styles{1,i});
                        if ~isempty(lintermprob)
                            hold on;
                            legendtextcount = legendtextcount + 1;
                            legendtext(1,legendtextcount) = {['Diameter: ' num2str(diameter(i))]};
                        end
                    end
                    xlabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Termination Probability','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    legend(legendtext);
                    clear legendtext;
                    [ax,h3]=suplabel('Pooled Termination Probability by Length - Linear'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Term_Prob_105_Length_Linear');
                    print('-djpeg',filename);
                    close all;
                    
            % Semilog - x
            
                % Bifurcation probability
            
                    figure;
                    legendtextcount = 0;
                    
                    for i=1:diameterlength
                        linpathlength = pathlength(~isnan(bifprob(i,:)));
                        linbifprob    = bifprob(i,~isnan(bifprob(i,:)));
                        logpathlength = linpathlength(linbifprob ~= 0);
                        logbifprob    = linbifprob(linbifprob ~= 0);
                        semilogx(linpathlength,linbifprob,styles{1,i});
                        if ~isempty(linbifprob)
                            hold on;
                            legendtextcount = legendtextcount + 1;
                            legendtext(1,legendtextcount) = {['Diameter: ' num2str(diameter(i))]};
                        end
                    end
                    xlabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Bifurcation Probability','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    legend(legendtext);
                    clear legendtext;
                    [ax,h3]=suplabel('Pooled Bifurcation Probability by Length - Semilog(x)'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Bif_Prob_106_Length_Semilog_x');
                    print('-djpeg',filename);
                    close all;
                    
                % Termination Probability
                
                    figure;
                    legendtextcount = 0;
                    
                    for i=1:diameterlength
                        linpathlength = pathlength(~isnan(termprob(i,:)));
                        lintermprob   = termprob(i,~isnan(termprob(i,:)));
                        logpathlength = linpathlength(lintermprob ~= 0);
                        logtermprob   = lintermprob(lintermprob ~= 0);
                        semilogx(linpathlength,lintermprob,styles{1,i});
                        if ~isempty(lintermprob)
                            hold on;
                            legendtextcount = legendtextcount + 1;
                            legendtext(1,legendtextcount) = {['Diameter: ' num2str(diameter(i))]};
                        end
                    end
                    xlabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Termination Probability','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    legend(legendtext);
                    clear legendtext;
                    [ax,h3]=suplabel('Pooled Termination Probability by Length - Semilog(x)'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Term_Prob_106_Length_Semilog_x');
                    print('-djpeg',filename);
                    close all;
                    
                    
            % Semilog - y
            
                % Bifurcation probability
            
                    figure;
                    legendtextcount = 0;
                    
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
                        end
                    end
                    xlabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Bifurcation Probability','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    legend(legendtext);
                    clear legendtext;
                    [ax,h3]=suplabel('Pooled Bifurcation Probability by Length - Semilog(y)'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Bif_Prob_107_Length_Semilog_y');
                    print('-djpeg',filename);
                    close all;
                    
                % Termination Probability
                
                    figure;
                    legendtextcount = 0;
                    
                    for i=1:diameterlength
                        linpathlength = pathlength(~isnan(termprob(i,:)));
                        lintermprob   = termprob(i,~isnan(termprob(i,:)));
                        logpathlength = linpathlength(lintermprob ~= 0);
                        logtermprob   = lintermprob(lintermprob ~= 0);
                        semilogy(logpathlength,logtermprob,styles{1,i});
                        if ~isempty(logtermprob)
                            hold on;
                            legendtextcount = legendtextcount + 1;
                            legendtext(1,legendtextcount) = {['Diameter: ' num2str(diameter(i))]};
                        end
                    end
                    xlabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Termination Probability','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    legend(legendtext);
                    clear legendtext;
                    [ax,h3]=suplabel('Pooled Termination Probability by Length - Semilog(y)'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Term_Prob_107_Length_Semilog_y');
                    print('-djpeg',filename);
                    close all;
                    
                    
            % Log-Log
            
                % Bifurcation probability
            
                    figure;
                    legendtextcount = 0;
                    
                    for i=1:diameterlength
                        linpathlength = pathlength(~isnan(bifprob(i,:)));
                        linbifprob    = bifprob(i,~isnan(bifprob(i,:)));
                        logpathlength = linpathlength(linbifprob ~= 0);
                        logbifprob    = linbifprob(linbifprob ~= 0);
                        loglog(logpathlength,logbifprob,styles{1,i});
                        if ~isempty(logbifprob)
                            hold on;
                            legendtextcount = legendtextcount + 1;
                            legendtext(1,legendtextcount) = {['Diameter: ' num2str(diameter(i))]};
                        end
                    end
                    xlabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Bifurcation Probability','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    legend(legendtext);
                    clear legendtext;
                    [ax,h3]=suplabel('Pooled Bifurcation Probability by Length - LogLog'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Bif_Prob_108_Length_LogLog');
                    print('-djpeg',filename);
                    close all;
                    
                % Termination Probability
                
                    figure;
                    legendtextcount = 0;
                    
                    for i=1:diameterlength
                        linpathlength = pathlength(~isnan(termprob(i,:)));
                        lintermprob   = termprob(i,~isnan(termprob(i,:)));
                        logpathlength = linpathlength(lintermprob ~= 0);
                        logtermprob   = lintermprob(lintermprob ~= 0);
                        loglog(logpathlength,logtermprob,styles{1,i});
                        if ~isempty(logtermprob)
                            hold on;
                            legendtextcount = legendtextcount + 1;
                            legendtext(1,legendtextcount) = {['Diameter: ' num2str(diameter(i))]};
                        end
                    end
                    xlabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Termination Probability','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    legend(legendtext);
                    clear legendtext;
                    [ax,h3]=suplabel('Pooled Termination Probability by Length - LogLog'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Term_Prob_108_Length_LogLog');
                    print('-djpeg',filename);
                    close all;
                
                    
                    
                    
    % By Surface Area

        [diameterlength,pathlengthlength] = size(controlanalysis.doublebin.bifurcationprobability.bysurfacearea);
        diameter = controlanalysis.doublebin.diameter(:,1);
        pathlength = controlanalysis.doublebin.pathlength(1,:);
        bifprob  = controlanalysis.doublebin.bifurcationprobability.bysurfacearea;
        termprob = controlanalysis.doublebin.terminationprobability.bysurfacearea;

        % Diameter on x-axis
        
            % Linear
            
                % Bifurcation probability
            
                    figure;
                    legendtextcount = 0;
                    
                    for i=1:pathlengthlength
                        lindiameter = diameter(~isnan(bifprob(:,i)));
                        linbifprob  = bifprob(~isnan(bifprob(:,i)),i);
                        logdiameter = lindiameter(linbifprob ~= 0);
                        logbifprob  = linbifprob(linbifprob ~= 0);
                        plot(lindiameter,linbifprob,styles{1,i});
                        if ~isempty(linbifprob)
                            hold on;
                            legendtextcount = legendtextcount + 1;
                            legendtext(1,legendtextcount) = {['Path Length: ' num2str(pathlength(i))]};
                        end
                    end
                    xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Bifurcation Probability','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    legend(legendtext);
                    clear legendtext;
                    [ax,h3]=suplabel('Pooled Bifurcation Probability by Surface Area - Linear'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Bif_Prob_201_SurfaceArea_Linear');
                    print('-djpeg',filename);
                    close all;
                    
                % Termination Probability
                
                    figure;
                    legendtextcount = 0;
                    
                    for i=1:pathlengthlength
                        lindiameter = diameter(~isnan(termprob(:,i)));
                        lintermprob = termprob(~isnan(termprob(:,i)),i);
                        logdiameter = lindiameter(lintermprob ~= 0);
                        logtermprob = lintermprob(lintermprob ~= 0);
                        plot(lindiameter,lintermprob,styles{1,i});
                        if ~isempty(lintermprob)
                            hold on;
                            legendtextcount = legendtextcount + 1;
                            legendtext(1,legendtextcount) = {['Path Length: ' num2str(pathlength(i))]};
                        end
                    end
                    xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Termination Probability','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    legend(legendtext);
                    clear legendtext;
                    [ax,h3]=suplabel('Pooled Termination Probability by Surface Area - Linear'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Term_Prob_201_SurfaceArea_Linear');
                    print('-djpeg',filename);
                    close all;
                    
            % Semilog - x
            
                % Bifurcation probability
            
                    figure;
                    legendtextcount = 0;
                    
                    for i=1:pathlengthlength
                        lindiameter = diameter(~isnan(bifprob(:,i)));
                        linbifprob  = bifprob(~isnan(bifprob(:,i)),i);
                        logdiameter = lindiameter(linbifprob ~= 0);
                        logbifprob  = linbifprob(linbifprob ~= 0);
                        semilogx(lindiameter,linbifprob,styles{1,i});
                        if ~isempty(linbifprob)
                            hold on;
                            legendtextcount = legendtextcount + 1;
                            legendtext(1,legendtextcount) = {['Path Length: ' num2str(pathlength(i))]};
                        end
                    end
                    xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Bifurcation Probability','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    legend(legendtext);
                    clear legendtext;
                    [ax,h3]=suplabel('Pooled Bifurcation Probability by Surface Area - Semilog(x)'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Bif_Prob_202_SurfaceArea_Semilog_x');
                    print('-djpeg',filename);
                    close all;
                    
                % Termination Probability
                
                    figure;
                    legendtextcount = 0;
                    
                    for i=1:pathlengthlength
                        lindiameter = diameter(~isnan(termprob(:,i)));
                        lintermprob = termprob(~isnan(termprob(:,i)),i);
                        logdiameter = lindiameter(lintermprob ~= 0);
                        logtermprob = lintermprob(lintermprob ~= 0);
                        semilogx(lindiameter,lintermprob,styles{1,i});
                        if ~isempty(lintermprob)
                            hold on;
                            legendtextcount = legendtextcount + 1;
                            legendtext(1,legendtextcount) = {['Path Length: ' num2str(pathlength(i))]};
                        end
                    end
                    xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Termination Probability','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    legend(legendtext);
                    clear legendtext;
                    [ax,h3]=suplabel('Pooled Termination Probability by Surface Area - Semilog(x)'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Term_Prob_202_SurfaceArea_Semilog_x');
                    print('-djpeg',filename);
                    close all;
                    
                    
            % Semilog - y
            
                % Bifurcation probability
            
                    figure;
                    legendtextcount = 0;
                    
                    for i=1:pathlengthlength
                        lindiameter = diameter(~isnan(bifprob(:,i)));
                        linbifprob  = bifprob(~isnan(bifprob(:,i)),i);
                        logdiameter = lindiameter(linbifprob ~= 0);
                        logbifprob  = linbifprob(linbifprob ~= 0);
                        semilogy(logdiameter,logbifprob,styles{1,i});
                        if ~isempty(logbifprob)
                            hold on;
                            legendtextcount = legendtextcount + 1;
                            legendtext(1,legendtextcount) = {['Path Length: ' num2str(pathlength(i))]};
                        end
                    end
                    xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Bifurcation Probability','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    legend(legendtext);
                    clear legendtext;
                    [ax,h3]=suplabel('Pooled Bifurcation Probability by Surface Area - Semilog(y)'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Bif_Prob_203_SurfaceArea_Semilog_y');
                    print('-djpeg',filename);
                    close all;
                    
                % Termination Probability
                
                    figure;
                    legendtextcount = 0;
                    
                    for i=1:pathlengthlength
                        lindiameter = diameter(~isnan(termprob(:,i)));
                        lintermprob = termprob(~isnan(termprob(:,i)),i);
                        logdiameter = lindiameter(lintermprob ~= 0);
                        logtermprob = lintermprob(lintermprob ~= 0);
                        semilogy(logdiameter,logtermprob,styles{1,i});
                        if ~isempty(logtermprob)
                            hold on;
                            legendtextcount = legendtextcount + 1;
                            legendtext(1,legendtextcount) = {['Path Length: ' num2str(pathlength(i))]};
                        end
                    end
                    xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Termination Probability','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    legend(legendtext);
                    clear legendtext;
                    [ax,h3]=suplabel('Pooled Termination Probability by Surface Area - Semilog(y)'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Term_Prob_203_SurfaceArea_Semilog_y');
                    print('-djpeg',filename);
                    close all;
                    
                    
            % Log-Log
            
                % Bifurcation probability
            
                    figure;
                    legendtextcount = 0;
                    
                    for i=1:pathlengthlength
                        lindiameter = diameter(~isnan(bifprob(:,i)));
                        linbifprob  = bifprob(~isnan(bifprob(:,i)),i);
                        logdiameter = lindiameter(linbifprob ~= 0);
                        logbifprob  = linbifprob(linbifprob ~= 0);
                        loglog(logdiameter,logbifprob,styles{1,i});
                        if ~isempty(logbifprob)
                            hold on;
                            legendtextcount = legendtextcount + 1;
                            legendtext(1,legendtextcount) = {['Path Length: ' num2str(pathlength(i))]};
                        end
                    end
                    xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Bifurcation Probability','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    legend(legendtext);
                    clear legendtext;
                    [ax,h3]=suplabel('Pooled Bifurcation Probability by Surface Area - LogLog'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Bif_Prob_204_SurfaceArea_LogLog');
                    print('-djpeg',filename);
                    close all;
                    
                % Termination Probability
                
                    figure;
                    legendtextcount = 0;
                    
                    for i=1:pathlengthlength
                        lindiameter = diameter(~isnan(termprob(:,i)));
                        lintermprob = termprob(~isnan(termprob(:,i)),i);
                        logdiameter = lindiameter(lintermprob ~= 0);
                        logtermprob = lintermprob(lintermprob ~= 0);
                        loglog(logdiameter,logtermprob,styles{1,i});
                        if ~isempty(logtermprob)
                            hold on;
                            legendtextcount = legendtextcount + 1;
                            legendtext(1,legendtextcount) = {['Path Length: ' num2str(pathlength(i))]};
                        end
                    end
                    xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Termination Probability','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    legend(legendtext);
                    clear legendtext;
                    [ax,h3]=suplabel('Pooled Termination Probability by Surface Area - LogLog'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Term_Prob_204_SurfaceArea_LogLog');
                    print('-djpeg',filename);
                    close all;

                    
        % Path Length on x-axis
        
            % Linear
            
                % Bifurcation probability
            
                    figure;
                    legendtextcount = 0;
                    
                    for i=1:diameterlength
                        linpathlength = pathlength(~isnan(bifprob(i,:)));
                        linbifprob    = bifprob(i,~isnan(bifprob(i,:)));
                        logpathlength = linpathlength(linbifprob ~= 0);
                        logbifprob    = linbifprob(linbifprob ~= 0);
                        plot(linpathlength,linbifprob,styles{1,i});
                        if ~isempty(linbifprob)
                            hold on;
                            legendtextcount = legendtextcount + 1;
                            legendtext(1,legendtextcount) = {['Diameter: ' num2str(diameter(i))]};
                        end
                    end
                    xlabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Bifurcation Probability','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    legend(legendtext);
                    clear legendtext;
                    [ax,h3]=suplabel('Pooled Bifurcation Probability by Surface Area - Linear'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Bif_Prob_205_SurfaceArea_Linear');
                    print('-djpeg',filename);
                    close all;
                    
                % Termination Probability
                
                    figure;
                    legendtextcount = 0;
                    
                    for i=1:diameterlength
                        linpathlength = pathlength(~isnan(termprob(i,:)));
                        lintermprob   = termprob(i,~isnan(termprob(i,:)));
                        logpathlength = linpathlength(lintermprob ~= 0);
                        logtermprob   = lintermprob(lintermprob ~= 0);
                        plot(linpathlength,lintermprob,styles{1,i});
                        if ~isempty(lintermprob)
                            hold on;
                            legendtextcount = legendtextcount + 1;
                            legendtext(1,legendtextcount) = {['Diameter: ' num2str(diameter(i))]};
                        end
                    end
                    xlabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Termination Probability','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    legend(legendtext);
                    clear legendtext;
                    [ax,h3]=suplabel('Pooled Termination Probability by Surface Area - Linear'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Term_Prob_205_SurfaceArea_Linear');
                    print('-djpeg',filename);
                    close all;
                    
            % Semilog - x
            
                % Bifurcation probability
            
                    figure;
                    legendtextcount = 0;
                    
                    for i=1:diameterlength
                        linpathlength = pathlength(~isnan(bifprob(i,:)));
                        linbifprob    = bifprob(i,~isnan(bifprob(i,:)));
                        logpathlength = linpathlength(linbifprob ~= 0);
                        logbifprob    = linbifprob(linbifprob ~= 0);
                        semilogx(linpathlength,linbifprob,styles{1,i});
                        if ~isempty(linbifprob)
                            hold on;
                            legendtextcount = legendtextcount + 1;
                            legendtext(1,legendtextcount) = {['Diameter: ' num2str(diameter(i))]};
                        end
                    end
                    xlabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Bifurcation Probability','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    legend(legendtext);
                    clear legendtext;
                    [ax,h3]=suplabel('Pooled Bifurcation Probability by Surface Area - Semilog(x)'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Bif_Prob_206_SurfaceArea_Semilog_x');
                    print('-djpeg',filename);
                    close all;
                    
                % Termination Probability
                
                    figure;
                    legendtextcount = 0;
                    
                    for i=1:diameterlength
                        linpathlength = pathlength(~isnan(termprob(i,:)));
                        lintermprob   = termprob(i,~isnan(termprob(i,:)));
                        logpathlength = linpathlength(lintermprob ~= 0);
                        logtermprob   = lintermprob(lintermprob ~= 0);
                        semilogx(linpathlength,lintermprob,styles{1,i});
                        if ~isempty(lintermprob)
                            hold on;
                            legendtextcount = legendtextcount + 1;
                            legendtext(1,legendtextcount) = {['Diameter: ' num2str(diameter(i))]};
                        end
                    end
                    xlabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Termination Probability','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    legend(legendtext);
                    clear legendtext;
                    [ax,h3]=suplabel('Pooled Termination Probability by Surface Area - Semilog(x)'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Term_Prob_206_SurfaceArea_Semilog_x');
                    print('-djpeg',filename);
                    close all;
                    
                    
            % Semilog - y
            
                % Bifurcation probability
            
                    figure;
                    legendtextcount = 0;
                    
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
                        end
                    end
                    xlabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Bifurcation Probability','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    legend(legendtext);
                    clear legendtext;
                    [ax,h3]=suplabel('Pooled Bifurcation Probability by Surface Area - Semilog(y)'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Bif_Prob_207_SurfaceArea_Semilog_y');
                    print('-djpeg',filename);
                    close all;
                    
                % Termination Probability
                
                    figure;
                    legendtextcount = 0;
                    
                    for i=1:diameterlength
                        linpathlength = pathlength(~isnan(termprob(i,:)));
                        lintermprob   = termprob(i,~isnan(termprob(i,:)));
                        logpathlength = linpathlength(lintermprob ~= 0);
                        logtermprob   = lintermprob(lintermprob ~= 0);
                        semilogy(logpathlength,logtermprob,styles{1,i});
                        if ~isempty(logtermprob)
                            hold on;
                            legendtextcount = legendtextcount + 1;
                            legendtext(1,legendtextcount) = {['Diameter: ' num2str(diameter(i))]};
                        end
                    end
                    xlabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Termination Probability','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    legend(legendtext);
                    clear legendtext;
                    [ax,h3]=suplabel('Pooled Termination Probability by Surface Area - Semilog(y)'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Term_Prob_207_SurfaceArea_Semilog_y');
                    print('-djpeg',filename);
                    close all;
                    
                    
            % Log-Log
            
                % Bifurcation probability
            
                    figure;
                    legendtextcount = 0;
                    
                    for i=1:diameterlength
                        linpathlength = pathlength(~isnan(bifprob(i,:)));
                        linbifprob    = bifprob(i,~isnan(bifprob(i,:)));
                        logpathlength = linpathlength(linbifprob ~= 0);
                        logbifprob    = linbifprob(linbifprob ~= 0);
                        loglog(logpathlength,logbifprob,styles{1,i});
                        if ~isempty(logbifprob)
                            hold on;
                            legendtextcount = legendtextcount + 1;
                            legendtext(1,legendtextcount) = {['Diameter: ' num2str(diameter(i))]};
                        end
                    end
                    xlabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Bifurcation Probability','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    legend(legendtext);
                    clear legendtext;
                    [ax,h3]=suplabel('Pooled Bifurcation Probability by Surface Area - LogLog'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Bif_Prob_208_SurfaceArea_LogLog');
                    print('-djpeg',filename);
                    close all;
                    
                % Termination Probability
                
                    figure;
                    legendtextcount = 0;
                    
                    for i=1:diameterlength
                        linpathlength = pathlength(~isnan(termprob(i,:)));
                        lintermprob   = termprob(i,~isnan(termprob(i,:)));
                        logpathlength = linpathlength(lintermprob ~= 0);
                        logtermprob   = lintermprob(lintermprob ~= 0);
                        loglog(logpathlength,logtermprob,styles{1,i});
                        if ~isempty(logtermprob)
                            hold on;
                            legendtextcount = legendtextcount + 1;
                            legendtext(1,legendtextcount) = {['Diameter: ' num2str(diameter(i))]};
                        end
                    end
                    xlabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Termination Probability','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    legend(legendtext);
                    clear legendtext;
                    [ax,h3]=suplabel('Pooled Termination Probability by Surface Area - LogLog'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Term_Prob_208_SurfaceArea_LogLog');
                    print('-djpeg',filename);
                    close all;
                    
                    
                    
    % By Volume

        [diameterlength,pathlengthlength] = size(controlanalysis.doublebin.bifurcationprobability.byvolume);
        diameter = controlanalysis.doublebin.diameter(:,1);
        pathlength = controlanalysis.doublebin.pathlength(1,:);
        bifprob  = controlanalysis.doublebin.bifurcationprobability.byvolume;
        termprob = controlanalysis.doublebin.terminationprobability.byvolume;

        % Diameter on x-axis
        
            % Linear
            
                % Bifurcation probability
            
                    figure;
                    legendtextcount = 0;
                    
                    for i=1:pathlengthlength
                        lindiameter = diameter(~isnan(bifprob(:,i)));
                        linbifprob  = bifprob(~isnan(bifprob(:,i)),i);
                        logdiameter = lindiameter(linbifprob ~= 0);
                        logbifprob  = linbifprob(linbifprob ~= 0);
                        plot(lindiameter,linbifprob,styles{1,i});
                        if ~isempty(linbifprob)
                            hold on;
                            legendtextcount = legendtextcount + 1;
                            legendtext(1,legendtextcount) = {['Path Length: ' num2str(pathlength(i))]};
                        end
                    end
                    xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Bifurcation Probability','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    legend(legendtext);
                    clear legendtext;
                    [ax,h3]=suplabel('Pooled Bifurcation Probability by Volume - Linear'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Bif_Prob_301_Volume_Linear');
                    print('-djpeg',filename);
                    close all;
                    
                % Termination Probability
                
                    figure;
                    legendtextcount = 0;
                    
                    for i=1:pathlengthlength
                        lindiameter = diameter(~isnan(termprob(:,i)));
                        lintermprob = termprob(~isnan(termprob(:,i)),i);
                        logdiameter = lindiameter(lintermprob ~= 0);
                        logtermprob = lintermprob(lintermprob ~= 0);
                        plot(lindiameter,lintermprob,styles{1,i});
                        if ~isempty(lintermprob)
                            hold on;
                            legendtextcount = legendtextcount + 1;
                            legendtext(1,legendtextcount) = {['Path Length: ' num2str(pathlength(i))]};
                        end
                    end
                    xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Termination Probability','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    legend(legendtext);
                    clear legendtext;
                    [ax,h3]=suplabel('Pooled Termination Probability by Volume - Linear'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Term_Prob_301_Volume_Linear');
                    print('-djpeg',filename);
                    close all;
                    
            % Semilog - x
            
                % Bifurcation probability
            
                    figure;
                    legendtextcount = 0;
                    
                    for i=1:pathlengthlength
                        lindiameter = diameter(~isnan(bifprob(:,i)));
                        linbifprob  = bifprob(~isnan(bifprob(:,i)),i);
                        logdiameter = lindiameter(linbifprob ~= 0);
                        logbifprob  = linbifprob(linbifprob ~= 0);
                        semilogx(lindiameter,linbifprob,styles{1,i});
                        if ~isempty(linbifprob)
                            hold on;
                            legendtextcount = legendtextcount + 1;
                            legendtext(1,legendtextcount) = {['Path Length: ' num2str(pathlength(i))]};
                        end
                    end
                    xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Bifurcation Probability','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    legend(legendtext);
                    clear legendtext;
                    [ax,h3]=suplabel('Pooled Bifurcation Probability by Volume - Semilog(x)'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Bif_Prob_302_Volume_Semilog_x');
                    print('-djpeg',filename);
                    close all;
                    
                % Termination Probability
                
                    figure;
                    legendtextcount = 0;
                    
                    for i=1:pathlengthlength
                        lindiameter = diameter(~isnan(termprob(:,i)));
                        lintermprob = termprob(~isnan(termprob(:,i)),i);
                        logdiameter = lindiameter(lintermprob ~= 0);
                        logtermprob = lintermprob(lintermprob ~= 0);
                        semilogx(lindiameter,lintermprob,styles{1,i});
                        if ~isempty(lintermprob)
                            hold on;
                            legendtextcount = legendtextcount + 1;
                            legendtext(1,legendtextcount) = {['Path Length: ' num2str(pathlength(i))]};
                        end
                    end
                    xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Termination Probability','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    legend(legendtext);
                    clear legendtext;
                    [ax,h3]=suplabel('Pooled Termination Probability by Volume - Semilog(x)'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Term_Prob_302_Volume_Semilog_x');
                    print('-djpeg',filename);
                    close all;
                    
                    
            % Semilog - y
            
                % Bifurcation probability
            
                    figure;
                    legendtextcount = 0;
                    
                    for i=1:pathlengthlength
                        lindiameter = diameter(~isnan(bifprob(:,i)));
                        linbifprob  = bifprob(~isnan(bifprob(:,i)),i);
                        logdiameter = lindiameter(linbifprob ~= 0);
                        logbifprob  = linbifprob(linbifprob ~= 0);
                        semilogy(logdiameter,logbifprob,styles{1,i});
                        if ~isempty(logbifprob)
                            hold on;
                            legendtextcount = legendtextcount + 1;
                            legendtext(1,legendtextcount) = {['Path Length: ' num2str(pathlength(i))]};
                        end
                    end
                    xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Bifurcation Probability','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    legend(legendtext);
                    clear legendtext;
                    [ax,h3]=suplabel('Pooled Bifurcation Probability by Volume - Semilog(y)'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Bif_Prob_303_Volume_Semilog_y');
                    print('-djpeg',filename);
                    close all;
                    
                % Termination Probability
                
                    figure;
                    legendtextcount = 0;
                    
                    for i=1:pathlengthlength
                        lindiameter = diameter(~isnan(termprob(:,i)));
                        lintermprob = termprob(~isnan(termprob(:,i)),i);
                        logdiameter = lindiameter(lintermprob ~= 0);
                        logtermprob = lintermprob(lintermprob ~= 0);
                        semilogy(logdiameter,logtermprob,styles{1,i});
                        if ~isempty(logtermprob)
                            hold on;
                            legendtextcount = legendtextcount + 1;
                            legendtext(1,legendtextcount) = {['Path Length: ' num2str(pathlength(i))]};
                        end
                    end
                    xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Termination Probability','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    legend(legendtext);
                    clear legendtext;
                    [ax,h3]=suplabel('Pooled Termination Probability by Volume - Semilog(y)'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Term_Prob_303_Volume_Semilog_y');
                    print('-djpeg',filename);
                    close all;
                    
                    
            % Log-Log
            
                % Bifurcation probability
            
                    figure;
                    legendtextcount = 0;
                    
                    for i=1:pathlengthlength
                        lindiameter = diameter(~isnan(bifprob(:,i)));
                        linbifprob  = bifprob(~isnan(bifprob(:,i)),i);
                        logdiameter = lindiameter(linbifprob ~= 0);
                        logbifprob  = linbifprob(linbifprob ~= 0);
                        loglog(logdiameter,logbifprob,styles{1,i});
                        if ~isempty(logbifprob)
                            hold on;
                            legendtextcount = legendtextcount + 1;
                            legendtext(1,legendtextcount) = {['Path Length: ' num2str(pathlength(i))]};
                        end
                    end
                    xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Bifurcation Probability','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    legend(legendtext);
                    clear legendtext;
                    [ax,h3]=suplabel('Pooled Bifurcation Probability by Volume - LogLog'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Bif_Prob_304_Volume_LogLog');
                    print('-djpeg',filename);
                    close all;
                    
                % Termination Probability
                
                    figure;
                    legendtextcount = 0;
                    
                    for i=1:pathlengthlength
                        lindiameter = diameter(~isnan(termprob(:,i)));
                        lintermprob = termprob(~isnan(termprob(:,i)),i);
                        logdiameter = lindiameter(lintermprob ~= 0);
                        logtermprob = lintermprob(lintermprob ~= 0);
                        loglog(logdiameter,logtermprob,styles{1,i});
                        if ~isempty(logtermprob)
                            hold on;
                            legendtextcount = legendtextcount + 1;
                            legendtext(1,legendtextcount) = {['Path Length: ' num2str(pathlength(i))]};
                        end
                    end
                    xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Termination Probability','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    legend(legendtext);
                    clear legendtext;
                    [ax,h3]=suplabel('Pooled Termination Probability by Volume - LogLog'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Term_Prob_304_Volume_LogLog');
                    print('-djpeg',filename);
                    close all;

                    
        % Path Length on x-axis
        
            % Linear
            
                % Bifurcation probability
            
                    figure;
                    legendtextcount = 0;
                    
                    for i=1:diameterlength
                        linpathlength = pathlength(~isnan(bifprob(i,:)));
                        linbifprob    = bifprob(i,~isnan(bifprob(i,:)));
                        logpathlength = linpathlength(linbifprob ~= 0);
                        logbifprob    = linbifprob(linbifprob ~= 0);
                        plot(linpathlength,linbifprob,styles{1,i});
                        if ~isempty(linbifprob)
                            hold on;
                            legendtextcount = legendtextcount + 1;
                            legendtext(1,legendtextcount) = {['Diameter: ' num2str(diameter(i))]};
                        end
                    end
                    xlabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Bifurcation Probability','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    legend(legendtext);
                    clear legendtext;
                    [ax,h3]=suplabel('Pooled Bifurcation Probability by Volume - Linear'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Bif_Prob_305_Volume_Linear');
                    print('-djpeg',filename);
                    close all;
                    
                % Termination Probability
                
                    figure;
                    legendtextcount = 0;
                    
                    for i=1:diameterlength
                        linpathlength = pathlength(~isnan(termprob(i,:)));
                        lintermprob   = termprob(i,~isnan(termprob(i,:)));
                        logpathlength = linpathlength(lintermprob ~= 0);
                        logtermprob   = lintermprob(lintermprob ~= 0);
                        plot(linpathlength,lintermprob,styles{1,i});
                        if ~isempty(lintermprob)
                            hold on;
                            legendtextcount = legendtextcount + 1;
                            legendtext(1,legendtextcount) = {['Diameter: ' num2str(diameter(i))]};
                        end
                    end
                    xlabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Termination Probability','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    legend(legendtext);
                    clear legendtext;
                    [ax,h3]=suplabel('Pooled Termination Probability by Volume - Linear'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Term_Prob_305_Volume_Linear');
                    print('-djpeg',filename);
                    close all;
                    
            % Semilog - x
            
                % Bifurcation probability
            
                    figure;
                    legendtextcount = 0;
                    
                    for i=1:diameterlength
                        linpathlength = pathlength(~isnan(bifprob(i,:)));
                        linbifprob    = bifprob(i,~isnan(bifprob(i,:)));
                        logpathlength = linpathlength(linbifprob ~= 0);
                        logbifprob    = linbifprob(linbifprob ~= 0);
                        semilogx(linpathlength,linbifprob,styles{1,i});
                        if ~isempty(linbifprob)
                            hold on;
                            legendtextcount = legendtextcount + 1;
                            legendtext(1,legendtextcount) = {['Diameter: ' num2str(diameter(i))]};
                        end
                    end
                    xlabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Bifurcation Probability','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    legend(legendtext);
                    clear legendtext;
                    [ax,h3]=suplabel('Pooled Bifurcation Probability by Volume - Semilog(x)'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Bif_Prob_306_Volume_Semilog_x');
                    print('-djpeg',filename);
                    close all;
                    
                % Termination Probability
                
                    figure;
                    legendtextcount = 0;
                    
                    for i=1:diameterlength
                        linpathlength = pathlength(~isnan(termprob(i,:)));
                        lintermprob   = termprob(i,~isnan(termprob(i,:)));
                        logpathlength = linpathlength(lintermprob ~= 0);
                        logtermprob   = lintermprob(lintermprob ~= 0);
                        semilogx(linpathlength,lintermprob,styles{1,i});
                        if ~isempty(lintermprob)
                            hold on;
                            legendtextcount = legendtextcount + 1;
                            legendtext(1,legendtextcount) = {['Diameter: ' num2str(diameter(i))]};
                        end
                    end
                    xlabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Termination Probability','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    legend(legendtext);
                    clear legendtext;
                    [ax,h3]=suplabel('Pooled Termination Probability by Volume - Semilog(x)'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Term_Prob_306_Volume_Semilog_x');
                    print('-djpeg',filename);
                    close all;
                    
                    
            % Semilog - y
            
                % Bifurcation probability
            
                    figure;
                    legendtextcount = 0;
                    
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
                        end
                    end
                    xlabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Bifurcation Probability','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    legend(legendtext);
                    clear legendtext;
                    [ax,h3]=suplabel('Pooled Bifurcation Probability by Volume - Semilog(y)'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Bif_Prob_307_Volume_Semilog_y');
                    print('-djpeg',filename);
                    close all;
                    
                % Termination Probability
                
                    figure;
                    legendtextcount = 0;
                    
                    for i=1:diameterlength
                        linpathlength = pathlength(~isnan(termprob(i,:)));
                        lintermprob   = termprob(i,~isnan(termprob(i,:)));
                        logpathlength = linpathlength(lintermprob ~= 0);
                        logtermprob   = lintermprob(lintermprob ~= 0);
                        semilogy(logpathlength,logtermprob,styles{1,i});
                        if ~isempty(logtermprob)
                            hold on;
                            legendtextcount = legendtextcount + 1;
                            legendtext(1,legendtextcount) = {['Diameter: ' num2str(diameter(i))]};
                        end
                    end
                    xlabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Termination Probability','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    legend(legendtext);
                    clear legendtext;
                    [ax,h3]=suplabel('Pooled Termination Probability by Volume - Semilog(y)'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Term_Prob_307_Volume_Semilog_y');
                    print('-djpeg',filename);
                    close all;
                    
                    
            % Log-Log
            
                % Bifurcation probability
            
                    figure;
                    legendtextcount = 0;
                    
                    for i=1:diameterlength
                        linpathlength = pathlength(~isnan(bifprob(i,:)));
                        linbifprob    = bifprob(i,~isnan(bifprob(i,:)));
                        logpathlength = linpathlength(linbifprob ~= 0);
                        logbifprob    = linbifprob(linbifprob ~= 0);
                        loglog(logpathlength,logbifprob,styles{1,i});
                        if ~isempty(logbifprob)
                            hold on;
                            legendtextcount = legendtextcount + 1;
                            legendtext(1,legendtextcount) = {['Diameter: ' num2str(diameter(i))]};
                        end
                    end
                    xlabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Bifurcation Probability','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    legend(legendtext);
                    clear legendtext;
                    [ax,h3]=suplabel('Pooled Bifurcation Probability by Volume - LogLog'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Bif_Prob_308_Volume_LogLog');
                    print('-djpeg',filename);
                    close all;
                    
                % Termination Probability
                
                    figure;
                    legendtextcount = 0;
                    
                    for i=1:diameterlength
                        linpathlength = pathlength(~isnan(termprob(i,:)));
                        lintermprob   = termprob(i,~isnan(termprob(i,:)));
                        logpathlength = linpathlength(lintermprob ~= 0);
                        logtermprob   = lintermprob(lintermprob ~= 0);
                        loglog(logpathlength,logtermprob,styles{1,i});
                        if ~isempty(logtermprob)
                            hold on;
                            legendtextcount = legendtextcount + 1;
                            legendtext(1,legendtextcount) = {['Diameter: ' num2str(diameter(i))]};
                        end
                    end
                    xlabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Termination Probability','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    legend(legendtext);
                    clear legendtext;
                    [ax,h3]=suplabel('Pooled Termination Probability by Volume - LogLog'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Term_Prob_308_Volume_LogLog');
                    print('-djpeg',filename);
                    close all;
                    
                    
                    
                    
                    
                    
                    
                    
                    
% Bifurcation -- Unpooled (bifs and terms separate) Probabilities
    
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
    if exist('separate','dir')==7
        cd('separate');
    else
        mkdir('separate');
        cd('separate');
    end
    
    
    % By Length

        [diameterlength,pathlengthlength] = size(controlanalysis.bifurcation.doublebin.bifurcationprobability.bylength);
        diameter = controlanalysis.bifurcation.doublebin.diameter(:,1);
        pathlength = controlanalysis.bifurcation.doublebin.pathlength(1,:);
        bifprob  = controlanalysis.bifurcation.doublebin.bifurcationprobability.bylength;
        termprob = controlanalysis.bifurcation.doublebin.terminationprobability.bylength;

        % Diameter on x-axis
        
            % Linear
            
                % Bifurcation probability
            
                    figure;
                    legendtextcount = 0;
                    
                    for i=1:pathlengthlength
                        lindiameter = diameter(~isnan(bifprob(:,i)));
                        linbifprob  = bifprob(~isnan(bifprob(:,i)),i);
                        logdiameter = lindiameter(linbifprob ~= 0);
                        logbifprob  = linbifprob(linbifprob ~= 0);
                        plot(lindiameter,linbifprob,styles{1,i});
                        if ~isempty(linbifprob)
                            hold on;
                            legendtextcount = legendtextcount + 1;
                            legendtext(1,legendtextcount) = {['Path Length: ' num2str(pathlength(i))]};
                        end
                    end
                    xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Bifurcation Probability','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    legend(legendtext);
                    clear legendtext;
                    [ax,h3]=suplabel('Bifurcation Probability by Length - Linear'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Bif_Prob_101_Length_Linear');
                    print('-djpeg',filename);
                    close all;
                    
%                 % Termination Probability
%                 
%                     figure;
%                     legendtextcount = 0;
%                     
%                     for i=1:pathlengthlength
%                         lindiameter = diameter(~isnan(termprob(:,i)));
%                         lintermprob = termprob(~isnan(termprob(:,i)),i);
%                         logdiameter = lindiameter(lintermprob ~= 0);
%                         logtermprob = lintermprob(lintermprob ~= 0);
%                         plot(lindiameter,lintermprob,styles{1,i});
%                         if ~isempty(lintermprob)
%                             hold on;
%                             legendtextcount = legendtextcount + 1;
%                             legendtext(1,legendtextcount) = {['Path Length: ' num2str(pathlength(i))]};
%                         end
%                     end
%                     xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
%                     ylabel('Termination Probability','FontSize',labelfontsize,'FontWeight','b');
%                     set(gca,'FontSize',axesfontsize);
%                     legend(legendtext);
%                     clear legendtext;
%                     [ax,h3]=suplabel('Termination Probability by Length - Linear'  ,'t');
%                     set(h3,'FontSize',titlefontsize);
%                     fillscreen;
%                     filename = sprintf('%s_%s',controlanalysis.inputfilename,'Term_Prob_101_Length_Linear');
%                     print('-djpeg',filename);
%                     close all;
                    
            % Semilog - x
            
                % Bifurcation probability
            
                    figure;
                    legendtextcount = 0;
                    
                    for i=1:pathlengthlength
                        lindiameter = diameter(~isnan(bifprob(:,i)));
                        linbifprob  = bifprob(~isnan(bifprob(:,i)),i);
                        logdiameter = lindiameter(linbifprob ~= 0);
                        logbifprob  = linbifprob(linbifprob ~= 0);
                        semilogx(lindiameter,linbifprob,styles{1,i});
                        if ~isempty(linbifprob)
                            hold on;
                            legendtextcount = legendtextcount + 1;
                            legendtext(1,legendtextcount) = {['Path Length: ' num2str(pathlength(i))]};
                        end
                    end
                    xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Bifurcation Probability','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    legend(legendtext);
                    clear legendtext;
                    [ax,h3]=suplabel('Bifurcation Probability by Length - Semilog(x)'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Bif_Prob_102_Length_Semilog_x');
                    print('-djpeg',filename);
                    close all;
                    
%                 % Termination Probability
%                 
%                     figure;
%                     legendtextcount = 0;
%                     
%                     for i=1:pathlengthlength
%                         lindiameter = diameter(~isnan(termprob(:,i)));
%                         lintermprob = termprob(~isnan(termprob(:,i)),i);
%                         logdiameter = lindiameter(lintermprob ~= 0);
%                         logtermprob = lintermprob(lintermprob ~= 0);
%                         semilogx(lindiameter,lintermprob,styles{1,i});
%                         if ~isempty(lintermprob)
%                             hold on;
%                             legendtextcount = legendtextcount + 1;
%                             legendtext(1,legendtextcount) = {['Path Length: ' num2str(pathlength(i))]};
%                         end
%                     end
%                     xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
%                     ylabel('Termination Probability','FontSize',labelfontsize,'FontWeight','b');
%                     set(gca,'FontSize',axesfontsize);
%                     legend(legendtext);
%                     clear legendtext;
%                     [ax,h3]=suplabel('Termination Probability by Length - Semilog(x)'  ,'t');
%                     set(h3,'FontSize',titlefontsize);
%                     fillscreen;
%                     filename = sprintf('%s_%s',controlanalysis.inputfilename,'Term_Prob_102_Length_Semilog_x');
%                     print('-djpeg',filename);
%                     close all;
                    
                    
            % Semilog - y
            
                % Bifurcation probability
            
                    figure;
                    legendtextcount = 0;
                    
                    for i=1:pathlengthlength
                        lindiameter = diameter(~isnan(bifprob(:,i)));
                        linbifprob  = bifprob(~isnan(bifprob(:,i)),i);
                        logdiameter = lindiameter(linbifprob ~= 0);
                        logbifprob  = linbifprob(linbifprob ~= 0);
                        semilogy(logdiameter,logbifprob,styles{1,i});
                        if ~isempty(logbifprob)
                            hold on;
                            legendtextcount = legendtextcount + 1;
                            legendtext(1,legendtextcount) = {['Path Length: ' num2str(pathlength(i))]};
                        end
                    end
                    xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Bifurcation Probability','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    legend(legendtext);
                    clear legendtext;
                    [ax,h3]=suplabel('Bifurcation Probability by Length - Semilog(y)'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Bif_Prob_103_Length_Semilog_y');
                    print('-djpeg',filename);
                    close all;
                    
%                 % Termination Probability
%                 
%                     figure;
%                     legendtextcount = 0;
%                     
%                     for i=1:pathlengthlength
%                         lindiameter = diameter(~isnan(termprob(:,i)));
%                         lintermprob = termprob(~isnan(termprob(:,i)),i);
%                         logdiameter = lindiameter(lintermprob ~= 0);
%                         logtermprob = lintermprob(lintermprob ~= 0);
%                         semilogy(logdiameter,logtermprob,styles{1,i});
%                         if ~isempty(logtermprob)
%                             hold on;
%                             legendtextcount = legendtextcount + 1;
%                             legendtext(1,legendtextcount) = {['Path Length: ' num2str(pathlength(i))]};
%                         end
%                     end
%                     xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
%                     ylabel('Termination Probability','FontSize',labelfontsize,'FontWeight','b');
%                     set(gca,'FontSize',axesfontsize);
%                     legend(legendtext);
%                     clear legendtext;
%                     [ax,h3]=suplabel('Termination Probability by Length - Semilog(y)'  ,'t');
%                     set(h3,'FontSize',titlefontsize);
%                     fillscreen;
%                     filename = sprintf('%s_%s',controlanalysis.inputfilename,'Term_Prob_103_Length_Semilog_y');
%                     print('-djpeg',filename);
%                     close all;
                    
                    
            % Log-Log
            
                % Bifurcation probability
            
                    figure;
                    legendtextcount = 0;
                    
                    for i=1:pathlengthlength
                        lindiameter = diameter(~isnan(bifprob(:,i)));
                        linbifprob  = bifprob(~isnan(bifprob(:,i)),i);
                        logdiameter = lindiameter(linbifprob ~= 0);
                        logbifprob  = linbifprob(linbifprob ~= 0);
                        loglog(logdiameter,logbifprob,styles{1,i});
                        if ~isempty(logbifprob)
                            hold on;
                            legendtextcount = legendtextcount + 1;
                            legendtext(1,legendtextcount) = {['Path Length: ' num2str(pathlength(i))]};
                        end
                    end
                    xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Bifurcation Probability','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    legend(legendtext);
                    clear legendtext;
                    [ax,h3]=suplabel('Bifurcation Probability by Length - LogLog'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Bif_Prob_104_Length_LogLog');
                    print('-djpeg',filename);
                    close all;
                    
%                 % Termination Probability
%                 
%                     figure;
%                     legendtextcount = 0;
%                     
%                     for i=1:pathlengthlength
%                         lindiameter = diameter(~isnan(termprob(:,i)));
%                         lintermprob = termprob(~isnan(termprob(:,i)),i);
%                         logdiameter = lindiameter(lintermprob ~= 0);
%                         logtermprob = lintermprob(lintermprob ~= 0);
%                         loglog(logdiameter,logtermprob,styles{1,i});
%                         if ~isempty(logtermprob)
%                             hold on;
%                             legendtextcount = legendtextcount + 1;
%                             legendtext(1,legendtextcount) = {['Path Length: ' num2str(pathlength(i))]};
%                         end
%                     end
%                     xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
%                     ylabel('Termination Probability','FontSize',labelfontsize,'FontWeight','b');
%                     set(gca,'FontSize',axesfontsize);
%                     legend(legendtext);
%                     clear legendtext;
%                     [ax,h3]=suplabel('Termination Probability by Length - LogLog'  ,'t');
%                     set(h3,'FontSize',titlefontsize);
%                     fillscreen;
%                     filename = sprintf('%s_%s',controlanalysis.inputfilename,'Term_Prob_104_Length_LogLog');
%                     print('-djpeg',filename);
%                     close all;

                    
        % Path Length on x-axis
        
            % Linear
            
                % Bifurcation probability
            
                    figure;
                    legendtextcount = 0;
                    
                    for i=1:diameterlength
                        linpathlength = pathlength(~isnan(bifprob(i,:)));
                        linbifprob    = bifprob(i,~isnan(bifprob(i,:)));
                        logpathlength = linpathlength(linbifprob ~= 0);
                        logbifprob    = linbifprob(linbifprob ~= 0);
                        plot(linpathlength,linbifprob,styles{1,i});
                        if ~isempty(linbifprob)
                            hold on;
                            legendtextcount = legendtextcount + 1;
                            legendtext(1,legendtextcount) = {['Diameter: ' num2str(diameter(i))]};
                        end
                    end
                    xlabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Bifurcation Probability','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    legend(legendtext);
                    clear legendtext;
                    [ax,h3]=suplabel('Bifurcation Probability by Length - Linear'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Bif_Prob_105_Length_Linear');
                    print('-djpeg',filename);
                    close all;
                    
%                 % Termination Probability
%                 
%                     figure;
%                     legendtextcount = 0;
%                     
%                     for i=1:diameterlength
%                         linpathlength = pathlength(~isnan(termprob(i,:)));
%                         lintermprob   = termprob(i,~isnan(termprob(i,:)));
%                         logpathlength = linpathlength(lintermprob ~= 0);
%                         logtermprob   = lintermprob(lintermprob ~= 0);
%                         plot(linpathlength,lintermprob,styles{1,i});
%                         if ~isempty(lintermprob)
%                             hold on;
%                             legendtextcount = legendtextcount + 1;
%                             legendtext(1,legendtextcount) = {['Diameter: ' num2str(diameter(i))]};
%                         end
%                     end
%                     xlabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
%                     ylabel('Termination Probability','FontSize',labelfontsize,'FontWeight','b');
%                     set(gca,'FontSize',axesfontsize);
%                     legend(legendtext);
%                     clear legendtext;
%                     [ax,h3]=suplabel('Termination Probability by Length - Linear'  ,'t');
%                     set(h3,'FontSize',titlefontsize);
%                     fillscreen;
%                     filename = sprintf('%s_%s',controlanalysis.inputfilename,'Term_Prob_105_Length_Linear');
%                     print('-djpeg',filename);
%                     close all;
                    
            % Semilog - x
            
                % Bifurcation probability
            
                    figure;
                    legendtextcount = 0;
                    
                    for i=1:diameterlength
                        linpathlength = pathlength(~isnan(bifprob(i,:)));
                        linbifprob    = bifprob(i,~isnan(bifprob(i,:)));
                        logpathlength = linpathlength(linbifprob ~= 0);
                        logbifprob    = linbifprob(linbifprob ~= 0);
                        semilogx(linpathlength,linbifprob,styles{1,i});
                        if ~isempty(linbifprob)
                            hold on;
                            legendtextcount = legendtextcount + 1;
                            legendtext(1,legendtextcount) = {['Diameter: ' num2str(diameter(i))]};
                        end
                    end
                    xlabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Bifurcation Probability','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    legend(legendtext);
                    clear legendtext;
                    [ax,h3]=suplabel('Bifurcation Probability by Length - Semilog(x)'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Bif_Prob_106_Length_Semilog_x');
                    print('-djpeg',filename);
                    close all;
                    
%                 % Termination Probability
%                 
%                     figure;
%                     legendtextcount = 0;
%                     
%                     for i=1:diameterlength
%                         linpathlength = pathlength(~isnan(termprob(i,:)));
%                         lintermprob   = termprob(i,~isnan(termprob(i,:)));
%                         logpathlength = linpathlength(lintermprob ~= 0);
%                         logtermprob   = lintermprob(lintermprob ~= 0);
%                         semilogx(linpathlength,lintermprob,styles{1,i});
%                         if ~isempty(lintermprob)
%                             hold on;
%                             legendtextcount = legendtextcount + 1;
%                             legendtext(1,legendtextcount) = {['Diameter: ' num2str(diameter(i))]};
%                         end
%                     end
%                     xlabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
%                     ylabel('Termination Probability','FontSize',labelfontsize,'FontWeight','b');
%                     set(gca,'FontSize',axesfontsize);
%                     legend(legendtext);
%                     clear legendtext;
%                     [ax,h3]=suplabel('Termination Probability by Length - Semilog(x)'  ,'t');
%                     set(h3,'FontSize',titlefontsize);
%                     fillscreen;
%                     filename = sprintf('%s_%s',controlanalysis.inputfilename,'Term_Prob_106_Length_Semilog_x');
%                     print('-djpeg',filename);
%                     close all;
                    
                    
            % Semilog - y
            
                % Bifurcation probability
            
                    figure;
                    legendtextcount = 0;
                    
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
                        end
                    end
                    xlabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Bifurcation Probability','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    legend(legendtext);
                    clear legendtext;
                    [ax,h3]=suplabel('Bifurcation Probability by Length - Semilog(y)'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Bif_Prob_107_Length_Semilog_y');
                    print('-djpeg',filename);
                    close all;
                    
%                 % Termination Probability
%                 
%                     figure;
%                     legendtextcount = 0;
%                     
%                     for i=1:diameterlength
%                         linpathlength = pathlength(~isnan(termprob(i,:)));
%                         lintermprob   = termprob(i,~isnan(termprob(i,:)));
%                         logpathlength = linpathlength(lintermprob ~= 0);
%                         logtermprob   = lintermprob(lintermprob ~= 0);
%                         semilogy(logpathlength,logtermprob,styles{1,i});
%                         if ~isempty(logtermprob)
%                             hold on;
%                             legendtextcount = legendtextcount + 1;
%                             legendtext(1,legendtextcount) = {['Diameter: ' num2str(diameter(i))]};
%                         end
%                     end
%                     xlabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
%                     ylabel('Termination Probability','FontSize',labelfontsize,'FontWeight','b');
%                     set(gca,'FontSize',axesfontsize);
%                     legend(legendtext);
%                     clear legendtext;
%                     [ax,h3]=suplabel('Termination Probability by Length - Semilog(y)'  ,'t');
%                     set(h3,'FontSize',titlefontsize);
%                     fillscreen;
%                     filename = sprintf('%s_%s',controlanalysis.inputfilename,'Term_Prob_107_Length_Semilog_y');
%                     print('-djpeg',filename);
%                     close all;
                    
                    
            % Log-Log
            
                % Bifurcation probability
            
                    figure;
                    legendtextcount = 0;
                    
                    for i=1:diameterlength
                        linpathlength = pathlength(~isnan(bifprob(i,:)));
                        linbifprob    = bifprob(i,~isnan(bifprob(i,:)));
                        logpathlength = linpathlength(linbifprob ~= 0);
                        logbifprob    = linbifprob(linbifprob ~= 0);
                        loglog(logpathlength,logbifprob,styles{1,i});
                        if ~isempty(logbifprob)
                            hold on;
                            legendtextcount = legendtextcount + 1;
                            legendtext(1,legendtextcount) = {['Diameter: ' num2str(diameter(i))]};
                        end
                    end
                    xlabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Bifurcation Probability','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    legend(legendtext);
                    clear legendtext;
                    [ax,h3]=suplabel('Bifurcation Probability by Length - LogLog'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Bif_Prob_108_Length_LogLog');
                    print('-djpeg',filename);
                    close all;
                    
%                 % Termination Probability
%                 
%                     figure;
%                     legendtextcount = 0;
%                     
%                     for i=1:diameterlength
%                         linpathlength = pathlength(~isnan(termprob(i,:)));
%                         lintermprob   = termprob(i,~isnan(termprob(i,:)));
%                         logpathlength = linpathlength(lintermprob ~= 0);
%                         logtermprob   = lintermprob(lintermprob ~= 0);
%                         loglog(logpathlength,logtermprob,styles{1,i});
%                         if ~isempty(logtermprob)
%                             hold on;
%                             legendtextcount = legendtextcount + 1;
%                             legendtext(1,legendtextcount) = {['Diameter: ' num2str(diameter(i))]};
%                         end
%                     end
%                     xlabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
%                     ylabel('Termination Probability','FontSize',labelfontsize,'FontWeight','b');
%                     set(gca,'FontSize',axesfontsize);
%                     legend(legendtext);
%                     clear legendtext;
%                     [ax,h3]=suplabel('Termination Probability by Length - LogLog'  ,'t');
%                     set(h3,'FontSize',titlefontsize);
%                     fillscreen;
%                     filename = sprintf('%s_%s',controlanalysis.inputfilename,'Term_Prob_108_Length_LogLog');
%                     print('-djpeg',filename);
%                     close all;
                
                    
                    
                    
    % By Surface Area

        [diameterlength,pathlengthlength] = size(controlanalysis.bifurcation.doublebin.bifurcationprobability.bysurfacearea);
        diameter = controlanalysis.bifurcation.doublebin.diameter(:,1);
        pathlength = controlanalysis.bifurcation.doublebin.pathlength(1,:);
        bifprob  = controlanalysis.bifurcation.doublebin.bifurcationprobability.bysurfacearea;
        termprob = controlanalysis.bifurcation.doublebin.terminationprobability.bysurfacearea;

        % Diameter on x-axis
        
            % Linear
            
                % Bifurcation probability
            
                    figure;
                    legendtextcount = 0;
                    
                    for i=1:pathlengthlength
                        lindiameter = diameter(~isnan(bifprob(:,i)));
                        linbifprob  = bifprob(~isnan(bifprob(:,i)),i);
                        logdiameter = lindiameter(linbifprob ~= 0);
                        logbifprob  = linbifprob(linbifprob ~= 0);
                        plot(lindiameter,linbifprob,styles{1,i});
                        if ~isempty(linbifprob)
                            hold on;
                            legendtextcount = legendtextcount + 1;
                            legendtext(1,legendtextcount) = {['Path Length: ' num2str(pathlength(i))]};
                        end
                    end
                    xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Bifurcation Probability','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    legend(legendtext);
                    clear legendtext;
                    [ax,h3]=suplabel('Bifurcation Probability by Surface Area - Linear'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Bif_Prob_201_SurfaceArea_Linear');
                    print('-djpeg',filename);
                    close all;
                    
%                 % Termination Probability
%                 
%                     figure;
%                     legendtextcount = 0;
%                     
%                     for i=1:pathlengthlength
%                         lindiameter = diameter(~isnan(termprob(:,i)));
%                         lintermprob = termprob(~isnan(termprob(:,i)),i);
%                         logdiameter = lindiameter(lintermprob ~= 0);
%                         logtermprob = lintermprob(lintermprob ~= 0);
%                         plot(lindiameter,lintermprob,styles{1,i});
%                         if ~isempty(lintermprob)
%                             hold on;
%                             legendtextcount = legendtextcount + 1;
%                             legendtext(1,legendtextcount) = {['Path Length: ' num2str(pathlength(i))]};
%                         end
%                     end
%                     xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
%                     ylabel('Termination Probability','FontSize',labelfontsize,'FontWeight','b');
%                     set(gca,'FontSize',axesfontsize);
%                     legend(legendtext);
%                     clear legendtext;
%                     [ax,h3]=suplabel('Termination Probability by Surface Area - Linear'  ,'t');
%                     set(h3,'FontSize',titlefontsize);
%                     fillscreen;
%                     filename = sprintf('%s_%s',controlanalysis.inputfilename,'Term_Prob_201_SurfaceArea_Linear');
%                     print('-djpeg',filename);
%                     close all;
                    
            % Semilog - x
            
                % Bifurcation probability
            
                    figure;
                    legendtextcount = 0;
                    
                    for i=1:pathlengthlength
                        lindiameter = diameter(~isnan(bifprob(:,i)));
                        linbifprob  = bifprob(~isnan(bifprob(:,i)),i);
                        logdiameter = lindiameter(linbifprob ~= 0);
                        logbifprob  = linbifprob(linbifprob ~= 0);
                        semilogx(lindiameter,linbifprob,styles{1,i});
                        if ~isempty(linbifprob)
                            hold on;
                            legendtextcount = legendtextcount + 1;
                            legendtext(1,legendtextcount) = {['Path Length: ' num2str(pathlength(i))]};
                        end
                    end
                    xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Bifurcation Probability','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    legend(legendtext);
                    clear legendtext;
                    [ax,h3]=suplabel('Bifurcation Probability by Surface Area - Semilog(x)'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Bif_Prob_202_SurfaceArea_Semilog_x');
                    print('-djpeg',filename);
                    close all;
                    
%                 % Termination Probability
%                 
%                     figure;
%                     legendtextcount = 0;
%                     
%                     for i=1:pathlengthlength
%                         lindiameter = diameter(~isnan(termprob(:,i)));
%                         lintermprob = termprob(~isnan(termprob(:,i)),i);
%                         logdiameter = lindiameter(lintermprob ~= 0);
%                         logtermprob = lintermprob(lintermprob ~= 0);
%                         semilogx(lindiameter,lintermprob,styles{1,i});
%                         if ~isempty(lintermprob)
%                             hold on;
%                             legendtextcount = legendtextcount + 1;
%                             legendtext(1,legendtextcount) = {['Path Length: ' num2str(pathlength(i))]};
%                         end
%                     end
%                     xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
%                     ylabel('Termination Probability','FontSize',labelfontsize,'FontWeight','b');
%                     set(gca,'FontSize',axesfontsize);
%                     legend(legendtext);
%                     clear legendtext;
%                     [ax,h3]=suplabel('Termination Probability by Surface Area - Semilog(x)'  ,'t');
%                     set(h3,'FontSize',titlefontsize);
%                     fillscreen;
%                     filename = sprintf('%s_%s',controlanalysis.inputfilename,'Term_Prob_202_SurfaceArea_Semilog_x');
%                     print('-djpeg',filename);
%                     close all;
                    
                    
            % Semilog - y
            
                % Bifurcation probability
            
                    figure;
                    legendtextcount = 0;
                    
                    for i=1:pathlengthlength
                        lindiameter = diameter(~isnan(bifprob(:,i)));
                        linbifprob  = bifprob(~isnan(bifprob(:,i)),i);
                        logdiameter = lindiameter(linbifprob ~= 0);
                        logbifprob  = linbifprob(linbifprob ~= 0);
                        semilogy(logdiameter,logbifprob,styles{1,i});
                        if ~isempty(logbifprob)
                            hold on;
                            legendtextcount = legendtextcount + 1;
                            legendtext(1,legendtextcount) = {['Path Length: ' num2str(pathlength(i))]};
                        end
                    end
                    xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Bifurcation Probability','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    legend(legendtext);
                    clear legendtext;
                    [ax,h3]=suplabel('Bifurcation Probability by Surface Area - Semilog(y)'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Bif_Prob_203_SurfaceArea_Semilog_y');
                    print('-djpeg',filename);
                    close all;
                    
%                 % Termination Probability
%                 
%                     figure;
%                     legendtextcount = 0;
%                     
%                     for i=1:pathlengthlength
%                         lindiameter = diameter(~isnan(termprob(:,i)));
%                         lintermprob = termprob(~isnan(termprob(:,i)),i);
%                         logdiameter = lindiameter(lintermprob ~= 0);
%                         logtermprob = lintermprob(lintermprob ~= 0);
%                         semilogy(logdiameter,logtermprob,styles{1,i});
%                         if ~isempty(logtermprob)
%                             hold on;
%                             legendtextcount = legendtextcount + 1;
%                             legendtext(1,legendtextcount) = {['Path Length: ' num2str(pathlength(i))]};
%                         end
%                     end
%                     xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
%                     ylabel('Termination Probability','FontSize',labelfontsize,'FontWeight','b');
%                     set(gca,'FontSize',axesfontsize);
%                     legend(legendtext);
%                     clear legendtext;
%                     [ax,h3]=suplabel('Termination Probability by Surface Area - Semilog(y)'  ,'t');
%                     set(h3,'FontSize',titlefontsize);
%                     fillscreen;
%                     filename = sprintf('%s_%s',controlanalysis.inputfilename,'Term_Prob_203_SurfaceArea_Semilog_y');
%                     print('-djpeg',filename);
%                     close all;
                    
                    
            % Log-Log
            
                % Bifurcation probability
            
                    figure;
                    legendtextcount = 0;
                    
                    for i=1:pathlengthlength
                        lindiameter = diameter(~isnan(bifprob(:,i)));
                        linbifprob  = bifprob(~isnan(bifprob(:,i)),i);
                        logdiameter = lindiameter(linbifprob ~= 0);
                        logbifprob  = linbifprob(linbifprob ~= 0);
                        loglog(logdiameter,logbifprob,styles{1,i});
                        if ~isempty(logbifprob)
                            hold on;
                            legendtextcount = legendtextcount + 1;
                            legendtext(1,legendtextcount) = {['Path Length: ' num2str(pathlength(i))]};
                        end
                    end
                    xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Bifurcation Probability','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    legend(legendtext);
                    clear legendtext;
                    [ax,h3]=suplabel('Bifurcation Probability by Surface Area - LogLog'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Bif_Prob_204_SurfaceArea_LogLog');
                    print('-djpeg',filename);
                    close all;
                    
%                 % Termination Probability
%                 
%                     figure;
%                     legendtextcount = 0;
%                     
%                     for i=1:pathlengthlength
%                         lindiameter = diameter(~isnan(termprob(:,i)));
%                         lintermprob = termprob(~isnan(termprob(:,i)),i);
%                         logdiameter = lindiameter(lintermprob ~= 0);
%                         logtermprob = lintermprob(lintermprob ~= 0);
%                         loglog(logdiameter,logtermprob,styles{1,i});
%                         if ~isempty(logtermprob)
%                             hold on;
%                             legendtextcount = legendtextcount + 1;
%                             legendtext(1,legendtextcount) = {['Path Length: ' num2str(pathlength(i))]};
%                         end
%                     end
%                     xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
%                     ylabel('Termination Probability','FontSize',labelfontsize,'FontWeight','b');
%                     set(gca,'FontSize',axesfontsize);
%                     legend(legendtext);
%                     clear legendtext;
%                     [ax,h3]=suplabel('Termination Probability by Surface Area - LogLog'  ,'t');
%                     set(h3,'FontSize',titlefontsize);
%                     fillscreen;
%                     filename = sprintf('%s_%s',controlanalysis.inputfilename,'Term_Prob_204_SurfaceArea_LogLog');
%                     print('-djpeg',filename);
%                     close all;

                    
        % Path Length on x-axis
        
            % Linear
            
                % Bifurcation probability
            
                    figure;
                    legendtextcount = 0;
                    
                    for i=1:diameterlength
                        linpathlength = pathlength(~isnan(bifprob(i,:)));
                        linbifprob    = bifprob(i,~isnan(bifprob(i,:)));
                        logpathlength = linpathlength(linbifprob ~= 0);
                        logbifprob    = linbifprob(linbifprob ~= 0);
                        plot(linpathlength,linbifprob,styles{1,i});
                        if ~isempty(linbifprob)
                            hold on;
                            legendtextcount = legendtextcount + 1;
                            legendtext(1,legendtextcount) = {['Diameter: ' num2str(diameter(i))]};
                        end
                    end
                    xlabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Bifurcation Probability','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    legend(legendtext);
                    clear legendtext;
                    [ax,h3]=suplabel('Bifurcation Probability by Surface Area - Linear'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Bif_Prob_205_SurfaceArea_Linear');
                    print('-djpeg',filename);
                    close all;
                    
%                 % Termination Probability
%                 
%                     figure;
%                     legendtextcount = 0;
%                     
%                     for i=1:diameterlength
%                         linpathlength = pathlength(~isnan(termprob(i,:)));
%                         lintermprob   = termprob(i,~isnan(termprob(i,:)));
%                         logpathlength = linpathlength(lintermprob ~= 0);
%                         logtermprob   = lintermprob(lintermprob ~= 0);
%                         plot(linpathlength,lintermprob,styles{1,i});
%                         if ~isempty(lintermprob)
%                             hold on;
%                             legendtextcount = legendtextcount + 1;
%                             legendtext(1,legendtextcount) = {['Diameter: ' num2str(diameter(i))]};
%                         end
%                     end
%                     xlabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
%                     ylabel('Termination Probability','FontSize',labelfontsize,'FontWeight','b');
%                     set(gca,'FontSize',axesfontsize);
%                     legend(legendtext);
%                     clear legendtext;
%                     [ax,h3]=suplabel('Termination Probability by Surface Area - Linear'  ,'t');
%                     set(h3,'FontSize',titlefontsize);
%                     fillscreen;
%                     filename = sprintf('%s_%s',controlanalysis.inputfilename,'Term_Prob_205_SurfaceArea_Linear');
%                     print('-djpeg',filename);
%                     close all;
                    
            % Semilog - x
            
                % Bifurcation probability
            
                    figure;
                    legendtextcount = 0;
                    
                    for i=1:diameterlength
                        linpathlength = pathlength(~isnan(bifprob(i,:)));
                        linbifprob    = bifprob(i,~isnan(bifprob(i,:)));
                        logpathlength = linpathlength(linbifprob ~= 0);
                        logbifprob    = linbifprob(linbifprob ~= 0);
                        semilogx(linpathlength,linbifprob,styles{1,i});
                        if ~isempty(linbifprob)
                            hold on;
                            legendtextcount = legendtextcount + 1;
                            legendtext(1,legendtextcount) = {['Diameter: ' num2str(diameter(i))]};
                        end
                    end
                    xlabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Bifurcation Probability','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    legend(legendtext);
                    clear legendtext;
                    [ax,h3]=suplabel('Bifurcation Probability by Surface Area - Semilog(x)'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Bif_Prob_206_SurfaceArea_Semilog_x');
                    print('-djpeg',filename);
                    close all;
                    
%                 % Termination Probability
%                 
%                     figure;
%                     legendtextcount = 0;
%                     
%                     for i=1:diameterlength
%                         linpathlength = pathlength(~isnan(termprob(i,:)));
%                         lintermprob   = termprob(i,~isnan(termprob(i,:)));
%                         logpathlength = linpathlength(lintermprob ~= 0);
%                         logtermprob   = lintermprob(lintermprob ~= 0);
%                         semilogx(linpathlength,lintermprob,styles{1,i});
%                         if ~isempty(lintermprob)
%                             hold on;
%                             legendtextcount = legendtextcount + 1;
%                             legendtext(1,legendtextcount) = {['Diameter: ' num2str(diameter(i))]};
%                         end
%                     end
%                     xlabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
%                     ylabel('Termination Probability','FontSize',labelfontsize,'FontWeight','b');
%                     set(gca,'FontSize',axesfontsize);
%                     legend(legendtext);
%                     clear legendtext;
%                     [ax,h3]=suplabel('Termination Probability by Surface Area - Semilog(x)'  ,'t');
%                     set(h3,'FontSize',titlefontsize);
%                     fillscreen;
%                     filename = sprintf('%s_%s',controlanalysis.inputfilename,'Term_Prob_206_SurfaceArea_Semilog_x');
%                     print('-djpeg',filename);
%                     close all;
                    
                    
            % Semilog - y
            
                % Bifurcation probability
            
                    figure;
                    legendtextcount = 0;
                    
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
                        end
                    end
                    xlabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Bifurcation Probability','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    legend(legendtext);
                    clear legendtext;
                    [ax,h3]=suplabel('Bifurcation Probability by Surface Area - Semilog(y)'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Bif_Prob_207_SurfaceArea_Semilog_y');
                    print('-djpeg',filename);
                    close all;
                    
%                 % Termination Probability
%                 
%                     figure;
%                     legendtextcount = 0;
%                     
%                     for i=1:diameterlength
%                         linpathlength = pathlength(~isnan(termprob(i,:)));
%                         lintermprob   = termprob(i,~isnan(termprob(i,:)));
%                         logpathlength = linpathlength(lintermprob ~= 0);
%                         logtermprob   = lintermprob(lintermprob ~= 0);
%                         semilogy(logpathlength,logtermprob,styles{1,i});
%                         if ~isempty(logtermprob)
%                             hold on;
%                             legendtextcount = legendtextcount + 1;
%                             legendtext(1,legendtextcount) = {['Diameter: ' num2str(diameter(i))]};
%                         end
%                     end
%                     xlabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
%                     ylabel('Termination Probability','FontSize',labelfontsize,'FontWeight','b');
%                     set(gca,'FontSize',axesfontsize);
%                     legend(legendtext);
%                     clear legendtext;
%                     [ax,h3]=suplabel('Termination Probability by Surface Area - Semilog(y)'  ,'t');
%                     set(h3,'FontSize',titlefontsize);
%                     fillscreen;
%                     filename = sprintf('%s_%s',controlanalysis.inputfilename,'Term_Prob_207_SurfaceArea_Semilog_y');
%                     print('-djpeg',filename);
%                     close all;
                    
                    
            % Log-Log
            
                % Bifurcation probability
            
                    figure;
                    legendtextcount = 0;
                    
                    for i=1:diameterlength
                        linpathlength = pathlength(~isnan(bifprob(i,:)));
                        linbifprob    = bifprob(i,~isnan(bifprob(i,:)));
                        logpathlength = linpathlength(linbifprob ~= 0);
                        logbifprob    = linbifprob(linbifprob ~= 0);
                        loglog(logpathlength,logbifprob,styles{1,i});
                        if ~isempty(logbifprob)
                            hold on;
                            legendtextcount = legendtextcount + 1;
                            legendtext(1,legendtextcount) = {['Diameter: ' num2str(diameter(i))]};
                        end
                    end
                    xlabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Bifurcation Probability','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    legend(legendtext);
                    clear legendtext;
                    [ax,h3]=suplabel('Bifurcation Probability by Surface Area - LogLog'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Bif_Prob_208_SurfaceArea_LogLog');
                    print('-djpeg',filename);
                    close all;
                    
%                 % Termination Probability
%                 
%                     figure;
%                     legendtextcount = 0;
%                     
%                     for i=1:diameterlength
%                         linpathlength = pathlength(~isnan(termprob(i,:)));
%                         lintermprob   = termprob(i,~isnan(termprob(i,:)));
%                         logpathlength = linpathlength(lintermprob ~= 0);
%                         logtermprob   = lintermprob(lintermprob ~= 0);
%                         loglog(logpathlength,logtermprob,styles{1,i});
%                         if ~isempty(logtermprob)
%                             hold on;
%                             legendtextcount = legendtextcount + 1;
%                             legendtext(1,legendtextcount) = {['Diameter: ' num2str(diameter(i))]};
%                         end
%                     end
%                     xlabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
%                     ylabel('Termination Probability','FontSize',labelfontsize,'FontWeight','b');
%                     set(gca,'FontSize',axesfontsize);
%                     legend(legendtext);
%                     clear legendtext;
%                     [ax,h3]=suplabel('Termination Probability by Surface Area - LogLog'  ,'t');
%                     set(h3,'FontSize',titlefontsize);
%                     fillscreen;
%                     filename = sprintf('%s_%s',controlanalysis.inputfilename,'Term_Prob_208_SurfaceArea_LogLog');
%                     print('-djpeg',filename);
%                     close all;
                    
                    
                    
    % By Volume

        [diameterlength,pathlengthlength] = size(controlanalysis.bifurcation.doublebin.bifurcationprobability.byvolume);
        diameter = controlanalysis.bifurcation.doublebin.diameter(:,1);
        pathlength = controlanalysis.bifurcation.doublebin.pathlength(1,:);
        bifprob  = controlanalysis.bifurcation.doublebin.bifurcationprobability.byvolume;
        termprob = controlanalysis.bifurcation.doublebin.terminationprobability.byvolume;

        % Diameter on x-axis
        
            % Linear
            
                % Bifurcation probability
            
                    figure;
                    legendtextcount = 0;
                    
                    for i=1:pathlengthlength
                        lindiameter = diameter(~isnan(bifprob(:,i)));
                        linbifprob  = bifprob(~isnan(bifprob(:,i)),i);
                        logdiameter = lindiameter(linbifprob ~= 0);
                        logbifprob  = linbifprob(linbifprob ~= 0);
                        plot(lindiameter,linbifprob,styles{1,i});
                        if ~isempty(linbifprob)
                            hold on;
                            legendtextcount = legendtextcount + 1;
                            legendtext(1,legendtextcount) = {['Path Length: ' num2str(pathlength(i))]};
                        end
                    end
                    xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Bifurcation Probability','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    legend(legendtext);
                    clear legendtext;
                    [ax,h3]=suplabel('Bifurcation Probability by Volume - Linear'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Bif_Prob_301_Volume_Linear');
                    print('-djpeg',filename);
                    close all;
                    
%                 % Termination Probability
%                 
%                     figure;
%                     legendtextcount = 0;
%                     
%                     for i=1:pathlengthlength
%                         lindiameter = diameter(~isnan(termprob(:,i)));
%                         lintermprob = termprob(~isnan(termprob(:,i)),i);
%                         logdiameter = lindiameter(lintermprob ~= 0);
%                         logtermprob = lintermprob(lintermprob ~= 0);
%                         plot(lindiameter,lintermprob,styles{1,i});
%                         if ~isempty(lintermprob)
%                             hold on;
%                             legendtextcount = legendtextcount + 1;
%                             legendtext(1,legendtextcount) = {['Path Length: ' num2str(pathlength(i))]};
%                         end
%                     end
%                     xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
%                     ylabel('Termination Probability','FontSize',labelfontsize,'FontWeight','b');
%                     set(gca,'FontSize',axesfontsize);
%                     legend(legendtext);
%                     clear legendtext;
%                     [ax,h3]=suplabel('Termination Probability by Volume - Linear'  ,'t');
%                     set(h3,'FontSize',titlefontsize);
%                     fillscreen;
%                     filename = sprintf('%s_%s',controlanalysis.inputfilename,'Term_Prob_301_Volume_Linear');
%                     print('-djpeg',filename);
%                     close all;
                    
            % Semilog - x
            
                % Bifurcation probability
            
                    figure;
                    legendtextcount = 0;
                    
                    for i=1:pathlengthlength
                        lindiameter = diameter(~isnan(bifprob(:,i)));
                        linbifprob  = bifprob(~isnan(bifprob(:,i)),i);
                        logdiameter = lindiameter(linbifprob ~= 0);
                        logbifprob  = linbifprob(linbifprob ~= 0);
                        semilogx(lindiameter,linbifprob,styles{1,i});
                        if ~isempty(linbifprob)
                            hold on;
                            legendtextcount = legendtextcount + 1;
                            legendtext(1,legendtextcount) = {['Path Length: ' num2str(pathlength(i))]};
                        end
                    end
                    xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Bifurcation Probability','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    legend(legendtext);
                    clear legendtext;
                    [ax,h3]=suplabel('Bifurcation Probability by Volume - Semilog(x)'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Bif_Prob_302_Volume_Semilog_x');
                    print('-djpeg',filename);
                    close all;
                    
%                 % Termination Probability
%                 
%                     figure;
%                     legendtextcount = 0;
%                     
%                     for i=1:pathlengthlength
%                         lindiameter = diameter(~isnan(termprob(:,i)));
%                         lintermprob = termprob(~isnan(termprob(:,i)),i);
%                         logdiameter = lindiameter(lintermprob ~= 0);
%                         logtermprob = lintermprob(lintermprob ~= 0);
%                         semilogx(lindiameter,lintermprob,styles{1,i});
%                         if ~isempty(lintermprob)
%                             hold on;
%                             legendtextcount = legendtextcount + 1;
%                             legendtext(1,legendtextcount) = {['Path Length: ' num2str(pathlength(i))]};
%                         end
%                     end
%                     xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
%                     ylabel('Termination Probability','FontSize',labelfontsize,'FontWeight','b');
%                     set(gca,'FontSize',axesfontsize);
%                     legend(legendtext);
%                     clear legendtext;
%                     [ax,h3]=suplabel('Termination Probability by Volume - Semilog(x)'  ,'t');
%                     set(h3,'FontSize',titlefontsize);
%                     fillscreen;
%                     filename = sprintf('%s_%s',controlanalysis.inputfilename,'Term_Prob_302_Volume_Semilog_x');
%                     print('-djpeg',filename);
%                     close all;
                    
                    
            % Semilog - y
            
                % Bifurcation probability
            
                    figure;
                    legendtextcount = 0;
                    
                    for i=1:pathlengthlength
                        lindiameter = diameter(~isnan(bifprob(:,i)));
                        linbifprob  = bifprob(~isnan(bifprob(:,i)),i);
                        logdiameter = lindiameter(linbifprob ~= 0);
                        logbifprob  = linbifprob(linbifprob ~= 0);
                        semilogy(logdiameter,logbifprob,styles{1,i});
                        if ~isempty(logbifprob)
                            hold on;
                            legendtextcount = legendtextcount + 1;
                            legendtext(1,legendtextcount) = {['Path Length: ' num2str(pathlength(i))]};
                        end
                    end
                    xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Bifurcation Probability','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    legend(legendtext);
                    clear legendtext;
                    [ax,h3]=suplabel('Bifurcation Probability by Volume - Semilog(y)'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Bif_Prob_303_Volume_Semilog_y');
                    print('-djpeg',filename);
                    close all;
                    
%                 % Termination Probability
%                 
%                     figure;
%                     legendtextcount = 0;
%                     
%                     for i=1:pathlengthlength
%                         lindiameter = diameter(~isnan(termprob(:,i)));
%                         lintermprob = termprob(~isnan(termprob(:,i)),i);
%                         logdiameter = lindiameter(lintermprob ~= 0);
%                         logtermprob = lintermprob(lintermprob ~= 0);
%                         semilogy(logdiameter,logtermprob,styles{1,i});
%                         if ~isempty(logtermprob)
%                             hold on;
%                             legendtextcount = legendtextcount + 1;
%                             legendtext(1,legendtextcount) = {['Path Length: ' num2str(pathlength(i))]};
%                         end
%                     end
%                     xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
%                     ylabel('Termination Probability','FontSize',labelfontsize,'FontWeight','b');
%                     set(gca,'FontSize',axesfontsize);
%                     legend(legendtext);
%                     clear legendtext;
%                     [ax,h3]=suplabel('Termination Probability by Volume - Semilog(y)'  ,'t');
%                     set(h3,'FontSize',titlefontsize);
%                     fillscreen;
%                     filename = sprintf('%s_%s',controlanalysis.inputfilename,'Term_Prob_303_Volume_Semilog_y');
%                     print('-djpeg',filename);
%                     close all;
                    
                    
            % Log-Log
            
                % Bifurcation probability
            
                    figure;
                    legendtextcount = 0;
                    
                    for i=1:pathlengthlength
                        lindiameter = diameter(~isnan(bifprob(:,i)));
                        linbifprob  = bifprob(~isnan(bifprob(:,i)),i);
                        logdiameter = lindiameter(linbifprob ~= 0);
                        logbifprob  = linbifprob(linbifprob ~= 0);
                        loglog(logdiameter,logbifprob,styles{1,i});
                        if ~isempty(logbifprob)
                            hold on;
                            legendtextcount = legendtextcount + 1;
                            legendtext(1,legendtextcount) = {['Path Length: ' num2str(pathlength(i))]};
                        end
                    end
                    xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Bifurcation Probability','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    legend(legendtext);
                    clear legendtext;
                    [ax,h3]=suplabel('Bifurcation Probability by Volume - LogLog'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Bif_Prob_304_Volume_LogLog');
                    print('-djpeg',filename);
                    close all;
                    
%                 % Termination Probability
%                 
%                     figure;
%                     legendtextcount = 0;
%                     
%                     for i=1:pathlengthlength
%                         lindiameter = diameter(~isnan(termprob(:,i)));
%                         lintermprob = termprob(~isnan(termprob(:,i)),i);
%                         logdiameter = lindiameter(lintermprob ~= 0);
%                         logtermprob = lintermprob(lintermprob ~= 0);
%                         loglog(logdiameter,logtermprob,styles{1,i});
%                         if ~isempty(logtermprob)
%                             hold on;
%                             legendtextcount = legendtextcount + 1;
%                             legendtext(1,legendtextcount) = {['Path Length: ' num2str(pathlength(i))]};
%                         end
%                     end
%                     xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
%                     ylabel('Termination Probability','FontSize',labelfontsize,'FontWeight','b');
%                     set(gca,'FontSize',axesfontsize);
%                     legend(legendtext);
%                     clear legendtext;
%                     [ax,h3]=suplabel('Termination Probability by Volume - LogLog'  ,'t');
%                     set(h3,'FontSize',titlefontsize);
%                     fillscreen;
%                     filename = sprintf('%s_%s',controlanalysis.inputfilename,'Term_Prob_304_Volume_LogLog');
%                     print('-djpeg',filename);
%                     close all;

                    
        % Path Length on x-axis
        
            % Linear
            
                % Bifurcation probability
            
                    figure;
                    legendtextcount = 0;
                    
                    for i=1:diameterlength
                        linpathlength = pathlength(~isnan(bifprob(i,:)));
                        linbifprob    = bifprob(i,~isnan(bifprob(i,:)));
                        logpathlength = linpathlength(linbifprob ~= 0);
                        logbifprob    = linbifprob(linbifprob ~= 0);
                        plot(linpathlength,linbifprob,styles{1,i});
                        if ~isempty(linbifprob)
                            hold on;
                            legendtextcount = legendtextcount + 1;
                            legendtext(1,legendtextcount) = {['Diameter: ' num2str(diameter(i))]};
                        end
                    end
                    xlabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Bifurcation Probability','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    legend(legendtext);
                    clear legendtext;
                    [ax,h3]=suplabel('Bifurcation Probability by Volume - Linear'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Bif_Prob_305_Volume_Linear');
                    print('-djpeg',filename);
                    close all;
                    
%                 % Termination Probability
%                 
%                     figure;
%                     legendtextcount = 0;
%                     
%                     for i=1:diameterlength
%                         linpathlength = pathlength(~isnan(termprob(i,:)));
%                         lintermprob   = termprob(i,~isnan(termprob(i,:)));
%                         logpathlength = linpathlength(lintermprob ~= 0);
%                         logtermprob   = lintermprob(lintermprob ~= 0);
%                         plot(linpathlength,lintermprob,styles{1,i});
%                         if ~isempty(lintermprob)
%                             hold on;
%                             legendtextcount = legendtextcount + 1;
%                             legendtext(1,legendtextcount) = {['Diameter: ' num2str(diameter(i))]};
%                         end
%                     end
%                     xlabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
%                     ylabel('Termination Probability','FontSize',labelfontsize,'FontWeight','b');
%                     set(gca,'FontSize',axesfontsize);
%                     legend(legendtext);
%                     clear legendtext;
%                     [ax,h3]=suplabel('Termination Probability by Volume - Linear'  ,'t');
%                     set(h3,'FontSize',titlefontsize);
%                     fillscreen;
%                     filename = sprintf('%s_%s',controlanalysis.inputfilename,'Term_Prob_305_Volume_Linear');
%                     print('-djpeg',filename);
%                     close all;
                    
            % Semilog - x
            
                % Bifurcation probability
            
                    figure;
                    legendtextcount = 0;
                    
                    for i=1:diameterlength
                        linpathlength = pathlength(~isnan(bifprob(i,:)));
                        linbifprob    = bifprob(i,~isnan(bifprob(i,:)));
                        logpathlength = linpathlength(linbifprob ~= 0);
                        logbifprob    = linbifprob(linbifprob ~= 0);
                        semilogx(linpathlength,linbifprob,styles{1,i});
                        if ~isempty(linbifprob)
                            hold on;
                            legendtextcount = legendtextcount + 1;
                            legendtext(1,legendtextcount) = {['Diameter: ' num2str(diameter(i))]};
                        end
                    end
                    xlabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Bifurcation Probability','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    legend(legendtext);
                    clear legendtext;
                    [ax,h3]=suplabel('Bifurcation Probability by Volume - Semilog(x)'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Bif_Prob_306_Volume_Semilog_x');
                    print('-djpeg',filename);
                    close all;
                    
%                 % Termination Probability
%                 
%                     figure;
%                     legendtextcount = 0;
%                     
%                     for i=1:diameterlength
%                         linpathlength = pathlength(~isnan(termprob(i,:)));
%                         lintermprob   = termprob(i,~isnan(termprob(i,:)));
%                         logpathlength = linpathlength(lintermprob ~= 0);
%                         logtermprob   = lintermprob(lintermprob ~= 0);
%                         semilogx(linpathlength,lintermprob,styles{1,i});
%                         if ~isempty(lintermprob)
%                             hold on;
%                             legendtextcount = legendtextcount + 1;
%                             legendtext(1,legendtextcount) = {['Diameter: ' num2str(diameter(i))]};
%                         end
%                     end
%                     xlabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
%                     ylabel('Termination Probability','FontSize',labelfontsize,'FontWeight','b');
%                     set(gca,'FontSize',axesfontsize);
%                     legend(legendtext);
%                     clear legendtext;
%                     [ax,h3]=suplabel('Termination Probability by Volume - Semilog(x)'  ,'t');
%                     set(h3,'FontSize',titlefontsize);
%                     fillscreen;
%                     filename = sprintf('%s_%s',controlanalysis.inputfilename,'Term_Prob_306_Volume_Semilog_x');
%                     print('-djpeg',filename);
%                     close all;
                    
                    
            % Semilog - y
            
                % Bifurcation probability
            
                    figure;
                    legendtextcount = 0;
                    
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
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Bif_Prob_307_Volume_Semilog_y');
                    print('-djpeg',filename);
                    close all;
                    
%                 % Termination Probability
%                 
%                     figure;
%                     legendtextcount = 0;
%                     
%                     for i=1:diameterlength
%                         linpathlength = pathlength(~isnan(termprob(i,:)));
%                         lintermprob   = termprob(i,~isnan(termprob(i,:)));
%                         logpathlength = linpathlength(lintermprob ~= 0);
%                         logtermprob   = lintermprob(lintermprob ~= 0);
%                         semilogy(logpathlength,logtermprob,styles{1,i});
%                         if ~isempty(logtermprob)
%                             hold on;
%                             legendtextcount = legendtextcount + 1;
%                             legendtext(1,legendtextcount) = {['Diameter: ' num2str(diameter(i))]};
%                         end
%                     end
%                     xlabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
%                     ylabel('Termination Probability','FontSize',labelfontsize,'FontWeight','b');
%                     set(gca,'FontSize',axesfontsize);
%                     legend(legendtext);
%                     clear legendtext;
%                     [ax,h3]=suplabel('Termination Probability by Volume - Semilog(y)'  ,'t');
%                     set(h3,'FontSize',titlefontsize);
%                     fillscreen;
%                     filename = sprintf('%s_%s',controlanalysis.inputfilename,'Term_Prob_307_Volume_Semilog_y');
%                     print('-djpeg',filename);
%                     close all;
                    
                    
            % Log-Log
            
                % Bifurcation probability
            
                    figure;
                    legendtextcount = 0;
                    
                    for i=1:diameterlength
                        linpathlength = pathlength(~isnan(bifprob(i,:)));
                        linbifprob    = bifprob(i,~isnan(bifprob(i,:)));
                        logpathlength = linpathlength(linbifprob ~= 0);
                        logbifprob    = linbifprob(linbifprob ~= 0);
                        loglog(logpathlength,logbifprob,styles{1,i});
                        if ~isempty(logbifprob)
                            hold on;
                            legendtextcount = legendtextcount + 1;
                            legendtext(1,legendtextcount) = {['Diameter: ' num2str(diameter(i))]};
                        end
                    end
                    xlabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Bifurcation Probability','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    legend(legendtext);
                    clear legendtext;
                    [ax,h3]=suplabel('Bifurcation Probability by Volume - LogLog'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Bif_Prob_308_Volume_LogLog');
                    print('-djpeg',filename);
                    close all;
                    
%                 % Termination Probability
%                 
%                     figure;
%                     legendtextcount = 0;
%                     
%                     for i=1:diameterlength
%                         linpathlength = pathlength(~isnan(termprob(i,:)));
%                         lintermprob   = termprob(i,~isnan(termprob(i,:)));
%                         logpathlength = linpathlength(lintermprob ~= 0);
%                         logtermprob   = lintermprob(lintermprob ~= 0);
%                         loglog(logpathlength,logtermprob,styles{1,i});
%                         if ~isempty(logtermprob)
%                             hold on;
%                             legendtextcount = legendtextcount + 1;
%                             legendtext(1,legendtextcount) = {['Diameter: ' num2str(diameter(i))]};
%                         end
%                     end
%                     xlabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
%                     ylabel('Termination Probability','FontSize',labelfontsize,'FontWeight','b');
%                     set(gca,'FontSize',axesfontsize);
%                     legend(legendtext);
%                     clear legendtext;
%                     [ax,h3]=suplabel('Termination Probability by Volume - LogLog'  ,'t');
%                     set(h3,'FontSize',titlefontsize);
%                     fillscreen;
%                     filename = sprintf('%s_%s',controlanalysis.inputfilename,'Term_Prob_308_Volume_LogLog');
%                     print('-djpeg',filename);
%                     close all;

                    
                    
                    
                    
                    
                    
                    
% Termination -- Unpooled (bifs and terms separate) Probabilities
    
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
    if exist('separate','dir')==7
        cd('separate');
    else
        mkdir('separate');
        cd('separate');
    end
    
    
    % By Length

        [diameterlength,pathlengthlength] = size(controlanalysis.termination.doublebin.terminationprobability.bylength);
        diameter = controlanalysis.termination.doublebin.diameter(:,1);
        pathlength = controlanalysis.termination.doublebin.pathlength(1,:);
        bifprob  = controlanalysis.termination.doublebin.bifurcationprobability.bylength;
        termprob = controlanalysis.termination.doublebin.terminationprobability.bylength;

        % Diameter on x-axis
        
            % Linear
            
%                 % Bifurcation probability
%             
%                     figure;
%                     legendtextcount = 0;
%                     
%                     for i=1:pathlengthlength
%                         lindiameter = diameter(~isnan(bifprob(:,i)));
%                         linbifprob  = bifprob(~isnan(bifprob(:,i)),i);
%                         logdiameter = lindiameter(linbifprob ~= 0);
%                         logbifprob  = linbifprob(linbifprob ~= 0);
%                         plot(lindiameter,linbifprob,styles{1,i});
%                         if ~isempty(linbifprob)
%                             hold on;
%                             legendtextcount = legendtextcount + 1;
%                             legendtext(1,legendtextcount) = {['Path Length: ' num2str(pathlength(i))]};
%                         end
%                     end
%                     xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
%                     ylabel('Bifurcation Probability','FontSize',labelfontsize,'FontWeight','b');
%                     set(gca,'FontSize',axesfontsize);
%                     legend(legendtext);
%                     clear legendtext;
%                     [ax,h3]=suplabel('Bifurcation Probability by Length - Linear'  ,'t');
%                     set(h3,'FontSize',titlefontsize);
%                     fillscreen;
%                     filename = sprintf('%s_%s',controlanalysis.inputfilename,'Bif_Prob_101_Length_Linear');
%                     print('-djpeg',filename);
%                     close all;
                    
                % Termination Probability
                
                    figure;
                    legendtextcount = 0;
                    
                    for i=1:pathlengthlength
                        lindiameter = diameter(~isnan(termprob(:,i)));
                        lintermprob = termprob(~isnan(termprob(:,i)),i);
                        logdiameter = lindiameter(lintermprob ~= 0);
                        logtermprob = lintermprob(lintermprob ~= 0);
                        plot(lindiameter,lintermprob,styles{1,i});
                        if ~isempty(lintermprob)
                            hold on;
                            legendtextcount = legendtextcount + 1;
                            legendtext(1,legendtextcount) = {['Path Length: ' num2str(pathlength(i))]};
                        end
                    end
                    xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Termination Probability','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    legend(legendtext);
                    clear legendtext;
                    [ax,h3]=suplabel('Termination Probability by Length - Linear'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Term_Prob_101_Length_Linear');
                    print('-djpeg',filename);
                    close all;
                    
            % Semilog - x
            
%                 % Bifurcation probability
%             
%                     figure;
%                     legendtextcount = 0;
%                     
%                     for i=1:pathlengthlength
%                         lindiameter = diameter(~isnan(bifprob(:,i)));
%                         linbifprob  = bifprob(~isnan(bifprob(:,i)),i);
%                         logdiameter = lindiameter(linbifprob ~= 0);
%                         logbifprob  = linbifprob(linbifprob ~= 0);
%                         semilogx(lindiameter,linbifprob,styles{1,i});
%                         if ~isempty(linbifprob)
%                             hold on;
%                             legendtextcount = legendtextcount + 1;
%                             legendtext(1,legendtextcount) = {['Path Length: ' num2str(pathlength(i))]};
%                         end
%                     end
%                     xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
%                     ylabel('Bifurcation Probability','FontSize',labelfontsize,'FontWeight','b');
%                     set(gca,'FontSize',axesfontsize);
%                     legend(legendtext);
%                     clear legendtext;
%                     [ax,h3]=suplabel('Bifurcation Probability by Length - Semilog(x)'  ,'t');
%                     set(h3,'FontSize',titlefontsize);
%                     fillscreen;
%                     filename = sprintf('%s_%s',controlanalysis.inputfilename,'Bif_Prob_102_Length_Semilog_x');
%                     print('-djpeg',filename);
%                     close all;
                    
                % Termination Probability
                
                    figure;
                    legendtextcount = 0;
                    
                    for i=1:pathlengthlength
                        lindiameter = diameter(~isnan(termprob(:,i)));
                        lintermprob = termprob(~isnan(termprob(:,i)),i);
                        logdiameter = lindiameter(lintermprob ~= 0);
                        logtermprob = lintermprob(lintermprob ~= 0);
                        semilogx(lindiameter,lintermprob,styles{1,i});
                        if ~isempty(lintermprob)
                            hold on;
                            legendtextcount = legendtextcount + 1;
                            legendtext(1,legendtextcount) = {['Path Length: ' num2str(pathlength(i))]};
                        end
                    end
                    xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Termination Probability','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    legend(legendtext);
                    clear legendtext;
                    [ax,h3]=suplabel('Termination Probability by Length - Semilog(x)'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Term_Prob_102_Length_Semilog_x');
                    print('-djpeg',filename);
                    close all;
                    
                    
            % Semilog - y
            
%                 % Bifurcation probability
%             
%                     figure;
%                     legendtextcount = 0;
%                     
%                     for i=1:pathlengthlength
%                         lindiameter = diameter(~isnan(bifprob(:,i)));
%                         linbifprob  = bifprob(~isnan(bifprob(:,i)),i);
%                         logdiameter = lindiameter(linbifprob ~= 0);
%                         logbifprob  = linbifprob(linbifprob ~= 0);
%                         semilogy(logdiameter,logbifprob,styles{1,i});
%                         if ~isempty(logbifprob)
%                             hold on;
%                             legendtextcount = legendtextcount + 1;
%                             legendtext(1,legendtextcount) = {['Path Length: ' num2str(pathlength(i))]};
%                         end
%                     end
%                     xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
%                     ylabel('Bifurcation Probability','FontSize',labelfontsize,'FontWeight','b');
%                     set(gca,'FontSize',axesfontsize);
%                     legend(legendtext);
%                     clear legendtext;
%                     [ax,h3]=suplabel('Bifurcation Probability by Length - Semilog(y)'  ,'t');
%                     set(h3,'FontSize',titlefontsize);
%                     fillscreen;
%                     filename = sprintf('%s_%s',controlanalysis.inputfilename,'Bif_Prob_103_Length_Semilog_y');
%                     print('-djpeg',filename);
%                     close all;
                    
                % Termination Probability
                
                    figure;
                    legendtextcount = 0;
                    
                    for i=1:pathlengthlength
                        lindiameter = diameter(~isnan(termprob(:,i)));
                        lintermprob = termprob(~isnan(termprob(:,i)),i);
                        logdiameter = lindiameter(lintermprob ~= 0);
                        logtermprob = lintermprob(lintermprob ~= 0);
                        semilogy(logdiameter,logtermprob,styles{1,i});
                        if ~isempty(logtermprob)
                            hold on;
                            legendtextcount = legendtextcount + 1;
                            legendtext(1,legendtextcount) = {['Path Length: ' num2str(pathlength(i))]};
                        end
                    end
                    xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Termination Probability','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    legend(legendtext);
                    clear legendtext;
                    [ax,h3]=suplabel('Termination Probability by Length - Semilog(y)'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Term_Prob_103_Length_Semilog_y');
                    print('-djpeg',filename);
                    close all;
                    
                    
            % Log-Log
            
%                 % Bifurcation probability
%             
%                     figure;
%                     legendtextcount = 0;
%                     
%                     for i=1:pathlengthlength
%                         lindiameter = diameter(~isnan(bifprob(:,i)));
%                         linbifprob  = bifprob(~isnan(bifprob(:,i)),i);
%                         logdiameter = lindiameter(linbifprob ~= 0);
%                         logbifprob  = linbifprob(linbifprob ~= 0);
%                         loglog(logdiameter,logbifprob,styles{1,i});
%                         if ~isempty(logbifprob)
%                             hold on;
%                             legendtextcount = legendtextcount + 1;
%                             legendtext(1,legendtextcount) = {['Path Length: ' num2str(pathlength(i))]};
%                         end
%                     end
%                     xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
%                     ylabel('Bifurcation Probability','FontSize',labelfontsize,'FontWeight','b');
%                     set(gca,'FontSize',axesfontsize);
%                     legend(legendtext);
%                     clear legendtext;
%                     [ax,h3]=suplabel('Bifurcation Probability by Length - LogLog'  ,'t');
%                     set(h3,'FontSize',titlefontsize);
%                     fillscreen;
%                     filename = sprintf('%s_%s',controlanalysis.inputfilename,'Bif_Prob_104_Length_LogLog');
%                     print('-djpeg',filename);
%                     close all;
                    
                % Termination Probability
                
                    figure;
                    legendtextcount = 0;
                    
                    for i=1:pathlengthlength
                        lindiameter = diameter(~isnan(termprob(:,i)));
                        lintermprob = termprob(~isnan(termprob(:,i)),i);
                        logdiameter = lindiameter(lintermprob ~= 0);
                        logtermprob = lintermprob(lintermprob ~= 0);
                        loglog(logdiameter,logtermprob,styles{1,i});
                        if ~isempty(logtermprob)
                            hold on;
                            legendtextcount = legendtextcount + 1;
                            legendtext(1,legendtextcount) = {['Path Length: ' num2str(pathlength(i))]};
                        end
                    end
                    xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Termination Probability','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    legend(legendtext);
                    clear legendtext;
                    [ax,h3]=suplabel('Termination Probability by Length - LogLog'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Term_Prob_104_Length_LogLog');
                    print('-djpeg',filename);
                    close all;

                    
        % Path Length on x-axis
        
            % Linear
            
%                 % Bifurcation probability
%             
%                     figure;
%                     legendtextcount = 0;
%                     
%                     for i=1:diameterlength
%                         linpathlength = pathlength(~isnan(bifprob(i,:)));
%                         linbifprob    = bifprob(i,~isnan(bifprob(i,:)));
%                         logpathlength = linpathlength(linbifprob ~= 0);
%                         logbifprob    = linbifprob(linbifprob ~= 0);
%                         plot(linpathlength,linbifprob,styles{1,i});
%                         if ~isempty(linbifprob)
%                             hold on;
%                             legendtextcount = legendtextcount + 1;
%                             legendtext(1,legendtextcount) = {['Diameter: ' num2str(diameter(i))]};
%                         end
%                     end
%                     xlabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
%                     ylabel('Bifurcation Probability','FontSize',labelfontsize,'FontWeight','b');
%                     set(gca,'FontSize',axesfontsize);
%                     legend(legendtext);
%                     clear legendtext;
%                     [ax,h3]=suplabel('Bifurcation Probability by Length - Linear'  ,'t');
%                     set(h3,'FontSize',titlefontsize);
%                     fillscreen;
%                     filename = sprintf('%s_%s',controlanalysis.inputfilename,'Bif_Prob_105_Length_Linear');
%                     print('-djpeg',filename);
%                     close all;
                    
                % Termination Probability
                
                    figure;
                    legendtextcount = 0;
                    
                    for i=1:diameterlength
                        linpathlength = pathlength(~isnan(termprob(i,:)));
                        lintermprob   = termprob(i,~isnan(termprob(i,:)));
                        logpathlength = linpathlength(lintermprob ~= 0);
                        logtermprob   = lintermprob(lintermprob ~= 0);
                        plot(linpathlength,lintermprob,styles{1,i});
                        if ~isempty(lintermprob)
                            hold on;
                            legendtextcount = legendtextcount + 1;
                            legendtext(1,legendtextcount) = {['Diameter: ' num2str(diameter(i))]};
                        end
                    end
                    xlabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Termination Probability','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    legend(legendtext);
                    clear legendtext;
                    [ax,h3]=suplabel('Termination Probability by Length - Linear'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Term_Prob_105_Length_Linear');
                    print('-djpeg',filename);
                    close all;
                    
            % Semilog - x
            
%                 % Bifurcation probability
%             
%                     figure;
%                     legendtextcount = 0;
%                     
%                     for i=1:diameterlength
%                         linpathlength = pathlength(~isnan(bifprob(i,:)));
%                         linbifprob    = bifprob(i,~isnan(bifprob(i,:)));
%                         logpathlength = linpathlength(linbifprob ~= 0);
%                         logbifprob    = linbifprob(linbifprob ~= 0);
%                         semilogx(linpathlength,linbifprob,styles{1,i});
%                         if ~isempty(linbifprob)
%                             hold on;
%                             legendtextcount = legendtextcount + 1;
%                             legendtext(1,legendtextcount) = {['Diameter: ' num2str(diameter(i))]};
%                         end
%                     end
%                     xlabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
%                     ylabel('Bifurcation Probability','FontSize',labelfontsize,'FontWeight','b');
%                     set(gca,'FontSize',axesfontsize);
%                     legend(legendtext);
%                     clear legendtext;
%                     [ax,h3]=suplabel('Bifurcation Probability by Length - Semilog(x)'  ,'t');
%                     set(h3,'FontSize',titlefontsize);
%                     fillscreen;
%                     filename = sprintf('%s_%s',controlanalysis.inputfilename,'Bif_Prob_106_Length_Semilog_x');
%                     print('-djpeg',filename);
%                     close all;
                    
                % Termination Probability
                
                    figure;
                    legendtextcount = 0;
                    
                    for i=1:diameterlength
                        linpathlength = pathlength(~isnan(termprob(i,:)));
                        lintermprob   = termprob(i,~isnan(termprob(i,:)));
                        logpathlength = linpathlength(lintermprob ~= 0);
                        logtermprob   = lintermprob(lintermprob ~= 0);
                        semilogx(linpathlength,lintermprob,styles{1,i});
                        if ~isempty(lintermprob)
                            hold on;
                            legendtextcount = legendtextcount + 1;
                            legendtext(1,legendtextcount) = {['Diameter: ' num2str(diameter(i))]};
                        end
                    end
                    xlabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Termination Probability','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    legend(legendtext);
                    clear legendtext;
                    [ax,h3]=suplabel('Termination Probability by Length - Semilog(x)'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Term_Prob_106_Length_Semilog_x');
                    print('-djpeg',filename);
                    close all;
                    
                    
            % Semilog - y
            
%                 % Bifurcation probability
%             
%                     figure;
%                     legendtextcount = 0;
%                     
%                     for i=1:diameterlength
%                         linpathlength = pathlength(~isnan(bifprob(i,:)));
%                         linbifprob    = bifprob(i,~isnan(bifprob(i,:)));
%                         logpathlength = linpathlength(linbifprob ~= 0);
%                         logbifprob    = linbifprob(linbifprob ~= 0);
%                         semilogy(logpathlength,logbifprob,styles{1,i});
%                         if ~isempty(logbifprob)
%                             hold on;
%                             legendtextcount = legendtextcount + 1;
%                             legendtext(1,legendtextcount) = {['Diameter: ' num2str(diameter(i))]};
%                         end
%                     end
%                     xlabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
%                     ylabel('Bifurcation Probability','FontSize',labelfontsize,'FontWeight','b');
%                     set(gca,'FontSize',axesfontsize);
%                     legend(legendtext);
%                     clear legendtext;
%                     [ax,h3]=suplabel('Bifurcation Probability by Length - Semilog(y)'  ,'t');
%                     set(h3,'FontSize',titlefontsize);
%                     fillscreen;
%                     filename = sprintf('%s_%s',controlanalysis.inputfilename,'Bif_Prob_107_Length_Semilog_y');
%                     print('-djpeg',filename);
%                     close all;
                    
                % Termination Probability
                
                    figure;
                    legendtextcount = 0;
                    
                    for i=1:diameterlength
                        linpathlength = pathlength(~isnan(termprob(i,:)));
                        lintermprob   = termprob(i,~isnan(termprob(i,:)));
                        logpathlength = linpathlength(lintermprob ~= 0);
                        logtermprob   = lintermprob(lintermprob ~= 0);
                        semilogy(logpathlength,logtermprob,styles{1,i});
                        if ~isempty(logtermprob)
                            hold on;
                            legendtextcount = legendtextcount + 1;
                            legendtext(1,legendtextcount) = {['Diameter: ' num2str(diameter(i))]};
                        end
                    end
                    xlabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Termination Probability','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    legend(legendtext);
                    clear legendtext;
                    [ax,h3]=suplabel('Termination Probability by Length - Semilog(y)'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Term_Prob_107_Length_Semilog_y');
                    print('-djpeg',filename);
                    close all;
                    
                    
            % Log-Log
            
%                 % Bifurcation probability
%             
%                     figure;
%                     legendtextcount = 0;
%                     
%                     for i=1:diameterlength
%                         linpathlength = pathlength(~isnan(bifprob(i,:)));
%                         linbifprob    = bifprob(i,~isnan(bifprob(i,:)));
%                         logpathlength = linpathlength(linbifprob ~= 0);
%                         logbifprob    = linbifprob(linbifprob ~= 0);
%                         loglog(logpathlength,logbifprob,styles{1,i});
%                         if ~isempty(logbifprob)
%                             hold on;
%                             legendtextcount = legendtextcount + 1;
%                             legendtext(1,legendtextcount) = {['Diameter: ' num2str(diameter(i))]};
%                         end
%                     end
%                     xlabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
%                     ylabel('Bifurcation Probability','FontSize',labelfontsize,'FontWeight','b');
%                     set(gca,'FontSize',axesfontsize);
%                     legend(legendtext);
%                     clear legendtext;
%                     [ax,h3]=suplabel('Bifurcation Probability by Length - LogLog'  ,'t');
%                     set(h3,'FontSize',titlefontsize);
%                     fillscreen;
%                     filename = sprintf('%s_%s',controlanalysis.inputfilename,'Bif_Prob_108_Length_LogLog');
%                     print('-djpeg',filename);
%                     close all;
                    
                % Termination Probability
                
                    figure;
                    legendtextcount = 0;
                    
                    for i=1:diameterlength
                        linpathlength = pathlength(~isnan(termprob(i,:)));
                        lintermprob   = termprob(i,~isnan(termprob(i,:)));
                        logpathlength = linpathlength(lintermprob ~= 0);
                        logtermprob   = lintermprob(lintermprob ~= 0);
                        loglog(logpathlength,logtermprob,styles{1,i});
                        if ~isempty(logtermprob)
                            hold on;
                            legendtextcount = legendtextcount + 1;
                            legendtext(1,legendtextcount) = {['Diameter: ' num2str(diameter(i))]};
                        end
                    end
                    xlabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Termination Probability','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    legend(legendtext);
                    clear legendtext;
                    [ax,h3]=suplabel('Termination Probability by Length - LogLog'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Term_Prob_108_Length_LogLog');
                    print('-djpeg',filename);
                    close all;
                
                    
                    
                    
    % By Surface Area

        [diameterlength,pathlengthlength] = size(controlanalysis.termination.doublebin.terminationprobability.bysurfacearea);
        diameter = controlanalysis.termination.doublebin.diameter(:,1);
        pathlength = controlanalysis.termination.doublebin.pathlength(1,:);
        bifprob  = controlanalysis.termination.doublebin.bifurcationprobability.bysurfacearea;
        termprob = controlanalysis.termination.doublebin.terminationprobability.bysurfacearea;

        % Diameter on x-axis
        
            % Linear
            
%                 % Bifurcation probability
%             
%                     figure;
%                     legendtextcount = 0;
%                     
%                     for i=1:pathlengthlength
%                         lindiameter = diameter(~isnan(bifprob(:,i)));
%                         linbifprob  = bifprob(~isnan(bifprob(:,i)),i);
%                         logdiameter = lindiameter(linbifprob ~= 0);
%                         logbifprob  = linbifprob(linbifprob ~= 0);
%                         plot(lindiameter,linbifprob,styles{1,i});
%                         if ~isempty(linbifprob)
%                             hold on;
%                             legendtextcount = legendtextcount + 1;
%                             legendtext(1,legendtextcount) = {['Path Length: ' num2str(pathlength(i))]};
%                         end
%                     end
%                     xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
%                     ylabel('Bifurcation Probability','FontSize',labelfontsize,'FontWeight','b');
%                     set(gca,'FontSize',axesfontsize);
%                     legend(legendtext);
%                     clear legendtext;
%                     [ax,h3]=suplabel('Bifurcation Probability by Surface Area - Linear'  ,'t');
%                     set(h3,'FontSize',titlefontsize);
%                     fillscreen;
%                     filename = sprintf('%s_%s',controlanalysis.inputfilename,'Bif_Prob_201_SurfaceArea_Linear');
%                     print('-djpeg',filename);
%                     close all;
                    
                % Termination Probability
                
                    figure;
                    legendtextcount = 0;
                    
                    for i=1:pathlengthlength
                        lindiameter = diameter(~isnan(termprob(:,i)));
                        lintermprob = termprob(~isnan(termprob(:,i)),i);
                        logdiameter = lindiameter(lintermprob ~= 0);
                        logtermprob = lintermprob(lintermprob ~= 0);
                        plot(lindiameter,lintermprob,styles{1,i});
                        if ~isempty(lintermprob)
                            hold on;
                            legendtextcount = legendtextcount + 1;
                            legendtext(1,legendtextcount) = {['Path Length: ' num2str(pathlength(i))]};
                        end
                    end
                    xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Termination Probability','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    legend(legendtext);
                    clear legendtext;
                    [ax,h3]=suplabel('Termination Probability by Surface Area - Linear'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Term_Prob_201_SurfaceArea_Linear');
                    print('-djpeg',filename);
                    close all;
                    
            % Semilog - x
            
%                 % Bifurcation probability
%             
%                     figure;
%                     legendtextcount = 0;
%                     
%                     for i=1:pathlengthlength
%                         lindiameter = diameter(~isnan(bifprob(:,i)));
%                         linbifprob  = bifprob(~isnan(bifprob(:,i)),i);
%                         logdiameter = lindiameter(linbifprob ~= 0);
%                         logbifprob  = linbifprob(linbifprob ~= 0);
%                         semilogx(lindiameter,linbifprob,styles{1,i});
%                         if ~isempty(linbifprob)
%                             hold on;
%                             legendtextcount = legendtextcount + 1;
%                             legendtext(1,legendtextcount) = {['Path Length: ' num2str(pathlength(i))]};
%                         end
%                     end
%                     xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
%                     ylabel('Bifurcation Probability','FontSize',labelfontsize,'FontWeight','b');
%                     set(gca,'FontSize',axesfontsize);
%                     legend(legendtext);
%                     clear legendtext;
%                     [ax,h3]=suplabel('Bifurcation Probability by Surface Area - Semilog(x)'  ,'t');
%                     set(h3,'FontSize',titlefontsize);
%                     fillscreen;
%                     filename = sprintf('%s_%s',controlanalysis.inputfilename,'Bif_Prob_202_SurfaceArea_Semilog_x');
%                     print('-djpeg',filename);
%                     close all;
                    
                % Termination Probability
                
                    figure;
                    legendtextcount = 0;
                    
                    for i=1:pathlengthlength
                        lindiameter = diameter(~isnan(termprob(:,i)));
                        lintermprob = termprob(~isnan(termprob(:,i)),i);
                        logdiameter = lindiameter(lintermprob ~= 0);
                        logtermprob = lintermprob(lintermprob ~= 0);
                        semilogx(lindiameter,lintermprob,styles{1,i});
                        if ~isempty(lintermprob)
                            hold on;
                            legendtextcount = legendtextcount + 1;
                            legendtext(1,legendtextcount) = {['Path Length: ' num2str(pathlength(i))]};
                        end
                    end
                    xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Termination Probability','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    legend(legendtext);
                    clear legendtext;
                    [ax,h3]=suplabel('Termination Probability by Surface Area - Semilog(x)'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Term_Prob_202_SurfaceArea_Semilog_x');
                    print('-djpeg',filename);
                    close all;
                    
                    
            % Semilog - y
            
%                 % Bifurcation probability
%             
%                     figure;
%                     legendtextcount = 0;
%                     
%                     for i=1:pathlengthlength
%                         lindiameter = diameter(~isnan(bifprob(:,i)));
%                         linbifprob  = bifprob(~isnan(bifprob(:,i)),i);
%                         logdiameter = lindiameter(linbifprob ~= 0);
%                         logbifprob  = linbifprob(linbifprob ~= 0);
%                         semilogy(logdiameter,logbifprob,styles{1,i});
%                         if ~isempty(logbifprob)
%                             hold on;
%                             legendtextcount = legendtextcount + 1;
%                             legendtext(1,legendtextcount) = {['Path Length: ' num2str(pathlength(i))]};
%                         end
%                     end
%                     xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
%                     ylabel('Bifurcation Probability','FontSize',labelfontsize,'FontWeight','b');
%                     set(gca,'FontSize',axesfontsize);
%                     legend(legendtext);
%                     clear legendtext;
%                     [ax,h3]=suplabel('Bifurcation Probability by Surface Area - Semilog(y)'  ,'t');
%                     set(h3,'FontSize',titlefontsize);
%                     fillscreen;
%                     filename = sprintf('%s_%s',controlanalysis.inputfilename,'Bif_Prob_203_SurfaceArea_Semilog_y');
%                     print('-djpeg',filename);
%                     close all;
                    
                % Termination Probability
                
                    figure;
                    legendtextcount = 0;
                    
                    for i=1:pathlengthlength
                        lindiameter = diameter(~isnan(termprob(:,i)));
                        lintermprob = termprob(~isnan(termprob(:,i)),i);
                        logdiameter = lindiameter(lintermprob ~= 0);
                        logtermprob = lintermprob(lintermprob ~= 0);
                        semilogy(logdiameter,logtermprob,styles{1,i});
                        if ~isempty(logtermprob)
                            hold on;
                            legendtextcount = legendtextcount + 1;
                            legendtext(1,legendtextcount) = {['Path Length: ' num2str(pathlength(i))]};
                        end
                    end
                    xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Termination Probability','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    legend(legendtext);
                    clear legendtext;
                    [ax,h3]=suplabel('Termination Probability by Surface Area - Semilog(y)'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Term_Prob_203_SurfaceArea_Semilog_y');
                    print('-djpeg',filename);
                    close all;
                    
                    
            % Log-Log
            
%                 % Bifurcation probability
%             
%                     figure;
%                     legendtextcount = 0;
%                     
%                     for i=1:pathlengthlength
%                         lindiameter = diameter(~isnan(bifprob(:,i)));
%                         linbifprob  = bifprob(~isnan(bifprob(:,i)),i);
%                         logdiameter = lindiameter(linbifprob ~= 0);
%                         logbifprob  = linbifprob(linbifprob ~= 0);
%                         loglog(logdiameter,logbifprob,styles{1,i});
%                         if ~isempty(logbifprob)
%                             hold on;
%                             legendtextcount = legendtextcount + 1;
%                             legendtext(1,legendtextcount) = {['Path Length: ' num2str(pathlength(i))]};
%                         end
%                     end
%                     xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
%                     ylabel('Bifurcation Probability','FontSize',labelfontsize,'FontWeight','b');
%                     set(gca,'FontSize',axesfontsize);
%                     legend(legendtext);
%                     clear legendtext;
%                     [ax,h3]=suplabel('Bifurcation Probability by Surface Area - LogLog'  ,'t');
%                     set(h3,'FontSize',titlefontsize);
%                     fillscreen;
%                     filename = sprintf('%s_%s',controlanalysis.inputfilename,'Bif_Prob_204_SurfaceArea_LogLog');
%                     print('-djpeg',filename);
%                     close all;
                    
                % Termination Probability
                
                    figure;
                    legendtextcount = 0;
                    
                    for i=1:pathlengthlength
                        lindiameter = diameter(~isnan(termprob(:,i)));
                        lintermprob = termprob(~isnan(termprob(:,i)),i);
                        logdiameter = lindiameter(lintermprob ~= 0);
                        logtermprob = lintermprob(lintermprob ~= 0);
                        loglog(logdiameter,logtermprob,styles{1,i});
                        if ~isempty(logtermprob)
                            hold on;
                            legendtextcount = legendtextcount + 1;
                            legendtext(1,legendtextcount) = {['Path Length: ' num2str(pathlength(i))]};
                        end
                    end
                    xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Termination Probability','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    legend(legendtext);
                    clear legendtext;
                    [ax,h3]=suplabel('Termination Probability by Surface Area - LogLog'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Term_Prob_204_SurfaceArea_LogLog');
                    print('-djpeg',filename);
                    close all;

                    
        % Path Length on x-axis
        
            % Linear
            
%                 % Bifurcation probability
%             
%                     figure;
%                     legendtextcount = 0;
%                     
%                     for i=1:diameterlength
%                         linpathlength = pathlength(~isnan(bifprob(i,:)));
%                         linbifprob    = bifprob(i,~isnan(bifprob(i,:)));
%                         logpathlength = linpathlength(linbifprob ~= 0);
%                         logbifprob    = linbifprob(linbifprob ~= 0);
%                         plot(linpathlength,linbifprob,styles{1,i});
%                         if ~isempty(linbifprob)
%                             hold on;
%                             legendtextcount = legendtextcount + 1;
%                             legendtext(1,legendtextcount) = {['Diameter: ' num2str(diameter(i))]};
%                         end
%                     end
%                     xlabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
%                     ylabel('Bifurcation Probability','FontSize',labelfontsize,'FontWeight','b');
%                     set(gca,'FontSize',axesfontsize);
%                     legend(legendtext);
%                     clear legendtext;
%                     [ax,h3]=suplabel('Bifurcation Probability by Surface Area - Linear'  ,'t');
%                     set(h3,'FontSize',titlefontsize);
%                     fillscreen;
%                     filename = sprintf('%s_%s',controlanalysis.inputfilename,'Bif_Prob_205_SurfaceArea_Linear');
%                     print('-djpeg',filename);
%                     close all;
                    
                % Termination Probability
                
                    figure;
                    legendtextcount = 0;
                    
                    for i=1:diameterlength
                        linpathlength = pathlength(~isnan(termprob(i,:)));
                        lintermprob   = termprob(i,~isnan(termprob(i,:)));
                        logpathlength = linpathlength(lintermprob ~= 0);
                        logtermprob   = lintermprob(lintermprob ~= 0);
                        plot(linpathlength,lintermprob,styles{1,i});
                        if ~isempty(lintermprob)
                            hold on;
                            legendtextcount = legendtextcount + 1;
                            legendtext(1,legendtextcount) = {['Diameter: ' num2str(diameter(i))]};
                        end
                    end
                    xlabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Termination Probability','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    legend(legendtext);
                    clear legendtext;
                    [ax,h3]=suplabel('Termination Probability by Surface Area - Linear'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Term_Prob_205_SurfaceArea_Linear');
                    print('-djpeg',filename);
                    close all;
                    
            % Semilog - x
            
%                 % Bifurcation probability
%             
%                     figure;
%                     legendtextcount = 0;
%                     
%                     for i=1:diameterlength
%                         linpathlength = pathlength(~isnan(bifprob(i,:)));
%                         linbifprob    = bifprob(i,~isnan(bifprob(i,:)));
%                         logpathlength = linpathlength(linbifprob ~= 0);
%                         logbifprob    = linbifprob(linbifprob ~= 0);
%                         semilogx(linpathlength,linbifprob,styles{1,i});
%                         if ~isempty(linbifprob)
%                             hold on;
%                             legendtextcount = legendtextcount + 1;
%                             legendtext(1,legendtextcount) = {['Diameter: ' num2str(diameter(i))]};
%                         end
%                     end
%                     xlabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
%                     ylabel('Bifurcation Probability','FontSize',labelfontsize,'FontWeight','b');
%                     set(gca,'FontSize',axesfontsize);
%                     legend(legendtext);
%                     clear legendtext;
%                     [ax,h3]=suplabel('Bifurcation Probability by Surface Area - Semilog(x)'  ,'t');
%                     set(h3,'FontSize',titlefontsize);
%                     fillscreen;
%                     filename = sprintf('%s_%s',controlanalysis.inputfilename,'Bif_Prob_206_SurfaceArea_Semilog_x');
%                     print('-djpeg',filename);
%                     close all;
                    
                % Termination Probability
                
                    figure;
                    legendtextcount = 0;
                    
                    for i=1:diameterlength
                        linpathlength = pathlength(~isnan(termprob(i,:)));
                        lintermprob   = termprob(i,~isnan(termprob(i,:)));
                        logpathlength = linpathlength(lintermprob ~= 0);
                        logtermprob   = lintermprob(lintermprob ~= 0);
                        semilogx(linpathlength,lintermprob,styles{1,i});
                        if ~isempty(lintermprob)
                            hold on;
                            legendtextcount = legendtextcount + 1;
                            legendtext(1,legendtextcount) = {['Diameter: ' num2str(diameter(i))]};
                        end
                    end
                    xlabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Termination Probability','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    legend(legendtext);
                    clear legendtext;
                    [ax,h3]=suplabel('Termination Probability by Surface Area - Semilog(x)'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Term_Prob_206_SurfaceArea_Semilog_x');
                    print('-djpeg',filename);
                    close all;
                    
                    
            % Semilog - y
            
%                 % Bifurcation probability
%             
%                     figure;
%                     legendtextcount = 0;
%                     
%                     for i=1:diameterlength
%                         linpathlength = pathlength(~isnan(bifprob(i,:)));
%                         linbifprob    = bifprob(i,~isnan(bifprob(i,:)));
%                         logpathlength = linpathlength(linbifprob ~= 0);
%                         logbifprob    = linbifprob(linbifprob ~= 0);
%                         semilogy(logpathlength,logbifprob,styles{1,i});
%                         if ~isempty(logbifprob)
%                             hold on;
%                             legendtextcount = legendtextcount + 1;
%                             legendtext(1,legendtextcount) = {['Diameter: ' num2str(diameter(i))]};
%                         end
%                     end
%                     xlabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
%                     ylabel('Bifurcation Probability','FontSize',labelfontsize,'FontWeight','b');
%                     set(gca,'FontSize',axesfontsize);
%                     legend(legendtext);
%                     clear legendtext;
%                     [ax,h3]=suplabel('Bifurcation Probability by Surface Area - Semilog(y)'  ,'t');
%                     set(h3,'FontSize',titlefontsize);
%                     fillscreen;
%                     filename = sprintf('%s_%s',controlanalysis.inputfilename,'Bif_Prob_207_SurfaceArea_Semilog_y');
%                     print('-djpeg',filename);
%                     close all;
                    
                % Termination Probability
                
                    figure;
                    legendtextcount = 0;
                    
                    for i=1:diameterlength
                        linpathlength = pathlength(~isnan(termprob(i,:)));
                        lintermprob   = termprob(i,~isnan(termprob(i,:)));
                        logpathlength = linpathlength(lintermprob ~= 0);
                        logtermprob   = lintermprob(lintermprob ~= 0);
                        semilogy(logpathlength,logtermprob,styles{1,i});
                        if ~isempty(logtermprob)
                            hold on;
                            legendtextcount = legendtextcount + 1;
                            legendtext(1,legendtextcount) = {['Diameter: ' num2str(diameter(i))]};
                        end
                    end
                    xlabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Termination Probability','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    legend(legendtext);
                    clear legendtext;
                    [ax,h3]=suplabel('Termination Probability by Surface Area - Semilog(y)'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Term_Prob_207_SurfaceArea_Semilog_y');
                    print('-djpeg',filename);
                    close all;
                    
                    
            % Log-Log
            
%                 % Bifurcation probability
%             
%                     figure;
%                     legendtextcount = 0;
%                     
%                     for i=1:diameterlength
%                         linpathlength = pathlength(~isnan(bifprob(i,:)));
%                         linbifprob    = bifprob(i,~isnan(bifprob(i,:)));
%                         logpathlength = linpathlength(linbifprob ~= 0);
%                         logbifprob    = linbifprob(linbifprob ~= 0);
%                         loglog(logpathlength,logbifprob,styles{1,i});
%                         if ~isempty(logbifprob)
%                             hold on;
%                             legendtextcount = legendtextcount + 1;
%                             legendtext(1,legendtextcount) = {['Diameter: ' num2str(diameter(i))]};
%                         end
%                     end
%                     xlabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
%                     ylabel('Bifurcation Probability','FontSize',labelfontsize,'FontWeight','b');
%                     set(gca,'FontSize',axesfontsize);
%                     legend(legendtext);
%                     clear legendtext;
%                     [ax,h3]=suplabel('Bifurcation Probability by Surface Area - LogLog'  ,'t');
%                     set(h3,'FontSize',titlefontsize);
%                     fillscreen;
%                     filename = sprintf('%s_%s',controlanalysis.inputfilename,'Bif_Prob_208_SurfaceArea_LogLog');
%                     print('-djpeg',filename);
%                     close all;
                    
                % Termination Probability
                
                    figure;
                    legendtextcount = 0;
                    
                    for i=1:diameterlength
                        linpathlength = pathlength(~isnan(termprob(i,:)));
                        lintermprob   = termprob(i,~isnan(termprob(i,:)));
                        logpathlength = linpathlength(lintermprob ~= 0);
                        logtermprob   = lintermprob(lintermprob ~= 0);
                        loglog(logpathlength,logtermprob,styles{1,i});
                        if ~isempty(logtermprob)
                            hold on;
                            legendtextcount = legendtextcount + 1;
                            legendtext(1,legendtextcount) = {['Diameter: ' num2str(diameter(i))]};
                        end
                    end
                    xlabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Termination Probability','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    legend(legendtext);
                    clear legendtext;
                    [ax,h3]=suplabel('Termination Probability by Surface Area - LogLog'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Term_Prob_208_SurfaceArea_LogLog');
                    print('-djpeg',filename);
                    close all;
                    
                    
                    
    % By Volume

        [diameterlength,pathlengthlength] = size(controlanalysis.termination.doublebin.terminationprobability.byvolume);
        diameter = controlanalysis.termination.doublebin.diameter(:,1);
        pathlength = controlanalysis.termination.doublebin.pathlength(1,:);
        bifprob  = controlanalysis.termination.doublebin.bifurcationprobability.byvolume;
        termprob = controlanalysis.termination.doublebin.terminationprobability.byvolume;

        % Diameter on x-axis
        
            % Linear
            
%                 % Bifurcation probability
%             
%                     figure;
%                     legendtextcount = 0;
%                     
%                     for i=1:pathlengthlength
%                         lindiameter = diameter(~isnan(bifprob(:,i)));
%                         linbifprob  = bifprob(~isnan(bifprob(:,i)),i);
%                         logdiameter = lindiameter(linbifprob ~= 0);
%                         logbifprob  = linbifprob(linbifprob ~= 0);
%                         plot(lindiameter,linbifprob,styles{1,i});
%                         if ~isempty(linbifprob)
%                             hold on;
%                             legendtextcount = legendtextcount + 1;
%                             legendtext(1,legendtextcount) = {['Path Length: ' num2str(pathlength(i))]};
%                         end
%                     end
%                     xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
%                     ylabel('Bifurcation Probability','FontSize',labelfontsize,'FontWeight','b');
%                     set(gca,'FontSize',axesfontsize);
%                     legend(legendtext);
%                     clear legendtext;
%                     [ax,h3]=suplabel('Bifurcation Probability by Volume - Linear'  ,'t');
%                     set(h3,'FontSize',titlefontsize);
%                     fillscreen;
%                     filename = sprintf('%s_%s',controlanalysis.inputfilename,'Bif_Prob_301_Volume_Linear');
%                     print('-djpeg',filename);
%                     close all;
                    
                % Termination Probability
                
                    figure;
                    legendtextcount = 0;
                    
                    for i=1:pathlengthlength
                        lindiameter = diameter(~isnan(termprob(:,i)));
                        lintermprob = termprob(~isnan(termprob(:,i)),i);
                        logdiameter = lindiameter(lintermprob ~= 0);
                        logtermprob = lintermprob(lintermprob ~= 0);
                        plot(lindiameter,lintermprob,styles{1,i});
                        if ~isempty(lintermprob)
                            hold on;
                            legendtextcount = legendtextcount + 1;
                            legendtext(1,legendtextcount) = {['Path Length: ' num2str(pathlength(i))]};
                        end
                    end
                    xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Termination Probability','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    legend(legendtext);
                    clear legendtext;
                    [ax,h3]=suplabel('Termination Probability by Volume - Linear'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Term_Prob_301_Volume_Linear');
                    print('-djpeg',filename);
                    close all;
                    
            % Semilog - x
            
%                 % Bifurcation probability
%             
%                     figure;
%                     legendtextcount = 0;
%                     
%                     for i=1:pathlengthlength
%                         lindiameter = diameter(~isnan(bifprob(:,i)));
%                         linbifprob  = bifprob(~isnan(bifprob(:,i)),i);
%                         logdiameter = lindiameter(linbifprob ~= 0);
%                         logbifprob  = linbifprob(linbifprob ~= 0);
%                         semilogx(lindiameter,linbifprob,styles{1,i});
%                         if ~isempty(linbifprob)
%                             hold on;
%                             legendtextcount = legendtextcount + 1;
%                             legendtext(1,legendtextcount) = {['Path Length: ' num2str(pathlength(i))]};
%                         end
%                     end
%                     xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
%                     ylabel('Bifurcation Probability','FontSize',labelfontsize,'FontWeight','b');
%                     set(gca,'FontSize',axesfontsize);
%                     legend(legendtext);
%                     clear legendtext;
%                     [ax,h3]=suplabel('Bifurcation Probability by Volume - Semilog(x)'  ,'t');
%                     set(h3,'FontSize',titlefontsize);
%                     fillscreen;
%                     filename = sprintf('%s_%s',controlanalysis.inputfilename,'Bif_Prob_302_Volume_Semilog_x');
%                     print('-djpeg',filename);
%                     close all;
                    
                % Termination Probability
                
                    figure;
                    legendtextcount = 0;
                    
                    for i=1:pathlengthlength
                        lindiameter = diameter(~isnan(termprob(:,i)));
                        lintermprob = termprob(~isnan(termprob(:,i)),i);
                        logdiameter = lindiameter(lintermprob ~= 0);
                        logtermprob = lintermprob(lintermprob ~= 0);
                        semilogx(lindiameter,lintermprob,styles{1,i});
                        if ~isempty(lintermprob)
                            hold on;
                            legendtextcount = legendtextcount + 1;
                            legendtext(1,legendtextcount) = {['Path Length: ' num2str(pathlength(i))]};
                        end
                    end
                    xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Termination Probability','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    legend(legendtext);
                    clear legendtext;
                    [ax,h3]=suplabel('Termination Probability by Volume - Semilog(x)'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Term_Prob_302_Volume_Semilog_x');
                    print('-djpeg',filename);
                    close all;
                    
                    
            % Semilog - y
            
%                 % Bifurcation probability
%             
%                     figure;
%                     legendtextcount = 0;
%                     
%                     for i=1:pathlengthlength
%                         lindiameter = diameter(~isnan(bifprob(:,i)));
%                         linbifprob  = bifprob(~isnan(bifprob(:,i)),i);
%                         logdiameter = lindiameter(linbifprob ~= 0);
%                         logbifprob  = linbifprob(linbifprob ~= 0);
%                         semilogy(logdiameter,logbifprob,styles{1,i});
%                         if ~isempty(logbifprob)
%                             hold on;
%                             legendtextcount = legendtextcount + 1;
%                             legendtext(1,legendtextcount) = {['Path Length: ' num2str(pathlength(i))]};
%                         end
%                     end
%                     xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
%                     ylabel('Bifurcation Probability','FontSize',labelfontsize,'FontWeight','b');
%                     set(gca,'FontSize',axesfontsize);
%                     legend(legendtext);
%                     clear legendtext;
%                     [ax,h3]=suplabel('Bifurcation Probability by Volume - Semilog(y)'  ,'t');
%                     set(h3,'FontSize',titlefontsize);
%                     fillscreen;
%                     filename = sprintf('%s_%s',controlanalysis.inputfilename,'Bif_Prob_303_Volume_Semilog_y');
%                     print('-djpeg',filename);
%                     close all;
                    
                % Termination Probability
                
                    figure;
                    legendtextcount = 0;
                    
                    for i=1:pathlengthlength
                        lindiameter = diameter(~isnan(termprob(:,i)));
                        lintermprob = termprob(~isnan(termprob(:,i)),i);
                        logdiameter = lindiameter(lintermprob ~= 0);
                        logtermprob = lintermprob(lintermprob ~= 0);
                        semilogy(logdiameter,logtermprob,styles{1,i});
                        if ~isempty(logtermprob)
                            hold on;
                            legendtextcount = legendtextcount + 1;
                            legendtext(1,legendtextcount) = {['Path Length: ' num2str(pathlength(i))]};
                        end
                    end
                    xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Termination Probability','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    legend(legendtext);
                    clear legendtext;
                    [ax,h3]=suplabel('Termination Probability by Volume - Semilog(y)'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Term_Prob_303_Volume_Semilog_y');
                    print('-djpeg',filename);
                    close all;
                    
                    
            % Log-Log
            
%                 % Bifurcation probability
%             
%                     figure;
%                     legendtextcount = 0;
%                     
%                     for i=1:pathlengthlength
%                         lindiameter = diameter(~isnan(bifprob(:,i)));
%                         linbifprob  = bifprob(~isnan(bifprob(:,i)),i);
%                         logdiameter = lindiameter(linbifprob ~= 0);
%                         logbifprob  = linbifprob(linbifprob ~= 0);
%                         loglog(logdiameter,logbifprob,styles{1,i});
%                         if ~isempty(logbifprob)
%                             hold on;
%                             legendtextcount = legendtextcount + 1;
%                             legendtext(1,legendtextcount) = {['Path Length: ' num2str(pathlength(i))]};
%                         end
%                     end
%                     xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
%                     ylabel('Bifurcation Probability','FontSize',labelfontsize,'FontWeight','b');
%                     set(gca,'FontSize',axesfontsize);
%                     legend(legendtext);
%                     clear legendtext;
%                     [ax,h3]=suplabel('Bifurcation Probability by Volume - LogLog'  ,'t');
%                     set(h3,'FontSize',titlefontsize);
%                     fillscreen;
%                     filename = sprintf('%s_%s',controlanalysis.inputfilename,'Bif_Prob_304_Volume_LogLog');
%                     print('-djpeg',filename);
%                     close all;
                    
                % Termination Probability
                
                    figure;
                    legendtextcount = 0;
                    
                    for i=1:pathlengthlength
                        lindiameter = diameter(~isnan(termprob(:,i)));
                        lintermprob = termprob(~isnan(termprob(:,i)),i);
                        logdiameter = lindiameter(lintermprob ~= 0);
                        logtermprob = lintermprob(lintermprob ~= 0);
                        loglog(logdiameter,logtermprob,styles{1,i});
                        if ~isempty(logtermprob)
                            hold on;
                            legendtextcount = legendtextcount + 1;
                            legendtext(1,legendtextcount) = {['Path Length: ' num2str(pathlength(i))]};
                        end
                    end
                    xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Termination Probability','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    legend(legendtext);
                    clear legendtext;
                    [ax,h3]=suplabel('Termination Probability by Volume - LogLog'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Term_Prob_304_Volume_LogLog');
                    print('-djpeg',filename);
                    close all;

                    
        % Path Length on x-axis
        
            % Linear
            
%                 % Bifurcation probability
%             
%                     figure;
%                     legendtextcount = 0;
%                     
%                     for i=1:diameterlength
%                         linpathlength = pathlength(~isnan(bifprob(i,:)));
%                         linbifprob    = bifprob(i,~isnan(bifprob(i,:)));
%                         logpathlength = linpathlength(linbifprob ~= 0);
%                         logbifprob    = linbifprob(linbifprob ~= 0);
%                         plot(linpathlength,linbifprob,styles{1,i});
%                         if ~isempty(linbifprob)
%                             hold on;
%                             legendtextcount = legendtextcount + 1;
%                             legendtext(1,legendtextcount) = {['Diameter: ' num2str(diameter(i))]};
%                         end
%                     end
%                     xlabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
%                     ylabel('Bifurcation Probability','FontSize',labelfontsize,'FontWeight','b');
%                     set(gca,'FontSize',axesfontsize);
%                     legend(legendtext);
%                     clear legendtext;
%                     [ax,h3]=suplabel('Bifurcation Probability by Volume - Linear'  ,'t');
%                     set(h3,'FontSize',titlefontsize);
%                     fillscreen;
%                     filename = sprintf('%s_%s',controlanalysis.inputfilename,'Bif_Prob_305_Volume_Linear');
%                     print('-djpeg',filename);
%                     close all;
                    
                % Termination Probability
                
                    figure;
                    legendtextcount = 0;
                    
                    for i=1:diameterlength
                        linpathlength = pathlength(~isnan(termprob(i,:)));
                        lintermprob   = termprob(i,~isnan(termprob(i,:)));
                        logpathlength = linpathlength(lintermprob ~= 0);
                        logtermprob   = lintermprob(lintermprob ~= 0);
                        plot(linpathlength,lintermprob,styles{1,i});
                        if ~isempty(lintermprob)
                            hold on;
                            legendtextcount = legendtextcount + 1;
                            legendtext(1,legendtextcount) = {['Diameter: ' num2str(diameter(i))]};
                        end
                    end
                    xlabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Termination Probability','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    legend(legendtext);
                    clear legendtext;
                    [ax,h3]=suplabel('Termination Probability by Volume - Linear'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Term_Prob_305_Volume_Linear');
                    print('-djpeg',filename);
                    close all;
                    
            % Semilog - x
            
%                 % Bifurcation probability
%             
%                     figure;
%                     legendtextcount = 0;
%                     
%                     for i=1:diameterlength
%                         linpathlength = pathlength(~isnan(bifprob(i,:)));
%                         linbifprob    = bifprob(i,~isnan(bifprob(i,:)));
%                         logpathlength = linpathlength(linbifprob ~= 0);
%                         logbifprob    = linbifprob(linbifprob ~= 0);
%                         semilogx(linpathlength,linbifprob,styles{1,i});
%                         if ~isempty(linbifprob)
%                             hold on;
%                             legendtextcount = legendtextcount + 1;
%                             legendtext(1,legendtextcount) = {['Diameter: ' num2str(diameter(i))]};
%                         end
%                     end
%                     xlabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
%                     ylabel('Bifurcation Probability','FontSize',labelfontsize,'FontWeight','b');
%                     set(gca,'FontSize',axesfontsize);
%                     legend(legendtext);
%                     clear legendtext;
%                     [ax,h3]=suplabel('Bifurcation Probability by Volume - Semilog(x)'  ,'t');
%                     set(h3,'FontSize',titlefontsize);
%                     fillscreen;
%                     filename = sprintf('%s_%s',controlanalysis.inputfilename,'Bif_Prob_306_Volume_Semilog_x');
%                     print('-djpeg',filename);
%                     close all;
                    
                % Termination Probability
                
                    figure;
                    legendtextcount = 0;
                    
                    for i=1:diameterlength
                        linpathlength = pathlength(~isnan(termprob(i,:)));
                        lintermprob   = termprob(i,~isnan(termprob(i,:)));
                        logpathlength = linpathlength(lintermprob ~= 0);
                        logtermprob   = lintermprob(lintermprob ~= 0);
                        semilogx(linpathlength,lintermprob,styles{1,i});
                        if ~isempty(lintermprob)
                            hold on;
                            legendtextcount = legendtextcount + 1;
                            legendtext(1,legendtextcount) = {['Diameter: ' num2str(diameter(i))]};
                        end
                    end
                    xlabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Termination Probability','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    legend(legendtext);
                    clear legendtext;
                    [ax,h3]=suplabel('Termination Probability by Volume - Semilog(x)'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Term_Prob_306_Volume_Semilog_x');
                    print('-djpeg',filename);
                    close all;
                    
                    
            % Semilog - y
            
%                 % Bifurcation probability
%             
%                     figure;
%                     legendtextcount = 0;
%                     
%                     for i=1:diameterlength
%                         linpathlength = pathlength(~isnan(bifprob(i,:)));
%                         linbifprob    = bifprob(i,~isnan(bifprob(i,:)));
%                         logpathlength = linpathlength(linbifprob ~= 0);
%                         logbifprob    = linbifprob(linbifprob ~= 0);
%                         semilogy(logpathlength,logbifprob,styles{1,i});
%                         if ~isempty(logbifprob)
%                             hold on;
%                             legendtextcount = legendtextcount + 1;
%                             legendtext(1,legendtextcount) = {['Diameter: ' num2str(diameter(i))]};
%                         end
%                     end
%                     xlabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
%                     ylabel('Bifurcation Probability','FontSize',labelfontsize,'FontWeight','b');
%                     set(gca,'FontSize',axesfontsize);
%                     legend(legendtext);
%                     clear legendtext;
%                     [ax,h3]=suplabel('Bifurcation Probability by Volume - Semilog(y)'  ,'t');
%                     set(h3,'FontSize',titlefontsize);
%                     fillscreen;
%                     filename = sprintf('%s_%s',controlanalysis.inputfilename,'Bif_Prob_307_Volume_Semilog_y');
%                     print('-djpeg',filename);
%                     close all;
%                     
                % Termination Probability
                
                    figure;
                    legendtextcount = 0;
                    
                    for i=1:diameterlength
                        linpathlength = pathlength(~isnan(termprob(i,:)));
                        lintermprob   = termprob(i,~isnan(termprob(i,:)));
                        logpathlength = linpathlength(lintermprob ~= 0);
                        logtermprob   = lintermprob(lintermprob ~= 0);
                        semilogy(logpathlength,logtermprob,styles{1,i});
                        if ~isempty(logtermprob)
                            hold on;
                            legendtextcount = legendtextcount + 1;
                            legendtext(1,legendtextcount) = {['Diameter: ' num2str(diameter(i))]};
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
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Term_Prob_307_Volume_Semilog_y');
                    print('-djpeg',filename);
                    close all;
                    
                    
            % Log-Log
            
%                 % Bifurcation probability
%             
%                     figure;
%                     legendtextcount = 0;
%                     
%                     for i=1:diameterlength
%                         linpathlength = pathlength(~isnan(bifprob(i,:)));
%                         linbifprob    = bifprob(i,~isnan(bifprob(i,:)));
%                         logpathlength = linpathlength(linbifprob ~= 0);
%                         logbifprob    = linbifprob(linbifprob ~= 0);
%                         loglog(logpathlength,logbifprob,styles{1,i});
%                         if ~isempty(logbifprob)
%                             hold on;
%                             legendtextcount = legendtextcount + 1;
%                             legendtext(1,legendtextcount) = {['Diameter: ' num2str(diameter(i))]};
%                         end
%                     end
%                     xlabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
%                     ylabel('Bifurcation Probability','FontSize',labelfontsize,'FontWeight','b');
%                     set(gca,'FontSize',axesfontsize);
%                     legend(legendtext);
%                     clear legendtext;
%                     [ax,h3]=suplabel('Bifurcation Probability by Volume - LogLog'  ,'t');
%                     set(h3,'FontSize',titlefontsize);
%                     fillscreen;
%                     filename = sprintf('%s_%s',controlanalysis.inputfilename,'Bif_Prob_308_Volume_LogLog');
%                     print('-djpeg',filename);
%                     close all;
                    
                % Termination Probability
                
                    figure;
                    legendtextcount = 0;
                    
                    for i=1:diameterlength
                        linpathlength = pathlength(~isnan(termprob(i,:)));
                        lintermprob   = termprob(i,~isnan(termprob(i,:)));
                        logpathlength = linpathlength(lintermprob ~= 0);
                        logtermprob   = lintermprob(lintermprob ~= 0);
                        loglog(logpathlength,logtermprob,styles{1,i});
                        if ~isempty(logtermprob)
                            hold on;
                            legendtextcount = legendtextcount + 1;
                            legendtext(1,legendtextcount) = {['Diameter: ' num2str(diameter(i))]};
                        end
                    end
                    xlabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Termination Probability','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    legend(legendtext);
                    clear legendtext;
                    [ax,h3]=suplabel('Termination Probability by Volume - LogLog'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Term_Prob_308_Volume_LogLog');
                    print('-djpeg',filename);
                    close all;


