class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.integer :user_personal_test_session_id
      t.float :score
      t.text :message 

      t.timestamps
    end
    add_index :results, :user_personal_test_session_id
  end
end
