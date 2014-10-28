require 'sinatra'
require "sinatra/reloader" if development?
require_relative "config/application.rb"

set :views, proc { File.join(root, "app/views") }


get '/' do
  # TODO: fetch posts from database.
  #       to pass them to the view, store them in an instance variable
  @posts = Post.by_votes
  erb :posts  # The rendered HTML is in app/views/posts.erb
end


post '/' do
  post = Post.new(name: params[:name], url: params[:url])
  post.save
  redirect("/post/#{post.id}")
end

get '/post/:id' do
  @post = Post.find(params[:id])
  erb :post
end

get'/upvote' do
  @post = Post.find(params[:id])
  @post.upvote
  redirect("/")
end


