def anagrams?(a_string, another_string)
  # TODO: implement the obvious method to test if two words are anagrams
  str_1 = a_string.downcase.gsub(/\s+|\W/, "")
  str_2 = another_string.downcase.gsub(/\s+|\W/, "")
  return str_1.chars.sort == str_2.chars.sort
end


def anagrams_on_steroids?(a_string, another_string)
  # TODO: implement the improved method
  str_1 = a_string.downcase.gsub(/\s+|\W/, "")
  str_2 = another_string.downcase.gsub(/\s+|\W/, "")
  # return str_1.chars.sort == str_2.chars.sort
  # p str_1
  # p str_2
  if str_1.size == str_2.size

    hash_1 = {}
    # str_1.each_char do |c|
    #   hash_1[c] = str_1.count(c)
    # end

    hash_2 = {}
    # str_2.each_char do |c|
    #  hash_2[c] = str_2.count(c)
    # end

    str_1.size.times do |index|
      hash_1[str_1[index - 1]] = str_1.count(str_1[index - 1])
    end

    str_2.size.times do |index|
      hash_2[str_2[index - 1]] = str_2.count(str_2[index - 1])
    end
    # p hash_1
    # p hash_2
    return hash_1 == hash_2

  else
    return false

  end
end

# require 'benchmark'

# n = 50000
# Benchmark.bm do |x|
#   x.report {
#     n.times do
#       anagrams_on_steroids?("Hello je m'appelle julien", "julien, je m'appelle, Helo !")
#     end
#   }
#   x.report {
#     n.times do
#       anagrams?("Hello je m'appelle julien", "julien, je m'appelle, Helo !")
#     end
#   }
# end

p anagrams_on_steroids?("Hello je m'appelle julien", "julien, je m'appelle, Hello !")