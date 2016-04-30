# coding: utf-8
require 'recot/config'
require 'recot/commands/rack_server'
require 'recot/commands/guard_server'
require 'recot/commands/interactive_ui'
require 'recot/commands/listener'
require 'recot/utils/recot_util'
require 'recot/utils/browser_util'

module Recot
  module Commands

    # Start recot.
    #
    # == Parameters:
    # Server listen port.
    def self.start(port, open)

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

      # Open browser.
      if open
        Utils::BrowserUtil.open(port)
      end

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
