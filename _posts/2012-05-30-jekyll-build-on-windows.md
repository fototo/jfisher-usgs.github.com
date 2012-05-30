---
layout: post
title: "Jekyll Build on Windows"
description: ""
category: lessons
tags: [jekyll, tutorial]
---
{% include JB/setup %}

## GitHub

Go to your Github Dashboard and create a new repository named
jfisher-usgs.github.com

Don't run any of the suggested setup commands.

## Jekyll-Bootstrap

Open a GitBash window and install Jekyll-Bootstrap:

    $ git clone https://github.com/plusjade/jekyll-bootstrap.git jfisher-usgs.github.com
    $ cd jfisher-usgs.github.com
    $ git remote set-url origin git@github.com:jfisher-usgs/jfisher-usgs.github.com.git
    $ git push origin master

After GitHub has a couple minutes to do its magic your blog is publicly
available at:
<http://jfisher-usgs.github.com>

## Ruby

Install Ruby on your local machine:
<http://rubyinstaller.org/downloads/>

## Ruby Developement Kit

Install Ruby Developement Kit on your local machine (optional, see below):
<http://rubyinstaller.org/downloads/>.
Extract files into `C:\RubyDevKit`

Open a GitBash window and install Jekyll ruby gem. Note that you don’t
have to run a local version of Jekyll but it helps if you want to
preview your content before publishing.

    $ cd C:\RubyDevKit
    $ ruby dk.rb init
    $ ruby dk.rb install
    $ gem install jekyll

Open a GitBash window and spin up a Jekyll Server:

    $ cd c:/jfisher-usgs.github.com
    $ jekyll --server

This will fire up a local server that will serve up your blog while you are
working locally. See it in action at:
<http://localhost:4000>.
As long as you leave this GitBash window open you'll have
the server running at that port to test your code locally.

## References

<http://jekyllbootstrap.com/>
<http://erjjones.github.com/blog/How-I-built-my-blog-in-one-day/>
<http://zolomon.com/tutorial/2012/02/23/setting-up-jekyll-on-windows-7/>
<http://jekyllbootstrap.com/usage/jekyll-quick-start.html>
