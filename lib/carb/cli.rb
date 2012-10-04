require 'carb'

module Carb
  class CLI < Thor
    include Thor::Actions
    default_task :help

    # Logger::log('TODO: implement the target param', Logger::WARNING)
    # Logger::log('TODO: alter the default view, merge with index.html', Logger::WARNING)
    # Logger::log('TODO: add check if target exists', Logger::WARNING)
    # Logger::log('TODO: use FileUtils as much as possible', Logger::WARNING)
    # Logger::log('TODO: check if repos are there', Logger::WARNING)

    # if Carb::PROJECT_TYPES.include?(type)
    # Carb::Controller.assemble(type, target)
    # Trollop::die "wrong type passed. Use one these options: [#{Carb::PROJECT_TYPES.join(' | ')}]."

  end
end
