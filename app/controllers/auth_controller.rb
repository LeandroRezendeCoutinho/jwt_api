# frozen_string_literal: true

class AuthController < ApplicationController
  FIVE_MINUTES_FROM_NOW = Time.now.to_i + 300
  def create
    payload = { action: 'inactivate', store: 100, exp: FIVE_MINUTES_FROM_NOW }
    token = JwtService.encode(payload)
    render json: { token: token }
  end

  def confirm
    token = params[:token]
    decoded = JwtService.decode(token)
    puts decoded
  end
end
