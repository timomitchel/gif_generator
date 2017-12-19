class Gif < ApplicationRecord
  mount_uploaders :avatars, AvatarUploader
  validates_presence_of :url

  belongs_to :category
end