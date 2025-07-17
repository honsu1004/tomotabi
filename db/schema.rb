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

ActiveRecord::Schema[7.2].define(version: 2025_07_17_104830) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chat_messages", force: :cascade do |t|
    t.bigint "plan_id", null: false
    t.bigint "user_id", null: false
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plan_id"], name: "index_chat_messages_on_plan_id"
    t.index ["user_id"], name: "index_chat_messages_on_user_id"
  end

  create_table "checklist_items", force: :cascade do |t|
    t.bigint "plan_id", null: false
    t.boolean "is_checked"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plan_id"], name: "index_checklist_items_on_plan_id"
  end

  create_table "memories", force: :cascade do |t|
    t.bigint "memory_folder_id", null: false
    t.bigint "user_id", null: false
    t.string "url"
    t.datetime "uploaded_at"
    t.bigint "updated_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["memory_folder_id"], name: "index_memories_on_memory_folder_id"
    t.index ["updated_user_id"], name: "index_memories_on_updated_user_id"
    t.index ["user_id"], name: "index_memories_on_user_id"
  end

  create_table "memory_folders", force: :cascade do |t|
    t.bigint "plan_id", null: false
    t.bigint "updated_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plan_id"], name: "index_memory_folders_on_plan_id"
    t.index ["updated_user_id"], name: "index_memory_folders_on_updated_user_id"
  end

  create_table "notes", force: :cascade do |t|
    t.bigint "plan_id", null: false
    t.bigint "user_id", null: false
    t.text "content"
    t.bigint "updated_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plan_id"], name: "index_notes_on_plan_id"
    t.index ["updated_user_id"], name: "index_notes_on_updated_user_id"
    t.index ["user_id"], name: "index_notes_on_user_id"
  end

  create_table "plan_members", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "plan_id", null: false
    t.datetime "joined_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plan_id"], name: "index_plan_members_on_plan_id"
    t.index ["user_id"], name: "index_plan_members_on_user_id"
  end

  create_table "plans", force: :cascade do |t|
    t.text "title"
    t.text "description"
    t.bigint "user_id", null: false
    t.datetime "start_at"
    t.datetime "end_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_plans_on_user_id"
  end

  create_table "schedule_items", force: :cascade do |t|
    t.bigint "plan_id", null: false
    t.integer "day_number"
    t.string "address"
    t.decimal "latitude"
    t.decimal "longitude"
    t.bigint "updated_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plan_id"], name: "index_schedule_items_on_plan_id"
    t.index ["updated_user_id"], name: "index_schedule_items_on_updated_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "encrypted_password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "chat_messages", "plans"
  add_foreign_key "chat_messages", "users"
  add_foreign_key "checklist_items", "plans"
  add_foreign_key "memories", "memory_folders"
  add_foreign_key "memories", "users"
  add_foreign_key "memories", "users", column: "updated_user_id"
  add_foreign_key "memory_folders", "plans"
  add_foreign_key "memory_folders", "users", column: "updated_user_id"
  add_foreign_key "notes", "plans"
  add_foreign_key "notes", "users"
  add_foreign_key "notes", "users", column: "updated_user_id"
  add_foreign_key "plan_members", "plans"
  add_foreign_key "plan_members", "users"
  add_foreign_key "plans", "users"
  add_foreign_key "schedule_items", "plans"
  add_foreign_key "schedule_items", "users", column: "updated_user_id"
end
