# coding: utf-8
require 'clipboard'

module Recot
  module Utils
    class ClipboardUtil

      class << self

        # Output file from clipboard.
        #
        # == Parameters:
        # A file name
        def paste_out(filename)

          text = Clipboard.paste
          unless text.to_s.empty?
            path = "#{Recot.basket_dir}/#{filename}"
            open(path, 'w') do |f|
              f.write text
            end
          else
            puts "\e[31mClipboard empty!\e[0m"
          end
        end

      end
    end
  end
end
