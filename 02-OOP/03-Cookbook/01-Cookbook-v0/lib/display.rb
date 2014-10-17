class Display
  def print_to_user_all_recipes(cookbook)
    cookbook.recipes.each do |recipe|
      puts "name: #{recipe.name} description: #{recipe.description}"
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
    puts "Which recipe's name to remove?"
    return gets.chomp # to improved by using an unique id for recipe
  end
end
