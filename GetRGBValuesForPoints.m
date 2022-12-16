% This function returns the RGB colour values for a list of specified
% points from an image.
% Inputs : A 3D image array from which to get RGB values from. (Im)
%        : A 2D array of k rows, and two columns, representing the specified
%          points. (Points)
% Outputs: A 3D array containing k rows, one column, and three planes,
%        representing a list of k points from an image (each row
%        corresponds to the colour information for a particular pixel from
%        the image). [SeedMeans]
%
% Author: Louis Ye


function [SeedMeans] = GetRGBValuesForPoints(Im, Points)

% Get number of clusters.
k = size(Points,1);

% Preallocate array for speed.
SeedMeans = zeros(k,1,3);

% For each point;
for i=1:k
    
    % Return the RGB values for the point
    SeedMeans(i,1,:) = Im(Points(i,1),Points(i,2),:);
    
    end
end