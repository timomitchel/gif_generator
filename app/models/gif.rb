require 'net/http'
require 'json'  


class Gif < ApplicationRecord
  validates_presence_of :url, :category_id
  belongs_to :category
  has_many :favorites
  has_many :users, through: :favorites

  def self.select_random_gif(category_name)
    url = "http://api.giphy.com/v1/gifs/random?q=#{category_name}&api_key=aWelUmFa12kmAdMsQPJrznBYgKXIosuM&limit=1"
    resp = Net::HTTP.get_response(URI.parse(url))
    buffer = resp.body
    JSON.parse(buffer)
  end
end