function parameters = Get_para(sympara)
    parameters = struct();
    for i = 1: length(sympara)
        paraname = char(sympara(i));
        paravalue = evalin('base',paraname);
        parameters.(paraname) = paravalue;
    end
end

