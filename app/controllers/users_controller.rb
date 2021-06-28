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

  # LOGGING IN
  def login
    
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      payload = {user_id: user.id}
      token = encode(payload)
      render json: { user: user, token: token }
      
    else
      render json: { error: "User not found" }
    end
  end


  def token_authenticate
   
    token = request.headers["Authenticate"]
    user = User.find(decode(token)["user_id"])

    render json: user
    
  end
  
  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
