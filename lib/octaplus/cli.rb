require 'thor'
require "octaplus"

module Octaplus
  class CLI < Thor
    desc "init PROJECT", "Creates a new Octaplus project, bare"
    def init(project)
      puts "#{project}"

      # get the octaplus framework
      %x[git clone https://github.com/proximitybbdo/octaplus /tmp/proxdev/octaplus_tmp]

      # # get the bearded octo
      %x[git clone https://github.com/proximitybbdo/octaplus /tmp/proxdev/bearded_tmp]

      # copy the bundle to the current working directory
      pwd = Dir.pwd
      Dir.chdir "/tmp/proxdev/octaplus_tmp"
      %x[mkdir -p #{pwd}/octaplus | git archive master | tar -x -C #{pwd + '/octaplus'}]
    end

  end
end
