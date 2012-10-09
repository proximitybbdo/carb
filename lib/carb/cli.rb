require "clamp/command"

require "carb/config"
require "carb/controller"
require "carb/logger"
require "carb/version"

module Carb
  module CLI

    class InstallCommand < Clamp::Command
      parameter "TYPE", "Type of project, one of:
------------------------

octaplus        a clean fuelphp installation, 
                with no frontend classes merged

bearded-octo    frontend only, merges our frontend framework
                with the moreorless less package

on-fire         [recommended] combo of octaplus and bearded-octo

" do |s|
        raise ArgumentError.new('Not a correct project type.') unless Carb::Config::PROJECT_TYPES.include?(s)
        s # return the actual value
      end

      parameter "[TARGET]", "target folder", :default => "."

      option ["--force", "-f"], :flag, "force overwrite of the target folder if it exists"

      def execute
        Carb::Controller.assemble(type, target, force?)
      end
    end

    class MainCommand < Clamp::Command
      option ["--version", "-v"], :flag, "show version" do
        puts "Carb #{Carb::VERSION}"
        exit(0)
      end

      subcommand "install", "Install a new project", InstallCommand
    end

    def self.run(*a)
      Logger::log('TODO: alter the default view, merge with index.html', Logger::WARNING)
      Logger::log('TODO: check if repos are there', Logger::WARNING)
      puts ''

      MainCommand.run(*a)
    end
  end
end
