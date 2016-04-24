# coding: utf-8
require 'fileutils'
require 'recot/cache/state_cache'

module Recot
  module Utils
    class RecotUtil

      ROOT_DIR = "#{File.expand_path('../../../../', __FILE__)}".freeze
      CSS_TEMPLATE_DIR = "#{ROOT_DIR}/template/css".freeze
      JS_TEMPLATE_DIR = "#{ROOT_DIR}/template/js".freeze
      IMAGES_TEMPLATE_DIR = "#{ROOT_DIR}/template/images".freeze

      class << self

        # Prepare for recot.
        #
        # Create directory.
        # * __output/resource
        # * basket
        # * log
        #
        # Copy css files.
        # Remove if exist log file.
        def prepare()
          # Create '__output/resource' directory.
          unless File.exist?(Recot.resources_dir)
            FileUtils.mkdir_p(Recot.resources_dir)
          end

          # Create 'basket' directory.
          unless File.exist?(Recot.basket_dir)
            FileUtils.mkdir_p(Recot.basket_dir)
          end

          # Remove 'log' directory.
          if File.exist?(Recot.log_dir)
            FileUtils.rm_r(Recot.log_dir)
          end

          # Create 'log' directory.
          FileUtils.mkdir("#{Dir.pwd}/log")

          # Copy css files.
          unless File.exist?("#{Recot.output_dir}/css")
            FileUtils.cp_r(CSS_TEMPLATE_DIR, Recot.output_dir)
          end

          # Copy js files.
          unless File.exist?("#{Recot.output_dir}/js")
            FileUtils.cp_r(JS_TEMPLATE_DIR, Recot.output_dir)
          end

          # Copy images files.
          unless File.exist?("#{Recot.output_dir}/images")
            FileUtils.cp_r(IMAGES_TEMPLATE_DIR, Recot.output_dir)
          end
        end

        # Remove all dependency files.
        #
        # * __output
        # * __output/resource
        # * __output/css
        # * basket
        # * log
        def remove()
          # Remove '__output' directory.
          if File.exist?(Recot.output_dir)
            FileUtils.rm_r(Recot.output_dir)
          end

          # Remove 'basket' directory.
          if File.exist?(Recot.basket_dir)
            FileUtils.rm_r(Recot.basket_dir)
          end

          # Remove 'log' directory.
          if File.exist?(Recot.log_dir)
            FileUtils.rm_r(Recot.log_dir)
          end

          # Remove cache.
          Cache::StateCache.clear
        end

      end
    end
  end
end
