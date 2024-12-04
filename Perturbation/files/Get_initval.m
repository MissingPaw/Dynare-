function [initialGuess,initval] = Get_initval(symvar)
    initval = struct();
    for i = 1: length(symvar)
        varname = char(symvar(i));
        varvalue = evalin('base',varname);
        initval.(varname) = varvalue;
    end
    fieldNames = fieldnames(initval); 
    initialGuess = zeros(length(fieldNames), 1); 
    
    for i = 1:length(fieldNames)
        fieldName = fieldNames{i}; 
        initialGuess(i) = initval.(fieldName); 
    end
end
