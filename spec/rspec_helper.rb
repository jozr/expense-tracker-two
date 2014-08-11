require 'rspec'
require 'pg'
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
    @test_expense1 = Expense.new({'name' => 'candy', 'cost' => 1, 'date' => '3/30'})
    @test_expense1.save
    @test_expense2 = Expense.new({'name' => 'guns', 'cost' => 1, 'date' => '3/31'})
    @test_expense2.save
    @test_category = Category.new({'name' => 'edible'})
    @test_category.save
    @test_organizer = Organizer.new({'category_id' => @test_category.id, 'expense_id' => @test_expense1.id})
    @test_organizer.save
end
