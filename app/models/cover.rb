# frozen_string_literal: true

class Cover < ApplicationRecord
  # Associations
  belongs_to :note

  # Validations
  validates :cover_url, :cover_size, :cover_name, presence: true
end
