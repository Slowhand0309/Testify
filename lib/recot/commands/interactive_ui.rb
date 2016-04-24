# coding: utf-8
require 'recot/utils/recot_util'
require 'recot/commands/recent_cancel'
require 'recot/commands/current_clear'
require 'recot/commands/tree_generator'

module Recot
  module Commands
    class InteractiveUi

      def initialize
      end

      def start
        print_banner

        count = 1
        loop do

          print "[#{count}](recot) > "
          input_str = STDIN.gets.chomp
          case input_str
          when /[Ee]xit/
            break
          when /[Cc]ancel/
            # Cancel recent evidence.
            RecentCancel.cancel
          when /[Cc]lear/
            # Clear current test no.
            CurrentClear.clear
          when /\d{1,3}(-\d{1,3})?(-\d{1,3})?/
            # Generate tree.
            TreeGenerator.generate(input_str)
          else
            # Continue...
          end
          count += 1
        end
      end

      def destroy
        loop do
          print "Sure you want to delete all the files? [y/N] > "
          input_str = STDIN.gets.chomp
          case input_str
          when /^y$/
            Utils::RecotUtil.remove
            puts "Removed all dependency files."
          else
          end
          break
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
