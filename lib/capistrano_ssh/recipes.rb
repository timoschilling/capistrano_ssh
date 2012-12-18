require "capistrano/configuration"

Capistrano::Configuration.instance(:must_exist).load do
  desc "Open a ssh connection to one of the remote servers"
  task :ssh, :roles => :app do
    hostname = find_servers_for_task(current_task).first
    exec "ssh -l #{user} #{hostname} -p #{port} -t 'cd #{current_path} && bash'"
  end
end
