# coding: utf-8
require 'singleton'

module Recot
  class Config
    include Singleton

    CONFIG_YML = 'config.yml'.freeze

    KEY_THEME = :theme.freeze
    KEY_PROJECT_NAME = :project_name.freeze

    def initialize
      # TODO read yml file
    end

    def theme
      # TODO get theme from config.yml
    end

    def project_name
      # TODO get project_name from config.yml
    end

  end
end
