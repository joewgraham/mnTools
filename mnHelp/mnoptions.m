% Options File for mnCode
% ------------------------------------

% mnGenerator
  
    %use random seed?
	option.mngenerator.randomseed = 'n';
	
	%save mnpop.mat?
    option.mngenerator.savemnpop = 'y';
    
    %analyze data?
    option.mngenerator.analyze = 'y';
    
    %create figures?
    option.mngenerator.figures = 'n';
    
    %create Plot_Cairo figures?
    option.mngenerator.plotcairo = 'y';
    
    %export data?
    option.mngenerator.export = 'n';


    

% mnAnalyzer

    % perform diameter/path length double binning?
	option.mnanalyzer.doublebin1 = 'n';
	
	% perform diameter/branch length double binning?
	option.mnanalyzer.doublebin2 = 'n';
	
	% perform diameter/branch order double binning?
	option.mnanalyzer.doublebin3 = 'n';
	
	% clear data?
    option.mnanalyzer.clear.data = 'n';
    
    % clear analysis?
    option.mnanalyzer.clear.analysis = 'n';
    
    % save data?
    option.mnanalyzer.save.data = 'n';
    
    % save analysis?
    option.mnanalyzer.save.analysis = 'n';

    % axon binning options
    option.axon.distancebinwidth     = 100; 
	option.axon.branchlengthbinwidth = 50;
	option.axon.diameterbinbreaks    = [2 4]; 
	option.axon.diameterbinwidths    = [0.25 0.5 1.0];
    
    % dendrite binning options
    option.dendrite.distancebinwidth     = 50; %100 for motoneurons, 50 for L5TTPC 
	option.dendrite.branchlengthbinwidth = 25;
	option.dendrite.diameterbinbreaks    = [2 4]; 
	option.dendrite.diameterbinwidths    = [0.25 0.5 1.0];
    
    % apical binning options
    option.apical.distancebinwidth     = 50; 
	option.apical.branchlengthbinwidth = 50;
	option.apical.diameterbinbreaks    = [2 4]; 
	option.apical.diameterbinwidths    = [0.25 0.5 1.0];
    
    
		
% mnFigures

    %create bif/term figures?
    option.mnfigures.bifterm = 'n';

    %create individual bif/term figures?
    option.mnfigures.indbifterm = 'n';
    
    %save matlab '.fig' files?
    option.mnfigures.matfig = 'n';
    
    %figure properties
    option.mnfigures.titlefontsize = 14;
    option.mnfigures.labelfontsize = 7;
    option.mnfigures.axesfontsize  = 5;
    option.mnfigures.insetfontsize = 4;
    
    option.mnfigures.indbluemarkersize  = 7;
    option.mnfigures.indgreenmarkersize = 3;
    option.mnfigures.indredmarkersize   = 5;
    option.mnfigures.bluemarkersize     = 10;
    option.mnfigures.greenmarkersize    = 6;
    option.mnfigures.redmarkersize      = 8;
    option.mnfigures.cyanmarkersize     = 8;
    option.mnfigures.yellowmarkersize   = 4;
    option.mnfigures.magentamarkersize  = 6;
    
    
    
% mnImport

    % vertical direction? ('x', 'y', or 'z')
    option.mnimport.vertical = 'y';

    % save mnpop.mat?
    option.mnimport.savemnpop = 'n';
    
    % analyze data?
    option.mnimport.analyze = 'y';
    
    % create figures?
    option.mnimport.figures = 'n';
    
    % export data?
    option.mnimport.export = 'n';
    
    % parameter fit data?
    option.mnimport.mnfitter = 'n';
    
    % clear data?
    option.mnimport.clear.data = 'n';
    
    % pieces cylindrical or frustal?
    option.mnimport.pieceshape = 'cylindrical';    
    
    
    
% mnExport  
    
    % export piece data?
    option.mnexport.piecedata = 'y';
    
    % export cable data?
    option.mnexport.cabledata = 'y';

    % export swc files?
    option.mnexport.swcdata = 'n';
    
    %export xml files?
    option.mnexport.xmldata = 'n';    
    
