class UserMailer < ApplicationMailer
  default :from => "bksanda2014@gmail.com"

  def registration_confirmation(user)
    @user = user
    mail(:to => "#{user.name}<#{user.email}>", :subject => "Registered")
  end

  def email_notify(user)
    @user = user
    mail(:to => "#{user.name}<#{user.email}>", :subject => "Email notifications set")
  end

end
