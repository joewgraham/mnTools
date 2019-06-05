function angle = vectoranglefunction(x1,y1,z1,x2,y2,z2)

if 1-sqrt(x1^2+y1^2+z1^2)>0.00001 || 1-sqrt(x2^2+y2^2+z2^2)>0.00001
    disp('Error in vectoranglefunction.');
    disp(sprintf('  Piece vector length : %f',sqrt(x1^2+y1^2+z1^2)));
    disp(sprintf('  Parent vector length: %f',sqrt(x2^2+y2^2+z2^2)));
end

a = [x1 y1 z1];
b = [x2 y2 z2];

radangle = atan2(norm(cross(a,b)),dot(a,b));
angle = radangle*180/pi();


