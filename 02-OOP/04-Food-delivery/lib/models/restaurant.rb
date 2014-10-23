# require_relative "meal"
# require_relative "../repositories/meals_repository"

class Restaurant

  attr_reader :name, :meals

  def initialize
    @name = "Restaurant de test"
    # @meals = MealsRepository.new.meals
  end
end

# test = Restaurant.new
# p test.meals[0].name

