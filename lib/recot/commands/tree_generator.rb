# coding: utf-8
require 'fileutils'
require 'recot/cache/number_cache'

module Recot
  module Commands
    class TreeGenerator

      SPLIT_SEPARATOR = '-'.freeze

      def self.generate(test_no)
        # split
        no_dir = test_no.split(SPLIT_SEPARATOR).join('/')
        # generate test no tree
        path = "#{Dir.pwd}/#{OUTPUT_DIR}/#{no_dir}"
        unless File.exists?(path)
          FileUtils.mkdir_p(path)
          # cache current number
          Recot::Cache::NumberCache.store(test_no)
        end
      end
    end
  end
end
