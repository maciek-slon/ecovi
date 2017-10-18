---
layout: task
title: Camera calibration
category: lab
lab: 1
task: 1
brief: Calibration of monocular camera in different scenarios.
---

## Camera calibration basics

![]({{site.baseurl}}/public/l1/camera_calib.png)



## Running calibrator app

In Matlab, open the `Apps` tab and select `Camera Calibrator`.

![]({{site.baseurl}}/public/l1/camera_calibrator.png)

Load the calibration images and perform calibration for different combinations
of parameters (2/3 coefficients, skew and tangential distortion). After calibration
analyze the results (reprojection errors) and observe difference between 
original and undistorted pictures. 

Look at the final intrinsic parameters (export camera params) and compare 
results (mainly focal length and image center) for different lens settings.
Work with three data sets:

   * `calib_wide`
   * `cailb_medium`
   * `calib_narrow`

For more detailed information refer to [Matlab documentation](https://www.mathworks.com/help/vision/ug/single-camera-calibrator-app.html).
