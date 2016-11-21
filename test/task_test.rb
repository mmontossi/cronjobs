require 'test_helper'

class TaskTest < ActiveSupport::TestCase

  setup do
    load File.expand_path('../../lib/tasks/cronjobs.rake', __FILE__)
    Rake::Task.define_task :environment
  end

  teardown do
    FileUtils.rm_rf Rails.root.join('tmp')
  end

  test 'update' do
    Cronjobs.expects(:update).once
    Rake::Task['cronjobs:update'].invoke

    digest = Digest::MD5.file(Rails.root.join('config/cronjobs.rb'))
    digest_path = Rails.root.join('tmp/digests/cronjobs')
    FileUtils.mkdir_p digest_path.dirname
    File.write digest_path, digest
    Cronjobs.expects(:update).never
    Rake::Task['cronjobs:update'].invoke
  end

end
