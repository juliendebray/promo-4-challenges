def shuffle(array)
  # TODO: shuffle the array manually
  shuff = []
  i = rand(0..array.length - 1)
  (0..array.length - 1).each do |k|
    while shuff.include?(array[i])
      i = rand(0..array.length - 1)
    end
    shuff[k] = array[i]
  end
  shuff
end