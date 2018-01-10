%% RGB-D and Point Cloud representation
% Load the input file.

load('object3d.mat')
%% 
% Display RGB part of the pointcloud
%%
figure
imshow(ptCloud.Color);
%% 
% Display depth part of the pointcloud (and set colormap to better visualize 
% result)
%%
figure
imshow(ptCloud.Location(:,:,1), [0, 1.1]);
colormap(gca,jet);
colorbar;
%% 
% Display 3D color pointcloud
%%
figure;
pcshow(ptCloud);