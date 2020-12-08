function [symbols,probability] = char_hist(message)
symbols=[];
probability=[];
n=length(message);
i=1;
while ~isempty(message)
    [mode_char,no_occurrances]=mode(message);
    symbols(i)=mode_char;
    probability(i)=no_occurrances;
    indices=find(message==mode_char);
    message(indices)='';
    i=i+1;
end
probability=probability/n;
end
