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

ActiveRecord::Schema[7.1].define(version: 2024_09_05_201337) do
  create_table "areas", force: :cascade do |t|
    t.string "name"
  end

  create_table "drivers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "area_id"
    t.index ["area_id"], name: "index_drivers_on_area_id"
    t.index ["email"], name: "index_drivers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_drivers_on_reset_password_token", unique: true
  end

  create_table "messages", force: :cascade do |t|
    t.string "content", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "driver_id", null: false
    t.string "message_type", null: false
    t.integer "staff_id"
    t.index ["driver_id"], name: "index_messages_on_driver_id"
    t.index ["staff_id"], name: "index_messages_on_staff_id"
  end

  create_table "notices", force: :cascade do |t|
    t.string "title", null: false
    t.text "content"
    t.date "start_date"
    t.time "start_time"
    t.date "end_date"
    t.time "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "created_by_id"
    t.index ["created_by_id"], name: "index_notices_on_created_by_id"
  end

  create_table "staff", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "staff_type", default: "D", null: false
    t.index ["email"], name: "index_staff_on_email", unique: true
    t.index ["reset_password_token"], name: "index_staff_on_reset_password_token", unique: true
  end

  add_foreign_key "drivers", "areas"
  add_foreign_key "messages", "drivers"
  add_foreign_key "messages", "staff"
  add_foreign_key "notices", "staff", column: "created_by_id"
end
