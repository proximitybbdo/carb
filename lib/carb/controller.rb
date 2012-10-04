# -*- encoding : utf-8 -*-
require 'carb'

module Carb
  class Controller
    class << self

      type, pwd, target = '', '', ''

      ##################################
      # the chef
      ##################################
      
      def assemble(type, target)

        # @type = type
        # @target = target || "."

        # set_up()

        # case @type
        # when Carb::TYPE_OCTAPLUS
        #   cook_octaplus()
        # when Carb::TYPE_BEARDED_OCTO
        #   cook_bearded_octo()
        # when Carb::TYPE_ON_FIRE
        #   cook_on_fire()
        # end

        # tear_down()
      end

      def set_up
        puts "⚡ Preparing your package, hold on ⚡".blue

        # save pwd
        @pwd = Dir.pwd

        # remove previous
        %x[rm -rf #{Carb::TMP_FOLDER}]

        # FileUtils.rm_rf = "#{TMP_FOLDER}"
        
        # create tmp folder
        %x[mkdir -p #{Carb::TMP_FOLDER}]

        # create some collecting folders
        #
        # TODO these subfolder names should be the same as the PROJECT_TYPES
        # used by the CLI app. Maybe create a Config class with static members ?
        # Or how can you handle config files in ruby?
        #
        # %x[mkdir -p #{TMP_FOLDER}/octaplus #{TMP_FOLDER}/bearded #{TMP_FOLDER}/boilerplate]

        # and move to the root of them
        Dir.chdir "#{Carb::TMP_FOLDER}"
      end

      def tear_down
        # copy the bundle to the current working directory
        puts "", "⚡⚡⚡ Et voila! All set in the ./#{@target} folder ⚡⚡⚡ ".green.reversed
        puts ""

        %x[mkdir -p #{@pwd}/#{@target} | cp -R boilerplate/ #{@pwd}/#{@target}]
        
        # clean up
        # %x[rm -rf #{TMP_FOLDER}]
      end

      ##################################
      # the ingredients
      ##################################

      def get_octaplus
        puts '   ⚡ A bit of Octaplus goodness'
        %x[mkdir -p octaplus]
        %x[curl -L -s https://github.com/proximitybbdo/octaplus/tarball/master | tar xz --strip 1 -C octaplus]
      end

      def get_bearded_octo
        puts '   ⚡ Some bearded-octo seasoning'
        %x[mkdir -p bearded]
        %x[curl -L -s https://github.com/proximitybbdo/bearded-octo/tarball/master | tar xz --strip 1 -C bearded]
      end

      def get_moreorless
        puts '   ⚡ A dash of moreorless'
        %x[mkdir -p moreorless]
        %x[curl -L -s https://github.com/rob-bar/moreorless/tarball/master | tar xz --strip 1 -C moreorless]
      end

      ##################################
      # cook the recipes
      ##################################

      def cook_octaplus
        get_octaplus()

        %x[cp -R octaplus/ boilerplate]
      end

      def cook_bearded_octo
        get_bearded_octo()
        get_moreorless()

        %x[rm -rf boilerplate/assets/*]
        %x[mkdir -p boilerplate/assets]
        %x[cp -R bearded/assets/ boilerplate/assets]
        %x[rm -rf moreorless/tests]
        %x[cp -R moreorless/ boilerplate/assets/css]
      end

      def cook_on_fire
        get_octaplus()
        cook_bearded_octo()

        %x[cp -R octaplus/ boilerplate]
        %x[cp bearded/index.html boilerplate/fuel/app/views/welcome]

        # actions on the views
      end

    end
  end
end
