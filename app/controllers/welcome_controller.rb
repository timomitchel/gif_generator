class WelcomeController < ApplicationController

  def index
    @gifs = Gif.welcome_gifs
  end
end