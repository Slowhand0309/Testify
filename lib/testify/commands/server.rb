# coding: utf-8
require 'rack'
require 'rack/livereload'

module Testify
  module Commands
    class Server

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
        Rack::Server.new(app: rack_app, port: @port).start
      end
    end
  end
end
