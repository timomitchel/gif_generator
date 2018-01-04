class GifsController < ApplicationController

  def index
    @gifs = Gif.random_gifs
    @category = Category.find_by(name: "trending")
    unless @category
    @category = Category.create(name: "trending")
    end
    @gifs["data"].each do |gif|
      Gif.create(category_id: @category.id , url: gif["images"]["downsized_medium"]["url"])
    end
    @category.gifs
  end

end