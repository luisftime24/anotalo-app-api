# frozen_string_literal: true

class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods

  before_action :require_login!

  def require_login!
    current_user || render_unauthorized('Access Denied')
  end

  def current_user
    @current_user ||= authenticate_token
  end

  def render_unauthorized(error_message)
    render json: { errors: error_message }, status: :unauthorized
  end

  def authenticate_token
    authenticate_with_http_token do |token, _options|
      User.where(token: token).first
    end
  end
end
