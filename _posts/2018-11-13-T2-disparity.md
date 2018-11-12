---
layout: task
title: Disparity map calculation
category: lab
lab: 3
task: 2
brief: Calculation of disparity map for pairs of stereo images using calculated intrinsic and extrinsic parameters.
---


## Image rectification and disparity range estimation

As it has been said before - the necessary step for stereo calculations is rectification
of input images. This can be done using [rectifyStereoImages](https://www.mathworks.com/help/vision/ref/rectifystereoimages.html)
function:

{% highlight matlab %}
% read pair of images
I1 = imread('left/left-0000.png');
I2 = imread('right/right-0000.png');

% rectify images using calculated stereo parameters
[J1, J2] = rectifyStereoImages(I1, I2, stereoParams);
{% endhighlight %}

Now you can display mix of left and right images as anaglyph (red-cyan) picture:

{% highlight matlab %}
imtool(cat(3, J1, J2, J2));
{% endhighlight %}

Using imtool you can measure disparity (distance) between points that are close to and 
far from the camera to get the range for disparity.

![]({{site.baseurl}}/public/l3/imtool_1.jpg)

## Calculating disparity map

In Matlab, [disparity](https://www.mathworks.com/help/vision/ref/disparity.html) 
function is used to calculate disparity map from the two rectified images.
There are few parameters to be tuned, mainly the disparity range.
For the default parameters shown below, the result is not very nice (a lot of noise
and wrong measurements).

{% highlight matlab %}
% disparity range
dispRange = [0, 64];
disparityMap = disparity(J1, J2, ...
    'DisparityRange', dispRange, ...
    'BlockSize', 15, ...
    'ContrastThreshold', 0.5, ...
    'UniquenessThreshold', 15 );
	
% show disparity map
figure 
imshow(disparityMap, dispRange);
colormap(gca,jet) 
colorbar
{% endhighlight %}

![]({{site.baseurl}}/public/l3/disparity_1.jpg)

## Calculating 3D points from disparity map

When disparity map is calculated, you can convert it to full 3D coordinates of points.
Based on baseline, focal length and disparity value X, Y and Z is calculated.

{% highlight matlab %}
points3D = reconstructScene(disparityMap, stereoParams);

% expand gray image to three channels (simulate RGB)
J1_col = cat(3, J1, J1, J1);

% Convert to meters and create a pointCloud object
points3D = points3D ./ 1000;
ptCloud = pointCloud(points3D, 'Color', J1_col);

% Create a streaming point cloud viewer
player3D = pcplayer([-3, 3], [-3, 3], [0, 8], 'VerticalAxis', 'y', ...
    'VerticalAxisDir', 'down');

% Visualize the point cloud
view(player3D, ptCloud);
{% endhighlight %}


![]({{site.baseurl}}/public/l3/3d_1.jpg)

## Expected results for good parameters


![]({{site.baseurl}}/public/l3/disparity_2.jpg)
![]({{site.baseurl}}/public/l3/3d_2.jpg)
