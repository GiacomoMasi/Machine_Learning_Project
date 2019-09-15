% bayesian information criterion 
function [bic] = bic(numClass_EM, dimension, likelihood, n)

    k = numClass_EM * (dimension + ((dimension * (dimension + 1)) / 2)) + numClass_EM - 1; %parameters
    bic =- 2*(likelihood) + (k * log(n)); % bic
end