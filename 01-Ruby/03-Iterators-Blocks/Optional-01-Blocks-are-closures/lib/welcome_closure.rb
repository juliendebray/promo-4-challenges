count = 0

welcome_block = Proc.new do |name|
  # TODO: your code goes here !
  if count == 0
    count += 1
    "Welcome #{name}, you are the first here!"
  elsif count == 1
    count += 1
    "Welcome #{name}, join your 1 friend"
  else
    count += 1
    "Welcome #{name}, join your #{count - 1} friends"
  end
end

puts welcome_block.call("felix")
puts welcome_block.call("estelle")
# count = 10
puts welcome_block.call("cedric")
puts welcome_block.call("fred")



# Welcome felix, you are the first here!
# Welcome estelle, join your 1 friend
# Welcome cedric, join your 2 friends
# Welcome fred, join your 3 friends