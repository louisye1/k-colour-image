% This function assigns each point in an image to a cluster, based on which
% mean that point is closest to.
% Inputs : A 3D array with m rows, n columns, and three planes, containing
%        an RGB image. (Im)
%        : A 3D array containing k rows, one column, and three planes
%        containing the colour information for each k means. (Means)
% Outputs: A 2D array with m rows, and n columns, that contains the
%        corresponding cluster number for each point in the image.
%        I.e. the value in row 1 column 1 of the output will identify the
%        cluster for the pixel in row 1 column 1 of the image. [Clusters]
%
% Author: Louis Ye


function [Clusters] = AssignToClusters(Im, Means)

% Get the size of the image, and number of clusters.
[m,n,~] = size(Im);

% Reshaping the image array to have all the colour values in one row
Im = reshape(Im, 1, [], 3);

% Calculate the distances from all pixels to each mean value
D = (Im(1,:,1) - Means(:,:,1)).^2 + ...
    (Im(1,:,2) - Means(:,:,2)).^2 + ...
    (Im(1,:,3) - Means(:,:,3)).^2;

% Find the minimum of the values across the planes.
[~,Clusters] = min(D,[],1);

% Reshape the cluster array back to 2D
Clusters = reshape(Clusters, m, n);

end