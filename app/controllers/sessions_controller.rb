class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.authenticate(params[:user][:email], params[:user][:password])
# FOR AUTH - User.find_or_create_from_auth_hash(auth_hash) ||
    if @user
      session[:user_id] = @user.id
      flash[:success] = "Log In Successful!"
      redirect_to user_path(@user)
    else
      flash[:danger] = "Credentials Invalid!"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:info] = "User logged out!"
    redirect_to login_path
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end

end