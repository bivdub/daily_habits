class UsersController < ApplicationController

  # before_action :is_authenticated?

  def new
  end

  def show
    @current_user
    @goals_user = User.goals(goal_params)
  end

  def create
    @user = User.create(user_params)

    if @user.errors.any?
      render 'new'
    else
      flash[:success] = 'User has been created'
      redirect_to user_path
    end
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
    @goal = Goal.find(params[:id])
    @goal.destroy

    redirect_to user_path
  end

  def goals
    @goals = User.goals
    @goal_user = Goal.find_by_id(params[:id])
    @users = goal ? goal.users : []
  end

  def goalshow
    @goal = User.goal
  end


  def goals_update

  end

  def awards
  end


  private

  def user_params
    params.require(:user).permit(:name,:email,:password, :password_confirmation)
  end

  def goal_params
    params_require[:goal_user].permit(:streak_completed, :streak_failed, :completed_today, :max_streak, :max_failed, :active)
  end

end