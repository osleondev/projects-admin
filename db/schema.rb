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

ActiveRecord::Schema[7.0].define(version: 2022_08_16_002443) do
  create_table "contacts", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.string "company"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payments", force: :cascade do |t|
    t.string "description"
    t.float "amount"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "service_id", null: false
    t.index ["service_id"], name: "index_payments_on_service_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.string "domain"
    t.string "category"
    t.date "start_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "contact_id", null: false
    t.index ["contact_id"], name: "index_projects_on_contact_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
    t.boolean "recurrent"
    t.float "price"
    t.date "start_date"
    t.date "due_date"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "project_id", null: false
    t.index ["project_id"], name: "index_services_on_project_id"
  end

  add_foreign_key "payments", "services"
  add_foreign_key "projects", "contacts"
  add_foreign_key "services", "projects"
end
