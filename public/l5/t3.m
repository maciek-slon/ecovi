%% Detect Sphere from Point Cloud
% Load the point cloud.

load('object3d.mat')
%% 
% Display and label the point cloud.
%%
figure
pcshow(ptCloud)
xlabel('X(m)')
ylabel('Y(m)')
zlabel('Z(m)')
title('Original Point Cloud')
%% 
% Set a maximum point-to-sphere distance of 1cm for sphere fitting.
%%
maxDistance = 0.01;
%% 
% Set the roi to constrain the search.
%%
roi = [-inf,0.6,0.2,0.5,0.1,inf];
sampleIndices = findPointsInROI(ptCloud,roi);
%% 
% Detect the sphere, a globe, and extract it from the point cloud.
%%
[model,inlierIndices] = pcfitsphere(ptCloud,maxDistance,...
            'SampleIndices',sampleIndices);
globe = select(ptCloud,inlierIndices);
%% 
% Plot the globe.
%%
hold on
plot(model)

figure
pcshow(globe)
title('Globe Point Cloud')