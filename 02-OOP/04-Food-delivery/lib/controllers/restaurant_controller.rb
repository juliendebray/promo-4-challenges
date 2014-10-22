class RestaurantController

  def initialize(restaurant)
    @restaurant = Restaurant.new(restaurant)
    @restaurant_view = RestaurantView.new
  end


  def print_welcome
    @view_restaurant.print_welcome_to_user(@restaurant)
  end
end
