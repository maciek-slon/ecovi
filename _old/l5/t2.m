%% Detect Multiple Planes from Point Cloud
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
% Set the maximum point-to-plane distance (2cm) for plane fitting.
%%
maxDistance = 0.02;
%% 
% Set the normal vector of the plane.
%%
referenceVector = [0,0,1];
%% 
% Set the maximum angular distance to 5 degrees.
%%
maxAngularDistance = 5;
%% 
% Detect the first plane, the table, and extract it from the point cloud.
%%
[model1,inlierIndices,outlierIndices] = pcfitplane(ptCloud,...
            maxDistance,referenceVector,maxAngularDistance);
plane1 = select(ptCloud,inlierIndices);
remainPtCloud = select(ptCloud,outlierIndices);
%% 
% Show model of the detected plane (i.e. perfect plane).
%%
hold on;
plot(model1);
%% 
% Plot the points detected as a plane and the remaining points.
%%
figure
pcshow(plane1)
title('First Plane')
figure
pcshow(remainPtCloud)
title('Remaining Point Cloud')