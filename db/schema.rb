# encoding: UTF-8
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


ActiveRecord::Schema.define(version: 20181205025039) do
  create_table "activity_logs", force: :cascade do |t|
    t.string   "item_name"
    t.string   "act_action"
    t.string   "updated_by"
    t.text     "activity"
    t.datetime "act_tstamp", default: '2018-12-05 18:21:24'
  end

  create_table "feedbacks", force: :cascade do |t|
    t.text     "feedback_text"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "rating"
  end

  create_table "questions", force: :cascade do |t|
    t.string   "questions"
    t.string   "answer"
    t.string   "option2"
    t.string   "option3"
    t.string   "option4"
    t.string   "explanation"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "level"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "score",                  default: 0
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
