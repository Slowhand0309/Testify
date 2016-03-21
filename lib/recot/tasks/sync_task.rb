# coding: utf-8
require 'fileutils'
require 'recot/cache/number_cache'

# TODO sync work dir to __output dir
module Recot
  module Tasks
    class SyncTask < BaseTask

      SEPARATOR = '/'.freeze

      def initialize()
        @user_root = Dir.pwd
      end

      def run(args = nil)
        # read current test number from cache
        test_no = Recot::Cache::NumberCache.restore
        path = "#{@user_root}/#{OUTPUT_DIR}/#{test_no}"
        unless File.exist?(path)
          $stderr.puts "unkown #{path} directory."
        else
          copy(path)
        end
      end

      def copy(path)
        # copy all
        FileUtils.cp_r(Dir.glob("#{@user_root}/#{BASKET_DIR}/*"),"#{path}/")
      end

    end
  end
end
