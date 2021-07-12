# frozen_string_literal: true

module WithSession

  extend ActiveSupport::Concern

  private

  included do

    def secret
        # Rails.application.credentials.secret
        ENV["SECRET"]
    end

    def assign_jwt_cookies(user)
      @user = user
      token = Jwt::EncryptionService.new(user_id: @user.id).token
      time = 24.hours.from_now
      cookies.signed[:session] = { value: token, expires: time, httponly: Rails.env.production?, 
                                    secure: true, same_site: "None" }
    end

    def current_user
      session = cookies.signed[:session]
      return unless session
      decoded = Jwt::DecryptionService.new(session).decrypt!
      @current_user ||= User.find(decoded['sub']['user_id'])
    end

    def authenticate!
      unauthorized! unless current_user
    end

    def unauthorized!
      render json: { error: 'You are not authorized!!!' }, status: :unauthorized
    end

  end
end
