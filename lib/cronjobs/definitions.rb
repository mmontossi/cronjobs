module Cronjobs
  class Definitions

    def each
      registry.each do |time, actions|
        actions.each do |action|
          yield time, action
        end
      end
    end

    def add(time, actions)
      registry << [time, actions]
    end

    private

    def registry
      @registry ||= []
    end

  end
end
