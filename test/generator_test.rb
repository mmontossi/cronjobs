require 'test_helper'
require 'rails/generators'
require 'generators/cronjobs/install_generator'

class GeneratorsTest < Rails::Generators::TestCase

  tests Cronjobs::Generators::InstallGenerator
  destination Rails.root.join('tmp')

  teardown do
    FileUtils.rm_rf destination_root
  end

  test 'file generation' do
    run_generator
    assert_file 'config/cronjobs.rb'
  end

end
