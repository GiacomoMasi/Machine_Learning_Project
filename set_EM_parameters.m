function [EM_parameters] = set_EM_parameters(numClass_EM, dimension, n, points)


    % struct containing the final results
    
    EM_parameters = struct('alpha', [], 'mu', [], 'sigma', []);
    % initialize variables of EM_parameters with "random" values
    
    EM_parameters.alpha = ones(1, numClass_EM) * 0.5;
    
    sigma = ones(dimension,dimension,numClass_EM); %covariance
    
    % mu 
    for i=1:numClass_EM
        r=randi(n);
        EM_parameters.mu(i,:)=points(r,:);
    end

    diagonal_elements = ones(1, dimension);
    
    for i=1:numClass_EM
        sigma(:,:,i) = diag(diagonal_elements);
    end
    
    
    EM_parameters.sigma = sigma;

end
