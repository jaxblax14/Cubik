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

ActiveRecord::Schema.define(version: 2019_02_22_172616) do

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
    t.index ["challenge_id"], name: "index_challenge_has_units_on_challenge_id"
    t.index ["unit_id"], name: "index_challenge_has_units_on_unit_id"
  end

  create_table "challenges", force: :cascade do |t|
    t.text "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.index ["challenge_id"], name: "index_projects_on_challenge_id"
    t.index ["project_state_id"], name: "index_projects_on_project_state_id"
    t.index ["unit_id"], name: "index_projects_on_unit_id"
  end

  create_table "questions", force: :cascade do |t|
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  add_foreign_key "boards", "projects"
  add_foreign_key "challenge_has_units", "challenges"
  add_foreign_key "challenge_has_units", "units"
  add_foreign_key "projects", "challenges"
  add_foreign_key "projects", "project_states"
  add_foreign_key "projects", "units"
  add_foreign_key "unit_has_questions", "questions"
  add_foreign_key "unit_has_questions", "units"
end
