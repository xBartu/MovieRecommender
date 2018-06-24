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

ActiveRecord::Schema.define(version: 2018_06_24_131057) do

  create_table "genres", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.text "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "photo_url"
  end

  create_table "genres_movies", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "genre_id", null: false
    t.bigint "movie_id", null: false
  end

  create_table "genres_users", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "genre_id", null: false
    t.bigint "user_id", null: false
    t.index ["genre_id"], name: "index_genres_users_on_genre_id"
    t.index ["user_id"], name: "index_genres_users_on_user_id"
  end

  create_table "movies", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title"
    t.text "desc"
    t.string "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "relase_date"
  end

  create_table "movies_people", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "movie_id", null: false
    t.bigint "person_id", null: false
    t.bigint "role_id", null: false
    t.bigint "people_roles_id"
    t.index ["movie_id"], name: "index_movies_people_on_movie_id"
    t.index ["people_roles_id"], name: "index_movies_people_on_people_roles_id"
    t.index ["person_id"], name: "index_movies_people_on_person_id"
    t.index ["role_id"], name: "index_movies_people_on_role_id"
  end

  create_table "people", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "photo_url"
    t.text "bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.date "birthday"
  end

  create_table "people_roles", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "person_id", null: false
    t.bigint "role_id", null: false
    t.bigint "people_id"
    t.bigint "roles_id"
    t.index ["people_id"], name: "index_people_roles_on_people_id"
    t.index ["roles_id"], name: "index_people_roles_on_roles_id"
  end

  create_table "people_users", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "person_id", null: false
    t.bigint "user_id", null: false
    t.index ["person_id"], name: "index_people_users_on_person_id"
    t.index ["user_id"], name: "index_people_users_on_user_id"
  end

  create_table "roles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "last_notification", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "movies_people", "roles"
  add_foreign_key "people_roles", "people", column: "people_id"
  add_foreign_key "people_roles", "roles", column: "roles_id"
end
