function exportxmldata(mnpop)

currentdirectory = cd;
cd(mnpop.datapathname);

if exist('xml','dir')==7
    cd('xml');
else
    mkdir('xml');
    cd('xml');
end



for mnnum = 1:length(mnpop.mn)

    filename = sprintf('%s_%s_%s%03.0f%s',mnpop.inputfilename,mnpop.datetime,'xml_mn',mnnum,'.xml');
    fid=fopen(filename,'wt');

    fprintf(fid,'%s\n','# Header Information for File');

    fprintf(fid,'%.0f %.0f %.3f %.3f %.3f %.3f %.0f\n',1,1,mnpop.mn(mnnum).xposition,mnpop.mn(mnnum).yposition,mnpop.mn(mnnum).zposition,mnpop.mn(mnnum).somadiameter/2,-1);

    for i = 2:length(mnpop.mn(mnnum).piece)

        fprintf(fid,'%.0f %.0f %.3f %.3f %.3f %.3f %.0f\n',i,3,mnpop.mn(mnnum).piece(i).distalxposition,mnpop.mn(mnnum).piece(i).distalyposition,mnpop.mn(mnnum).piece(i).distalzposition,mnpop.mn(mnnum).piece(i).distaldiameter/2,mnpop.mn(mnnum).piece(i).parent);

    end

    fclose(fid);


end


cd(currentdirectory);



