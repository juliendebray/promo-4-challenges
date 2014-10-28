class Post < ActiveRecord::Base
  belongs_to :user

  # TODO: Add some validation
  scope :by_votes, -> { self.all.sort { |post_a, post_b| post_b.votes <=> post_a.votes } }
  def upvote
    self.votes += 1
    self.save
  end
end