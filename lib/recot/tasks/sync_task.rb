# coding: utf-8
require 'fileutils'
require 'recot/tasks/base_task'
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
        files = Dir.glob("#{Recot.basket_dir}/*")
        # move all
        FileUtils.mv(files, "#{path}/")

        # Cached evidence files
        cache_files = []
        files.each do |f|
          cache_files << "#{path}/#{File.basename(f)}"
        end
        Recot::Cache::StateCache.store_recent_evidence(cache_files)
      end

    end
  end
end
