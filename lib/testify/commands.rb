# coding: utf-8

require 'testify/commands/rack_server'
require 'testify/commands/guard_server'
require 'testify/commands/interactive_ui'

module Testify
  module Commands

    # start testify
    def self.start
      # start guard server
      Thread.new do
        Testify::Commands::GuardServer.new.run
      end

      # start rack server
      Thread.new do
        Testify::Commands::RackServer.new.run
      end

      # start interactive operate
      Testify::Commands::InteractiveUi.new.start
    end

    # start server
    def self.server(port = nil)
      Testify::Commands::RackServer.new(port).run
    end

    # all clear
    def self.reset
    end
  end
end
