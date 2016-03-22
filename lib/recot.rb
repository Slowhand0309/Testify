# coding: utf-8
require 'recot/version'
require 'recot/commands'
require 'recot/tasks'

module Recot

  # Generate files directory name.
  OUTPUT_DIR = '__output'.freeze

  # Throw evidence directory name.
  BASKET_DIR = 'basket'.freeze

  # Resource files directory name.
  RESOURCE_DIR = 'resources'.freeze

  class << self

    # Get output directory path.
    #
    # == Returns:
    # A string of output directory path.
    def output_dir()
      "#{Dir.pwd}/#{OUTPUT_DIR}"
    end

    # Get resources directory path.
    #
    # == Returns:
    # A string of resources directory path.
    def resources_dir()
      "#{output_dir}/#{RESOURCE_DIR}"
    end

    # Get basket directory path.
    #
    # == Returns:
    # A string of basket directory path.
    def basket_dir()
      "#{Dir.pwd}/#{BASKET_DIR}"
    end
  end

end
