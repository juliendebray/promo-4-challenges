  B_HASH = {
    "Cheese Burger" => 290,
    "Big Mac" => 300,
    "Mc Bacon" => 400,
    "Royal Cheese" => 130
  }

  S_HASH = {
    "French fries" => 130,
    "Potatoes" => 130
  }

  BEV_HASH = {
    "Coca" => 160,
    "Sprite" => 170
  }

def poor_calories_counter(burger, side, beverage)
  #TODO: return number of calories for this mcDonald order
  return B_HASH[burger] + S_HASH[side] + BEV_HASH[beverage]

end

#p poor_calories_counter("Big Mac", "Potatoes", "Sprite")

MENU_HASH = {
  "Happy Meal" => poor_calories_counter("Cheese Burger", "French fries", "Coca"),
  "Best Of Big Mac" => poor_calories_counter("Big Mac", "French fries", "Coca"),
  "Best Of Royal Cheese" => poor_calories_counter("Royal Cheese", "Potatoes", "Sprite")

}

#p MENU_HASH

def calories_counter(*orders)
  #TODO: return number of calories for a less constrained order
cal = 0
orders.each do |item|
  if B_HASH.include?(item)
    cal = cal + B_HASH[item]
  elsif BEV_HASH.include?(item)
    cal = cal + BEV_HASH[item]
  elsif S_HASH.include?(item)
    cal = cal + S_HASH[item]
  elsif MENU_HASH.include?(item)
    cal = cal + MENU_HASH[item]
  end
end
return cal
end

#p calories_counter("Coca", "Mc Bacon", "French fries", "Sprite")
p calories_counter("Sprite", "Cheese Burger", "Best Of Big Mac")
p calories_counter("Sprite")
p calories_counter("Cheese Burger")
p calories_counter("Best Of Big Mac")
