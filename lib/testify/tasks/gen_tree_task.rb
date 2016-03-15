# coding: utf-8
require 'fileutils'

module Testify
  module Tasks
    class GenTreeTask < BaseTask

      OUTPUT_DIR = '__output'.freeze
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
