% This function creates a k-colour image for an image that has had its
% pixels divided into k-clusters. All pixels in a given cluster will be
% recoloured using the mean colour values for that cluster.
% Inputs : A 2D array with m rows, and n columns, specifying which cluster
%        each pixel belongs to. (Clusters)
%        : A 3D array containing k rows, one column, and three planes, where
%        each row contains the mean colour values for the cluster
%        corresponding to that row number. (Means)
% Outputs: A 3D array of unsigned 8-bit integers with m rows, n columns,
%        and three planes. (Image)
%
% Author: Louis Ye


function [Image] = CreateKColourImage(Clusters, Means)

% Get size of the clusters (which is equal to size of image).
[m,n] = size(Clusters);

% Create an array of corresponding mean colour values.
Image = Means(Clusters,1,:);

% Reshape to image size
Image = reshape(Image,[m,n,3]);

% Round RGB values and convert into unsigned 8-bit integer type.
Image = uint8(round(Image));

end