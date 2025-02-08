function Construct_equations(symvar, sympara, eqns)
    % Create the function string dynamically
    func_name = 'steady_state';
    func_str = sprintf('function F = %s(x, p)\n', func_name);
    
    % Decompose variables based on the order in symvar
    for i = 1:length(symvar)
        varname = char(symvar(i));  % Get the variable name
        func_str = sprintf('%s    %s = x(%d);\n', func_str, varname, i);  % Assign variable from y
    end
    
    % Create the equation assignments dynamically
    func_str = sprintf('%s\n', func_str);  % Add an empty line
    for i = 1:length(eqns)
        eqn_str = char(eqns(i));  % Get the equation
        % Replace the parameters with p.param_name in the equation string
        for j = 1:length(sympara)
            param_name = char(sympara(j)); 
            % Use regular expressions to replace parameters surrounded by operators or spaces
            eqn_str = regexprep(eqn_str, ...
                ['(?<=\W|^)' param_name '(?=\W|$)'], sprintf('p.%s', param_name)); 
        end
        func_str = sprintf('%s    F(%d) = %s;\n', func_str, i, eqn_str);  % Assign equation to F(i)
    end
    
    % Add the final line to return the equation vector
    func_str = sprintf('%s\n    F = F(:);\nend', func_str);
    
    % Write the function to a file
    fid = fopen(['files/' func_name '.m'], 'w');
    fprintf(fid, '%s', func_str);
    fclose(fid);
    disp(['Function written to ' func_name '.m']);
end