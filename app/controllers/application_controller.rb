class ApplicationController < ActionController::API
  
  rescue_from ActiveRecord::RecordNotFound, with: :not_found!

  
  include ActionController::Cookies
  
  include WithSession

 private

 def not_found!
   head(:not_found)
 end
 

end
