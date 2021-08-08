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

ActiveRecord::Schema.define(version: 2014_07_07_111715) do

  create_table "attachments", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "id", null: false
    t.string "mime_type", limit: 50
    t.string "metadata", limit: 50
    t.binary "content"
    t.index ["id"], name: "id", unique: true
  end

  create_table "book", primary_key: "book_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.text "img_path", null: false
    t.text "title", null: false
    t.text "author", null: false
    t.text "publisher", null: false
    t.text "description", null: false
    t.integer "quantity", null: false
    t.text "category"
    t.date "publish_date"
    t.integer "upload_id"
    t.string "isbn", limit: 20
    t.text "sku"
  end

  create_table "category", primary_key: "no", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "sub_category", limit: 30
    t.string "category", limit: 30
  end

  create_table "department", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "dept_id", null: false
    t.string "dept_name", limit: 30, null: false
    t.string "dept_location", limit: 30, null: false
    t.index ["dept_id"], name: "dept_id", unique: true
  end

  create_table "employee", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "emp_id", null: false
    t.string "emp_name", limit: 50, null: false
    t.integer "dept_id", null: false
    t.integer "salary", null: false
    t.index ["emp_id"], name: "emp_id", unique: true
  end

  create_table "messages", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "id", null: false
    t.integer "sender_id", null: false
    t.string "text", limit: 30, default: "", null: false
    t.string "secret_key", limit: 30, default: "", null: false
    t.timestamp "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.timestamp "delivered_at", null: false
    t.timestamp "received_at", null: false
    t.integer "attachment_id"
    t.index ["id"], name: "id", unique: true
  end

  create_table "orders", primary_key: "orders_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "book_id", null: false
    t.integer "user_id", null: false
  end

  create_table "purchase", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "purchase_id", default: 0, null: false
    t.integer "book_id", null: false
    t.integer "user_id", null: false
    t.date "date", null: false
    t.text "content", null: false
  end

  create_table "rails_widgets", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "stock"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "review", primary_key: "review_id", id: :integer, default: 0, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "book_id", null: false
    t.integer "user_id", null: false
    t.date "date", null: false
    t.text "content", null: false
    t.index ["book_id", "user_id"], name: "book_id"
    t.index ["user_id"], name: "user_id"
  end

  create_table "submission", primary_key: "submission_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "book_id", null: false
    t.integer "user_id", null: false
    t.index ["book_id"], name: "book_id"
    t.index ["user_id"], name: "user_id"
  end

  create_table "unggah", primary_key: "no", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.text "title"
    t.string "author", limit: 100
    t.string "category", limit: 30
    t.text "description"
    t.text "file"
    t.date "upload_date"
    t.string "status", limit: 30
    t.string "user_id", limit: 20
  end

  create_table "user", primary_key: "user_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "username", null: false
    t.string "password", null: false
    t.string "role", null: false
    t.string "email"
    t.string "nama_lengkap"
    t.index ["username"], name: "username", unique: true
  end

  add_foreign_key "review", "book", primary_key: "book_id", name: "review_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "review", "user", primary_key: "user_id", name: "review_ibfk_2", on_update: :cascade, on_delete: :cascade
  add_foreign_key "submission", "book", primary_key: "book_id", name: "submission_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "submission", "user", primary_key: "user_id", name: "submission_ibfk_2", on_update: :cascade, on_delete: :cascade
end
