equations = Static_equations(f);
[initval,initval_struct] = Get_initval(symvara);
parameters = Get_para(sympara);
% Construct a system of equations
Construct_equations(symvara, sympara,equations);


% Solve Steady State
options = optimoptions('fsolve', 'Display', 'iter', 'TolFun', 1e-15, 'TolX', 1e-15);
[solutionStruct, exitflag, output] = Solve_steady_state(initval, parameters, initval_struct, options);
AssignSolutionStruct(solutionStruct);