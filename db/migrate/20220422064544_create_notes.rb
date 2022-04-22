# frozen_string_literal: true

class CreateNotes < ActiveRecord::Migration[7.0]
  def change
    create_table :notes do |t|
      t.string :title
      t.text :body
      t.string :color, default: '#ffffff'
      t.references :user, foreign_key: true, index: true

      t.timestamps
    end
  end
end
