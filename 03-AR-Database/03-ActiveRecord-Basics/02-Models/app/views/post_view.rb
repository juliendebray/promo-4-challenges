class PostView
  # TODO: implement some methods here when controller needs to `puts` or `gets`
  def display_all_posts(posts)
    posts.each { |post| puts post }
  end

  def ask_title_and_url
    arg = {}
    arg[:name] = ask_sht("Name?").to_s
    arg[:url] = ask_sht("url?").to_s
    arg
  end

  def ask_post_id
    ask_sht("id?").to_i
  end

  private

  def ask_sht(label)
    puts label
    print ">"
    gets.chomp
  end
end