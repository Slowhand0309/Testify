# coding: utf-8
require 'singleton'

module Recot
  class Config
    include Singleton

    CONFIG_YML = 'config.yml'.freeze

    KEY_THEME = 'theme'.freeze
    KEY_PROJECT_NAME = 'project_name'.freeze

    DEFAULT_THEME = 'white'.freeze

    def initialize
      # read config.yml file
      @config = nil
      if File.exist?("#{Dir.pwd}/#{CONFIG_YML}")
        @config = YAML.load_file("#{Dir.pwd}/#{CONFIG_YML}")
      end
    end

    # Get theme from config.yml.
    #
    # == Returns:
    # A theme of html. If not set return 'white'.
    def theme
      th = DEFAULT_THEME
      if @config && @config[KEY_THEME]
        th = @config[KEY_THEME]
      end
      th
    end

    # Get project_name from config.yml.
    #
    # == Returns:
    # A project_name. If not set return empty.
    def project_name
      name = ''
      if @config && @config[KEY_PROJECT_NAME]
        name = @config[KEY_PROJECT_NAME]
      end
      name
    end

  end
end
