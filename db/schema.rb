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

ActiveRecord::Schema.define(version: 2018_10_24_192405) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "categories", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "offerings", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "format"
    t.string "location"
    t.string "price"
    t.integer "organization_id"
    t.string "description"
    t.datetime "date"
    t.string "payment_options"
    t.string "website"
    t.string "materials"
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string "length"
    t.string "slug"
    t.index ["organization_id"], name: "index_offerings_on_organization_id"
  end

  create_table "offerings_tags", id: :serial, force: :cascade do |t|
    t.integer "offering_id"
    t.integer "tag_id"
    t.index ["offering_id"], name: "index_offerings_tags_on_offering_id"
    t.index ["tag_id"], name: "index_offerings_tags_on_tag_id"
  end

  create_table "organizations", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "website"
    t.string "instagram"
    t.string "twitter"
    t.string "facebook"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description"
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string "history"
    t.string "slug"
  end

  create_table "organizations_categories", id: :serial, force: :cascade do |t|
    t.integer "organization_id"
    t.integer "category_id"
    t.index ["category_id"], name: "index_organizations_categories_on_category_id"
    t.index ["organization_id"], name: "index_organizations_categories_on_organization_id"
  end

  create_table "tags", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.integer "role", default: 0
  end

  add_foreign_key "offerings_tags", "offerings"
  add_foreign_key "offerings_tags", "tags"
  add_foreign_key "organizations_categories", "categories"
  add_foreign_key "organizations_categories", "organizations"
end
