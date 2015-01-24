class UsersController < ApplicationController

  def index
    @users = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to login_path
    else
      render 'new'
  end

  def new
    @user = User.new
  end

  def edit

  end

  def update
  end

  def destroy
  end

  private
  def user_params
    params.require(:user).permit(:name,:email,:password)
  end

end