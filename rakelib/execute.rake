# coding: utf-8
$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'recot/commands/observer'

class Executer
  extend Recot::Commands::Observer

  def self.run(args = nil)
    setup()

    # add tasks

    notify(args)
  end
end

namespace :recot do
  desc 'Run tasks for recot'
  task :run do |t, args|
    Executer.run(args)
  end
end
