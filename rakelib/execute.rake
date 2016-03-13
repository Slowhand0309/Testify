# coding: utf-8
$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'testify/commands/observer'

class Executer
  extend Testify::Commands::Observer

  def self.run(args = nil)
    setup()

    # add tasks
    
    notify(args)
  end
end

namespace :testify do
  desc 'Run tasks for testify'
  task :run do |t, args|
    puts "t:#{t}, args:#{args}"
    Executer.run(args)
  end
end
