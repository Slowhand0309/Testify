# coding: utf-8
require 'fileutils'
require 'recot/cache/number_cache'

module Recot
  module Tasks
    class GenTreeTask < BaseTask

      SPLIT_SEPARATOR = '-'.freeze

      def initialize(no, separator = SPLIT_SEPARATOR)
        @user_root = Dir.pwd
        @test_no = no
        @split_separator = separator
      end

      def run(args = nil)
        # split
        no_dir = @test_no.split(@split_separator).join('/')
        # generate test no tree
        path = "#{@user_root}/#{OUTPUT_DIR}/#{no_dir}"
        unless File.exists?(path)
          FileUtils.mkdir_p(path)
          # cache current number
          Recot::Cache::NumberCache.store(@test_no)
        end
      end
    end
  end
end
