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

ActiveRecord::Schema.define(version: 20170328130732) do

  create_table "courses", force: :cascade do |t|
    t.string   "code"
    t.string   "name"
    t.text     "description"
    t.string   "independent_study"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "enrollments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_enrollments_on_course_id"
    t.index ["user_id", "course_id"], name: "index_enrollments_on_user_id_and_course_id", unique: true
    t.index ["user_id"], name: "index_enrollments_on_user_id"
  end

  create_table "instructors", force: :cascade do |t|
    t.string   "email"
    t.string   "first"
    t.string   "middle"
    t.string   "last"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "identifier"
    t.index ["identifier"], name: "index_instructors_on_identifier"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer  "course_id"
    t.string   "subject_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "segments", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subjects", force: :cascade do |t|
    t.string   "name"
    t.string   "abbreviation"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "identifier"
    t.index ["identifier"], name: "index_subjects_on_identifier"
  end

  create_table "users", force: :cascade do |t|
    t.string   "account"
    t.string   "firstname"
    t.string   "lastname"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
  end

end
