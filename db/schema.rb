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

ActiveRecord::Schema[7.0].define(version: 2022_05_19_164859) do
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

end
