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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110701193415) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "districts", :force => true do |t|
    t.string   "name"
    t.integer  "state_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "images", :force => true do |t|
    t.string   "ATTACHMENT_file_name"
    t.string   "ATTACHMENT_content_type"
    t.integer  "ATTACHMENT_file_size"
    t.datetime "ATTACHMENT_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ngos", :force => true do |t|
    t.string   "name"
    t.integer  "category_id"
    t.integer  "state_id"
    t.integer  "district_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "people", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "emailid"
    t.integer  "state_id"
    t.integer  "district_id"
    t.integer  "age"
    t.string   "qualification"
    t.string   "job_status"
    t.string   "sex"
    t.string   "address"
    t.integer  "contact_number"
    t.boolean  "rural"
    t.integer  "photo_id"
  end

  create_table "photos", :force => true do |t|
    t.boolean  "image_of_people"
    t.integer  "people_id"
    t.integer  "sponsor_id"
    t.binary   "image_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "slides", :force => true do |t|
    t.binary "image", :limit => 16777215
  end

  create_table "sponsors", :force => true do |t|
    t.integer  "name"
    t.string   "emailid"
    t.integer  "state_id"
    t.integer  "people"
    t.integer  "district_id"
    t.integer  "integer"
    t.integer  "age"
    t.string   "qualification"
    t.string   "job_status"
    t.string   "sex"
    t.string   "address"
    t.integer  "contact_number"
    t.boolean  "rural"
    t.integer  "photo_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "states", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
