% This script takes an image and recreates it using k amount of colours.
% Author: Louis Ye

clear
clc

% Prompt user to input graphics file, and read image.
file_name = input('Image: ','s');
Im = imread(file_name);

% Prompt user to input number of colours, and maximum number of iterations.
k = input('k: ');
MaxIter = 100; %input('Max Iterations: ');

% Show original image.
% figure(1)
% imshow(Im)
% title(file_name);

% Convert image to type double so that it can be used in calculations.
Im = double(Im);

% Select k points at random.
[Points] = SelectKRandomPoints(Im,k);

% Use the selected points to get the colour values for our seed means
SeedMeans = GetRGBValuesForPoints(Im,Points);

% Use k means clustering to segment all pixels in the image into one of k
% clusters, and calculate the corresponding mean values.
[Clusters, Means] = KMeansRGB(Im,SeedMeans,MaxIter);

% Convert the cluster data into an image, using the corresponding colour
% for each cluster i.e. the mean colour for that cluster.
[Image] = CreateKColourImage(Clusters,Means);

% Show the resulting k colour image, and write image to graphics file.
figure(2)
imshow(Image);
title([num2str(k) ' colour ' file_name])
imwrite(Image,[ num2str(k) ' colour' file_name]);

