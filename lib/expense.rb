require 'table_butler'
require 'pry'

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
end
