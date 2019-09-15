% function that performs the EM algorithm given the parameters prior, mu,
% sigma
function [EM_parameters, points_probability, new_likelihood] = EM_algorithm(EM_parameters, n, points, numClass_EM, dimension)
    
    likelihood_threshold = 1e-4;
    old_likelihood = 0;
    points_probability = zeros(n, numClass_EM);

    count = 0;
    %initial likelihood
    new_likelihood = get_likelihood(points, n, numClass_EM, EM_parameters.alpha, EM_parameters.mu, EM_parameters.sigma);

    while ((new_likelihood - old_likelihood > likelihood_threshold) || (count < 5))
        
        old_likelihood = new_likelihood;
        % E step
        [points_probability] = E_step(n, numClass_EM, points,EM_parameters, points_probability);
        % M step
        [EM_parameters] = M_step(n, numClass_EM, points_probability, points, EM_parameters, dimension);
        % recompute likelihood
        new_likelihood = get_likelihood(points, n, numClass_EM, EM_parameters.alpha, EM_parameters.mu, EM_parameters.sigma);
        count = count+1;
    end
    
end