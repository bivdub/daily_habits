class UsersController < ApplicationController

  def index
    @users = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.errors.any?
      render 'new'
    else
      flash[:success] = 'User has been created'
      redirect_to login_path
    end
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find_by_id(params[:id])
    @goal = Goal.find_by_id(params[:goal_id])
    redirect_to user_path
  end

  def update
    @user = User.find_by_id(params[:id])

    @user.goals.clear
    @goals = params[:user][:goal_id]

    @goals.each do |goal_id|
      @user.goals << Goal.find(goal_id) unless goal_id.blank?
    end

    redirect_to user_path
  end

  def destroy
  end

  def goal
    @goal = Goal.find_by_id(params[:id])
    @users = goal ? goal.users : []
  end

  def goals_update
  end

  def awards
  end


  private

  def user_params
    params.require(:user).permit(:name,:email,:password)
  end

end