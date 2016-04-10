# coding: utf-8
require 'recot/config'
require 'recot/commands/rack_server'
require 'recot/commands/guard_server'
require 'recot/commands/interactive_ui'
require 'recot/commands/listener'

module Recot
  module Commands

    # Start recot.
    #
    def self.start

      # Start guard server.
      GuardServer.new.run

      # Start rack server.
      Thread.new do
        RackServer.new.run
      end

      # Start listener.
      Listener.new.run

      # Start interactive operate.
      InteractiveUi.new.start
    end

    # Start server.
    #
    def self.server(port = nil)
      RackServer.new(port).run
    end

    # All clear.
    #
    def self.reset
    end
  end
end
