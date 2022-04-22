# frozen_string_literal: true

class User < ApplicationRecord
  # Associations
  has_many :notes, dependent: :destroy

  # Validations
  validates :last_name, :name, presence: true, length: { in: 3..30 }
  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  has_secure_token
  has_secure_password


  # Methods
  def invalidate_token
    update(token: nil)
  end

  def self.authenticated_user?(email, password)
    user = User.find_by(email: email)
    return false unless user&.authenticate(password)

    user.regenerate_token
    user
  end
end
