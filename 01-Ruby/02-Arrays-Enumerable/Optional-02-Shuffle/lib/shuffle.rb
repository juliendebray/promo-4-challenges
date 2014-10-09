def shuffle(array)
  # TODO: shuffle the array manually
  l = array.length
  shuff = []
  puts shuff
  if shuff.size == 0
    puts "shuff vide"
  end
  i = 0
  k = 0

  for k in (0..l-1)
    while !shuff.include?(i)
      i = rand(0..l-1)
      shuff[k] = i
    end
    k = k + 1
  end
  shuff
end


tab = ["ju", "flo", "ro", "max", "etc"]
alea = []
puts tab
l = tab.length
puts l
i = 0
for k in (0..l-1) do
  puts "k = #{k}"
  until !(alea.include?(i))
  i = rand(0..l-1)
  puts "i dans while : #{i}"
  alea << i
  puts "alea en cours: #{alea}"
  end
end
puts "alea final #{alea}"
