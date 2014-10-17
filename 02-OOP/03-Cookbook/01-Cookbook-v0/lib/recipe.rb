class Recipe
  attr_reader :name, :description

  def initialize(name, description)
    @name = name
    @description = description
  end

  def id
    return @name
  end
end
