# frozen_string_literal: true

class JwtService
  class << self
    def encode(payload)
      hmac_secret = 'secret'
      JWT.encode payload, hmac_secret, 'HS256'
    rescue JWT::EncodeError => e
      puts "Payload: #{payload} Error: #{e.message} "
    end

    def decode(token)
      hmac_secret = 'secret'
      JWT.decode token, hmac_secret, true, { algorithm: 'HS256' }
    rescue JWT::ExpiredSignature => e
      logger.info "Token: #{token} Error: #{e.message} "
    rescue JWT::VerificationError => e
      logger.info "Token: #{token} Error: #{e.message} "
    rescue JWT::InvalidPayload => e
      logger.info "Token: #{token} Error: #{e.message} "
    end
  end
end
