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

        # create tmp folder
        FileUtils.mkdir_p "#{Config::TMP_FOLDER}"

        # and move to the root of them
        Dir.chdir "#{Config::TMP_FOLDER}"
      end

      def tear_down
        # copy the bundle to the current working directory
        FileUtils.mkdir_p "#{@pwd}/#{@target}"
        FileUtils.cp_r "#{Config::DIR_COOKPOT}/.", "#{@pwd}/#{@target}" 
        
        puts ""
        Logger::log("⚡⚡⚡ Et voila! All set in the ./#{@target} folder ⚡⚡⚡ ", Logger::SUCCESS)

        # clean up
        # FileUtils.remove_dir "#{Config::TMP_FOLDER}", :force => true
      end

      ##################################
      # the ingredients
      ##################################

      def get_octaplus
        Logger::log("   ⚡ A bit of Octaplus goodness", Logger::INFO)

        FileUtils.mkdir_p "#{Config::DIR_OCTAPLUS}"
        %x[curl -L -s https://github.com/proximitybbdo/octaplus/tarball/master | tar xz --strip 1 -C octaplus]
      end

      def get_bearded_octo
        Logger::log("   ⚡ Some bearded-octo seasoning", Logger::INFO)

        FileUtils.mkdir_p "#{Config::DIR_BEARDED}"
        %x[curl -L -s https://github.com/proximitybbdo/bearded-octo/tarball/master | tar xz --strip 1 -C bearded]
      end

      def get_moreorless
        Logger::log("   ⚡ A dash of moreorless", Logger::INFO)

        FileUtils.mkdir_p "#{Config::DIR_MOREORLESS}"
        %x[curl -L -s https://github.com/rob-bar/moreorless/tarball/master | tar xz --strip 1 -C moreorless]
      end

      ##################################
      # cook the recipes
      ##################################

      def cook_octaplus
        get_octaplus()

        FileUtils.cp_r "#{Config::DIR_OCTAPLUS}", "#{Config::DIR_COOKPOT}"
      end

      def cook_bearded_octo
        get_bearded_octo()
        get_moreorless()

        FileUtils.remove_dir "#{Config::DIR_OCTAPLUS}/assets"
        FileUtils.mkdir_p "#{Config::DIR_COOKPOT}/assets"

        FileUtils.cp_r "#{Config::DIR_BEARDED}/assets/.", "#{Config::DIR_COOKPOT}/assets"
        FileUtils.remove_dir "#{Config::DIR_MOREORLESS}/tests"
        FileUtils.cp_r "#{Config::DIR_MOREORLESS}/.", "#{Config::DIR_COOKPOT}/assets/css"
      end

      def cook_on_fire
        get_octaplus()
        cook_bearded_octo()

        FileUtils.cp_r "#{Config::DIR_OCTAPLUS}/.", "#{Config::DIR_COOKPOT}"
        FileUtils.cp_r "#{Config::DIR_BEARDED}/index.html", "#{Config::DIR_COOKPOT}/fuel/app/views/welcome"

        # actions on the views
      end

    end
  end
end
