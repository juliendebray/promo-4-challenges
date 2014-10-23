# require_relative "meal"
# require_relative "../repositories/meals_repository"

class Order

  attr_reader :meals_tab, :date, :customer, :delivery_guy, :delivered

  def initialize(meals_tab, delivery_guy, customer)
    # @all_meals = MealsRepository.new
    @meals_tab = meals_tab
    @delivery_guy = delivery_guy
    @customer = customer
    @date = Time.new
    @delivered = false
  end

  def complete!
    @delivered = true
  end

  def compute_total_price
    sum = 0
    @meals_tab.each { |meal| sum += meal.price}
    return sum
  end

end

# test = Order.new(Meal.new("babanes", 5), 0, 0)
# p test.all_meals