class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :gif

  def find_gif_by_id
    self.gif.url
  end
end