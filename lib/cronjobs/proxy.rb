module Cronjobs
  class Proxy

    def initialize(&block)
      instance_eval(&block)
    end

    def env(value)
      Cronjobs.env = value
    end

    def mailto(value)
      Cronjobs.mailto = value
    end

    def output(value)
      Cronjobs.output = value
    end

    def every(time, &block)
      Cronjobs.definitions.add time, DSL::Actions.new(&block).to_a
    end

  end
end
