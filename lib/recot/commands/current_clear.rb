# coding: utf-8
require 'fileutils'
require 'recot/cache/state_cache'
require 'recot/tasks/indexdoc_task'

module Recot
  module Commands
    class CurrentClear

      # Clear current test no resources.
      #
      # Set nil to cache after delete resources.
      def self.clear
        # Get current test no.
        test_no = Recot::Cache::StateCache.restore_no
        if test_no
          # Delete resource directory.
          FileUtils.rm_r("#{Recot.resources_dir}/#{test_no}")

          # Delete resource html file.
          FileUtils.rm("#{Recot.resources_dir}/#{test_no}.html")

          # Update index html file.
          Recot::Tasks::IndexdocTask.new.run

          Recot::Cache::StateCache.store_no(nil)
        end
      end

    end
  end
end
