# coding: utf-8

require 'recot/commands/rack_server'
require 'recot/commands/guard_server'
require 'recot/commands/interactive_ui'
require 'recot/commands/listener'

module Recot
  module Commands

    # start recot
    def self.start
      # start guard server
      GuardServer.new.run

      # start rack server
      Thread.new do
        RackServer.new.run
      end

      # start listener
      Listener.new.run
      
      # start interactive operate
      InteractiveUi.new.start
    end

    # start server
    def self.server(port = nil)
      RackServer.new(port).run
    end

    # all clear
    def self.reset
    end
  end
end
