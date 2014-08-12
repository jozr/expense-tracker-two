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
      expense_date = result['date']
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

  def monthly_cost(category_id_input)
    category_expenses = return_expenses(category_id_input)
    expense_dates = Expense.return_by_dates(Date.civil(Date.today.year, Date.today.month, 1), Date.civil(Date.today.year, Date.today.month, -1))
    names = category_expenses & expense_dates
    costs = []
    final_objects = []
    names.each do |name|
      final_objects << DB.exec("SELECT * FROM expense WHERE name = '#{name}'")
    end
    final_objects.each do |object|
      costs << object.first['cost'].to_i
    end
    counter = 0
    costs.each {|cost| counter += cost}
    counter
  end

end
