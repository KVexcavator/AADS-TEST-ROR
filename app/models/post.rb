class Post < ApplicationRecord
  acts_as_commentable
  belongs_to :user
  has_many :comments, as: :commentable

  validates :title, presence: true
  validates :content, presence: true
end
