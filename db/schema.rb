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

ActiveRecord::Schema.define(version: 2020_09_06_150945) do

  create_table "features", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "setting_id"
    t.string "name", null: false
    t.string "value"
    t.boolean "enabled", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_features_on_name"
    t.index ["setting_id"], name: "index_features_on_setting_id"
  end

  create_table "invitations", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "email", null: false
    t.string "provider", null: false
    t.string "invite_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["invite_token"], name: "index_invitations_on_invite_token"
    t.index ["provider"], name: "index_invitations_on_provider"
  end

  create_table "role_permissions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "value", default: ""
    t.boolean "enabled", default: false
    t.bigint "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_role_permissions_on_role_id"
  end

  create_table "roles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.integer "priority", default: 9999
    t.boolean "can_create_rooms", default: false
    t.boolean "send_promoted_email", default: false
    t.boolean "send_demoted_email", default: false
    t.boolean "can_edit_site_settings", default: false
    t.boolean "can_edit_roles", default: false
    t.boolean "can_manage_users", default: false
    t.string "colour"
    t.string "provider"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "provider"], name: "index_roles_on_name_and_provider", unique: true
    t.index ["name"], name: "index_roles_on_name"
    t.index ["priority", "provider"], name: "index_roles_on_priority_and_provider", unique: true
  end

  create_table "rooms", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.string "uid"
    t.string "bbb_id"
    t.integer "sessions", default: 0
    t.datetime "last_session"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "room_settings", default: "{ }"
    t.string "moderator_pw"
    t.string "attendee_pw"
    t.string "access_code"
    t.boolean "deleted", default: false, null: false
    t.date "subscription_date"
    t.text "subscription_message"
    t.index ["bbb_id"], name: "index_rooms_on_bbb_id"
    t.index ["deleted"], name: "index_rooms_on_deleted"
    t.index ["last_session"], name: "index_rooms_on_last_session"
    t.index ["name"], name: "index_rooms_on_name"
    t.index ["sessions"], name: "index_rooms_on_sessions"
    t.index ["uid"], name: "index_rooms_on_uid"
    t.index ["user_id"], name: "index_rooms_on_user_id"
  end

  create_table "settings", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "provider", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["provider"], name: "index_settings_on_provider"
  end

  create_table "shared_accesses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "room_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "room_id"
    t.string "provider"
    t.string "uid"
    t.string "name"
    t.string "username"
    t.string "email"
    t.string "social_uid"
    t.string "image"
    t.string "password_digest"
    t.boolean "accepted_terms", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "email_verified", default: false
    t.string "language", default: "default"
    t.string "reset_digest"
    t.datetime "reset_sent_at"
    t.string "activation_digest"
    t.datetime "activated_at"
    t.boolean "deleted", default: false, null: false
    t.bigint "role_id"
    t.index ["created_at"], name: "index_users_on_created_at"
    t.index ["deleted"], name: "index_users_on_deleted"
    t.index ["email"], name: "index_users_on_email"
    t.index ["password_digest"], name: "index_users_on_password_digest", unique: true
    t.index ["provider"], name: "index_users_on_provider"
    t.index ["role_id"], name: "index_users_on_role_id"
    t.index ["room_id"], name: "index_users_on_room_id"
  end

  create_table "users_roles", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  add_foreign_key "role_permissions", "roles"
end
