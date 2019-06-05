function branchlength = branchlengthfunction(branchlengthpop,initialtype,branchorder,diameter)

if strcmp(branchlengthpop.independent,'y')==1

    branchlength = samplefunction(branchlengthpop);
    
elseif strcmp(branchlengthpop.independent,'n')==1

    if strcmp(initialtype,'terminal   ') == 1
        if strcmp(branchlengthpop.dependence.terminal.state,'y') == 1
            branchlength = samplefunction(branchlengthpop.dependence.terminal);
        elseif strcmp(branchlengthpop.dependence.terminal.state,'n') == 1
            branchlength = samplefunction(branchlengthpop);
        end

    elseif branchorder == 1
        if strcmp(branchlengthpop.dependence.branchorder(1).state,'y') == 1
            branchlength = samplefunction(branchlengthpop.dependence.branchorder(1));
        elseif strcmp(branchlengthpop.dependence.branchorder(1).state,'n') == 1
            branchlength = samplefunction(branchlengthpop);
        end
    
    elseif branchorder == 2
        if strcmp(branchlengthpop.dependence.branchorder(2).state,'y') == 1
            branchlength = samplefunction(branchlengthpop.dependence.branchorder(2));
        elseif strcmp(branchlengthpop.dependence.branchorder(2).state,'n') == 1
            branchlength = samplefunction(branchlengthpop);
        end
    
    elseif branchorder >= 3
        if strcmp(branchlengthpop.dependence.branchorder(3).state,'y') == 1
            branchlength = samplefunction(branchlengthpop.dependence.branchorder(3));
        elseif strcmp(branchlengthpop.dependence.branchorder(3).state,'n') == 1
            branchlength = samplefunction(branchlengthpop);
        end
    end
end




% if strcmp(branchlengthpop(1).type,'linear')==1
%     
%     if strcmp(initialtype,'terminal   ') == 1 && length(branchlengthpop)>=5        
%         branchlength=samplefunction(branchlengthpop(5));
%         
%     elseif branchorder==1 && length(branchlengthpop)>=2        
%         branchlength=samplefunction(branchlengthpop(3));
%         
%     elseif branchorder==2 && length(branchlengthpop)>=3        
%         branchlength=samplefunction(branchlengthpop(4));
%         
%     else
%         branchlength=samplefunction(branchlengthpop(2));
%         
%     end
%     
% elseif strcmp(branchlengthpop(1).type,'power')==1
% 
%     branchlengthmean = branchlengthpop(1).powera * diameter ^ branchlengthpop(1).powerb;
%     branchlengthstd  = branchlengthpop(1).meantostdratio * branchlengthmean;
%     
%     branchlength=branchlengthpop(1).min-1;
%         while branchlength<branchlengthpop(1).min || branchlength>branchlengthpop(1).max
%             branchlength=normrnd(branchlengthmean,branchlengthstd);
%         end   
% end
