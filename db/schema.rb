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

ActiveRecord::Schema[8.0].define(version: 2025_05_13_191252) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "contacts", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.text "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "keywords", force: :cascade do |t|
    t.string "name"
    t.boolean "is_long_tail"
    t.string "pillar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_keywords_on_name"
    t.index ["pillar"], name: "index_keywords_on_pillar"
  end

  create_table "seo_pages", force: :cascade do |t|
    t.string "keyword"
    t.string "slug"
    t.string "pillar"
    t.string "meta_title"
    t.string "meta_description"
    t.text "headline"
    t.text "subheading"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["keyword"], name: "index_seo_pages_on_keyword"
    t.index ["pillar"], name: "index_seo_pages_on_pillar"
    t.index ["slug"], name: "index_seo_pages_on_slug"
  end
end
