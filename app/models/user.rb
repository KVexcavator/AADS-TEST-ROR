class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  validates :nickname, presence: true, uniqueness: true

  has_many :posts
  has_and_belongs_to_many :followers,
                          class_name: 'User',
                          join_table: 'subscriptions',
                          foreign_key: 'followed_id',
                          association_foreign_key: 'follower_id'

  has_and_belongs_to_many :followed_users,
                          class_name: 'User',
                          join_table: 'subscriptions',
                          foreign_key: 'follower_id',
                          association_foreign_key: 'followed_id'
end
