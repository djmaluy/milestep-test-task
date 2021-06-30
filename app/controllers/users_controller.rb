class UsersController < ApplicationController
  

  # REGISTER
  
  def create
    user = User.create(user_params)
    if user.save
      render json: "Welcome"
    else
      render json: "Something went wrong"
    end
  end

 
  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end
