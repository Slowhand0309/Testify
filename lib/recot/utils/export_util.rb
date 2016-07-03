# coding: utf-8
require 'axlsx'

module Recot
  module Utils
    class ExportUtil

      class << self

        # Execute export.
        #
        # == Parameters:
        # Export format.
        def execute(format)
          puts "\e[33mExport resources [format: #{format}]\e[0m"
          unless validate
            # invalid
            puts "\e[31mResources not found!\e[0m"
            return
          end

          # Fetch resoures.
          fetch
        end

        # Validate for export.
        #
        # == Returns:
        # True if normal, False if invalid.
        def validate

          # Check __output directory.
          unless File.exist?(Recot.output_dir)
            return false
          end

          # Check __output/resources
          unless File.exist?(Recot.resources_dir)
            return false
          end
          return true
        end

        # Fetch output resources.
        def fetch
          Dir::glob("#{Recot.resources_dir}/*").each do |d|
            if File::ftype(d) == "directory"
              puts d
            end
          end
        end

        # Export spreadsheet.
        #
        # == Parameters:
        # A spreadsheet file name
        def to_spreadsheet(filename)
        end
      end

    end
  end
end
