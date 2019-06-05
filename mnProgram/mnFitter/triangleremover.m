function fitdata = triangleremover(fitdata,measuredata)


% This next bit of code removes the triangles of NaNs from the double fit
measuredata2 = flipud(measuredata);
fitdata2 = flipud(fitdata);
[r,c] = size(measuredata2);
rowcount = 0;
for i = 0:-1:-(r-1)
		%disp(sprintf('rowdiag : %d',i));
		%disp(sprintf(' Tot: %d',length(diag(measuredata2,i))));
		%disp(sprintf(' NaN: %d',sum(isnan(diag(measuredata2,i)))));
	if length(diag(measuredata2,i)) == sum(isnan(diag(measuredata2,i))) && length(diag(measuredata2,i+1)) == sum(isnan(diag(measuredata2,i+1)))
		for j = 1:length(diag(measuredata2,i))
				%disp(sprintf('    nanrow: %d',abs(i)+j));
				%disp(sprintf('    nancol: %f',j));
			fitdata2(abs(i)+j,j)=NaN;
		end
	end
end
for i = 0:1:(c-1)
		%disp(sprintf('rowdiag : %d',i));
		%disp(sprintf(' Tot: %d',length(diag(measuredata2,i))));
		%disp(sprintf(' NaN: %d',sum(isnan(diag(measuredata2,i)))));
	if length(diag(measuredata2,i)) == sum(isnan(diag(measuredata2,i))) && length(diag(measuredata2,i-1)) == sum(isnan(diag(measuredata2,i-1)))
		for j = 1:length(diag(measuredata2,i))
				%disp(sprintf('    nanrow: %d',j));
				%disp(sprintf('    nancol: %f',i+j));
			fitdata2(j,i+j)=NaN;
		end
	end
end
fitdata = flipud(fitdata2);
% End of removing triangles of NaNs from the double fit
