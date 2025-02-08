function equations = Static_equations(f)
    % remove_p_suffix Removes the 'p' suffix from symbols in a symbolic expression
    % Input:
    %   f - A symbolic expression or an array of expressions
    % Output:
    %   equations - The modified expression(s) with 'p' suffix removed from symbols
    
    % Get all symbols in the expression
    all_symbols = symvar(f);
    
    % Initialize the replacement rules
    replace_rules = [];
    
    % Build replacement rules
    for i = 1:length(all_symbols)
        symbol = char(all_symbols(i)); % Convert the symbol to a string
        if endsWith(symbol, 'p') % Check if the symbol ends with 'p'
            original_symbol = symbol(1:end-1); % Remove the last 'p'
            if ismember(sym(original_symbol), all_symbols) % Ensure the original symbol exists
                % Add a replacement rule: {symbol with 'p', symbol without 'p'}
                replace_rules = [replace_rules; {sym(symbol), sym(original_symbol)}];
            end
        end
    end
    
    % Apply the replacement rules to the input expression
    equations = subs(f, replace_rules(:,1), replace_rules(:,2));
end
