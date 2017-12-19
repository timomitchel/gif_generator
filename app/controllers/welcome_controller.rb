class WelcomeController < ApplicationController

  def index
    @categories = Category.all
    @gif = Gif.new
  end
end