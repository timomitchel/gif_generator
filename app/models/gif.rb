class Gif < ApplicationRecord
  require 'net/http'
  require 'json'  
  mount_uploaders :avatars, AvatarUploader
  validates_presence_of :url
  validates_uniqueness_of :url
  validates_presence_of :category_id

  belongs_to :category

  def self.select_random_gif(category_name)
    url = "http://api.giphy.com/v1/gifs/random?q=#{category_name}&api_key=aWelUmFa12kmAdMsQPJrznBYgKXIosuM&limit=1"
    resp = Net::HTTP.get_response(URI.parse(url))
    buffer = resp.body
    JSON.parse(buffer)
  end
end