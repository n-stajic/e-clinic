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

ActiveRecord::Schema.define(version: 2020_09_04_150726) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "street"
    t.string "city"
    t.string "country"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "appointments", force: :cascade do |t|
    t.bigint "clinic_id", null: false
    t.bigint "hall_id", null: false
    t.bigint "doctor_id", null: false
    t.bigint "patient_id"
    t.bigint "price_item_id", null: false
    t.datetime "date", null: false
    t.integer "duration"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "fast", default: false
    t.integer "discount"
    t.index ["clinic_id"], name: "index_appointments_on_clinic_id"
    t.index ["doctor_id"], name: "index_appointments_on_doctor_id"
    t.index ["hall_id"], name: "index_appointments_on_hall_id"
    t.index ["patient_id"], name: "index_appointments_on_patient_id"
    t.index ["price_item_id"], name: "index_appointments_on_price_item_id"
  end

  create_table "clinic_doctors", force: :cascade do |t|
    t.bigint "clinic_id", null: false
    t.bigint "doctor_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["clinic_id"], name: "index_clinic_doctors_on_clinic_id"
    t.index ["doctor_id"], name: "index_clinic_doctors_on_doctor_id"
  end

  create_table "clinical_center_admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_clinical_center_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_clinical_center_admins_on_reset_password_token", unique: true
  end

  create_table "clinics", force: :cascade do |t|
    t.string "name"
    t.bigint "address_id", null: false
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["address_id"], name: "index_clinics_on_address_id"
  end

  create_table "doctor_examination_types", force: :cascade do |t|
    t.bigint "doctor_id", null: false
    t.bigint "examination_type_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["doctor_id"], name: "index_doctor_examination_types_on_doctor_id"
    t.index ["examination_type_id"], name: "index_doctor_examination_types_on_examination_type_id"
  end

  create_table "doctors", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "examination_types", force: :cascade do |t|
    t.string "kind"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "halls", force: :cascade do |t|
    t.bigint "clinic_id", null: false
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["clinic_id"], name: "index_halls_on_clinic_id"
  end

  create_table "patients", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.boolean "approved", default: false, null: false
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.string "jmbg"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "address_id"
    t.index ["address_id"], name: "index_patients_on_address_id"
    t.index ["email"], name: "index_patients_on_email", unique: true
    t.index ["reset_password_token"], name: "index_patients_on_reset_password_token", unique: true
  end

  create_table "price_items", force: :cascade do |t|
    t.bigint "price_list_id", null: false
    t.float "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "examination_type_id", null: false
    t.index ["examination_type_id"], name: "index_price_items_on_examination_type_id"
    t.index ["price_list_id"], name: "index_price_items_on_price_list_id"
  end

  create_table "price_lists", force: :cascade do |t|
    t.bigint "clinic_id", null: false
    t.boolean "active", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["clinic_id"], name: "index_price_lists_on_clinic_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.bigint "doctor_id"
    t.bigint "clinic_id"
    t.json "schedule"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["clinic_id"], name: "index_schedules_on_clinic_id"
    t.index ["doctor_id"], name: "index_schedules_on_doctor_id"
  end

  create_table "vacations", force: :cascade do |t|
    t.bigint "doctor_id", null: false
    t.date "from"
    t.date "to"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["doctor_id"], name: "index_vacations_on_doctor_id"
  end

  add_foreign_key "appointments", "clinics"
  add_foreign_key "appointments", "doctors"
  add_foreign_key "appointments", "halls"
  add_foreign_key "appointments", "patients"
  add_foreign_key "appointments", "price_items"
  add_foreign_key "clinic_doctors", "clinics"
  add_foreign_key "clinic_doctors", "doctors"
  add_foreign_key "clinics", "addresses"
  add_foreign_key "doctor_examination_types", "doctors"
  add_foreign_key "doctor_examination_types", "examination_types"
  add_foreign_key "halls", "clinics"
  add_foreign_key "price_items", "examination_types"
  add_foreign_key "price_items", "price_lists"
  add_foreign_key "price_lists", "clinics"
  add_foreign_key "vacations", "doctors"
end
