# coding: utf-8
require 'axlsx'
require 'recot/config'

module Recot
  module Utils
    class ExportUtil

      IMAGE_SIZE_WIDTH = 512
      IMAGE_SIZE_HEIGHT = 512
      IMAGE_SIZE_ROWS = 25

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

          puts "Export Success!!"
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
              #images = Dir::entries(d).select{|e| File::ftype("#{d}/#{e}") == 'file'}
              images = []
              Dir::entries(d).each do |e|
                path = "#{d}/#{e}"
                images << path if File::ftype(path) == 'file'
              end
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

            # Add worksheet.
            wb.add_worksheet(:name => no) do |sheet|

              evi.each_with_index do |e, index|
                sheet.add_row [File.basename(e)]
                sheet.column_info.first.width = 5

                # Add images.
                sheet.add_image(:image_src => e, :noSelect => true, :noMove => true) do |image|
                  image.width = IMAGE_SIZE_WIDTH
                  image.height = IMAGE_SIZE_HEIGHT
                  image.start_at 1, 1 + index * IMAGE_SIZE_ROWS

                end
                (IMAGE_SIZE_ROWS - 1).times {
                  sheet.add_row
                }

              end
            end

          end
          p.serialize(filename)
        end
      end

    end
  end
end
