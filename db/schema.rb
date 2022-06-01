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

ActiveRecord::Schema[7.0].define(version: 2022_05_30_125330) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "city_towns", force: :cascade do |t|
    t.uuid "assigned_code", default: -> { "gen_random_uuid()" }
    t.string "name"
    t.text "description"
    t.boolean "del_status", default: false
    t.boolean "active_status", default: true
    t.string "region_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string "last_name"
    t.string "first_name"
    t.string "phone"
    t.text "description"
    t.boolean "del_status", default: false
    t.boolean "active_status", default: true
    t.string "locality_code"
    t.uuid "assigned_code", default: -> { "gen_random_uuid()" }
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "localities", force: :cascade do |t|
    t.uuid "assigned_code", default: -> { "gen_random_uuid()" }
    t.string "name"
    t.text "description"
    t.boolean "del_status", default: false
    t.boolean "active_status", default: true
    t.string "suburb_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "regions", force: :cascade do |t|
    t.uuid "assigned_code", default: -> { "gen_random_uuid()" }
    t.string "name"
    t.text "description"
    t.boolean "del_status", default: false
    t.boolean "active_status", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "suburbs", force: :cascade do |t|
    t.uuid "assigned_code", default: -> { "gen_random_uuid()" }
    t.string "name"
    t.text "description"
    t.boolean "del_status", default: false
    t.boolean "active_status", default: true
    t.string "city_town_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.uuid "assigned_code", default: -> { "gen_random_uuid()" }
    t.string "email", default: "", null: false
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.string "phone", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.boolean "del_status", default: false
    t.boolean "active_status", default: true
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

end
