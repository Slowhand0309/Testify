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
    # == Parameters:
    # Server listen port.
    def self.start(port = nil)

      # Prepare.
      Utils::RecotUtil.prepare

      # Start guard server.
      GuardServer.new.run

      # Start rack server.
      Thread.new do
        RackServer.new(port).run
      end

      # Start listener.
      Listener.new.run

      # Start interactive operate.
      InteractiveUi.new.start
    end

    # All clear.
    #
    def self.destroy
      InteractiveUi.new.destroy
    end
  end
end
