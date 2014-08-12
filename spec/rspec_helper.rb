require 'rspec'
require 'pg'
require 'date'
require 'expense'
require 'category'
require 'organizer'

DB = PG.connect({:dbname => 'expense_organizer_joz'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec('DELETE FROM expense *;')
    DB.exec('DELETE FROM category *;')
    DB.exec("DELETE FROM organizer *;")
  end
end

def create_test_objects
    @test_expense1 = Expense.new({'name' => 'candy', 'cost' => 1, 'date' => '8/30/2014'})
    @test_expense1.save
    @test_expense2 = Expense.new({'name' => 'guns', 'cost' => 1, 'date' => '8/31/2014'})
    @test_expense2.save
    @test_expense3 = Expense.new({'name' => 'tire', 'cost' => 20, 'date' => '1/2/2014'})
    @test_expense3.save
    @test_category = Category.new({'name' => 'edible', 'budget' => 20})
    @test_category.save
    @test_category_two = Category.new({'name' => 'non-edible', 'budget' => 40})
    @test_category_two.save
    @test_organizer = Organizer.new({'category_id' => @test_category_two.id, 'expense_id' => @test_expense1.id})
    @test_organizer.save
    @test_organizer2 = Organizer.new({'category_id' => @test_category_two.id, 'expense_id' => @test_expense2.id})
    @test_organizer2.save
    @test_organizer3 = Organizer.new({'category_id' => @test_category_two.id, 'expense_id' => @test_expense3.id})
    @test_organizer3.save
end
