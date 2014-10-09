def shuffle_word(a_word)
  # TODO: refactor this method
  a_word.upcase.chars.shuffle
end


def quote_prime_numbers(n)
  # TODO: refactor this method
  tab_premier = (1..n).select do |i|
    (2..i - 1).select { |k| i % k == 0 }.count == 0
  end
  tab_premier.map { |prime_num| "#{prime_num} is prime" }
end


# tab_prem = (1..n).reject do |i|
#   non_premier = false
#   (2..i - 1).each do |k|
#     premier = true if i % k == 0
#   end
#   non_premier
# end
# tab_prem.map { |prime_num| "#{prime_num} is prime" }
# end



# (1..n).select { |i| (2..i - 1).select { |k| i % k == 0 }.count == 0 }.map { |prime_num| "#{prime_num} is prime" }