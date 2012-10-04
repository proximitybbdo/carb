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

        @type = type
        @target = target || "."

        set_up()

        case @type
        when Config::TYPE_OCTAPLUS
          cook_octaplus()
        when Config::TYPE_BEARDED_OCTO
          cook_bearded_octo()
        when Config::TYPE_ON_FIRE
          cook_on_fire()
        end

        tear_down()
      end

      def set_up
        Logger::log("⚡ Preparing your package, hold on ⚡", Logger::INFO)

        # save pwd
        @pwd = Dir.pwd

        # remove previous
        FileUtils.rm_rf = "#{Config::TMP_FOLDER}"
        
        # create tmp folder
        %x[mkdir -p #{Config::TMP_FOLDER}]

        # create some collecting folders
        #
        # TODO these subfolder names should be the same as the PROJECT_TYPES
        # used by the CLI app. Maybe create a Config class with static members ?
        # Or how can you handle config files in ruby?
        #
        # %x[mkdir -p #{TMP_FOLDER}/octaplus #{TMP_FOLDER}/bearded #{TMP_FOLDER}/boilerplate]

        # and move to the root of them
        Dir.chdir "#{Config::TMP_FOLDER}"
      end

      def tear_down
        # copy the bundle to the current working directory
        puts ""
        Logger::log("⚡⚡⚡ Et voila! All set in the ./#{@target} folder ⚡⚡⚡ ", Logger::SUCCESS)

        %x[mkdir -p #{@pwd}/#{@target} | cp -R boilerplate/ #{@pwd}/#{@target}]
        
        # clean up
        %x[rm -rf #{Config::TMP_FOLDER}]
      end

      ##################################
      # the ingredients
      ##################################

      def get_octaplus
        Logger::log("   ⚡ A bit of Octaplus goodness", Logger::INFO)
        %x[mkdir -p octaplus]
        %x[curl -L -s https://github.com/proximitybbdo/octaplus/tarball/master | tar xz --strip 1 -C octaplus]
      end

      def get_bearded_octo
        Logger::log("   ⚡ Some bearded-octo seasoning", Logger::INFO)
        %x[mkdir -p bearded]
        %x[curl -L -s https://github.com/proximitybbdo/bearded-octo/tarball/master | tar xz --strip 1 -C bearded]
      end

      def get_moreorless
        Logger::log("   ⚡ A dash of moreorless", Logger::INFO)
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
