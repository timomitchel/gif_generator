class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :gif

  def find_gif_by_id
    self.gif.url
  end

  def gif_id
    self.gif.id
  end
end