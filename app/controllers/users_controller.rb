class UsersController < ApplicationController

  # before_action :is_authenticated?
  before_action do
    @user = current_user
  end


  def index
    redirect_to show
  end

  def new
    @user = User.new

  end

  def show
    @user = current_user
    # @goals_user = User.goals(goal_params)
    @goals_user = GoalsUser.where(user_id: @user.id)  # join table for goals and users
  end

  def create
    @user = User.create(user_params)

    if @user.errors.any?
      flash[:danger] = 'Error from controller'
      redirect_to signup_path
    else
      flash[:success] = 'User has been created'
      redirect_to login_path
    end
  end


  def edit
    @user = User.find_by_id(params[:id])
    @goal = Goal.find_by_id(params[:goal_id])
    redirect_to user_path
  end

  def update
    @user = User.find_by_id(params[:id])

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
    @goal = Goal.new
    @goals_user = GoalsUser.where(user_id: @user.id)
  end

  def goalshow
    @goal = User.goal
  end

  def goals_add
    @goal = Goal.create(goal_params)
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
    params_require[:goal].permit(:name)
        # params_require[:goal].permit(:streak_completed, :streak_failed, :completed_today, :max_streak, :max_failed, :active)

  end

end