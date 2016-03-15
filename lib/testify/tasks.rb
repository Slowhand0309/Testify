# coding: utf-8
require 'testify/tasks/base_task'
require 'testify/tasks/sync_task'
require 'testify/tasks/gen_tree_task'

module Testify
  module Tasks
    def self.all()
      %i(sync_task)
    end
  end
end
