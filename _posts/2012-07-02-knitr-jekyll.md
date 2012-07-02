---
layout: post
title: "Blog with Knitr and Jekyll"
description: ""
category: lessons
tags: [knitr, jekyll, tutorial]
---
{% include JB/setup %}

Notes on creating a [Jekyll-Bootstrap](http://jekyllbootstrap.com/) blog post 
with [knitr](http://yihui.name/knitr/). Knitr is a general-purpose package for 
dynamic report generation in [R](http://www.r-project.org/).
The only required input is an **R Markdown** file. Markdown is a simple 
formatting syntax for authoring web pages. The source file used for this
post is named `2012-07-02-knitr-jekyll.Rmd` ([source](http://yihui.name/knitr/)).

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
KnitPost("2012-07-02-knitr-jekyll.Rmd")
{% endhighlight %}




Move the resulting folder containing figures and the Markdown file (`*.md`) 
into the local Git repository. That's it.
 
Examples of embedding R code:


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
plot(cars)
{% endhighlight %}

![center](/figs/2012-07-02-knitr-jekyll/fig1.png) 

##### Figure 1: Caption.



{% highlight r %}
filled.contour(volcano)
{% endhighlight %}

![center](/figs/2012-07-02-knitr-jekyll/fig2.png) 

##### Figure 2: Caption.
