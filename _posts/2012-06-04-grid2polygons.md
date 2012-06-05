---
layout: post
title: "Grid2Polygons"
description: ""
category: programming
tags: [R]
---
{% include JB/setup %}

## Example 1

{% highlight r %}
m <- 5
n <- 6
z <- c(1.1,  1.5,  4.2,  4.1,  4.3,  4.7,
       1.2,  1.4,  4.8,  4.8,   NA,  4.1,
       1.7,  4.2,  1.4,  4.8,  4.0,  4.4,
       1.1,  1.3,  1.2,  4.8,  1.6,   NA,
       3.3,  2.9,   NA,  4.1,  1.0,  4.0)
x <- rep(0:6, m + 1)
y <- rep(0:5, each = n + 1)
xc <- c(rep(seq(0.5, 5.5, by = 1), m))
yc <- rep(rev(seq(0.5, 4.5, by = 1)), each = n)
grd <- data.frame(z = z, xc = xc, yc = yc)
coordinates(grd) <- ~ xc + yc
gridded(grd) <- TRUE
grd <- as(grd, "SpatialGridDataFrame")
image(grd, col = gray.colors(30), axes = TRUE)
grid(col = "black", lty = 1)
points(x = x, y = y, pch = 16)
text(cbind(xc, yc), labels = z)
text(cbind(x = x + 0.1, y = rev(y + 0.1)), labels = 1:42, cex=0.6)
{% endhighlight %}

<div class="img-centered">
  <p><img src="/images/2012-06-04/fig1.png" alt="fig1" title="Figure 1"/></p>
</div>

    plys <- Grid2Polygons(grd, level = TRUE, at = 1:5)
    summary(plys)
    cols <- rainbow(4, alpha = 0.3)
    plot(plys, col = cols, add = TRUE)
    x <- rep(0:6, m + 1)
    y <- rep(0:5, each = n + 1)
    legend("top", legend = plys[[1]], fill = cols, bty = "n", xpd = TRUE, inset = c(0, -0.1), ncol = 4)

<div class="img-centered">
  <p><img src="/images/2012-06-04/fig2.png" alt="fig2" title="Figure 2"/></p>
</div>

## Example 2

    data(meuse.grid)
    coordinates(meuse.grid) <- ~ x + y
    gridded(meuse.grid) <- TRUE
    meuse.grid <- as(meuse.grid, "SpatialGridDataFrame")
    meuse.plys <- Grid2Polygons(meuse.grid, "dist", level = FALSE)
    op <- par(mfrow = c(1, 2), oma = c(0, 0, 0, 0), mar = c(0, 0, 0, 0))
    z <- meuse.plys[[1]]
    col.idxs <- findInterval(z, sort(unique(na.omit(z))))
    cols <- heat.colors(max(col.idxs))[col.idxs]
    plot(meuse.plys, col = cols)
    title("level = FALSE", line = -7)
    meuse.plys.lev <- Grid2Polygons(meuse.grid, "dist", level = TRUE)
    z <- meuse.plys.lev[[1]]
    col.idxs <- findInterval(z, sort(unique(na.omit(z))))
    cols <- heat.colors(max(col.idxs))[col.idxs]
    plot(meuse.plys.lev, col = cols)
    title("level = TRUE", line = -7)
    par(op)

<div class="img-centered">
  <p><img src="/images/2012-06-04/fig3.png" alt="fig3" title="Figure 3"/></p>
</div>

## Example 3

    library(rgdal)
    data(DEM)
    at <- seq(500, 4000, by = 250)
    op <- par(oma = c(0, 0, 0, 0), mar = c(0, 0, 0, 0))
    image(DEM, breaks = at, col = terrain.colors(length(at) - 1))

<div class="img-centered">
  <p><img src="/images/2012-06-04/fig4.png" alt="fig4" title="Figure 4"/></p>
</div>

    dem.plys <- Grid2Polygons(DEM, level = TRUE, at = at)
    z <- dem.plys[[1]]
    col.idxs <- findInterval(z, sort(unique(na.omit(z))))
    cols <- terrain.colors(max(col.idxs))[col.idxs]
    plot(dem.plys, border = "transparent", col = cols)

<div class="img-centered">
  <p><img src="/images/2012-06-04/fig5.png" alt="fig5" title="Figure 5"/></p>
</div>

    dem.plys.ll <- rgdal::spTransform(dem.plys, CRS = CRS("+proj=longlat +datum=WGS84"))
    plot(dem.plys.ll, border = "transparent", col = cols)

<div class="img-centered">
  <p><img src="/images/2012-06-04/fig6.png" alt="fig6" title="Figure 6"/></p>
</div>
