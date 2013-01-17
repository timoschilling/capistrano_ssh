require "capistrano/configuration"

module CapistranoSSH
  module Recipes
    def self.load_into(configuration)
      configuration.load do
        desc "Open a ssh connection to one of the remote servers"
        task :ssh, :roles => :app do
          hostname = find_servers_for_task(current_task).first
          run_locally "ssh -l #{user} #{hostname} -p #{port} -t 'cd #{current_path} && bash'"
        end
      end
    end
  end
end

if Capistrano::Configuration.instance
  CapistranoSSH::Recipes.load_into(Capistrano::Configuration.instance)
end
