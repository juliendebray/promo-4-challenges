class Restaurant
  attr_reader :name, :address
  attr_accessor :food_type, :nb_places

  def initialize(name, food_type, address, nb_places)
    @name = name
    @food_type = food_type
    @address = address
    @nb_places = nb_places
  end
end
