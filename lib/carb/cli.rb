require "clamp/command"

require "carb/config"
require "carb/controller"
require "carb/logger"
require "carb/version"

module Carb
  module CLI

    class InstallCommand < Clamp::Command
      parameter "TYPE", "The type of project, being one of: octaplus, bearded-octo, on-fire" do |s|
        raise ArgumentError.new('Not a correct project type.') unless Carb::Config::PROJECT_TYPES.include?(s)
        s # return the actual value
      end

      parameter "[TARGET]", "The target folder", :default => "."

      def execute
        Carb::Controller.assemble(type, target)
      end
    end

    class MainCommand < Clamp::Command
      option "--version", :flag, "show version" do
        puts "Carb #{Carb::VERSION}"
        exit(0)
      end

      subcommand "install", "Install a new project", InstallCommand
    end

    def self.run(*a)
      Logger::log('TODO: alter the default view, merge with index.html', Logger::WARNING)
      Logger::log('TODO: add check if target exists', Logger::WARNING)
      Logger::log('TODO: check if repos are there', Logger::WARNING)
      puts ''

      MainCommand.run(*a)
    end
  end
end
