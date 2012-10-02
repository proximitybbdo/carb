# Carb

Tool to help us set up our web apps faster. It can merge different subprojects
and deliver a folder ready to start developing.

Available setups are:

- on-fire: [octaplus](https://github.com/proximitybbdo/octaplus) topped with [bearded-octo](https://github.com/proximitybbdo/bearded-octo) and [moreorless](https://github.com/rob-bar/moreorless) (default)
- octaplus: octaplus installation
- bearded-octo: frontend framework topped with moreorless

## Installation

Add this line to your application's Gemfile:

    gem 'carb'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install carb

## Usage

To install a specific type, just run the command

    $ carb create TYPE TARGET_FOLDER

The possible types are

- on-fire: octaplus topped with bearded-octo and moreorless (default)
- octaplus: a fuelphp installation
- bearded-octo: frontend framework topped with moreorless
