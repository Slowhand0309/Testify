# coding: utf-8
require 'active_support'

module Recot
  module Cache

    CACHE_FILE = '.cahce'.freeze
    CACHE_KEY = 'current_number'.freeze

    class NumberCache

      def self.store(number)
        fcache = get_cache()
        fcache.write(CACHE_KEY, number)
      end

      def self.restore()
        fcache = get_cache()
        fcache.read(CACHE_KEY)
      end

      def self.clear()
        fcache = get_cache()
        fcache.clear
      end

      def self.get_cache()
        ActiveSupport::Cache::FileStore.new(CACHE_FILE)
      end
    end
  end
end
