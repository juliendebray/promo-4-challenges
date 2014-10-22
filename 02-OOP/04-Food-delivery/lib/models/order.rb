class Order

  attr_reader :meals, :total_price, :date, :customer, :delivery_guy, :delivered

  def initialize(meals, total_price, delivery_guy, customer)
    @meals = meals
    @total_price = total_price
    @delivery_guy = delivery_guy
    @customer = customer
    @date = Time.new
    @delivered = false
  end

  def complete!
    @delivered = true
  end
end