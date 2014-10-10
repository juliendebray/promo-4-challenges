def beer_song(beer_start_count)
  # TODO: sing the song
  case beer_start_count
  when 1
    song = "1 bottle of beer on the wall, 1 bottle of beer!\n\
Take one down, pass it around, no more bottles of beer on the wall!"
  when 2
    song = "2 bottles of beer on the wall, 2 bottles of beer!\n\
Take one down, pass it around, 1 bottles of beer on the wall!\n1 bottle of beer on the wall, 1 bottle of beer!\n\
Take one down, pass it around, no more bottles of beer on the wall!"
  else
  song = "#{beer_start_count} bottles of beer on the wall, #{beer_start_count} bottles of beer!\n"
  (beer_start_count - 1).downto(2) do |i|
    song = song + "Take one down, pass it around, #{i} bottles of beer on the wall!\n\
#{i} bottles of beer on the wall, #{i} bottles of beer!\n"
    end
  song = song + "Take one down, pass it around, 1 bottle of beer on the wall!\n\
1 bottle of beer on the wall, 1 bottle of beer!\n\
Take one down, pass it around, no more bottles of beer on the wall!"
  end
end


puts beer_song(1)
puts " "

puts beer_song(2)
puts " "

puts beer_song(3)
puts " "

puts beer_song(4)
puts " "