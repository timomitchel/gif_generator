class FavoritesController < ApplicationController

  def index
    @user = User.find(params[:id])
    @favorites = @user.favorites
    byebug
  end
end