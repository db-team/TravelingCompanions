class UserMailer < ApplicationMailer
  default from: 'notification@example.com'

  def welcome_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to my Awesome website')
  end

  def notify_user(tour)  	
    @emails = tour.members.pluck(:email)
    @tour  = tour
    mail(to: @emails, subject: "Chuyen di #{@tour.title} vua nhan them binh luan. Ban co the se muon kiem tra day.")
  end
  def account_activation(user)
    @user = user
    mail to: user.email, subject: "Account activation at TravelGo social"
  end

  def password_reset(user)
    @user = user
    mail to: user.email, subject: "Password reset request from TravelGo social"
  end
end
