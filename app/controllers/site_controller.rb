class SiteController < ApplicationController


  def index
    if @current_user
       render 'user/show'
    end
  end

  # def new
  #   @user = User.new
  # end

  # def create
  #   @user = User.create(user_params)
  #   if @user
  #     session[:user_id] = @user.id
  #     redirect_to user_path, flash[:success] = "Login Successful!"
  #   else
  #     flash[:danger] = "Unable to Sign Up!"
  #     render :new
  #   end
  # end

  def about
  end

  private

  def user_params
    params.require(:user).permit(:name,:email,:password, :password_confirmation)
  end

end