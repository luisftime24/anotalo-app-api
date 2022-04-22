class CreateCovers < ActiveRecord::Migration[7.0]
  def change
    create_table :covers do |t|
      t.string :cover_url
      t.integer :cover_size
      t.string :cover_name
      t.references :note, null: false, foreign_key: true

      t.timestamps
    end
  end
end
