---
layout: post
title: "Blog with Knitr and Jekyll"
description: ""
category: lessons
tags: [knitr, jekyll, tutorial]
---
{% include JB/setup %}

Notes on creating a [Jekyll-Bootstrap](http://jekyllbootstrap.com/) blog post 
using [knitr](http://yihui.name/knitr/). Knitr is a general-purpose package for 
dynamic report generation in [R](http://www.r-project.org/).
The only required input is an **R Markdown** file. The name of the R Markdown file 
used to create this post is *2012-07-03-knitr-jekyll.Rmd* 
([source](https://github.com/jfisher-usgs/jfisher-usgs.github.com/blob/master/Rmd/2012-07-03-knitr-jekyll.Rmd)).

Create a Jekyll-Boostrap blog if you don't already have one. A brief tutorial
on building this blog is available 
[here](/lessons/2012/05/30/jekyll-build-on-windows/).

From the R Console:


{% highlight r %}
KnitPost <- function(input, base.url = "/") {
    require(knitr)
    opts_knit$set(base.url = base.url)
    fig.path <- paste0("figs/", sub(".Rmd$", "", basename(input)), "/")
    opts_chunk$set(fig.path = fig.path)
    opts_chunk$set(fig.cap = "center")
    render_jekyll()
    knit(input, envir = parent.frame())
}
KnitPost("2012-07-03-knitr-jekyll.Rmd")
{% endhighlight %}




Move the resulting image folder *2012-07-03-knitr-jekyll* and Markdown file 
*2012-07-03-knitr-jekyll.md* to the local Git repository.
The KnitPost function assumes that the image folder will be placed in a 
[figs](https://github.com/jfisher-usgs/jfisher-usgs.github.com/tree/master/figs) 
folder located at the root of the repository.

Add the following **CSS** code to the 
*/assets/themes/twitter-2.0/css/bootstrap.min.css* file to center images:

    [alt=center] {
      display: block;
      margin: auto;
    }

That's it.

Here are a few examples of embedding R code:


{% highlight r %}
summary(cars)
{% endhighlight %}



{% highlight text %}
##      speed           dist    
##  Min.   : 4.0   Min.   :  2  
##  1st Qu.:12.0   1st Qu.: 26  
##  Median :15.0   Median : 36  
##  Mean   :15.4   Mean   : 43  
##  3rd Qu.:19.0   3rd Qu.: 56  
##  Max.   :25.0   Max.   :120  
{% endhighlight %}






{% highlight r %}
par(mar = c(4, 4, 0.1, 0.1), omi = c(0, 0, 0, 0))
plot(cars)
{% endhighlight %}

![center](/figs/2012-07-03-knitr-jekyll/fig1.png) 

##### Figure 1: Caption



{% highlight r %}
par(mar = c(2.5, 2.5, 0.5, 0.1), omi = c(0, 0, 0, 0))
filled.contour(volcano)
{% endhighlight %}

![center](/figs/2012-07-03-knitr-jekyll/fig2.png) 

##### Figure 2: Caption