# coding: utf-8

module Testify
  module Commands
    module Observer

      def initialize()
        @tasks = []
      end

      def add_task(&task)
        @tasks << task
      end

      def notify()
        @tasks.each do |t|
          t.call(self)
        end
      end
    end
  end
end
