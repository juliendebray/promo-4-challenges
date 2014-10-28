# TODO: Write a seed
require "faker"

5.times do
  user = User.create(
    username: Faker::Name.name,
    email: Faker::Internet.email
  )

  10.times do
    Post.create(
      name: Faker::Commerce.product_name,
      url: Faker::Internet.url,
      votes: (0..1000).to_a.sample,
      user: user
    )
  end
end

