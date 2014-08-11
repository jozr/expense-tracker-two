require 'table_butler'
require 'pry'
require 'chronic'

class Expense < Table_Butler

attr_accessor:name, :cost, :date, :id

  def self.total
    results = DB.exec("SELECT * FROM expense;")
    total = 0
      results.each do |result|
        cost = result['cost'].to_i
        total += cost
      end
    total
  end

  def self.return_by_dates(start_date, end_date)
    results = DB.exec("SELECT * FROM expense WHERE date IN ('#{start_date}', '#{end_date}');")
    expense_names = []
    results.each do |result|
      expense_names << result['name']
    end
    expense_names
  end

end
