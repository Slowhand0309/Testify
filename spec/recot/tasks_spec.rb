# coding: utf-8
require 'spec_helper'

describe Recot::Tasks do

  it 'all_tasks' do
    size = Recot::Tasks::ALL_TASKS.size
    expect(size).not_to eq 0
  end
end
