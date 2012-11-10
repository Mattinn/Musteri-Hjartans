class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :question_text
      t.float :value
      t.integer :answer
      t.belongs_to :personal_test

      t.timestamps
    end
    add_index :questions, :personal_test_id
  end
end
