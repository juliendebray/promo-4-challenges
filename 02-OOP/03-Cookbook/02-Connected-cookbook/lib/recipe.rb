class Recipe
  attr_reader :name, :description, :prep_time, :cook_time, :rating, :nb_of_votes, :tested

  def initialize(name, description, prep_time = nil, cook_time = nil, rating = nil, nb_of_votes = nil)
    @name = name
    @description = description
    @prep_time = prep_time
    @cook_time = cook_time
    @rating = rating
    @nb_of_votes = nb_of_votes
    @tested = false
  end

  def id
    return @name
  end

  def mark_a_recipe
    @tested = true
  end
end
