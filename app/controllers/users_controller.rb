class UsersController < ApplicationController
  

  # REGISTER
  # need refactoring
  def create
    @user = User.create(user_params)
    if @user.valid?
      token = encode({ user_id: @user.id })
      render json: { user: @user, token: token }
    else
      render json: { error: "Invalid username or password" }
    end
  end

 
  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
