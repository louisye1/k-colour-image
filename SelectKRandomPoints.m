% This function generates a list of k randomly selected points from an
% image. Each point is unique.
% Inputs : A 3D image array from which to select points from. (Im)
%        : The number of points to randomly select. (k)
% Outputs: A 2D array containing k rows, and two columns, representing the
%        randomly selected points. [Points]
%
% Author: Louis Ye


function [Points] = SelectKRandomPoints(Im, k)

% Get the size of the image.
[m,n,~] = size(Im);

% Generate k amount of unique random numbers from 1 to the max number of
% indices (i.e. m*n); convert indices into equivalent row and
% column subscripts; have their values returned into arrays x and y.
[x,y] = ind2sub([m,n], randperm(m*n, k));

% Rearrange x and y from row vectors into an array of k rows and 2
% columns.
Points = [x;y]';

end