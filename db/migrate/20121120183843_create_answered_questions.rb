class CreateAnsweredQuestions < ActiveRecord::Migration
  def change
    create_table :answered_questions do |t|
      t.integer :user_personal_test_session_id
      t.integer :question_id
      t.integer :answer
      t.text :text_answer
      t.float :q_value
      t.string :q_text

      t.timestamps
    end
    add_index :answered_questions, :user_personal_test_session_id
    add_index :answered_questions, :question_id
  end
end
