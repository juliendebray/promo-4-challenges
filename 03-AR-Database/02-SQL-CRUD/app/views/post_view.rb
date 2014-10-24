class PostView
  # TODO: implement methods called by the PostsController
  def list_posts(posts)
    puts "Here are all the posts:"
    posts.each { |post| puts post }
  end

  def ask_post_info
    title = ask_sht("What is the title?")
    url = ask_sht("Specify url")
    return { title: title, url: url }
  end

  def ask_post_id
    return ask_sht("Specify post id to act on").to_i
  end

  def ask_sht(label)
    puts label
    print ">"
    return gets.chomp
  end
end