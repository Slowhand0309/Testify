# coding: utf-8
require 'recot/config'
require 'recot/commands/rack_server'
require 'recot/commands/guard_server'
require 'recot/commands/interactive_ui'
require 'recot/commands/listener'
require 'recot/utils/recot_util'

module Recot
  module Commands

    # Start recot.
    #
    def self.start

      # Prepare.
      Utils::RecotUtil.prepare

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
    def self.destroy
      InteractiveUi.new.destroy
    end
  end
end
