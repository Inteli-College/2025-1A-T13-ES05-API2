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

ActiveRecord::Schema[8.0].define(version: 2025_02_25_143826) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.string "course_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "enrollments", force: :cascade do |t|
    t.bigint "student_id", null: false
    t.bigint "institution_id", null: false
    t.bigint "course_id", null: false
    t.string "shift"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_enrollments_on_course_id"
    t.index ["institution_id"], name: "index_enrollments_on_institution_id"
    t.index ["student_id"], name: "index_enrollments_on_student_id"
  end

  create_table "institutions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.string "academic_id"
    t.string "name"
    t.string "email"
    t.date "date_of_birth"
    t.string "contact_phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "enrollments", "courses"
  add_foreign_key "enrollments", "institutions"
  add_foreign_key "enrollments", "students"
end
