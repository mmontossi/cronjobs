module Cronjobs
  module DSL
    class Actions

      def initialize(&block)
        @actions = []
        instance_eval(&block)
      end

      def runner(command)
        @actions << "./bin/rails runner '#{command}'"
      end

      def rake(task)
        @actions << "./bin/rake #{task}"
      end

      def to_a
        @actions
      end

    end
  end
end
