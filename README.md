# mnTools

This is a toolbox for dealing with neuronal morphology.  It allows the importation of '.swc' and BBP '.h5' morphology files, the individual and population analysis (and figure generation) of the morphologies; the extraction of parameter/local measure relationships, and the algorithmic generation ("synthesis") of virtual neurons.

The code is currently in MATLAB, but I am slowly working to port it to Python.

Feel free to contact me with any questions: joe.w.graham@gmail.com

## Using mnTools

You will need to clone this repository, start MATLAB, change directories to ``mnTools/mnHelp``, and execute ``mnaddpaths``:

    git clone https://github.com/joewgraham/mnTools.git
    [start MATLAB]
    cd mnTools/mnHelp; mnaddpaths;

This will add the necessary ``mnTools`` paths to MATLAB and put you back in the main ``mnTools`` directory.

Now we will import and analyze a few populations of morphologies.

    mnimport('real', 'mnInput/mns_real_virtual/real_burke/')
    mnfigures(real_analysis)
    
    mnimport('virtual_a', 'mnInput/mns_real_virtual/virtual_a/')
    mnfigures(virtual_a_analysis)
    
    mnimport('virtual_b', 'mnInput/mns_real_virtual/virtual_b/')
    mnfigures(virtual_b_analysis)
    
    mnimport('virtual_g', 'mnInput/mns_real_virtual/virtual_g/')
    mnfigures(virtual_g_analysis)
    
Now we will compare the real and virtual populations.

    mncomparisonfigures(real_analysis, virtual_a_analysis)
    mncomparisonfigures(real_analysis, virtual_b_analysis)
    mncomparisonfigures(real_analysis, virtual_g_analysis)
    
