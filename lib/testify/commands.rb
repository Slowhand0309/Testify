# coding: utf-8

require 'testify/commands/rack_server'
require 'testify/commands/guard_server'
require 'testify/commands/interactive_ui'

module Testify
  module Commands

    # start testify
    def self.start
      # start guard server
      GuardServer.new.run

      # start rack server
      Thread.new do
        RackServer.new.run
      end

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
