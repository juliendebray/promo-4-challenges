require 'sqlite3'


# You can use a global variable, DB, built as is:
# DB = SQLite3::Database.new(file)

class Post
  # TODO: implement some reader and/or writers
  attr_reader :id, :date, :votes
  attr_accessor :title, :url

  def initialize(options = {})
    # TODO: initialize instance variables from the hash options.
    @id = options[:id]
    @title = options[:title]
    @url = options[:url]
    @votes = options[:votes] || 0
    @date = options[:date] || Time.now
  end

  # TODO: implement all the class methods and instance methods
  #       to have a full CRUD support on your Post model

  def save
    if @id.nil?
      insert_new_post(DB)
      @id = DB.last_insert_row_id
    else
      update_a_post(DB)
    end
  end

  def self.all
    tab =  DB.execute("SELECT * FROM posts;")
    posts = tab.map do |post|
      Post.new(arg(post))
    end
    return posts
  end

  def self.find(id)
    tab = DB.execute("SELECT * FROM posts WHERE id = ?;", [id])
    Post.new(arg(tab[0])) if tab.first
  end

  def destroy
    DB.execute("DELETE FROM posts WHERE id = ?;", [id])
  end

  def upvote
    @votes += 1
  end

  def to_s
    return "> n°#{@id} title: #{@title} (#{@url})\n" \
    "created on #{@date.strftime('%m/%d/%Y')} - #{@votes} votes\n\n"
  end

  private

  def self.arg(post)
    {
      id: post[0].to_i,
      title: post[1].to_s,
      url: post[2].to_s,
      date: Time.at(post[3]),
      votes: post[4].to_i
    }
  end

  def insert_new_post(db)
    db.execute("INSERT INTO posts (title, url, date, votes)
                VALUES ('#{@title}', '#{@url}', #{@date.to_i}, '#{@votes}');")
  end

  def update_a_post(db)
    DB.execute("UPDATE posts
                  SET title = '#{@title}',
                      url = '#{@url}',
                      date = #{@date.to_i},
                      votes = '#{@votes}'
                  WHERE id = #{@id}
                  ;")
  end
end