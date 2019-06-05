function doublebintaperratefigures(controlanalysis)
% Branching/Terminating Taper Rate Figures

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
    if exist('taperrate','dir')==7
        cd('taperrate');
    else
        mkdir('taperrate');
        cd('taperrate');
    end
    
    
% Bifurcation   

        [diameterlength,pathlengthlength] = size(controlanalysis.bifurcation.doublebin.bifurcationprobability.bylength);
        diameter = controlanalysis.bifurcation.doublebin.diameter(:,1);
        pathlength = controlanalysis.bifurcation.doublebin.pathlength(1,:);
        biftaper  = controlanalysis.bifurcation.doublebin.taperrate.mean;
        
        % Diameter on x-axis
        
            % Linear
            
                % Bifurcation Taper Rate
            
                    figure;
                    legendtextcount = 0;
                    
                    for i=1:pathlengthlength
                        lindiameter = diameter(~isnan(biftaper(:,i)));
                        linbiftaper  = biftaper(~isnan(biftaper(:,i)),i);
                        logdiameter = lindiameter(linbiftaper ~= 0);
                        logbiftaper  = linbiftaper(linbiftaper ~= 0);
                        plot(lindiameter,linbiftaper,styles{1,i});
                        if ~isempty(linbiftaper)
                            hold on;
                            legendtextcount = legendtextcount + 1;
                            legendtext(1,legendtextcount) = {['Path Length: ' num2str(pathlength(i))]};
                        end
                    end
                    xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Bifurcation Taper Rate','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    if exist('legendtext') == 1; legend(legendtext); end;
                    clear legendtext;
                    [ax,h3]=suplabel('Bifurcation Taper Rate - Linear'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Bif_Taper_Rate_101_Linear');
                    print('-djpeg',filename);
                    %close all;
                    

                    
            % Semilog - x
            
                % Bifurcation Taper Rate
            
                    figure;
                    legendtextcount = 0;
                    
                    for i=1:pathlengthlength
                        lindiameter = diameter(~isnan(biftaper(:,i)));
                        linbiftaper  = biftaper(~isnan(biftaper(:,i)),i);
                        logdiameter = lindiameter(linbiftaper ~= 0);
                        logbiftaper  = linbiftaper(linbiftaper ~= 0);
                        semilogx(lindiameter,linbiftaper,styles{1,i});
                        if ~isempty(linbiftaper)
                            hold on;
                            legendtextcount = legendtextcount + 1;
                            legendtext(1,legendtextcount) = {['Path Length: ' num2str(pathlength(i))]};
                        end
                    end
                    xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Bifurcation Taper Rate','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    if exist('legendtext') == 1; legend(legendtext); end;
                    clear legendtext;
                    [ax,h3]=suplabel('Bifurcation Taper Rate - Semilog(x)'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Bif_Taper_Rate_102_Semilog_x');
                    print('-djpeg',filename);
                    %close all;
                    
                   
                    
            % Semilog - y
            
                % Bifurcation taper rate
            
                    figure;
                    legendtextcount = 0;
                    
                    for i=1:pathlengthlength
                        lindiameter = diameter(~isnan(biftaper(:,i)));
                        linbiftaper  = biftaper(~isnan(biftaper(:,i)),i);
                        logdiameter = lindiameter(linbiftaper ~= 0);
                        logbiftaper  = linbiftaper(linbiftaper ~= 0);
                        semilogy(logdiameter,logbiftaper,styles{1,i});
                        if ~isempty(logbiftaper)
                            hold on;
                            legendtextcount = legendtextcount + 1;
                            legendtext(1,legendtextcount) = {['Path Length: ' num2str(pathlength(i))]};
                        end
                    end
                    xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Bifurcation Taper Rate','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    if exist('legendtext') == 1; legend(legendtext); end;
                    clear legendtext;
                    [ax,h3]=suplabel('Bifurcation Taper Rate - Semilog(y)'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Bif_Taper_Rate_103_Semilog_y');
                    print('-djpeg',filename);
                    %close all;
                    
                    
                    
            % Log-Log
            
                % Bifurcation Taper Rate
            
                    figure;
                    legendtextcount = 0;
                    
                    for i=1:pathlengthlength
                        lindiameter = diameter(~isnan(biftaper(:,i)));
                        linbiftaper  = biftaper(~isnan(biftaper(:,i)),i);
                        logdiameter = lindiameter(linbiftaper ~= 0);
                        logbiftaper  = linbiftaper(linbiftaper ~= 0);
                        loglog(logdiameter,logbiftaper,styles{1,i});
                        if ~isempty(logbiftaper)
                            hold on;
                            legendtextcount = legendtextcount + 1;
                            legendtext(1,legendtextcount) = {['Path Length: ' num2str(pathlength(i))]};
                        end
                    end
                    xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Bifurcation Taper Rate','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    if exist('legendtext') == 1; legend(legendtext); end;
                    clear legendtext;
                    [ax,h3]=suplabel('Bifurcation Taper Rate - LogLog'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Bif_Taper_Rate_104_LogLog');
                    print('-djpeg',filename);
                    %close all;
                    

                    
        % Path Length on x-axis
        
            % Linear
            
                % Bifurcation Taper Rate
            
                    figure;
                    legendtextcount = 0;
                    
                    for i=1:diameterlength
                        linpathlength = pathlength(~isnan(biftaper(i,:)));
                        linbiftaper    = biftaper(i,~isnan(biftaper(i,:)));
                        logpathlength = linpathlength(linbiftaper ~= 0);
                        logbiftaper    = linbiftaper(linbiftaper ~= 0);
                        plot(linpathlength,linbiftaper,styles{1,i});
                        if ~isempty(linbiftaper)
                            hold on;
                            legendtextcount = legendtextcount + 1;
                            legendtext(1,legendtextcount) = {['Diameter: ' num2str(diameter(i))]};
                        end
                    end
                    xlabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Bifurcation Taper Rate','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    if exist('legendtext') == 1; legend(legendtext); end;
                    clear legendtext;
                    [ax,h3]=suplabel('Bifurcation Taper Rate - Linear'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Bif_Taper_Rate_105_Linear');
                    print('-djpeg',filename);
                    %close all;
                    
                    
            % Semilog - x
            
                % Bifurcation Taper Rate
            
                    figure;
                    legendtextcount = 0;
                    
                    for i=1:diameterlength
                        linpathlength = pathlength(~isnan(biftaper(i,:)));
                        linbiftaper    = biftaper(i,~isnan(biftaper(i,:)));
                        logpathlength = linpathlength(linbiftaper ~= 0);
                        logbiftaper    = linbiftaper(linbiftaper ~= 0);
                        semilogx(linpathlength,linbiftaper,styles{1,i});
                        if ~isempty(linbiftaper)
                            hold on;
                            legendtextcount = legendtextcount + 1;
                            legendtext(1,legendtextcount) = {['Diameter: ' num2str(diameter(i))]};
                        end
                    end
                    xlabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Bifurcation Taper Rate','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    if exist('legendtext') == 1; legend(legendtext); end;
                    clear legendtext;
                    [ax,h3]=suplabel('Bifurcation Taper Rate - Semilog(x)'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Bif_Taper_Rate_106_Semilog_x');
                    print('-djpeg',filename);
                    %close all;
                    

                    
            % Semilog - y
            
                % Bifurcation Taper Rate
            
                    figure;
                    legendtextcount = 0;
                    
                    for i=1:diameterlength
                        linpathlength = pathlength(~isnan(biftaper(i,:)));
                        linbiftaper    = biftaper(i,~isnan(biftaper(i,:)));
                        logpathlength = linpathlength(linbiftaper ~= 0);
                        logbiftaper    = linbiftaper(linbiftaper ~= 0);
                        semilogy(logpathlength,logbiftaper,styles{1,i});
                        if ~isempty(logbiftaper)
                            hold on;
                            legendtextcount = legendtextcount + 1;
                            legendtext(1,legendtextcount) = {['Diameter: ' num2str(diameter(i))]};
                        end
                    end
                    xlabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Bifurcation Taper Rate','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    if exist('legendtext') == 1; legend(legendtext); end;
                    clear legendtext;
                    [ax,h3]=suplabel('Bifurcation Taper Rate - Semilog(y)'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Bif_Taper_Rate_107_Semilog_y');
                    print('-djpeg',filename);
                    %close all;
                    

                    
            % Log-Log
            
                % Bifurcation Taper Rate
            
                    figure;
                    legendtextcount = 0;
                    
                    for i=1:diameterlength
                        linpathlength = pathlength(~isnan(biftaper(i,:)));
                        linbiftaper    = biftaper(i,~isnan(biftaper(i,:)));
                        logpathlength = linpathlength(linbiftaper ~= 0);
                        logbiftaper    = linbiftaper(linbiftaper ~= 0);
                        loglog(logpathlength,logbiftaper,styles{1,i});
                        if ~isempty(logbiftaper)
                            hold on;
                            legendtextcount = legendtextcount + 1;
                            legendtext(1,legendtextcount) = {['Diameter: ' num2str(diameter(i))]};
                        end
                    end
                    xlabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Bifurcation Taper Rate','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    if exist('legendtext') == 1; legend(legendtext); end;
                    clear legendtext;
                    [ax,h3]=suplabel('Bifurcation Taper Rate - LogLog'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Bif_Taper_Rate_108_LogLog');
                    print('-djpeg',filename);
                    %close all;
                    
                    
                    
% Termination   

        [diameterlength,pathlengthlength] = size(controlanalysis.termination.doublebin.terminationprobability.bylength);
        diameter = controlanalysis.termination.doublebin.diameter(:,1);
        pathlength = controlanalysis.termination.doublebin.pathlength(1,:);
        termtaper  = controlanalysis.termination.doublebin.taperrate.mean;
        
        % Diameter on x-axis
        
            % Linear
            
                % Termination Taper Rate
            
                    figure;
                    legendtextcount = 0;
                    
                    for i=1:pathlengthlength
                        lindiameter = diameter(~isnan(termtaper(:,i)));
                        lintermtaper  = termtaper(~isnan(termtaper(:,i)),i);
                        logdiameter = lindiameter(lintermtaper ~= 0);
                        logtermtaper  = lintermtaper(lintermtaper ~= 0);
                        plot(lindiameter,lintermtaper,styles{1,i});
                        if ~isempty(lintermtaper)
                            hold on;
                            legendtextcount = legendtextcount + 1;
                            legendtext(1,legendtextcount) = {['Path Length: ' num2str(pathlength(i))]};
                        end
                    end
                    xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Termination Taper Rate','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    if exist('legendtext') == 1; legend(legendtext); end;
                    clear legendtext;
                    [ax,h3]=suplabel('Termination Taper Rate - Linear'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Term_Taper_Rate_101_Linear');
                    print('-djpeg',filename);
                    %close all;
                    

                    
            % Semilog - x
            
                % Termination Taper Rate
            
                    figure;
                    legendtextcount = 0;
                    
                    for i=1:pathlengthlength
                        lindiameter = diameter(~isnan(termtaper(:,i)));
                        lintermtaper  = termtaper(~isnan(termtaper(:,i)),i);
                        logdiameter = lindiameter(lintermtaper ~= 0);
                        logtermtaper  = lintermtaper(lintermtaper ~= 0);
                        semilogx(lindiameter,lintermtaper,styles{1,i});
                        if ~isempty(lintermtaper)
                            hold on;
                            legendtextcount = legendtextcount + 1;
                            legendtext(1,legendtextcount) = {['Path Length: ' num2str(pathlength(i))]};
                        end
                    end
                    xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Termination Taper Rate','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    if exist('legendtext') == 1; legend(legendtext); end;
                    clear legendtext;
                    [ax,h3]=suplabel('Termination Taper Rate - Semilog(x)'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Term_Taper_Rate_102_Semilog_x');
                    print('-djpeg',filename);
                    %close all;
                    
                   
                    
            % Semilog - y
            
                % Termination taper rate
            
                    figure;
                    legendtextcount = 0;
                    
                    for i=1:pathlengthlength
                        lindiameter = diameter(~isnan(termtaper(:,i)));
                        lintermtaper  = termtaper(~isnan(termtaper(:,i)),i);
                        logdiameter = lindiameter(lintermtaper ~= 0);
                        logtermtaper  = lintermtaper(lintermtaper ~= 0);
                        semilogy(logdiameter,logtermtaper,styles{1,i});
                        if ~isempty(logtermtaper)
                            hold on;
                            legendtextcount = legendtextcount + 1;
                            legendtext(1,legendtextcount) = {['Path Length: ' num2str(pathlength(i))]};
                        end
                    end
                    xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Termination Taper Rate','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    if exist('legendtext') == 1; legend(legendtext); end;
                    clear legendtext;
                    [ax,h3]=suplabel('Termination Taper Rate - Semilog(y)'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Term_Taper_Rate_103_Semilog_y');
                    print('-djpeg',filename);
                    %close all;
                    
                    
                    
            % Log-Log
            
                % Termination Taper Rate
            
                    figure;
                    legendtextcount = 0;
                    
                    for i=1:pathlengthlength
                        lindiameter = diameter(~isnan(termtaper(:,i)));
                        lintermtaper  = termtaper(~isnan(termtaper(:,i)),i);
                        logdiameter = lindiameter(lintermtaper ~= 0);
                        logtermtaper  = lintermtaper(lintermtaper ~= 0);
                        loglog(logdiameter,logtermtaper,styles{1,i});
                        if ~isempty(logtermtaper)
                            hold on;
                            legendtextcount = legendtextcount + 1;
                            legendtext(1,legendtextcount) = {['Path Length: ' num2str(pathlength(i))]};
                        end
                    end
                    xlabel('Diameter (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Termination Taper Rate','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    if exist('legendtext') == 1; legend(legendtext); end;
                    clear legendtext;
                    [ax,h3]=suplabel('Termination Taper Rate - LogLog'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Term_Taper_Rate_104_LogLog');
                    print('-djpeg',filename);
                    %close all;
                    

                    
        % Path Length on x-axis
        
            % Linear
            
                % Termination Taper Rate
            
                    figure;
                    legendtextcount = 0;
                    
                    for i=1:diameterlength
                        linpathlength = pathlength(~isnan(termtaper(i,:)));
                        lintermtaper    = termtaper(i,~isnan(termtaper(i,:)));
                        logpathlength = linpathlength(lintermtaper ~= 0);
                        logtermtaper    = lintermtaper(lintermtaper ~= 0);
                        plot(linpathlength,lintermtaper,styles{1,i});
                        if ~isempty(lintermtaper)
                            hold on;
                            legendtextcount = legendtextcount + 1;
                            legendtext(1,legendtextcount) = {['Diameter: ' num2str(diameter(i))]};
                        end
                    end
                    xlabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Termination Taper Rate','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    if exist('legendtext') == 1; legend(legendtext); end;
                    clear legendtext;
                    [ax,h3]=suplabel('Termination Taper Rate - Linear'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Term_Taper_Rate_105_Linear');
                    print('-djpeg',filename);
                    %close all;
                    
                    
            % Semilog - x
            
                % Termination Taper Rate
            
                    figure;
                    legendtextcount = 0;
                    
                    for i=1:diameterlength
                        linpathlength = pathlength(~isnan(termtaper(i,:)));
                        lintermtaper    = termtaper(i,~isnan(termtaper(i,:)));
                        logpathlength = linpathlength(lintermtaper ~= 0);
                        logtermtaper    = lintermtaper(lintermtaper ~= 0);
                        semilogx(linpathlength,lintermtaper,styles{1,i});
                        if ~isempty(lintermtaper)
                            hold on;
                            legendtextcount = legendtextcount + 1;
                            legendtext(1,legendtextcount) = {['Diameter: ' num2str(diameter(i))]};
                        end
                    end
                    xlabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Termination Taper Rate','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    if exist('legendtext') == 1; legend(legendtext); end;
                    clear legendtext;
                    [ax,h3]=suplabel('Termination Taper Rate - Semilog(x)'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Term_Taper_Rate_106_Semilog_x');
                    print('-djpeg',filename);
                    %close all;
                    

                    
            % Semilog - y
            
                % Termination Taper Rate
            
                    figure;
                    legendtextcount = 0;
                    
                    for i=1:diameterlength
                        linpathlength = pathlength(~isnan(termtaper(i,:)));
                        lintermtaper    = termtaper(i,~isnan(termtaper(i,:)));
                        logpathlength = linpathlength(lintermtaper ~= 0);
                        logtermtaper    = lintermtaper(lintermtaper ~= 0);
                        semilogy(logpathlength,logtermtaper,styles{1,i});
                        if ~isempty(logtermtaper)
                            hold on;
                            legendtextcount = legendtextcount + 1;
                            legendtext(1,legendtextcount) = {['Diameter: ' num2str(diameter(i))]};
                        end
                    end
                    xlabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Termination Taper Rate','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    if exist('legendtext') == 1; legend(legendtext); end;
                    clear legendtext;
                    [ax,h3]=suplabel('Termination Taper Rate - Semilog(y)'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Term_Taper_Rate_107_Semilog_y');
                    print('-djpeg',filename);
                    %close all;
                    

                    
            % Log-Log
            
                % Termination Taper Rate
            
                    figure;
                    legendtextcount = 0;
                    
                    for i=1:diameterlength
                        linpathlength = pathlength(~isnan(termtaper(i,:)));
                        lintermtaper    = termtaper(i,~isnan(termtaper(i,:)));
                        logpathlength = linpathlength(lintermtaper ~= 0);
                        logtermtaper    = lintermtaper(lintermtaper ~= 0);
                        loglog(logpathlength,logtermtaper,styles{1,i});
                        if ~isempty(logtermtaper)
                            hold on;
                            legendtextcount = legendtextcount + 1;
                            legendtext(1,legendtextcount) = {['Diameter: ' num2str(diameter(i))]};
                        end
                    end
                    xlabel('Path Length (\mum)','FontSize',labelfontsize,'FontWeight','b');
                    ylabel('Termination Taper Rate','FontSize',labelfontsize,'FontWeight','b');
                    set(gca,'FontSize',axesfontsize);
                    if exist('legendtext') == 1; legend(legendtext); end;
                    clear legendtext;
                    [ax,h3]=suplabel('Termination Taper Rate - LogLog'  ,'t');
                    set(h3,'FontSize',titlefontsize);
                    fillscreen;
                    filename = sprintf('%s_%s',controlanalysis.inputfilename,'Term_Taper_Rate_108_LogLog');
                    print('-djpeg',filename);
                    %close all;
                    
