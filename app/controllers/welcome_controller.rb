class WelcomeController < ApplicationController

  def index
    @categories = Category.all
    @gifs = Gif.welcome_gifs
  end
end