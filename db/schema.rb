# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 3) do

  create_table "answers", :force => true do |t|
    t.integer  "response_id"
    t.integer  "question_id", :default => 0, :null => false
    t.text     "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "answers", ["question_id"], :name => "index_answers_on_question_id"
  add_index "answers", ["response_id"], :name => "index_answers_on_response_id"

  create_table "checkouts", :force => true do |t|
    t.integer "project_id"
    t.integer "user_id"
    t.string  "path"
  end

  create_table "pages", :force => true do |t|
    t.integer "questionnaire_id", :default => 0, :null => false
    t.integer "position"
    t.string  "title"
  end

  create_table "question_options", :force => true do |t|
    t.integer "question_id",  :default => 0, :null => false
    t.text    "option",                      :null => false
    t.integer "position",                    :null => false
    t.string  "output_value"
  end

  create_table "questionnaires", :force => true do |t|
    t.text     "title"
    t.boolean  "is_open"
    t.string   "custom_html",            :default => ""
    t.string   "custom_css",             :default => ""
    t.boolean  "allow_finish_later",     :default => true,  :null => false
    t.boolean  "allow_amend_response",   :default => true,  :null => false
    t.string   "rss_secret"
    t.text     "welcome_text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "published_at"
    t.boolean  "advertise_login",        :default => true
    t.boolean  "require_login",          :default => false
    t.boolean  "publicly_visible",       :default => true
    t.boolean  "allow_preview",          :default => false
    t.boolean  "allow_delete_responses", :default => false
  end

  add_index "questionnaires", ["publicly_visible"], :name => "index_questionnaires_on_publicly_visible"

  create_table "questions", :force => true do |t|
    t.string  "type",           :limit => 100, :default => "",     :null => false
    t.integer "position",                      :default => 0,      :null => false
    t.text    "caption",                                           :null => false
    t.boolean "required",                      :default => false,  :null => false
    t.integer "min",                           :default => 0,      :null => false
    t.integer "max",                           :default => 0,      :null => false
    t.integer "step",                          :default => 1,      :null => false
    t.string  "default_answer"
    t.integer "page_id",                       :default => 0,      :null => false
    t.string  "layout",                        :default => "left"
  end

  add_index "questions", ["page_id", "type"], :name => "index_questions_on_page_id_and_type"
  add_index "questions", ["page_id"], :name => "index_questions_on_page_id"

  create_table "responses", :force => true do |t|
    t.integer  "questionnaire_id", :default => 0,     :null => false
    t.integer  "saved_page"
    t.boolean  "submitted",        :default => false, :null => false
    t.integer  "person_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "submitted_at"
    t.text     "notes"
  end

  create_table "special_field_associations", :force => true do |t|
    t.integer "questionnaire_id"
    t.integer "question_id"
    t.string  "purpose"
  end

end
