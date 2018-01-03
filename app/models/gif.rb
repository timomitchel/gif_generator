require 'net/http'
require 'json'  


class Gif < ApplicationRecord
  validates_presence_of :url, :category_id
  belongs_to :category
  has_many :favorites
  has_many :users, through: :favorites

  def self.select_random_gif(category_name)
    url = "http://api.giphy.com/v1/gifs/random?api_key=aWelUmFa12kmAdMsQPJrznBYgKXIosuM&tag=#{category_name}&limit=1"
    resp = Net::HTTP.get_response(URI.parse(url))
    buffer = resp.body
    JSON.parse(buffer)
  end

  def self.welcome_gifs
    url = "https://api.giphy.com/v1/gifs/search?api_key=aWelUmFa12kmAdMsQPJrznBYgKXIosuM&q=welcome&limit=25&offset=0&rating=G&lang=en"
    resp = Net::HTTP.get_response(URI.parse(url))
    buffer = resp.body
    JSON.parse(buffer)
  end

  def self.random_gifs
    url = "http://api.giphy.com/v1/gifs/random?api_key=aWelUmFa12kmAdMsQPJrznBYgKXIosuMlimit=30"
    resp = Net::HTTP.get_response(URI.parse(url))
    buffer = resp.body
    JSON.parse(buffer)
  end
end