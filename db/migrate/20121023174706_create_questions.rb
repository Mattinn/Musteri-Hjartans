class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :question
      t.string :tag
      t.references :test_creator

      t.timestamps
    end
    add_index :questions, :test_creator_id
  end
end
