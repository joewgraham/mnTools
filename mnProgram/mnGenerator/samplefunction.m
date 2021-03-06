function sampleoutput = samplefunction(sampleinput)
% samplefunction

% If the distribution is uniform    
if strcmp(sampleinput.distribution,'uniform')==1
    if ~isfinite(sampleinput.min) || ~isfinite(sampleinput.max)
        disp('Error: missing min or max for uniform sampling.');
        keyboard;
    end
    sampleoutput=sampleinput.min+rand.*(sampleinput.max-sampleinput.min);
    
    

% If the distribution is normal
elseif strcmp(sampleinput.distribution,'normal')==1
	if isfinite(sampleinput.min)
		if isfinite(sampleinput.max)
			sampleoutput=sampleinput.min-1;
			while sampleoutput<sampleinput.min || sampleoutput>sampleinput.max
				sampleoutput=normrnd(sampleinput.mean,sampleinput.sd);                 
			end
		else
			sampleoutput=sampleinput.min-1;
			while sampleoutput<sampleinput.min
				sampleoutput=normrnd(sampleinput.mean,sampleinput.sd);
			end
		end            
	elseif ~isfinite(sampleinput.min)
		if isfinite(sampleinput.max)
			sampleoutput=sampleinput.max+1;
			while sampleoutput>sampleinput.max
				sampleoutput=normrnd(sampleinput.mean,sampleinput.sd);
			end
		else
			sampleoutput=normrnd(sampleinput.mean,sampleinput.sd);
		end
	end

	
% % If the distribution is gamma
elseif strcmp(sampleinput.distribution,'gamma')==1
	if isfinite(sampleinput.min)
		if isfinite(sampleinput.max)
			sampleoutput=sampleinput.min-1;
			while sampleoutput<sampleinput.min || sampleoutput>sampleinput.max
				sampleoutput=gamrnd(sampleinput.gammaa,sampleinput.gammab);
			end
		else
			sampleoutput=sampleinput.min-1;
			while sampleoutput<sampleinput.min
				sampleoutput=gamrnd(sampleinput.gammaa,sampleinput.gammab);
			end
		end
	elseif ~isfinite(sampleinput.min)
		if isfinite(sampleinput.max)
			sampleoutput=sampleinput.max+1;
			while sampleoutput>sampleinput.max
				sampleoutput=gamrnd(sampleinput.gammaa,sampleinput.gammab);
			end
		else
			sampleoutput=gamrnd(sampleinput.gammaa,sampleinput.gammab);	
		end
	end	
    


% If the distribution is Pearson    
elseif strcmp(sampleinput.distribution,'pearson')==1
    if isfinite(sampleinput.min)
        if isfinite(sampleinput.max)
            sampleoutput=sampleinput.min-1;
            while sampleoutput<sampleinput.min || sampleoutput>sampleinput.max
                sampleoutput=pearsrnd(sampleinput.mean,sampleinput.sd,sampleinput.skew,sampleinput.kurt);  
            end
        else
            sampleoutput=sampleinput.min-1;
            while sampleoutput<sampleinput.min
                sampleoutput=pearsrnd(sampleinput.mean,sampleinput.sd,sampleinput.skew,sampleinput.kurt);
            end
        end
    elseif ~isfinite(sampleinput.min)
        if isfinite(sampleinput.max)
            sampleoutput=sampleinput.max+1;
            while sampleoutput>sampleinput.max
                sampleoutput=pearsrnd(sampleinput.mean,sampleinput.sd,sampleinput.skew,sampleinput.kurt);
            end
        else
            sampleoutput=pearsrnd(sampleinput.mean,sampleinput.sd,sampleinput.skew,sampleinput.kurt);
        end
    end
    
% If the distribution is log-normal    
elseif strcmp(sampleinput.distribution,'lognormal')==1
    sampleoutput = lognrnd(sampleinput.mean,sampleinput.sd);
    
% If the distribution is a constant
elseif strcmp(sampleinput.distribution,'constant')==1
	sampleoutput=sampleinput.const;
    
   
else

	disp('Error in samplefunction.m');
	keyboard;

end










