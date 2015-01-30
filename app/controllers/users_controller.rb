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
    @goals_users = @user.goals_users.where({active:true})
    @streak_completed, @max_streak = 0, 0
    @user.goals_users.each do |goal|
      @streak_completed += goal.streak_completed
      @max_streak += goal.max_streak
    end

    ##### ASK ABOUT
    # @user.awards.each do |award|
    #   @total_completions += award.total_completions
    # end

  end

  def create
    @user = User.create(user_params)

    if @user.errors.any?
      flash[:danger] = 'Invalid Entry'
      redirect_to signup_path
    else
      session[:user_id] = @user.id
      flash[:success] = "Sign Up Successful!"
      UserMailer.registration_confirmation(@user).deliver_now
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
    if @user.phone != params[:user][:phone]
      @user.phone = params[:user][:phone]
      @user.po_email = params[:user][:po_email]
      @user.save
      send_text_greeting
    end
    if @user.po_email != params[:user][:po_email]
      @user.phone = params[:user][:phone]
      @user.po_email = params[:user][:po_email]
      @user.save
      UserMailer.email_notify_po(@user).deliver_now
    end
    # @goals.each do |goal_id|
    #   @user.goals << Goal.find(goal_id) unless goal_id.blank?


    #notify po email if goals are active
    # @user.po_email = params[:user][:po_email]
    # @user.save
    # @goal = Goal.find(params[:id])
    # goal = GoalsUser.find_or_create_by({user_id:@user.id,goal_id:@goal.id})
    # if goal.active == true
    #   UserMailer.email_notify_po_inc(@user).deliver_now
    # end

    redirect_to edit_user_path(@user)
  end

  # def destroy
  #   @goal = Goal.find(params[:id])
  #   @goal.destroy

  #   redirect_to user_path
  # end

  def goals
    @goal = Goal.new
    # active_goal = @user.goals.where.not(goal_type: 'user')

    @goals_user = @user.goals.where.not(goal_type: 'user');

    @users_custom_goals = @user.goals.where(goal_type: 'user');
    @goals = Goal.all.where.not(goal_type: 'user');
  end

# INDIVIDUAL GOAL PAGE
  def goalshow
    @user = current_user
    @goal = Goal.find_by_id(params[:goal_id])
    # @goal = GoalsUser

    #For user currently
    @goals_users = @user.goals_users.where({active:true})
    @streak_completed = 0
    @user.goals_users.each do |goal|
      @streak_completed = (@streak_completed + goal.streak_completed)/2
    end

    #For all community
    @users_ever = @goal.users_ever
    @users_currently = @goal.users_currently
    @total_completions = @goal.total_completions

    #For user to compare with
    @average_streak_currently = @goal.average_streak_currently

  end

# CUSTOM GOAL ADD on GOALS UPDATE PAGE
  def goals_add
    @goal = Goal.create(goal_params)
    goal = GoalsUser.create({user_id:@user.id,goal_id:@goal.id})
    respond_to do |f|
      f.html {redirect_to goals_path(@user)}
      f.json {render json: {new_goal:goal,success: true}}
    end
  end

# HARDCODE GOAL ADD on USR PROFILE PAGE
  def goals_complete
    # goal = Goal.find(params[:id])
    @goals_user = GoalsUser.where(user_id:@user.id).where(goal_id: params[:id])
    @goals_user.map do |goal, index|
      goal.update_attributes(completed_today: true)
      goal.gu_update
      goal.save
    end
    # goals_user.save_all
    # update_awards
    respond_to do |f|
      f.html {redirect_to goals_path(@user)}
      f.json {render json: {success: true}}
    end

  end

  # HARDCODE GOAL ADD on GOAL UPDATE PAGE

  def goals_update
    @goal = Goal.find(params[:id])
    goal = GoalsUser.find_or_create_by({user_id:@user.id,goal_id:@goal.id})
    if !goal.active
      goal.update_attribute("active", true)
    end
    update_awards
    respond_to do |f|
      f.html {redirect_to goals_path(@user)}
      f.json {render json: {success: true}}
    end
  end

# CUSTOM AND HARDCODE GOAL INACTIVE on GOALS UPDATE PAGE
  def goals_inactive
    @goal = Goal.find(params[:id])
    @temp = GoalsUser.where({user_id:@user.id,goal_id:@goal.id})
    @temp.update_all(active: "false")
    respond_to do |f|
      f.html {redirect_to goals_path(@user)}
      f.json {render json: {success: true}}
    end
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