# coding: utf-8
require 'fileutils'
require 'recot/cache/state_cache'
require 'recot/tasks/indexdoc_task'

module Recot
  module Commands
    class RecentCancel

      # Delete recent evidence resources.
      #
      # Set nil to cache after delete.
      def self.cancel
        # Get recent evidence from cache
        evidences = Recot::Cache::StateCache.restore_recent_evidence
        if evidences && !evidences.empty?
          # Get directory path.
          path = File.dirname(evidences.first)

          # Remove files.
          FileUtils.rm(evidences)

          # Check directory files count.
          if Dir.glob("#{path}/*").count == 0
            # Delete resource html file.
            no = Recot::Cache::StateCache.restore_no
            resdoc_path = "#{Recot.resources_dir}/#{no}.html"
            # Remove resource html file.
            FileUtils.rm(resdoc_path) if File.exist?(resdoc_path)
            # Update index html file.
            Recot::Tasks::IndexdocTask.new.run
          end
          # Set nil at recent evidence.
          Recot::Cache::StateCache.store_recent_evidence(nil)
        end
      end

    end
  end
end
