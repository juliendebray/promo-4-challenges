def anag?(word_1,word_2)
  word_1.split("").sort == word_2.split("").sort
end


#puts anag?("cats", "rasc")


def group_anagrams(words)
  #TODO: group anagrams
  tab = []
  words.each_with_index do |mot_1, ind|
    tab[ind] = words.select {|mot_2| anag?(mot_1, mot_2)}
  end
  tab.uniq
end

# input:
p group_anagrams( ['cars', 'for', 'potatoes', 'racs', 'four','scar', 'creams', 'scream'] )

# =>  [["cars", "racs", "scar"], ["four"], ["for"], ["potatoes"], ["creams", "scream"]]



