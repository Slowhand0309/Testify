# coding: utf-8
require 'active_support'

module Recot
  module Cache

    class StateCache

      # Cache directory name.
      CACHE_FILE = '.cahce'.freeze

      # Key of current test no.
      CACHE_KEY_NO = 'current_number'.freeze

      # Key of recent evidence file name.
      CACHE_KEY_RECENT_EVIDENCE = 'recent_evidence'.freeze

      class << self

        # Store current test no to cache.
        #
        # == Parameters:
        # Test no for cache.
        def store_no(number)
          fcache = get_cache()
          fcache.write(CACHE_KEY_NO, number)
        end

        # Get cached current test no.
        #
        # == Returns:
        # Current test no.
        def restore_no()
          fcache = get_cache()
          fcache.read(CACHE_KEY_NO)
        end

        # Store recent evidence to cache.
        #
        # == Parameters:
        # evidence file name.
        def store_recent_evidence(evidence)
          fcache = get_cache()
          fcache.write(CACHE_KEY_RECENT_EVIDENCE, evidence)
        end

        # Get cached recent evidence.
        #
        # == Returns:
        # evidence file name.
        def restore_recent_evidence()
          fcache = get_cache()
          fcache.read(CACHE_KEY_RECENT_EVIDENCE)
        end

        # All clear cache.
        #
        def clear()
          fcache = get_cache()
          fcache.clear
        end

        # Get cache object.
        #
        # == Returns:
        # ActiveSupport::Cache object.
        def get_cache()
          ActiveSupport::Cache::FileStore.new(CACHE_FILE)
        end
      end

    end
  end
end
