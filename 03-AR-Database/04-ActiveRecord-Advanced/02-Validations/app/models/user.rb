class User < ActiveRecord::Base
  has_many :posts

  before_validation :lower_username
  before_save :strip_email
  # TODO: Add some validation
  validates_presence_of :username, :email
  validates_uniqueness_of :username
  validates :email, format: { with: /[-0-9a-zA-Z.+_]+@[-0-9a-zA-Z.+_]+\.[a-zA-Z]{2,4}/, message: "invalid email" }
  # validates :email, format: {with: /.+@.+/, message: "invalid email"}

  private

  def lower_username
    self.username = self.username.downcase unless self.username.nil?
  end

  def strip_email
    self.email = self.email.strip unless self.email.nil?
  end
end