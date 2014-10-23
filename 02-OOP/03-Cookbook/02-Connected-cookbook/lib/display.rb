class Display
  def print_to_user_all_recipes(cookbook)
    cookbook.recipes.each_with_index do |recipe, index|
      mark = ""
      recipe.tested ? mark = "[X]" : mark ="[ ]"
      preparation_time = ""
      preparation_time = "(#{recipe.prep_time})" unless recipe.prep_time.nil?
      puts "#{index + 1}. #{mark} #{recipe.name} #{preparation_time}"
      # puts "#{recipe.name}\n#{recipe.description}\n#{recipe.time}\
      # \n#{recipe.rating}\n#{recipe.nb_of_votes}"
    end
  end

  def ask_user_to_create_a_new_recipe
    puts "What name?"
    name = gets.chomp
    puts "What description?"
    description = gets.chomp
    return [name, description]
  end

  def ask_user_to_destroy_a_recipe
    puts "Which recipe's id to remove?"
    return gets.chomp.to_i - 1 # to improved by using an unique id for recipe
  end

  def ask_user_which_recipes_to_import
    puts "Import recipes for which ingredient?"
    print ">"
    ingredient = gets.chomp
    puts "Importing recipe data from marmiton for '#{ingredient}'..."
    return ingredient
  end

  def ask_user_wich_recipe_to_see_details
    puts "Which recipe do you want to see detailed?"
    print ">"
    recipe_id = gets.chomp.to_i - 1
  end

  def print_recipe_details(cookbook, recipe_id)
    recipe = cookbook.recipes[recipe_id]
    puts recipe.name
    puts recipe.description
    puts "#{recipe.prep_time} // #{recipe.cook_time}"
    puts recipe.rating
    puts recipe.nb_of_votes
    puts recipe.tested ? "already done" : "to be done"
  end

  def ask_user_which_recipe_to_mark
    puts "Which recipe do you want to mark?"
    print ">"
    recipe_id = gets.chomp.to_i - 1
  end

end
