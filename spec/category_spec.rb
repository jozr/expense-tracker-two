require 'category'
require 'rspec_helper'
require 'table_butler'
require 'pry'

describe Category do

  before do
    create_test_objects
  end

  it 'is initialized with a name' do
    expect(@test_category).to be_an_instance_of Category
  end

  it 'returns all saved categories' do
    expect(@test_category).to eq [@test_category]
  end

end
