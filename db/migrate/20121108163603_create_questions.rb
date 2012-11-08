class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :question_text
      t.float :value
      t.integer :answer

      t.timestamps
    end
  end
end
