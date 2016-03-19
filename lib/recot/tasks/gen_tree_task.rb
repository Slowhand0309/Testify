# coding: utf-8
require 'fileutils'

module Recot
  module Tasks
    class GenTreeTask < BaseTask

      SPLIT_SEPARATOR = '-'.freeze

      def initialize(no, separator = SPLIT_SEPARATOR)
        @user_root = Dir.pwd
        @test_no = no
        @split_separator = separator
      end

      def run
        # split
        no_dir = @test_no.split(@split_separator).join('/')
        # generate test no tree
        path = "#{@user_root}/#{OUTPUT_DIR}/#{no_dir}"
        unless File.exists?(path)
          FileUtils.mkdir_p(path)
        end
      end
    end
  end
end
