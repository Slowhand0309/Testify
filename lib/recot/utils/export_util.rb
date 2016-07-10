# coding: utf-8
require 'axlsx'
require 'recot/config'

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
          evidences = {}
          Dir::glob("#{Recot.resources_dir}/*").each do |d|
            if File::ftype(d) == "directory"
              images = Dir::entries(d).select{|e| File::ftype("#{d}/#{e}") == 'file'}
              evidences[File.basename(d)] = images
            end
          end
          # Generate spreadsheet
          name = Config.instance.project_name
          name = 'recot' if name.empty?
          to_spreadsheet("#{name}.xlsx", evidences)
        end

        # Export spreadsheet.
        #
        # == Parameters:
        # A spreadsheet file name
        def to_spreadsheet(filename, evidences)
          p = Axlsx::Package.new
          wb = p.workbook

          # Loop all evidences.
          evidences.each do |no, evi|
            # Pie Chart
              wb.add_worksheet(:name => no) do |sheet|
                # TODO to debug
                sheet.add_row ["First", "Second", "Third", "Fourth"]
                sheet.add_row [1, 2, 3, 4]
              end
          end
          p.serialize(filename)
        end
      end

    end
  end
end
