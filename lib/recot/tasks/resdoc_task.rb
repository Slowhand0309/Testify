# coding: utf-8
require 'recot/render/html_render'

module Recot
  module Tasks

    # Generate resources html file task.
    class ResdocTask < BaseTask

      # Run the resdoc task.
      #
      # == Parameters:
      # Arguments of resource files.
      def run(args)
        unless valid_args?(args)
          $stderr.puts "invalid argument #{args}"
        else
          generate(args)
        end
      end

private

      # Generate resource html file.
      #
      # == Parameters:
      # Arguments of resource files.
      def generate(args)
        args.each do |f|
          # Set the data hash object.
          data = {}
          # Create evidence file path
          base_name = File.basename(f)
          data[:base_name] = base_name
          data[:title] = base_name

          # Path of evidence
          path = "#{evidence_path}/#{base_name}"
          data[:evidence_path] = path

          # Render
          Recot::Render::HtmlRender.new.render_resdoc(data, resdoc_path)
        end
      end

      def gen_resdir
        unless File.exist?()
        end
      end

      # Get resource doc html path.
      #
      # == Returns:
      # A path of resdoc. If not cached return 'unkown.html'.
      def resdoc_path
        test_no = Recot::Cache::StateCache.restore_no
        test_no ||= 'unkown'

        "#{Recot.resources_dir}/#{test_no}.html"
      end

      # Check args valid.
      #
      # == Parameters:
      # Arguments array object.
      #
      # == Returns:
      # True if valid argument.
      def valid_args?(args)
        args && args.size > 0
      end
    end
  end
end
