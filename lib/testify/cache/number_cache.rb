# coding: utf-8
require 'active_support'

module Testify
  module Cache

    CACHE_FILE = '.cahce'.freeze
    CACHE_KEY = 'current_number'.freeze

    class NumberCache

      def self.store(number)
        fcache = ActiveSupport::Cache::FileStore.new(CACHE_FILE)
        fcache.write(CACHE_KEY, number)
      end

      def self.restore()
        fcache = ActiveSupport::Cache::FileStore.new(CACHE_FILE)
        fcache.read(CACHE_KEY)
      end

    end
  end
end
