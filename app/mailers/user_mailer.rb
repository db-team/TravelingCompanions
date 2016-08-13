class UserMailer < ApplicationMailer

  def account_activation(user)
    @user = user
    mail to: user.email, subject: "Account activation at TravelGo social"
  end

  def password_reset(user)
    @user = user
    mail to: user.email, subject: "Password reset request from TravelGo social"
  end
end
