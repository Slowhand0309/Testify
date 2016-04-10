# coding: utf-8
require 'recot/config'
require 'recot/tasks/base_task'
require 'recot/cache/state_cache'
require 'recot/render/html_renderer'

module Recot
  module Tasks

    # Generate resources html file task.
    class ResdocTask < BaseTask

      # Path of resdoc template.
      RESDOC_TEMPLATE = "#{Dir.pwd}/template/resdoc.html.erb".freeze

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
          files << relative_path_from_resource(f)
        end

        # Set the data hash object.
        data = {}
        data[:title] = get_testno()
        data[:files] = files
        data[:theme] = Config.instance.theme
        data[:version] = Recot::VERSION

        # Render
        Recot::Render::HtmlRenderer.new.render_doc(RESDOC_TEMPLATE, resdoc_path, data)
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
