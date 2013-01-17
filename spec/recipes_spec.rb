require "spec_helper"

describe CapistranoSSH::Recipes, "loaded into a configuration" do
  describe "ssh" do
    before do
      [:rails_env, :user, :current_path].each do |key|
        configuration.set key, "#{key}"
      end
      configuration.set :port, 22
      configuration.role :app, "example.com"
    end

    let :configuration do
      configuration = Capistrano::Configuration.new
      described_class.load_into configuration
      configuration.extend Capistrano::Spec::ConfigurationExtension
    end

    it "defines rails:console" do
      configuration.find_task("ssh").should_not be_nil
    end

    it "should run the remote command" do
      configuration.find_and_execute_task "ssh"
      configuration.should have_run_locally "ssh -l user example.com -p 22 -t 'cd current_path && bash'"
    end
  end
end
