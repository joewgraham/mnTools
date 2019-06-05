function cablelengthfitter(cable)

actualmarkersize = 6;
fittedmarkersize = 5;
actuallinewidth = 0.25;
fittedlinewidth = 0.25;


diameter    = [cable.proximaldiameter.values]';
pathlength  = [cable.proximalpathlength.values]';
branchorder = [cable.branchorder.values]';
branchlength      = [cable.length.values]';

currentdirectory = cd;
foldername = ['Cable Regression ' datestr(now)];
mkdir(foldername);
cd(foldername);


%diameterbinedges   = [0 0.25 0.5 0.75 1.0 1.25 1.5 1.75 2.0 2.5 3.0 3.5 4.0 5.0 6.0 7.0 8.0 9.0 10.0 11.0 12.0 13.0 14.0 15.0 16.0 17.0 18.0 19.0 20.0]';
%diameterbinmiddles = [0.125 0.375 0.625 0.875 1.125 1.375 1.625 1.875 2.25 2.75 3.25 3.75 4.5 5.5 6.5 7.5 8.5 9.5 10.5 11.5 12.5 13.5 14.5 15.5 16.5 17.5 18.5 19.5]';

diameterbinedges   = [0 1.0 2.0 3.0 4.0 5.0 6.0 7.0 8.0 9.0 10.0 11.0 12.0 13.0 14.0 15.0 16.0 17.0 18.0 19.0 20.0]';
diameterbinmiddles = [0.5 1.5 2.5 3.5 4.5 5.5 6.5 7.5 8.5 9.5 10.5 11.5 12.5 13.5 14.5 15.5 16.5 17.5 18.5 19.5]';

for diameterbin = 1:max(size(diameterbinmiddles))
    diametervalues{diameterbin} = branchlength(diameter > diameterbinedges(diameterbin) & diameter <= diameterbinedges(diameterbin+1));
    fit(diameterbin,:) = lognfit(diametervalues{diameterbin});
end

diameterbinmiddles = diameterbinmiddles(~isnan(fit(:,1)));
fit = fit(~isnan(fit(:,1)),:);
mufit = fit(:,1);
sigmafit = fit(:,2);
mufit = mufit(sigmafit~=0);
sigmafit = sigmafit(sigmafit~=0);

sigmatomu = sigmafit./mufit

overallfit = lognfit(branchlength);
overallmu = overallfit(1);
overallsigma = overallfit(2);

figure;

subplot(2,3,1);
scatter(diameter,branchlength);
hold on;
plot([min(diameterbinmiddles) max(diameterbinmiddles)],[100*overallmu 100*overallmu],'-r','LineWidth',3);
plot([min(diameterbinmiddles) max(diameterbinmiddles)],[100*overallsigma 100*overallsigma],'-g','LineWidth',3);

subplot(2,3,2);
scatter(diameter,branchlength);
hold on;
scatter(diameter,lognrnd(overallfit(1),overallfit(2),length(diameter),1),'rx');

for i = 1:length(diameter)
   maxsample(i) = max(branchlength) + 1;
   while maxsample(i) > max(branchlength)
       maxsample(i) = lognrnd(overallmu,overallsigma,1,1);
   end
end

subplot(2,3,3);
scatter(diameter,branchlength);
hold on;
scatter(diameter,maxsample,'rx');

linearmufit = linearfitterunweighted(diameterbinmiddles,mufit);
linearsigmafit = linearfitterunweighted(diameterbinmiddles,sigmafit);

subplot(2,3,4);
scatter(diameter,branchlength);
hold on;
errorbar(diameterbinmiddles,100*fit(:,1),100*fit(:,2),'ro-');
plot(diameterbinmiddles,100*fit(:,2),'-gs');

for j = 1:length(diameter)
    fitsample(j) = lognrnd(linearmufit(1)*diameter(j)+linearmufit(2),linearsigmafit(1)*diameter(j)+linearsigmafit(2),1,1);
    fitsamplemax(j) = max(branchlength) + 1;
    while fitsamplemax(j) > max(branchlength)
        fitsamplemax(j) = lognrnd(linearmufit(1)*diameter(j)+linearmufit(2),linearsigmafit(1)*diameter(j)+linearsigmafit(2),1,1);
    end
end

subplot(2,3,5);
scatter(diameter,branchlength);
hold on;
scatter(diameter,fitsample,'rx');

subplot(2,3,6);
scatter(diameter,branchlength);
hold on;
scatter(diameter,fitsamplemax,'rx');



cd(currentdirectory);
keyboard

% figure;
% 
% subplot(2,2,1)
% hold on;
% legendhandle = gca;
% ylabel('Number of Branches','FontSize',6);
% xlabel(['Branch ' response],'FontSize',6);
% [ignore xvalues] = hist([Y ysamp1],(max(size(diameter)/10)));
% hist(Y,xvalues);
% hist(ysamp1,xvalues);
% h = findobj(gca,'Type','patch');
% set(h(2),'FaceColor','b','EdgeColor','b','FaceAlpha',0.5,'EdgeAlpha',0.5);
% set(h(1),'FaceColor','r','EdgeColor','r','FaceAlpha',0.5,'EdgeAlpha',0.5);
% set(gca,'FontSize',6);
% 
% subplot(2,2,2)
% hold on;
% ylabel(['Branch ' response],'FontSize',6);
% xlabel('Proximal Diameter','FontSize',6);
% plot(diameter,Y,'bo','MarkerSize',actualmarkersize,'LineWidth',actuallinewidth);
% %plot(diameter,ysamp1,'rx','MarkerSize',fittedmarkersize,'LineWidth',fittedlinewidth);
% plot(diameter,yfit,'gs','MarkerSize',4);
% %plot(diameterbinmiddles,diameterexp,'ko','MarkerFaceColor','b','MarkerSize',8);
% set(gca,'FontSize',6);
% 
% subplot(2,2,3)
% hold on;
% ylabel(['Branch ' response],'FontSize',6);
% xlabel('Proximal Path Length','FontSize',6);
% plot(pathlength,Y,'bo','MarkerSize',actualmarkersize,'LineWidth',actuallinewidth);
% %plot(pathlength,ysamp1,'rx','MarkerSize',fittedmarkersize,'LineWidth',fittedlinewidth);
% plot(pathlength,yfit,'gs','MarkerSize',4);
% %plot(pathlengthbinmiddles,pathlengthexp,'ko','MarkerFaceColor','b','MarkerSize',8);
% set(gca,'FontSize',6);
% 
% subplot(2,2,4)
% hold on;
% ylabel(['Branch ' response],'FontSize',6);
% xlabel('Branch Order','FontSize',6);
% plot(branchorder,Y,'bo','MarkerSize',actualmarkersize,'LineWidth',actuallinewidth);
% %plot(branchorder,ysamp1,'rx','MarkerSize',fittedmarkersize,'LineWidth',fittedlinewidth);
% plot(branchorder,yfit,'gs','MarkerSize',4);
% %plot(branchorderbins,branchorderexp,'ko','MarkerFaceColor','b','MarkerSize',8);
% set(gca,'FontSize',6);
% 
% [ignore,h] = suplabel(['Branch ' response ' as a function of' predictortitle]  ,'t');
% set(h,'FontSize',12,'FontWeight','b');
% 
% 
% legend(legendhandle,'Actual',legendtext);
% set(gca,'FontSize',2);
% 
% filename = ['Cable_regression_' num2str(j) '_' num2str(i) ];
% print('-djpeg',filename);





