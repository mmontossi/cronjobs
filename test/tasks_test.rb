require 'test_helper'

class TasksTest < ActiveSupport::TestCase

  setup do
    load File.expand_path('../../lib/tasks/cronjobs.rake', __FILE__)
    Rake::Task.define_task :environment
  end

  teardown do
    FileUtils.rm_rf Rails.root.join('tmp')
  end

  test 'check' do
    Cronjobs.expects(:write).once
    Rake::Task['cronjobs:check'].invoke

    digest = Digest::MD5.file(Rails.root.join('config/cronjobs.rb'))
    digest_path = Rails.root.join('tmp/digests/cronjobs')
    FileUtils.mkdir_p digest_path.dirname
    File.write digest_path, digest
    Cronjobs.expects(:write).never
    Rake::Task['cronjobs:check'].invoke
  end

end
