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

ActiveRecord::Schema[8.1].define(version: 2026_05_28_073945) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "curriculums", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "levels", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.bigint "topic_id", null: false
    t.datetime "updated_at", null: false
    t.index ["topic_id"], name: "index_levels_on_topic_id"
  end

  create_table "practices", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "level_id"
    t.integer "score"
    t.boolean "status"
    t.bigint "student_id", null: false
    t.datetime "updated_at", null: false
    t.index ["level_id"], name: "index_practices_on_level_id"
    t.index ["student_id"], name: "index_practices_on_student_id"
  end

  create_table "questions", force: :cascade do |t|
    t.text "correct_answer"
    t.datetime "created_at", null: false
    t.text "explanation"
    t.bigint "practice_id", null: false
    t.text "question"
    t.boolean "status"
    t.datetime "updated_at", null: false
    t.index ["practice_id"], name: "index_questions_on_practice_id"
  end

  create_table "students", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.bigint "year_group_id", null: false
    t.index ["user_id"], name: "index_students_on_user_id"
    t.index ["year_group_id"], name: "index_students_on_year_group_id"
  end

  create_table "topics", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "curriculum_id", null: false
    t.string "name"
    t.datetime "updated_at", null: false
    t.index ["curriculum_id"], name: "index_topics_on_curriculum_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email"
    t.string "password_digest"
    t.datetime "updated_at", null: false
    t.string "username"
  end

  create_table "year_groups", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
  end

  add_foreign_key "levels", "topics"
  add_foreign_key "practices", "levels"
  add_foreign_key "practices", "students"
  add_foreign_key "questions", "practices"
  add_foreign_key "students", "users"
  add_foreign_key "students", "year_groups"
  add_foreign_key "topics", "curriculums"
end
