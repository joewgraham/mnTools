function [somadata, swcdata] = hd5reader(dirname, mname)
    %javaaddpath({'/opt/BBP-SDK/trunk/lib/libbbp_sdk_java.jar'});
    import bbp.*;
    reader = Morphology_Reader;
    myMorphs = Morphologies;
    mt = bbp.Morphology_Target;
    mt.insert(mname);
    reader.open(dirname);
    reader.read(myMorphs, mt);
    iter = myMorphs.begin;
    morphology = iter.value;
    swcdata = process_morphology(morphology);
    cur_soma = 0;
    soma = morphology.soma;
    soma_iter = soma.begin;
    while soma_iter.not_equals(soma.end)
        cur_soma = cur_soma + 1;
        x = soma_iter.value.x;
        y = soma_iter.value.y;
        z = soma_iter.value.z;
        somadata(cur_soma,:) = [x y z];
        soma_iter.next;
    end 
end

function swcdata = process_morphology(morphology)
    soma = morphology.soma;
    soma_children = soma.children;
    sections_iter = soma_children.begin;
    %cur_id = 1;
    cur_id = 2;
    swcdata(1,1) = 1;
    swcdata(1,2) = 1;
    swcdata(1,3:5) = [0 0 0];
    swcdata(1,6) = 0;
    swcdata(1,7) = -1;
    while sections_iter.not_equals(soma_children.end);
        %cur_id = process_section(sections_iter.value, 0, cur_id);
        [cur_id,swcdata] = process_section(sections_iter.value,1,cur_id,swcdata);
        sections_iter.next;
    end
end

function [next_val,swcdata] = process_section (section,parent_id,first_id,swcdata)
    %sections_iter.value.type.equals(bbp.Section_Type.AXON)
    %disp(section.type)
    if section.type.equals(bbp.Section_Type.AXON) == 1
        type = 2;
    elseif section.type.equals(bbp.Section_Type.DENDRITE) == 1
        type = 3;
    elseif section.type.equals(bbp.Section_Type.APICAL_DENDRITE) == 1
        type = 4;
    else
        disp('     Error: unknown piece type in ''hd5reader.m''.');
        keyboard;
    end            
    prev_id = parent_id;
    cur_id = first_id;
    segments = section.segments;
    segments_iter = segments.begin;
    x = segments_iter.value.begin.center.x;
    y = segments_iter.value.begin.center.y;
    z = segments_iter.value.begin.center.z;
    r = segments_iter.value.begin.radius;
    %disp(sprintf('new id %d child of %d at %f, %f, %f, %f', cur_id, prev_id,x,y,z,r));
    swcdata(cur_id,1) = cur_id;
    swcdata(cur_id,2) = type;
    swcdata(cur_id,3:5) = [x y z];
    swcdata(cur_id,6) = r;
    swcdata(cur_id,7) = prev_id;
    prev_id = cur_id;
    cur_id = cur_id + 1;
    while segments_iter.not_equals(segments.end);
        x = segments_iter.value.end.center.x;
        y = segments_iter.value.end.center.y;
        z = segments_iter.value.end.center.z;
        r = segments_iter.value.end.radius;
        %disp(sprintf('new id %d child of %d at %f, %f, %f, %f', cur_id, prev_id,x,y,z,r));
        swcdata(cur_id,1) = cur_id;
        swcdata(cur_id,2) = type;
        swcdata(cur_id,3:5) = [x y z];
        swcdata(cur_id,6) = r;
        swcdata(cur_id,7) = prev_id;
        prev_id = cur_id;
        cur_id = cur_id + 1;
        segments_iter.next;
    end
    new_parent_id = prev_id;
    
    children = section.children;
    sections_iter = children.begin;
    while sections_iter.not_equals(children.end);
        [cur_id,swcdata] = process_section(sections_iter.value,new_parent_id,cur_id,swcdata);
        sections_iter.next;
    end
    next_val = cur_id;
end
