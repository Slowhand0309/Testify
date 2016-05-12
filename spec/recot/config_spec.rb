# coding: utf-8
require 'spec_helper'

describe Recot::Config do

  it 'default theme' do
    theme = Recot::Config.instance.theme
    expect(theme).to eq 'white'
  end

  it 'default project name' do
    name = Recot::Config.instance.project_name
    expect(name).to eq ''
  end
end
