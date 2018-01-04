class FavoritesController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @favorites = @user.favorites
  end

  def create
    redirect_to root_path unless current_user
    favorite = Favorite.create(gif_id: params[:gif_id], user_id: current_user.id)
    if current_user.admin? && favorite.save
    redirect_to admin_user_path(current_user.id)
    elsif !current_user.admin? && favorite.save
    redirect_to user_favorites_path(current_user.id)
    else
      redirect_to root_path
    end
  end

  def destroy
    favorite = Favorite.find(params[:id])
    favorite.destroy
    redirect_to user_favorites_path(current_user.id)
  end
end