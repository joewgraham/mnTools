function piecelength = piecelengthfunction(inputpiecelength,minimumdiameter,proximaldiameter)

piecelength = samplefunction(inputpiecelength);

% if proximaldiameter > minimumdiameter && (proximaldiameter - taperrate * piecelength) < minimumdiameter 
    % piecelength = 1.01*((proximaldiameter - minimumdiameter) / taperrate);
	% disp('       Warning: piece length shortened.');  
	% disp(sprintf('%s %.0f','         Motoneuron number:',mnnum));
    % disp(sprintf('%s %.0f','         Piece number     :',currentpiece));
	% disp(sprintf('%s %.2f','         Proximal diameter:',mnpop.mn(mnnum).piece(currentpiece).proximaldiameter));
    % disp(sprintf('%s %.2f','         Distal diameter  :',mnpop.mn(mnnum).piece(currentpiece).distaldiameter));
	% disp(sprintf('%s %.2f','         Taper Rate       :',mnpop.mn(mnnum).piece(currentpiece).taperrate));
% end