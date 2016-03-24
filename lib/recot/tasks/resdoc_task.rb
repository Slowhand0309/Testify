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
        unless valid_state?(args)
          $stderr.puts "invalid state. files #{args}"
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

        # Get resource files.
        files = []
        Dir::glob("#{evidence_path}/*").each do |f|
          # Create evidence file path.
          files << f
        end

        # Set the data hash object.
        data = {}
        data[:title] = get_testno()
        data[:files] = files

        # Render
        Recot::Render::HtmlRender.new.render_resdoc(data, resdoc_path)
      end

      def gen_resdir
        unless File.exist?()
        end
      end

      # Get resource doc html path.
      #
      # == Returns:
      # A path of resdoc. If not cached return 'unkown.html'.
      def resdoc_path()
        "#{evidence_path}.html"
      end

      # Check args and test no.
      #
      # == Parameters:
      # Arguments array object.
      #
      # == Returns:
      # True if valid state.
      def valid_state?(args)
        no = test_no = Recot::Cache::StateCache.restore_no
        no && args && args.size > 0
      end
    end
  end
end
