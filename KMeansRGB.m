% This function partitions the points in an image into k clusters, using
% the k-means algorithm to do so.
% Inputs : A 3D array with m rows, n columns, and three planes, containing
%        an RGB image. (Im)
%        : A 3D array containing k rows, one column, and three planes
%        containing mean values for each cluster. (SeedMeans)
%        : The maximum number of iterations to perform. (MaxIter)
% Outputs: A 2D array with m rows, and n columns specifying which cluster
%        each point belongs to. [Clusters]
%        : A 3D array containing k rows, one column, and three planes where
%        each row contains the mean colour values for the cluster
%        corresponding to that row number. [Means]
%
% Author: Louis Ye

function [Clusters,Means] = KMeansRGB(Im,SeedMeans,MaxIter)

% Get k value.
k = size(SeedMeans,1);

% Set the initial means.
Means = SeedMeans;

% Continue to loop and update means until the newest mean is equal to the
% previous mean.
for i = 1:MaxIter
    
    % Set previous means to equal to current means.
    PrevMeans = Means;
    
    Clusters = AssignToClusters(Im, Means);
    Means = UpdateMeans(Im, k, Clusters);
    disp(i)
    
    % If previous mean is equal to current mean, return from the function.
    if PrevMeans == Means
        return
    end
end

warning(['Failed to converge in ' num2str(MaxIter) ' iterations.'])

end