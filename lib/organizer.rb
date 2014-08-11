require 'table_butler'
require 'pry'

class Organizer < Table_Butler

attr_accessor:category_id, :expense_id, :id, :total

  def return_expenses(category_id_input)
    results = DB.exec("SELECT * FROM organizer WHERE category_id = '#{category_id_input}';")
    expenses_names = []
    results.each do |result|
      expense = result['expense_id'].to_i
      expense_names = DB.exec("SELECT * FROM expense WHERE id = (#{expense});")
      expense_names.each do |name|
        name = name['name']
        expenses_names << name
      end
    end
  expenses_names
  end

  def return_category_total(category_id_input)
    results = DB.exec("SELECT * FROM organizer WHERE category_id = '#{category_id_input}';")
    total = 0
    results.each do |result|
      expense = result['expense_id'].to_i
      expense_costs = DB.exec("SELECT * FROM expense WHERE id = (#{expense});")
      expense_costs.each do |cost|
        cost = cost['cost'].to_i
        total += cost
      end
    end
  @total = total
  end

  def percent_of_cost(category_id_input)
    return_category_total(category_id_input)
    percentage = @total / Expense.total.to_f
    percentage
  end
end
