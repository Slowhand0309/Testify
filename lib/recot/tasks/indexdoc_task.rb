# coding: utf-8
require 'recot/config'
require 'recot/tasks/base_task'

module Recot
  module Tasks

    # Task for update index.html.
    class IndexdocTask < BaseTask

      # Path of indexdoc template.
      INDEXDOC_TEMPLATE = "#{Dir.pwd}/template/index.html.erb".freeze

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
          files << relative_path_from_output(f)
        end

        # Set the data hash object.
        data = {}
        data[:title] = Config.instance.project_name
        data[:theme] = Config.instance.theme
        data[:resources] = files
        data[:version] = Recot::VERSION

        # Render
        Recot::Render::HtmlRenderer.new.render_doc(INDEXDOC_TEMPLATE, index_path, data)
      end

      def index_path
        "#{Recot.output_dir}/#{INDEX_HTML}"
      end

    end
  end
end
