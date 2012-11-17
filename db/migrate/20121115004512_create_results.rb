class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.float :score
      t.text :message
      t.references :user_personal_test_session

      t.timestamps
    end
    add_index :results, :user_personal_test_session_id
  end
end
