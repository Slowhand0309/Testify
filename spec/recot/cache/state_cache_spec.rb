# coding: utf-8
require 'spec_helper'

describe Recot::Cache::StateCache do

  before do
    Recot::Cache::StateCache.clear()
  end

  after do
    Recot::Cache::StateCache.clear()
  end

  it 'cache clear' do
    # Store
    Recot::Cache::StateCache.store_no(10)
    # Clear
    Recot::Cache::StateCache.clear()
    # Restore
    no = Recot::Cache::StateCache.restore_no()

    expect(no).to eq nil
  end

  it 'cache read and write no' do
    # Store
    Recot::Cache::StateCache.store_no(999)
    # Restore
    no = Recot::Cache::StateCache.restore_no()

    expect(no).to eq 999
  end

  it 'cache read and write recent evidence' do
    # Store
    Recot::Cache::StateCache.store_recent_evidence('banana')
    # Restore
    evidence = Recot::Cache::StateCache.restore_recent_evidence()

    expect(evidence).to eq 'banana'
  end
end
