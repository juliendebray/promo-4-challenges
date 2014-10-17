require_relative "display"

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @display = Display.new
  end

  def list
    @display.print_to_user_all_recipes(@cookbook)
  end

  def create
    new_recipe_from_user = @display.ask_user_to_create_a_new_recipe
    new_recipe = Recipe.new(new_recipe_from_user[0], new_recipe_from_user[1])
    @cookbook.recipes << new_recipe
  end

  def destroy
    recipe_id_to_destroy = @display.ask_user_to_destroy_a_recipe
    @cookbook.remove_recipe(recipe_id_to_destroy)
  end
end
