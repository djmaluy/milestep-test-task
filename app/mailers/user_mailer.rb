class UserMailer < ApplicationMailer

  def registration_confirmation(user, token)
    @user = user
  	@url  = Rails.application.credentials[Rails.env.to_sym][:url][:client_url] + '/confirmation_email/' + token.to_s
    mail(to: @user.email, subject: 'Registration to My App')
  end

end
