# coding: utf-8
require 'recot/commands/tree_generator'

module Recot
  module Commands
    class InteractiveUi

      def initialize
      end

      def start
        print_banner()

        count = 1
        loop do

          print "[#{count}](recot) > "
          input_str = STDIN.gets.chomp
          case input_str
          when /[Ee]xit/
            break
          when /\d{1,3}(-\d{1,3})?(-\d{1,3})?/
            # generate tree
            TreeGenerator.generate(input_str)
          else
            # continue...
          end
          count += 1
        end
      end

      def print_banner
        puts "Start recot ver #{Recot::VERSION}"
        puts ""
        puts '    ____                  __'
        puts '   / __ \___  _________  / /'
        puts '  / /_/ / _ \/ ___/ __ \/ __/'
        puts ' / _, _/  __/ /__/ /_/ / /'
        puts '/_/ |_|\___/\___/\____/\__/'
        puts ""
      end
    end
  end
end
