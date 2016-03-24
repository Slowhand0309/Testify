# coding: utf-8
require 'fileutils'
require 'recot/cache/state_cache'

module Recot
  module Commands
    class TreeGenerator

      SPLIT_SEPARATOR = '-'.freeze

      def self.generate(test_no)
        # split
        no_dir = test_no.split(SPLIT_SEPARATOR).join('/')
        # generate test no tree
        path = "#{Recot.resources_dir}/#{no_dir}"
        unless File.exists?(path)
          FileUtils.mkdir_p(path)
          # cache current number
          Recot::Cache::StateCache.store_no(test_no)
        end
      end
    end
  end
end
