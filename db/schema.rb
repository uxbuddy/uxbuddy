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

ActiveRecord::Schema.define(version: 20161025150223) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.string   "format"
    t.string   "response"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "question_id"
    t.index ["question_id"], name: "index_answers_on_question_id", using: :btree
  end

  create_table "default_questions", force: :cascade do |t|
    t.string   "type"
    t.text     "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "format"
    t.text     "text"
    t.integer  "test_id"
    t.index ["test_id"], name: "index_questions_on_test_id", using: :btree
  end

  create_table "questions_test_types", force: :cascade do |t|
    t.integer "test_type_id"
    t.integer "question_id"
    t.index ["question_id"], name: "index_questions_test_types_on_question_id", using: :btree
    t.index ["test_type_id"], name: "index_questions_test_types_on_test_type_id", using: :btree
  end

  create_table "test_types", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "tests", force: :cascade do |t|
    t.string   "name"
    t.string   "test_url"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "test_type_id"
    t.index ["test_type_id"], name: "index_tests_on_test_type_id", using: :btree
  end

  create_table "tests_questions", force: :cascade do |t|
    t.integer "question_id"
    t.integer "test_id"
    t.index ["question_id"], name: "index_tests_questions_on_question_id", using: :btree
    t.index ["test_id"], name: "index_tests_questions_on_test_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "answers", "questions"
  add_foreign_key "questions", "tests"
  add_foreign_key "questions_test_types", "questions"
  add_foreign_key "questions_test_types", "test_types"
  add_foreign_key "tests", "test_types"
  add_foreign_key "tests_questions", "questions"
  add_foreign_key "tests_questions", "tests"
end
