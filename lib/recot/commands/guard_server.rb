# coding: utf-8
require 'guard/cli'

module Recot
  module Commands
    class GuardServer

      def initialize
        path = File.expand_path('../../../../', __FILE__)
        @guardfile = "#{path}/Guardfile"
        # setup guard ui options
        Guard::UI.options[:level] = :error
        Guard::UI.options[:template] = "guard error!! > :message"
      end

      def run
        @thread = start_guard
        Thread.new do
          loop do
            sleep 1
            @thread.wakeup
          end
        end
      end

      def start_guard
        Thread.new do
          Guard.start(
            guardfile: @guardfile,
            no_interactions: true)
        end
      end

    end
  end
end
