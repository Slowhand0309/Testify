# coding: utf-8

module Testify
  module Commands
    module Observer

      def setup()
        @tasks = []
      end

      def add_task(&task)
        @tasks << task
      end

      def notify(args = nil)
        @tasks.each do |t|
          t.call(self, args)
        end
      end
    end
  end
end
