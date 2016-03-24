# coding: utf-8
require 'fileutils'
require 'recot/cache/state_cache'

# TODO sync work dir to __output dir
module Recot
  module Tasks
    class SyncTask < BaseTask

      SEPARATOR = '/'.freeze

      def initialize()
        super
      end

      def run(args = nil)
        # get evidence path
        path = evidence_path()
        unless File.exist?(path)
          $stderr.puts "unkown #{path} directory."
        else
          move(path)
        end
      end

private
      def move(path)
        # move all
        FileUtils.mv(Dir.glob("#{Recot.basket_dir}/*"),"#{path}/")
      end

    end
  end
end
