# coding: utf-8
require 'spec_helper'

describe Recot::Cache::NumberCache do

  before do
    Recot::Cache::NumberCache.clear()
  end

  after do
    Recot::Cache::NumberCache.clear()
  end

  it 'cache clear' do
    # store
    Recot::Cache::NumberCache.store(10)
    # clear
    Recot::Cache::NumberCache.clear()
    # restore
    no = Recot::Cache::NumberCache.restore()

    expect(no).to eq nil
  end

  it 'cache read and write' do
    # store
    Recot::Cache::NumberCache.store(999)
    # restore
    no = Recot::Cache::NumberCache.restore()

    expect(no).to eq 999
  end
end
