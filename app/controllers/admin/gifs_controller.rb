class Admin::GifsController < Admin::BaseController

    def new
      @gif = Gif.new
    end

    def index
      @gifs = Gif.all
    end
end