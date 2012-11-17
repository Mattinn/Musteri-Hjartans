class CreateUserPersonalTestSessions < ActiveRecord::Migration
  def change
    create_table :user_personal_test_sessions do |t|
      t.references :user
      t.references :personal_test
      t.references :question
      t.references :category
      t.references :treatment
      t.references :result

      t.timestamps
    end
    add_index :user_personal_test_sessions, :user_id
    add_index :user_personal_test_sessions, :personal_test_id
    add_index :user_personal_test_sessions, :question_id
    add_index :user_personal_test_sessions, :category_id
    add_index :user_personal_test_sessions, :treatment_id
    add_index :user_personal_test_sessions, :result_id
  end
end
