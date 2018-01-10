---
layout: task
title: Detect Sphere from Point Cloud
category: lab
lab: 5
task: 3
brief: Detect sphere in point cloud using RANSAC algorithm
---

## Live demo

Load the point cloud.

{% highlight matlab %}
load('object3d.mat')
{% endhighlight %}

Display and label the point cloud.

{% highlight matlab %}
figure
pcshow(ptCloud)
xlabel('X(m)')
ylabel('Y(m)')
zlabel('Z(m)')
title('Original Point Cloud')
{% endhighlight %}


![]({{site.baseurl}}/public/l5/t3_1.png)

Set a maximum point-to-sphere distance of 1cm for sphere fitting.

{% highlight matlab %}
maxDistance = 0.01;
{% endhighlight %}

Set the roi to constrain the search.

{% highlight matlab %}
roi = [-inf,0.6,0.2,0.5,0.1,inf];
sampleIndices = findPointsInROI(ptCloud,roi);
{% endhighlight %}

Detect the sphere, a globe, and extract it from the point cloud.

{% highlight matlab %}
[model,inlierIndices] = pcfitsphere(ptCloud,maxDistance,...
            'SampleIndices',sampleIndices);
globe = select(ptCloud,inlierIndices);
{% endhighlight %}

Plot the globe.

{% highlight matlab %}
hold on
plot(model)
{% endhighlight %}

![]({{site.baseurl}}/public/l5/t3_2.png)

{% highlight matlab %}
figure
pcshow(globe)
title('Globe Point Cloud')
{% endhighlight %}

![]({{site.baseurl}}/public/l5/t3_3.png)

Get the Matlab script [`t3.m`]({{site.baseurl}}/public/l5/t3.m) or live script [`t3.mlx`]({{site.baseurl}}/public/l5/t3.mlx)
