class Post < ActiveRecord::Base
  def to_s
    "#{id} - title: #{name} (#{url})\n votes: #{votes}"
  end

  def upvote
    self.votes += 1
  end
end
