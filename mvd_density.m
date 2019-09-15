% compute the pdf of points given mu and sigma
function [probability] = mvd_density(point, mu, sigma)
    
    probability = mvnpdf(point, mu, sigma);
    
end