# require_relative "../models/restaurant" # to delete if no test
# require_relative "../views/restaurant_view"


class RestaurantController

  def initialize
    @restaurant = Restaurant.new
    @restaurant_view = RestaurantView.new
  end

  def print_welcome
    @restaurant_view.print_welcome_to_user(@restaurant)
  end
end


# test = RestaurantController.new
# test.print_welcome