## Homepage ##

This is the raw source code for my website. The compiled version of the website is available in the "master" branch. This source code is designed in Jekyll with a few extra plugins.

### _includes ###
This folder includes partial page templates that can be included from other pages or templates.

### _plugins ###
This folder stores the various jekyll plugins. Currently there are 3 plugins

* gallery.rb
This plugin reads a directory as given in the post metadata ("photosDir") and adds all the images in said folder to the forloop context. 

* generate_categories.rb
This plugin loops through all the posts placing aggregating posts into category buckets. Each post must state their category via the metadata tag "category". The plugin then generates a page for each category similar to the index page but only of posts of a given category.

* generate_sitemap.rb
This plugin generates a sitemap.xml file for SEO

### RakeFile ###
This simple rake task compiles the project and copies it to a folder container the master branch. This folder can then be committed and synced with github.
