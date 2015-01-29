class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :current_user

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

    message = @client.account.messages.create(:body => "Welcome to The Daily Habit! Visit thedailyhabit to add goals so we can track your progress.",
      :to => "+13045490748",     # Replace with your phone number
      :from => "+13049828749")   # Replace with your Twilio number
    puts message.sid

  end

# Need to determine how to call this with task/scheduler
  def self.send_text

    @client = Twilio::REST::Client.new

    message = @client.account.messages.create(:body => "Did you meet your daily goals today? Visit thedailyhabit to update your status - or else!",
      :to => "+13045490748",     # Replace with your phone number
      :from => "+13049828749")   # Replace with your Twilio number
    puts message.sid

  end

  def self.send_text_push

    @client = Twilio::REST::Client.new

    message = @client.account.messages.create(:body => "Hey! Looks like you still have goals to complete! You can do it!",
      :to => "+13045490748",    # Replace with your phone number
      :from => "+13049828749")   # Replace with your Twilio number
    puts message.sid

  end

end
