def palindrome?(a_string)
  # TODO: check if a_string is a palindrome
  if a_string.length == 0
    return false
  else
    str_a = a_string.gsub(/\W/,"").downcase
    str_b = a_string.gsub(/\W/,"").reverse.downcase
    return str_a == str_b
  end
end


p palindrome?("kayak")
p palindrome?("hello")
