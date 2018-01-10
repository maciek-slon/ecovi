---
layout: task
title: RGB-D and Point Cloud representation
category: lab
lab: 5
task: 1
brief: RGB-D and Point Cloud representation
---

## Live demo

Load the input file ([`object3d.mat`]({{site.baseurl}}/public/l5/object3d.mat)).
{% highlight matlab %}
load('object3d.mat')
{% endhighlight %}

Display RGB part of the point cloud
{% highlight matlab %}
figure
imshow(ptCloud.Color);
{% endhighlight %}

![]({{site.baseurl}}/public/l5/t1_1.png)

Display depth part of the point cloud (and set `colormap` to better visualize result)

{% highlight matlab %}
figure
imshow(ptCloud.Location(:,:,1), [0, 1.1]);
colormap(gca,jet);
colorbar;
{% endhighlight %}

![]({{site.baseurl}}/public/l5/t1_2.png)

Display 3D color pointcloud

{% highlight matlab %}
figure;
pcshow(ptCloud);
{% endhighlight %}

![]({{site.baseurl}}/public/l5/t1_3.png)

Get the Matlab script [`t1.m`]({{site.baseurl}}/public/l5/t1.m) or live script [`t1.mlx`]({{site.baseurl}}/public/l5/t1.mlx)
