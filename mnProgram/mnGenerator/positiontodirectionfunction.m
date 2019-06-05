function [xdirection,ydirection,zdirection] = positiontodirectionfunction(proximalxposition,proximalyposition,proximalzposition,distalxposition,distalyposition,distalzposition)

length = ((proximalxposition-distalxposition)^2+(proximalyposition-distalyposition)^2+(proximalzposition-distalzposition)^2)^0.5;

if distalxposition == proximalxposition 
    xdirection = 0;
else
    xdirection = (distalxposition-proximalxposition)/length;
end

if distalyposition == proximalyposition 
    ydirection = 0;
else
    ydirection = (distalyposition-proximalyposition)/length;
end

if distalzposition == proximalzposition 
    zdirection = 0;
else
    zdirection = (distalzposition-proximalzposition)/length;
end