---
layout: task
title: Histograms
category: lab
lab: 1
task: 3
brief: Histogram calculation and enhancement
---


## Task details

Load the `histogram\land.png` image. Use the provided script as a starting point in this task:

{% highlight matlab %}
% Load the image
I0=imread('land.png');

% Show image and histogram
figure;
imshow(I0);
figure;
imhist(I0);

% Modify image contrast
I = I0 * 0.5 + 64;

% Show image and histogram
figure;
imshow(I);
figure;
imhist(I);
{% endhighlight %}

Use different methods to enhance (restore) image contrast. Use methods `imadjust`,
`histeq` and `adapthisteq`. For each algorithm observe the histogram and compare
it with the orriginal one.


![]({{site.baseurl}}/public/l1/land.png)

Refer to [Matlab documentation](https://www.mathworks.com/help/images/examples/contrast-enhancement-techniques.html) for more details.
