class Post < ActiveRecord::Base
  belongs_to :user

  # TODO: Add some validation
  validates_presence_of :user, :name, :url
  validates :name, length: { minimum: 5 }
  validates :name, uniqueness: { case_sensitive: false }
  validates :url, format: { with: /\Ahttp:\/\/.+\.[a-zA-Z]{2,4}/, message: "invalid url" }
  # validates :url, format: { with: /.+\..+/, message: "invalid url" }
end