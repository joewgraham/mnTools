function regresscable(cable)

actualmarkersize = 6;
fittedmarkersize = 5;
actuallinewidth = 0.25;
fittedlinewidth = 0.25;


diameter    = [cable.proximaldiameter.values]';
pathlength  = [cable.proximalpathlength.values]';
branchorder = [cable.branchorder.values]';
length      = [cable.length.values]';
surfacearea = [cable.surfacearea.values]';
volume      = [cable.volume.values]';

x{1}  = [diameter];
x{2}  = [pathlength];
x{3}  = [branchorder];
x{4}  = [diameter pathlength];
x{5}  = [diameter branchorder];
x{6}  = [diameter pathlength branchorder];
x{7}  = [log(diameter)];
x{8}  = [log(diameter) pathlength];
x{9}  = [log(diameter) branchorder];
x{10} = [log(diameter) pathlength branchorder];
x{11} = [(diameter.^2)];
x{12} = [(diameter.^2) pathlength];
x{13} = [(diameter.^2) branchorder];
x{14} = [(diameter.^2) pathlength branchorder];
x{15} = [diameter.^3];


predictors{1,1}  = 'Diameter    ';
predictors{2,1}  = 'Path Length ';
predictors{3,1}  = 'Branch Order';
predictors{4,1}  = 'Diameter    ';
predictors{4,2}  = 'Path Length ';
predictors{5,1}  = 'Diameter    ';
predictors{5,2}  = 'Branch Order';
predictors{6,1}  = 'Diameter    ';
predictors{6,2}  = 'Path Length ';
predictors{6,3}  = 'Branch Order';
predictors{7,1}  = 'ln(Diameter)';
predictors{8,1}  = 'ln(Diameter)';
predictors{8,2}  = 'Path Length ';
predictors{9,1}  = 'ln(Diameter)';
predictors{9,2}  = 'Branch Order';
predictors{10,1} = 'ln(Diameter)';
predictors{10,2} = 'Path Length ';
predictors{10,3} = 'Branch Order';
predictors{11,1} = 'Diameter^2  ';
predictors{12,1} = 'Diameter^2  ';
predictors{12,2} = 'Path Length ';
predictors{13,1} = 'Diameter^2  ';
predictors{13,2} = 'Branch Order';
predictors{14,1} = 'Diameter^2  ';
predictors{14,2} = 'Path Length ';
predictors{14,3} = 'Branch Order';
predictors{15,1} = 'Diameter^3  ';

y{1} = length;
y{2} = surfacearea;
y{3} = volume;
y{4} = log(volume);

responses{1} = 'Length';
responses{2} = 'Surface Area';
responses{3} = 'Volume';
responses{4} = 'ln(Volume)';

currentdirectory = cd;

foldername = ['Cable Regression ' datestr(now)];
mkdir(foldername);
cd(foldername);

for i = 1:max(size(x))
    clear X;
    X = x{i};
    predictor = predictors{i,:};
    
    
    for j = 4
        clear Y;
        Y = y{j};
        response = responses{j};
        
        clear XL YL XS YS BETA PCTVAR MSE stats;
        [XL,YL,XS,YS,BETA,PCTVAR,MSE,stats] = plsregress(X,Y);
        
        %disp(' ');
        %disp(response);
        %disp(sprintf('   Constant    : %.3e',BETA(1)));
        legendtext = sprintf('Constant    : %.3e',BETA(1));
        
        predictortitle = [];
        for k = 2:max(size(BETA))
            %disp(sprintf('   %s: %.3e',predictors{i,k-1},BETA(k)));
            predictortitle = [predictortitle ' ' predictors{i,k-1}];
            legendtext = char(legendtext,sprintf('%s: %.3e',predictors{i,k-1},BETA(k)));
        end
        
        
        yfit = [ones(size(X,1),1) X]*BETA;
        ysamp1 = exprnd(yfit);
        ysamp2 = exprnd(yfit);
        ysamp3 = exprnd(yfit);
        
