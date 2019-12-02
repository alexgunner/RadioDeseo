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

ActiveRecord::Schema.define(version: 2019_12_02_183742) do

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.text "description"
  end

  create_table "labels", force: :cascade do |t|
    t.string "name"
    t.text "description"
  end

  create_table "post_categories", force: :cascade do |t|
    t.integer "post_id"
    t.integer "category_id"
    t.index ["category_id"], name: "index_post_categories_on_category_id"
    t.index ["post_id"], name: "index_post_categories_on_post_id"
  end

  create_table "post_labels", force: :cascade do |t|
    t.integer "post_id"
    t.integer "label_id"
    t.index ["label_id"], name: "index_post_labels_on_label_id"
    t.index ["post_id"], name: "index_post_labels_on_post_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "name"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "radio_hosts", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "radio_schedules", force: :cascade do |t|
    t.time "starts_at"
    t.time "ends_at"
    t.integer "days"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "radio_shows", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "show_hosts", force: :cascade do |t|
    t.integer "radio_show_id"
    t.integer "radio_host_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["radio_host_id"], name: "index_show_hosts_on_radio_host_id"
    t.index ["radio_show_id"], name: "index_show_hosts_on_radio_show_id"
  end

  create_table "show_schedules", force: :cascade do |t|
    t.integer "radio_show_id"
    t.integer "radio_schedule_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["radio_schedule_id"], name: "index_show_schedules_on_radio_schedule_id"
    t.index ["radio_show_id"], name: "index_show_schedules_on_radio_show_id"
  end

end
