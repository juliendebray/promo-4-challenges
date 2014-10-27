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
    post = return_post
    arg = @view.ask_post_info
    post.title = arg[:title]
    post.url = arg[:url]
    post.save
  end

  def destroy
    # TODO: implement destroying a post
    post = return_post
    post.destroy
  end

  def upvote
    # TODO: implement upvoting a post
    post = return_post
    post.upvote
    post.save
  end

  private

  def return_post
    index
    id = @view.ask_post_id
    Post.find(id)
  end
end