class User < ApplicationRecord

  # Associations
  has_many :notes, dependent: :destroy

  # Validations
  validates :last_name, :name, presence: true, length: { in: 3..30 }
  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, length: { in: 6..30 }

  has_secure_token
  has_secure_password
end
