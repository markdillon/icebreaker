require 'thor'
require 'thor/actions'
require 'active_support/secure_random'

module IceBreaker
  class CLI < Thor
    include Thor::Actions

    desc "new [app]", "Create a new Rails 3 application"
    long_desc <<-D
      IceBreaker will ask you a few questions to determine what features you
      would like to generate. Based on your answers it will setup a new Rails 3 application.
    D
    
    def new(project)
      # Check for a gemset and warn if none
      gemset = `rvm gemset name`.chomp
      unless gemset == 'icebreaker'
        say "It is recommend that you use a separate RVM gemset called 'icebreaker' when creating a Rails project with IceBreaker.  This will keep your system gems clean."
        say "You can create it by running this command: rvm use 1.9.2@icebreaker --create"
        if yes?("Would you like to exit now and create a separate RVM gemset for icebreaker?")
          exit 0
        end
      end
      
      command = "rails new #{project} --skip-active-record --skip-test-unit --skip-prototype --template=#{template} "
      puts "Creating new Rails 3 project with: #{command}"
      exec(command)
    end

    desc "version", "Prints IceBreaker's version information"
    def version
      say "IceBreaker version #{IceBreaker::VERSION}"
    end
    map %w(-v --version) => :version

    private

    def template
      File.expand_path(File.dirname(__FILE__) + "/../../templates/bootstrap.rb")
    end

  end
end