---
layout: task
title: Region labelling
category: lab
lab: 1
task: 3
brief: Homogeneous region detection
---

## Task preparation

Open the Color Thresholder App and load the [baloons.png]({{site.baseurl}}/public/l2/baloons.png) image. Select either HSV or RGB color space. 
Using sliders on the right side of the window (setting R, G, B or H, S, V ranges) create a mask, that filters only a single baloon.

![]({{site.baseurl}}/public/l2/color_thr.png)

## Homogeneous region detection

Your task is to implement simple region growing segmentation of color objects. Use the same baloons picture and [getpts](https://www.mathworks.com/help/images/ref/getpts.html) to select
starting point of the segmentation. After selecting the starting point, grow the region by adding surrounding pixels as long as they are similar to those already inside the region.
Select proper thresholds, so that the selected baloon is well segmented, without too much noise on the edges. Work in either RGB or HSV color space.

![]({{site.baseurl}}/public/l2/baloons_thr.jpg)

## Hints 

You can make some preprocessing of the image if you need, like blurring to get rid of initial grain/noise. 

