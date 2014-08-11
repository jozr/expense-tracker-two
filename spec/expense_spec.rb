require 'expense'
require 'rspec_helper'
require 'table_butler'
require 'pry'

describe Expense do

  before do
    create_test_objects
  end

  it 'is initialized with a name, cost, and date' do
    expect(@test_expense1).to be_an_instance_of Expense
  end

  it 'returns all saved expenses' do
    expect(@test_expense1).to eq [@test_expense1]
  end

  it 'returns the total of all the expenses' do
    Expense.total.should eq 2
  end
end
