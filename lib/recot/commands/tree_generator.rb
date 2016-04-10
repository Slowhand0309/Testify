# coding: utf-8
require 'fileutils'
require 'recot/cache/state_cache'

module Recot
  module Commands
    class TreeGenerator

      def self.generate(test_no)
        # generate test no tree
        path = "#{Recot.resources_dir}/#{test_no}"
        unless File.exists?(path)
          FileUtils.mkdir_p(path)
          # cache current number
          Recot::Cache::StateCache.store_no(test_no)
        end
      end
    end
  end
end
