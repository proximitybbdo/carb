require "spec_helper"

describe Carb::CLI do

  include OutputCapture

  describe "MainCommand" do

    before do
      @command = Carb::CLI::MainCommand.new("")
    end

    describe "without parameters" do

      it "shows the help" do

        lambda do
          @command.parse(%w(--help))
        end.should raise_error(Clamp::HelpWanted)
      end

    end 

  end

  describe "InstallCommand" do

    before do
      @command = Carb::CLI::InstallCommand.new("")
    end

    describe "with an invalid type" do

      it "fails and leaves you burning in hell" do
        lambda do
          @command.parse(['bogus'])
        end.should raise_error(Clamp::UsageError, /TYPE/)
      end

    end

    describe "with a valid type and target" do

      it "will give you what you want, a package" do
        @command.parse(['octaplus', '/tmp/carb-rspec'])
        @command.execute()
        stdout.should include("voila")

        @command.parse(['bearded-octo', '/tmp/carb-rspec'])
        @command.execute()
        stdout.should include("voila")

        @command.parse(['on-fire', '/tmp/carb-rspec'])
        @command.execute()
        stdout.should include("voila")
      end

    end

  end

end
