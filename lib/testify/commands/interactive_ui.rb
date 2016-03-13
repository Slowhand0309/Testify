# coding: utf-8

module Testify
  module Commands
    class InteractiveUi

      def initialize
      end

      def start
        print_banner()

        count = 1
        loop do

          print "[#{count}](testify) > "
          input_str = STDIN.gets.chomp
          case input_str
          when /[Ee]xit/
            break
          when /\d{1,3}(-\d{1,3})?(-\d{1,3})?/
            puts "match number"
          else
            # continue...
          end
          count += 1
        end
      end

      def print_banner
        puts "Start testify ver #{Testify::VERSION}"
        puts ""
        puts '    ______          __  _ ____'
        puts '   /_  __/__  _____/ /_(_) __/_  __'
        puts '    / / / _ \/ ___/ __/ / /_/ / / /'
        puts '   / / /  __(__  ) /_/ / __/ /_/ /'
        puts '  /_/  \___/____/\__/_/_/  \__, /'
        puts '                          /____/'
        puts ""
      end

    end
  end
end
