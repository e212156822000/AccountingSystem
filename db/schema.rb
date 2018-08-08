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

ActiveRecord::Schema.define(version: 20180806070433) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attachments", force: :cascade do |t|
    t.string "filename"
    t.string "content_type"
    t.binary "data"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string "name"
    t.string "job_title"
    t.string "username"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
  end

  create_table "purchase_requisitions", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "unit"
    t.float "unit_price"
    t.float "amount"
    t.float "total_price"
    t.string "purchase_requisition_files"
    t.date "payment_due_date"
    t.integer "process_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "remit_info_id"
    t.integer "recorder_id"
    t.integer "company_id"
    t.float "deposit_price"
    t.integer "payment_term"
    t.integer "payment_condition"
  end

  create_table "remit_infos", force: :cascade do |t|
    t.string "bank_name"
    t.string "bank_code"
    t.string "branch_bank_code"
    t.string "account_number"
    t.integer "payee_id"
    t.string "payee_type"
  end

  create_table "requisition_employees", force: :cascade do |t|
    t.integer "purchase_requisition_id"
    t.integer "employee_id"
    t.integer "employee_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
