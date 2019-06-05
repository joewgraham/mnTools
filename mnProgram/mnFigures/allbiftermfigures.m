function allbiftermfigures(controlanalysis,testanalysis)

if nargin == 1

    versus = 'branchorder';
    scale  = 'linear';

        measure = 'numbersegments';
        allbiftermfigure(measure,versus,scale,controlanalysis);

        measure = 'taperrate';
        allbiftermfigure(measure,versus,scale,controlanalysis);

        measure = 'taperratio';
        allbiftermfigure(measure,versus,scale,controlanalysis);

        measure = 'proximaldiameter';
        allbiftermfigure(measure,versus,scale,controlanalysis);

        measure = 'cylindricaldiameter';
        allbiftermfigure(measure,versus,scale,controlanalysis);

        measure = 'distaldiameter';
        allbiftermfigure(measure,versus,scale,controlanalysis);

        measure = 'length';
        allbiftermfigure(measure,versus,scale,controlanalysis);

        measure = 'surfacearea';
        allbiftermfigure(measure,versus,scale,controlanalysis);

        measure = 'volume';
        allbiftermfigure(measure,versus,scale,controlanalysis);

        measure = 'totallength';
        allbiftermfigure(measure,versus,scale,controlanalysis);

        measure = 'totalsurfacearea';
        allbiftermfigure(measure,versus,scale,controlanalysis);

        measure = 'totalvolume';
        allbiftermfigure(measure,versus,scale,controlanalysis);

    close all;

    versus = 'pathlength';
    scale  = 'linear';

        measure = 'numbersegments';
        allbiftermfigure(measure,versus,scale,controlanalysis);

        measure = 'taperrate';
        allbiftermfigure(measure,versus,scale,controlanalysis);

        measure = 'diameter';
        allbiftermfigure(measure,versus,scale,controlanalysis);

        measure = 'length';
        allbiftermfigure(measure,versus,scale,controlanalysis);

        measure = 'surfacearea';
        allbiftermfigure(measure,versus,scale,controlanalysis);

        measure = 'volume';
        allbiftermfigure(measure,versus,scale,controlanalysis);

    close all;

    versus = 'radialdistance';
    scale  = 'linear';

        measure = 'numbersegments';
        allbiftermfigure(measure,versus,scale,controlanalysis);

        measure = 'taperrate';
        allbiftermfigure(measure,versus,scale,controlanalysis);

        measure = 'diameter';
        allbiftermfigure(measure,versus,scale,controlanalysis);

        measure = 'length';
        allbiftermfigure(measure,versus,scale,controlanalysis);

        measure = 'surfacearea';
        allbiftermfigure(measure,versus,scale,controlanalysis);

        measure = 'volume';
        allbiftermfigure(measure,versus,scale,controlanalysis);

    close all;

    versus = 'diameter';
    scale  = 'linear';

        measure = 'numbersegments';
        allbiftermfigure(measure,versus,scale,controlanalysis);

        measure = 'taperrate';
        allbiftermfigure(measure,versus,scale,controlanalysis);

        measure = 'length';
        allbiftermfigure(measure,versus,scale,controlanalysis);

        measure = 'surfacearea';
        allbiftermfigure(measure,versus,scale,controlanalysis);

        measure = 'volume';
        allbiftermfigure(measure,versus,scale,controlanalysis);

    close all;

    versus = 'diameter';
    scale  = 'semilog';

        measure = 'numbersegments';
        allbiftermfigure(measure,versus,scale,controlanalysis);

        measure = 'taperrate';
        allbiftermfigure(measure,versus,scale,controlanalysis);

        measure = 'length';
        allbiftermfigure(measure,versus,scale,controlanalysis);

        measure = 'surfacearea';
        allbiftermfigure(measure,versus,scale,controlanalysis);

        measure = 'volume';
        allbiftermfigure(measure,versus,scale,controlanalysis);

    close all;

    versus = 'diameter';
    scale  = 'loglog';

        measure = 'numbersegments';
        allbiftermfigure(measure,versus,scale,controlanalysis);

        measure = 'taperrate';
        allbiftermfigure(measure,versus,scale,controlanalysis);

        measure = 'length';
        allbiftermfigure(measure,versus,scale,controlanalysis);

        measure = 'surfacearea';
        allbiftermfigure(measure,versus,scale,controlanalysis);

        measure = 'volume';
        allbiftermfigure(measure,versus,scale,controlanalysis);

    close all;

end

