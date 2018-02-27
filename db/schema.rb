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

ActiveRecord::Schema.define(version: 20180227000018) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "citext"

  create_table "activities", force: :cascade do |t|
    t.integer "duration"
    t.date "date_performed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "patient_id"
    t.text "description"
    t.index ["patient_id"], name: "index_activities_on_patient_id"
  end

  create_table "appointments", force: :cascade do |t|
    t.string "status"
    t.bigint "patient_id"
    t.bigint "doctor_id"
    t.date "date"
    t.time "time"
    t.index ["doctor_id"], name: "index_appointments_on_doctor_id"
    t.index ["patient_id"], name: "index_appointments_on_patient_id"
  end

  create_table "authorizations", force: :cascade do |t|
    t.string "provider"
    t.string "uid"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "doctors", force: :cascade do |t|
    t.citext "name"
    t.citext "specialty"
    t.citext "location"
    t.string "phone"
    t.string "insurance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_doctors_on_user_id"
  end

  create_table "exercises", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "medications", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.string "title"
    t.string "content"
    t.integer "status", default: 0
    t.bigint "patient_id"
    t.bigint "doctor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["doctor_id"], name: "index_messages_on_doctor_id"
    t.index ["patient_id"], name: "index_messages_on_patient_id"
  end

  create_table "notes", force: :cascade do |t|
    t.text "contents"
    t.string "noteable_type"
    t.bigint "noteable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["noteable_type", "noteable_id"], name: "index_notes_on_noteable_type_and_noteable_id"
  end

  create_table "patient_doctors", force: :cascade do |t|
    t.bigint "doctor_id"
    t.bigint "patient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["doctor_id"], name: "index_patient_doctors_on_doctor_id"
    t.index ["patient_id"], name: "index_patient_doctors_on_patient_id"
  end

  create_table "patient_medications", force: :cascade do |t|
    t.integer "freq_per_day"
    t.string "dosage"
    t.bigint "patient_id"
    t.bigint "medication_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["medication_id"], name: "index_patient_medications_on_medication_id"
    t.index ["patient_id"], name: "index_patient_medications_on_patient_id"
  end

  create_table "patients", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "uid"
    t.string "token"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_patients_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "uid"
    t.string "token"
  end

  add_foreign_key "activities", "patients"
  add_foreign_key "appointments", "doctors"
  add_foreign_key "appointments", "patients"
  add_foreign_key "doctors", "users"
  add_foreign_key "messages", "doctors"
  add_foreign_key "messages", "patients"
  add_foreign_key "patient_doctors", "doctors"
  add_foreign_key "patient_doctors", "patients"
  add_foreign_key "patient_medications", "medications"
  add_foreign_key "patient_medications", "patients"
  add_foreign_key "patients", "users"
end
