clear all;
close all;
clc;

dimension=2;

% ------ create and plot data set ------

n = 200; % number of total points
alpha = [ 0.5, 0.2, 0.2, 0.1]; % probability of points to belong from classes
numClass = 4; % total number of classes
mu = [ 1 1 ; 3 3; 1 6; 6 1 ];


sigma = zeros(2,2,numClass); %covariance

sigma(:,:,1) = 0.2 * eye(2,2);
sigma(:,:,2) = 0.2 * eye(2,2);
sigma(:,:,3) = 0.2 * eye(2,2);
sigma(:,:,4) = 0.2 * eye(2,2);


elements = mnrnd(n,alpha); % number of points for each class

[points, classLabel] = dataset_generation(n, numClass, mu, sigma, elements);




% Plot data
figure()
hold on
title(strcat('Plot Dataset'));
xlabel('X coordinate');
ylabel('Y coordinate');
scatter(points(:,1),points(:,2),25, classLabel);
scatter(mu(:,1),mu(:,2),50,'rX');

% ------ initialize variable for EM computing ------
    classLabel_tmp = zeros(n, 1);
    numClass_EM = 4;
    iter_array(1, numClass_EM) = numClass_EM;
    [EM_parameters] = set_EM_parameters(numClass_EM, dimension, n, points);
    EM_parameters.mu = [2 5; 6 2; 4 4; 1 3];
%     EM

    [EM_parameters, points_probability, likelihood] = EM_algorithm(EM_parameters, n, points, numClass_EM, dimension);
 

    for i=1:n
        [val, idx] = max(points_probability(i,:));
        classLabel_tmp(i) = idx;
    end

figure()
hold on
title(strcat('Plot Results'));
xlabel('X coordinate');
ylabel('Y coordinate');
% scatter(points(:,1),points(:,2),25, classLabel_tmp);
scatter(points(:,1),points(:,2),25, classLabel_tmp);
scatter(EM_parameters.mu(:,1),EM_parameters.mu(:,2),50,'rX');


count_class = zeros(1, numClass);
for i=1:numClass_EM
    for j=1:n
        if classLabel_tmp(j) == i
            count_class(1,i) = count_class(1,i) + 1;
        end
        
    end
end
count_class

