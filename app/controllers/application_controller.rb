class ApplicationController < ActionController::API
  
  rescue_from ActiveRecord::RecordNotFound, with: :not_found!

  # skip_before_action :verify_authenticity_token

  include ActionController::Cookies
  
  include WithSession

 private

 def not_found!
   head(:not_found)
 end
 

end
