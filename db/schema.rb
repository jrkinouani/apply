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

ActiveRecord::Schema[7.0].define(version: 2023_02_04_133005) do
  create_table "commune_streets", force: :cascade do |t|
    t.integer "commune_id", null: false
    t.integer "street_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commune_id"], name: "index_commune_streets_on_commune_id"
    t.index ["street_id"], name: "index_commune_streets_on_street_id"
  end

  create_table "communes", force: :cascade do |t|
    t.string "name"
    t.string "code_insee"
    t.integer "intercommunality_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["intercommunality_id"], name: "index_communes_on_intercommunality_id"
  end

  create_table "intercommunalities", force: :cascade do |t|
    t.string "name"
    t.string "siren"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "form"
  end

  create_table "streets", force: :cascade do |t|
    t.string "title"
    t.integer "from"
    t.integer "to"
    t.integer "commune_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commune_id"], name: "index_streets_on_commune_id"
  end

  add_foreign_key "commune_streets", "communes"
  add_foreign_key "commune_streets", "streets"
  add_foreign_key "communes", "intercommunalities"
  add_foreign_key "streets", "communes"
end
