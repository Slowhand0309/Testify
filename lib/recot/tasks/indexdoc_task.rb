# coding: utf-8
require 'recot/tasks/base_task'

module Recot
  module Tasks

    # Task for update index.html.
    class IndexdocTask < BaseTask

      INDEX_HTML = 'index.html'.freeze

      def run(args = nil)
        generate(args)
      end

private

      # Generate index html file.
      #
      # == Parameters:
      # Arguments of index files.
      def generate(args)

        # Get resource html files.
        files = []
        Dir::glob("#{Recot.resources_dir}/*.html").each do |f|
          # Create evidence file path.
          files << f
        end

        # Set the data hash object.
        data = {}
        data[:title] = 'test'
        data[:resources] = files

        # Render
        Recot::Render::HtmlRender.new.render_indexdoc(data, index_path)
      end

      def index_path
        "#{Recot.output_dir}/#{INDEX_HTML}"
      end

    end
  end
end
