class Gif < ApplicationRecord
  require 'net/http'
  require 'json'  
  mount_uploaders :avatars, AvatarUploader
  validates_presence_of :url, uniqueness: true

  belongs_to :category


  url = "http://api.giphy.com/v1/gifs/search?q=ryan+gosling&api_key=aWelUmFa12kmAdMsQPJrznBYgKXIosuM&limit=5"
  resp = Net::HTTP.get_response(URI.parse(url))
  buffer = resp.body
  result = JSON.parse(buffer)
end