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

ActiveRecord::Schema.define(version: 2019_03_05_194645) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "boards", force: :cascade do |t|
    t.text "code_board"
    t.text "board_model"
    t.bigint "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_boards_on_project_id"
  end

  create_table "challenge_has_units", force: :cascade do |t|
    t.text "instruction"
    t.bigint "challenge_id"
    t.bigint "unit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "content"
    t.text "link_video"
    t.index ["challenge_id"], name: "index_challenge_has_units_on_challenge_id"
    t.index ["unit_id"], name: "index_challenge_has_units_on_unit_id"
  end

  create_table "challenges", force: :cascade do |t|
    t.text "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_published"
    t.text "introduction"
  end

  create_table "project_has_units", force: :cascade do |t|
    t.bigint "projects_id"
    t.bigint "units_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["projects_id"], name: "index_project_has_units_on_projects_id"
    t.index ["units_id"], name: "index_project_has_units_on_units_id"
  end

  create_table "project_states", force: :cascade do |t|
    t.text "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "project_types", force: :cascade do |t|
    t.text "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.bigint "unit_id"
    t.bigint "project_state_id"
    t.bigint "challenge_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "users_id"
    t.index ["challenge_id"], name: "index_projects_on_challenge_id"
    t.index ["project_state_id"], name: "index_projects_on_project_state_id"
    t.index ["unit_id"], name: "index_projects_on_unit_id"
    t.index ["users_id"], name: "index_projects_on_users_id"
  end

  create_table "questions", force: :cascade do |t|
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "role_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.bigint "role_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_type_id"], name: "index_roles_on_role_type_id"
  end

  create_table "unit_has_questions", force: :cascade do |t|
    t.bigint "unit_id"
    t.bigint "question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_unit_has_questions_on_question_id"
    t.index ["unit_id"], name: "index_unit_has_questions_on_unit_id"
  end

  create_table "units", force: :cascade do |t|
    t.text "name"
    t.integer "index_order"
    t.text "content"
    t.text "link_video"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_has_roles", force: :cascade do |t|
    t.bigint "role_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_user_has_roles_on_role_id"
    t.index ["user_id"], name: "index_user_has_roles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.datetime "date_of_birth"
    t.string "provider"
    t.string "uid"
    t.text "image"
    t.boolean "suscription"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "boards", "projects"
  add_foreign_key "challenge_has_units", "challenges"
  add_foreign_key "challenge_has_units", "units"
  add_foreign_key "project_has_units", "projects", column: "projects_id"
  add_foreign_key "project_has_units", "units", column: "units_id"
  add_foreign_key "projects", "challenges"
  add_foreign_key "projects", "project_states"
  add_foreign_key "projects", "units"
  add_foreign_key "projects", "users", column: "users_id"
  add_foreign_key "roles", "role_types"
  add_foreign_key "unit_has_questions", "questions"
  add_foreign_key "unit_has_questions", "units"
  add_foreign_key "user_has_roles", "roles"
  add_foreign_key "user_has_roles", "users"
end
