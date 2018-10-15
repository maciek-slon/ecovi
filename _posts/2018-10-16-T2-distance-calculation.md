---
layout: task
title: Camera geometry
category: lab
lab: 1
task: 2
brief: Measuring distance to known objects using camera intrinsics
---

## Important intrinsic equations

$$ u = f_x \cdot \frac{x}{z} + c_x $$

$$ v = f_y \cdot \frac{y}{z} + c_y $$

## Camera calibration

Calibrate the camera using [calibrate_stereo_1\left](https://drive.google.com/open?id=1J_fPjy3ZiWnNdiqVBxsBohoY2sX2ApfX) images.

## Task details

Use camera intrinsic parameters to calculate distance to test object,
which is depicted on images in folder [distance](https://drive.google.com/open?id=1SToCvzY2BAOFOg8LsMy8YPPTkZ3T2Djs) (4 images). 
Original size of the object is 67,5mm. 

![]({{site.baseurl}}/public/l1/circ_2.png)

To measure pixel size of the object use `imtool` (available also as `Image viewer` in `Apps`.
