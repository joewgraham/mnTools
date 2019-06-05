function branchtype = branchtypefunction(proximaldiameter,proximalpathlength,branchorder,inputprobabilitybranch)
% branchtypefunction

testvalue  = rand;
parameter = [inputprobabilitybranch.parameter1 inputprobabilitybranch.parameter2 inputprobabilitybranch.parameter3];

if strcmp(inputprobabilitybranch.mode,'diameter') == 1

	parameter = parameter(1:2)';

    if strcmp(inputprobabilitybranch.type,'logit')
		%branchprob = 1 / (1 + exp(-(inputprobabilitybranch.parameter2 * proximaldiameter + inputprobabilitybranch.parameter1)));
		branchprob = glmval(parameter,proximaldiameter,'logit');
	elseif strcmp(inputprobabilitybranch.type,'probit')
		branchprob = glmval(parameter,proximaldiameter,'probit');
	elseif strcmp(inputprobabilitybranch.type,'comploglog')
		branchprob = glmval(parameter,proximaldiameter,'comploglog');
	elseif strcmp(inputprobabilitybranch.type,'loglog')
		branchprob = glmval(parameter,proximaldiameter,'loglog');
	else
		disp('Error: branch type probability type.');
		keyboard;
	end
		
    if testvalue < branchprob
        branchtype = 'b';
    else
        branchtype = 't';
    end
	
	if isfield(inputprobabilitybranch,'mindiameter')
		if ~isnan(inputprobabilitybranch.mindiameter)
			if inputprobabilitybranch.mindiameter >= proximaldiameter
				branchtype = 't';
			end
		end
	end
		
	if isfield(inputprobabilitybranch,'maxpathlength')
		if ~isnan(inputprobabilitybranch.maxpathlength)
			if inputprobabilitybranch.maxpathlength <= proximalpathlength
				branchtype = 't';
			end
		end
	end
	
	if isfield(inputprobabilitybranch,'maxbranchorder')
		if ~isnan(inputprobabilitybranch.maxbranchorder)
			if inputprobabilitybranch.maxbranchorder <= branchorder
				if strcmp(branchtype,'b')
                    disp('Turning bif into term because of max branch order set in inputfile.');
                end
                branchtype = 't';
			end
		end
	end
		

elseif strcmp(inputprobabilitybranch.mode,'pathlength') == 1
    
    parameter = parameter(1:2)';

    if strcmp(inputprobabilitybranch.type,'logit')
		%branchprob = 1 / (1 + exp(-(inputprobabilitybranch.parameter2 * proximalpathlength + inputprobabilitybranch.parameter1)));
		branchprob = glmval(parameter,proximalpathlength,'logit');
	elseif strcmp(inputprobabilitybranch.type,'probit')
		branchprob = glmval(parameter,proximalpathlength,'probit');
	elseif strcmp(inputprobabilitybranch.type,'comploglog')
		branchprob = glmval(parameter,proximalpathlength,'comploglog');
	elseif strcmp(inputprobabilitybranch.type,'loglog')
		branchprob = glmval(parameter,proximalpathlength,'loglog');
	else
		disp('Error: branch type probability type.');
		keyboard;
	end
	
		
	if testvalue < branchprob
        branchtype = 'b';
    else
        branchtype = 't';
    end
    
	if isfield(inputprobabilitybranch,'mindiameter')
		if ~isnan(inputprobabilitybranch.mindiameter)
			if inputprobabilitybranch.mindiameter > proximaldiameter
				branchtype = 't';
			end
		end
	end
		
	if isfield(inputprobabilitybranch,'maxpathlength')
		if ~isnan(inputprobabilitybranch.maxpathlength)
			if inputprobabilitybranch.maxpathlength < proximalpathlength
				branchtype = 't';
			end
		end
	end
	
	if isfield(inputprobabilitybranch,'maxbranchorder')
		if ~isnan(inputprobabilitybranch.maxbranchorder)
			if inputprobabilitybranch.maxbranchorder < branchorder
				branchtype = 't';
			end
		end
	end
	
