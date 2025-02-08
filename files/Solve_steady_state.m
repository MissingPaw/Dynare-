function [solutionStruct, exitflag, output] = Solve_steady_state(initval, parameters, initval_struct, options)
    [solution, fval, exitflag, output] = fsolve(@(y) steady_state(y, parameters), initval, options);

    variableNames = fieldnames(initval_struct);


    if exitflag > 0
        solutionStruct = struct();
        for idx = 1:length(solution)
            solutionStruct.(variableNames{idx}) = solution(idx);
        end
        
        disp('Solution found with variable names:');
        for idx = 1:length(variableNames)
            fprintf('%s = %.8f\n', variableNames{idx}, solutionStruct.(variableNames{idx}));
        end
    else
        solutionStruct = [];
        disp('The solver did not converge to a solution.');
        disp(output);
    end
end
