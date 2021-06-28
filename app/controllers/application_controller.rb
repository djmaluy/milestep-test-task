class ApplicationController < ActionController::API

	# include ::ActionController::Cookies
 
  def secret_key
    's3cr3t'
  end

  def encode(payload)
    JWT.encode(payload, secret_key, 'HS256')
  end

  def decode(token)
      JWT.decode(token, 's3cr3t', true, { algorithm: 'HS256'})[0]
  end


 
  # def authenticate_user
  #   jwt = cookies.signed[:jwt]
  #   decode_jwt(jwt)
  # end
end
