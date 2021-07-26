# frozen_string_literal: true

module Jwt

  class DecryptionService
    SIGNING_ALGORITHM = 'HS256'

    def initialize(token)
      @token = token
    end

    def decrypt!
      JWT.decode(@token, secret).first
    end

    private

    def secret
      Rails.application.credentials.secret
      # ENV["SECRET"]
    end

  end
end
