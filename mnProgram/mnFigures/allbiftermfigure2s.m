function allbiftermfigure2s(controlanalysis,testanalysis)

if nargin == 1

    versus = 'branchorder';
    scale  = 'linear';

        measure = 'numbersegments';
        allbiftermfigure2(measure,versus,scale,controlanalysis);

        measure = 'taperrate';
        allbiftermfigure2(measure,versus,scale,controlanalysis);

        measure = 'taperratio';
        allbiftermfigure2(measure,versus,scale,controlanalysis);

        measure = 'proximaldiameter';
        allbiftermfigure2(measure,versus,scale,controlanalysis);

        measure = 'cylindricaldiameter';
        allbiftermfigure2(measure,versus,scale,controlanalysis);

        measure = 'distaldiameter';
        allbiftermfigure2(measure,versus,scale,controlanalysis);

        measure = 'length';
        allbiftermfigure2(measure,versus,scale,controlanalysis);

        measure = 'surfacearea';
        allbiftermfigure2(measure,versus,scale,controlanalysis);

        measure = 'volume';
        allbiftermfigure2(measure,versus,scale,controlanalysis);

        measure = 'totallength';
        allbiftermfigure2(measure,versus,scale,controlanalysis);

        measure = 'totalsurfacearea';
        allbiftermfigure2(measure,versus,scale,controlanalysis);

        measure = 'totalvolume';
        allbiftermfigure2(measure,versus,scale,controlanalysis);

    close all;

    versus = 'pathlength';
    scale  = 'linear';

        measure = 'numbersegments';
        allbiftermfigure2(measure,versus,scale,controlanalysis);

        measure = 'taperrate';
        allbiftermfigure2(measure,versus,scale,controlanalysis);

        measure = 'diameter';
        allbiftermfigure2(measure,versus,scale,controlanalysis);

        measure = 'length';
        allbiftermfigure2(measure,versus,scale,controlanalysis);

        measure = 'surfacearea';
        allbiftermfigure2(measure,versus,scale,controlanalysis);

        measure = 'volume';
        allbiftermfigure2(measure,versus,scale,controlanalysis);

    close all;

    versus = 'radialdistance';
    scale  = 'linear';

        measure = 'numbersegments';
        allbiftermfigure2(measure,versus,scale,controlanalysis);

        measure = 'taperrate';
        allbiftermfigure2(measure,versus,scale,controlanalysis);

        measure = 'diameter';
        allbiftermfigure2(measure,versus,scale,controlanalysis);

        measure = 'length';
        allbiftermfigure2(measure,versus,scale,controlanalysis);

        measure = 'surfacearea';
        allbiftermfigure2(measure,versus,scale,controlanalysis);

        measure = 'volume';
        allbiftermfigure2(measure,versus,scale,controlanalysis);

    close all;

    versus = 'diameter';
    scale  = 'linear';
    
        measure = 'numbersegments';
        allbiftermfigure2(measure,versus,scale,controlanalysis);

        measure = 'taperrate';
        allbiftermfigure2(measure,versus,scale,controlanalysis);

        measure = 'length';
        allbiftermfigure2(measure,versus,scale,controlanalysis);

        measure = 'surfacearea';
        allbiftermfigure2(measure,versus,scale,controlanalysis);

        measure = 'volume';
        allbiftermfigure2(measure,versus,scale,controlanalysis);

    close all;

    versus = 'diameter';
    scale  = 'semilog';

        measure = 'numbersegments';
        allbiftermfigure2(measure,versus,scale,controlanalysis);

        measure = 'taperrate';
        allbiftermfigure2(measure,versus,scale,controlanalysis);

        measure = 'length';
        allbiftermfigure2(measure,versus,scale,controlanalysis);

        measure = 'surfacearea';
        allbiftermfigure2(measure,versus,scale,controlanalysis);

        measure = 'volume';
        allbiftermfigure2(measure,versus,scale,controlanalysis);

    close all;

    versus = 'diameter';
    scale  = 'loglog';

        measure = 'numbersegments';
        allbiftermfigure2(measure,versus,scale,controlanalysis);

        measure = 'taperrate';
        allbiftermfigure2(measure,versus,scale,controlanalysis);

        measure = 'length';
        allbiftermfigure2(measure,versus,scale,controlanalysis);

        measure = 'surfacearea';
        allbiftermfigure2(measure,versus,scale,controlanalysis);

        measure = 'volume';
        allbiftermfigure2(measure,versus,scale,controlanalysis);

    close all;

end

