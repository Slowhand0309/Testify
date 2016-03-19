# coding: utf-8
$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'recot/commands/observer'
require 'recot/tasks'

class Executer
  extend Recot::Commands::Observer

  add_task Recot::Tasks::SyncTask.new
  
  def self.run(args = nil)
    notify(args)
  end
end

namespace :recot do
  desc 'Run tasks for recot'
  task :run do |t, args|
    Executer.run(args)
  end
end
