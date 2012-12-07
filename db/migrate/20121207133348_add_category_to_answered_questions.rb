class AddCategoryToAnsweredQuestions < ActiveRecord::Migration
  def change
    add_column :answered_questions, :q_category, :string
  end
end
