# coding: utf-8
require 'spec_helper'

describe Recot::Utils::RecotUtil do

  before do
    # All clear.
    Recot::Utils::RecotUtil.remove
  end

  it 'prepare' do
    Recot::Utils::RecotUtil.prepare

    # Test file exist.
    expect(File.exist?(Recot.resources_dir)).to eql(true)
    expect(File.exist?(Recot.basket_dir)).to eql(true)
    expect(File.exist?(Recot.log_dir)).to eql(true)
    expect(File.exist?("#{Recot.output_dir}/css")).to eql(true)
    expect(File.exist?("#{Recot.output_dir}/js")).to eql(true)
    expect(File.exist?("#{Recot.output_dir}/images")).to eql(true)
  end

  it 'remove' do
    Recot::Utils::RecotUtil.prepare
    Recot::Utils::RecotUtil.remove

    # Test file exist.
    expect(File.exist?(Recot.resources_dir)).to eql(false)
    expect(File.exist?(Recot.basket_dir)).to eql(false)
    expect(File.exist?(Recot.log_dir)).to eql(false)
    expect(File.exist?("#{Recot.output_dir}/css")).to eql(false)
    expect(File.exist?("#{Recot.output_dir}/js")).to eql(false)
    expect(File.exist?("#{Recot.output_dir}/images")).to eql(false)
  end
end
