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
    # render json: @user

    # @goals_user = User.goals(goal_params)
    @goals_user = GoalsUser.where(user_id: @user.id)  # join table for goals and users
    # @goals = Goal.joins(: .where(goal_id {goal_id: @goal.id)
    temp_goal_id = @goals_user.select(:goal_id)
    @goals = Goal.where(id: temp_goal_id)
  end

  def create
    @user = User.create(user_params)

    if @user.errors.any?
      flash[:danger] = 'Invalid Entry'
      redirect_to signup_path
    else
      session[:user_id] = @user.id
      flash[:success] = "Sign Up Successful!"
      redirect_to user_path(@user)
    end
  end

# USER SETTINGS EDIT VIEW
  def edit
    @user = User.find_by_id(params[:id])
    @goal = Goal.find_by_id(params[:goal_id])
  end

# USER SETTINGS UPDATE METHOD
  def update
    @user.phone = params[:user][:phone]
    @user.save

    # @goals.each do |goal_id|
    #   @user.goals << Goal.find(goal_id) unless goal_id.blank?
    redirect_to user_path(@user)
  end

  # def destroy
  #   @goal = Goal.find(params[:id])
  #   @goal.destroy

  #   redirect_to user_path
  # end

  def goals
    @goal = Goal.new
    @goals_user = GoalsUser.where(user_id: @user.id)  # join table for goals and users
    temp_goal_id = @goals_user.select(:goal_id)
    @users_custom_goals = Goal.where(id: temp_goal_id).where(goal_type: 'user');
    @goals = Goal.all
  end

# INDIVIDUAL GOAL PAGE
  def goalshow
    # @goal = GoalsUser
  end

# CUSTOM GOAL ADD on GOALS UPDATE PAGE
  def goals_add
    @goal = Goal.create(goal_params)
    GoalsUser.create({user_id:@user.id,goal_id:@goal.id})

    redirect_to user_path
  end

# HARDCODE GOAL ADD on GOALS UPDATE PAGE
  def goals_update
    @goal = Goal.find(params[:id])
    goal = GoalsUser.find_or_create_by({user_id:@user.id,goal_id:@goal.id})
    # goal.update_attribute("active", true)
    redirect_to user_path
    # render plain: goal.inspect
  end

# CUSTOM AND HARDCODE GOAL INACTIVE on GOALS UPDATE PAGE
  def goals_inactive
    @goal = Goal.find(params[:id])
    @temp = GoalsUser.where({user_id:@user.id,goal_id:@goal.id})
    @temp.update_all(active: "false")

    redirect_to user_path
    # render plain: @temp.inspect
  end

  def awards
  end


  private

  def user_params
    params.require(:user).permit(:name,:email,:password, :password_confirmation)
  end

  def goal_params
    params.require(:addgoal).permit(:name)
        # params_require[:goal].permit(:streak_completed, :streak_failed, :completed_today, :max_streak, :max_failed, :active)
  end

end