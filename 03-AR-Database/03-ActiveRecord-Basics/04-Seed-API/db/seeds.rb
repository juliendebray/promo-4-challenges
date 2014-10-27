require "json"
require "rest-client"

# TODO: Write a seed to insert 100 posts in the database fetched from the Hacker News API.

posts = RestClient.get 'https://hacker-news.firebaseio.com/v0/topstories.json'

posts_nb = JSON.parse(posts)


posts_nb[0..9].each do |post_nb|
  post_attr = RestClient.get "https://hacker-news.firebaseio.com/v0/item/#{post_nb}.json"
  post_hash = JSON.parse(post_attr)
  post = Post.new(name: post_hash['title'], url: post_hash['url'], votes: post_hash['score'])
  post.save
end
