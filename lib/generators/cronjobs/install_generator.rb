require 'rails/generators'

module Cronjobs
  module Generators
    class InstallGenerator < Rails::Generators::Base

      source_root File.expand_path('../templates', __FILE__)

      def create_definitions_file
        copy_file 'definitions.rb', 'config/cronjobs.rb'
      end

    end
  end
end
