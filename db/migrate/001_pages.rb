class Pages < ActiveRecord::Migration
  def self.up
    create_table "questionnaires", :force => true do |t|
      t.column "title", :text
      t.column "is_open", :boolean
      t.column "custom_html", :string, :null => true, :default => ''
      t.column "custom_css", :string, :null => true, :default => ''
      t.column "allow_finish_later", :boolean, :default => true, :null => false
      t.column "allow_amend_response", :boolean, :default => true, :null => false
      t.column "rss_secret", :string
      t.column "welcome_text", :text
      t.column "created_at", :datetime
      t.column "updated_at", :datetime
      t.column "published_at", :timestamp
      t.column "advertise_login", :boolean, :default => true
      t.column "require_login", :boolean, :default => false
      t.column "publicly_visible", :boolean, :default => true
      t.column "allow_preview", :boolean, :default => false
      t.column "allow_delete_responses", :boolean, :default => false
    end
    add_index :questionnaires, :publicly_visible

    create_table "questions", :force => true do |t|
      t.column "type", :string, :limit => 100, :default => "", :null => false
      t.column "position", :integer, :default => 0, :null => false
      t.column "caption", :text, :null => false
      t.column "required", :boolean, :default => false, :null => false
      t.column "min", :integer, :default => 0, :null => false
      t.column "max", :integer, :default => 0, :null => false
      t.column "step", :integer, :default => 1, :null => false
      t.column "default_answer", :string
      t.column "page_id", :integer, :default => 0, :null => false
      t.column "layout", :string, :default => "left"
    end
    add_index :questions, :page_id
    add_index :questions, [:page_id, :type]

    create_table :pages, :force => true do |t|
      t.column :questionnaire_id, :integer, :default => 0, :null => false
      t.column :position, :integer
      t.column :title, :string
    end

    create_table :question_options, :force => true do |t|
      t.column "question_id", :integer, :default => 0, :null => false
      t.column "option", :text, :null => false
      t.column "position", :integer, :null => false
      t.column "output_value", :string
    end

    create_table "answers", :force => true do |t|
      t.column "response_id", :integer
      t.column "question_id", :integer, :default => 0, :null => false
      t.column "value", :text
      t.column "created_at", :datetime
      t.column "updated_at", :datetime
    end
    add_index :answers, :response_id
    add_index :answers, :question_id
    
    create_table "responses" do |t|
      t.column "questionnaire_id", :integer, :default => 0, :null => false
      t.column "saved_page", :integer
      t.column "submitted", :boolean, :default => false, :null => false
      t.column "person_id", :integer
      t.column "created_at", :datetime
      t.column "updated_at", :datetime
      t.column "submitted_at", :datetime
      t.column "notes", :text
    end
  end

  def self.down
    drop_table :pages
    remove_index :questions, :page_id
    remove_index :questions, [:page_id, :type]
    drop_table :questions
    drop_table :questionnaires
    drop_table :question_options
    remove_index :answers, :response_id
    remove_index :answers, :question_id
    drop_table :answers
    drop_table :responses
  end
end
