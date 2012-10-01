require 'thor'
require "octaplus"

module Octaplus
  class CLI < Thor
    desc "init PROJECT", "Creates a new Octaplus project, bare"
    def init(project)
      puts "⚡ Preparing your package, hold on ⚡", ""

      # save pwd
      pwd = Dir.pwd

      # remove previous
      %x[rm -rf /tmp/proxdev]

      # create some collecting folders
      # and move to the root of them
      %x[mkdir -p /tmp/proxdev/octaplus /tmp/proxdev/bearded /tmp/proxdev/boilerplate]

      Dir.chdir "/tmp/proxdev"

      # get the octaplus framework
      puts '   ⚡ A bit of Octaplus goodness'
      %x[curl -L -s https://github.com/proximitybbdo/octaplus/tarball/master | tar xz --strip 1 -C octaplus]

      # get the bearded octo
      puts '   ⚡ And some bearded-octo seasoning'
      %x[curl -L -s https://github.com/proximitybbdo/bearded-octo/tarball/master | tar xz --strip 1 -C bearded]

      # merge the two into boilerplate goodness
      puts '   ⚡ All in the boilerplate'
      %x[cp -R octaplus/ boilerplate]
      %x[rm -rf -R boilerplate/public/assets]
      %x[cp -R bearded/assets boilerplate/public]

      # copy the bundle to the current working directory
      puts "", "⚡⚡⚡ Et voila! All set in the ./#{project} folder ⚡⚡⚡ ", ""

      %x[mkdir -p #{pwd}/#{project} | cp -R boilerplate #{pwd}/#{project}]
    end

  end
end
