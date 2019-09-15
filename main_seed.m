clear all;
close all;
clc;


load seed_dataset.mat

n = size(seedInputs,1);
dimension = size(seedInputs,2);


num_iter = 8;
bic_elements = zeros(1,num_iter);

iter_array = zeros(1, num_iter);


% ------ initialize variable for EM computing ------
for numClass_EM=1:num_iter
    numClass_EM
    classLabel_tmp = zeros(n, 1);

    iter_array(1, numClass_EM) = numClass_EM;
    [EM_parameters] = set_EM_parameters(numClass_EM, dimension, n, seedInputs);


    [EM_parameters, points_probability, likelihood] = EM_algorithm(EM_parameters, n, seedInputs, numClass_EM, dimension);
    bic_elements(1,numClass_EM) = bic(numClass_EM, dimension, likelihood, n);


    for i=1:n
        [val, idx] = max(points_probability(i,:));
        classLabel_tmp(i) = idx;
    end
end


figure();
hold on
title(strcat('BIC - Components'));
xlabel('N° Components');
ylabel('BIC');
plot(iter_array, bic_elements, '-b o','MarkerEdgeColor','red');


[val, i] = min(bic_elements);
numClass_EM = i;
[EM_parameters] = set_EM_parameters(numClass_EM, dimension, n, seedInputs);
[EM_parameters, points_probability, likelihood] = EM_algorithm(EM_parameters, n, seedInputs, numClass_EM, dimension);

for i=1:n
        [val, idx] = max(points_probability(i,:));
        classLabel_tmp(i) = idx;
end

count_class = zeros(1, numClass_EM);
for i=1:numClass_EM
    for j=1:n
        if classLabel_tmp(j) == i
            count_class(1,i) = count_class(1,i) + 1;
        end
        
    end
end

[v,min_bic]=min(bic_elements);

min_bic
count_class

