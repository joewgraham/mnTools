function branchratiofigures(controlanalysis,testanalysis)

titlefontsize = 14;
labelfontsize = 7;
axesfontsize  = 5;
insetfontsize = 5;


indbluemarkersize  = 7;
indgreenmarkersize = 3;
indredmarkersize   = 5;

bluemarkersize    = 10;
greenmarkersize   = 6;
redmarkersize     = 8;
cyanmarkersize    = 8;
yellowmarkersize  = 4;
magentamarkersize = 6;

figure;

%subplot(2,2,1)

controldatax1 = [controlanalysis.bifurcatingcable.distaldiameter.values];
controldatay1 = [controlanalysis.bifurcatingcable.rallratio.values];
scatter(controldatax1,controldatay1,'.b');
hold on;
[controla,controlb,controlfitx,controlfity,controlr2] = powerfit(controldatax1,controldatay1,xlim);
plot(controlfitx,controlfity,'r');

controldatax2   = [controlanalysis.diameter.diameter];
controldatay2   = [controlanalysis.diameter.rallratio.mean];
plot(controldatax2,controldatay2,'g');

[controla,controlb,controlfitx,controlfity,controlr2] = powerfit(controldatax2,controldatay2,xlim);
plot(controlfitx,controlfity,'m');



xlimits=xlim;
ylimits=ylim;

text1ypos=0.9*max(ylimits);
text2ypos=0.8*max(ylimits);
text1xpos=0.1*max(xlimits);
text2xpos=text1xpos;
text1=sprintf('%s%.2f%s%.2f%s','y=',controla,'x^{',controlb,'}');
text(text1xpos,text1ypos,text1,'FontSize',insetfontsize,'Color','b');
text2=sprintf('%s%.2f','r^2=',controlr2);
text(text2xpos,text2ypos,text2,'FontSize',insetfontsize,'Color','b');

ylabel('Rall Ratio (D^{1.5})','FontSize',labelfontsize,'FontWeight','b');
legendhandle = gca;    
%     ylimits=ylim;
%     ylimits=[0 ylimits(2)];
%     ylim(ylimits);

%set(gca,'xticklabel', []);
set(gca,'FontSize',axesfontsize);hold off;