# coding: utf-8

module Recot
  module Utils
    class ScreencapUtil

      class << self

        # Capture full screen.
        #
        # == Parameters:
        # Output filename
        def capture(filename)

          if RUBY_PLATFORM =~ /darwin/
            # Mac OS
            system("screencapture -x basket/#{filename}")
          elsif RUBY_PLATFORM =~ /mswin(?!ce)|mingw|cygwin|bccwin/
            # Windows
          else
            puts "Unsupport platform of screencapture."
          end
        end
      end
    end
  end
end
