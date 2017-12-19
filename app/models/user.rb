
class User < ApplicationRecord
  has_secure_password
  validates_presence_of :username, uniqueness: true
  validates_presence_of :password, :role

  enum role: ["default", "admin"]
   has_many :favorites
   has_many :gifs, through: favorites
end