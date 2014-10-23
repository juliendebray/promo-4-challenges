require_relative "display"
require 'nokogiri'
require 'open-uri'
require_relative 'parse'

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @display = Display.new
    @marmiton = Parse.new
  end

  def web_import
    ingredient = @display.ask_user_which_recipes_to_import.gsub(" ","-")
    recipes_hash = @marmiton.parse_marmiton(ingredient)
    recipes_hash.each do |value|
      new_recipe = Recipe.new(value[:title], value[:description], value[:prep_time],\
value[:cook_time], value[:rating], value[:nb_of_votes])
      @cookbook.add_recipe(new_recipe)
    end
  end

  def see_details_recipe
    recipe_id = @display.ask_user_wich_recipe_to_see_details
    @display.print_recipe_details(@cookbook, recipe_id)
  end

  def mark_recipe_as_tested
    recipe_id = @display.ask_user_which_recipe_to_mark
    @cookbook.recipes[recipe_id].mark_a_recipe
  end

  def list
    @display.print_to_user_all_recipes(@cookbook)
  end

  def create
    new_recipe_from_user = @display.ask_user_to_create_a_new_recipe
    new_recipe = Recipe.new(new_recipe_from_user[0], new_recipe_from_user[1])
    @cookbook.add_recipe(new_recipe)
  end

  def destroy
    recipe_id_to_destroy = @display.ask_user_to_destroy_a_recipe
    @cookbook.remove_recipe(recipe_id_to_destroy)
  end
end
