% given the probability of each point to belong to each class, recomputed
% the alpha, mu and sigma

function [EM_parameters] = M_step(n, numClass, points_probability, points_tmp, EM_parameters, dimension)

alpha = EM_parameters.alpha;
mu = EM_parameters.mu;
sigma = EM_parameters.sigma;

for k=1:numClass
    % re-calculate alpha
    % sum total probability for each class and divide by n (normalize prob
    % between 0 and 1)
    alpha(1,k) = sum(points_probability(:,k)) / n;
    
    % re-calculate mu
    % to recalculate each mu, sum the probability of each point to belong
    % to each class multuply for the same point.
    % at the end divide that quantity by the total probability of each
    % class
    tmp = 0;
    for i=1:n
        tmp = tmp + (points_probability(i,k) * points_tmp(i,:));
    end
    mu(k,:) = tmp / sum(points_probability(:,k));
        
%     % re-calculate sigma
    summ = eye(dimension) * (1e-8);

    for i=1:n
        diff_temp = points_tmp(i,:) - mu(k,:);
        summ = summ + points_probability(i,k) *(diff_temp .* diff_temp');
        
    end  
    EM_parameters.sigma(:,:,k) = summ / sum(points_probability(:,k));
    
end


EM_parameters.alpha = alpha;
EM_parameters.mu = mu;
end
