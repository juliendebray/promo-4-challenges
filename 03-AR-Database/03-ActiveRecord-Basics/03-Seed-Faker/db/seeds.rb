require "faker"

# TODO: Write a seed to insert 100 posts in the database
100.times do
  post = Post.new(
    name: Faker::Company.name,
    url: Faker::Internet.safe_email
  )
  post.save
end