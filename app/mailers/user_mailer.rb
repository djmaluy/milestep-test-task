class UserMailer < ApplicationMailer

  def registration_confirmation(user, token)
    @user = user
  	@url  = ENV["CLIENT_URL"] + '/confirmation_email/' + token.to_s
    mail(to: @user.email, subject: 'Registration to My App')
  end

end
# ENV["CLIENT_URL"]
# "http://localhost:3001"
