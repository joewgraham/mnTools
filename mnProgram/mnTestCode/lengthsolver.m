function length = lengthsolver(volume, proxdiam, taper)

a = (taper^2);
b = -3*taper*proxdiam;
c = 3*proxdiam^2;
d = -12*volume/pi;

alllengths = cubicfcn(a,b,c,d);
length = alllengths(1);
