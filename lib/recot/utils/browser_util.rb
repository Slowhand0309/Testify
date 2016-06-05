# coding: utf-8

module Recot
  module Utils
    class BrowserUtil

      class << self

        # Open browser at argument url.
        #
        # == Parameters:
        # Server listen port.
        def open(port)

          url = "http://localhost:#{port}/__output/index.html"

          if RUBY_PLATFORM =~ /darwin/
            # Mac OS
            system "open #{url}"
          elsif RUBY_PLATFORM =~ /mswin(?!ce)|mingw|cygwin|bccwin/
            # Windows
            system "start #{url}"
          else
            puts "Unsupport platform of open browser."
          end
        end
      end
    end
  end
end
