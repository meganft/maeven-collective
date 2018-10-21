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

ActiveRecord::Schema.define(version: 20181018190504) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "offerings", force: :cascade do |t|
    t.string   "name"
    t.string   "format"
    t.string   "location"
    t.string   "price"
    t.integer  "organization_id"
    t.string   "description"
    t.datetime "date"
    t.string   "payment_options"
    t.string   "website"
    t.string   "materials"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "length"
    t.string   "slug"
    t.index ["organization_id"], name: "index_offerings_on_organization_id", using: :btree
  end

  create_table "offerings_tags", force: :cascade do |t|
    t.integer "offering_id"
    t.integer "tag_id"
    t.index ["offering_id"], name: "index_offerings_tags_on_offering_id", using: :btree
    t.index ["tag_id"], name: "index_offerings_tags_on_tag_id", using: :btree
  end

  create_table "organizations", force: :cascade do |t|
    t.string   "name"
    t.string   "website"
    t.string   "instagram"
    t.string   "twitter"
    t.string   "facebook"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "description"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "history"
    t.string   "slug"
  end

  create_table "organizations_categories", force: :cascade do |t|
    t.integer "organization_id"
    t.integer "category_id"
    t.index ["category_id"], name: "index_organizations_categories_on_category_id", using: :btree
    t.index ["organization_id"], name: "index_organizations_categories_on_organization_id", using: :btree
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "password_digest"
    t.integer  "role",            default: 0
  end

  add_foreign_key "offerings_tags", "offerings"
  add_foreign_key "offerings_tags", "tags"
  add_foreign_key "organizations_categories", "categories"
  add_foreign_key "organizations_categories", "organizations"
end