if nargin == 2

    versus = 'branchorder';
    scale  = 'linear';

        measure = 'numbersegments';
        allbiftermfigure2(measure,versus,scale,controlanalysis,testanalysis);

        measure = 'taperrate';
        allbiftermfigure2(measure,versus,scale,controlanalysis,testanalysis);

        measure = 'taperratio';
        allbiftermfigure2(measure,versus,scale,controlanalysis,testanalysis);

        measure = 'proximaldiameter';
        allbiftermfigure2(measure,versus,scale,controlanalysis,testanalysis);

        measure = 'cylindricaldiameter';
        allbiftermfigure2(measure,versus,scale,controlanalysis,testanalysis);

        measure = 'distaldiameter';
        allbiftermfigure2(measure,versus,scale,controlanalysis,testanalysis);

        measure = 'length';
        allbiftermfigure2(measure,versus,scale,controlanalysis,testanalysis);

        measure = 'surfacearea';
        allbiftermfigure2(measure,versus,scale,controlanalysis,testanalysis);

        measure = 'volume';
        allbiftermfigure2(measure,versus,scale,controlanalysis,testanalysis);

        measure = 'totallength';
        allbiftermfigure2(measure,versus,scale,controlanalysis,testanalysis);

        measure = 'totalsurfacearea';
        allbiftermfigure2(measure,versus,scale,controlanalysis,testanalysis);

        measure = 'totalvolume';
        allbiftermfigure2(measure,versus,scale,controlanalysis,testanalysis);

    close all;

    versus = 'pathlength';
    scale  = 'linear';

        measure = 'numbersegments';
        allbiftermfigure2(measure,versus,scale,controlanalysis,testanalysis);

        measure = 'taperrate';
        allbiftermfigure2(measure,versus,scale,controlanalysis,testanalysis);

        measure = 'diameter';
        allbiftermfigure2(measure,versus,scale,controlanalysis,testanalysis);

        measure = 'length';
        allbiftermfigure2(measure,versus,scale,controlanalysis,testanalysis);

        measure = 'surfacearea';
        allbiftermfigure2(measure,versus,scale,controlanalysis,testanalysis);

        measure = 'volume';
        allbiftermfigure2(measure,versus,scale,controlanalysis,testanalysis);

    close all;

    versus = 'radialdistance';
    scale  = 'linear';

        measure = 'numbersegments';
        allbiftermfigure2(measure,versus,scale,controlanalysis,testanalysis);

        measure = 'taperrate';
        allbiftermfigure2(measure,versus,scale,controlanalysis,testanalysis);

        measure = 'diameter';
        allbiftermfigure2(measure,versus,scale,controlanalysis,testanalysis);

        measure = 'length';
        allbiftermfigure2(measure,versus,scale,controlanalysis,testanalysis);

        measure = 'surfacearea';
        allbiftermfigure2(measure,versus,scale,controlanalysis,testanalysis);

        measure = 'volume';
        allbiftermfigure2(measure,versus,scale,controlanalysis,testanalysis);

    close all;

    versus = 'diameter';
    scale  = 'linear';

        measure = 'numbersegments';
        allbiftermfigure2(measure,versus,scale,controlanalysis,testanalysis);

        measure = 'taperrate';
        allbiftermfigure2(measure,versus,scale,controlanalysis,testanalysis);

        measure = 'length';
        allbiftermfigure2(measure,versus,scale,controlanalysis,testanalysis);

        measure = 'surfacearea';
        allbiftermfigure2(measure,versus,scale,controlanalysis,testanalysis);

        measure = 'volume';
        allbiftermfigure2(measure,versus,scale,controlanalysis,testanalysis);

    close all;

    versus = 'diameter';
    scale  = 'semilog';

        measure = 'numbersegments';
        allbiftermfigure2(measure,versus,scale,controlanalysis,testanalysis);

        measure = 'taperrate';
        allbiftermfigure2(measure,versus,scale,controlanalysis,testanalysis);

        measure = 'length';
        allbiftermfigure2(measure,versus,scale,controlanalysis,testanalysis);

        measure = 'surfacearea';
        allbiftermfigure2(measure,versus,scale,controlanalysis,testanalysis);

        measure = 'volume';
        allbiftermfigure2(measure,versus,scale,controlanalysis,testanalysis);

    close all;

    versus = 'diameter';
    scale  = 'loglog';

        measure = 'numbersegments';
        allbiftermfigure2(measure,versus,scale,controlanalysis,testanalysis);

        measure = 'taperrate';
        allbiftermfigure2(measure,versus,scale,controlanalysis,testanalysis);

        measure = 'length';
        allbiftermfigure2(measure,versus,scale,controlanalysis,testanalysis);

        measure = 'surfacearea';
        allbiftermfigure2(measure,versus,scale,controlanalysis,testanalysis);

        measure = 'volume';
        allbiftermfigure2(measure,versus,scale,controlanalysis,testanalysis);

    close all;

end
