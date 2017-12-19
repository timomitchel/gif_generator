class Gif < ApplicationRecord
  require 'net/http'
  require 'json'  
  mount_uploaders :avatars, AvatarUploader
  validates_presence_of :url, uniqueness: true

  belongs_to :category

  def self.grab_by_search
    url = "http://api.giphy.com/v1/gifs/search?q=#{self.category}&api_key=aWelUmFa12kmAdMsQPJrznBYgKXIosuM&limit=5"
    resp = Net::HTTP.get_response(URI.parse(url))
    buffer = resp.body
    result = JSON.parse(buffer)
  end
end