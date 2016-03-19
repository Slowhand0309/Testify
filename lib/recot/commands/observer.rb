# coding: utf-8

module Recot
  module Commands
    module Observer

      def self.extended(base)
        base.class_eval do
          @tasks = []
        end
      end

      def add_task(task)
        @tasks << task
      end

      def notify(args = nil)
        @tasks.each do |t|
          t.run(args)
        end
      end
    end
  end
end
