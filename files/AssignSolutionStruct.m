function AssignSolutionStruct(solutionStruct)
    % AssignSolutionStruct Assigns fields from a struct to variables in the base workspace
    % Input:
    %   solutionStruct - A struct containing steady-state values with variable names as fields
    
    fieldNames = fieldnames(solutionStruct);
    

    for i = 1:length(fieldNames)
        varName = fieldNames{i};
        varValue = solutionStruct.(varName);
        assignin('base', varName, varValue);
    end
end
