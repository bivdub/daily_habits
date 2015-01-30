class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :current_user

  def is_authenticated?
    redirect_to login_path unless current_user
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  # Call this as soon as user adds phone number notification
  def send_text_greeting

    @client = Twilio::REST::Client.new

    message = @client.account.messages.create(:body => "Welcome to The Daily Habit! Visit www.thedailyhabit.herokuapp.com to add goals so we can track your progress.",
        :to => "#{@user.phone}",     # Replace with your phone number
        :from => "+13049828749")   # Replace with your Twilio number
    puts message.sid

  end


# Need to determine how to call this with task/scheduler
  def self.send_text(user)

    @user = user

    @client = Twilio::REST::Client.new

    message = @client.account.messages.create(:body => "Did you meet your daily goals today? Visit www.thedailyhabit.herokuapp.com to update your status - or else!",
      :to => "#{@user.phone}",     # Replace with your phone number
      :from => "+13049828749")   # Replace with your Twilio number
    puts message.sid

  end

  def update_awards

    #NEWBIE - Add a goal
    if @current_user.goals.any? && !@current_user.awards.find_by_id(2)
      a = Award.find_by_id(2)
      @current_user.awards << a
      a.total_completions += 1
      a.save
    end

    #INTRO TO YOUR BODY - Add a body goal
    if @current_user.goals.where(goal_type: "body").any? && !@current_user.awards.find_by_id(3)
      a = Award.find_by_id(3)
      @current_user.awards << a
      a.total_completions += 1
      a.save
    end

    #QUICK STARTER - Avoid hitting Snooze for 3 days
    if @current_user.goals_users.where(goal_id: 23).any? && @current_user.goals_users.where(goal_id: 23)[0].streak_completed >= 3 && !@current_user.awards.find_by_id(4)
      a = Award.find_by_id(4)
      @current_user.awards << Award.find_by_id(4)
      a.total_completions += 1
      a.save
    end

    #3 X 3 - Keep at least 3 goals for 3 days
    if @current_user.goals_users.select{|goal| goal.streak_completed >= 6}.length >= 3 && !@current_user.awards.find_by_id(5)
      a = Award.find_by_id(5)
      @current_user.awards << Award.find_by_id(5)
      a.total_completions += 1
      a.save
    end

    #10 SPOT - put at least 10 active goals on your list
    if (@current_user.goals_users.where(active: true).length >= 10) && !@current_user.awards.find_by_id(6)
      a = Award.find_by_id(6)
      @current_user.awards << Award.find_by_id(6)
      a.total_completions += 1
      a.save
      alert("WOOT!")
    end
  end

  def self.send_text_push(user)

    @user = user
    @client = Twilio::REST::Client.new

    message = @client.account.messages.create(:body => "Hey! Looks like you still have goals to complete! Visit www.thedailyhabit.herokuapp.com to stay on track.",
      :to => "#{@user.phone}",    # Replace with your phone number
      :from => "+13049828749")   # Replace with your Twilio number
    puts message.sid

  end

end
