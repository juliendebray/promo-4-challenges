class PostsController
  def initialize
    @view = PostView.new
  end

  ################################################################
  # BEWARE: you MUST not use the global variable DB in this file #
  ################################################################

  def index
    # TODO: implement listing all posts
    posts = Post.all
    @view.list_posts(posts)
  end

  def create
    # TODO: implement creating a new post
    arg = @view.ask_post_info
    post = Post.new(arg)
    post.save
  end

  def update
    # TODO: implement updating an existing post
    index
    id = @view.ask_post_id
    post = Post.find(id)
    arg = @view.ask_post_info
    post.title = arg[:title]
    post.url = arg[:url]
    post.save
  end

  def destroy
    # TODO: implement destroying a post
    index
    id = @view.ask_post_id
    post = Post.find(id)
    post.destroy
  end

  def upvote
    # TODO: implement upvoting a post
    index
    id = @view.ask_post_id
    post = Post.find(id)
    post.upvote
    post.save
  end
end