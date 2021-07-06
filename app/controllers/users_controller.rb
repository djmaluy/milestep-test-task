class UsersController < ApplicationController
  

  def create
    @user = User.create(user_params)
    if @user.save
      # send_confirm_email(@user)
      render json: user   
    else
      render json: "Something went wrong"
    end
  end

  # def send_confirm_email(user)
  #   token = Jwt::EncryptionService.new(user_id: user.id).token
  #   UserMailer.registration_confirmation(@user, token).deliver_now!
    
  #   render json: user, status: :created
  # end
  
 
  # def confirm_email
  #   decoded = Jwt::DecryptionService.new(token_params[:token]).decrypt!
  #   user = User.find(decoded['sub']['user_id'])
  #   if user
  #     user.update(email_confirmed: true)  
  #   end

  #   return render json: user if user
  #     render json: { user: I18n.t('errors.cant_find_user') }, status: :unprocessable_entity

  #   rescue JWT::DecodeError
  #     render json: { user: I18n.t('errors.invalid_token_params') }, status: :unprocessable_entity
  # end


  private

  def token_params
    params.require(:user).permit(:token)
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end
