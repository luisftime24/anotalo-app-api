# frozen_string_literal: true

class Note < ApplicationRecord
  # Associations
  belongs_to :user
  has_one :cover, dependent: :destroy

  # Validations
  validates :title, presence: true, length: { in: 1..50 }
  validates :body, presence: true, length: { maximum: 1000 }
end
