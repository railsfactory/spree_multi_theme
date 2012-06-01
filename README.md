SUMMARY
-------

Spree Multi Theme is a standalone theme for Spree Commerce version 1.1.0.

This theme is now being used as the base theme for SpreeUI demo store:

* [View Demo - http://spreeui.railsfactory.com](http://spreeui.railsfactory.com)


INSTALLATION
------------

Add the following line to your Gemfile:

    gem 'spree_multi_theme', :git => 'git@github.com:railsfactory/spree_multi_theme.git'

NOTE: It's important that you add this line at the bottom of the Gemfile, or at least AFTER any other extension/engine/gem that you'd like to use the theme (i.e. Spree)

Run bunlder:

    $ bundle install

Then Start The servers:

    $ rails s

Optional: Clear out precompiled assets (required for install in sandbox):

    $ rake assets:clean

Description: 
   
    Following the link "http://spreeui.railsfactory.com/admin" You can see the Theme tab according to the theme list you can select the theme.

