def roman_to_integer(roman_string)
  #TODO: translate roman string to integer
  roman_tr ={
    "I" => 1,
    "V" => 5,
    "X" => 10
  }
  ctrl = ["na","I","V","X"]
  sum = 0
  tab = roman_string.split("")
  tab = tab << "na"

  (0..tab.length - 2).each do |i|
    if ctrl.index(tab[i]) >= ctrl.index(tab[i + 1])
      sum += roman_tr[tab[i]]
    elsif ctrl.index(tab[i]) < ctrl.index(tab[i + 1])
      sum += - roman_tr[tab[i]]
    else
      puts "Error"
    end
  end
  sum
end

# testing your program
puts roman_to_integer('IV')
puts roman_to_integer('XII')
puts roman_to_integer('XIX')

