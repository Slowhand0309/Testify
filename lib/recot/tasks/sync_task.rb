# coding: utf-8

# TODO sync work dir to __output dir
module Recot
  module Tasks
    class SyncTask < BaseTask

      SEPARATOR = '/'.freeze

      def initialize(path, filename)
        @path = path
        @filename = filename
      end

      def run()
        fullpath = "#{@path}/#{@filename}"
        unless File.exist?(fullpath)
        end
      end

    end
  end
end
