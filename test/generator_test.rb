require 'test_helper'
require 'rails/generators'
require 'generators/cronjobs/install/install_generator'

class GeneratorTest < Rails::Generators::TestCase
  destination Rails.root.join('tmp')

  teardown do
    FileUtils.rm_rf destination_root
  end

  test 'install' do
    self.class.tests Cronjobs::Generators::InstallGenerator
    run_generator
    assert_file 'config/cronjobs.rb'
  end

end
