module Cronjobs
  class Railtie < Rails::Railtie

    initializer :cronjobs do
      load Rails.root.join('config/cronjobs.rb')
    end

  end
end
