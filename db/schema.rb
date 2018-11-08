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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20181022222808) do
=======

ActiveRecord::Schema.define(version: 20181107232939) do
>>>>>>> 0be4d1e4a4256e7cd30124ab9bcb0f89ade1ca33


  create_table "questions", force: :cascade do |t|
    t.string   "questions"
    t.string   "answer"
    t.string   "option2"
    t.string   "option3"
    t.string   "option4"
    t.string   "explanation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
