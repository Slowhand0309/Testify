# coding: utf-8
require 'listen'
require 'recot/tasks'

module Recot
  module Commands
    class Listener

      def initialize(ignore = nil)
        @path = "#{Dir.pwd}/#{BASKET_DIR}"
      end

      def run
        @listener = ::Listen.to(@path) do |mod, add, del|
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
        Recot::Tasks::SyncTask.new.run
      end

      def stop
        @listener.stop
      end
    end
  end
end
