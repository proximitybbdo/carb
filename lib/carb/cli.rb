require 'carb'

module Carb
  class CLI
    class << self
      SUB_COMMANDS = %w(create)

      def start
        Logger::log('TODO: implement the target param', Logger::WARNING)
        Logger::log('TODO: alter the default view, merge with index.html', Logger::WARNING)
        Logger::log('TODO: add check if target exists', Logger::WARNING)
        Logger::log('TODO: use FileUtils as much as possible', Logger::WARNING)
        Logger::log('TODO: check if repos are there', Logger::WARNING)
        global_opts = Trollop::options do
          version = "Carb v#{Carb::VERSION}"
          banner <<-EOS
#{version}

Carb gets your fuel flowing. Use it to setup your web dev env.

Usage:
        carb create <type> <folder>

Where <type> is one of:
        octaplus      our fuelphp framework, this is as bare as it gets 
        bearded-octo  our frontend framework together with moreoreless for less/css
        on-fire       octaplus + bearded-octo = dev on fire!

EOS

          # raise Trollop::HelpNeeded if ARGV.empty? # show help screen
          stop_on SUB_COMMANDS
        end

        cmd = ARGV.shift # get the subcommand
        cmd_opts = case cmd
           when "create" # parse create options
             Trollop::options do
               type = ARGV.shift
               target = ARGV.shift || "."

               if Carb::PROJECT_TYPES.include?(type)
                 Carb::Controller.assemble(type, target)
               else
                 Trollop::die "wrong type passed. Use one these options: [#{Carb::PROJECT_TYPES.join(' | ')}]."
               end
             end
            when nil
              Trollop::die "No command specified! Please specify an applicable command"
           else
             Trollop::die "Unknown command #{cmd.inspect}"
           end

      end
    end
  end
end
