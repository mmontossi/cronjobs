module Cronjobs
  class Railtie < Rails::Railtie

    config.before_initialize do
      load Rails.root.join('config/cronjobs.rb')
    end

    rake_tasks do
      load 'tasks/cronjobs.rake'
    end

  end
end
