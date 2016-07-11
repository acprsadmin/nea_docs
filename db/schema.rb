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

ActiveRecord::Schema.define(version: 20160708143727) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chapters", force: :cascade do |t|
    t.string   "name"
    t.text     "body"
    t.float    "ordernum"
    t.integer  "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.string   "title"
    t.text     "body"
    t.string   "subject"
    t.integer  "user_id",          null: false
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["commentable_id", "commentable_type"], name: "index_comments_on_commentable_id_and_commentable_type", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "dbfields", force: :cascade do |t|
    t.string   "name"
    t.string   "dbname"
    t.text     "description"
    t.integer  "fieldtype"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "dbtables", force: :cascade do |t|
    t.string   "name"
    t.string   "dbname"
    t.text     "description"
    t.integer  "tabletype"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "fieldtypes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "imagesets", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "levels", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "post_translations", force: :cascade do |t|
    t.integer  "post_id",     null: false
    t.string   "locale",      null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "title"
    t.text     "description"
  end

  add_index "post_translations", ["locale"], name: "index_post_translations_on_locale", using: :btree
  add_index "post_translations", ["post_id"], name: "index_post_translations_on_post_id", using: :btree

  create_table "posts", force: :cascade do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "post_type"
    t.decimal  "post_value"
    t.date     "published_at"
    t.boolean  "is_featured"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "requestlogs", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "reqaction"
    t.integer  "request_id"
    t.integer  "nea_decision"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "requests", force: :cascade do |t|
    t.string   "oldcode"
    t.integer  "acprsrole"
    t.integer  "origin"
    t.integer  "creator_id"
    t.string   "requestor"
    t.string   "requestor_email"
    t.string   "subject"
    t.integer  "requesttype"
    t.boolean  "urgent"
    t.text     "description"
    t.text     "pillar_response"
    t.integer  "impact_hour"
    t.boolean  "modernize"
    t.string   "impact_duration"
    t.string   "impact_schedule"
    t.date     "submitted_on"
    t.integer  "submitter_id"
    t.date     "responded_on"
    t.integer  "responder_id"
    t.integer  "nea_decision"
    t.date     "decided_on"
    t.integer  "decided_by"
    t.text     "decisiontext"
    t.text     "conditions"
    t.date     "developed_on"
    t.date     "tested_on"
    t.date     "deployed_on"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "resource_translations", force: :cascade do |t|
    t.integer  "resource_id", null: false
    t.string   "locale",      null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "title"
    t.text     "body"
  end

  add_index "resource_translations", ["locale"], name: "index_resource_translations_on_locale", using: :btree
  add_index "resource_translations", ["resource_id"], name: "index_resource_translations_on_resource_id", using: :btree

  create_table "resources", force: :cascade do |t|
    t.string   "submitter"
    t.string   "position"
    t.string   "orgname"
    t.string   "submitter_email"
    t.string   "submitter_phone"
    t.string   "mepi_project"
    t.string   "mepi_project_number"
    t.boolean  "focus_women"
    t.boolean  "focus_youth"
    t.datetime "published_at"
    t.integer  "nid"
    t.integer  "number_pages"
    t.string   "doc_types"
    t.integer  "materialtype_id"
    t.string   "website"
    t.string   "partner_orgs"
    t.string   "presenter"
    t.string   "training_event"
    t.datetime "event_date"
    t.integer  "language"
    t.integer  "tnid"
    t.integer  "organization_id"
    t.integer  "pid"
    t.integer  "pnid"
    t.integer  "tid"
    t.integer  "series_id"
    t.integer  "project_id"
    t.boolean  "is_featured"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "searches", force: :cascade do |t|
    t.string   "search_term"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "technicalarea_ids"
    t.string   "targetgroup_ids"
    t.string   "organization_ids"
  end

  create_table "sections", force: :cascade do |t|
    t.string   "name"
    t.text     "body"
    t.float    "ordernum"
    t.integer  "level_id"
    t.integer  "imageset"
    t.string   "caption"
    t.float    "oldorder"
    t.text     "adminnotes"
    t.integer  "book"
    t.integer  "toc1"
    t.integer  "toc2"
    t.integer  "toc3"
    t.integer  "pagetype"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "site_document_translations", force: :cascade do |t|
    t.integer  "site_document_id", null: false
    t.string   "locale",           null: false
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "name"
  end

  add_index "site_document_translations", ["locale"], name: "index_site_document_translations_on_locale", using: :btree
  add_index "site_document_translations", ["site_document_id"], name: "index_site_document_translations_on_site_document_id", using: :btree

  create_table "site_documents", force: :cascade do |t|
    t.string   "documentable_type"
    t.integer  "documentable_id"
    t.integer  "nid"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "document_file_name"
    t.string   "document_content_type"
    t.integer  "document_file_size"
    t.datetime "document_updated_at"
  end

  create_table "site_images", force: :cascade do |t|
    t.string   "name"
    t.string   "imageable_type"
    t.integer  "imageable_id"
    t.boolean  "is_logo"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "tabletypes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.integer  "role"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
