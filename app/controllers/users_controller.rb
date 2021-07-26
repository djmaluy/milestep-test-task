class UsersController < ApplicationController


  def create
    user = User.create(user_params)
    return  send_confirm_email(user) if user.save
      # render json: user
      render json: user.errors, status: :unprocessable_entity
  end

  def update
    @user = current_user
    if @user
      @user.update(updated_params)
      render json: { message: "User sucessfully updated" }, status: :ok
    else
      render json: { error: "Unable to update user" }, status: :bad_request
    end
  end

  def send_confirm_email(user)
    @user = user
    token = Jwt::EncryptionService.new(user_id: @user.id).token
    UserMailer.registration_confirmation(user, token).deliver_now!

    render json: user, status: :created
  end


  def confirm_email
    decoded = Jwt::DecryptionService.new(token_params[:token]).decrypt!
    user = User.find(decoded['sub']['user_id'])
    if user
      user.update(email_confirmed: true)
    end

    return render json: user if user
      render json: { user: I18n.t('errors.cant_find_user') }, status: :unprocessable_entity

    rescue JWT::DecodeError
      render json: { user: I18n.t('errors.invalid_token_params') }, status: :unprocessable_entity
  end


  private
  def updated_params
    params.require(:user).permit(:first_name, :last_name, :phone, :address)
  end

  def token_params
    params.require(:user).permit(:token)
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end
