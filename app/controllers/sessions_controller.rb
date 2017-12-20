class SessionsController < ApplicationController
  def new

  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.admin? && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to admin_gifs_path
    elsif @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash.now[:error] = "Email or Password invalid, try again or create a new account!"
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end