%         if j == 4
%             ysamp1 = exp(ysamp1);
%         end
                
        diameterbinedges   = [0 0.25 0.5 0.75 1.0 1.25 1.5 1.75 2.0 2.5 3.0 3.5 4.0 5.0 6.0 7.0 8.0 9.0 10.0 11.0 12.0 13.0 14.0 15.0 16.0 17.0 18.0 19.0 20.0];
        diameterbinmiddles = [0.125 0.375 0.625 0.875 1.125 1.375 1.625 1.875 2.25 2.75 3.25 3.75 4.5 5.5 6.5 7.5 8.5 9.5 10.5 11.5 12.5 13.5 14.5 15.5 16.5 17.5 18.5 19.5];
        pathlengthbinedges = [0:50:3000];
        pathlengthbinmiddles = [25:50:2975];
        branchorderbins = [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50];
        
        for diameterbin = 1:max(size(diameterbinmiddles))
            diametervalues{diameterbin} = Y(diameter > diameterbinedges(diameterbin) & diameter <= diameterbinedges(diameterbin+1));
            diameterexp(diameterbin) = expfit(diametervalues{diameterbin});
        end
        for pathlengthbin = 1:max(size(pathlengthbinmiddles))
            pathlengthvalues{pathlengthbin}  = Y(pathlength > pathlengthbinedges(pathlengthbin) & pathlength <= pathlengthbinedges(pathlengthbin+1));
            pathlengthexp(pathlengthbin) = expfit(pathlengthvalues{pathlengthbin});
        end
        for branchorderbin = 1:max(size(branchorderbins))
            branchordervalues{branchorderbin} = Y(branchorder == branchorderbin);
            branchorderexp(branchorderbin) = expfit(branchordervalues{branchorderbin});
        end
        
        diameterbinmiddles = diameterbinmiddles(~isnan(diameterexp));
        diameterexp = diameterexp(~isnan(diameterexp));
        pathlengthbinmiddles = pathlengthbinmiddles(~isnan(pathlengthexp));
        pathlengthexp = pathlengthexp(~isnan(pathlengthexp));
        branchorderbins = branchorderbins(~isnan(branchorderexp));
        branchorderexp = branchorderexp(~isnan(branchorderexp));
        
        figure;
        
        subplot(2,2,1)
        hold on;
        legendhandle = gca;
        ylabel('Number of Branches','FontSize',6);
        xlabel(['Branch ' response],'FontSize',6);
        %[ignore xvalues] = hist([Y ysamp1],(max(size(diameter)/10)));
        [ignore xvalues] = hist([Y yfit],(max(size(diameter)/10)));
        hist(Y,xvalues);
        %hist(ysamp1,xvalues);
        hist(yfit,xvalues);
        h = findobj(gca,'Type','patch');
        set(h(2),'FaceColor','b','EdgeColor','b','FaceAlpha',0.5,'EdgeAlpha',0.5);
        set(h(1),'FaceColor','r','EdgeColor','r','FaceAlpha',0.5,'EdgeAlpha',0.5);
        set(gca,'FontSize',6);

        subplot(2,2,2)
        hold on;
        ylabel(['Branch ' response],'FontSize',6);
        xlabel('Proximal Diameter','FontSize',6);
        plot(diameter,Y,'bo','MarkerSize',actualmarkersize,'LineWidth',actuallinewidth);
        %plot(diameter,ysamp1,'rx','MarkerSize',fittedmarkersize,'LineWidth',fittedlinewidth);
        plot(diameter,yfit,'gs','MarkerSize',4);
        %plot(diameterbinmiddles,diameterexp,'ko','MarkerFaceColor','b','MarkerSize',8);
        set(gca,'FontSize',6);
        
        subplot(2,2,3)
        hold on;
        ylabel(['Branch ' response],'FontSize',6);
        xlabel('Proximal Path Length','FontSize',6);
        plot(pathlength,Y,'bo','MarkerSize',actualmarkersize,'LineWidth',actuallinewidth);
        %plot(pathlength,ysamp1,'rx','MarkerSize',fittedmarkersize,'LineWidth',fittedlinewidth);
        plot(pathlength,yfit,'gs','MarkerSize',4);
        %plot(pathlengthbinmiddles,pathlengthexp,'ko','MarkerFaceColor','b','MarkerSize',8);
        set(gca,'FontSize',6);
        
        subplot(2,2,4)
        hold on;
        ylabel(['Branch ' response],'FontSize',6);
        xlabel('Branch Order','FontSize',6);
        plot(branchorder,Y,'bo','MarkerSize',actualmarkersize,'LineWidth',actuallinewidth);
        %plot(branchorder,ysamp1,'rx','MarkerSize',fittedmarkersize,'LineWidth',fittedlinewidth);
        plot(branchorder,yfit,'gs','MarkerSize',4);
        %plot(branchorderbins,branchorderexp,'ko','MarkerFaceColor','b','MarkerSize',8);
        set(gca,'FontSize',6);
        
        [ignore,h] = suplabel(['Branch ' response ' as a function of' predictortitle]  ,'t');
        set(h,'FontSize',12,'FontWeight','b');
        
        
        legend(legendhandle,'Actual',legendtext);
        set(gca,'FontSize',2);
        
        filename = ['Cable_regression_' num2str(j) '_' num2str(i) ];
        print('-djpeg',filename);
        
    end
    close all;
end


cd(currentdirectory);

% X = [diameter pathlength branchorder];
% Y = length;
% 
% [XL,YL,XS,YS,BETA,PCTVAR,MSE,stats] = plsregress(X,Y);
% 
% 
% yfit = [ones(size(X,1),1) X]*BETA;
% residuals = Y-yfit;
% 
% stem(residuals)
% xlabel('Observation');
% ylabel('Residual');
% 
% disp(sprintf('Constant: %.8f',BETA(1)));
% disp(sprintf('Diameter: %.8f',BETA(2)));
% disp(sprintf('PathLeng: %.8f',BETA(3)));
% disp(sprintf('Order   : %.8f',BETA(4)));