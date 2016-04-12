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

        # Check test no.
        unless Cache::StateCache.restore_no
          puts "Please input test no. Press the Enter to continue."
          return
        end

        # Run all tasks.
        Recot::Tasks::ALL_TASKS.each do |t|
          cls = Recot::Tasks.const_get(t)
          cls.new.run(files)
        end
      end

      def stop
        @listener.stop
      end
    end
  end
end
