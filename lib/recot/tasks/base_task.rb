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

      # Get Current test no.
      #
      # == Returns:
      # Number of test.
      # If not cached test no return empty string.
      def get_testno()
        test_no = Recot::Cache::StateCache.restore_no
        unless test_no
          return "" # return empty string
        end
        test_no
      end

      # Get current evidence path.
      #
      # == Returns:
      # A string of evidence path.
      def evidence_path()
        "#{Recot.resources_dir}/#{get_testno}"
      end

      # Get relative path from __output.
      #
      # == Returns:
      # Relative path from __output.
      def relative_path_from_output(path)
        path.gsub("#{Dir.pwd}/__output/", '')
      end

      # Get relative path from resource.
      #
      # == Returns:
      # Relative path from resource.
      def relative_path_from_resource(path)
        path.gsub("#{Dir.pwd}/__output/resources/", '')
      end
    end
  end
end
