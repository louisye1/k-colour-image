% This function calculates the means for each cluster.
% Inputs : A 3D array with m rows, n columns, and three planes, containing
%        an RGB image. (Im)
%        : A single value specifying how many clusters there are. (k)
%        : A 2D array with m rows, and n columns specifying which cluster
%        each point belongs to. (Clusters)
% Outputs: A 3D array containing k rows, one column, and three planes
%        containing mean values for each cluster. [Means]
%
% Author: Louis Ye


function [Means] = UpdateMeans(Im, k, Clusters)

Means = zeros(k,1,3);

for i=1:k
    
    % Using logical indexing to extract values in the image that belong to 
    % cluster i. Repeat the index array with 3 layers so that it's
    % compatible.
    ClusterData = Im(repmat(Clusters == i, [1,1,3]));
    
    % Reshape the ClusterData array to have 3 columns containing RGB
    % values respectively.
    ClusterData = reshape(ClusterData,[],3);
    
    % Calculate the means for all the colours in cluster i.
    Means(i,1,:) = mean(ClusterData);
end

end