class UserMailer < ApplicationMailer
  default :from => "thedailyhabiter@gmail.com"

  def registration_confirmation(user)
    @user = user
    mail(:to => "#{user.name}<#{user.email}>", :subject => "Registered")
  end

  def email_notify_po(user)
    @user = user
    mail(:to => user.po_email, :subject => "The Daily Habiter's Watchdog")
  end

  def email_notify_po_inc(user)
    @user = user
    mail(:to => user.po_email, :subject => "Pester away at your Daily Habiter")
  end

end
