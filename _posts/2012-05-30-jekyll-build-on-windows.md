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
jfisher-usgs.github.com (in all instances replace *jfisher-usgs* with your 
GitHub username). Don't run any of the suggested setup commands.

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

Install Ruby on your local machine. The installer is available at 
<http://rubyinstaller.org/downloads>, for example 
`rubyinstaller-1.9.3-p194.exe`.

## Ruby Developement Kit

Install the Ruby Developement Kit on your local machine if you want to
be able to preview your content before publishing. 
The development kit is available at <http://rubyinstaller.org/downloads>, 
for example `DevKit-tdm-32-4.5.2-20111229-1559-sfx.exe`.
Extract files into `C:\RubyDevKit`.

Open a GitBash window and install the Jekyll ruby gem:

    $ cd C:\RubyDevKit
    $ ruby dk.rb init
    $ ruby dk.rb install
    $ gem install jekyll

Open a GitBash window and spin up a Jekyll Server:

    $ cd c:/jfisher-usgs.github.com
    $ jekyll --server

This will fire up a local server that will serve up your blog while you are
working locally. See it in action at <http://localhost:4000>.
As long as you leave this GitBash window open you'll have
the server running at that port to test your code locally.

## Comments Provider
I chose [Disqus](http://disqus.com) as a comments provider. You can
register your site at <http://disqus.com/admin/register>.
Make note of your *short_name*.

## Analytics Helper

I chose [Google](http://www.google.com/analytics/) as a analytics helper.
Make note of your *tracking_id*.

## Configure

Open a text editor and configure the `_config.yml` file. The following changes
were made:

    title : jfisher-usgs
    tagline: blog
    author :
      name : Jason C Fisher
      email : jfisher@usgs.gov
      github : jfisher-usgs

    # Production URL
    production_url : http://jfisher-usgs.github.com
    
    # Pagination (added this line)
    paginate: 3
    
    # Settings for comments helper
    comments :
      provider : disqus
        disqus :
          short_name : jfisherusgs

    # Settings for analytics helper
    analytics :
      provider : google
      google :
        tracking_id : 'XX-XXXXXXXX-X'

## Twitter-2.0 Theme

Install Twitter-2.0 theme packaged for Jekyll-Bootstrap to get a responsive
layout with media queries.

    $ rake theme:install git="https://github.com/gdagley/theme-twitter-2.0"

After the install is successful, the task will ask you if you'd like to switch 
to the newly installed theme. Type 'y' and enter to switch.

## References

<http://jekyllbootstrap.com/lessons/jekyll-introduction.html>   
<http://zolomon.com/tutorial/2012/02/23/setting-up-jekyll-on-windows-7>  
<http://jekyllbootstrap.com/usage/jekyll-quick-start.html>  
