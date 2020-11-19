# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_11_19_111830) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "bookings", force: :cascade do |t|
    t.bigint "office_id", null: false
    t.bigint "user_id", null: false
    t.date "booking_start"
    t.date "booking_end"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["office_id"], name: "index_bookings_on_office_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "offices", force: :cascade do |t|
    t.string "office_name"
    t.string "description"
    t.integer "rate_per_day"
    t.boolean "wifi"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "latitude"
    t.float "longitude"
    t.string "address_street"
    t.string "address_zip"
    t.string "address_city"
    t.integer "table_num"
    t.string "placehold_url"
    t.boolean "drinks"
    t.boolean "snacks"
    t.boolean "social_events"
    t.boolean "community_slack"
    t.boolean "pets_allowed"
    t.boolean "night_shift"
    t.boolean "community_manager"
    t.boolean "outdoor_area"
    t.boolean "smoking_area"
    t.boolean "cat_open_space"
    t.boolean "cat_single_space"
    t.boolean "cat_corporate"
    t.boolean "cat_startup"
    t.boolean "cat_private_owner"
    t.boolean "cat_skyscraper"
    t.boolean "cat_city"
    t.boolean "cat_rural"
    t.boolean "cat_boutique"
    t.boolean "cat_black_lable"
    t.index ["user_id"], name: "index_offices_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "bookings", "offices"
  add_foreign_key "bookings", "users"
  add_foreign_key "offices", "users"
end
