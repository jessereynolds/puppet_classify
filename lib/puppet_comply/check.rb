
# download module
#
# download dependencies
#
# verify each class and defined type in the module has an associated rspec test - fail if no
#
# run rspec tests in the module, inserting our shared examples into their context
#

require 'puppet_forge'

module PuppetComply
  module Check
    def self.run(forge_module:)
      self.download_forge_module(forge_module)
      self.execute_rspec(self.module_path(forge_module))
    end

    def self.download_forge_module(forge_module)
      modules_dir = File.join(Dir.pwd, 'modules')
      unless File.exist?(modules_dir)
        Dir.mkdir(modules_dir)
      end

      system("bundle exec puppet module install #{forge_module} --target-dir #{modules_dir}")
    end

    def self.module_path(forge_module)
      File.join(Dir.pwd, 'modules', forge_module.split(/[\/-]/, 2).last)
    end

    def self.execute_rspec(module_path)
      Dir.chdir(module_path) do
        Bundler.with_clean_env do
          if File.directory?('spec/fixtures/modules')
            FileUtils.rm_rf('spec/fixtures/modules')
          end
          FileUtils.ln_s('../../../.', 'spec/fixtures/modules')
          system('bundle install && bundle exec rake spec')
        end
      end
    end

  end
end

