% Input File for Motoneuron Generation
% ------------------------------------
% Distribution types are 'constant', 'uniform', 'normal', and 'pearson'.

% Number of cells

    input.numbercellspop.dist='constant';
         
        input.numbercellspop.const  = 13;
        input.numbercellspop.min    = 0;
        input.numbercellspop.mean   = 0;
        input.numbercellspop.max    = 0;
        input.numbercellspop.sd     = 0;
        
% Cell class

    % Information about gamma/alpha ratio will go here
    
% Location in Pool
       
    input.xpositionpop.dist='constant';
    input.ypositionpop.dist='constant';
    input.zpositionpop.dist='constant';
   
    
        input.xpositionpop.const = 0;    input.ypositionpop.const = 0;    input.zpositionpop.const = 0;
        input.xpositionpop.min   = 0;    input.ypositionpop.min   = 0;    input.zpositionpop.min   = 0;
        input.xpositionpop.mean  = 0;    input.ypositionpop.mean  = 0;    input.zpositionpop.mean  = 0;
        input.xpositionpop.max   = 0;    input.ypositionpop.max   = 0;    input.zpositionpop.max   = 0;
        input.xpositionpop.sd    = 0;    input.ypositionpop.sd    = 0;    input.zpositionpop.sd    = 0;
                   
% Soma diameter        
        
    input.somadiameterpop.dist='pearson';
    
        input.somadiameterpop.const    = 0;
        input.somadiameterpop.min      = 0;
        input.somadiameterpop.mean     = 35.1538;
        input.somadiameterpop.max      = 0;
        input.somadiameterpop.sd       = 3.6448;
        input.somadiameterpop.skewness = 0.3118;
        input.somadiameterpop.kurtosis = 2.3357;
        
% Number primary dendrites

    % Number primary dendrites type (linear or lumped)
    
        input.numberprimarydendritespop.type = 'lumped';

        % Number primary dendrites linear
        
            input.numberprimarydendritespop(1).min         = 0;
            input.numberprimarydendritespop(1).max         = 100;        
            input.numberprimarydendritespop.linearm        = 0.02;
            input.numberprimarydendritespop.linearb        = 7.27;
            input.numberprimarydendritespop.meantostdratio = 0.22;                     
                                
        % Number primary dendrites lumped   
    
            input.numberprimarydendritespop(2).dist = 'pearson';
    
            input.numberprimarydendritespop(2).const    = 0;
            input.numberprimarydendritespop(2).min      = 0;
            input.numberprimarydendritespop(2).mean     = 8.0;
            input.numberprimarydendritespop(2).max      = 0;
            input.numberprimarydendritespop(2).sd       = 1.7321;
            input.numberprimarydendritespop(2).skewness = 0.8012;
            input.numberprimarydendritespop(2).kurtosis = 3.25;

% Primary dendrite diameters
        
    input.primarydendritediameterpop.dist = 'pearson';
    
        input.primarydendritediameterpop.const    = 0;
        input.primarydendritediameterpop.min      = 0;
        input.primarydendritediameterpop.mean     = 5.2413;
        input.primarydendritediameterpop.max      = 0;
        input.primarydendritediameterpop.sd       = 2.0826;
        input.primarydendritediameterpop.skewness = 0.4893;
        input.primarydendritediameterpop.kurtosis = 3.2473;
        
% Minimum dendritic diameter

    input.mindendriticdiameter = 0.25;
        
% Piece length

    input.piecelengthpop.switchdiameter         = 5;            % Set to zero to only use the sampling function
    input.piecelengthpop.piecelengthtotaperrate = 1;
    input.piecelengthpop.minimumpiecelength     = 1;
    
    input.piecelengthpop.dist = 'normal';
  
        input.piecelengthpop.const = 10;
        input.piecelengthpop.min   = 3;
        input.piecelengthpop.mean  = 10;
        input.piecelengthpop.max   = 14;
        input.piecelengthpop.sd    = 5;

% Meander angle

     input.meanderanglepop.dist = 'uniform';
  
        input.meanderanglepop.const = 0;
        input.meanderanglepop.min   = -1;
        input.meanderanglepop.mean  = 0;
        input.meanderanglepop.max   = 1;
        input.meanderanglepop.sd    = 0;
     
