# frozen_string_literal: true

require 'digest'

module Jwt

  class EncryptionService
    SIGNING_ALGORITHM = 'HS256'

    def initialize(user_id)
      @user_id = user_id
    end

    def token
      JWT.encode(payload, secret, SIGNING_ALGORITHM)
    end

    private

    def payload
      @payload ||= { iat: current_time, sub: @user_id }
    end

    def current_time
      Time.now.to_i
    end

    def secret
      ENV["SECRET"]
    end
  end
end
