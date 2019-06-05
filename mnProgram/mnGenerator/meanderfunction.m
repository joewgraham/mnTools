function [elevation,azimuth] = meanderfunction(meanderanglepop,parentelevation,parentazimuth,piecelength)

elevation=parentelevation;
azimuth=parentazimuth;

meanderangle=samplefunction(meanderanglepop);
%meanderangle=meanderangle*piecelength;
elevation=elevation+meanderangle;

meanderangle=samplefunction(meanderanglepop);
%meanderangle=meanderangle*piecelength;
azimuth=azimuth+meanderangle;
