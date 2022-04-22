# frozen_string_literal: true

class SessionsController < ApplicationController
  skip_before_action :require_login!, only: :create

  def create
    user = User.authenticated_user?(params[:email], params[:password])
    if user
      render json: user, status: :ok
    else
      render_unauthorized('Email or password is invalid')
    end
  end

  def destroy
    if current_user.invalidate_token
      render json: { message: 'Successfully logged out' }, status: :ok
    else
      render_unauthorized('Failed to log out')
    end
  end
end
