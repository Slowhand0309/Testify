# coding: utf-8

module Recot
  module Tasks

    class BaseTask

      def initialize
        @user_root = Dir.pwd
      end

      def run(args = nil)
      end

    end
  end
end
