class GifsController < ApplicationController

  def index
    @gifs = Gif.random_gif
  end

end