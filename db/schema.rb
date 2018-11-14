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

ActiveRecord::Schema.define(version: 2018_11_14_160813) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "course_by_profs", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "course_id"
    t.float "overall_rating"
    t.float "hours_per_week"
    t.string "course_number"
    t.string "course_title"
    t.string "instructors_string"
    t.string "instructor_ids"
    t.float "course_price"
    t.float "clear"
    t.float "interesting"
    t.float "useful"
    t.float "reccommend"
  end

  create_table "courses", force: :cascade do |t|
    t.integer "number"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "evals", force: :cascade do |t|
    t.string "section"
    t.string "quarter"
    t.integer "year"
    t.integer "enrl"
    t.integer "num_responses"
    t.integer "percent_responded"
    t.float "hours_per_week"
    t.float "clear"
    t.float "interesting"
    t.float "useful"
    t.float "overall"
    t.float "reccommend"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "course_by_prof_id"
  end

  create_table "instructors", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sections", force: :cascade do |t|
    t.string "number"
    t.integer "course_id"
    t.integer "course_by_prof_id"
    t.string "quarter"
    t.integer "year"
    t.string "day"
    t.time "start_time"
    t.time "end_time"
    t.integer "phase_1_enrollment"
    t.integer "phase_1_seats_available"
    t.integer "phase_1_price"
    t.integer "phase_2_enrollment"
    t.integer "phase_2_price"
    t.integer "phase_3_enrollment"
    t.integer "phase_3_seats_available"
    t.integer "phase_3_price"
    t.integer "phase_4_seats_available"
    t.integer "phase_4_price"
    t.integer "enrl"
    t.integer "num_responses"
    t.integer "percent_responded"
    t.float "hours_per_week"
    t.float "clear"
    t.float "interesting"
    t.float "useful"
    t.float "overall"
    t.float "reccommend"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "phase_2_seats_available"
    t.integer "phase_4_enrollment"
  end

  create_table "taught_bies", force: :cascade do |t|
    t.integer "course_id"
    t.integer "instructor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teachings", force: :cascade do |t|
    t.integer "course_by_prof_id"
    t.integer "instructor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.boolean "admin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
