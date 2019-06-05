function mnanalyzer_indpop(mnpop)

[helppath,addpaths] = fileparts(which('mnaddpaths.m'));
cd(helppath);
cd ..
mnhome = cd;
mnoptions;

disp(' ');
disp('  ------------------------------------');
disp('   Ind to Pop analysis started.');
disp('  ------------------------------------');

fieldstoremove{1} = 'mn';
fieldstoremove{2} = 'importfilename';
fieldstoremove{3} = 'inputfilename';

for i = 1:length(mnpop.mn)
    
    clear indmnpop;
    clear popmnpop;
    
    
    [path,indname,ext] = fileparts(fullfile(mnpop.importpathname,mnpop.mn(i).filename));
    indname = indname(indname~='-');
    indmnpop = rmfield(mnpop,'mn');
    indmnpop.inputfilename = indname;
    indmnpop.numbercells = 1;
    indmnpop.mn = mnpop.mn(i);
    indmnpop.mn.id = 1;
    if isfield(indmnpop.mn,'axon')
        for o = 1:length(indmnpop.mn.axon)
            indmnpop.mn.axon(o).motoneuron = 1;
        end
    end
    if isfield(indmnpop.mn,'dendrite')
        for p = 1:length(indmnpop.mn.dendrite)
            indmnpop.mn.dendrite(p).motoneuron = 1;
        end
    end
    if isfield(indmnpop.mn,'apical')
        for q = 1:length(indmnpop.mn.apical)
            indmnpop.mn.apical(q).motoneuron = 1;
        end
    end
    mnanalyzer(indmnpop);
    
    popmnpop = rmfield(mnpop,fieldstoremove);
    popmnpop.numbercells = popmnpop.numbercells - 1;
    popmnpop.inputfilename = [mnpop.inputfilename num2str(i,'%02d')];
    mncount = 0;
    for j = 1:length(mnpop.mn)
        if j ~= i
            mncount = mncount + 1;
            popmnpop.importfilename{mncount} = mnpop.importfilename(j);
            popmnpop.mn(mncount) = mnpop.mn(j);
            popmnpop.mn(mncount).id = mncount;
            if isfield(popmnpop.mn(mncount),'axon')
                for k = 1:length(popmnpop.mn(mncount).axon)
                    popmnpop.mn(mncount).axon(k).motoneuron = mncount;
                end
            end
            if isfield(popmnpop.mn(mncount),'dendrite')
                for m = 1:length(popmnpop.mn(mncount).dendrite)
                    popmnpop.mn(mncount).dendrite(m).motoneuron = mncount;
                end
            end
            if isfield(popmnpop.mn(mncount),'apical')
                for n = 1:length(popmnpop.mn(mncount).apical)
                    popmnpop.mn(mncount).apical(n).motoneuron = mncount;
                end
            end
        end
    end
    mnanalyzer(popmnpop);
    
    eval(['mnfigures(' popmnpop.inputfilename '_analysis,' indmnpop.inputfilename '_analysis);']);
    
    eval(['clear ' indmnpop.inputfilename '_mnpop;']);
    eval(['clear ' indmnpop.inputfilename '_analysis;']);
    eval(['clear ' indmnpop.inputfilename '_data;']);
    eval(['clear ' popmnpop.inputfilename '_mnpop;']);
    eval(['clear ' popmnpop.inputfilename '_analysis;']);
    eval(['clear ' popmnpop.inputfilename '_data;']);
    
end

disp('  ------------------------------------');
disp('   Ind to Pop analysis completed.');
disp('  ------------------------------------');

