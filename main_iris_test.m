clear all;
close all;
clc;

load iris_dataset.MAT

irisInputs = irisInputs';


irisTargets_tmp = irisTargets';


n = size(irisInputs,1);
dimension = size(irisInputs,2);
irisTargets = zeros(n,1);

for i=1:n
   [v,in] = max(irisTargets_tmp(i,:));
   irisTargets(i) = in;
end

% ------ initialize variable for EM computing ------
    classLabel_tmp = zeros(n, 1);
    numClass_EM = 3;
    iter_array(1, numClass_EM) = numClass_EM;
    [EM_parameters] = set_EM_parameters(numClass_EM, dimension, n, irisInputs);


    [EM_parameters, points_probability, likelihood] = EM_algorithm(EM_parameters, n, irisInputs, numClass_EM, dimension);

%  get results 
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
count_class