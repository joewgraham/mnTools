function [primarydendriteelevation,primarydendriteazimuth] = primarydendritedirectionsfunction(numberprimarydendrites)

minimumanglebetween = 15;

elevation(1) = 90 - (180 * rand);
azimuth(1)   = 360 * rand;

[xdirection(1),ydirection(1),zdirection(1)] = directionfunction(elevation(1),azimuth(1));
direction(1,:) = [xdirection(1) ydirection(1) zdirection(1)];

if numberprimarydendrites > 1

	for i = 2:numberprimarydendrites
		
		clear tempangles;
		tempangles = zeros(1,i-1);

		while min(tempangles) < minimumanglebetween
			
			elevation(i) = 90 - (180 * rand);
			azimuth(i)   = 360 * rand;
			
			[xdirection(i),ydirection(i),zdirection(i)] = directionfunction(elevation(i),azimuth(i));
			direction(i,:) = [xdirection(i) ydirection(i) zdirection(i)];
			
			for j = 1:(i-1)           
				tempangles(j) = (180/pi())*atan2(norm(cross(direction(i,:),direction(j,:))),dot(direction(i,:),direction(j,:)));
			end
			
		end
	end
end

primarydendriteelevation = elevation';
primarydendriteazimuth   = azimuth';
    

% minimumdistancebetween=0.6;
%  
% meantotaldistance=(0.682)*((numberprimarydendrites)^2)-(0.3983)*(numberprimarydendrites)-0.7776;
% totaldistance=meantotaldistance+1;
% 
%     elevation(1)=360*rand;
%     azimuth(1)=360*rand;
% 
%     x(1)=sin((pi()/180)*(90-elevation(1)))*cos((pi()/180)*(azimuth(1)));
%     y(1)=sin((pi()/180)*(90-elevation(1)))*sin((pi()/180)*(azimuth(1)));
%     z(1)=cos((pi()/180)*(90-elevation(1)));
% 
% while totaldistance>meantotaldistance
%     
%     temptotaldistance=0;
% 
%     for j=2:numberprimarydendrites
%         clear testdistance;
%         testdistance = zeros(1,j-1);
%         while min(testdistance) < minimumdistancebetween
% 
%             elevation(j)=360*rand;
%             azimuth(j)=360*rand;
% 
%             x(j)=sin((pi()/180)*(90-elevation(j)))*cos((pi()/180)*(azimuth(j)));
%             y(j)=sin((pi()/180)*(90-elevation(j)))*sin((pi()/180)*(azimuth(j)));
%             z(j)=cos((pi()/180)*(90-elevation(j)));
% 
%             for m=1:j-1
%                 testdistance(m)=((x(j)-x(m))^2 + (y(j)-y(m))^2 + (z(j)-z(m))^2)^(0.5);
%             end
%         end
%         for k=1:j
%             distance(k)=((x(j)-x(k))^2 + (y(j)-y(k))^2 + (z(j)-z(k))^2)^(0.5);
%             temptotaldistance=temptotaldistance+distance(k);
%         end
% 
%         totaldistance=temptotaldistance;
% 
%     end
% end
% 
% primarydendriteelaz=[elevation; azimuth]';