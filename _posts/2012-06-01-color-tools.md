---
layout: post
title: "Color Tools"
description: ""
category: programming
tags: [r, gui]
---
{% include JB/setup %}

Colors are mysterious business and choosing the right color or color palette 
for an [R](http://www.r-project.org/) graphics can sometimes be a chore. 
To alleviate this burden, I present two functions for choosing color values.

To access these functions install the 
[RSurvey](http://cran.r-project.org/web/packages/RSurvey/) and 
[dichromat](http://cran.r-project.org/web/packages/dichromat/) packages:

{% highlight r %}
install.packages(c("RSurvey", "dichromat"))
library(RSurvey)
{% endhighlight %}

## Choose Color

The first function, *ChooseColor* 
([source](https://github.com/jfisher-usgs/RSurvey/blob/master/R/ChooseColor.R)), 
calls upon a graphical user interface (GUI) for choosing a color in the 
[HSV](http://en.wikipedia.org/wiki/HSL_and_HSV) color space (**fig. 1**).

{% highlight r %}
col <- ChooseColor(col = "#669933")
{% endhighlight %}

<div class="img-centered">
  <img src="/images/2012-06-01/fig1.png" alt="fig1" title="Figure 1"/>
  <div class="caption">
    <h5>Figure 1: A screenshot of the HSV color tool.</h5> 
  </div>
</div>

## Choose Color Palette

The second function, *ChoosePalette* 
([source](https://github.com/jfisher-usgs/RSurvey/blob/master/R/ChoosePalette.R)),
calls upon a GUI for choosing a color palette in the HCL 
(Hue, Chroma, and Luminance) color space (**fig. 2**). 

{% highlight r %}
pal <- ChoosePalette(terrain_hcl)
{% endhighlight %}

<div class="img-centered">
  <img src="/images/2012-06-01/fig2.png" alt="fig2" title="Figure 2"/>
  <div class="caption">
    <h5>Figure 2: A screenshot of the HCL color palette tool.</h5> 
  </div>
</div>

An example graphic accompanies the GUI and may be used to evaluate the 
robustness of individual color schemes (**fig. 3**).

<div class="img-centered">
  <img src="/images/2012-06-01/fig3.png" alt="fig3" title="Figure 3"/>
  <div class="caption">
    <h5>Figure 3: Example graphic based on selected color palette.</h5> 
  </div>
</div>

The *ChoosePalette* function may eventually reside in the **colorspace** 
package.
