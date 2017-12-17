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

ActiveRecord::Schema.define(version: 20171217174118) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "doctors", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "specialty"
    t.string "location"
    t.integer "years_experience"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "medications", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.string "email"
    t.string "password"
    t.integer "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "doctor_id"
    t.index ["doctor_id"], name: "index_patients_on_doctor_id"
  end

  create_table "therapist_patients", force: :cascade do |t|
    t.bigint "therapist_id"
    t.bigint "patient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_therapist_patients_on_patient_id"
    t.index ["therapist_id"], name: "index_therapist_patients_on_therapist_id"
  end

  create_table "therapists", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "therapy_type"
    t.integer "years_experience"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "patient_medications", "medications"
  add_foreign_key "patient_medications", "patients"
  add_foreign_key "patients", "doctors"
  add_foreign_key "therapist_patients", "patients"
  add_foreign_key "therapist_patients", "therapists"
end
