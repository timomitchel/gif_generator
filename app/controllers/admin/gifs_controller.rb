class Admin::GifsController < ApplicationController

    def new
      @gif = Gif.new
    end
end