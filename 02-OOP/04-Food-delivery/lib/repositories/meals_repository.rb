require 'csv'

class MealsRepository
  attr_reader :meals

  def initialize
    @csv_file = "repositories/meals.csv"
    @meals =[]
    load_csv
  end


private

def load_csv
    return unless File.exist?(@csv_file)
    CSV.foreach(@csv_file) do |row|
      attributes = {
        name: row[0],
        price: row[1].to_f
      }
      @meals << Meal.new(attributes[:name], attributes[:price])
    end
  end
end


