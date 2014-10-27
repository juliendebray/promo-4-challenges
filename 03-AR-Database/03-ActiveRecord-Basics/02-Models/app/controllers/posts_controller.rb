require_relative "../views/post_view.rb"

class PostsController
  def initialize
    @view = PostView.new
  end

  def index
    # DO NOT WRITE SQL QUERIES
    # TODO: gather all posts from the database
    # TODO: give them to the view to be printed
    @view.display_all_posts(Post.all)
  end

  def create
    # DO NOT WRITE SQL QUERIES
    # TODO: create a post
    arg = @view.ask_title_and_url
    new_post = Post.new(arg)
    new_post.save
  end

  def update
    # DO NOT WRITE SQL QUERIES
    # TODO: update a post
    id = @view.ask_post_id
    arg = @view.ask_title_and_url
    post = Post.find(id)
    post.name = arg[:name] unless arg[:name].empty?
    post.url = arg[:url] unless arg[:url].empty?
    post.save
  end

  def destroy
    # DO NOT WRITE SQL QUERIES
    # TODO: destroy a post
    id = @view.ask_post_id
    post = Post.find(id)
    post.destroy
  end

  def upvote
    # DO NOT WRITE SQL QUERIES
    # TODO: increment the `votes` column for a post
    id = @view.ask_post_id
    post = Post.find(id)
    post.votes += 1
    # post.upvote
    post.save
  end
end