% function that creates a syntethic dataset given mu and sigma
function [points, classLabel] = dataset_generation(n, numClass, mu, sigma, elements)
    points = []; 
    classLabel = [];
    
    for i=1:numClass
        currentElements = elements(1,i);
%         points
        points = vertcat(points, mvnrnd(mu(i,:),sigma(:,:,i),currentElements));
%         labels
        classLabel = vertcat(classLabel, i*ones(currentElements,1));
    end

end