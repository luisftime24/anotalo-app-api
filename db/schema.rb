# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 20_220_422_064_648) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'covers', force: :cascade do |t|
    t.string 'cover_url'
    t.integer 'cover_size'
    t.string 'cover_name'
    t.bigint 'note_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['note_id'], name: 'index_covers_on_note_id'
  end

  create_table 'notes', force: :cascade do |t|
    t.string 'title'
    t.text 'body'
    t.string 'color', default: '#ffffff'
    t.bigint 'user_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_notes_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'name'
    t.string 'last_name'
    t.string 'email'
    t.string 'password_digest'
    t.string 'token'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['token'], name: 'index_users_on_token', unique: true
  end

  add_foreign_key 'covers', 'notes'
  add_foreign_key 'notes', 'users'
end
