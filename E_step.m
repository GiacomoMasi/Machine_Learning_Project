% function that returns the probability of each point to belong to each
% class

function [points_probability] = E_step(n, numClass, points_tmp,EM_parameters, points_probability)
    
    alpha = EM_parameters.alpha;
    mu = EM_parameters.mu;
    sigma = EM_parameters.sigma;
    points_probability = zeros(n,numClass);
    
    for i=1:n
        
        probability_tmp = zeros(numClass,1);
        total_probability = 0;
       
        % for each point, calculate the probability to belong to each
        % class and multiply it for the prior prob
       for k=1:numClass
           probability_tmp(k,1) = alpha(1,k) * mvd_density(points_tmp(i,:), mu(k,:),sigma(:,:,k));
           total_probability = total_probability + probability_tmp(k,1);
       end
       
       % update probabilities
       for k=1:numClass
           points_probability(i,k) = probability_tmp(k,1) / total_probability;
          
       end
    end
end
