def most_common_words(file_name, stop_words_file_name, number_of_word)
  # TODO: return hash of occurences of number_of_word most frequent words
  string = ""
  File.open(file_name, "r").each_line do |line|
    string += " " + line
  end
  tab_all = string.downcase.gsub(/[-?,;.:']/, " ").split(" ")

  stop_str = ""
  File.open(stop_words_file_name).each_line do |line|
    stop_str += " " + line
  end
  stop_words = stop_str.split(" ")

  hash = {}
  tab_all.each do |word|
    hash[word] = tab_all.count(word) if !(stop_words.include?(word))
  end

  tab_sorted = hash.sort_by { |_, v| v }.reverse[0..number_of_word-1]
  result = {}
  tab_sorted.each { |value| result[value[0]] = value[1] }

  return result
end

#p most_common_words("source-text.txt", "stop_words.txt", 10)
