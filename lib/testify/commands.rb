# coding: utf-8

require 'testify/commands/server'
require 'testify/commands/interactive_ui'

module Testify
  module Commands

    # start testify
    def self.start
      Thread.new do
        Testify::Commands::Server.new.run
      end
      # start interactive operate
      Testify::Commands::InteractiveUi.new.start
    end

    # start server
    def self.server(port = nil)
      Testify::Commands::Server.new(port).run
    end

    # all clear
    def self.reset
    end
  end
end
