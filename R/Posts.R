

library(markdown)
library(knitr)


setwd("E:/WORK/JFisher/Software/RPosts")

###

# knit2html("2012-06-30-knitr-markdown-jekyll.Rmd")
# browseURL("2012-06-30-knitr-markdown-jekyll.html")

###

CreateGitpath <- function(user, repo, branch = "master"){
  paste0(paste("https://github.com", user, repo, "raw", branch, sep = "/"), "/")
}

KnitGithub <- function(..., git.url){
  opts_knit$set(base.url = git.url)
  opts_chunk$set(fig.path = "images/")
  opts_chunk$set(fig.align = "center")
  knit(..., envir = parent.frame())
}

###

repo <- CreateGitpath("jfisher-usgs", "jfisher-usgs.github.com")

KnitGithub("2012-06-30-knitr-markdown-jekyll.Rmd", git.url = repo)


###


KnitGithub("2012-06-30-knitr-markdown-jekyll.Rmd", git.url = "")


markdownToHTML("2012-06-30-knitr-markdown-jekyll.md",
               "2012-06-30-knitr-markdown-jekyll.html", fragment.only = TRUE)

browseURL("2012-06-30-knitr-markdown-jekyll.html")

