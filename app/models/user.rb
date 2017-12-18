class User < ApplicationRecord
  has_secure_password
  validates_presence_of :username, :password
  # has_many :favorites
  # has_many :gifs, through: favorites
end