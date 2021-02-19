class User < ApplicationRecord
  has_many :games
  has_many :comments
  has_many :games, through: :comments
  # has_many :game_comments, through: :comments, source: :game
  has_secure_password
  validates :username, presence: true, uniqueness: true
end