if nargin == 2

    versus = 'branchorder';
    scale  = 'linear';

        measure = 'numbersegments';
        allbiftermfigure(measure,versus,scale,controlanalysis,testanalysis);

        measure = 'taperrate';
        allbiftermfigure(measure,versus,scale,controlanalysis,testanalysis);

        measure = 'taperratio';
        allbiftermfigure(measure,versus,scale,controlanalysis,testanalysis);

        measure = 'proximaldiameter';
        allbiftermfigure(measure,versus,scale,controlanalysis,testanalysis);

        measure = 'cylindricaldiameter';
        allbiftermfigure(measure,versus,scale,controlanalysis,testanalysis);

        measure = 'distaldiameter';
        allbiftermfigure(measure,versus,scale,controlanalysis,testanalysis);

        measure = 'length';
        allbiftermfigure(measure,versus,scale,controlanalysis,testanalysis);

        measure = 'surfacearea';
        allbiftermfigure(measure,versus,scale,controlanalysis,testanalysis);

        measure = 'volume';
        allbiftermfigure(measure,versus,scale,controlanalysis,testanalysis);

        measure = 'totallength';
        allbiftermfigure(measure,versus,scale,controlanalysis,testanalysis);

        measure = 'totalsurfacearea';
        allbiftermfigure(measure,versus,scale,controlanalysis,testanalysis);

        measure = 'totalvolume';
        allbiftermfigure(measure,versus,scale,controlanalysis,testanalysis);

    close all;

    versus = 'pathlength';
    scale  = 'linear';

        measure = 'numbersegments';
        allbiftermfigure(measure,versus,scale,controlanalysis,testanalysis);

        measure = 'taperrate';
        allbiftermfigure(measure,versus,scale,controlanalysis,testanalysis);

        measure = 'diameter';
        allbiftermfigure(measure,versus,scale,controlanalysis,testanalysis);

        measure = 'length';
        allbiftermfigure(measure,versus,scale,controlanalysis,testanalysis);

        measure = 'surfacearea';
        allbiftermfigure(measure,versus,scale,controlanalysis,testanalysis);

        measure = 'volume';
        allbiftermfigure(measure,versus,scale,controlanalysis,testanalysis);

    close all;

    versus = 'radialdistance';
    scale  = 'linear';

        measure = 'numbersegments';
        allbiftermfigure(measure,versus,scale,controlanalysis,testanalysis);

        measure = 'taperrate';
        allbiftermfigure(measure,versus,scale,controlanalysis,testanalysis);

        measure = 'diameter';
        allbiftermfigure(measure,versus,scale,controlanalysis,testanalysis);

        measure = 'length';
        allbiftermfigure(measure,versus,scale,controlanalysis,testanalysis);

        measure = 'surfacearea';
        allbiftermfigure(measure,versus,scale,controlanalysis,testanalysis);

        measure = 'volume';
        allbiftermfigure(measure,versus,scale,controlanalysis,testanalysis);

    close all;

    versus = 'diameter';
    scale  = 'linear';

        measure = 'numbersegments';
        allbiftermfigure(measure,versus,scale,controlanalysis,testanalysis);

        measure = 'taperrate';
        allbiftermfigure(measure,versus,scale,controlanalysis,testanalysis);

        measure = 'length';
        allbiftermfigure(measure,versus,scale,controlanalysis,testanalysis);

        measure = 'surfacearea';
        allbiftermfigure(measure,versus,scale,controlanalysis,testanalysis);

        measure = 'volume';
        allbiftermfigure(measure,versus,scale,controlanalysis,testanalysis);

    close all;

    versus = 'diameter';
    scale  = 'semilog';

        measure = 'numbersegments';
        allbiftermfigure(measure,versus,scale,controlanalysis,testanalysis);

        measure = 'taperrate';
        allbiftermfigure(measure,versus,scale,controlanalysis,testanalysis);

        measure = 'length';
        allbiftermfigure(measure,versus,scale,controlanalysis,testanalysis);

        measure = 'surfacearea';
        allbiftermfigure(measure,versus,scale,controlanalysis,testanalysis);

        measure = 'volume';
        allbiftermfigure(measure,versus,scale,controlanalysis,testanalysis);

    close all;

    versus = 'diameter';
    scale  = 'loglog';

        measure = 'numbersegments';
        allbiftermfigure(measure,versus,scale,controlanalysis,testanalysis);

        measure = 'taperrate';
        allbiftermfigure(measure,versus,scale,controlanalysis,testanalysis);

        measure = 'length';
        allbiftermfigure(measure,versus,scale,controlanalysis,testanalysis);

        measure = 'surfacearea';
        allbiftermfigure(measure,versus,scale,controlanalysis,testanalysis);

        measure = 'volume';
        allbiftermfigure(measure,versus,scale,controlanalysis,testanalysis);

    close all;

end