% Branch length
        
    % Branch length type (linear or power)
    
        input.branchlengthpop.type = 'power';
 
        % Power rule dendrite branch length
           
            input.branchlengthpop(1).min         = 15;
            input.branchlengthpop(1).max         = 1000;
            input.branchlengthpop.powera         = 131.07;
            input.branchlengthpop.powerb         = 0.15;
            input.branchlengthpop.meantostdratio = 1;
                      
        % Default branch length 
        
            input.branchlengthpop(2).dist = 'normal';      

                input.branchlengthpop(2).const = 0;        
                input.branchlengthpop(2).min   = 30;         
                input.branchlengthpop(2).mean  = 175;       
                input.branchlengthpop(2).max   = 300;        
                input.branchlengthpop(2).sd    = 75;          
        
        % Primary dendrite branch length

            input.branchlengthpop(3).dist = 'normal';

                input.branchlengthpop(3).const = 0;
                input.branchlengthpop(3).min   = 15;
                input.branchlengthpop(3).mean  = 90; 
                input.branchlengthpop(3).max   = 250;
                input.branchlengthpop(3).sd    = 50;
                
        % Second order dendrite branch length

            input.branchlengthpop(4).dist = 'normal';

                input.branchlengthpop(4).const = 0;
                input.branchlengthpop(4).min   = 30;
                input.branchlengthpop(4).mean  = 150; 
                input.branchlengthpop(4).max   = 275;
                input.branchlengthpop(4).sd    = 75;

        % Terminal branch length

            input.branchlengthpop(5).dist = 'normal';
   
                input.branchlengthpop(5).const = 50;
                input.branchlengthpop(5).min   = 30;
                input.branchlengthpop(5).mean  = 50;
                input.branchlengthpop(5).max   = 100;
                input.branchlengthpop(5).sd    = 50;
        
% Taper rate
        
    % Taper rate type (linear or power)
    
        input.taperratepop.type           = 'power';
        
        % Power rule dendrite branch length
           
            input.taperratepop(1).min         = -1000;
            input.taperratepop(1).max         = 1000;
            input.taperratepop.powera         = 0.002679;
            input.taperratepop.powerb         = 0.88;
            input.taperratepop.meantostdratio = 1;
        
        % Default linear taper rate

            input.taperratepop(2).dist = 'normal';

                input.taperratepop(2).const = 0;
                input.taperratepop(2).min   = 0;
                input.taperratepop(2).mean  = 0.00144;
                input.taperratepop(2).max   = 0.004;
                input.taperratepop(2).sd    = 0.00054;

        % Primary dendrite linear taper rate

            input.taperratepop(3).dist = 'normal';
   
                input.taperratepop(3).const = 0;
                input.taperratepop(3).min   = 0;
                input.taperratepop(3).mean  = 5*0.00144;
                input.taperratepop(3).max   = 5*0.004;
                input.taperratepop(3).sd    = 5*0.00054;

% Bifurcation threshold

    input.thresholdpop.dist = 'normal';
   
        input.thresholdpop.const = 0.0;
        input.thresholdpop.min   = 0.0;
        input.thresholdpop.mean  = 1.0;
        input.thresholdpop.max   = 1.0;
        input.thresholdpop.sd    = 0.25;

% Daughter diameter ratio

    input.daughterratiopop.dist = 'normal';

        input.daughterratiopop.const = 0;
        input.daughterratiopop.min   = 1;
        input.daughterratiopop.mean  = 1.3;
        input.daughterratiopop.max   = 5;
        input.daughterratiopop.sd    = 0.8;

 % Rall ratio

     % Rall Ratio type (linear or power)
    
        input.rallratiopop.type           = 'power';
        input.rallratiopop.powera         = 0.89;
        input.rallratiopop.powerb         = 0.34;
        input.rallratiopop.meantostdratio = 0.1;
 
    input.rallratiopop.dist = 'normal';

        input.rallratiopop.const = 0;
        input.rallratiopop.min   = 0;
        input.rallratiopop.mean  = 1.11;
        input.rallratiopop.max   = 100;
        input.rallratiopop.sd    = 0.18;

% Daughter direction     
    
    input.daughteranglepop.dist = 'uniform';
  
        input.daughteranglepop.const = 0;
        input.daughteranglepop.min   = -45;
        input.daughteranglepop.mean  = 0;
        input.daughteranglepop.max   = 45;
        input.daughteranglepop.sd    = 20;

        input.daughteranglepop.minangle = 45;