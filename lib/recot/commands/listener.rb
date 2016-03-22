# coding: utf-8
require 'listen'
require 'recot/tasks'

module Recot
  module Commands
    class Listener

      def initialize(ignore = nil)
      end

      def run
        @listener = ::Listen.to(Recot.basket_dir) do |mod, add, del|
          on_modifyed(mod)
          on_added(add)
        end
        @listener.start
      end

      def on_added(files)
        notify(files)
      end

      def on_modifyed(files)
        notify(files)
      end

      def notify(files)
        return if files.empty?
        # run all tasks
        Recot::Tasks::ALL_TASKS.each do |t|
          cls = Object.const_get("Recot::Tasks::#{t}")
          cls.new.run(files)
        end
      end

      def stop
        @listener.stop
      end
    end
  end
end
