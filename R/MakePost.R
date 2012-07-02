
KnitPost <- function(input, base.url="/") {
  opts_knit$set(base.url=base.url)
  
  fig.path <- paste0("figs/", sub(".Rmd$", "", basename(input)), "/")
  opts_chunk$set(fig.path=fig.path)
  opts_chunk$set(fig.cap="center")

  render_jekyll()
  knit(input, envir=parent.frame())
}

###

library(knitr)

setwd("E:/WORK/JFisher/Software/RPosts")

###

path <- "E:/WORK/JFisher/Software/jfisher-usgs.github.com"
input <- file.path(path, "Rmd", "2012-07-02-knitr-jekyll.Rmd")

KnitPost(input)
