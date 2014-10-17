require 'csv'

class Cookbook
  attr_reader :recipes
  def initialize(csv_file)
    @csv_file = csv_file
    @recipes = []  # Instance of Recipe
    CSV.foreach(csv_file) do |row|
      # row.class => Array
      @recipes << Recipe.new(row[0], row[1])
    end
    return @recipes
  end

  def add_recipe(recipe)
    @recipes << recipe
    CSV.open(@csv_file, "wb") do |csv|
      @recipes.each { |recipe| csv << [recipe.name, recipe.description] }
    end
  end

  def remove_recipe(recipe_id)
    @recipes.reject! { |recipe| recipe.id == recipe_id } # TODO: create the .id method
    CSV.open(@csv_file, "wb") do |csv|
      @recipes.each { |recipe| csv << [recipe.name, recipe.description] }
    end
  end
end


