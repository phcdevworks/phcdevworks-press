# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_08_05_232733) do

  create_table "categories_posts", id: false, force: :cascade do |t|
    t.integer "category_id", null: false
    t.integer "post_id", null: false
  end

  create_table "phcdevworks_cms_press_article_categories", force: :cascade do |t|
    t.string "category_name"
    t.string "slug"
    t.string "user_id"
    t.string "org_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "phcdevworks_cms_press_article_posts", force: :cascade do |t|
    t.string "post_title"
    t.string "post_text"
    t.string "post_status"
    t.string "post_image"
    t.string "slug"
    t.string "user_id"
    t.string "org_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "phcdevworks_cms_press_category_versions", force: :cascade do |t|
    t.string "item_type", null: false
    t.integer "item_id", null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.text "object", limit: 1073741823
    t.datetime "created_at"
    t.index ["item_type", "item_id"], name: "press_category_versions"
  end

  create_table "phcdevworks_cms_press_post_versions", force: :cascade do |t|
    t.string "item_type", null: false
    t.integer "item_id", null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.text "object", limit: 1073741823
    t.datetime "created_at"
    t.index ["item_type", "item_id"], name: "press_post_versions"
  end

end
