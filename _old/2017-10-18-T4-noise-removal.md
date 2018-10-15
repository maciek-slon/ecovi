---
layout: task
title: Image filtering
category: lab
lab: 1
task: 4
brief: Noise removal from the images
---


## Task details

Load the pictures from the `gain` folder. Those were acquired with different
camera gain parameter set - the bigger the gain, the more the noise on the picture.

Load the pictures to Matlab and convert them to grayscale (using `imread` and 
`rgb2gray` functions). For images with high gain set analyze different noise removal 
techniques: averaging filters (with different kernels), median and adaptive filters.

Observe the results and choose the best filter for this task.

![]({{site.baseurl}}/public/l1/no_noise.png)
![]({{site.baseurl}}/public/l1/noise.png)

Refer to [Matlab documentation](https://www.mathworks.com/help/images/noise-removal.html) for more details.
