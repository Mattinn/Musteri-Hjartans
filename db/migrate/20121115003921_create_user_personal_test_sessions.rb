class CreateUserPersonalTestSessions < ActiveRecord::Migration
  def change
    create_table :user_personal_test_sessions do |t|
      t.references :user_id
      t.references :personal_test_id
      t.references :question_id
      t.references :category_id
      t.references :treatment_id
      t.references :result_id

      t.timestamps
    end
    add_index :user_personal_test_sessions, :user_id_id
    add_index :user_personal_test_sessions, :personal_test_id_id
    add_index :user_personal_test_sessions, :question_id_id
    add_index :user_personal_test_sessions, :category_id_id
    add_index :user_personal_test_sessions, :treatment_id_id
    add_index :user_personal_test_sessions, :result_id_id
  end
end
