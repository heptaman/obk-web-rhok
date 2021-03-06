# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20161225083921) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "admins", force: :cascade do |t|
    t.string "first_name", limit: 40, null: false
    t.string "last_name", limit: 40
    t.string "email", limit: 255, null: false
    t.string "encrypted_password", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.json "tokens"
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_admins_on_uid_and_provider", unique: true
  end

  create_table "events", force: :cascade do |t|
    t.string "title", limit: 80, null: false
    t.text "description"
    t.datetime "start", null: false
    t.datetime "finish", null: false
    t.integer "min_volunteers"
    t.integer "max_volunteers"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events_volunteers", primary_key: ["event_id", "volunteer_id"], force: :cascade do |t|
    t.bigint "event_id", null: false
    t.bigint "volunteer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "volunteers", force: :cascade do |t|
    t.string "first_name", limit: 40, null: false
    t.string "last_name", limit: 40
    t.string "email", limit: 255, null: false
    t.string "mobile_number", limit: 20
    t.date "dob", null: false
    t.string "gender", limit: 1, null: false
    t.string "wwccn", limit: 15
    t.integer "wwccn_status", default: 0
    t.date "wwccn_expiry_date"
    t.boolean "sub_newsletter", default: true
    t.string "encrypted_password", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.json "tokens"
    t.index ["email"], name: "index_volunteers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_volunteers_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_volunteers_on_uid_and_provider", unique: true
  end

end
