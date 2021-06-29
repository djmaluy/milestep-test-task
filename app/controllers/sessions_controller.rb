class SessionsController < ApplicationController

  # before_action :authenticate!, only: %i[show destroy]

  def show
    return render json: { user: { current_user: current_user } } if current_user
    render json: { user: { current_user: nil } }
  end

  def create

    user = User.find_by_email(params[:body][:email])
    
    if user
      assign_jwt_cookies(user) 
      return render json: user
    end
    render json: {
      session: 'Invalid params'
    }, status: :unprocessable_entity
  end

  def destroy
    cookies.delete :session
    head :ok
  end

  private

  def session_params
    params.require(:body).permit(:email, :password)
  end
  
end