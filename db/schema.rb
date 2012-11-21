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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121121221822) do


  create_table "abouts", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "answered_questions", :force => true do |t|
    t.integer  "user_personal_test_session_id"
    t.integer  "question_id"
    t.integer  "answer"
    t.text     "text_answer"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "answered_questions", ["question_id"], :name => "index_answered_questions_on_question_id"
  add_index "answered_questions", ["user_personal_test_session_id"], :name => "index_answered_questions_on_user_personal_test_session_id"

  create_table "books", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "category"
    t.integer  "isbn"
    t.string   "author"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "contacts", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "news", :force => true do |t|
    t.string   "title"
    t.string   "author"
    t.text     "body"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "personal_tests", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.float    "result"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "questions", :force => true do |t|
    t.string   "question_text"
    t.float    "value"
    t.integer  "answer"
    t.integer  "personal_test_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "questions", ["personal_test_id"], :name => "index_questions_on_personal_test_id"

  create_table "results", :force => true do |t|
    t.float    "score"
    t.text     "message"
    t.integer  "user_personal_test_session_id"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "results", ["user_personal_test_session_id"], :name => "index_results_on_user_personal_test_session_id"

  create_table "treatments", :force => true do |t|
    t.integer  "category_id"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "treatments", ["category_id"], :name => "index_treatments_on_category_id"

  create_table "treatments_users", :id => false, :force => true do |t|
    t.integer "treatment_id"
    t.integer "user_id"
  end

  create_table "user_personal_test_sessions", :force => true do |t|
    t.integer  "user_id"
    t.integer  "personal_test_id"
    t.integer  "category_id"
    t.integer  "treatment_id"
    t.integer  "result_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "user_personal_test_sessions", ["category_id"], :name => "index_user_personal_test_sessions_on_category_id"
  add_index "user_personal_test_sessions", ["personal_test_id"], :name => "index_user_personal_test_sessions_on_personal_test_id"
  add_index "user_personal_test_sessions", ["result_id"], :name => "index_user_personal_test_sessions_on_result_id"
  add_index "user_personal_test_sessions", ["treatment_id"], :name => "index_user_personal_test_sessions_on_treatment_id"
  add_index "user_personal_test_sessions", ["user_id"], :name => "index_user_personal_test_sessions_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "email",                  :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.string   "address"
    t.integer  "phone"
    t.integer  "postal"
    t.integer  "is_approved",            :default => 0
    t.integer  "is_admin",               :default => 0
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "webstores", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "phone"
    t.string   "address"
    t.string   "link"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end
