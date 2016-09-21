require 'test_helper'

class CronjobsTest < ActiveSupport::TestCase

  teardown do
    FileUtils.rm_rf Rails.root.join('tmp')
  end

  test 'write' do
    output_path = Rails.root.join('tmp/output')
    FileUtils.mkdir_p output_path.dirname
    FileUtils.touch output_path
    Cronjobs.stubs(:command).returns("cat - > #{output_path}")
    Cronjobs.write
    prefix = '* 1 * * * PATH=$PATH:/usr/local/bin bash -lc'
    redirect = ">> #{Rails.root.join('log/cronjobs.log')} 2>> #{Rails.root.join('log/cronjobs.log')}"
    output = <<-EOF.strip_heredoc
      MAILTO=test@mail.com
      #{prefix} "cd #{Rails.root} && ./bin/rails runner 'Attachs.clear' #{redirect}"
      #{prefix} "cd #{Rails.root} && ./bin/rake certificates:check #{redirect}"
    EOF
    assert_equal output, File.read(output_path)
  end

end
