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

ActiveRecord::Schema.define(version: 2020_12_07_150202) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "academic_departaments", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.bigint "faculty_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["faculty_id"], name: "index_academic_departaments_on_faculty_id"
  end

  create_table "academic_programs", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.string "email"
    t.bigint "faculty_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["faculty_id"], name: "index_academic_programs_on_faculty_id"
  end

  create_table "faculties", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "identification_types", force: :cascade do |t|
    t.string "description"
    t.string "summary_description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "code"
    t.string "full_name"
    t.string "document_number"
    t.string "semester"
    t.float "average"
    t.bigint "identification_type_id"
    t.bigint "academic_program_id"
    t.index ["academic_program_id"], name: "index_students_on_academic_program_id"
    t.index ["identification_type_id"], name: "index_students_on_identification_type_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.string "code"
    t.string "full_name"
    t.string "document_number"
    t.integer "type"
    t.bigint "academic_departament_id"
    t.bigint "academic_program_id"
    t.bigint "identification_type_id"
    t.index ["academic_departament_id"], name: "index_teachers_on_academic_departament_id"
    t.index ["academic_program_id"], name: "index_teachers_on_academic_program_id"
    t.index ["identification_type_id"], name: "index_teachers_on_identification_type_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "uuid"
    t.string "name"
    t.string "lastname"
    t.string "code"
    t.string "document_number"
    t.string "contact_number"
    t.bigint "identification_type_id"
    t.bigint "academic_departament_id"
    t.bigint "academic_program_id"
    t.index ["academic_departament_id"], name: "index_users_on_academic_departament_id"
    t.index ["academic_program_id"], name: "index_users_on_academic_program_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["identification_type_id"], name: "index_users_on_identification_type_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

end
