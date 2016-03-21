# coding: utf-8
require 'recot/tasks/base_task'
require 'recot/tasks/sync_task'

module Recot
  module Tasks
    def self.all()
      %i(sync_task)
    end
  end
end
