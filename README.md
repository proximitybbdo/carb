# Carb

Tool to help us set up our web apps faster. It can merge different subprojects
and deliver a folder ready to start developing.

# Install #

    gem install carb

### RMagick and OSX ###
For all file/dir related tasks, the gem relies on FileUtils, which itself relies on the RMagick gem. If you are on OSX, and having trouble, please try to install RMagic:

- through (homebrew)[http://mxcl.github.com/homebrew/], just run 
  `$ brew update | brew install imagemagick`
- by using [this great script](https://github.com/maddox/magick-installer)

# Usage #

    $ carb create TYPE TARGET_FOLDER
    => Installs a specific type, just run the command

    $ carb [-h|--help]
    => Display usage information

    # The possible types are

    # - on-fire: octaplus topped with bearded-octo and moreorless (default)
    # - octaplus: a fuelphp installation
    # - bearded-octo: frontend framework topped with moreorless

# Installation types #

Available setups are:

- on-fire: [octaplus](https://github.com/proximitybbdo/octaplus) topped with [bearded-octo](https://github.com/proximitybbdo/bearded-octo) and [moreorless](https://github.com/rob-bar/moreorless) (default)
- octaplus: octaplus installation, which is a basic FuelPHP installation
- bearded-octo: frontend framework topped with moreorless

# Contributing #

Fork, alter, pull request!

## Copyright ##

Copyright (c) 2012 Proximity BBDO
See LICENSE for details.
