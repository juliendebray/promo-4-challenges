class Restaurant
  # TODO: add relevant accessors if necessary
  attr_reader :average_rating, :city, :name

  def initialize(city, name)
    # TODO: implement constructor with relevant instance variables
    @city = city
    @name = name
    @nb_ratings
  end

  # TODO: implement #filter_by_city and #rate methods

  def rate(new_rating)
    if @average_rating.nil?
      @average_rating = new_rating
      @nb_ratings = 1
    else
      @average_rating =  (new_rating / (@nb_ratings + 1)) + \
      ((@average_rating * @nb_ratings) / (@nb_ratings + 1))
      @nb_ratings += 1
    end
    return @average_rating
  end

  def self.filter_by_city(restaurants, city)
    return restaurants.select { |restaurant| restaurant.city == city }
  end
end
