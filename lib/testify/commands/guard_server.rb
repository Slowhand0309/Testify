# coding: utf-8
require 'guard/cli'

module Testify
  module Commands
    class GuardServer

      def initialize
      end

      def run
        guardfile = "#{File.expand_path('../../../../', __FILE__)}/Guardfile"
        Guard.start(
          guardfile: guardfile,
          no_interactions: true)
      end

    end
  end
end
