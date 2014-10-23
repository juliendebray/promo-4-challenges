require 'csv'

class Cookbook
  attr_reader :recipes
  def initialize(csv_file)
    @csv_file = csv_file
    @recipes = []  # Instance of Recipe
    CSV.foreach(csv_file) do |row|
      # row.class => Array
      @recipes << Recipe.new(row[0], row[1], row[2], row[3], row[4], row[5])
    end
    return @recipes
  end

  def add_recipe(recipe)
    @recipes << recipe
    save_in_csv(@recipes, @csv_file)
  end

  def remove_recipe(recipe_id)
    @recipes.delete_at(recipe_id)
    save_in_csv(@recipes, @csv_file)
  end

  def save_in_csv(recipes, csv_file)
    CSV.open(csv_file, "wb") do |csv|
      recipes.each { |recipe| csv << [recipe.name, recipe.description, recipe.prep_time,\
recipe.cook_time, recipe.rating, recipe.nb_of_votes, recipe.tested] }
    end
  end

end


