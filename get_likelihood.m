% function that given a points, mu, alpha and sigma computes the likelihood

function [likelihood] = get_likelihood(points_tmp, n, numClass, alpha, mu, sigma)
    
    likelihood = 0;

    for i=1:n
        likelihood_tmp = 0;
        
        for k=1:numClass
            % applying the log to both members, the product becames a sum
            q = log(alpha(1,k)) + log(mvd_density(points_tmp(i,:), mu(k,:),sigma(:,:,k)));
            q = exp(q);
            likelihood_tmp = likelihood_tmp + q;            
        end
        
        likelihood = likelihood + log(likelihood_tmp);
        
    end
end