# coding: utf-8
require 'fileutils'
require 'recot/cache/number_cache'

# TODO sync work dir to __output dir
module Recot
  module Tasks
    class SyncTask < BaseTask

      SEPARATOR = '/'.freeze

      def initialize()
        super
      end

      def run(args = nil)
        # read current test number from cache
        test_no = Recot::Cache::NumberCache.restore
        path = "#{@user_root}/#{OUTPUT_DIR}/#{test_no}"
        unless File.exist?(path)
          $stderr.puts "unkown #{path} directory."
        else
          move(path)
        end
      end
      
private
      def move(path)
        # move all
        FileUtils.mv(Dir.glob("#{@user_root}/#{BASKET_DIR}/*"),"#{path}/")
      end

    end
  end
end
