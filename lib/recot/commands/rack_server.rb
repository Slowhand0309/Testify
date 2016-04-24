# coding: utf-8
require 'rack'
require 'rack/livereload'
require 'logger'

module Recot
  module Commands
    class RackServer

      DEF_PORT = 9292

      def initialize(port = nil)
        @port = port
        @port ||= DEF_PORT
      end

      def run
        rack_app = Rack::Builder.new do
          use Rack::LiveReload
          run Rack::Directory.new('.')
        end

        # run rack server
        Rack::Server.new(
          app: rack_app,
          Port: @port,
          Logger: server_logger,
          AccessLog: server_logger).start
      end

      def server_logger
        Logger.new("#{Recot.log_dir}/access.log")
      end

    end
  end
end
