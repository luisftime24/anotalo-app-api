class Note < ApplicationRecord
  # Associations
  has_one :cover, dependent: :destroy

  # Validations
  validates :title, presence: true, length: { in: 1..50 }
  validates :body, presence: true, length: { maximum: 1000 }
  validates :color, presence: true, default: '#ffffff'

end
