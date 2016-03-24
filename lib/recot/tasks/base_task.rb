# coding: utf-8

module Recot
  module Tasks

    class BaseTask

      def initialize
        @user_root = Dir.pwd
      end

      def run(args = nil)
      end

protected

      # Get current evidence path.
      #
      # == Returns:
      # A string of evidence path.
      # If not cached test no return empty string.
      def evidence_path()
        test_no = Recot::Cache::StateCache.restore_no
        unless test_no
          return "" # return empty string
        end
        "#{Recot.resources_dir}/#{test_no}"
      end
    end
  end
end
