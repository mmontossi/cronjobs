require 'cronjobs/dsl/actions'
require 'cronjobs/definitions'
require 'cronjobs/proxy'
require 'cronjobs/railtie'
require 'cronjobs/version'
require 'open3'

module Cronjobs
  class << self

    attr_accessor :env, :mailto, :output

    def define(&block)
      Proxy.new &block
    end

    def definitions
      @definitions ||= Definitions.new
    end

    def update
      if current_digest != last_digest
        Open3.popen2(command) do |stdin, stdout, wait_thr|
          if mailto.present?
            stdin << "MAILTO=#{mailto}\n"
          end
          definitions.each do |time, action|
            stdin << "#{time} "
            if env.present?
              stdin << "#{env} "
            end
            stdin << "bash -lc \"cd #{Rails.root} && #{action} "
            if output.present?
              stdin << ">> #{output} 2>> #{output}"
            else
              stdin << "2>&1"
            end
            stdin << "\"\n"
          end
          stdin.close
          if wait_thr.value.success?
            FileUtils.mkdir_p digest_path.dirname
            File.write digest_path, current_digest
            puts 'Crontab updated'
          else
            warn "Couldn't write crontab"
          end
        end
      end
    end

    private

    def command
      'contrab -'
    end

    def definitions_path
      Rails.root.join 'config/cronjobs.rb'
    end

    def digest_path
      Rails.root.join 'tmp/digests/cronjobs'
    end

    def current_digest
      Digest::MD5.file(definitions_path).hexdigest rescue nil
    end

    def last_digest
      File.read digest_path rescue nil
    end

  end
end
