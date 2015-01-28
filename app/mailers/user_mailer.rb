class UserMailer < ApplicationMailer
  default :from => "sanda.htyte@gmail.com"

  def registration_confirmation(user)
    @user = user
    mail(:to => "#{user.name}<#{user.email}>", :subject => "Registered") #:from => "sanda.htyte@gmail.com")
  end

  def email_notify(user)
    @user = user
    mail(:to => "#{user.name}<#{user.email}>", :subject => "Email notifications set") #:from => "sanda.htyte@gmail.com")
  end
end
