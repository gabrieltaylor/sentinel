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

ActiveRecord::Schema.define(version: 20150206214518) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "alerts", force: true do |t|
    t.string   "subject"
    t.text     "message"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "incident_id"
  end

  add_index "alerts", ["incident_id"], name: "index_alerts_on_incident_id", using: :btree

  create_table "coupons", force: true do |t|
    t.string   "code"
    t.string   "free_trial_length"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "delayed_jobs", force: true do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "incidents", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "acknowledged"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.boolean  "closed",       default: false
    t.integer  "account_id"
  end

  add_index "incidents", ["account_id"], name: "index_incidents_on_account_id", using: :btree

  create_table "notifications", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "alert_id"
    t.integer  "user_id"
  end

  add_index "notifications", ["alert_id"], name: "index_notifications_on_alert_id", using: :btree
  add_index "notifications", ["user_id"], name: "index_notifications_on_user_id", using: :btree

  create_table "plans", force: true do |t|
    t.string   "name"
    t.string   "stripe_id"
    t.float    "price"
    t.string   "interval"
    t.text     "features"
    t.boolean  "highlight"
    t.integer  "display_order"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "services", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.integer  "account_id"
  end

  add_index "services", ["account_id"], name: "index_services_on_account_id", using: :btree

  create_table "subscriptions", force: true do |t|
    t.string   "stripe_id"
    t.integer  "plan_id"
    t.string   "last_four"
    t.integer  "coupon_id"
    t.string   "card_type"
    t.float    "current_price"
    t.integer  "account_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "phone"
    t.string   "country_code"
    t.integer  "account_id"
  end

  add_index "users", ["account_id"], name: "index_users_on_account_id", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
