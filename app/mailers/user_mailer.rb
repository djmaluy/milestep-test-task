class UserMailer < ApplicationMailer

  def registration_confirmation(user, token)
    @user = user
    p ENV["client_url"]
    p "============="
  	@url  = ENV["client_url"] + '/confirmation_email/' + token.to_s
    mail(to: @user.email, subject: 'Registration to My App')
  end

end
