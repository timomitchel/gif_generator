class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "#{@user.username} account successfully created"
      redirect_to user_path(@user)
    else
      render :new
    end
  end

    private

    def user_params
      params.require(:user).permit(:username, :password)
    end
end