elseif strcmp(inputprobabilitybranch.mode,'diameterpathlength') == 1
	
	parameter = parameter(1:3)';
	
	if strcmp(inputprobabilitybranch.type,'logit')
		%branchprob = 1 / (1 + exp(-(inputprobabilitybranch.parameter3 * proximalpathlength + inputprobabilitybranch.parameter2 * proximaldiameter + inputprobabilitybranch.parameter1)));
		branchprob = glmval(parameter,[proximaldiameter proximalpathlength],'logit');
	elseif strcmp(inputprobabilitybranch.type,'probit')
		branchprob = glmval(parameter,[proximaldiameter proximalpathlength],'probit');
	elseif strcmp(inputprobabilitybranch.type,'comploglog')
		branchprob = glmval(parameter,[proximaldiameter proximalpathlength],'comploglog');
	elseif strcmp(inputprobabilitybranch.type,'loglog')
		branchprob = glmval(parameter,[proximaldiameter proximalpathlength],'loglog');
	else
		disp('Error: branch type probability type.');
		keyboard;
	end

	
    if testvalue < branchprob
        branchtype = 'b';
    else
        branchtype = 't';
    end

	if isfield(inputprobabilitybranch,'mindiameter')
		if ~isnan(inputprobabilitybranch.mindiameter)
			if inputprobabilitybranch.mindiameter > proximaldiameter
				branchtype = 't';
			end
		end
	end
		
	if isfield(inputprobabilitybranch,'maxpathlength')
		if ~isnan(inputprobabilitybranch.maxpathlength)
			if inputprobabilitybranch.maxpathlength < proximalpathlength
				branchtype = 't';
			end
		end
	end
	
	if isfield(inputprobabilitybranch,'maxbranchorder')
		if ~isnan(inputprobabilitybranch.maxbranchorder)
			if inputprobabilitybranch.maxbranchorder < branchorder
				branchtype = 't';
			end
		end
	end
	
elseif strcmp(inputprobabilitybranch.mode,'diameterbranchorder') == 1
	
	parameter = parameter(1:3)';
	
	if strcmp(inputprobabilitybranch.type,'logit')
		%branchprob = 1 / (1 + exp(-(inputprobabilitybranch.parameter3 * branchorder + inputprobabilitybranch.parameter2 * proximaldiameter + inputprobabilitybranch.parameter1)));
		branchprob = glmval(parameter,[proximaldiameter branchorder],'logit');
	elseif strcmp(inputprobabilitybranch.type,'probit')
		branchprob = glmval(parameter,[proximaldiameter branchorder],'probit');
	elseif strcmp(inputprobabilitybranch.type,'comploglog')
		branchprob = glmval(parameter,[proximaldiameter branchorder],'comploglog');
	elseif strcmp(inputprobabilitybranch.type,'loglog')
		branchprob = glmval(parameter,[proximaldiameter branchorder],'loglog');
	else
		disp('Error: branch type probability type.');
		keyboard;
	end

	
    if testvalue < branchprob
        branchtype = 'b';
    else
        branchtype = 't';
    end

	if isfield(inputprobabilitybranch,'mindiameter')
		if ~isnan(inputprobabilitybranch.mindiameter)
			if inputprobabilitybranch.mindiameter > proximaldiameter
				branchtype = 't';
			end
		end
	end
		
	if isfield(inputprobabilitybranch,'maxpathlength')
		if ~isnan(inputprobabilitybranch.maxpathlength)
			if inputprobabilitybranch.maxpathlength < proximalpathlength
				branchtype = 't';
			end
		end
	end
	
	if isfield(inputprobabilitybranch,'maxbranchorder')
		if ~isnan(inputprobabilitybranch.maxbranchorder)
			if inputprobabilitybranch.maxbranchorder < branchorder
				branchtype = 't';
			end
		end
	end
    
    
else
    disp('Error: branch type mode not appropriate.');
    keyboard;
end